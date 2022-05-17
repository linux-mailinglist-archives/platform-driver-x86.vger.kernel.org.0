Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 800A152A676
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 May 2022 17:25:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343520AbiEQPZA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 17 May 2022 11:25:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349966AbiEQPYh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 17 May 2022 11:24:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 229BD4F478
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 May 2022 08:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652801074;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SM+oIku0zpwXMbsZmv/a6O4i1ruoS/+laftsB9Obs2M=;
        b=fcAIRi2sDRFX/x15zwiIgflnF5ZVDJYO4vVBkQSE/UTAJ1GYMNgr6RXix7g2TzxXlJsyxe
        8+YXJzvGfrkvVJZnsCIdhJKidscbrTBa7uuqNDIZaRvZ0AxaoESDSgYM9p0ejSmRKcRJPJ
        qhvMKizNDMoswejFx8tKiKhSvfCbS38=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-274-KkmTNu2UNVKcFxlJtTo1BA-1; Tue, 17 May 2022 11:24:30 -0400
X-MC-Unique: KkmTNu2UNVKcFxlJtTo1BA-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C4532999B2A;
        Tue, 17 May 2022 15:24:29 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 56387C15D5C;
        Tue, 17 May 2022 15:24:25 +0000 (UTC)
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
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, nouveau@lists.freedesktop.org,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 13/14] drm/amdgpu: Register ACPI video backlight when skipping amdgpu backlight registration
Date:   Tue, 17 May 2022 17:23:30 +0200
Message-Id: <20220517152331.16217-14-hdegoede@redhat.com>
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Typically the acpi_video driver will initialize before amdgpu, which
used to cause /sys/class/backlight/acpi_video0 to get registered and then
amdgpu would register its own amdgpu_bl# device later. After which
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

Add a call to the new acpi_video_register_backlight() when amdgpu skips
registering its own backlight device because of either the firmware_flags
or the acpi_video_get_backlight_type() return value. This ensures that
if the acpi_video backlight device should be used, it will be available
before the amdgpu drm_device gets registered with userspace.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 9 +++++++--
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 2 ++
 2 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index f9c62cd84a18..26f638ab7a5f 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -186,11 +186,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 		return;
 
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
-		return;
+		goto register_acpi_backlight;
 
 	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
 		DRM_INFO("Skipping amdgpu atom DIG backlight registration\n");
-		return;
+		goto register_acpi_backlight;
 	}
 
 	pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
@@ -227,6 +227,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 error:
 	kfree(pdata);
 	return;
+
+register_acpi_backlight:
+	/* Try registering an ACPI video backlight device instead. */
+	acpi_video_register_backlight();
+	return;
 }
 
 void
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index a838c7b5d942..06baa4f27680 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -4083,6 +4083,8 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 
 	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
 		DRM_INFO("Skipping amdgpu DM backlight registration\n");
+		/* Try registering an ACPI video backlight device instead. */
+		acpi_video_register_backlight();
 		return;
 	}
 
-- 
2.36.0

