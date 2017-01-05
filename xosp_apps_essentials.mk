#Copy the essentials XOSPApps

ifeq ($(IS_ARM64), TRUE)

PRODUCT_COPY_FILES += \
	essentials_xosp_apps/arm64/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	essentials_xosp_apps/arm64/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so
else

PRODUCT_COPY_FILES += \
	essentials_xosp_apps/essentials/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	essentials_xosp_apps/essentials/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so
endif

PRODUCT_COPY_FILES += \
	essentials_xosp_apps/essentials/Home/Home.apk:system/app/Home/Home.apk \
	essentials_xosp_apps/essentials/SemcClock/SemcClock.apk:system/priv-app/SemcClock/SemcClock.apk \
	essentials_xosp_apps/essentials/XperiaServices/XperiaServices.apk:system/app/XperiaServices/XperiaServices.apk \
	essentials_xosp_apps/essentials/SemcEmail/SemcEmail.apk:system/priv-app/SemcEmail/SemcEmail.apk \
	essentials_xosp_apps/essentials/BatteryAdviser/BatteryAdviser.apk:system/app/BatteryAdviser/BatteryAdviser.apk \
	essentials_xosp_apps/essentials/BatteryAdviser/lib/arm/libpbp.so:system/app/BatteryAdviser/lib/arm/libpbp.so \
	essentials_xosp_apps/essentials/BatteryAdviser/lib/arm64/libpbp.so:system/app/BatteryAdviser/lib/arm64/libpbp.so


# Copy Pardana Files Components

# Permissions
PRODUCT_COPY_FILES += \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.google.protobuf-2.3.0.xml:system/etc/permissions/com.google.protobuf-2.3.0.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sony.device.xml:system/etc/permissions/com.sony.device.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.android.socialphonebook.xml:system/etc/permissions/com.sonyericsson.android.socialphonebook.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.appextensions.xml:system/etc/permissions/com.sonyericsson.appextensions.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.privateapis.xml:system/etc/permissions/com.sonyericsson.privateapis.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.system.xml:system/etc/permissions/com.sonyericsson.system.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.updatecenter.xml:system/etc/permissions/com.sonyericsson.updatecenter.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.uxpres.xml:system/etc/permissions/com.sonyericsson.uxpres.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.help.xml:system/etc/permissions/com.sonymobile.help.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.provider.tasks.xml:system/etc/permissions/com.sonymobile.provider.tasks.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.smime.xml:system/etc/permissions/com.sonymobile.smime.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/SemcGenericUxpRes.xml:system/etc/permissions/SemcGenericUxpRes.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.metadatacleanup.xml:system/etc/permissions/com.sonyericsson.metadatacleanup.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.album.xml:system/etc/permissions/com.sonymobile.album.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.home.resourceprovider.xml:system/etc/permissions/com.sonymobile.home.resourceprovider.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.media.dashboard.extension.xml:system/etc/permissions/com.sonymobile.media.dashboard.extension.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.mediacontent.xml:system/etc/permissions/com.sonymobile.mediacontent.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.musicslideshow.xml:system/etc/permissions/com.sonymobile.musicslideshow.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.photoeditor.xml:system/etc/permissions/com.sonymobile.photoeditor.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.podcast.xml:system/etc/permissions/com.sonymobile.podcast.xml \
	essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.provider.tasks.xml:system/etc/permissions/com.sonymobile.provider.tasks.xml
	
#Frameworks
PRODUCT_COPY_FILES += \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk:system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.google.protobuf-2.3.0.jar:system/framework/com.google.protobuf-2.3.0.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sony.device.jar:system/framework/com.sony.device.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.android.socialphonebook.dynamic.jar:system/framework/com.sonyericsson.android.socialphonebook.dynamic.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.appextensions.jar:system/framework/com.sonyericsson.appextensions.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.privateapis_impl.jar:system/framework/com.sonyericsson.privateapis.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.system.jar:system/framework/com.sonyericsson.system.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.updatecenter.jar:system/framework/com.sonyericsson.updatecenter.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.uxpres.jar:system/framework/com.sonyericsson.uxpres.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.help.jar:system/framework/com.sonymobile.help.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.provider.tasks.jar:system/framework/com.sonymobile.provider.tasks.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.smime.jar:system/framework/com.sonymobile.smime.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.metadatacleanup.jar:system/framework/com.sonyericsson.metadatacleanup.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.music.jar:system/framework/com.sonyericsson.music.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.uxp.jar:system/framework/com.sonyericsson.uxp.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.album.jar:system/framework/com.sonymobile.album.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.home.resourceprovider.jar:system/framework/com.sonymobile.home.resourceprovider.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.media.dashboard.extension.jar:system/framework/com.sonymobile.media.dashboard.extension.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.mediacontent.jar:system/framework/com.sonymobile.mediacontent.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.musicslideshow.jar:system/framework/com.sonymobile.musicslideshow.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.photoeditor.jar:system/framework/com.sonymobile.photoeditor.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.podcast.jar:system/framework/com.sonymobile.podcast.jar \
	essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.provider.tasks.jar:system/framework/com.sonymobile.provider.tasks.jar
	

#Lib Apps
PRODUCT_COPY_FILES += \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libdrmstream_depjb.so:system/priv-app/Album/lib/arm/libdrmstream_depjb.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libgifreader.so:system/priv-app/Album/lib/arm/libgifreader.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libimagecalc.so:system/priv-app/Album/lib/arm/libimagecalc.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libjpeguser.so:system/priv-app/Album/lib/arm/libjpeguser.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libmaketc.so:system/priv-app/Album/lib/arm/libmaketc.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libnativeio.so:system/priv-app/Album/lib/arm/libnativeio.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libsceniccore.so:system/priv-app/Album/lib/arm/libsceniccore.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libspf.so:system/priv-app/Album/lib/arm/libspf.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libSQHashGenerator.so:system/priv-app/Album/lib/arm/libSQHashGenerator.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libgifreader.so:system/priv-app/Album/lib/arm64/libgifreader.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libimagecalc.so:system/priv-app/Album/lib/arm64/libimagecalc.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libmaketc.so:system/priv-app/Album/lib/arm64/libmaketc.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libsceniccore.so:system/priv-app/Album/lib/arm64/libsceniccore.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libspf.so:system/priv-app/Album/lib/arm64/libspf.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libSQHashGenerator.so:system/priv-app/Album/lib/arm64/libSQHashGenerator.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgabi++_shared.so:system/priv-app/Music/lib/arm/libgabi++_shared.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnmc_decoder.1.1.8.so:system/priv-app/Music/lib/arm/libgnmc_decoder.1.1.8.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_dsp.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_dsp.3.09.0.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_java_marshal.1.1.8.so:system/priv-app/Music/lib/arm/libgnsdk_java_marshal.1.1.8.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_manager.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_manager.3.09.0.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_musicid.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_musicid.3.09.0.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_musicid_file.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_musicid_file.3.09.0.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_storage_sqlite.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_storage_sqlite.3.09.0.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/libjni_eglfence.so:system/priv-app/PhotoEditor/lib/arm/libjni_eglfence.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/libjni_filtershow_filters.so:system/priv-app/PhotoEditor/lib/arm/libjni_filtershow_filters.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/SomcPodcast/lib/arm/libjpeguser.so:system/priv-app/SomcPodcast/lib/arm/libjpeguser.so \
	essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/SomcPodcast/lib/arm/libnativeio.so:system/priv-app/SomcPodcast/lib/arm/libnativeio.so
