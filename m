Return-Path: <platform-driver-x86+bounces-8858-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 29F41A170AD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Jan 2025 17:48:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id A6D037A4474
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Jan 2025 16:47:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 55A251EBFE3;
	Mon, 20 Jan 2025 16:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m8ICqEgc"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC891B87DB;
	Mon, 20 Jan 2025 16:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737391664; cv=none; b=JIeyf3J0hrZ0g+QgBU5EjH4NagAfSGoqJpelkazx/XDFbpeI1wjdsv8Sz8C4ODyg2VkrjaSXvD9eKCFjQOueSgk5IKugV/LuqRYOj17kEUcNNeNPXdesSjqWHNhNZux4+qQVLlidsz/rfcq9fvYr+HRkdApMlKlv0n6du/HBKIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737391664; c=relaxed/simple;
	bh=3HfRCkRkzJcP1clRU3Mxq16fnJSt3fGSZHtYZBTx4DA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Pove3TaKA7q8zHFZWHxzvAkzf1vp3sQK1VyHUUxFAkZJsv8iYV41gKALkx8S1VZ2q0i7s/0RSb2KYxf94Vxn8NgGxG4TZlfFB1E8F46/qOSpZfCtX5wragwvHukya/agVHZTQRDpygDXERLuyJvves9qd7JUYK5UnmGq3+eLm7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m8ICqEgc; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2161eb95317so84283075ad.1;
        Mon, 20 Jan 2025 08:47:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737391661; x=1737996461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GIW41dDeRBWvItNYsT6e8qOH9kZU2BRCSKMVfzV4Pjs=;
        b=m8ICqEgc/UhicNmGjw+9Vt/eldAcnan04C3rzJ3elsIR8yIO3FXL70h3RocqTTUIj6
         Mlo66P0S92LUODQ1g/h/QPnxpENA4LdWcTT9dlJqpSrdONJ2cao+GE63VVBRUdyyvmmg
         F4TNK/aM2VUd5V4SlWws8yToqp+9/JwutlXhKNwyb0RvHcTkRHpjfg4lQREVKa7zoY/u
         2j8yCv4jRU4T3OvAsFQIQ1rwargMuE3wDu611vakGid1wT66vFi1DVggMU/c8DguwCRj
         f8qMGfoO8d2OoeLCVb7GOVtM9Ei8iogm8wT/grt30vSjcbTw2kyFxivZ4umN+tylj9lP
         Pv9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737391661; x=1737996461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GIW41dDeRBWvItNYsT6e8qOH9kZU2BRCSKMVfzV4Pjs=;
        b=OpLsMMQegP+cE+bhhoTp8GxLMpDkrcrybWjom9aApD+Gzov+23rKtsJJ+8i9ZQJhj+
         I1jgZ6H4IgQYj+IhWvttygEQGA1ZIYLoJ/FuB6iVqvM7TEJgryqLv5O9Q+nqUgIJVXPP
         0Vi/ij/G14OQVl5IyyZQlWIJ2QXsUatPZaKay88/kVkrX9FDOU/rrosQkg+cIlT9OXPG
         xAjHGMYmFXTkGxm7F31CSxzQY078yjDxuzsIV6fZOez0KmmUsPl8ORlgGG5Jk1EFxpBK
         fgPKjbbyBuyMCbJq3Z7neANim67dkNJp5SkbnZtirZ9Uf5To7foyb2o9vFlau1uNFygP
         m/Wg==
X-Forwarded-Encrypted: i=1; AJvYcCVky2Oji9pHXF1uPOrIEtY3uCDK2bWAjrsjtU3NYN0j+Ac9Vyxp+LANJD0ONfoLm9F2nW0o1ozDo51NbPe7@vger.kernel.org, AJvYcCVyQGnPHs4ARH56BpP2du9olmTduL5XHB30bUg8+8ywV1sqzAT3U1+vWEeU6n/If13bpy4FwIMrHrKhAS0=@vger.kernel.org, AJvYcCWDHWGS6nk1e3HpWJ5IF9kfwGqegOYYSwemYuYwH1SrzlsUzPOxfkz3zfUjltxtByDrr5X4p4PCFpq39VHecHdeL0/YUA==@vger.kernel.org, AJvYcCX8d62XRWFOmMv4mNoqG1B9RLriksZ69Aco8WRKp1Nui1hVKKxgLZ79TqFJM3Qas4mN711aFHBuITWazaCK@vger.kernel.org
X-Gm-Message-State: AOJu0YymzyfbKEQCy5Srkawru8lX28MZy5ZRsnuheq/QUkCQYX68RSB6
	FLiVdGegXdfgKAyPHzzoFC8Uk2HIQyjXlz6nGxgH7rnLD8C9SNbV
