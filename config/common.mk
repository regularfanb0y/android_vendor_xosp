PRODUCT_BRAND ?= XOSP


PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.com.android.dataroaming=false

PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

# Default notification/alarm sounds
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=xperia.ogg \
    ro.config.notification_sound=Tejat.ogg \
    ro.config.alarm_alert=xperia.ogg

ifneq ($(TARGET_BUILD_VARIANT),user)
# Thank you, please drive thru!
PRODUCT_PROPERTY_OVERRIDES += persist.sys.dun.override=0
endif

ifneq ($(TARGET_BUILD_VARIANT),eng)
# Enable ADB authentication
PRODUCT_DEFAULT_PROPERTY_OVERRIDES += ro.adb.secure=1
endif

#Chromium libs
ifeq ($(USE_CHROMIUM), true)
  ifeq ($(CHROMIUM_X86), true)
    PRODUCT_COPY_FILES += \
        vendor/xosp/Chromium/x86/libs/libchrome.so:system/app/Chromium/lib/x86/libchrome.so \
        vendor/xosp/Chromium/x86/libs/libchromium_android_linker.so:system/app/Chromium/lib/x86/libchromium_android_linker.so
  else
    PRODUCT_COPY_FILES += \
        vendor/xosp/Chromium/arm/libs/libchrome.so:system/app/Chromium/lib/arm/libchrome.so \
        vendor/xosp/Chromium/arm/libs/libchromium_android_linker.so:system/app/Chromium/lib/arm/libchromium_android_linker.so
  endif
  PRODUCT_PACKAGES += \
      Chromium
endif
    
# Backup Tool
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/xosp/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/xosp/prebuilt/common/bin/50-xosp.sh:system/addon.d/50-xosp.sh \
    vendor/xosp/prebuilt/common/bin/blacklist:system/addon.d/blacklist

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/xosp/config/permissions/backup.xml:system/etc/sysconfig/backup.xml

# init.d support
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/etc/init.d/00banner:system/etc/init.d/00banner \
    vendor/xosp/prebuilt/common/bin/sysinit:system/bin/sysinit

ifneq ($(TARGET_BUILD_VARIANT),user)
# userinit support
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/etc/init.d/90userinit:system/etc/init.d/90userinit
endif

# Specific init file based on CM one
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/etc/init.local.rc:root/init.xosp.rc

# Copy over added mimetype supported in libcore.net.MimeUtils
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/lib/content-types.properties:system/lib/content-types.properties

# Enable SIP+VoIP on all targets
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Enable wireless Xbox 360 controller support
PRODUCT_COPY_FILES += \
    frameworks/base/data/keyboards/Vendor_045e_Product_028e.kl:system/usr/keylayout/Vendor_045e_Product_0719.kl

# That's XOSP
PRODUCT_COPY_FILES += \
    vendor/xosp/config/permissions/com.xosp.android.xml:system/etc/permissions/com.xosp.android.xml

# Include XOSP audio files
include vendor/xosp/config/xosp_audio.mk


# Bootanimation
PRODUCT_PACKAGES += \
    bootanimation.zip

# SuperSU	
ifeq ($(ROOT_METHOD),supersu)
PRODUCT_COPY_FILES += \
   vendor/xosp/prebuilt/common/etc/UPDATE-SuperSU.zip:install/supersu/supersu.zip \
   vendor/xosp/prebuilt/common/etc/init.d/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon
WITH_SUPERSU := true
endif

# Magisk
ifeq ($(ROOT_METHOD),magisk)
PRODUCT_COPY_FILES += \
   vendor/xosp/prebuilt/common/etc/Magisk.zip:install/magisk/magisk.zip \
   vendor/xosp/prebuilt/common/priv-app/MagiskManager.apk:system/priv-app/MagiskManager/MagiskManager.apk
WITH_MAGISK := true
endif

# Required packages
PRODUCT_PACKAGES += \
    BluetoothExt \
    Development

