Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1054A598BD3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Aug 2022 20:46:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344968AbiHRSpG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Aug 2022 14:45:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37926 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344953AbiHRSoX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Aug 2022 14:44:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F7FEBB68B
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Aug 2022 11:44:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660848261;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jVycE2shiaukOep+NdAQP9qcFlliwhnz9AX6I28to1U=;
        b=FjWCEuuVD+MsysQCw63lKC3YLrkL3Vs8+WAzclqPNCt1o52/hsWI8aRswpxPG7w2IpcpR6
        mTCE7fwtkpO+czWB948KSEbx/rBWRSZw0zTnLyCDBJtq4rgnir4rs/EikB0OXZT5bMAIN0
        dhW2S9YFlpLPhcynWgaywojmbK4L7wc=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-390-n8piTmOrPemBB_W4B9yt1w-1; Thu, 18 Aug 2022 14:44:15 -0400
X-MC-Unique: n8piTmOrPemBB_W4B9yt1w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 138902932492;
        Thu, 18 Aug 2022 18:44:14 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 73FB5492C3B;
        Thu, 18 Aug 2022 18:44:10 +0000 (UTC)
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
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 15/31] platform/x86: nvidia-wmi-ec-backlight: Move fw interface definitions to a header
Date:   Thu, 18 Aug 2022 20:42:46 +0200
Message-Id: <20220818184302.10051-16-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move the WMI interface definitions to a header, so that the definitions
can be shared with drivers/acpi/video_detect.c .

Suggested-by: Daniel Dadap <ddadap@nvidia.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 MAINTAINERS                                   |  1 +
 .../platform/x86/nvidia-wmi-ec-backlight.c    | 66 +----------------
 .../x86/nvidia-wmi-ec-backlight.h             | 70 +++++++++++++++++++
 3 files changed, 72 insertions(+), 65 deletions(-)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 8a5012ba6ff9..8d59c6e9b4db 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14526,6 +14526,7 @@ M:	Daniel Dadap <ddadap@nvidia.com>
 L:	platform-driver-x86@vger.kernel.org
 S:	Supported
 F:	drivers/platform/x86/nvidia-wmi-ec-backlight.c
+F:	include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
 
 NVM EXPRESS DRIVER
 M:	Keith Busch <kbusch@kernel.org>
diff --git a/drivers/platform/x86/nvidia-wmi-ec-backlight.c b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
index 61e37194df70..e84e1d629b14 100644
--- a/drivers/platform/x86/nvidia-wmi-ec-backlight.c
+++ b/drivers/platform/x86/nvidia-wmi-ec-backlight.c
@@ -7,74 +7,10 @@
 #include <linux/backlight.h>
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
+#include <linux/platform_data/x86/nvidia-wmi-ec-backlight.h>
 #include <linux/types.h>
 #include <linux/wmi.h>
 
