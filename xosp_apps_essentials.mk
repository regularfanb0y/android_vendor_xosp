#Copy the essentials XOSPApps

ifeq ($(IS_ARM64), TRUE)

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/arm64/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	temp_essentials_xosp_apps/arm64/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so
else

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/textinput-tng/textinput-tng.apk:system/priv-app/textinput-tng/textinput-tng.apk \
	temp_essentials_xosp_apps/essentials/textinput-tng/lib/arm/libswiftkeysdk-java.so:system/priv-app/textinput-tng/lib/arm/libswiftkeysdk-java.so \
	temp_essentials_xosp_apps/essentials/SemcEmail/SemcEmail.apk:system/priv-app/SemcEmail/SemcEmail.apk 
endif

PRODUCT_COPY_FILES += \
	temp_essentials_xosp_apps/essentials/Home/Home.apk:system/app/Home/Home.apk \
	temp_essentials_xosp_apps/essentials/SemcClock/SemcClock.apk:system/priv-app/SemcClock/SemcClock.apk \
	temp_essentials_xosp_apps/essentials/XperiaServices/XperiaServices.apk:system/app/XperiaServices/XperiaServices.apk
	
#After finishing copying the files delete them
$(call add-clean-step, rm -rf temp_essentials_xosp_apps)
