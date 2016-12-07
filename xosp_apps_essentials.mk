#Copy the essentials XOSPApps

ifeq ($(IS_ARM64), TRUE)

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/arm64/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	temp_essentials_xosp_apps/arm64/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so
else

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	temp_essentials_xosp_apps/essentials/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so
endif

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/Home/Home.apk:system/app/Home/Home.apk \
	temp_essentials_xosp_apps/essentials/SemcClock/SemcClock.apk:system/priv-app/SemcClock/SemcClock.apk \
	temp_essentials_xosp_apps/essentials/XperiaServices/XperiaServices.apk:system/app/XperiaServices/XperiaServices.apk \
	temp_essentials_xosp_apps/essentials/SemcEmail/SemcEmail.apk:system/priv-app/SemcEmail/SemcEmail.apk


# Copy Pardana Files Components

# Permissions
PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.google.protobuf-2.3.0.xml:system/etc/permissions/com.google.protobuf-2.3.0.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sony.device.xml:system/etc/permissions/com.sony.device.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.android.socialphonebook.xml:system/etc/permissions/com.sonyericsson.android.socialphonebook.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.appextensions.xml:system/etc/permissions/com.sonyericsson.appextensions.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.privateapis.xml:system/etc/permissions/com.sonyericsson.privateapis.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.system.xml:system/etc/permissions/com.sonyericsson.system.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.updatecenter.xml:system/etc/permissions/com.sonyericsson.updatecenter.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.uxpres.xml:system/etc/permissions/com.sonyericsson.uxpres.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.help.xml:system/etc/permissions/com.sonymobile.help.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.provider.tasks.xml:system/etc/permissions/com.sonymobile.provider.tasks.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.smime.xml:system/etc/permissions/com.sonymobile.smime.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/SemcGenericUxpRes.xml:system/etc/permissions/SemcGenericUxpRes.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonyericsson.metadatacleanup.xml:system/etc/permissions/com.sonyericsson.metadatacleanup.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.album.xml:system/etc/permissions/com.sonymobile.album.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.home.resourceprovider.xml:system/etc/permissions/com.sonymobile.home.resourceprovider.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.media.dashboard.extension.xml:system/etc/permissions/com.sonymobile.media.dashboard.extension.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.mediacontent.xml:system/etc/permissions/com.sonymobile.mediacontent.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.musicslideshow.xml:system/etc/permissions/com.sonymobile.musicslideshow.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.photoanalyzer.xml:system/etc/permissions/com.sonymobile.photoanalyzer.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.photoeditor.xml:system/etc/permissions/com.sonymobile.photoeditor.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.podcast.xml:system/etc/permissions/com.sonymobile.podcast.xml \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/etc/permissions/com.sonymobile.provider.tasks.xml:system/etc/permissions/com.sonymobile.provider.tasks.xml
	
#Frameworks
PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk:system/framework/SemcGenericUxpRes/SemcGenericUxpRes.apk \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.google.protobuf-2.3.0.jar:system/framework/com.google.protobuf-2.3.0.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sony.device.jar:system/framework/com.sony.device.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.android.socialphonebook.dynamic.jar:system/framework/com.sonyericsson.android.socialphonebook.dynamic.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.appextensions.jar:system/framework/com.sonyericsson.appextensions.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.privateapis_impl.jar:system/framework/com.sonyericsson.privateapis.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.system.jar:system/framework/com.sonyericsson.system.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.updatecenter.jar:system/framework/com.sonyericsson.updatecenter.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.uxpres.jar:system/framework/com.sonyericsson.uxpres.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.help.jar:system/framework/com.sonymobile.help.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.provider.tasks.jar:system/framework/com.sonymobile.provider.tasks.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.smime.jar:system/framework/com.sonymobile.smime.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.metadatacleanup.jar:system/framework/com.sonyericsson.metadatacleanup.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.music.jar:system/framework/com.sonyericsson.music.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonyericsson.uxp.jar:system/framework/com.sonyericsson.uxp.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.album.jar:system/framework/com.sonymobile.album.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.home.resourceprovider.jar:system/framework/com.sonymobile.home.resourceprovider.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.media.dashboard.extension.jar:system/framework/com.sonymobile.media.dashboard.extension.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.mediacontent.jar:system/framework/com.sonymobile.mediacontent.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.musicslideshow.jar:system/framework/com.sonymobile.musicslideshow.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.photoanalyzer_impl.jar:system/framework/com.sonymobile.photoanalyzer_impl.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.photoanalyzer.jar:system/framework/com.sonymobile.photoanalyzer.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.photoeditor.jar:system/framework/com.sonymobile.photoeditor.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.podcast.jar:system/framework/com.sonymobile.podcast.jar \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/framework/com.sonymobile.provider.tasks.jar:system/framework/com.sonymobile.provider.tasks.jar
	