-/**
- * enum wmi_brightness_method - WMI method IDs
- * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
- * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
- */
-enum wmi_brightness_method {
-	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
-	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
-	WMI_BRIGHTNESS_METHOD_MAX
-};
-
-/**
- * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
- * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
- * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
- * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
- *                                      is only valid when the WMI method is
- *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
- */
-enum wmi_brightness_mode {
-	WMI_BRIGHTNESS_MODE_GET = 0,
-	WMI_BRIGHTNESS_MODE_SET = 1,
-	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
-	WMI_BRIGHTNESS_MODE_MAX
-};
-
-/**
- * enum wmi_brightness_source - Backlight brightness control source selection
- * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
- * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
- *                             system's Embedded Controller (EC).
- * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
- *                             DisplayPort AUX channel.
- */
-enum wmi_brightness_source {
-	WMI_BRIGHTNESS_SOURCE_GPU = 1,
-	WMI_BRIGHTNESS_SOURCE_EC = 2,
-	WMI_BRIGHTNESS_SOURCE_AUX = 3,
-	WMI_BRIGHTNESS_SOURCE_MAX
-};
-
-/**
- * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
- * @mode:    Pass in an &enum wmi_brightness_mode value to select between
- *           getting or setting a value.
- * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
- *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
- *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
- * @ret:     Out parameter returning retrieved value when operating in
- *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
- *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
- * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
- *
- * This is the parameters structure for the WmiBrightnessNotify ACPI method as
- * wrapped by WMI. The value passed in to @val or returned by @ret will be a
- * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
- * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
- */
-struct wmi_brightness_args {
-	u32 mode;
-	u32 val;
-	u32 ret;
-	u32 ignored[3];
-};
-
 /**
  * wmi_brightness_notify() - helper function for calling WMI-wrapped ACPI method
  * @w:    Pointer to the struct wmi_device identified by %WMI_BRIGHTNESS_GUID
diff --git a/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
new file mode 100644
index 000000000000..d83104c6c6cb
--- /dev/null
+++ b/include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h
@@ -0,0 +1,70 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
+#define __PLATFORM_DATA_X86_NVIDIA_WMI_EC_BACKLIGHT_H
+
+/**
+ * enum wmi_brightness_method - WMI method IDs
+ * @WMI_BRIGHTNESS_METHOD_LEVEL:  Get/Set EC brightness level status
+ * @WMI_BRIGHTNESS_METHOD_SOURCE: Get/Set EC Brightness Source
+ */
+enum wmi_brightness_method {
+	WMI_BRIGHTNESS_METHOD_LEVEL = 1,
+	WMI_BRIGHTNESS_METHOD_SOURCE = 2,
+	WMI_BRIGHTNESS_METHOD_MAX
+};
+
+/**
+ * enum wmi_brightness_mode - Operation mode for WMI-wrapped method
+ * @WMI_BRIGHTNESS_MODE_GET:            Get the current brightness level/source.
+ * @WMI_BRIGHTNESS_MODE_SET:            Set the brightness level.
+ * @WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL:  Get the maximum brightness level. This
+ *                                      is only valid when the WMI method is
+ *                                      %WMI_BRIGHTNESS_METHOD_LEVEL.
+ */
+enum wmi_brightness_mode {
+	WMI_BRIGHTNESS_MODE_GET = 0,
+	WMI_BRIGHTNESS_MODE_SET = 1,
+	WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL = 2,
+	WMI_BRIGHTNESS_MODE_MAX
+};
+
+/**
+ * enum wmi_brightness_source - Backlight brightness control source selection
+ * @WMI_BRIGHTNESS_SOURCE_GPU: Backlight brightness is controlled by the GPU.
+ * @WMI_BRIGHTNESS_SOURCE_EC:  Backlight brightness is controlled by the
+ *                             system's Embedded Controller (EC).
+ * @WMI_BRIGHTNESS_SOURCE_AUX: Backlight brightness is controlled over the
+ *                             DisplayPort AUX channel.
+ */
+enum wmi_brightness_source {
+	WMI_BRIGHTNESS_SOURCE_GPU = 1,
+	WMI_BRIGHTNESS_SOURCE_EC = 2,
+	WMI_BRIGHTNESS_SOURCE_AUX = 3,
+	WMI_BRIGHTNESS_SOURCE_MAX
+};
+
+/**
+ * struct wmi_brightness_args - arguments for the WMI-wrapped ACPI method
+ * @mode:    Pass in an &enum wmi_brightness_mode value to select between
+ *           getting or setting a value.
+ * @val:     In parameter for value to set when using %WMI_BRIGHTNESS_MODE_SET
+ *           mode. Not used in conjunction with %WMI_BRIGHTNESS_MODE_GET or
+ *           %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL mode.
+ * @ret:     Out parameter returning retrieved value when operating in
+ *           %WMI_BRIGHTNESS_MODE_GET or %WMI_BRIGHTNESS_MODE_GET_MAX_LEVEL
+ *           mode. Not used in %WMI_BRIGHTNESS_MODE_SET mode.
+ * @ignored: Padding; not used. The ACPI method expects a 24 byte params struct.
+ *
+ * This is the parameters structure for the WmiBrightnessNotify ACPI method as
+ * wrapped by WMI. The value passed in to @val or returned by @ret will be a
+ * brightness value when the WMI method ID is %WMI_BRIGHTNESS_METHOD_LEVEL, or
+ * an &enum wmi_brightness_source value with %WMI_BRIGHTNESS_METHOD_SOURCE.
+ */
+struct wmi_brightness_args {
+	u32 mode;
+	u32 val;
+	u32 ret;
+	u32 ignored[3];
+};
+
+#endif
-- 
2.37.2

