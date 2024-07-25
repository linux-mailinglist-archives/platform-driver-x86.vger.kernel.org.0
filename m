Return-Path: <platform-driver-x86+bounces-4497-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 83FEA93BEEF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2024 11:21:36 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 01DD21F21EF6
	for <lists+platform-driver-x86@lfdr.de>; Thu, 25 Jul 2024 09:21:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4768C197549;
	Thu, 25 Jul 2024 09:21:28 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from irl.hu (irl.hu [95.85.9.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6347413A414;
	Thu, 25 Jul 2024 09:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.85.9.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721899288; cv=none; b=HOyDkXYLxw7HJkQXSYLPxJeSLn4VhSt8qeJmI3bRBC4QKssGwIiv5cAtDSjHuwxPjUl+f/FoZ49YWrT22qxrkYaUy7iCUit/i1jX10nJaM34drbfcCdxA21CuJUWK0Vwrfy6I8TJNPLsH+klqQi9yMlcjEl7XNoBKW9p/e2Kmk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721899288; c=relaxed/simple;
	bh=a9vBGNmJGomkoxr7T/+KLKPhgbUvk+rhzAOQQANLPd8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=OhkzxJsoUHomGYemjFItC94eRQbw8aAkrk9GAOYdmHquydn5291oT4mF8w0U9TezU6SmgdS+VeInN5pEQwlKZRthJK38JPDU1RCOMAPsmnbRjowRI8WtW9TeUBIOsN0/xtJ1NauA3JW5EMLkvlEilc0U77+v5QFhXnopPVkH3Os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu; spf=pass smtp.mailfrom=irl.hu; arc=none smtp.client-ip=95.85.9.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=irl.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=irl.hu
Received: from fedori.lan (51b68624.dsl.pool.telekom.hu [::ffff:81.182.134.36])
  (AUTH: CRAM-MD5 soyer@irl.hu, )
  by irl.hu with ESMTPSA
  id 0000000000073A97.0000000066A2190F.0018F38C; Thu, 25 Jul 2024 11:21:19 +0200
From: Gergo Koteles <soyer@irl.hu>
To: Hans de Goede <hdegoede@redhat.com>,
  =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
  Ike Panhc <ike.pan@canonical.com>
Cc: platform-driver-x86@vger.kernel.org,
  linux-kernel@vger.kernel.org, Gergo Koteles <soyer@irl.hu>
Subject: [PATCH v4 3/4] platform/x86: ideapad-laptop: move ACPI helpers from header to source file
Date: Thu, 25 Jul 2024 11:21:09 +0200
Message-ID: <57a48d2582b567f6c6fbcd3b379e17aee0fb5a94.1721898747.git.soyer@irl.hu>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721898747.git.soyer@irl.hu>
References: <cover.1721898747.git.soyer@irl.hu>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Since moving ymc_trigger_ec from lenovo-ymc to ideapad-laptop, only the
latter uses these definitions and functions.

Move them back to source file.

Signed-off-by: Gergo Koteles <soyer@irl.hu>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
 drivers/platform/x86/ideapad-laptop.c | 136 +++++++++++++++++++++++++
 drivers/platform/x86/ideapad-laptop.h | 139 --------------------------
 2 files changed, 136 insertions(+), 139 deletions(-)

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
index 9fc1bb990e47..8398774cdfe2 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -22,6 +22,7 @@
 #include <linux/init.h>
 #include <linux/input.h>
 #include <linux/input/sparse-keymap.h>
+#include <linux/jiffies.h>
 #include <linux/kernel.h>
 #include <linux/leds.h>
 #include <linux/module.h>
@@ -87,6 +88,34 @@ enum {
 	SALS_FNLOCK_OFF       = 0xf,
 };
 
+enum {
+	VPCCMD_R_VPC1 = 0x10,
+	VPCCMD_R_BL_MAX,
+	VPCCMD_R_BL,
+	VPCCMD_W_BL,
+	VPCCMD_R_WIFI,
+	VPCCMD_W_WIFI,
+	VPCCMD_R_BT,
+	VPCCMD_W_BT,
+	VPCCMD_R_BL_POWER,
+	VPCCMD_R_NOVO,
+	VPCCMD_R_VPC2,
+	VPCCMD_R_TOUCHPAD,
+	VPCCMD_W_TOUCHPAD,
+	VPCCMD_R_CAMERA,
+	VPCCMD_W_CAMERA,
+	VPCCMD_R_3G,
+	VPCCMD_W_3G,
+	VPCCMD_R_ODD, /* 0x21 */
+	VPCCMD_W_FAN,
+	VPCCMD_R_RF,
+	VPCCMD_W_RF,
+	VPCCMD_W_YMC = 0x2A,
+	VPCCMD_R_FAN = 0x2B,
+	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
+	VPCCMD_W_BL_POWER = 0x33,
+};
+
 /*
  * These correspond to the number of supported states - 1
  * Future keyboard types may need a new system, if there's a collision
@@ -236,6 +265,7 @@ static void ideapad_shared_exit(struct ideapad_private *priv)
 /*
  * ACPI Helpers
  */
+#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
 
 static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
 {
@@ -251,6 +281,29 @@ static int eval_int(acpi_handle handle, const char *name, unsigned long *res)
 	return 0;
 }
 
+static int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg,
+			     unsigned long *res)
+{
+	struct acpi_object_list params;
+	unsigned long long result;
+	union acpi_object in_obj;
+	acpi_status status;
+
+	params.count = 1;
+	params.pointer = &in_obj;
+	in_obj.type = ACPI_TYPE_INTEGER;
+	in_obj.integer.value = arg;
+
+	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	if (res)
+		*res = result;
+
+	return 0;
+}
+
 static int exec_simple_method(acpi_handle handle, const char *name, unsigned long arg)
 {
 	acpi_status status = acpi_execute_simple_method(handle, (char *)name, arg);
@@ -293,6 +346,89 @@ static int eval_dytc(acpi_handle handle, unsigned long cmd, unsigned long *res)
 	return eval_int_with_arg(handle, "DYTC", cmd, res);
 }
 
+static int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
+{
+	return eval_int_with_arg(handle, "VPCR", cmd, res);
+}
+
+static int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	struct acpi_object_list params;
+	union acpi_object in_obj[2];
+	acpi_status status;
+
+	params.count = 2;
+	params.pointer = in_obj;
+	in_obj[0].type = ACPI_TYPE_INTEGER;
+	in_obj[0].integer.value = cmd;
+	in_obj[1].type = ACPI_TYPE_INTEGER;
+	in_obj[1].integer.value = data;
+
+	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
+	if (ACPI_FAILURE(status))
+		return -EIO;
+
+	return 0;
+}
+
+static int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return eval_vpcr(handle, 0, data);
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
+static int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
+{
+	unsigned long end_jiffies, val;
+	int err;
+
+	err = eval_vpcw(handle, 0, data);
+	if (err)
+		return err;
+
+	err = eval_vpcw(handle, 1, cmd);
+	if (err)
+		return err;
+
+	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
+
+	while (time_before(jiffies, end_jiffies)) {
+		schedule();
+
+		err = eval_vpcr(handle, 1, &val);
+		if (err)
+			return err;
+
+		if (val == 0)
+			return 0;
+	}
+
+	acpi_handle_err(handle, "timeout in %s\n", __func__);
+
+	return -ETIMEDOUT;
+}
+
 /*
  * debugfs
  */
