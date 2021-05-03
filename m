Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8DB6837184C
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 May 2021 17:47:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbhECPsD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 May 2021 11:48:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:24939 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230448AbhECPsD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 May 2021 11:48:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1620056829;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hb5sRV3iNQMvKZ9GShchiL/+52Gorb6AB63dpZAQ8n8=;
        b=h4WVsozn8v8RnNLislK/Rrmwasojo4+ciUeuhwy7lF62LSUK0ZnTxHaGtOhEQ61F1KD5HC
        Qre8vxkCoIZjsMx4QEhGiS1W3Il4YMV811mzmky67BIR5GVo7yjEZ2ouHGaI7M3G2k6pj+
        yBIamFmcaiiQSfjUPF8YFMseCWolPTU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-121-HQCXiiOfM6u4kXj5NFdVqA-1; Mon, 03 May 2021 11:47:07 -0400
X-MC-Unique: HQCXiiOfM6u4kXj5NFdVqA-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 9C042801F98;
        Mon,  3 May 2021 15:47:04 +0000 (UTC)
Received: from x1.localdomain (ovpn-112-158.ams2.redhat.com [10.36.112.158])
        by smtp.corp.redhat.com (Postfix) with ESMTP id D9E5E1007610;
        Mon,  3 May 2021 15:47:01 +0000 (UTC)
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
Subject: [PATCH 4/9] drm/connector: Add support for out-of-band hotplug notification (v2)
Date:   Mon,  3 May 2021 17:46:42 +0200
Message-Id: <20210503154647.142551-5-hdegoede@redhat.com>
In-Reply-To: <20210503154647.142551-1-hdegoede@redhat.com>
References: <20210503154647.142551-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a new drm_connector_oob_hotplug_event() function and
oob_hotplug_event drm_connector_funcs member.

On some hardware a hotplug event notification may come from outside the
display driver / device. An example of this is some USB Type-C setups
where the hardware muxes the DisplayPort data and aux-lines but does
not pass the altmode HPD status bit to the GPU's DP HPD pin.

In cases like this the new drm_connector_oob_hotplug_event() function can
be used to report these out-of-band events.

Changes in v2:
- Make drm_connector_oob_hotplug_event() take a fwnode as argument and
  have it call drm_connector_find_by_fwnode() internally. This allows
  making drm_connector_find_by_fwnode() a drm-internal function and
  avoids code outside the drm subsystem potentially holding on the
  a drm_connector reference for a longer period.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/drm_connector.c | 29 +++++++++++++++++++++++++++++
 include/drm/drm_connector.h     | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 62 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index ef759d6add81..b5e09d751694 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -2726,6 +2726,35 @@ struct drm_connector *drm_connector_find_by_fwnode(struct fwnode_handle *fwnode)
 	return found;
 }
 
+/**
+ * drm_connector_oob_hotplug_event - Report out-of-band hotplug event to connector
+ * @connector: connector to report the event on
+ * @data: data related to the event
+ *
+ * On some hardware a hotplug event notification may come from outside the display
+ * driver / device. An example of this is some USB Type-C setups where the hardware
+ * muxes the DisplayPort data and aux-lines but does not pass the altmode HPD
+ * status bit to the GPU's DP HPD pin.
+ *
+ * This function can be used to report these out-of-band events after obtaining
+ * a drm_connector reference through calling drm_connector_find_by_fwnode().
+ */
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     struct drm_connector_oob_hotplug_event_data *data)
+{
+	struct drm_connector *connector;
+
+	connector = drm_connector_find_by_fwnode(connector_fwnode);
+	if (IS_ERR(connector))
+		return;
+
+	if (connector->funcs->oob_hotplug_event)
+		connector->funcs->oob_hotplug_event(connector, data);
+
+	drm_connector_put(connector);
+}
+EXPORT_SYMBOL(drm_connector_oob_hotplug_event);
+
 
 /**
  * DOC: Tile group
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index ae377354e48e..bb61aeb9ba2d 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -27,6 +27,7 @@
 #include <linux/llist.h>
 #include <linux/ctype.h>
 #include <linux/hdmi.h>
+#include <linux/usb/typec.h> /* For enum typec_orientation */
 #include <drm/drm_mode_object.h>
 #include <drm/drm_util.h>
 
@@ -649,6 +650,27 @@ struct drm_connector_tv_margins {
 	unsigned int top;
 };
 
+/**
+ * struct drm_connector_oob_hotplug_event_data: OOB hotplug event data
+ *
+ * Contains data about out-of-band hotplug events, signalled through
+ * drm_connector_oob_hotplug_event().
+ */
+struct drm_connector_oob_hotplug_event_data {
+	/**
+	 * @connected: New connected status for the connector.
+	 */
+	bool connected;
+	/**
+	 * @dp_lanes: Number of available displayport lanes, 0 if unknown.
+	 */
+	int dp_lanes;
+	/**
+	 * @orientation: Connector orientation.
+	 */
+	enum typec_orientation orientation;
+};
+
 /**
  * struct drm_tv_connector_state - TV connector related states
  * @subconnector: selected subconnector
@@ -1110,6 +1132,15 @@ struct drm_connector_funcs {
 	 */
 	void (*atomic_print_state)(struct drm_printer *p,
 				   const struct drm_connector_state *state);
+
+	/**
+	 * @oob_hotplug_event:
+	 *
+	 * This will get called when a hotplug-event for a drm-connector
+	 * has been received from a source outside the display driver / device.
+	 */
+	void (*oob_hotplug_event)(struct drm_connector *connector,
+				  struct drm_connector_oob_hotplug_event_data *data);
 };
 
 /**
@@ -1704,6 +1735,8 @@ drm_connector_is_unregistered(struct drm_connector *connector)
 		DRM_CONNECTOR_UNREGISTERED;
 }
 
+void drm_connector_oob_hotplug_event(struct fwnode_handle *connector_fwnode,
+				     struct drm_connector_oob_hotplug_event_data *data);
 const char *drm_get_connector_type_name(unsigned int connector_type);
 const char *drm_get_connector_status_name(enum drm_connector_status status);
 const char *drm_get_subpixel_order_name(enum subpixel_order order);
-- 
2.31.1

