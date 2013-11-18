#
# Copyright (C) 2011 The Android Open-Source Project
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

$(call inherit-product, device/lge/m3s/device.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

PRODUCT_NAME			    := cm_m3s
PRODUCT_DEVICE			    := m3s
PRODUCT_BRAND			    := lge
PRODUCT_RELEASE_NAME		    := LG Optimus Elite

# Sprint
M3S_LS696 := false

ifeq ($(M3S_LS696),true)

ROMID=LS696

DEVICE_PACKAGE_OVERLAYS += device/lge/m3s/LS696/overlay

PRODUCT_MODEL			    := LG-LS696

-include vendor/cyanogen/products/common_versions.mk

TARGET_OTA_ASSERT_DEVICE	    := m3s_sprint_us,m3s,LS696

PRODUCT_BUILD_PROP_OVERRIDES +=	\
	TARGET_PRODUCT=m3s_sprint_us \
	PRODUCT_DEVICE=m3s \
	PRODUCT_NAME=m3s_sprint_us \
	TARGET_BOOTLOADER_BOARD_NAME=lge_m3s \
	PRODUCT_MANUFACTURER=LGE \
	PRODUCT_DEFAULT_LANGUAGE=en \
	PRODUCT_DEFAULT_REGION=US 

PRODUCT_PROPERTY_OVERRIDES += \
ro.cdma.home.operator.alpha=Sprint \
ro.cdma.home.operator.numeric=310120 \
ro.com.google.clientidbase=android-lge \
ro.com.google.clientidbase.yt=android-sprint-us \
ro.com.google.clientidbase.am=android-sprint-us \
ro.com.google.clientidbase.gmm=android-lge \
ro.com.google.clientidbase.ms=android-sprint-us

else

ROMID=VM696

DEVICE_PACKAGE_OVERLAYS += device/lge/m3s/overlay

PRODUCT_MODEL			    := LG-VM696

-include vendor/cyanogen/products/common_versions.mk

TARGET_OTA_ASSERT_DEVICE	    := m3s_virgin_us,m3s,VM696

PRODUCT_BUILD_PROP_OVERRIDES+= \
	TARGET_PRODUCT=m3s_virgin_us \
	PRODUCT_DEVICE=m3s \
	PRODUCT_NAME=m3s_virgin_us \
	TARGET_BOOTLOADER_BOARD_NAME=lge_m3s \
	PRODUCT_MANUFACTURER=LGE \
	PRODUCT_DEFAULT_LANGUAGE=en \
	PRODUCT_DEFAULT_REGION=US \

PRODUCT_PROPERTY_OVERRIDES += \
ro.cdma.home.operator.alpha=Virgin_Mobile \
ro.cdma.home.operator.subscriber=31000 \
ro.cdma.home.operator.numeric=311490 \
gsm.sim.operator.alpha=Virgin_Mobile \
gsm.sim.operator.numeric=311490 \
gsm.sim.operator.iso-country=us \
gsm.operator.alpha=Virgin_Mobile \
gsm.operator.numeric=311490 \
gsm.operator.iso-country=us \
ro.com.google.clientidbase=android-lge \
ro.com.google.clientidbase.yt=android-virgin-us \
ro.com.google.clientidbase.am=android-virgin-us \
ro.com.google.clientidbase.gmm=android-lge \
ro.com.google.clientidbase.ms=android-virgin-us

endif
