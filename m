Return-Path: <platform-driver-x86+bounces-13714-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 22EBDB25066
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 18:59:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id BCE9B5A5313
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 16:56:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3651228D8DB;
	Wed, 13 Aug 2025 16:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iSbyKo3x"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FFFD28C5DE;
	Wed, 13 Aug 2025 16:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104193; cv=none; b=YaMng1Az/x1bwVcvcqtBvNoZN81kc2ERsh4L9G6PlmRN6vrx5v0hzIeNuZg7rd1pkbaBuUh81FXpwbFhEFHqtM540TAbC6VQW7d+SVPvJBsWcUvlEjyWS1N/70Jf3/gnxco+jblAEjWzC+ZvKaL+6EGkAPkSSvS93/lIqI1V7Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104193; c=relaxed/simple;
	bh=+4+QMDOlhumvvCxowgkRTb5iOq4/wAII3sNnLCAV0So=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ArRzkpj8RvN2uATWnsfdUvdEcYktqGaCqsajCSRTrZ1wqYvlixRjKw67xQLhqbBgZhd5yIkFgz63/UYtyJRR8UMQeP/fOdujLTSkeS76vBPJGUIrW8HcuC2SkLeyX5p1oUF/eJ2l0Bxcjdnt3W3aGz40Sy8G9oyxzZwtyUodkyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iSbyKo3x; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3b9e4193083so17934f8f.3;
        Wed, 13 Aug 2025 09:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104189; x=1755708989; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MdeBbE3h5vAHXdthJ7mefbWWXRzt5X9iZ5taB+dn0rw=;
        b=iSbyKo3xOMUtJGSUbzJ7W4QG3IV+jRc5ugQIcK9g3dctdlLfzUD0bDFwyr0eZvszYh
         TruI5AmJRl4TrxwE3AU5p+TZBLTtBgVx5//rFiZtxcqPZHjwE18QTLswR14joQ7B+LKe
         aIlBbL8/i+EmrGrcDU6CG3+fhzJhBKxoToNPRe4LnAmfcj1t+V/1o4dhNc+FRJenSSQr
         M6+g4syjJX1eh4+7biQEIkITQvryqDlF0AD3MdG6Vk7DJwgg06zizlDAzMtJZ5AJz4v2
         oK/lagQ3v+aSFW1z8x2BHw1j2F8YFgcIGDolWdCrzAx0+DCJmCjkWaA2j30sxyXtfSFq
         5whw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104189; x=1755708989;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MdeBbE3h5vAHXdthJ7mefbWWXRzt5X9iZ5taB+dn0rw=;
        b=kZxCJ44+zTj04/DhhiaVvwYR4uvmiwpHe7bXS4hl32/tVSU9am+FWKouv5eHKZfY5y
         +5PjssYtGnPcCgzZ81CrAE9G3cB/keIBfwekgxitRI9UacjCta0wLu1eBZ57KJ0m2oED
         6djhBWZN1iR1HOGJNFaMJ2eBWbxdBC37pfHE62dENoNa6YpyOUULtMu/HWbDz7wJUtaV
         aIebb+3SBp7SxRDLSTv2n/NsyRJg9Bb9Mtjk8FpV7Dj3uyD+bsMYxd+uUrdjYslpLnDh
         /Pjj5lYzL9T3F1JDcVN+he7dbj2gC0U7Z4Rpqp0bn+oDMB2DS55mSE1ZKHGcUugv1Tkc
         N7mw==
X-Forwarded-Encrypted: i=1; AJvYcCV3CFhr17Qv3AKyOFRg93PB6SunPPQrw/Km3brjxNFWE0ynnLZVQpYgT/PdagUPYbU6E3aSv3bW6cK72MnyQxiIarqa@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj3cakFV35K5RGDR0VWUgS3DpsCdsrBIl1ngOJxDIhLqG2kRKX
	hCRuZqNAqrgFfxBQiG/vDM0RUpvTO2XKTcbtF3bZ2DxWL5B8Eo+55NH93XgNSg==
X-Gm-Gg: ASbGnctxymIQcSHWua/0GaYq6SKQ6iFrzMYWiN3GcOCjxjYoz64qsytWfesWvOnU/kv
	8oY/BwylMjX1EHoDScBOYO4UKP6JRy6r2P4EV+N/ZL8jkJ5N4E24YwLw3bIyKfRwpb/1iAuffRx
	cJdVi6VdZ2AF7fnUXnmk7S+xaCauAP5wNN2WY1dyeybiUO6xRsjvk+dEcyeu2LU1PsLT3NB+RJh
	/hUJ/AzNBClG4PzuTweX+CgmQ/2LqH4pk9iyuQJcBpCymI276sdYipc6KuQI0Va2jwPKngV1Ako
	6CHuvl9kaULpTod/WLM2+h8+8WpJGfgvTYcKLhZlxH73gWMLOzkq7A8Vcp0OzJwOFi+cvp6CTMC
	4pNTE8Zhzy6LluuQA/7pImXs=
X-Google-Smtp-Source: AGHT+IFgYkPKYpexEhz29XR61NNy1QPwA4+m7nXwUVq9YgHWASRbW2D8x8rMRKjdjZyUiT7Kr05jCg==
X-Received: by 2002:a05:6000:430b:b0:3b5:f0aa:b1e5 with SMTP id ffacd0b85a97d-3b9e416d83amr52195f8f.19.1755104189342;
        Wed, 13 Aug 2025 09:56:29 -0700 (PDT)