#Lib Apps
PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libdrmstream_depjb.so:system/priv-app/Album/lib/arm/libdrmstream_depjb.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libgifreader.so:system/priv-app/Album/lib/arm/libgifreader.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libimagecalc.so:system/priv-app/Album/lib/arm/libimagecalc.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libjpeguser.so:system/priv-app/Album/lib/arm/libjpeguser.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libmaketc.so:system/priv-app/Album/lib/arm/libmaketc.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libnativeio.so:system/priv-app/Album/lib/arm/libnativeio.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libsceniccore.so:system/priv-app/Album/lib/arm/libsceniccore.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libspf.so:system/priv-app/Album/lib/arm/libspf.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm/libSQHashGenerator.so:system/priv-app/Album/lib/arm/libSQHashGenerator.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libgifreader.so:system/priv-app/Album/lib/arm64/libgifreader.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libimagecalc.so:system/priv-app/Album/lib/arm64/libimagecalc.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libmaketc.so:system/priv-app/Album/lib/arm64/libmaketc.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libsceniccore.so:system/priv-app/Album/lib/arm64/libsceniccore.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libspf.so:system/priv-app/Album/lib/arm64/libspf.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Album/lib/arm64/libSQHashGenerator.so:system/priv-app/Album/lib/arm64/libSQHashGenerator.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgabi++_shared.so:system/priv-app/Music/lib/arm/libgabi++_shared.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnmc_decoder.1.1.8.so:system/priv-app/Music/lib/arm/libgnmc_decoder.1.1.8.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_dsp.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_dsp.3.09.0.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_java_marshal.1.1.8.so:system/priv-app/Music/lib/arm/libgnsdk_java_marshal.1.1.8.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_manager.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_manager.3.09.0.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_musicid.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_musicid.3.09.0.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_musicid_file.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_musicid_file.3.09.0.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/Music/lib/arm/libgnsdk_storage_sqlite.3.09.0.so:system/priv-app/Music/lib/arm/libgnsdk_storage_sqlite.3.09.0.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoAnalyzer/lib/arm/libPhotoAnalyzer.so:system/priv-app/PhotoAnalyzer/lib/arm/libPhotoAnalyzer.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoAnalyzer/lib/arm/libPhotoAnalyzerjni.so:system/priv-app/PhotoAnalyzer/lib/arm/libPhotoAnalyzerjni.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/libjni_eglfence.so:system/priv-app/PhotoEditor/lib/arm/libjni_eglfence.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/libjni_filtershow_filters.so:system/priv-app/PhotoEditor/lib/arm/libjni_filtershow_filters.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librs.convolve3x3.so:system/priv-app/PhotoEditor/lib/arm/librs.convolve3x3.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librs.grad.so:system/priv-app/PhotoEditor/lib/arm/librs.grad.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librs.grey.so:system/priv-app/PhotoEditor/lib/arm/librs.grey.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librs.saturation.so:system/priv-app/PhotoEditor/lib/arm/librs.saturation.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librs.vignette.so:system/priv-app/PhotoEditor/lib/arm/librs.vignette.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/librsjni.so:system/priv-app/PhotoEditor/lib/arm/librsjni.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/PhotoEditor/lib/arm/libRSSupport.so:system/priv-app/PhotoEditor/lib/arm/libRSSupport.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/SomcPodcast/lib/arm/libjpeguser.so:system/priv-app/SomcPodcast/lib/arm/libjpeguser.so \
	temp_essentials_xosp_apps/essentials/PardanaFiles/system/priv-app/SomcPodcast/lib/arm/libnativeio.so:system/priv-app/SomcPodcast/lib/arm/libnativeio.so
