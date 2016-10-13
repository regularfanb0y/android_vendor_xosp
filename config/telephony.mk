# World APN list
PRODUCT_COPY_FILES += \
    vendor/xosp/prebuilt/common/etc/apns-conf.xml:system/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk \
    CellBroadcastReceiver

# Default ringtone
PRODUCT_PROPERTY_OVERRIDES += \
    ro.config.ringtone=xperia.ogg
