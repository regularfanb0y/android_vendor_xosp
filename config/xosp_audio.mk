#
# XOSP Audio Files
#

ALARM_PATH := vendor/xosp/prebuilt/common/media/audio/alarms
NOTIFICATION_PATH := vendor/xosp/prebuilt/common/media/audio/notifications
RINGTONE_PATH := vendor/xosp/prebuilt/common/media/audio/ringtones
UI_PATH := vendor/xosp/prebuilt/common/media/audio/ui

ALARM_PATH_SYSTEM := system/media/audio/alarms
NOTIFICATION_PATH_SYSTEM := system/media/audio/notifications
RINGTONE_PATH_SYSTEM := system/media/audio/ringtones
UI_PATH_SYSTEM := system/media/audio/ui


# Alarms
PRODUCT_COPY_FILES += \
	$(ALARM_PATH)/xperia.ogg:$(ALARM_PATH_SYSTEM)/xperia.ogg 
	
# Notifications
PRODUCT_COPY_FILES += \
	$(NOTIFICATION_PATH)/Tejat.ogg:$(NOTIFICATION_PATH_SYSTEM)/Tejat.ogg

# Ringtones
PRODUCT_COPY_FILES += \
	$(RINGTONE_PATH)/xperia.ogg:$(RINGTONE_PATH_SYSTEM)/xperia.ogg

#UI
PRODUCT_COPY_FILES += \
	$(UI_PATH)/BatteryCharged.3gp:$(UI_PATH_SYSTEM)/BatteryCharged.3gp \
	$(UI_PATH)/camera_click.ogg:$(UI_PATH_SYSTEM)/camera_click.ogg \
	$(UI_PATH)/camera_focus.ogg:$(UI_PATH_SYSTEM)/camera_focus.ogg \
	$(UI_PATH)/ChargerPluggedIn.ogg:$(UI_PATH_SYSTEM)/ChargerPluggedIn.ogg \
	$(UI_PATH)/Dock.ogg:$(UI_PATH_SYSTEM)/Dock.ogg \
	$(UI_PATH)/Effect_Tick.ogg:$(UI_PATH_SYSTEM)/Effect_Tick.ogg \
	$(UI_PATH)/KeypressDelete.ogg:$(UI_PATH_SYSTEM)/KeypressDelete.ogg \
	$(UI_PATH)/KeypressInvalid.ogg:$(UI_PATH_SYSTEM)/KeypressInvalid.ogg \
	$(UI_PATH)/KeypressReturn.ogg:$(UI_PATH_SYSTEM)/KeypressReturn.ogg \
	$(UI_PATH)/KeypressSpacebar.ogg:$(UI_PATH_SYSTEM)/KeypressSpacebar.ogg \
	$(UI_PATH)/KeypressStandard.ogg:$(UI_PATH_SYSTEM)/KeypressStandard.ogg \
	$(UI_PATH)/Lock.ogg:$(UI_PATH_SYSTEM)/Lock.ogg \
	$(UI_PATH)/LowBattery.ogg:$(UI_PATH_SYSTEM)/LowBattery.ogg \
	$(UI_PATH)/Trusted.ogg:$(UI_PATH_SYSTEM)/Trusted.ogg \
	$(UI_PATH)/Undock.ogg:$(UI_PATH_SYSTEM)/Undock.ogg \
	$(UI_PATH)/Unlock.ogg:$(UI_PATH_SYSTEM)/Unlock.ogg \
	$(UI_PATH)/VideoRecord.ogg:$(UI_PATH_SYSTEM)/VideoRecord.ogg 
	
