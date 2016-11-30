function __print_additional_functions() {
cat <<EOF
Additional functions:
- cout:            Changes directory to out.
- mmp:             Builds all of the modules in the current directory and pushes them to the device.
- mmap:            Builds all of the modules in the current directory and its dependencies, then pushes the package to the device.
- mmmp:            Builds all of the modules in the supplied directories and pushes them to the device.
- mms:             Short circuit builder. Quickly re-build the kernel, rootfs, boot and system images
                   without deep dependencies. Requires the full build to have run before.
- mkap:            Builds the module(s) using mka and pushes them to the device.
- repodiff:        Diff 2 different branches or tags within the same repo
- repolastsync:    Prints date and time of last repo sync.
- reposync:        Parallel repo sync using ionice and SCHED_BATCH.
- installboot:     Installs a boot.img to the connected device.
- installrecovery: Installs a recovery.img to the connected device.
EOF
}

function brunch()
{
    breakfast $*
    if [ $? -eq 0 ]; then
        xospapps_essentials
        mka xosp
    else
        echo "No such item in brunch menu. Try 'breakfast'"
        return 1
    fi
    return $?
}

function breakfast()
{
    target=$1
    local variant=$2
    XOSP_DEVICES_ONLY="true"
    unset LUNCH_MENU_CHOICES
    add_lunch_combo full-eng
    for f in `/bin/ls vendor/xosp/vendorsetup.sh 2> /dev/null`
        do
            echo "including $f"
            . $f
        done
    unset f

    if [ $# -eq 0 ]; then
        # No arguments, so let's have the full menu
        lunch
    else
        echo "z$target" | grep -q "-"
        if [ $? -eq 0 ]; then
            # A buildtype was specified, assume a full device name
            lunch $target
        else
            # This is probably just the XOSP model name
            if [ -z "$variant" ]; then
                variant="userdebug"
            fi
            lunch xosp_$target-$variant
        fi
    fi
    return $?
}

alias bib=breakfast

function eat()
{
    if [ "$OUT" ] ; then
        MODVERSION=$(get_build_var XOSP_VERSION)
        ZIPFILE=$MODVERSION.zip
        ZIPPATH=$OUT/$ZIPFILE
        if [ ! -f $ZIPPATH ] ; then
            echo "Nothing to eat"
            return 1
        fi
        adb start-server # Prevent unexpected starting server message from adb get-state in the next line
        if [ $(adb get-state) != device -a $(adb shell test -e /sbin/recovery 2> /dev/null; echo $?) != 0 ] ; then
            echo "No device is online. Waiting for one..."
            echo "Please connect USB and/or enable USB debugging"
            until [ $(adb get-state) = device -o $(adb shell test -e /sbin/recovery 2> /dev/null; echo $?) = 0 ];do
                sleep 1
            done
            echo "Device Found.."
        fi
    if (adb shell getprop ro.xosp.device | grep -q "$XOSP_BUILD");
    then
        # if adbd isn't root we can't write to /cache/recovery/
        adb root
        sleep 1
        adb wait-for-device
        cat << EOF > /tmp/command
--sideload_auto_reboot
EOF
        if adb push /tmp/command /cache/recovery/ ; then
            echo "Rebooting into recovery for sideload installation"
            adb reboot recovery
            adb wait-for-sideload
            adb sideload $ZIPPATH
        fi
        rm /tmp/command
    else
        echo "Nothing to eat"
        return 1
    fi
    return $?
    else
        echo "The connected device does not appear to be $XOSP_BUILD, run away!"
    fi
}

function omnom()
{
    brunch $*
    eat
}

function cout()
{
    if [  "$OUT" ]; then
        cd $OUT
    else
        echo "Couldn't locate out directory.  Try setting OUT."
    fi
}

function dddclient()
{
   local OUT_ROOT=$(get_abs_build_var PRODUCT_OUT)
   local OUT_SYMBOLS=$(get_abs_build_var TARGET_OUT_UNSTRIPPED)
   local OUT_SO_SYMBOLS=$(get_abs_build_var TARGET_OUT_SHARED_LIBRARIES_UNSTRIPPED)
   local OUT_VENDOR_SO_SYMBOLS=$(get_abs_build_var TARGET_OUT_VENDOR_SHARED_LIBRARIES_UNSTRIPPED)
   local OUT_EXE_SYMBOLS=$(get_symbols_directory)
   local PREBUILTS=$(get_abs_build_var ANDROID_PREBUILTS)
   local ARCH=$(get_build_var TARGET_ARCH)
   local GDB
   case "$ARCH" in
       arm) GDB=arm-linux-androideabi-gdb;;
       arm64) GDB=arm-linux-androideabi-gdb; GDB64=aarch64-linux-android-gdb;;
       mips|mips64) GDB=mips64el-linux-android-gdb;;
       x86) GDB=x86_64-linux-android-gdb;;
       x86_64) GDB=x86_64-linux-android-gdb;;
       *) echo "Unknown arch $ARCH"; return 1;;
   esac

   if [ "$OUT_ROOT" -a "$PREBUILTS" ]; then
       local EXE="$1"
       if [ "$EXE" ] ; then
           EXE=$1
           if [[ $EXE =~ ^[^/].* ]] ; then
               EXE="system/bin/"$EXE
           fi
       else
           EXE="app_process"
       fi

       local PORT="$2"
       if [ "$PORT" ] ; then
           PORT=$2
       else
           PORT=":5039"
       fi

       local PID="$3"
       if [ "$PID" ] ; then
           if [[ ! "$PID" =~ ^[0-9]+$ ]] ; then
               PID=`pid $3`
               if [[ ! "$PID" =~ ^[0-9]+$ ]] ; then
                   # that likely didn't work because of returning multiple processes
                   # try again, filtering by root processes (don't contain colon)
                   PID=`adb shell ps | \grep $3 | \grep -v ":" | awk '{print $2}'`
                   if [[ ! "$PID" =~ ^[0-9]+$ ]]
                   then
                       echo "Couldn't resolve '$3' to single PID"
                       return 1
                   else
                       echo ""
                       echo "WARNING: multiple processes matching '$3' observed, using root process"
                       echo ""
                   fi
               fi
           fi
           adb forward "tcp$PORT" "tcp$PORT"
           local USE64BIT="$(is64bit $PID)"
           adb shell gdbserver$USE64BIT $PORT --attach $PID &
           sleep 2
       else
               echo ""
               echo "If you haven't done so already, do this first on the device:"
               echo "    gdbserver $PORT /system/bin/$EXE"
                   echo " or"
               echo "    gdbserver $PORT --attach <PID>"
               echo ""
       fi

       OUT_SO_SYMBOLS=$OUT_SO_SYMBOLS$USE64BIT
       OUT_VENDOR_SO_SYMBOLS=$OUT_VENDOR_SO_SYMBOLS$USE64BIT

       echo >|"$OUT_ROOT/gdbclient.cmds" "set solib-absolute-prefix $OUT_SYMBOLS"
       echo >>"$OUT_ROOT/gdbclient.cmds" "set solib-search-path $OUT_SO_SYMBOLS:$OUT_SO_SYMBOLS/hw:$OUT_SO_SYMBOLS/ssl/engines:$OUT_SO_SYMBOLS/drm:$OUT_SO_SYMBOLS/egl:$OUT_SO_SYMBOLS/soundfx:$OUT_VENDOR_SO_SYMBOLS:$OUT_VENDOR_SO_SYMBOLS/hw:$OUT_VENDOR_SO_SYMBOLS/egl"
       echo >>"$OUT_ROOT/gdbclient.cmds" "source $ANDROID_BUILD_TOP/development/scripts/gdb/dalvik.gdb"
       echo >>"$OUT_ROOT/gdbclient.cmds" "target remote $PORT"
       # Enable special debugging for ART processes.
       if [[ $EXE =~ (^|/)(app_process|dalvikvm)(|32|64)$ ]]; then
          echo >> "$OUT_ROOT/gdbclient.cmds" "art-on"
       fi
       echo >>"$OUT_ROOT/gdbclient.cmds" ""

       local WHICH_GDB=
       # 64-bit exe found
       if [ "$USE64BIT" != "" ] ; then
           WHICH_GDB=$ANDROID_TOOLCHAIN/$GDB64
       # 32-bit exe / 32-bit platform
       elif [ "$(get_build_var TARGET_2ND_ARCH)" = "" ]; then
           WHICH_GDB=$ANDROID_TOOLCHAIN/$GDB
       # 32-bit exe / 64-bit platform
       else
           WHICH_GDB=$ANDROID_TOOLCHAIN_2ND_ARCH/$GDB
       fi

       ddd --debugger $WHICH_GDB -x "$OUT_ROOT/gdbclient.cmds" "$OUT_EXE_SYMBOLS/$EXE"
  else
       echo "Unable to determine build system output dir."
   fi
}