Received: from denis-pc ([176.206.95.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm48600399f8f.67.2025.08.13.09.56.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:56:29 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v11 4/8] platform/x86: asus-armoury: add apu-mem control support
Date: Wed, 13 Aug 2025 18:56:16 +0200
Message-ID: <20250813165620.1131127-5-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813165620.1131127-1-benato.denis96@gmail.com>
References: <20250813165620.1131127-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Implement the APU memory size control under the asus-armoury module using
the fw_attributes class.

This allows the APU allocated memory size to be adjusted depending on
the users priority. A reboot is required after change.

Signed-off-by: Luke D. Jones <luke@ljones.dev>
Signed-off-by: Denis Benato <benato.denis96@gmail.com>
---
 drivers/platform/x86/asus-armoury.c        | 81 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  2 +
 2 files changed, 83 insertions(+)

diff --git a/drivers/platform/x86/asus-armoury.c b/drivers/platform/x86/asus-armoury.c
index 68ce2c159ae1..e458d23d020d 100644
--- a/drivers/platform/x86/asus-armoury.c
+++ b/drivers/platform/x86/asus-armoury.c
@@ -394,6 +394,86 @@ static ssize_t egpu_enable_current_value_store(struct kobject *kobj, struct kobj
 WMI_SHOW_INT(egpu_enable_current_value, "%d\n", ASUS_WMI_DEVID_EGPU);
 ATTR_GROUP_BOOL_CUSTOM(egpu_enable, "egpu_enable", "Enable the eGPU (also disables dGPU)");
 
+/* Device memory available to APU */
+
+/* Values map for APU memory: some looks out of order but are actually correct */
+static u32 apu_mem_map[] = {
+	[0] = 0x000, /* called "AUTO" on the BIOS, is the minimum available */
+	[1] = 0x102,
+	[2] = 0x103,
+	[3] = 0x104,
+	[4] = 0x105,
+	[5] = 0x107,
+	[6] = 0x108,
+	[7] = 0x109,
+	[8] = 0x106,
+};
+
+static ssize_t apu_mem_current_value_show(struct kobject *kobj, struct kobj_attribute *attr,
+					  char *buf)
+{
+	int err;
+	u32 mem;
+
+	err = asus_wmi_get_devstate_dsts(ASUS_WMI_DEVID_APU_MEM, &mem);
+	if (err)
+		return err;
+
+	if ((mem & ASUS_WMI_DSTS_PRESENCE_BIT) == 0)
+		return -ENODEV;
+
+	mem &= ~ASUS_WMI_DSTS_PRESENCE_BIT;
+
+	/* After 0x000 is set, a read will return 0x100 */
+	if (mem == 0x100)
+		return sysfs_emit(buf, "0\n");
+
+	for (unsigned int i = 0; i < ARRAY_SIZE(apu_mem_map); i++) {
+		if (apu_mem_map[i] == mem)
+			return sysfs_emit(buf, "%u\n", i);
+	}
+
+	pr_warn("Unrecognised value for APU mem 0x%08x\n", mem);
+	return sysfs_emit(buf, "%u\n", mem);
+}
+
+static ssize_t apu_mem_current_value_store(struct kobject *kobj, struct kobj_attribute *attr,
+					   const char *buf, size_t count)
+{
+	int result, err;
+	u32 requested, mem;
+
+	result = kstrtou32(buf, 10, &requested);
+	if (result)
+		return result;
+
+	if (requested > ARRAY_SIZE(apu_mem_map))
+		return -EINVAL;
+
+	mem = apu_mem_map[requested];
+
+	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_APU_MEM, mem, &result);
+	if (err) {
+		pr_warn("Failed to set apu_mem: %d\n", err);
+		return err;
+	}
+
+	pr_info("APU memory changed to %uGB, reboot required\n", requested+1);
+	sysfs_notify(kobj, NULL, attr->attr.name);
+
+	asus_set_reboot_and_signal_event();
+
+	return count;
+}
+
+static ssize_t apu_mem_possible_values_show(struct kobject *kobj, struct kobj_attribute *attr,
+					    char *buf)
+{
+	BUILD_BUG_ON(ARRAY_SIZE(apu_mem_map) != 9);
+	return sysfs_emit(buf, "0;1;2;3;4;5;6;7;8\n");
+}
+ATTR_GROUP_ENUM_CUSTOM(apu_mem, "apu_mem", "Set available system RAM (in GB) for the APU to use");
+
 /* Simple attribute creation */
 ATTR_GROUP_ENUM_INT_RO(charge_mode, "charge_mode", ASUS_WMI_DEVID_CHARGE_MODE, "0;1;2",
 		       "Show the current mode of charging");
@@ -414,6 +494,7 @@ static const struct asus_attr_group armoury_attr_groups[] = {
 	{ &egpu_connected_attr_group, ASUS_WMI_DEVID_EGPU_CONNECTED },
 	{ &egpu_enable_attr_group, ASUS_WMI_DEVID_EGPU },
 	{ &dgpu_disable_attr_group, ASUS_WMI_DEVID_DGPU },
+	{ &apu_mem_attr_group, ASUS_WMI_DEVID_APU_MEM },
 
 	{ &charge_mode_attr_group, ASUS_WMI_DEVID_CHARGE_MODE },
 	{ &boot_sound_attr_group, ASUS_WMI_DEVID_BOOT_SOUND },
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 10acd5d52e38..a4f6bab93a6f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -137,6 +137,8 @@
 /* dgpu on/off */
 #define ASUS_WMI_DEVID_DGPU		0x00090020
 
+#define ASUS_WMI_DEVID_APU_MEM		0x000600C1
+
 /* gpu mux switch, 0 = dGPU, 1 = Optimus */
 #define ASUS_WMI_DEVID_GPU_MUX		0x00090016
 #define ASUS_WMI_DEVID_GPU_MUX_VIVO	0x00090026
-- 
2.39.5


