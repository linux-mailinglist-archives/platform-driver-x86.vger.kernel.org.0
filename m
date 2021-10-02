Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5217741FD36
	for <lists+platform-driver-x86@lfdr.de>; Sat,  2 Oct 2021 18:37:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233444AbhJBQjE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 2 Oct 2021 12:39:04 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53316 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233656AbhJBQjE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 2 Oct 2021 12:39:04 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633192637;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3s1ISiYxVXCZxxNxsv/9LY9q5pxSjXSHsFXMtIWzB6Q=;
        b=JrgOpcMuVXYJmfsbv/QlWsezA75g0PPkHs+lcitcHAhi4xjctnGY0xfllTJP//s+wvM+mq
        ukiMtnDyUW4keGQB7AJL/R1Mm6Y8VTUpFL9XrfX/uPwjSGkX/aOc9jwbuoRq5JaJbdcXy+
        o51UE2TmURC2kQRogrpIL37Q6ZDZTdA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-74-IWUhw18YNb6X9JBgP2cJKw-1; Sat, 02 Oct 2021 12:37:06 -0400
X-MC-Unique: IWUhw18YNb6X9JBgP2cJKw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 70389814313;
        Sat,  2 Oct 2021 16:37:03 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.31])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B8DCF100763D;
        Sat,  2 Oct 2021 16:36:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 09/10] drm/i915: Add intel_modeset_probe_defer() helper
Date:   Sat,  2 Oct 2021 18:36:17 +0200
Message-Id: <20211002163618.99175-10-hdegoede@redhat.com>
In-Reply-To: <20211002163618.99175-1-hdegoede@redhat.com>
References: <20211002163618.99175-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The upcoming privacy-screen support adds another check for
deferring probe till some other drivers have bound first.

Factor out the current vga_switcheroo_client_probe_defer() check
into an intel_modeset_probe_defer() helper, so that further
probe-deferral checks can be added there.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/i915/display/intel_display.c | 13 +++++++++++++
 drivers/gpu/drm/i915/display/intel_display.h |  1 +
 drivers/gpu/drm/i915/i915_pci.c              |  9 ++-------
 3 files changed, 16 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
index 60b2bc3ad011..e67f3207ba54 100644
--- a/drivers/gpu/drm/i915/display/intel_display.c
+++ b/drivers/gpu/drm/i915/display/intel_display.c
@@ -32,6 +32,7 @@
 #include <linux/module.h>
 #include <linux/dma-resv.h>
 #include <linux/slab.h>
+#include <linux/vga_switcheroo.h>
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
@@ -12690,6 +12691,18 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
 	intel_bios_driver_remove(i915);
 }
 
+bool intel_modeset_probe_defer(struct pci_dev *pdev)
+{
+	/*
+	 * apple-gmux is needed on dual GPU MacBook Pro
+	 * to probe the panel if we're the inactive GPU.
+	 */
+	if (vga_switcheroo_client_probe_defer(pdev))
+		return true;
+
+	return false;
+}
+
 void intel_display_driver_register(struct drm_i915_private *i915)
 {
 	if (!HAS_DISPLAY(i915))
diff --git a/drivers/gpu/drm/i915/display/intel_display.h b/drivers/gpu/drm/i915/display/intel_display.h
index 3028072c2cf3..d3d34acb6c08 100644
--- a/drivers/gpu/drm/i915/display/intel_display.h
+++ b/drivers/gpu/drm/i915/display/intel_display.h
@@ -633,6 +633,7 @@ void intel_display_driver_register(struct drm_i915_private *i915);
 void intel_display_driver_unregister(struct drm_i915_private *i915);
 
 /* modesetting */
+bool intel_modeset_probe_defer(struct pci_dev *pdev);
 void intel_modeset_init_hw(struct drm_i915_private *i915);
 int intel_modeset_init_noirq(struct drm_i915_private *i915);
 int intel_modeset_init_nogem(struct drm_i915_private *i915);
diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
index d4a6a9dcf182..cf4ad648b742 100644
--- a/drivers/gpu/drm/i915/i915_pci.c
+++ b/drivers/gpu/drm/i915/i915_pci.c
@@ -22,8 +22,6 @@
  *
  */
 
-#include <linux/vga_switcheroo.h>
-
 #include <drm/drm_drv.h>
 #include <drm/i915_pciids.h>
 
@@ -1187,11 +1185,8 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
 	if (PCI_FUNC(pdev->devfn))
 		return -ENODEV;
 
-	/*
-	 * apple-gmux is needed on dual GPU MacBook Pro
-	 * to probe the panel if we're the inactive GPU.
-	 */
-	if (vga_switcheroo_client_probe_defer(pdev))
+	/* Detect if we need to wait for other drivers early on */
+	if (intel_modeset_probe_defer(pdev))
 		return -EPROBE_DEFER;
 
 	err = i915_driver_probe(pdev, ent);
-- 
2.31.1

