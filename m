Return-Path: <platform-driver-x86+bounces-11773-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F96AA7D97
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 May 2025 02:02:02 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6EE834C3B2A
	for <lists+platform-driver-x86@lfdr.de>; Sat,  3 May 2025 00:02:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6C08118035;
	Sat,  3 May 2025 00:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jsGX9cK0"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24029849C;
	Sat,  3 May 2025 00:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746230512; cv=none; b=tHT0xC6EiiqhCuWou8JJx+NuwcCwR8XIN/8yFm8H95oHstxrrQouVVOj5LKo0rexQ5UauPE3cAkmRz+Ht9508LoabyjL58y9Sygc2z0m3EcHa7AA4/w0BzkNa7Rbt9Vc+Z1/NjmH3SDBbQ/6KF0nIhwcl6BsKre8C2uZTzx82Xk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746230512; c=relaxed/simple;
	bh=7iogHQ3Vgd+wXZixro+euh9BM9ACT2iwkcUBi7Q+Ipo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=J4TvimoIw7b+hLFhF/hQw6+n7Iw02qCVrl9daDdG/aSKgt9/6WSsMBm0gQP2gmZpFEtN9UcnEPWJuN06B1Y+/53anCRGecw2YFH2StTDpwOTO8LtXzjXy2gXtRj0uOnjxlURUrgJk44kMXC6qRTzD3cfNjonzu6vbo56+C7JOSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jsGX9cK0; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-736b0c68092so2485312b3a.0;
        Fri, 02 May 2025 17:01:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746230509; x=1746835309; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RH7eIC2jDHMEWYc5q8Muj9dL96CHQANXhQesnlvGhrw=;
        b=jsGX9cK0ivdPL5SZrdoe7do1UpNAQBn4yNDzaxVMkAFeWkfnv52J2Ruo56K5Pqo3Jo
         zcsItojFMwcBovvju43rTAJkGwcEyX/qU21VV1pYshBZHte1HeCnY3U1UDpLB6HIVe9J
         jtM17xFtkjpGegcp54ExFNG0iYxebDQDm2m4Mf6QgB54Lv9lineQVM6GT8yhGv6PItoJ
         SZsJSZ2PmqS5APtran2f1ULAESgYmDwJDIykEPNpDgSCaR81NcGx6sUh8rClXPwzn90K
         YY6cj8VtI/1jis/VkcfxJQ9/U2PoZNEov2A+4Fb8EVuEKS7OqG5XTxVGYvO8fpsDL8Vp
         rgsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746230509; x=1746835309;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RH7eIC2jDHMEWYc5q8Muj9dL96CHQANXhQesnlvGhrw=;
        b=mFMmb8scDUgOTI9a1gvO2NUu3FYMBmDuElzFxWPdMhChHqH995IaGOvs+HOAmWbiiI
         B0gup/SRUaCAiA2omN/OndbkOenIOXetHAl1E1PBS0cf/RZ1VzqtUkLJFlR4gTW1H8ay
         pBEXUxj4ZoxH5IfIvEHW1lnFHAqc7RmK2viUjfqsl6U3f04OJtb06ZT9LkfPAnNJNYJT
         nQzjqjc9oQkJIkXd1u6MD+YSwRSrtn1c0dqnjhnCmyL0tiUBfIyaHvXRLGf4Z10c36mn
         ZrLvzsHFaqIt8hYKWFVNC/SyEzdyagZ7SEzfuG8Nq4P62JhkH026XDYfXr1ZQMjrauwJ
         YQTw==
X-Forwarded-Encrypted: i=1; AJvYcCUKzBNqYH85fO9UwEBmJlUcwXMMtnjUv9cbO/1V8PU+w8lHkuJWr0CbEwa4Rtwwccf3V7Y0bKKTsls=@vger.kernel.org, AJvYcCVxQz3LJvL7iBRxcCWHhx0/nUYhY8KeDZoGKo72z6R+hu+/133814U9flyKQQII2C5zJy1MjTzNxo3w4Yhzr4ZpMV6UYg==@vger.kernel.org, AJvYcCXCdayA5MvbzUZrecaqarI/P0yysaVH/pqjifWEKRySZML288hVxt1hxaIiHbeD8gv75lP0iBwvkMr0bE1p@vger.kernel.org
X-Gm-Message-State: AOJu0YyImYOyVluSQG7REVoMS2atVWD/zA1pOV5o3bSd27hxRd5Hr1yN
	4TlJMLqqxsPwIslzpsumXzf2LNvcBc/xIIGlyNYDPZpvh2KFmunA