diff --git a/drivers/platform/x86/ideapad-laptop.h b/drivers/platform/x86/ideapad-laptop.h
index 948cc61800a9..1e52f2aa0aac 100644
--- a/drivers/platform/x86/ideapad-laptop.h
+++ b/drivers/platform/x86/ideapad-laptop.h
@@ -9,9 +9,6 @@
 #ifndef _IDEAPAD_LAPTOP_H_
 #define _IDEAPAD_LAPTOP_H_
 
-#include <linux/acpi.h>
-#include <linux/jiffies.h>
-#include <linux/errno.h>
 #include <linux/notifier.h>
 
 enum ideapad_laptop_notifier_actions {
@@ -22,140 +19,4 @@ int ideapad_laptop_register_notifier(struct notifier_block *nb);
 int ideapad_laptop_unregister_notifier(struct notifier_block *nb);
 void ideapad_laptop_call_notifier(unsigned long action, void *data);
 
-enum {
-	VPCCMD_R_VPC1 = 0x10,
-	VPCCMD_R_BL_MAX,
-	VPCCMD_R_BL,
-	VPCCMD_W_BL,
-	VPCCMD_R_WIFI,
-	VPCCMD_W_WIFI,
-	VPCCMD_R_BT,
-	VPCCMD_W_BT,
-	VPCCMD_R_BL_POWER,
-	VPCCMD_R_NOVO,
-	VPCCMD_R_VPC2,
-	VPCCMD_R_TOUCHPAD,
-	VPCCMD_W_TOUCHPAD,
-	VPCCMD_R_CAMERA,
-	VPCCMD_W_CAMERA,
-	VPCCMD_R_3G,
-	VPCCMD_W_3G,
-	VPCCMD_R_ODD, /* 0x21 */
-	VPCCMD_W_FAN,
-	VPCCMD_R_RF,
-	VPCCMD_W_RF,
-	VPCCMD_W_YMC = 0x2A,
-	VPCCMD_R_FAN = 0x2B,
-	VPCCMD_R_SPECIAL_BUTTONS = 0x31,
-	VPCCMD_W_BL_POWER = 0x33,
-};
-
-static inline int eval_int_with_arg(acpi_handle handle, const char *name, unsigned long arg, unsigned long *res)
-{
-	struct acpi_object_list params;
-	unsigned long long result;
-	union acpi_object in_obj;
-	acpi_status status;
-
-	params.count = 1;
-	params.pointer = &in_obj;
-	in_obj.type = ACPI_TYPE_INTEGER;
-	in_obj.integer.value = arg;
-
-	status = acpi_evaluate_integer(handle, (char *)name, &params, &result);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	if (res)
-		*res = result;
-
-	return 0;
-}
-
-static inline int eval_vpcr(acpi_handle handle, unsigned long cmd, unsigned long *res)
-{
-	return eval_int_with_arg(handle, "VPCR", cmd, res);
-}
-
-static inline int eval_vpcw(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	struct acpi_object_list params;
-	union acpi_object in_obj[2];
-	acpi_status status;
-
-	params.count = 2;
-	params.pointer = in_obj;
-	in_obj[0].type = ACPI_TYPE_INTEGER;
-	in_obj[0].integer.value = cmd;
-	in_obj[1].type = ACPI_TYPE_INTEGER;
-	in_obj[1].integer.value = data;
-
-	status = acpi_evaluate_object(handle, "VPCW", &params, NULL);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	return 0;
-}
-
-#define IDEAPAD_EC_TIMEOUT 200 /* in ms */
-
-static inline int read_ec_data(acpi_handle handle, unsigned long cmd, unsigned long *data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return eval_vpcr(handle, 0, data);
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
-static inline int write_ec_cmd(acpi_handle handle, unsigned long cmd, unsigned long data)
-{
-	unsigned long end_jiffies, val;
-	int err;
-
-	err = eval_vpcw(handle, 0, data);
-	if (err)
-		return err;
-
-	err = eval_vpcw(handle, 1, cmd);
-	if (err)
-		return err;
-
-	end_jiffies = jiffies + msecs_to_jiffies(IDEAPAD_EC_TIMEOUT) + 1;
-
-	while (time_before(jiffies, end_jiffies)) {
-		schedule();
-
-		err = eval_vpcr(handle, 1, &val);
-		if (err)
-			return err;
-
-		if (val == 0)
-			return 0;
-	}
-
-	acpi_handle_err(handle, "timeout in %s\n", __func__);
-
-	return -ETIMEDOUT;
-}
-
-#undef IDEAPAD_EC_TIMEOUT
 #endif /* !_IDEAPAD_LAPTOP_H_ */
-- 
2.45.2