function xospapps_essentials(){

    #First we should check for the connection
    wget -q --tries=10 --timeout=20 --spider http://xosp.org
    mkdir -p temp_essentials_xosp_apps
    cd temp_essentials_xosp_apps
    mkdir -p essentials
    if [[ $? -eq 0 ]]; then
        echo -e "Environment connected to internet!"
        echo -e "Downloading the essentials XOSPApps for the compilation..."
        sleep 3
        
        echo -e "Downloading Xperia Home..."
        if wget http://essentials.xospapps.xosp.org/essentials/Home/Home.apk; then
            mkdir -p essentials/Home
            mv Home.apk essentials/Home
            sleep 2
        else
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading SemcClock..."
        if wget http://essentials.xospapps.xosp.org/essentials/SemcClock/SemcClock.apk; then
            mkdir -p essentials/SemcClock
            mv SemcClock.apk essentials/SemcClock
            sleep 2
        else 
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading SemcEmail..."
        if wget http://essentials.xospapps.xosp.org/essentials/SemcEmail/SemcEmail.apk; then
            mkdir -p essentials/SemcEmail
            mv SemcEmail.apk essentials/SemcEmail
            sleep 2
        else
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading textinput-tng..."
        if wget http://essentials.xospapps.xosp.org/essentials/textinput-tng/textinput-tng.apk; then
            mkdir -p essentials/textinput-tng
            mv textinput-tng.apk essentials/textinput-tng
            sleep 2
            if wget http://essentials.xospapps.xosp.org/essentials/textinput-tng/lib/arm/libswiftkeysdk-java.so; then
                mkdir -p essentials/textinput-tng/lib
                mkdir -p essentials/textinput-tng/lib/arm
                mv libswiftkeysdk-java.so essentials/textinput-tng/lib/arm
                sleep 2
            else
                echo -e "Couldn't download, please check your connection!"
                exit 0
            fi
        else
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading textinput-tng for arm64 devices..."
        if wget http://essentials.xospapps.xosp.org/arm64/textinput-tng/textinput-tng.apk; then
            mkdir -p arm64
            mkdir -p arm64/textinput-tng
            mv textinput-tng.apk arm64/textinput-tng
            sleep 2
            if wget http://essentials.xospapps.xosp.org/arm64/textinput-tng/lib/arm/libswiftkeysdk-java.so; then
                mkdir -p arm64/textinput-tng/lib
                mkdir -p arm64/textinput-tng/lib/arm
                mv libswiftkeysdk-java.so arm64/textinput-tng/lib/arm
                sleep 2
            else
                echo -e "Couldn't download, please check your connection!"
                exit 0
            fi
        else
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading Xperia Services..."
        if wget http://essentials.xospapps.xosp.org/essentials/XperiaServices/XperiaServices.apk; then
            mkdir -p essentials/XperiaServices
            mv XperiaServices.apk essentials/XperiaServices
            sleep 2
        else 
            echo -e "Couldn't download, please check your connection!"
            exit 0
        fi
        echo -e "Downloading Sony BatteryAdviser..."
        if wget http://essentials.xospapps.xosp.org/essentials/BatteryAdviser/BatteryAdviser.apk; then
            mkdir -p essentials/BatteryAdviser
            mv BatteryAdviser.apk essentials/BatteryAdviser
            sleep 2
            if wget http://essentials.xospapps.xosp.org/essentials/BatteryAdviser/lib/arm/libpbp.so; then
                mkdir -p essentials/BatteryAdviser/lib
                mkdir -p essentials/BatteryAdviser/lib/arm
                mv libpbp.so essentials/BatteryAdviser/lib/arm
                sleep 2
            else
                echo -e "Couldn't download, please check your connection!"
                exit 0
            fi
            cd ..
        else
            echo -e "Couldn't download, please check your connection!"
            exit 0
    else
        echo -e "In order to continue with the compilation please connect to a reliable connection"
        rm -rf temp_essentials_xosp_apps
        exit 0
    fi
}