X-Gm-Gg: ASbGncuRZLYHUXvND3Q51OnCgtuQLXGa5N0txw2CqTBbhDx9Hyf659QUuYNMuI7HsFl
	gnbEz8UpAYM5vvBkHfzNgVPSyP+ak3vQJA/UktBeByfmW4Jtotfr4uPomtqZKcl0bqrerJ7VPaM
	8fuTEmsTebK76OwuZIuaiRHMNjm0dDtZRqFIjN934s3I4i74bLS6nqEIW03MvwhxA3Awkni7Nne
	qK7qJiviCqMOKg+k4KnfdZD8xoKov84IT+wIFvLDPP8rAXD7oqVDj/tatcJ8ZRRauNWABY2TsQO
	OPsPRmfw4UvmEDKRk0xRRHs4WCoEkzEpi9yjzKvGXmqRLnq8uxCY+A0O7tVLTiVjuc/pwKSWTAG
	Z+IECP6xWMUHOtjv/hJ6dWBE79DrUcWseHxmFx8U=
X-Google-Smtp-Source: AGHT+IH+eoLy8MDpNQbPpOUqZhWQc5HVZ/zBMRAKdmlZ1pgmSKQGUGkSnKFN0MQMcNzu7oSb92JA6Q==
X-Received: by 2002:a05:6a00:410e:b0:736:7270:4d18 with SMTP id d2e1a72fcca58-74058a568d4mr6162115b3a.14.1746230509185;
        Fri, 02 May 2025 17:01:49 -0700 (PDT)
