Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DC3A336E13E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 28 Apr 2021 23:53:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231600AbhD1Vy2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 28 Apr 2021 17:54:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:30711 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231437AbhD1Vy1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Apr 2021 17:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1619646821;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=84AyT610JogPehscXmKC2hyPnXr/+FDWp3iPL2nfdC4=;
        b=A8eLOE2j0msYQfirngrHS9k0HKx7zsi8tiClvKjK6lgys0mD1hSmpgN7tmRJ1mDokgg1ts
        cbjbqEW9PGRhvvCcmY/oBNr/KW91J7JfswWLuif38GgEUEj36uMqf2yRwIRXNK7MZbTCO1
        gEFMp+CIj92HI2rYqBHqow74DHlapLA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-93-8FhVMqx7P9mep6LeSQ9UMQ-1; Wed, 28 Apr 2021 17:53:39 -0400
X-MC-Unique: 8FhVMqx7P9mep6LeSQ9UMQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 7232D501E0;
        Wed, 28 Apr 2021 21:53:37 +0000 (UTC)
Received: from x1.localdomain (ovpn-115-166.ams2.redhat.com [10.36.115.166])
        by smtp.corp.redhat.com (Postfix) with ESMTP id C53B45C1BB;
        Wed, 28 Apr 2021 21:53:32 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org
Subject: [PATCH 8/9] usb: typec: altmodes/displayport: Notify drm subsys of hotplug events
Date:   Wed, 28 Apr 2021 23:52:56 +0200
Message-Id: <20210428215257.500088-9-hdegoede@redhat.com>
In-Reply-To: <20210428215257.500088-1-hdegoede@redhat.com>
References: <20210428215257.500088-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Use the new drm_connector_find_by_fwnode() and
drm_connector_oob_hotplug_event() functions to let drm/kms drivers
know about DisplayPort over Type-C hotplug events.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/usb/typec/altmodes/displayport.c | 45 +++++++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/drivers/usb/typec/altmodes/displayport.c b/drivers/usb/typec/altmodes/displayport.c
index aa669b9cf70e..c95ccd2a965c 100644
--- a/drivers/usb/typec/altmodes/displayport.c
+++ b/drivers/usb/typec/altmodes/displayport.c
@@ -11,8 +11,10 @@
 #include <linux/delay.h>
 #include <linux/mutex.h>
 #include <linux/module.h>
+#include <linux/property.h>
 #include <linux/usb/pd_vdo.h>
 #include <linux/usb/typec_dp.h>
+#include <drm/drm_connector.h>
 #include "displayport.h"
 
 #define DP_HEADER(_dp, ver, cmd)	(VDO((_dp)->alt->svid, 1, ver, cmd)	\
@@ -62,12 +64,35 @@ struct dp_altmode {
 	struct work_struct work;
 	struct typec_altmode *alt;
 	const struct typec_altmode *port;
+	struct fwnode_handle *connector_fwnode;
 };
 
+static void dp_altmode_notify_connector(struct dp_altmode *dp)
+{
+	struct drm_connector_oob_hotplug_event_data data = { };
+	u8 pin_assign = DP_CONF_GET_PIN_ASSIGN(dp->data.conf);
+	struct drm_connector *connector;
+
+	data.connected = dp->data.status & DP_STATUS_HPD_STATE;
+	data.orientation = typec_altmode_get_orientation(dp->alt);
+
+	if (pin_assign & DP_PIN_ASSIGN_DP_ONLY_MASK)
+		data.dp_lanes = 4;
+	else if (pin_assign & DP_PIN_ASSIGN_MULTI_FUNC_MASK)
+		data.dp_lanes = 2;
+
+	connector = drm_connector_find_by_fwnode(dp->connector_fwnode);
+	if (connector) {
+		drm_connector_oob_hotplug_event(connector, &data);
+		drm_connector_put(connector);
+	}
+}
+
 static int dp_altmode_notify(struct dp_altmode *dp)
 {
 	unsigned long conf;
 	u8 state;
+	int ret;
 
 	if (dp->data.conf) {
 		state = get_count_order(DP_CONF_GET_PIN_ASSIGN(dp->data.conf));
@@ -76,7 +101,12 @@ static int dp_altmode_notify(struct dp_altmode *dp)
 		conf = TYPEC_STATE_USB;
 	}
 
-	return typec_altmode_notify(dp->alt, conf, &dp->data);
+	ret = typec_altmode_notify(dp->alt, conf, &dp->data);
+	if (ret)
+		return ret;
+
+	dp_altmode_notify_connector(dp);
+	return 0;
 }
 
 static int dp_altmode_configure(struct dp_altmode *dp, u8 con)
@@ -512,6 +542,7 @@ static const struct attribute_group dp_altmode_group = {
 int dp_altmode_probe(struct typec_altmode *alt)
 {
 	const struct typec_altmode *port = typec_altmode_get_partner(alt);
+	struct fwnode_handle *fwnode;
 	struct dp_altmode *dp;
 	int ret;
 
@@ -540,6 +571,11 @@ int dp_altmode_probe(struct typec_altmode *alt)
 	alt->desc = "DisplayPort";
 	alt->ops = &dp_altmode_ops;
 
+	fwnode = dev_fwnode(alt->dev.parent->parent); /* typec_port fwnode */
+	dp->connector_fwnode = fwnode_find_reference(fwnode, "displayport", 0);
+	if (IS_ERR(dp->connector_fwnode))
+		dp->connector_fwnode = NULL;
+
 	typec_altmode_set_drvdata(alt, dp);
 
 	dp->state = DP_STATE_ENTER;
@@ -555,6 +591,13 @@ void dp_altmode_remove(struct typec_altmode *alt)
 
 	sysfs_remove_group(&alt->dev.kobj, &dp_altmode_group);
 	cancel_work_sync(&dp->work);
+
+	if (dp->connector_fwnode) {
+		dp->data.conf = 0;
+		dp->data.status = 0;
+		dp_altmode_notify_connector(dp);
+		fwnode_handle_put(dp->connector_fwnode);
+	}
 }
 EXPORT_SYMBOL_GPL(dp_altmode_remove);
 
-- 
2.31.1