function installboot()
{
    if [ ! -e "$OUT/recovery/root/etc/recovery.fstab" ];
    then
        echo "No recovery.fstab found. Build recovery first."
        return 1
    fi
    if [ ! -e "$OUT/boot.img" ];
    then
        echo "No boot.img found. Run make bootimage first."
        return 1
    fi
    PARTITION=`grep "^\/boot" $OUT/recovery/root/etc/recovery.fstab | awk {'print $3'}`
    if [ -z "$PARTITION" ];
    then
        # Try for RECOVERY_FSTAB_VERSION = 2
        PARTITION=`grep "[[:space:]]\/boot[[:space:]]" $OUT/recovery/root/etc/recovery.fstab | awk {'print $1'}`
        PARTITION_TYPE=`grep "[[:space:]]\/boot[[:space:]]" $OUT/recovery/root/etc/recovery.fstab | awk {'print $3'}`
        if [ -z "$PARTITION" ];
        then
            echo "Unable to determine boot partition."
            return 1
        fi
    fi
    adb start-server
    adb wait-for-online
    adb root
    sleep 1
    adb wait-for-online shell mount /system 2>&1 > /dev/null
    adb wait-for-online remount
    if (adb shell getprop ro.xosp.device | grep -q "$XOSP_BUILD");
    then
        adb push $OUT/boot.img /cache/
        for i in $OUT/system/lib/modules/*;
        do
            adb push $i /system/lib/modules/
        done
        adb shell dd if=/cache/boot.img of=$PARTITION
        adb shell chmod 644 /system/lib/modules/*
        echo "Installation complete."
    else
        echo "The connected device does not appear to be $XOSP_BUILD, run away!"
    fi
}

function installrecovery()
{
    if [ ! -e "$OUT/recovery/root/etc/recovery.fstab" ];
    then
        echo "No recovery.fstab found. Build recovery first."
        return 1
    fi
    if [ ! -e "$OUT/recovery.img" ];
    then
        echo "No recovery.img found. Run make recoveryimage first."
        return 1
    fi
    PARTITION=`grep "^\/recovery" $OUT/recovery/root/etc/recovery.fstab | awk {'print $3'}`
    if [ -z "$PARTITION" ];
    then
        # Try for RECOVERY_FSTAB_VERSION = 2
        PARTITION=`grep "[[:space:]]\/recovery[[:space:]]" $OUT/recovery/root/etc/recovery.fstab | awk {'print $1'}`
        PARTITION_TYPE=`grep "[[:space:]]\/recovery[[:space:]]" $OUT/recovery/root/etc/recovery.fstab | awk {'print $3'}`
        if [ -z "$PARTITION" ];
        then
            echo "Unable to determine recovery partition."
            return 1
        fi
    fi
    adb start-server
    adb wait-for-online
    adb root
    sleep 1
    adb wait-for-online shell mount /system 2>&1 >> /dev/null
    adb wait-for-online remount
    if (adb shell getprop ro.xosp.device | grep -q "$XOSP_BUILD");
    then
        adb push $OUT/recovery.img /cache/
        adb shell dd if=/cache/recovery.img of=$PARTITION
        echo "Installation complete."
    else
        echo "The connected device does not appear to be $XOSP_BUILD, run away!"
    fi
}

function mms() {
    local T=$(gettop)
    if [ -z "$T" ]
    then
        echo "Couldn't locate the top of the tree.  Try setting TOP."
        return 1
    fi

    case `uname -s` in
        Darwin)
            local NUM_CPUS=$(sysctl hw.ncpu|cut -d" " -f2)
            ONE_SHOT_MAKEFILE="__none__" \
                make -C $T -j $NUM_CPUS "$@"
            ;;
        *)
            local NUM_CPUS=$(cat /proc/cpuinfo | grep "^processor" | wc -l)
            ONE_SHOT_MAKEFILE="__none__" \
                mk_timer schedtool -B -n 1 -e ionice -n 1 \
                make -C $T -j $NUM_CPUS "$@"
            ;;
    esac
}

function repolastsync() {
    RLSPATH="$ANDROID_BUILD_TOP/.repo/.repo_fetchtimes.json"
    RLSLOCAL=$(date -d "$(stat -c %z $RLSPATH)" +"%e %b %Y, %T %Z")
    RLSUTC=$(date -d "$(stat -c %z $RLSPATH)" -u +"%e %b %Y, %T %Z")
    echo "Last repo sync: $RLSLOCAL / $RLSUTC"
}

function reposync() {
    case `uname -s` in
        Darwin)
            repo sync -j 4 "$@"
            ;;
        *)
            schedtool -B -n 1 -e ionice -n 1 `which repo` sync -j 4 "$@"
            ;;
    esac
}

function repodiff() {
    if [ -z "$*" ]; then
        echo "Usage: repodiff <ref-from> [[ref-to] [--numstat]]"
        return
    fi
    diffopts=$* repo forall -c \
      'echo "$REPO_PATH ($REPO_REMOTE)"; git diff ${diffopts} 2>/dev/null ;'
}

# Return success if adb is up and not in recovery
function _adb_connected {
    {
        if [[ "$(adb get-state)" == device &&
              "$(adb shell test -e /sbin/recovery; echo $?)" != 0 ]]
        then
            return 0
        fi
    } 2>/dev/null

    return 1
};

alias mmp='dopush mm'
alias mmmp='dopush mmm'
alias mmap='dopush mma'

function fixup_common_out_dir() {
    common_out_dir=$(get_build_var OUT_DIR)/target/common
    target_device=$(get_build_var TARGET_DEVICE)
    if [ ! -z $CM_FIXUP_COMMON_OUT ]; then
        if [ -d ${common_out_dir} ] && [ ! -L ${common_out_dir} ]; then
            mv ${common_out_dir} ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        else
            [ -L ${common_out_dir} ] && rm ${common_out_dir}
            mkdir -p ${common_out_dir}-${target_device}
            ln -s ${common_out_dir}-${target_device} ${common_out_dir}
        fi
    else
        [ -L ${common_out_dir} ] && rm ${common_out_dir}
        mkdir -p ${common_out_dir}
    fi
}