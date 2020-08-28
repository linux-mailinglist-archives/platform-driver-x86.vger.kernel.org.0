Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A9BEB2562A9
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 23:55:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726379AbgH1Vz3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 17:55:29 -0400
Received: from forward101j.mail.yandex.net ([5.45.198.241]:51845 "EHLO
        forward101j.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726033AbgH1Vz1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 17:55:27 -0400
X-Greylist: delayed 342 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Aug 2020 17:55:26 EDT
Received: from mxback4o.mail.yandex.net (mxback4o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::1e])
        by forward101j.mail.yandex.net (Yandex) with ESMTP id 8D2191BE043D;
        Sat, 29 Aug 2020 00:49:35 +0300 (MSK)
Received: from iva7-f62245f79210.qloud-c.yandex.net (iva7-f62245f79210.qloud-c.yandex.net [2a02:6b8:c0c:2e83:0:640:f622:45f7])
        by mxback4o.mail.yandex.net (mxback/Yandex) with ESMTP id 0VTMHefo3A-nZ0OCT9H;
        Sat, 29 Aug 2020 00:49:35 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1598651375;
        bh=8zOldwg8ICaPhtaxlrvnEb8R7xTGecZiPO9GjoaQzio=;
        h=In-Reply-To:Subject:To:From:Message-Id:Cc:References:Date;
        b=Eck/zF6F44WJY5aqzu1XL7TfiyUWGOITEjpqj6wJVVKr99HjsRlLc5SaCQcYaMiR8
         Q1ofiTx7xK1AYl4bhBneC9R8DUzLUmfWrav8kOe0NTlKd9Ik//u90yahx8KoKhGN4n
         IIH6JsCLmMbauqsFCSmtH1vAutjWCR62E5gdcQbI=
Authentication-Results: mxback4o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wtE0T54V7Y-nYHWfBdh;
        Sat, 29 Aug 2020 00:49:34 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Vasiliy Kupriakov <rublag-ns@yandex.ru>
To:     Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 1/3] platform/x86: asus-wmi: Add userspace notification for performance mode change
Date:   Sat, 29 Aug 2020 00:49:30 +0300
Message-Id: <20200828214932.20866-2-rublag-ns@yandex.ru>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200828214932.20866-1-rublag-ns@yandex.ru>
References: <20200828214932.20866-1-rublag-ns@yandex.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

When user presses Fn-F5, the driver automatically changes throttle
thermal policy (or fan boost mode, depending on laptop model).

It would be convenient for userspace software to be able to poll on
corresponding sysfs variable. For example, to show a notification about
mode change.

Note that there is currently no way to handle Fn-F5 from userspace
directly, driver does not pass it.

Signed-off-by: Vasiliy Kupriakov <rublag-ns@yandex.ru>
---
 drivers/platform/x86/asus-wmi.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8f4acdc06b13..71559d429ba0 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -1660,6 +1660,10 @@ static int fan_boost_mode_write(struct asus_wmi *asus)
 	pr_info("Set fan boost mode: %u\n", value);
 	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_FAN_BOOST_MODE, value,
 				    &retval);
+
+	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
+			"fan_boost_mode");
+
 	if (err) {
 		pr_warn("Failed to set fan boost mode: %d\n", err);
 		return err;
@@ -1771,6 +1775,10 @@ static int throttle_thermal_policy_write(struct asus_wmi *asus)
 
 	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_THROTTLE_THERMAL_POLICY,
 				    value, &retval);
+
+	sysfs_notify(&asus->platform_device->dev.kobj, NULL,
+			"throttle_thermal_policy");
+
 	if (err) {
 		pr_warn("Failed to set throttle thermal policy: %d\n", err);
 		return err;
-- 
2.28.0

