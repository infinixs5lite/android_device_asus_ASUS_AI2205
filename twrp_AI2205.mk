#
# Copyright (C) 2024 The Android Open Source Project
# Copyright (C) 2024 SebaUbuntu's TWRP device tree generator
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Inherit some common TWRP stuff.
$(call inherit-product, vendor/twrp/config/common.mk)

# Inherit from ASUS_AI2205 device
$(call inherit-product, device/asus/AI2205/device.mk)

PRODUCT_DEVICE := AI2205
PRODUCT_NAME := twrp_AI2205
PRODUCT_BRAND := asus
PRODUCT_MODEL := ASUS_AI2205
PRODUCT_MANUFACTURER := asus

PRODUCT_GMS_CLIENTID_BASE := android-asus

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="WW_AI2205-user 13 TKQ1.220928.001 33.0820.0810.217-0 release-keys"

BUILD_FINGERPRINT := asus/WW_AI2205/ASUS_AI2205:13/TKQ1.220928.001/33.0820.0810.217-0:user/release-keys
