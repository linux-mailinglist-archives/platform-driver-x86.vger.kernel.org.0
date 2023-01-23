Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 32DEB677A3A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 23 Jan 2023 12:38:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbjAWLie (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 23 Jan 2023 06:38:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231441AbjAWLie (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 23 Jan 2023 06:38:34 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E4D1713533
        for <platform-driver-x86@vger.kernel.org>; Mon, 23 Jan 2023 03:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674473881;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=HLR+NIJhB4VEdLJEPq/+HjkUAAvFvRPudUPGxHVkuNY=;
        b=a7kkqK5v3oiXOk7JvAHjQUfnT4FFfxlvkP0Ovs1vH/Cs1K21oD4tf/b+XGJrOvesO+uBov
        0dT9feuyATJwsK9Fa59MJe2mQzYBW3OFPUAgv0sNCjn5c62yD4LUsxPl1z77cgNwdnBgw2
        KLObvVr/jjmuElQJqDklnmnMaCz6qDU=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-338-ZxkdyfIJO02HLRTiVO2hxg-1; Mon, 23 Jan 2023 06:37:58 -0500
X-MC-Unique: ZxkdyfIJO02HLRTiVO2hxg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6056229AB3E5;
        Mon, 23 Jan 2023 11:37:57 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.194.13])
        by smtp.corp.redhat.com (Postfix) with ESMTP id ADC17175A2;
        Mon, 23 Jan 2023 11:37:55 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Aditya Garg <gargaditya08@live.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Lukas Wunner <lukas@wunner.de>, linux-acpi@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 2/3] platform/x86: apple-gmux: Add apple_gmux_detect() helper
Date:   Mon, 23 Jan 2023 12:37:49 +0100
Message-Id: <20230123113750.462144-3-hdegoede@redhat.com>
In-Reply-To: <20230123113750.462144-1-hdegoede@redhat.com>
References: <20230123113750.462144-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new (static inline) apple_gmux_detect() helper to apple-gmux.h
which can be used for gmux detection instead of apple_gmux_present().

The latter is not really reliable since an ACPI device with a HID
of APP000B is present on some devices without a gmux at all, as well
as on devices with a newer (unsupported) MMIO based gmux model.

This causes apple_gmux_present() to return false-postives on
a number of different Apple laptop models.

This new helper uses the same probing as the actual apple-gmux
driver, so that it does not return false positives.

To avoid code duplication the gmux_probe() function of the actual
driver is also moved over to using the new apple_gmux_detect() helper.

Fixes: 21245df307cb ("ACPI: video: Add Apple GMUX brightness control detection")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/apple-gmux.c | 70 +++++++------------------
 include/linux/apple-gmux.h        | 85 ++++++++++++++++++++++++++++++-
 2 files changed, 101 insertions(+), 54 deletions(-)

diff --git a/drivers/platform/x86/apple-gmux.c b/drivers/platform/x86/apple-gmux.c
index a0af01f6a0fd..9333f82cfa8a 100644
--- a/drivers/platform/x86/apple-gmux.c
+++ b/drivers/platform/x86/apple-gmux.c
@@ -226,23 +226,6 @@ static void gmux_write32(struct apple_gmux_data *gmux_data, int port,
 		gmux_pio_write32(gmux_data, port, val);
 }
 
-static bool gmux_is_indexed(struct apple_gmux_data *gmux_data)
-{
-	u16 val;
-
-	outb(0xaa, gmux_data->iostart + 0xcc);
-	outb(0x55, gmux_data->iostart + 0xcd);
-	outb(0x00, gmux_data->iostart + 0xce);
-
-	val = inb(gmux_data->iostart + 0xcc) |
-		(inb(gmux_data->iostart + 0xcd) << 8);
-
-	if (val == 0x55aa)
-		return true;
-
-	return false;
-}
-
 /**
  * DOC: Backlight control
  *
@@ -582,60 +565,43 @@ static int gmux_probe(struct pnp_dev *pnp, const struct pnp_device_id *id)
 	int ret = -ENXIO;
 	acpi_status status;
 	unsigned long long gpe;
+	bool indexed = false;
+	u32 version;
 
 	if (apple_gmux_data)
 		return -EBUSY;
 
+	if (!apple_gmux_detect(pnp, &indexed)) {
+		pr_info("gmux device not present\n");
+		return -ENODEV;
+	}
+
 	gmux_data = kzalloc(sizeof(*gmux_data), GFP_KERNEL);
 	if (!gmux_data)
 		return -ENOMEM;
 	pnp_set_drvdata(pnp, gmux_data);
 
 	res = pnp_get_resource(pnp, IORESOURCE_IO, 0);
-	if (!res) {
-		pr_err("Failed to find gmux I/O resource\n");
-		goto err_free;
-	}
-
 	gmux_data->iostart = res->start;
 	gmux_data->iolen = resource_size(res);
 
-	if (gmux_data->iolen < GMUX_MIN_IO_LEN) {
-		pr_err("gmux I/O region too small (%lu < %u)\n",
-		       gmux_data->iolen, GMUX_MIN_IO_LEN);
-		goto err_free;
-	}
-
 	if (!request_region(gmux_data->iostart, gmux_data->iolen,
 			    "Apple gmux")) {
 		pr_err("gmux I/O already in use\n");
 		goto err_free;
 	}
 
-	/*
-	 * Invalid version information may indicate either that the gmux
-	 * device isn't present or that it's a new one that uses indexed
-	 * io
-	 */
-
-	ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
-	ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
-	ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
-	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
-		if (gmux_is_indexed(gmux_data)) {
-			u32 version;
-			mutex_init(&gmux_data->index_lock);
-			gmux_data->indexed = true;
-			version = gmux_read32(gmux_data,
-				GMUX_PORT_VERSION_MAJOR);
-			ver_major = (version >> 24) & 0xff;
-			ver_minor = (version >> 16) & 0xff;
-			ver_release = (version >> 8) & 0xff;
-		} else {
-			pr_info("gmux device not present\n");
-			ret = -ENODEV;
-			goto err_release;
-		}
+	if (indexed) {
+		mutex_init(&gmux_data->index_lock);
+		gmux_data->indexed = true;
+		version = gmux_read32(gmux_data, GMUX_PORT_VERSION_MAJOR);
+		ver_major = (version >> 24) & 0xff;
+		ver_minor = (version >> 16) & 0xff;
+		ver_release = (version >> 8) & 0xff;
+	} else {
+		ver_major = gmux_read8(gmux_data, GMUX_PORT_VERSION_MAJOR);
+		ver_minor = gmux_read8(gmux_data, GMUX_PORT_VERSION_MINOR);
+		ver_release = gmux_read8(gmux_data, GMUX_PORT_VERSION_RELEASE);
 	}
 	pr_info("Found gmux version %d.%d.%d [%s]\n", ver_major, ver_minor,
 		ver_release, (gmux_data->indexed ? "indexed" : "classic"));