# Optional packages
PRODUCT_PACKAGES += \
    libemoji \
    LiveWallpapersPicker \
    Terminal 

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni

# Custom packages
PRODUCT_PACKAGES += \
    LockClock \
    ExactCalculator \
    Screencast \
    Equalizer 

# Exchange support
PRODUCT_PACKAGES += \
    Exchange2

# Extra tools in XOSP
PRODUCT_PACKAGES += \
    libsepol \
    mke2fs \
    tune2fs \
    nano \
    htop \
    mkfs.ntfs \
    fsck.ntfs \
    mount.ntfs \
    gdbserver \
    micro_bench \
    oprofiled \
    sqlite3 \
    strace \
    pigz \
    7z \
    lib7z \
    bash \
    bzip2 \
    curl \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip

# ExFAT support
WITH_EXFAT ?= true
ifeq ($(WITH_EXFAT),true)
TARGET_USES_EXFAT := true
PRODUCT_PACKAGES += \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
endif

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Stagefright FFMPEG plugin
PRODUCT_PACKAGES += \
    libffmpeg_extractor \
    libffmpeg_omx \
    media_codecs_ffmpeg.xml

PRODUCT_PROPERTY_OVERRIDES += \
    media.sf.omx-plugin=libffmpeg_omx.so \
    media.sf.extractor-plugin=libffmpeg_extractor.so

# Storage manager
PRODUCT_PROPERTY_OVERRIDES += \
    ro.storage_manager.enabled=true

# Telephony
PRODUCT_PACKAGES += \
    telephony-ext

PRODUCT_BOOT_JARS += \
    telephony-ext

# These packages are excluded from user builds
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_PACKAGES += \
    procmem \
    procrank \
    su
endif

DEVICE_PACKAGE_OVERLAYS += vendor/xosp/overlay/common

#Don't even try to change this
XOSPAPPS_SIGNATURE := b93947e9018d72e42b0579d98683df8e

PRODUCT_PACKAGES += XCA

ifndef XOSP_BUILDTYPE
    ifdef RELEASE_TYPE
        # Starting with "XOSP_" is optional
        RELEASE_TYPE := $(shell echo $(RELEASE_TYPE) | sed -e 's|^XOSP_||g')
        XOSP_BUILDTYPE := $(RELEASE_TYPE)
    endif
endif

ifeq ($(XOSP_BUILDTYPE), OFFICIAL)
    XOSP_VERSION := XOSP-$(XOSP_BUILDTYPE)-$(shell date -u +%Y%m%d)-$(XOSP_BUILD)

else ifeq ($(XOSP_BUILDTYPE), EXPERIMENTAL) 	
    XOSP_VERSION := XOSP-$(XOSP_BUILDTYPE)-$(shell date -u +%Y%m%d)-$(XOSP_BUILD)

else ifeq ($(XOSP_BUILDTYPE), INTERNAL) 	
    XOSP_VERSION := XOSP-$(XOSP_BUILDTYPE)-$(shell date -u +%Y%m%d)-$(XOSP_BUILD)
    
else
    # If XOSP_BUILDTYPE is not defined, set to UNOFFICIAL
    XOSP_BUILDTYPE := UNOFFICIAL
    XOSP_VERSION := XOSP-$(XOSP_BUILDTYPE)-$(shell date -u +%Y%m%d)-$(XOSP_BUILD)
endif


PRODUCT_PROPERTY_OVERRIDES += \
  ro.xosp.releasetype=$(XOSP_BUILDTYPE) \
  ro.modversion=$(XOSP_VERSION) \
  ro.xosp.base.version=XOSP-N \
  ro.xospapps.signature=$(XOSPAPPS_SIGNATURE)

XOSP_DISPLAY_VERSION := $(XOSP_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
  ro.xosp.display.version=$(XOSP_DISPLAY_VERSION)

-include $(WORKSPACE)/build_env/image-auto-bits.mk
-include vendor/xosp/config/partner_gms.mk

$(call prepend-product-if-exists, vendor/extra/product.mk)
