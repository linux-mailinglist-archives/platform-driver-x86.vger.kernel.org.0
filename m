Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2223F59F958
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Aug 2022 14:17:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237230AbiHXMRG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Aug 2022 08:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237396AbiHXMQi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 08:16:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A21596B67B
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 05:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661343390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=cg/vOljJL4aSw8w8nnt3olVddWrd1jYs43i9vGot98s=;
        b=QOfxvLZbHJH7zN6K97nZ7A07Ocg6HPnx6buCNd+iN99ij0yv3sivx3VVPv9e88xly4RzNt
        N6NLUWufYG/xIXp9B4QB6nIl41o1+qoI7QLgitYeFomuACTLNuMOdlA1iUV9N1uaSwgmv2
        jDAcrl5xEuzAXw8nj8Ka5i3wk9OBL6M=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-279-R-v5ccU8PJeUo5lfI9qNzQ-1; Wed, 24 Aug 2022 08:16:27 -0400
X-MC-Unique: R-v5ccU8PJeUo5lfI9qNzQ-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 106A485A589;
        Wed, 24 Aug 2022 12:16:26 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.193.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E761AC15BB3;
        Wed, 24 Aug 2022 12:16:21 +0000 (UTC)
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
Subject: [PATCH v4 12/31] drm/nouveau: Register ACPI video backlight when nv_backlight registration fails (v2)
Date:   Wed, 24 Aug 2022 14:15:04 +0200
Message-Id: <20220824121523.1291269-13-hdegoede@redhat.com>
In-Reply-To: <20220824121523.1291269-1-hdegoede@redhat.com>
References: <20220824121523.1291269-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,URIBL_BLOCKED
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Typically the acpi_video driver will initialize before nouveau, which
used to cause /sys/class/backlight/acpi_video0 to get registered and then
nouveau would register its own nv_backlight device later. After which
the drivers/acpi/video_detect.c code unregistered the acpi_video0 device
to avoid there being 2 backlight devices.

This means that userspace used to briefly see 2 devices and the
disappearing of acpi_video0 after a brief time confuses the systemd
backlight level save/restore code, see e.g.:
https://bbs.archlinux.org/viewtopic.php?id=269920

To fix this the ACPI video code has been modified to make backlight class
device registration a separate step, relying on the drm/kms driver to
ask for the acpi_video backlight registration after it is done setting up
its native backlight device.

Add a call to the new acpi_video_register_backlight() when native backlight
device registration has failed / was skipped to ensure that there is a
backlight device available before the drm_device gets registered with
userspace.

Changes in v2:
- Add nouveau_acpi_video_register_backlight() wrapper to avoid unresolved
  symbol errors on non X86

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_acpi.c      | 5 +++++
 drivers/gpu/drm/nouveau/nouveau_acpi.h      | 2 ++
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
 3 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.c b/drivers/gpu/drm/nouveau/nouveau_acpi.c
index 1592c9cd7750..8cf096f841a9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.c
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.c
@@ -391,3 +391,8 @@ bool nouveau_acpi_video_backlight_use_native(void)
 {
 	return acpi_video_backlight_use_native();
 }
+
+void nouveau_acpi_video_register_backlight(void)
+{
+	acpi_video_register_backlight();
+}
diff --git a/drivers/gpu/drm/nouveau/nouveau_acpi.h b/drivers/gpu/drm/nouveau/nouveau_acpi.h
index 3c666c30dfca..e39dd8b94b8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_acpi.h
+++ b/drivers/gpu/drm/nouveau/nouveau_acpi.h
@@ -12,6 +12,7 @@ void nouveau_unregister_dsm_handler(void);
 void nouveau_switcheroo_optimus_dsm(void);
 void *nouveau_acpi_edid(struct drm_device *, struct drm_connector *);
 bool nouveau_acpi_video_backlight_use_native(void);
+void nouveau_acpi_video_register_backlight(void);
 #else
 static inline bool nouveau_is_optimus(void) { return false; };
 static inline bool nouveau_is_v1_dsm(void) { return false; };
@@ -20,6 +21,7 @@ static inline void nouveau_unregister_dsm_handler(void) {}
 static inline void nouveau_switcheroo_optimus_dsm(void) {}
 static inline void *nouveau_acpi_edid(struct drm_device *dev, struct drm_connector *connector) { return NULL; }
 static inline bool nouveau_acpi_video_backlight_use_native(void) { return true; }
+static inline void nouveau_acpi_video_register_backlight(void) {}
 #endif
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d2b8f8c13db4..a614582779ca 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -436,6 +436,13 @@ nouveau_backlight_init(struct drm_connector *connector)
 
 fail_alloc:
 	kfree(bl);
+	/*
+	 * If we get here we have an internal panel, but no nv_backlight,
+	 * try registering an ACPI video backlight device instead.
+	 */
+	if (ret == 0)
+		nouveau_acpi_video_register_backlight();
+
 	return ret;
 }
 
-- 
2.37.2