diff --git a/include/linux/apple-gmux.h b/include/linux/apple-gmux.h
index 80efaaf89e07..47c04e7e3672 100644
--- a/include/linux/apple-gmux.h
+++ b/include/linux/apple-gmux.h
@@ -8,6 +8,8 @@
 #define LINUX_APPLE_GMUX_H
 
 #include <linux/acpi.h>
+#include <linux/io.h>
+#include <linux/pnp.h>
 
 #define GMUX_ACPI_HID "APP000B"
 
@@ -35,14 +37,88 @@
 #define GMUX_MIN_IO_LEN			(GMUX_PORT_BRIGHTNESS + 4)
 
 #if IS_ENABLED(CONFIG_APPLE_GMUX)
+static inline bool apple_gmux_is_indexed(unsigned long iostart)
+{
+	u16 val;
+
+	outb(0xaa, iostart + 0xcc);
+	outb(0x55, iostart + 0xcd);
+	outb(0x00, iostart + 0xce);
+
+	val = inb(iostart + 0xcc) | (inb(iostart + 0xcd) << 8);
+	if (val == 0x55aa)
+		return true;
+
+	return false;
+}
 
 /**
- * apple_gmux_present() - detect if gmux is built into the machine
+ * apple_gmux_detect() - detect if gmux is built into the machine
+ *
+ * @pnp_dev:     Device to probe or NULL to use the first matching device
+ * @indexed_ret: Returns (by reference) if the gmux is indexed or not
+ *
+ * Detect if a supported gmux device is present by actually probing it.
+ * This avoids the false positives returned on some models by
+ * apple_gmux_present().
+ *
+ * Return: %true if a supported gmux ACPI device is detected and the kernel
+ * was configured with CONFIG_APPLE_GMUX, %false otherwise.
+ */
+static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
+{
+	u8 ver_major, ver_minor, ver_release;
+	struct resource *res;
+	bool indexed = false;
+
+	if (!pnp_dev) {
+		struct acpi_device *adev;
+		struct device *dev;
+
+		adev = acpi_dev_get_first_match_dev(GMUX_ACPI_HID, NULL, -1);
+		if (!adev)
+			return false;
+
+		dev = acpi_get_first_physical_node(adev);
+		if (!dev)
+			return false;
+
+		pnp_dev = to_pnp_dev(dev);
+	}
+
+	res = pnp_get_resource(pnp_dev, IORESOURCE_IO, 0);
+	if (!res)
+		return false;
+
+	if (resource_size(res) < GMUX_MIN_IO_LEN)
+		return false;
+
+	/*
+	 * Invalid version information may indicate either that the gmux
+	 * device isn't present or that it's a new one that uses indexed io.
+	 */
+	ver_major = inb(res->start + GMUX_PORT_VERSION_MAJOR);
+	ver_minor = inb(res->start + GMUX_PORT_VERSION_MINOR);
+	ver_release = inb(res->start + GMUX_PORT_VERSION_RELEASE);
+	if (ver_major == 0xff && ver_minor == 0xff && ver_release == 0xff) {
+		indexed = apple_gmux_is_indexed(res->start);
+		if (!indexed)
+			return false;
+	}
+
+	if (indexed_ret)
+		*indexed_ret = indexed;
+
+	return true;
+}
+
+/**
+ * apple_gmux_present() - check if gmux ACPI device is present
  *
  * Drivers may use this to activate quirks specific to dual GPU MacBook Pros
  * and Mac Pros, e.g. for deferred probing, runtime pm and backlight.
  *
- * Return: %true if gmux is present and the kernel was configured
+ * Return: %true if gmux ACPI device is present and the kernel was configured
  * with CONFIG_APPLE_GMUX, %false otherwise.
  */
 static inline bool apple_gmux_present(void)
@@ -57,6 +133,11 @@ static inline bool apple_gmux_present(void)
 	return false;
 }
 
+static inline bool apple_gmux_detect(struct pnp_dev *pnp_dev, bool *indexed_ret)
+{
+	return false;
+}
+
 #endif /* !CONFIG_APPLE_GMUX */
 
 #endif /* LINUX_APPLE_GMUX_H */
-- 
2.39.0

