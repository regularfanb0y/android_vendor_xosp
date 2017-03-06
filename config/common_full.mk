# Inherit common XOSP stuff
$(call inherit-product, vendor/xosp/config/common.mk)

PRODUCT_SIZE := full

# Include XOSP audio files
include vendor/xosp/config/xosp_audio.mk

# Optional packages
PRODUCT_PACKAGES += \
    Screencast

# Extra tools
PRODUCT_PACKAGES += \
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