Received: from localhost.localdomain (108-228-232-20.lightspeed.sndgca.sbcglobal.net. [108.228.232.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74058dbb0b5sm2206680b3a.41.2025.05.02.17.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 17:01:48 -0700 (PDT)
From: "Derek J. Clark" <derekjohn.clark@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Armin Wolf <W_Armin@gmx.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Mario Limonciello <superm1@kernel.org>,
	Luke Jones <luke@ljones.dev>,
	Xino Ni <nijs1@lenovo.com>,
	Zhixin Zhang <zhangzx36@lenovo.com>,
	Mia Shao <shaohz1@lenovo.com>,
	Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Pierre-Loup A . Griffais" <pgriffais@valvesoftware.com>,
	"Cody T . -H . Chiu" <codyit@gmail.com>,
	John Martens <johnfanv2@gmail.com>,
	"Derek J . Clark" <derekjohn.clark@gmail.com>,
	platform-driver-x86@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v7 1/6] platform/x86: Add lenovo-wmi-* driver Documentation
Date: Fri,  2 May 2025 17:01:37 -0700
Message-ID: <20250503000142.1190354-2-derekjohn.clark@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
References: <20250503000142.1190354-1-derekjohn.clark@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Adds documentation for new lenovo-wmi drivers.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
Signed-off-by: Derek J. Clark <derekjohn.clark@gmail.com>
--
v7: No change
v6:
 - Fix typos and requested rewordings from v5 review.
 - Rename lenovo-wmi-other-method.rst to lenovo-wmi-other.rst, fixes
   warining and aligns documentation with driver name.
v5:
 - Fix extra spaces in lenovo-wmi-gamezone.rst.
 - Fix monospace for GUID's.
v4:
 - Fixed MOF formatting issues.
 - Fixed spelling mistakes.
 - Updated description of balanced-performance profile for Gamezone.
 - Updated description of thermal mode event GUID for Gamezone.
v3:
- Split documentation into multiple files, one for each parent
  driver for the Gamezone and Other Mode WMI interfaces.
- Add MOF data for all parent and child interfaces.
- Remove lenovo-wmi-camera.c driver from v2 documentation.
v2:
- Update description of Custom Profile to include the need to manually
  set it.
- Remove all references to Legion hardware.
- Add section for lenovo-wmi-camera.c driver as it follows the same
  naming convention.
---
 .../wmi/devices/lenovo-wmi-gamezone.rst       | 203 ++++++++++++++++++
 .../wmi/devices/lenovo-wmi-other.rst          | 108 ++++++++++
 MAINTAINERS                                   |   7 +
 3 files changed, 318 insertions(+)
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-gamezone.rst
 create mode 100644 Documentation/wmi/devices/lenovo-wmi-other.rst

diff --git a/Documentation/wmi/devices/lenovo-wmi-gamezone.rst b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
new file mode 100644
index 000000000000..997263e51a7d
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi-gamezone.rst
@@ -0,0 +1,203 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+==========================================================
+Lenovo WMI Interface Gamezone Driver (lenovo-wmi-gamezone)
+==========================================================
+
+Introduction
+============
+The Lenovo WMI gamezone interface is broken up into multiple GUIDs,
+The primary "Gamezone" GUID provides advanced features such as fan
+profiles and overclocking. It is paired with multiple event GUIDs
+and data block GUIDs that provide context for the various methods.
+
+Gamezone Data
+-------------
+
+WMI GUID ``887B54E3-DDDC-4B2C-8B88-68A26A8835D0``
+
+The Gamezone Data WMI interface provides platform-profile and fan curve
+settings for devices that fall under the "Gaming Series" of Lenovo devices.
+It uses a notifier chain to inform other Lenovo WMI interface drivers of the
+current platform profile when it changes.
+
+The following platform profiles are supported:
+ - low-power
+ - balanced
+ - balanced-performance
+ - performance
+ - custom
+
+Balanced-Performance
+~~~~~~~~~~~~~~~~~~~~
+Some newer Lenovo "Gaming Series" laptops have an "Extreme Mode" profile
+enabled in their BIOS. For these devices, the performance platform profile
+corresponds to the BIOS Extreme Mode, while the balanced-performance
+platform profile corresponds to the BIOS Performance mode. For legacy
+devices, the performance platform profile will correspond with the BIOS
+Performance mode.
+
+For some newer devices the "Extreme Mode" profile is incomplete in the BIOS
+and setting it will cause undefined behavior. A BIOS bug quirk table is
+provided to ensure these devices cannot set "Extreme Mode" from the driver.
+
+Custom Profile
+~~~~~~~~~~~~~~
+The custom profile represents a hardware mode on Lenovo devices that enables
+user modifications to Package Power Tracking (PPT) and fan curve settings.
+When an attribute exposed by the Other Mode WMI interface is to be modified,
+the Gamezone driver must first be switched to the "custom" profile manually,
+or the setting will have no effect. If another profile is set from the list
+of supported profiles, the BIOS will override any user PPT settings when
+switching to that profile.
+
+Gamezone Thermal Mode Event
+---------------------------
+
+WMI GUID ``D320289E-8FEA-41E0-86F9-911D83151B5F``
+
+The Gamezone Thermal Mode Event interface notifies the system when the platform
+profile has changed, either through the hardware event (Fn+Q for laptops or
+Legion + Y for Go Series), or through the Gamezone WMI interface. This event is
+implemented in the Lenovo WMI Events driver (lenovo-wmi-events).
+
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_GAMEZONE_DATA class"), guid("{887B54E3-DDDC-4B2C-8B88-68A26A8835D0}")]
+  class LENOVO_GAMEZONE_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(4), Implemented, Description("Is SupportGpu OverClock")] void IsSupportGpuOC([out, Description("Is SupportGpu OverClock")] uint32 Data);
+    [WmiMethodId(11), Implemented, Description("Get AslCode Version")] void GetVersion ([out, Description("AslCode version")] UINT32 Data);
+    [WmiMethodId(12), Implemented, Description("Fan cooling capability")] void IsSupportFanCooling([out, Description("Fan cooling capability")] UINT32 Data);
+    [WmiMethodId(13), Implemented, Description("Set Fan cooling on/off")] void SetFanCooling ([in, Description("Set Fan cooling on/off")] UINT32 Data);
+    [WmiMethodId(14), Implemented, Description("cpu oc capability")] void IsSupportCpuOC ([out, Description("cpu oc capability")] UINT32 Data);
+    [WmiMethodId(15), Implemented, Description("bios has overclock capability")] void IsBIOSSupportOC ([out, Description("bios has overclock capability")] UINT32 Data);
+    [WmiMethodId(16), Implemented, Description("enable or disable overclock in bios")] void SetBIOSOC ([in, Description("enable or disable overclock in bios")] UINT32 Data);
+    [WmiMethodId(18), Implemented, Description("Get CPU temperature")] void GetCPUTemp ([out, Description("Get CPU temperature")] UINT32 Data);
+    [WmiMethodId(19), Implemented, Description("Get GPU temperature")] void GetGPUTemp ([out, Description("Get GPU temperature")] UINT32 Data);
+    [WmiMethodId(20), Implemented, Description("Get Fan cooling on/off status")] void GetFanCoolingStatus ([out, Description("Get Fan cooling on/off status")] UINT32 Data);
+    [WmiMethodId(21), Implemented, Description("EC support disable windows key capability")] void IsSupportDisableWinKey ([out, Description("EC support disable windows key capability")] UINT32 Data);
+    [WmiMethodId(22), Implemented, Description("Set windows key disable/enable")] void SetWinKeyStatus ([in, Description("Set windows key disable/enable")] UINT32 Data);
+    [WmiMethodId(23), Implemented, Description("Get windows key disable/enable status")] void GetWinKeyStatus ([out, Description("Get windows key disable/enable status")] UINT32 Data);
+    [WmiMethodId(24), Implemented, Description("EC support disable touchpad capability")] void IsSupportDisableTP ([out, Description("EC support disable touchpad capability")] UINT32 Data);
+    [WmiMethodId(25), Implemented, Description("Set touchpad disable/enable")] void SetTPStatus ([in, Description("Set touchpad disable/enable")] UINT32 Data);
+    [WmiMethodId(26), Implemented, Description("Get touchpad disable/enable status")] void GetTPStatus ([out, Description("Get touchpad disable/enable status")] UINT32 Data);
+    [WmiMethodId(30), Implemented, Description("Get Keyboard feature list")] void GetKeyboardfeaturelist ([out, Description("Get Keyboard feature list")] UINT32 Data);
+    [WmiMethodId(31), Implemented, Description("Get Memory OC Information")] void GetMemoryOCInfo ([out, Description("Get Memory OC Information")] UINT32 Data);
+    [WmiMethodId(32), Implemented, Description("Water Cooling feature capability")] void IsSupportWaterCooling ([out, Description("Water Cooling feature capability")] UINT32 Data);
+    [WmiMethodId(33), Implemented, Description("Set Water Cooling status")] void SetWaterCoolingStatus ([in, Description("Set Water Cooling status")] UINT32 Data);
+    [WmiMethodId(34), Implemented, Description("Get Water Cooling status")] void GetWaterCoolingStatus ([out, Description("Get Water Cooling status")] UINT32 Data);
+    [WmiMethodId(35), Implemented, Description("Lighting feature capability")] void IsSupportLightingFeature ([out, Description("Lighting feature capability")] UINT32 Data);
+    [WmiMethodId(36), Implemented, Description("Set keyboard light off or on to max")] void SetKeyboardLight ([in, Description("keyboard light off or on switch")] UINT32 Data);
+    [WmiMethodId(37), Implemented, Description("Get keyboard light on/off status")] void GetKeyboardLight ([out, Description("Get keyboard light on/off status")] UINT32 Data);
+    [WmiMethodId(38), Implemented, Description("Get Macrokey scan code")] void GetMacrokeyScancode ([in, Description("Macrokey index")] UINT32 idx, [out, Description("Scan code")] UINT32 scancode);
+    [WmiMethodId(39), Implemented, Description("Get Macrokey count")] void GetMacrokeyCount ([out, Description("Macrokey count")] UINT32 Data);
+    [WmiMethodId(40), Implemented, Description("Support G-Sync feature")] void IsSupportGSync ([out, Description("Support G-Sync feature")] UINT32 Data);
+    [WmiMethodId(41), Implemented, Description("Get G-Sync Status")] void GetGSyncStatus ([out, Description("Get G-Sync Status")] UINT32 Data);
+    [WmiMethodId(42), Implemented, Description("Set G-Sync Status")] void SetGSyncStatus ([in, Description("Set G-Sync Status")] UINT32 Data);
+    [WmiMethodId(43), Implemented, Description("Support Smart Fan feature")] void IsSupportSmartFan ([out, Description("Support Smart Fan feature")] UINT32 Data);
+    [WmiMethodId(44), Implemented, Description("Set Smart Fan Mode")] void SetSmartFanMode ([in, Description("Set Smart Fan Mode")] UINT32 Data);
+    [WmiMethodId(45), Implemented, Description("Get Smart Fan Mode")] void GetSmartFanMode ([out, Description("Get Smart Fan Mode")] UINT32 Data);
+    [WmiMethodId(46), Implemented, Description("Get Smart Fan Setting Mode")] void GetSmartFanSetting ([out, Description("Get Smart Setting Mode")] UINT32 Data);
+    [WmiMethodId(47), Implemented, Description("Get Power Charge Mode")] void GetPowerChargeMode ([out, Description("Get Power Charge Mode")] UINT32 Data);
+    [WmiMethodId(48), Implemented, Description("Get Gaming Product Info")] void GetProductInfo ([out, Description("Get Gaming Product Info")] UINT32 Data);
+    [WmiMethodId(49), Implemented, Description("Over Drive feature capability")] void IsSupportOD ([out, Description("Over Drive feature capability")] UINT32 Data);
+    [WmiMethodId(50), Implemented, Description("Get Over Drive status")] void GetODStatus ([out, Description("Get Over Drive status")] UINT32 Data);
+    [WmiMethodId(51), Implemented, Description("Set Over Drive status")] void SetODStatus ([in, Description("Set Over Drive status")] UINT32 Data);
+    [WmiMethodId(52), Implemented, Description("Set Light Control Owner")] void SetLightControlOwner ([in, Description("Set Light Control Owner")] UINT32 Data);
+    [WmiMethodId(53), Implemented, Description("Set DDS Control Owner")] void SetDDSControlOwner ([in, Description("Set DDS Control Owner")] UINT32 Data);
+    [WmiMethodId(54), Implemented, Description("Get the flag of restore OC value")] void IsRestoreOCValue ([in, Description("Clean this flag")] UINT32 idx, [out, Description("Restore oc value flag")] UINT32 Data);
+    [WmiMethodId(55), Implemented, Description("Get Real Thremal Mode")] void GetThermalMode ([out, Description("Real Thremal Mode")] UINT32 Data);
+    [WmiMethodId(56), Implemented, Description("Get the OC switch status in BIOS")] void GetBIOSOCMode ([out, Description("OC Mode")] UINT32 Data);
+    [WmiMethodId(59), Implemented, Description("Get hardware info support version")] void GetHardwareInfoSupportVersion ([out, Description("version")] UINT32 Data);
+    [WmiMethodId(60), Implemented, Description("Get Cpu core 0 max frequency")] void GetCpuFrequency ([out, Description("frequency")] UINT32 Data);
+    [WmiMethodId(62), Implemented, Description("Check the Adapter type fit for OC")] void IsACFitForOC ([out, Description("AC check result")] UINT32 Data);
+    [WmiMethodId(63), Implemented, Description("Is support IGPU mode")] void IsSupportIGPUMode ([out, Description("IGPU modes")] UINT32 Data);
+    [WmiMethodId(64), Implemented, Description("Get IGPU Mode Status")] void GetIGPUModeStatus([out, Description("IGPU Mode Status")] UINT32 Data);
+    [WmiMethodId(65), Implemented, Description("Set IGPU Mode")] void SetIGPUModeStatus([in, Description("IGPU Mode")] UINT32 mode, [out, Description("return code")] UINT32 Data);
+    [WmiMethodId(66), Implemented, Description("Notify DGPU Status")] void NotifyDGPUStatus([in, Description("DGPU status")] UINT32 status, [out, Description("return code")] UINT32 Data);
+    [WmiMethodId(67), Implemented, Description("Is changed Y log")] void IsChangedYLog([out, Description("Is changed Y Log")] UINT32 Data);
+    [WmiMethodId(68), Implemented, Description("Get DGPU Hardwawre ID")] void GetDGPUHWId([out, Description("Get DGPU Hardware ID")] string Data);
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of CPU OC parameter list"), guid("{B7F3CA0A-ACDC-42D2-9217-77C6C628FBD2}")]
+  class LENOVO_GAMEZONE_CPU_OC_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("OC tune id.")] uint32 Tuneid;
+    [WmiDataId(2), read, Description("Default value.")] uint32 DefaultValue;
+    [WmiDataId(3), read, Description("OC Value.")] uint32 OCValue;
+    [WmiDataId(4), read, Description("Min Value.")] uint32 MinValue;
+    [WmiDataId(5), read, Description("Max Value.")] uint32 MaxValue;
+    [WmiDataId(6), read, Description("Scale Value.")] uint32 ScaleValue;
+    [WmiDataId(7), read, Description("OC Order id.")] uint32 OCOrderid;
+    [WmiDataId(8), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
+    [WmiDataId(9), read, Description("Delay time in ms.")] uint32 Interval;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Definition of GPU OC parameter list"), guid("{887B54E2-DDDC-4B2C-8B88-68A26A8835D0}")]
+  class LENOVO_GAMEZONE_GPU_OC_DATA {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("P-State ID.")] uint32 PStateID;
+    [WmiDataId(2), read, Description("CLOCK ID.")] uint32 ClockID;
+    [WmiDataId(3), read, Description("Default value.")] uint32 defaultvalue;
+    [WmiDataId(4), read, Description("OC Offset freqency.")] uint32 OCOffsetFreq;
+    [WmiDataId(5), read, Description("OC Min offset value.")] uint32 OCMinOffset;
+    [WmiDataId(6), read, Description("OC Max offset value.")] uint32 OCMaxOffset;
+    [WmiDataId(7), read, Description("OC Offset Scale.")] uint32 OCOffsetScale;
+    [WmiDataId(8), read, Description("OC Order id.")] uint32 OCOrderid;
+    [WmiDataId(9), read, Description("NON-OC Order id.")] uint32 NOCOrderid;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Fancooling finish event"), guid("{BC72A435-E8C1-4275-B3E2-D8B8074ABA59}")]
+  class LENOVO_GAMEZONE_FAN_COOLING_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Fancooling clean finish event")] uint32 EventId;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan mode change event"), guid("{D320289E-8FEA-41E0-86F9-611D83151B5F}")]
+  class LENOVO_GAMEZONE_SMART_FAN_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Smart Fan Mode change event")] uint32 mode;
+    [WmiDataId(2), read, Description("version of FN+Q")] uint32 version;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Smart Fan setting mode change event"), guid("{D320289E-8FEA-41E1-86F9-611D83151B5F}")]
+  class LENOVO_GAMEZONE_SMART_FAN_SETTING_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Smart Fan Setting mode change event")] uint32 mode;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("POWER CHARGE MODE Change EVENT"), guid("{D320289E-8FEA-41E0-86F9-711D83151B5F}")]
+  class LENOVO_GAMEZONE_POWER_CHARGE_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("POWER CHARGE MODE Change EVENT")] uint32 mode;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("Thermal Mode Real Mode change event"), guid("{D320289E-8FEA-41E0-86F9-911D83151B5F}")]
+  class LENOVO_GAMEZONE_THERMAL_MODE_EVENT: WMIEvent {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description("Thermal Mode Real Mode")] uint32 mode;
+  };
diff --git a/Documentation/wmi/devices/lenovo-wmi-other.rst b/Documentation/wmi/devices/lenovo-wmi-other.rst
new file mode 100644
index 000000000000..d7928b8dfb4b
--- /dev/null
+++ b/Documentation/wmi/devices/lenovo-wmi-other.rst
@@ -0,0 +1,108 @@
+.. SPDX-License-Identifier: GPL-2.0-or-later
+
+===========================================================
+Lenovo WMI Interface Other Mode Driver (lenovo-wmi-other)
+===========================================================
+
+Introduction
+============
+Lenovo WMI Other Mode interface is broken up into multiple GUIDs,
+The primary Other Mode interface provides advanced power tuning features
+such as Package Power Tracking (PPT). It is paired with multiple data block
+GUIDs that provide context for the various methods.
+
+
+Other Mode
+----------
+
+WMI GUID ``DC2A8805-3A8C-41BA-A6F7-092E0089CD3B``
+
+The Other Mode WMI interface uses the firmware_attributes class to expose
+various WMI attributes provided by the interface in the sysfs. This enables
+CPU and GPU power limit tuning as well as various other attributes for
+devices that fall under the "Gaming Series" of Lenovo devices. Each
+attribute exposed by the Other Mode interface has corresponding
+capability data blocks which allow the driver to probe details about the
+attribute. Each attribute has multiple pages, one for each of the platform
+profiles managed by the Gamezone interface. Attributes are exposed in sysfs
+under the following path:
+
+::
+
+  /sys/class/firmware-attributes/lenovo-wmi-other/attributes/<attribute>/
+
+LENOVO_CAPABILITY_DATA_01
+-------------------------
+
+WMI GUID ``7A8F5407-CB67-4D6E-B547-39B3BE018154``
+
+The LENOVO_CAPABILITY_DATA_01 interface provides information on various
+power limits of integrated CPU and GPU components.
+
+Each attribute has the following properties:
+ - current_value
+ - default_value
+ - display_name
+ - max_value
+ - min_value
+ - scalar_increment
+ - type
+
+The following attributes are implemented:
+ - ppt_pl1_spl: Platform Profile Tracking Sustained Power Limit
+ - ppt_pl2_sppt: Platform Profile Tracking Slow Package Power Tracking
+ - ppt_pl3_fppt: Platform Profile Tracking Fast Package Power Tracking
+
+
+WMI interface description
+=========================
+
+The WMI interface description can be decoded from the embedded binary MOF (bmof)
+data using the `bmfdec <https://github.com/pali/bmfdec>`_ utility:
+
+::
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO_OTHER_METHOD class"), guid("{dc2a8805-3a8c-41ba-a6f7-092e0089cd3b}")]
+  class LENOVO_OTHER_METHOD {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiMethodId(17), Implemented, Description("Get Feature Value ")] void GetFeatureValue([in] uint32 IDs, [out] uint32 value);
+    [WmiMethodId(18), Implemented, Description("Set Feature Value ")] void SetFeatureValue([in] uint32 IDs, [in] uint32 value);
+    [WmiMethodId(19), Implemented, Description("Get Data By Command ")] void GetDataByCommand([in] uint32 IDs, [in] uint32 Command, [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint32 Data[]);
+    [WmiMethodId(99), Implemented, Description("Get Data By Package for TAC")] void GetDataByPackage([in, Max(40)] uint8 Input[], [out] uint32 DataSize, [out, WmiSizeIs("DataSize")] uint8 Data[]);
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 00"), guid("{362a3afe-3d96-4665-8530-96dad5bb300e}")]
+  class LENOVO_CAPABILITY_DATA_00 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Capability Default Value.")] uint32 DefaultValue;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 01"), guid("{7a8f5407-cb67-4d6e-b547-39b3be018154}")]
+  class LENOVO_CAPABILITY_DATA_01 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Default Value.")] uint32 DefaultValue;
+    [WmiDataId(4), read, Description("Step.")] uint32 Step;
+    [WmiDataId(5), read, Description("Minimum Value.")] uint32 MinValue;
+    [WmiDataId(6), read, Description("Maximum Value.")] uint32 MaxValue;
+  };
+
+  [WMI, Dynamic, Provider("WmiProv"), Locale("MS\\0x409"), Description("LENOVO CAPABILITY DATA 02"), guid("{bbf1f790-6c2f-422b-bc8c-4e7369c7f6ab}")]
+  class LENOVO_CAPABILITY_DATA_02 {
+    [key, read] string InstanceName;
+    [read] boolean Active;
+
+    [WmiDataId(1), read, Description(" IDs.")] uint32 IDs;
+    [WmiDataId(2), read, Description("Capability.")] uint32 Capability;
+    [WmiDataId(3), read, Description("Data Size.")] uint32 DataSize;
+    [WmiDataId(4), read, Description("Default Value"), WmiSizeIs("DataSize")] uint8 DefaultValue[];
+  };
diff --git a/MAINTAINERS b/MAINTAINERS
index 1afd30d00aec..675f4b26426d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13158,6 +13158,13 @@ S:	Maintained
 W:	http://legousb.sourceforge.net/
 F:	drivers/usb/misc/legousbtower.c
 
+LENOVO WMI DRIVERS
+M:	Derek J. Clark <derekjohn.clark@gmail.com>
+L:	platform-driver-x86@vger.kernel.org
+S:	Maintained
+F:	Documentation/wmi/devices/lenovo-wmi-gamezone.rst
+F:	Documentation/wmi/devices/lenovo-wmi-other.rst
+
 LENOVO WMI HOTKEY UTILITIES DRIVER
 M:	Jackie Dong <xy-jackie@139.com>
 L:	platform-driver-x86@vger.kernel.org
-- 
2.49.0


