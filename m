Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BFE859F982
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Aug 2022 14:18:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237268AbiHXMSS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Aug 2022 08:18:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237373AbiHXMR0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 08:17:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D00FC75FF7
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 05:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661343442;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=iU57+kDoMYdFvB7lQdFql6dEi9DvKLoCSpf/eh9uMYs=;
        b=dcSPWK0fLIc0fkx7RTDXM2pCYg+hzFLDgWqg+lAua/jjHqqoxNqBsUzAuxK/yQETrPJ1NY
        E4VsWRDreXoYakleXIMS4NhMCrIiNNGJoQzOqIVYlQiXYX8eURCIcJqhJi+78xMfo2UXvL
        8CWO8Y13Hm6yszqRgCCbDdCbyI6s/8s=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-605-XKNHb25RMSCLciVbFTG8FA-1; Wed, 24 Aug 2022 08:17:17 -0400
X-MC-Unique: XKNHb25RMSCLciVbFTG8FA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 42B118041BE;
        Wed, 24 Aug 2022 12:17:16 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 57471C15BB3;
        Wed, 24 Aug 2022 12:17:12 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
        Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Pan@vger.kernel.org, Xinhui <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v4 24/31] platform/x86: asus-wmi: Move acpi_backlight=vendor quirks to ACPI video_detect.c
Date:   Wed, 24 Aug 2022 14:15:16 +0200
Message-Id: <20220824121523.1291269-25-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove the asus-wmi quirk_entry.wmi_backlight_power quirk-flag, which
called acpi_video_set_dmi_backlight_type(acpi_backlight_vendor) and replace
it with acpi/video_detect.c video_detect_dmi_table[] entries using the
video_detect_force_vendor callback.

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Note no entries are dropped from the dmi_system_id table in asus-nb-wmi.c.
This is because the entries using the removed wmi_backlight_power flag
also use other model specific quirks from the asus-wmi quirk_entry struct.
So the quirk_asus_x55u struct and the entries pointing to it cannot be
dropped.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c        | 40 ++++++++++++++++++++++++++++++
 drivers/platform/x86/asus-nb-wmi.c |  7 ------
 drivers/platform/x86/asus-wmi.c    |  3 ---
 drivers/platform/x86/asus-wmi.h    |  1 -
 drivers/platform/x86/eeepc-wmi.c   | 25 +------------------
 5 files changed, 41 insertions(+), 35 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 6a2523bc02ba..d893313fe1a0 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -174,6 +174,46 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_PRODUCT_NAME, "UL30A"),
 		},
 	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X55U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X55U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X101CH */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X401U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X401U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus X501U */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "X501U"),
+		},
+	},
+	{
+	 .callback = video_detect_force_vendor,
+	 /* Asus 1015CX */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
+		DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
+		},
+	},
 	{
 	.callback = video_detect_force_vendor,
 	/* GIGABYTE GB-BXBT-2807 */
diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 478dd300b9c9..810a94557a85 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -79,12 +79,10 @@ static struct quirk_entry quirk_asus_q500a = {
 
 /*
  * For those machines that need software to control bt/wifi status
- * and can't adjust brightness through ACPI interface
  * and have duplicate events(ACPI and WMI) for display toggle
  */
 static struct quirk_entry quirk_asus_x55u = {
 	.wapf = 4,
-	.wmi_backlight_power = true,
 	.wmi_backlight_set_devstate = true,
 	.no_display_toggle = true,
 };
@@ -147,11 +145,6 @@ static const struct dmi_system_id asus_quirks[] = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK Computer Inc."),
 			DMI_MATCH(DMI_PRODUCT_NAME, "U32U"),
 		},
-		/*
-		 * Note this machine has a Brazos APU, and most Brazos Asus
-		 * machines need quirk_asus_x55u / wmi_backlight_power but
-		 * here acpi-video seems to work fine for backlight control.
-		 */
 		.driver_data = &quirk_asus_wapf4,
 	},
 	{
diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 301166a5697d..5cf9d9aff164 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3634,9 +3634,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->wmi_force_als_set)
 		asus_wmi_set_als();
 
-	if (asus->driver->quirks->wmi_backlight_power)
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (asus->driver->quirks->wmi_backlight_native)
 		acpi_video_set_dmi_backlight_type(acpi_backlight_native);
 
diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
index b302415bf1d9..30770e411301 100644
--- a/drivers/platform/x86/asus-wmi.h
+++ b/drivers/platform/x86/asus-wmi.h
@@ -29,7 +29,6 @@ struct quirk_entry {
 	bool hotplug_wireless;
 	bool scalar_panel_brightness;
 	bool store_backlight_power;
-	bool wmi_backlight_power;
 	bool wmi_backlight_native;
 	bool wmi_backlight_set_devstate;
 	bool wmi_force_als_set;
diff --git a/drivers/platform/x86/eeepc-wmi.c b/drivers/platform/x86/eeepc-wmi.c
index ce86d84ee796..32d9f0ba6be3 100644
--- a/drivers/platform/x86/eeepc-wmi.c
+++ b/drivers/platform/x86/eeepc-wmi.c
@@ -96,11 +96,6 @@ static struct quirk_entry quirk_asus_et2012_type3 = {
 	.store_backlight_power = true,
 };
 
-static struct quirk_entry quirk_asus_x101ch = {
-	/* We need this when ACPI function doesn't do this well */
-	.wmi_backlight_power = true,
-};
-
 static struct quirk_entry *quirks;
 
 static void et2012_quirks(void)
@@ -151,25 +146,7 @@ static const struct dmi_system_id asus_quirks[] = {
 		},
 		.driver_data = &quirk_asus_unknown,
 	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK Computer INC. X101CH",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "X101CH"),
-		},
-		.driver_data = &quirk_asus_x101ch,
-	},
-	{
-		.callback = dmi_matched,
-		.ident = "ASUSTeK Computer INC. 1015CX",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_PRODUCT_NAME, "1015CX"),
-		},
-		.driver_data = &quirk_asus_x101ch,
-	},
-	{},
+	{}
 };
 
 static void eeepc_wmi_key_filter(struct asus_wmi_driver *asus_wmi, int *code,
-- 
2.37.2