X-Gm-Gg: ASbGncsI9IsAltZhSX1NQAwv/Q8SaRaUI1mRyY6r1zTCin16wJCF4c7/eu+0MjNBbHm
	iCCKpH//aDWw6Sw+sbMTEtxMWlvImmYp6eRdnwORoRd5pq6T1vR2BSUwgzJsFNUTF82FRiHsD/E
	4HBp3NL8f3XmN7h3VYxd57CUJWAJ9YCr36VevNChWkgXs9cBeWRrWLnBhBjdQlLrQ3R14CaHm2z
	wZsFNIoL2HvRwZh5l32Lc8RMeMtSCJsjwFtEDJGogm6Umbj5ruZ/t/kN5Gti4+KIrQ6rNk=
X-Google-Smtp-Source: AGHT+IGI4uSgQibKBj2fUjY0WvAGZUo1PC/dnCcqoQp8RnWt+R0VyHhJxmXgaboJhFjLL7s/N2SHOQ==
X-Received: by 2002:a05:6a21:32a5:b0:1db:e509:c0a8 with SMTP id adf61e73a8af0-1eb214da38amr21640892637.21.1737391660700;
        Mon, 20 Jan 2025 08:47:40 -0800 (PST)
Received: from SC8280XP.. ([144.202.86.13])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a9bcaa3a97dsm6017266a12.9.2025.01.20.08.47.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 08:47:40 -0800 (PST)
From: Pengyu Luo <mitltlatltl@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=83=C2=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	Pengyu Luo <mitltlatltl@gmail.com>
Subject: [PATCH RESEND v5 2/3] platform: arm64: add Huawei Matebook E Go EC driver
Date: Tue, 21 Jan 2025 00:47:00 +0800
Message-ID: <20250120164701.7918-3-mitltlatltl@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250120164701.7918-1-mitltlatltl@gmail.com>
References: <20250120164701.7918-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are three variants of which Huawei released the first two
simultaneously.

Huawei Matebook E Go LTE(sc8180x), codename seems to be gaokun2.
Huawei Matebook E Go(sc8280xp@3.0GHz), codename must be gaokun3. (see [1])
Huawei Matebook E Go 2023(sc8280xp@2.69GHz), codename should be also gaokun3.

Adding support for the latter two variants for now, this driver should
also work for the sc8180x variant according to acpi table files, but I
don't have the device to test yet.

Different from other Qualcomm Snapdragon sc8280xp based machines, the
Huawei Matebook E Go uses an embedded controller while others use
a system called PMIC GLink. This embedded controller can be used to
perform a set of various functions, including, but not limited to:

- Battery and charger monitoring;
- Charge control and smart charge;
- Fn_lock settings;
- Tablet lid status;
- Temperature sensors;
- USB Type-C notifications (ports orientation,  DP alt mode HPD);
- USB Type-C PD (according to observation, up to 48w).

Add a driver for the EC which creates devices for UCSI and power supply
devices.

This driver is inspired by the following drivers:
        drivers/platform/arm64/acer-aspire1-ec.c
        drivers/platform/arm64/lenovo-yoga-c630.c
        drivers/platform/x86/huawei-wmi.c

[1] https://bugzilla.kernel.org/show_bug.cgi?id=219645

Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
---
 MAINTAINERS                                   |   7 +
 drivers/platform/arm64/Kconfig                |  21 +
 drivers/platform/arm64/Makefile               |   1 +
 drivers/platform/arm64/huawei-gaokun-ec.c     | 822 ++++++++++++++++++
 .../linux/platform_data/huawei-gaokun-ec.h    |  79 ++
 5 files changed, 930 insertions(+)
 create mode 100644 drivers/platform/arm64/huawei-gaokun-ec.c
 create mode 100644 include/linux/platform_data/huawei-gaokun-ec.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 790fa54b8..5a2e53c92 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10695,6 +10695,13 @@ S:	Maintained
 F:	Documentation/networking/device_drivers/ethernet/huawei/hinic.rst
 F:	drivers/net/ethernet/huawei/hinic/
 
+HUAWEI MATEBOOK E GO EMBEDDED CONTROLLER DRIVER
+M:	Pengyu Luo <mitltlatltl@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/platform/huawei,gaokun-ec.yaml
+F:	drivers/platform/arm64/huawei-gaokun-ec.c
+F:	include/linux/platform_data/huawei-gaokun-ec.h
+
 HUGETLB SUBSYSTEM
 M:	Muchun Song <muchun.song@linux.dev>
 L:	linux-mm@kvack.org
diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
index f88395ea3..6ceee3c16 100644
--- a/drivers/platform/arm64/Kconfig
+++ b/drivers/platform/arm64/Kconfig
@@ -33,6 +33,27 @@ config EC_ACER_ASPIRE1
 	  laptop where this information is not properly exposed via the
 	  standard ACPI devices.
 
+config EC_HUAWEI_GAOKUN
+	tristate "Huawei Matebook E Go Embedded Controller driver"
+	depends on ARCH_QCOM || COMPILE_TEST
+	depends on I2C
+	depends on INPUT
+	select AUXILIARY_BUS
+
+	help
+	  Say Y here to enable the EC driver for the Huawei Matebook E Go
+	  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
+	  (information, charge control) and USB Type-C DP HPD events as well
+	  as some misc functions like the lid sensor and temperature sensors,
+	  etc.
+
+	  This driver provides battery and AC status support for the mentioned
+	  laptop where this information is not properly exposed via the
+	  standard ACPI devices.
+
+	  Say M or Y here to include this support.
+
+
 config EC_LENOVO_YOGA_C630
 	tristate "Lenovo Yoga C630 Embedded Controller driver"
 	depends on ARCH_QCOM || COMPILE_TEST
diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
index b2ae9114f..46a99eba3 100644
--- a/drivers/platform/arm64/Makefile
+++ b/drivers/platform/arm64/Makefile
@@ -6,4 +6,5 @@
 #
 
 obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
+obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
 obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/huawei-gaokun-ec.c
new file mode 100644
index 000000000..ff42efad9
--- /dev/null
+++ b/drivers/platform/arm64/huawei-gaokun-ec.c
@@ -0,0 +1,822 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * huawei-gaokun-ec - An EC driver for HUAWEI Matebook E Go
+ *
+ * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+#include <linux/auxiliary_bus.h>
+#include <linux/cleanup.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/i2c.h>
+#include <linux/input.h>
+#include <linux/notifier.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/platform_data/huawei-gaokun-ec.h>
+
+#define EC_EVENT		0x06
+
+/* Also can be found in ACPI specification 12.3 */
+#define EC_READ			0x80
+#define EC_WRITE		0x81
+#define EC_BURST		0x82
+#define EC_QUERY		0x84
+
+#define EC_FN_LOCK_ON		0x5A
+#define EC_FN_LOCK_OFF		0x55
+#define EC_FN_LOCK_READ		0x6B
+#define EC_FN_LOCK_WRITE	0x6C
+
+#define EC_EVENT_LID		0x81
+
+#define EC_LID_STATE		0x80
+#define EC_LID_OPEN		BIT(1)
+
+#define EC_TEMP_REG		0x61
+
+#define EC_STANDBY_REG		0xB2
+#define EC_STANDBY_ENTER	0xDB
+#define EC_STANDBY_EXIT		0xEB
+
+enum gaokun_ec_smart_charge_cmd {
+	SMART_CHARGE_DATA_WRITE = 0xE3,
+	SMART_CHARGE_DATA_READ,
+	SMART_CHARGE_ENABLE_WRITE,
+	SMART_CHARGE_ENABLE_READ,
+};
+
+enum gaokun_ec_ucsi_cmd {
+	UCSI_REG_WRITE = 0xD2,
+	UCSI_REG_READ,
+	UCSI_DATA_WRITE,
+	UCSI_DATA_READ,
+};
+
+#define UCSI_REG_SIZE		7
+
+/*
+ * For tx, command sequences are arranged as
+ * {master_cmd, slave_cmd, data_len, data_seq}
+ */
+#define REQ_HDR_SIZE		3
+#define INPUT_SIZE_OFFSET	2
+#define REQ_LEN(req) (REQ_HDR_SIZE + (req)[INPUT_SIZE_OFFSET])
+
+/*
+ * For rx, data sequences are arranged as
+ * {status, data_len(unreliable), data_seq}
+ */
+#define RESP_HDR_SIZE		2
+
+#define MKREQ(REG0, REG1, SIZE, ...)			\
+{							\
+	REG0, REG1, SIZE,				\
+	/* ## will remove comma when SIZE is 0 */	\
+	## __VA_ARGS__,					\
+	/* make sure len(pkt[3:]) >= SIZE */		\
+	[3 + (SIZE)] = 0,				\
+}
+
+#define MKRESP(SIZE)				\
+{						\
+	[RESP_HDR_SIZE + (SIZE) - 1] = 0,	\
+}
+
+/* Possible size 1, 4, 20, 24. Most of the time, the size is 1. */
+static inline void refill_req(u8 *dest, const u8 *src, size_t size)
+{
+	memcpy(dest + REQ_HDR_SIZE, src, size);
+}
+
+static inline void refill_req_byte(u8 *dest, const u8 *src)
+{
+	dest[REQ_HDR_SIZE] = *src;
+}
+
+/* Possible size 1, 2, 4, 7, 20. Most of the time, the size is 1. */
+static inline void extr_resp(u8 *dest, const u8 *src, size_t size)
+{
+	memcpy(dest, src + RESP_HDR_SIZE, size);
+}
+
+static inline void extr_resp_byte(u8 *dest, const u8 *src)
+{
+	*dest = src[RESP_HDR_SIZE];
+}
+
+static inline void *extr_resp_shallow(const u8 *src)
+{
+	return src + RESP_HDR_SIZE;
+}
+
+struct gaokun_ec {
+	struct i2c_client *client;
+	struct mutex lock; /* EC transaction lock */
+	struct blocking_notifier_head notifier_list;
+	struct device *hwmon_dev;
+	struct input_dev *idev;
+	bool suspended;
+};
+
+static int gaokun_ec_request(struct gaokun_ec *ec, const u8 *req,
+			     size_t resp_len, u8 *resp)
+{
+	struct i2c_client *client = ec->client;
+	struct i2c_msg msgs[] = {
+		{
+			.addr = client->addr,
+			.flags = client->flags,
+			.len = REQ_LEN(req),
+			.buf = req,
+		}, {
+			.addr = client->addr,
+			.flags = client->flags | I2C_M_RD,
+			.len = resp_len,
+			.buf = resp,
+		},
+	};
+	int ret;
+
+	guard(mutex)(&ec->lock);
+	ret = i2c_transfer(client->adapter, msgs, ARRAY_SIZE(msgs));
+	if (ret != ARRAY_SIZE(msgs)) {
+		dev_err(&client->dev, "I2C transfer error %d\n", ret);
+		goto out_after_break;
+	}
+
+	ret = *resp;
+	if (ret)
+		dev_err(&client->dev, "EC transaction error %d\n", ret);
+
+out_after_break:
+	usleep_range(2000, 2500); /* have a break, ACPI did this */
+
+	return ret;
+}
+
+/* -------------------------------------------------------------------------- */
+/* Common API */
+
+/**
+ * gaokun_ec_read - Read from EC
+ * @ec: The gaokun_ec structure
+ * @req: The sequence to request
+ * @resp_len: The size to read
+ * @resp: The buffer to store response sequence
+ *
+ * This function is used to read data after writing a magic sequence to EC.
+ * All EC operations depend on this function.
+ *
+ * Huawei uses magic sequences everywhere to complete various functions, all
+ * these sequences are passed to ECCD(a ACPI method which is quiet similar
+ * to gaokun_ec_request), there is no good abstraction to generalize these
+ * sequences, so just wrap it for now. Almost all magic sequences are kept
+ * in this file.
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
+		   size_t resp_len, u8 *resp)
+{
+	return gaokun_ec_request(ec, req, resp_len, resp);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_read);
+
+/**
+ * gaokun_ec_write - Write to EC
+ * @ec: The gaokun_ec structure
+ * @req: The sequence to request
+ *
+ * This function has no big difference from gaokun_ec_read. When caller care
+ * only write status and no actual data are returned, then use it.
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req)
+{
+	u8 ec_resp[] = MKRESP(0);
+
+	return gaokun_ec_request(ec, req, sizeof(ec_resp), ec_resp);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_write);
+
+int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte)
+{
+	int ret;
+	u8 ec_resp[] = MKRESP(sizeof(*byte));
+
+	ret = gaokun_ec_read(ec, req, sizeof(ec_resp), ec_resp);
+	extr_resp_byte(byte, ec_resp);
+
+	return ret;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_read_byte);
+
+/**
+ * gaokun_ec_register_notify - Register a notifier callback for EC events.
+ * @ec: The gaokun_ec structure
+ * @nb: Notifier block pointer to register
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_register_notify(struct gaokun_ec *ec, struct notifier_block *nb)
+{
+	return blocking_notifier_chain_register(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_register_notify);
+
+/**
+ * gaokun_ec_unregister_notify - Unregister notifier callback for EC events.
+ * @ec: The gaokun_ec structure
+ * @nb: Notifier block pointer to unregister
+ *
+ * Unregister a notifier callback that was previously registered with
+ * gaokun_ec_register_notify().
+ */
+void gaokun_ec_unregister_notify(struct gaokun_ec *ec, struct notifier_block *nb)
+{
+	blocking_notifier_chain_unregister(&ec->notifier_list, nb);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_unregister_notify);
+
+/* -------------------------------------------------------------------------- */
+/* API for PSY */
+
+/**
+ * gaokun_ec_psy_multi_read - Read contiguous registers
+ * @ec: The gaokun_ec structure
+ * @reg: The start register
+ * @resp_len: The number of registers to be read
+ * @resp: The buffer to store response sequence
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
+			     size_t resp_len, u8 *resp)
+{
+	u8 ec_req[] = MKREQ(0x02, EC_READ, 1, 0);
+	u8 ec_resp[] = MKRESP(1);
+	int i, ret;
+
+	for (i = 0; i < resp_len; ++i, reg++) {
+		refill_req_byte(ec_req, &reg);
+		ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
+		if (ret)
+			return ret;
+		extr_resp_byte(&resp[i], ec_resp);
+	}
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_multi_read);
+
+/* Smart charge */
+
+/**
+ * gaokun_ec_psy_get_smart_charge - Get smart charge data from EC
+ * @ec: The gaokun_ec structure
+ * @resp: The buffer to store response sequence (mode, delay, start, end)
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
+				   u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE])
+{
+	/* GBCM */
+	u8 ec_req[] = MKREQ(0x02, SMART_CHARGE_DATA_READ, 0);
+	u8 ec_resp[] = MKRESP(GAOKUN_SMART_CHARGE_DATA_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
+	if (ret)
+		return ret;
+
+	extr_resp(resp, ec_resp, GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge);
+
+static inline bool validate_battery_threshold_range(u8 start, u8 end)
+{
+	return end != 0 && start <= end && end <= 100;
+}
+
+/**
+ * gaokun_ec_psy_set_smart_charge - Set smart charge data
+ * @ec: The gaokun_ec structure
+ * @req: The sequence to request (mode, delay, start, end)
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
+				   const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE])
+{
+	/* SBCM */
+	u8 ec_req[] = MKREQ(0x02, SMART_CHARGE_DATA_WRITE,
+			    GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	if (!validate_battery_threshold_range(req[2], req[3]))
+		return -EINVAL;
+
+	refill_req(ec_req, req, GAOKUN_SMART_CHARGE_DATA_SIZE);
+
+	return gaokun_ec_write(ec, ec_req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge);
+
+/* Smart charge enable */
+
+/**
+ * gaokun_ec_psy_get_smart_charge_enable - Get smart charge state
+ * @ec: The gaokun_ec structure
+ * @on: The state
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on)
+{
+	/* GBAC */
+	u8 ec_req[] = MKREQ(0x02, SMART_CHARGE_ENABLE_READ, 0);
+	u8 state;
+	int ret;
+
+	ret = gaokun_ec_read_byte(ec, ec_req, &state);
+	if (ret)
+		return ret;
+
+	*on = !!state;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_get_smart_charge_enable);
+
+/**
+ * gaokun_ec_psy_set_smart_charge_enable - Set smart charge state
+ * @ec: The gaokun_ec structure
+ * @on: The state
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on)
+{
+	/* SBAC */
+	u8 ec_req[] = MKREQ(0x02, SMART_CHARGE_ENABLE_WRITE, 1, on);
+
+	return gaokun_ec_write(ec, ec_req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_psy_set_smart_charge_enable);
+
+/* -------------------------------------------------------------------------- */
+/* API for UCSI */
+
+/**
+ * gaokun_ec_ucsi_read - Read UCSI data from EC
+ * @ec: The gaokun_ec structure
+ * @resp: The buffer to store response sequence
+ *
+ * Read CCI and MSGI (used by UCSI subdriver).
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_ucsi_read(struct gaokun_ec *ec,
+			u8 resp[GAOKUN_UCSI_READ_SIZE])
+{
+	u8 ec_req[] = MKREQ(0x03, UCSI_DATA_READ, 0);
+	u8 ec_resp[] = MKRESP(GAOKUN_UCSI_READ_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
+	if (ret)
+		return ret;
+
+	extr_resp(resp, ec_resp, GAOKUN_UCSI_READ_SIZE);
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_read);
+
+/**
+ * gaokun_ec_ucsi_write - Write UCSI data to EC
+ * @ec: The gaokun_ec structure
+ * @req: The sequence to request
+ *
+ * Write CTRL and MSGO (used by UCSI subdriver).
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
+			 const u8 req[GAOKUN_UCSI_WRITE_SIZE])
+{
+	u8 ec_req[] = MKREQ(0x03, UCSI_DATA_WRITE, GAOKUN_UCSI_WRITE_SIZE);
+
+	refill_req(ec_req, req, GAOKUN_UCSI_WRITE_SIZE);
+
+	return gaokun_ec_write(ec, ec_req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_write);
+
+/**
+ * gaokun_ec_ucsi_get_reg - Get UCSI register from EC
+ * @ec: The gaokun_ec structure
+ * @ureg: The gaokun ucsi register
+ *
+ * Get UCSI register data (used by UCSI subdriver).
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec, struct gaokun_ucsi_reg *ureg)
+{
+	u8 ec_req[] = MKREQ(0x03, UCSI_REG_READ, 0);
+	u8 ec_resp[] = MKRESP(UCSI_REG_SIZE);
+	int ret;
+
+	ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
+	if (ret)
+		return ret;
+
+	extr_resp((u8 *)ureg, ec_resp, UCSI_REG_SIZE);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_get_reg);
+
+/**
+ * gaokun_ec_ucsi_pan_ack - Ack pin assignment notifications from EC
+ * @ec: The gaokun_ec structure
+ * @port_id: The port id receiving and handling the notifications
+ *
+ * Ack pin assignment notifications (used by UCSI subdriver).
+ *
+ * Return: 0 on success or negative error code.
+ */
+int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id)
+{
+	u8 ec_req[] = MKREQ(0x03, UCSI_REG_WRITE, 1);
+	u8 data = 1 << port_id;
+
+	if (port_id == GAOKUN_UCSI_NO_PORT_UPDATE)
+		data = 0;
+
+	refill_req_byte(ec_req, &data);
+
+	return gaokun_ec_write(ec, ec_req);
+}
+EXPORT_SYMBOL_GPL(gaokun_ec_ucsi_pan_ack);
+
+/* -------------------------------------------------------------------------- */
+/* EC Sysfs */
+
+/* Fn lock */
+static int gaokun_ec_get_fn_lock(struct gaokun_ec *ec, bool *on)
+{
+	/* GFRS */
+	u8 ec_req[] = MKREQ(0x02, EC_FN_LOCK_READ, 0);
+	int ret;
+	u8 state;
+
+	ret = gaokun_ec_read_byte(ec, ec_req, &state);
+	if (ret)
+		return ret;
+
+	if (state == EC_FN_LOCK_ON)
+		*on = true;
+	else if (state == EC_FN_LOCK_OFF)
+		*on = false;
+	else
+		return -EIO;
+
+	return 0;
+}
+
+static int gaokun_ec_set_fn_lock(struct gaokun_ec *ec, bool on)
+{
+	/* SFRS */
+	u8 ec_req[] = MKREQ(0x02, EC_FN_LOCK_WRITE, 1, on ?
+			    EC_FN_LOCK_ON : EC_FN_LOCK_OFF);
+
+	return gaokun_ec_write(ec, ec_req);
+}
+
+static ssize_t fn_lock_show(struct device *dev,
+			    struct device_attribute *attr,
+			    char *buf)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	bool on;
+	int ret;
+
+	ret = gaokun_ec_get_fn_lock(ec, &on);
+	if (ret)
+		return ret;
+
+	return sysfs_emit(buf, "%d\n", on);
+}
+
+static ssize_t fn_lock_store(struct device *dev,
+			     struct device_attribute *attr,
+			     const char *buf, size_t size)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	bool on;
+	int ret;
+
+	if (kstrtobool(buf, &on))
+		return -EINVAL;
+
+	ret = gaokun_ec_set_fn_lock(ec, on);
+	if (ret)
+		return ret;
+
+	return size;
+}
+
+static DEVICE_ATTR_RW(fn_lock);
+
+static struct attribute *gaokun_ec_attrs[] = {
+	&dev_attr_fn_lock.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(gaokun_ec);
+
+/* -------------------------------------------------------------------------- */
+/* Thermal Zone HwMon */
+
+/* Range from 0 to 0x2C, partially valid */
+static const u8 temp_reg[] = {
+	0x05, 0x07, 0x08, 0x0E, 0x0F, 0x12, 0x15, 0x1E,
+	0x1F, 0x20, 0x21, 0x22, 0x23, 0x24, 0x25, 0x26,
+	0x27, 0x28, 0x29, 0x2A
+};
+
+static int gaokun_ec_get_temp(struct gaokun_ec *ec, u8 idx, long *temp)
+{
+	/* GTMP */
+	u8 ec_req[] = MKREQ(0x02, EC_TEMP_REG, 1, temp_reg[idx]);
+	u8 ec_resp[] = MKRESP(sizeof(__le16));
+	__le16 *tmp;
+	int ret;
+
+	ret = gaokun_ec_read(ec, ec_req, sizeof(ec_resp), ec_resp);
+	if (ret)
+		return ret;
+
+	tmp = (__le16 *)extr_resp_shallow(ec_resp);
+	*temp = le16_to_cpu(*tmp) * 100; /* convert to HwMon's unit */
+
+	return 0;
+}
+
+static umode_t
+gaokun_ec_hwmon_is_visible(const void *data, enum hwmon_sensor_types type,
+			   u32 attr, int channel)
+{
+	return type == hwmon_temp ? 0444 : 0;
+}
+
+static int
+gaokun_ec_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
+		     u32 attr, int channel, long *val)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+
+	if (type == hwmon_temp)
+		return gaokun_ec_get_temp(ec, channel, val);
+
+	return -EINVAL;
+}
+
+static const struct hwmon_ops gaokun_ec_hwmon_ops = {
+	.is_visible = gaokun_ec_hwmon_is_visible,
+	.read = gaokun_ec_hwmon_read,
+};
+
+static u32 gaokun_ec_temp_config[] = {
+	[0 ... ARRAY_SIZE(temp_reg) - 1] = HWMON_T_INPUT,
+	0
+};
+
+static const struct hwmon_channel_info gaokun_ec_temp = {
+	.type = hwmon_temp,
+	.config = gaokun_ec_temp_config,
+};
+
+static const struct hwmon_channel_info * const gaokun_ec_hwmon_info[] = {
+	&gaokun_ec_temp,
+	NULL
+};
+
+static const struct hwmon_chip_info gaokun_ec_hwmon_chip_info = {
+	.ops = &gaokun_ec_hwmon_ops,
+	.info = gaokun_ec_hwmon_info,
+};
+
+/* -------------------------------------------------------------------------- */
+/* Modern Standby */
+
+static int gaokun_ec_suspend(struct device *dev)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	u8 ec_req[] = MKREQ(0x02, EC_STANDBY_REG, 1, EC_STANDBY_ENTER);
+	int ret;
+
+	if (ec->suspended)
+		return 0;
+
+	ret = gaokun_ec_write(ec, ec_req);
+	if (ret)
+		return ret;
+
+	ec->suspended = true;
+
+	return 0;
+}
+
+static int gaokun_ec_resume(struct device *dev)
+{
+	struct gaokun_ec *ec = dev_get_drvdata(dev);
+	u8 ec_req[] = MKREQ(0x02, EC_STANDBY_REG, 1, EC_STANDBY_EXIT);
+	int ret;
+	int i;
+
+	if (!ec->suspended)
+		return 0;
+
+	for (i = 0; i < 3; ++i) {
+		ret = gaokun_ec_write(ec, ec_req);
+		if (ret == 0)
+			break;
+
+		msleep(100); /* EC need time to resume */
+	};
+
+	ec->suspended = false;
+
+	return 0;
+}
+
+static void gaokun_aux_release(struct device *dev)
+{
+	struct auxiliary_device *adev = to_auxiliary_dev(dev);
+
+	kfree(adev);
+}
+
+static void gaokun_aux_remove(void *data)
+{
+	struct auxiliary_device *adev = data;
+
+	auxiliary_device_delete(adev);
+	auxiliary_device_uninit(adev);
+}
+
+static int gaokun_aux_init(struct device *parent, const char *name,
+			   struct gaokun_ec *ec)
+{
+	struct auxiliary_device *adev;
+	int ret;
+
+	adev = kzalloc(sizeof(*adev), GFP_KERNEL);
+	if (!adev)
+		return -ENOMEM;
+
+	adev->name = name;
+	adev->id = 0;
+	adev->dev.parent = parent;
+	adev->dev.release = gaokun_aux_release;
+	adev->dev.platform_data = ec;
+	/* Allow aux devices to access parent's DT nodes directly */
+	device_set_of_node_from_dev(&adev->dev, parent);
+
+	ret = auxiliary_device_init(adev);
+	if (ret) {
+		kfree(adev);
+		return ret;
+	}
+
+	ret = auxiliary_device_add(adev);
+	if (ret) {
+		auxiliary_device_uninit(adev);
+		return ret;
+	}
+
+	return devm_add_action_or_reset(parent, gaokun_aux_remove, adev);
+}
+
+/* -------------------------------------------------------------------------- */
+/* EC */
+
+static irqreturn_t gaokun_ec_irq_handler(int irq, void *data)
+{
+	struct gaokun_ec *ec = data;
+	u8 ec_req[] = MKREQ(EC_EVENT, EC_QUERY, 0);
+	u8 status, id;
+	int ret;
+
+	ret = gaokun_ec_read_byte(ec, ec_req, &id);
+	if (ret)
+		return IRQ_HANDLED;
+
+	switch (id) {
+	case 0x0: /* No event */
+		break;
+
+	case EC_EVENT_LID:
+		gaokun_ec_psy_read_byte(ec, EC_LID_STATE, &status);
+		status = EC_LID_OPEN & status;
+		input_report_switch(ec->idev, SW_LID, !status);
+		input_sync(ec->idev);
+		break;
+
+	default:
+		blocking_notifier_call_chain(&ec->notifier_list, id, ec);
+	}
+
+	return IRQ_HANDLED;
+}
+
+static int gaokun_ec_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct gaokun_ec *ec;
+	int ret;
+
+	ec = devm_kzalloc(dev, sizeof(*ec), GFP_KERNEL);
+	if (!ec)
+		return -ENOMEM;
+
+	mutex_init(&ec->lock);
+	ec->client = client;
+	i2c_set_clientdata(client, ec);
+	BLOCKING_INIT_NOTIFIER_HEAD(&ec->notifier_list);
+
+	/* Lid switch */
+	ec->idev = devm_input_allocate_device(dev);
+	if (!ec->idev)
+		return -ENOMEM;
+
+	ec->idev->name = "LID";
+	ec->idev->phys = "gaokun-ec/input0";
+	input_set_capability(ec->idev, EV_SW, SW_LID);
+
+	ret = input_register_device(ec->idev);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to register input device\n");
+
+	ret = gaokun_aux_init(dev, GAOKUN_DEV_PSY, ec);
+	if (ret)
+		return ret;
+
+	ret = gaokun_aux_init(dev, GAOKUN_DEV_UCSI, ec);
+	if (ret)
+		return ret;
+
+	ret = devm_request_threaded_irq(dev, client->irq, NULL,
+					gaokun_ec_irq_handler, IRQF_ONESHOT,
+					dev_name(dev), ec);
+	if (ret)
+		return dev_err_probe(dev, ret, "Failed to request IRQ\n");
+
+	ec->hwmon_dev = devm_hwmon_device_register_with_info(dev, "gaokun_ec_hwmon",
+							     ec, &gaokun_ec_hwmon_chip_info, NULL);
+	if (IS_ERR(ec->hwmon_dev))
+		return dev_err_probe(dev, PTR_ERR(ec->hwmon_dev),
+				     "Failed to register hwmon device\n");
+
+	return 0;
+}
+
+static const struct i2c_device_id gaokun_ec_id[] = {
+	{ "gaokun-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(i2c, gaokun_ec_id);
+
+static const struct of_device_id gaokun_ec_of_match[] = {
+	{ .compatible = "huawei,gaokun3-ec", },
+	{ }
+};
+MODULE_DEVICE_TABLE(of, gaokun_ec_of_match);
+
+static const struct dev_pm_ops gaokun_ec_pm_ops = {
+	NOIRQ_SYSTEM_SLEEP_PM_OPS(gaokun_ec_suspend, gaokun_ec_resume)
+};
+
+static struct i2c_driver gaokun_ec_driver = {
+	.driver = {
+		.name = "gaokun-ec",
+		.of_match_table = gaokun_ec_of_match,
+		.pm = &gaokun_ec_pm_ops,
+		.dev_groups = gaokun_ec_groups,
+	},
+	.probe = gaokun_ec_probe,
+	.id_table = gaokun_ec_id,
+};
+module_i2c_driver(gaokun_ec_driver);
+
+MODULE_DESCRIPTION("HUAWEI Matebook E Go EC driver");
+MODULE_AUTHOR("Pengyu Luo <mitltlatltl@gmail.com>");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/platform_data/huawei-gaokun-ec.h b/include/linux/platform_data/huawei-gaokun-ec.h
new file mode 100644
index 000000000..faa15d315
--- /dev/null
+++ b/include/linux/platform_data/huawei-gaokun-ec.h
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Huawei Matebook E Go Embedded Controller
+ *
+ * Copyright (C) 2024-2025 Pengyu Luo <mitltlatltl@gmail.com>
+ */
+
+#ifndef __HUAWEI_GAOKUN_EC_H__
+#define __HUAWEI_GAOKUN_EC_H__
+
+#define GAOKUN_UCSI_CCI_SIZE	4
+#define GAOKUN_UCSI_MSGI_SIZE	16
+#define GAOKUN_UCSI_READ_SIZE	(GAOKUN_UCSI_CCI_SIZE + GAOKUN_UCSI_MSGI_SIZE)
+#define GAOKUN_UCSI_WRITE_SIZE	24 /* 8B CTRL, 16B MSGO */
+
+#define GAOKUN_UCSI_NO_PORT_UPDATE	(-1)
+
+#define GAOKUN_SMART_CHARGE_DATA_SIZE	4 /* mode, delay, start, end */
+
+/* -------------------------------------------------------------------------- */
+
+struct gaokun_ec;
+struct gaokun_ucsi_reg;
+struct notifier_block;
+
+#define GAOKUN_MOD_NAME			"huawei_gaokun_ec"
+#define GAOKUN_DEV_PSY			"psy"
+#define GAOKUN_DEV_UCSI			"ucsi"
+
+/* -------------------------------------------------------------------------- */
+/* Common API */
+
+int gaokun_ec_register_notify(struct gaokun_ec *ec,
+			      struct notifier_block *nb);
+void gaokun_ec_unregister_notify(struct gaokun_ec *ec,
+				 struct notifier_block *nb);
+
+int gaokun_ec_read(struct gaokun_ec *ec, const u8 *req,
+		   size_t resp_len, u8 *resp);
+int gaokun_ec_write(struct gaokun_ec *ec, const u8 *req);
+int gaokun_ec_read_byte(struct gaokun_ec *ec, const u8 *req, u8 *byte);
+
+/* -------------------------------------------------------------------------- */
+/* API for PSY */
+
+int gaokun_ec_psy_multi_read(struct gaokun_ec *ec, u8 reg,
+			     size_t resp_len, u8 *resp);
+
+static inline int gaokun_ec_psy_read_byte(struct gaokun_ec *ec,
+					  u8 reg, u8 *byte)
+{
+	return gaokun_ec_psy_multi_read(ec, reg, sizeof(*byte), byte);
+}
+
+static inline int gaokun_ec_psy_read_word(struct gaokun_ec *ec,
+					  u8 reg, u16 *word)
+{
+	return gaokun_ec_psy_multi_read(ec, reg, sizeof(*word), (u8 *)word);
+}
+
+int gaokun_ec_psy_get_smart_charge(struct gaokun_ec *ec,
+				   u8 resp[GAOKUN_SMART_CHARGE_DATA_SIZE]);
+int gaokun_ec_psy_set_smart_charge(struct gaokun_ec *ec,
+				   const u8 req[GAOKUN_SMART_CHARGE_DATA_SIZE]);
+
+int gaokun_ec_psy_get_smart_charge_enable(struct gaokun_ec *ec, bool *on);
+int gaokun_ec_psy_set_smart_charge_enable(struct gaokun_ec *ec, bool on);
+
+/* -------------------------------------------------------------------------- */
+/* API for UCSI */
+
+int gaokun_ec_ucsi_read(struct gaokun_ec *ec, u8 resp[GAOKUN_UCSI_READ_SIZE]);
+int gaokun_ec_ucsi_write(struct gaokun_ec *ec,
+			 const u8 req[GAOKUN_UCSI_WRITE_SIZE]);
+
+int gaokun_ec_ucsi_get_reg(struct gaokun_ec *ec, struct gaokun_ucsi_reg *ureg);
+int gaokun_ec_ucsi_pan_ack(struct gaokun_ec *ec, int port_id);
+
+#endif /* __HUAWEI_GAOKUN_EC_H__ */
-- 
2.47.1


