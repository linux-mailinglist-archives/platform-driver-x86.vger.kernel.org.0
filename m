Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 7E7E4598B83
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Aug 2022 20:44:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345277AbiHRSop (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Aug 2022 14:44:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345511AbiHRSoJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Aug 2022 14:44:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62B5E2B26E
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2022 11:44:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660848245;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jpflnsf1s2EdItaJ8UhWHU/qVBOIocLHPCDePehRFbU=;
        b=bVF15KcuZ9QDCWvUNz5pTLHBRWELw9SOHgvv85We3ulyHWkbZXT1LAyb65XXxwzviUES/6
        U+H1VPHE2mtZobdGFkXT56eZJ3xB82/CWV9hzznKXaxMlMuSdWzqiS5USfDiV9TylurzXj
        NwJdNdm7SPT5bXg7gNeC0llSkBaTxUA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-198-NkM2hbK6OZSbMZzr9sUCfQ-1; Thu, 18 Aug 2022 14:43:52 -0400
X-MC-Unique: NkM2hbK6OZSbMZzr9sUCfQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5EEE811E76;
        Thu, 18 Aug 2022 18:43:50 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3351D492C3B;
        Thu, 18 Aug 2022 18:43:47 +0000 (UTC)
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
Subject: [PATCH v3 09/31] ACPI: video: Make backlight class device registration a separate step (v2)
Date:   Thu, 18 Aug 2022 20:42:40 +0200
Message-Id: <20220818184302.10051-10-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On x86/ACPI boards the acpi_video driver will usually initialize before
the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
to show up and then the kms driver registers its own native backlight
device after which the drivers/acpi/video_detect.c code unregisters
the acpi_video0 device (when acpi_video_get_backlight_type()==native).

This means that userspace briefly sees 2 devices and the disappearing of
acpi_video0 after a brief time confuses the systemd backlight level
save/restore code, see e.g.:
https://bbs.archlinux.org/viewtopic.php?id=269920

To fix this make backlight class device registration a separate step
done by a new acpi_video_register_backlight() function. The intend is for
this to be called by the drm/kms driver *after* it is done setting up its
own native backlight device. So that acpi_video_get_backlight_type() knows
if a native backlight will be available or not at acpi_video backlight
registration time, avoiding the add + remove dance.

Note the new acpi_video_register_backlight() function is also called from
a delayed work to ensure that the acpi_video backlight devices does get
registered if necessary even if there is no drm/kms driver or when it is
disabled.

Changes in v2:
- Make register_backlight_delay a module parameter, mainly so that it can
  be disabled by Nvidia binary driver users

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/acpi_video.c | 50 ++++++++++++++++++++++++++++++++++++---
 include/acpi/video.h      |  2 ++
 2 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
index 8545bf94866f..09dd86f86cf3 100644
--- a/drivers/acpi/acpi_video.c
+++ b/drivers/acpi/acpi_video.c
@@ -73,6 +73,16 @@ module_param(device_id_scheme, bool, 0444);
 static int only_lcd = -1;
 module_param(only_lcd, int, 0444);
 
+/*
+ * Display probing is known to take up to 5 seconds, so delay the fallback
+ * backlight registration by 5 seconds + 3 seconds for some extra margin.
+ */
+static int register_backlight_delay = 8;
+module_param(register_backlight_delay, int, 0444);
+MODULE_PARM_DESC(register_backlight_delay,
+	"Delay in seconds before doing fallback (non GPU driver triggered) "
+	"backlight registration, set to 0 to disable.");
+
 static bool may_report_brightness_keys;
 static int register_count;
 static DEFINE_MUTEX(register_count_mutex);
@@ -81,6 +91,9 @@ static LIST_HEAD(video_bus_head);
 static int acpi_video_bus_add(struct acpi_device *device);
 static int acpi_video_bus_remove(struct acpi_device *device);
 static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
+static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
+static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
+			    acpi_video_bus_register_backlight_work);
 void acpi_video_detect_exit(void);
 
 /*
@@ -1859,8 +1872,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
 	if (video->backlight_registered)
 		return 0;
 
-	acpi_video_run_bcl_for_osi(video);
-
 	if (acpi_video_get_backlight_type() != acpi_backlight_video)
 		return 0;
 
@@ -2086,7 +2097,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
 	list_add_tail(&video->entry, &video_bus_head);
 	mutex_unlock(&video_list_lock);
 
-	acpi_video_bus_register_backlight(video);
+	/*
+	 * The userspace visible backlight_device gets registered separately
+	 * from acpi_video_register_backlight().
+	 */
+	acpi_video_run_bcl_for_osi(video);
 	acpi_video_bus_add_notify_handler(video);
 
 	return 0;
@@ -2125,6 +2140,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
 	return 0;
 }
 
+static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
+{
+	acpi_video_register_backlight();
+}
+
 static int __init is_i740(struct pci_dev *dev)
 {
 	if (dev->device == 0x00D1)
@@ -2235,6 +2255,18 @@ int acpi_video_register(void)
 	 */
 	register_count = 1;
 
+	/*
+	 * acpi_video_bus_add() skips registering the userspace visible
+	 * backlight_device. The intend is for this to be registered by the
+	 * drm/kms driver calling acpi_video_register_backlight() *after* it is
+	 * done setting up its own native backlight device. The delayed work
+	 * ensures that acpi_video_register_backlight() always gets called
+	 * eventually, in case there is no drm/kms driver or it is disabled.
+	 */
+	if (register_backlight_delay)
+		schedule_delayed_work(&video_bus_register_backlight_work,
+				      register_backlight_delay * HZ);
+
 leave:
 	mutex_unlock(&register_count_mutex);
 	return ret;
@@ -2245,6 +2277,7 @@ void acpi_video_unregister(void)
 {
 	mutex_lock(&register_count_mutex);
 	if (register_count) {
+		cancel_delayed_work_sync(&video_bus_register_backlight_work);
 		acpi_bus_unregister_driver(&acpi_video_bus);
 		register_count = 0;
 		may_report_brightness_keys = false;
@@ -2253,6 +2286,17 @@ void acpi_video_unregister(void)
 }
 EXPORT_SYMBOL(acpi_video_unregister);
 
+void acpi_video_register_backlight(void)
+{
+	struct acpi_video_bus *video;
+
+	mutex_lock(&video_list_lock);
+	list_for_each_entry(video, &video_bus_head, entry)
+		acpi_video_bus_register_backlight(video);
+	mutex_unlock(&video_list_lock);
+}
+EXPORT_SYMBOL(acpi_video_register_backlight);
+
 void acpi_video_unregister_backlight(void)
 {
 	struct acpi_video_bus *video;
diff --git a/include/acpi/video.h b/include/acpi/video.h
index 4705e339c252..0625806d3bbd 100644
--- a/include/acpi/video.h
+++ b/include/acpi/video.h
@@ -53,6 +53,7 @@ enum acpi_backlight_type {
 #if IS_ENABLED(CONFIG_ACPI_VIDEO)
 extern int acpi_video_register(void);
 extern void acpi_video_unregister(void);
+extern void acpi_video_register_backlight(void);
 extern int acpi_video_get_edid(struct acpi_device *device, int type,
 			       int device_id, void **edid);
 extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
@@ -69,6 +70,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
 #else
 static inline int acpi_video_register(void) { return -ENODEV; }
 static inline void acpi_video_unregister(void) { return; }
+static inline void acpi_video_register_backlight(void) { return; }
 static inline int acpi_video_get_edid(struct acpi_device *device, int type,
 				      int device_id, void **edid)
 {
-- 
2.37.2

