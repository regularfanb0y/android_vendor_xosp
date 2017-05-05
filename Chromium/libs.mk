#
# Copyright (C) 2017 The Xperia Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#
LOCAL_PATH := $(my-dir)

include $(CLEAR_VARS)

ifeq ($(TARGET_ARCH), x86)
  #Required libs 
  PRODUCT_COPY_FILES += \
      x86/libs/libchrome.so:system/app/Chromium/lib/x86/libchrome.so \
      x86/libs/libchromium_android_linker.so:system/app/Chromium/lib/x86/libchromium_android_linker.so
else 
  #Required libs
  PRODUCT_COPY_FILES += \
      arm/libs/libchrome.so:system/app/Chromium/lib/arm/libchrome.so \
      arm/libs/libchromium_android_linker.so:system/app/Chromium/lib/arm/libchromium_android_linker.so
endif
