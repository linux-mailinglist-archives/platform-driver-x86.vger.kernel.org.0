Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAB32CE0AC
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Dec 2020 22:28:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388464AbgLCV2I (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Dec 2020 16:28:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388412AbgLCV2I (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Dec 2020 16:28:08 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3144EC061A55;
        Thu,  3 Dec 2020 13:27:07 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id bo9so5584795ejb.13;
        Thu, 03 Dec 2020 13:27:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=17ft4aXXuAHhW1Sk08y5+HZPRua2/s46JHy7W6egiCA=;
        b=GdT9gt4PCQygC6l0p+rJJ3VVqUasutlHkNKJNXMtPBmKqLKI9Kv8AjNgrXjU09KCqO
         ILJ2ya8rJVWBdVW+O+axIaTekKDSGdC7+yHfpkTB7ohkKW9JlygJpBYRz7k7y0mwATGs
         m6UZnA80WWrG77FAhmixWaB1BS3/wkZm0idPhTM7ltqPbivO7vjZS3wROU6dQP+OBVjO
         pZuMTsuSOZ5xAWyu16t+zD8IdhnTjcSmN9V0IwsrXxTCjpozOydAnClRCZ7mocwOx/gq
         v8zq6ADHQCjD62pHwQUHCRpdTdrUm+m6aMouqGReBPaBd+VMcJkWHlnidkA00vov2+mp
         IAAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=17ft4aXXuAHhW1Sk08y5+HZPRua2/s46JHy7W6egiCA=;
        b=BWe+Woteuq7WRj7SrVY7+EzD3GAy3cgtjrViIZonwj0LtIYLk79i2VpekFOGQeheiR
         qIMjwxOAxXXhQO+/V+1TN6h07pKFmF4OVwq1JE+9XvjYCAAnkoJRB5i4NuTn4gpfhYma
         IFC5MkkLbrkzX2WP0GKTi7hVrLAod1lZhLZ4nGh9GgnSVXfNm8lHJR2PCivhg6unhRv8
         R+6wTdmkGROZ0pL4TYK1kh9JxRm7KzgKcII1JfSrS3tRvyiejKXdsNpxGagLUcyoQXvO
         qLge9QUwsWew4ZawBZ1ZBXSZFBEx7Fkd5nsjeCBCLCBDtGpmIEnCGWvXXTuZcryjKH0e
         5RsA==
X-Gm-Message-State: AOAM531SGQ/wRZ9ZolhgEVeHn1M4DLoFOc9EU/07GX+Tc1yvvOEsHK4+
        tYQ9tdDb/evtatu8voekbP/LK16maBI=
X-Google-Smtp-Source: ABdhPJw36y9QeqP/pkuP0zsDuuHevlhiAOes06fOakFN248HqPYlWxF6pbrG0G+UIfueLjIisZDyNg==
X-Received: by 2002:a17:906:6546:: with SMTP id u6mr4468440ejn.36.1607030824916;
        Thu, 03 Dec 2020 13:27:04 -0800 (PST)
Received: from xws.fritz.box (pd9e5a6ef.dip0.t-ipconnect.de. [217.229.166.239])
        by smtp.gmail.com with ESMTPSA id e3sm1656169ejq.96.2020.12.03.13.27.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Dec 2020 13:27:04 -0800 (PST)
From:   Maximilian Luz <luzmaximilian@gmail.com>
To:     linux-kernel@vger.kernel.org
Cc:     Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        =?UTF-8?q?Barnab=C3=A1s=20P=C5=91cze?= <pobrn@protonmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>,
        =?UTF-8?q?Bla=C5=BE=20Hrastnik?= <blaz@mxxn.io>,
        Dorian Stoll <dorian.stoll@tmsp.io>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 4/9] platform/surface: aggregator: Add trace points
Date:   Thu,  3 Dec 2020 22:26:35 +0100
Message-Id: <20201203212640.663931-5-luzmaximilian@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203212640.663931-1-luzmaximilian@gmail.com>
References: <20201203212640.663931-1-luzmaximilian@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add trace points to the Surface Aggregator subsystem core. These trace
points can be used to track packets, requests, and allocations. They are
further intended for debugging and testing/validation, specifically in
combination with the error injection capabilities introduced in the
subsequent commit.

Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>
---

Changes in v1 (from RFC):
 - add copyright line
 - change SPDX identifier to GPL-2.0+ (was GPL-2.0-or-later)
 - pack tracing structs

Changes in v2:
 - add compiletime check on SSAM_PTR_UID_LEN
 - fix ssam_trace_get_command_field_u8() macro
 - use dedicated trace event class for timeout reaper
 - use printk specifier for hex prefix instead of hard-coding it
 - unify comment style
 - run checkpatch --strict, fix warnings and style issues

---
 drivers/platform/surface/aggregator/Makefile  |   3 +
 .../platform/surface/aggregator/controller.c  |   5 +
 drivers/platform/surface/aggregator/core.c    |   3 +
 .../surface/aggregator/ssh_packet_layer.c     |  26 +-
 .../surface/aggregator/ssh_request_layer.c    |  18 +
 drivers/platform/surface/aggregator/trace.h   | 601 ++++++++++++++++++
 6 files changed, 655 insertions(+), 1 deletion(-)
 create mode 100644 drivers/platform/surface/aggregator/trace.h

diff --git a/drivers/platform/surface/aggregator/Makefile b/drivers/platform/surface/aggregator/Makefile
index faad18d4a7f2..b8b24c8ec310 100644
--- a/drivers/platform/surface/aggregator/Makefile
+++ b/drivers/platform/surface/aggregator/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0+
 # Copyright (C) 2019-2020 Maximilian Luz <luzmaximilian@gmail.com>

+# For include/trace/define_trace.h to include trace.h
+CFLAGS_core.o = -I$(src)
+
 obj-$(CONFIG_SURFACE_AGGREGATOR) += surface_aggregator.o

 surface_aggregator-objs := core.o
diff --git a/drivers/platform/surface/aggregator/controller.c b/drivers/platform/surface/aggregator/controller.c
index 89ffd8e45787..09302bfba530 100644
--- a/drivers/platform/surface/aggregator/controller.c
+++ b/drivers/platform/surface/aggregator/controller.c
@@ -31,6 +31,8 @@
 #include "ssh_msgb.h"
 #include "ssh_request_layer.h"

+#include "trace.h"
+

 /* -- Safe counters. -------------------------------------------------------- */

@@ -569,6 +571,7 @@ static void __ssam_event_item_free_generic(struct ssam_event_item *item)
  */
 static void ssam_event_item_free(struct ssam_event_item *item)
 {
+	trace_ssam_event_item_free(item);
 	item->ops.free(item);
 }

@@ -604,6 +607,8 @@ static struct ssam_event_item *ssam_event_item_alloc(size_t len, gfp_t flags)
 	}

 	item->event.length = len;
+
+	trace_ssam_event_item_alloc(item, len);
 	return item;
 }

diff --git a/drivers/platform/surface/aggregator/core.c b/drivers/platform/surface/aggregator/core.c
index 1a53d7ce66a1..b5d44ab61f06 100644
--- a/drivers/platform/surface/aggregator/core.c
+++ b/drivers/platform/surface/aggregator/core.c
@@ -24,6 +24,9 @@
 #include <linux/surface_aggregator/controller.h>
 #include "controller.h"

+#define CREATE_TRACE_POINTS
+#include "trace.h"
+

 /* -- Static controller reference. ------------------------------------------ */

diff --git a/drivers/platform/surface/aggregator/ssh_packet_layer.c b/drivers/platform/surface/aggregator/ssh_packet_layer.c
index 8bc19837cde0..f5ec58a1faa2 100644
--- a/drivers/platform/surface/aggregator/ssh_packet_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_packet_layer.c
@@ -25,6 +25,8 @@
 #include "ssh_packet_layer.h"
 #include "ssh_parser.h"

+#include "trace.h"
+
 /*
  * To simplify reasoning about the code below, we define a few concepts. The
  * system below is similar to a state-machine for packets, however, there are
@@ -227,6 +229,8 @@ static void __ssh_ptl_packet_release(struct kref *kref)
 {
 	struct ssh_packet *p = container_of(kref, struct ssh_packet, refcnt);

+	trace_ssam_packet_release(p);
+
 	ptl_dbg_cond(p->ptl, "ptl: releasing packet %p\n", p);
 	p->ops->release(p);
 }
@@ -355,6 +359,7 @@ static int ssh_ctrl_packet_alloc(struct ssh_packet **packet,
 	buffer->ptr = (u8 *)(*packet + 1);
 	buffer->len = SSH_MSG_LEN_CTRL;

+	trace_ssam_ctrl_packet_alloc(*packet, buffer->len);
 	return 0;
 }

@@ -364,6 +369,7 @@ static int ssh_ctrl_packet_alloc(struct ssh_packet **packet,
  */
 static void ssh_ctrl_packet_free(struct ssh_packet *p)
 {
+	trace_ssam_ctrl_packet_free(p);
 	kmem_cache_free(ssh_ctrl_packet_cache, p);
 }

@@ -395,7 +401,12 @@ static void ssh_packet_next_try(struct ssh_packet *p)
 	u8 base = ssh_packet_priority_get_base(p->priority);
 	u8 try = ssh_packet_priority_get_try(p->priority);

-	p->priority = __SSH_PACKET_PRIORITY(base, try + 1);
+	/*
+	 * Ensure that we write the priority in one go via WRITE_ONCE() so we
+	 * can access it via READ_ONCE() for tracing. Note that other access
+	 * is guarded by the queue lock, so no need to use READ_ONCE() there.
+	 */
+	WRITE_ONCE(p->priority, __SSH_PACKET_PRIORITY(base, try + 1));
 }

 /* Must be called with queue lock held. */
@@ -553,6 +564,7 @@ static void __ssh_ptl_complete(struct ssh_packet *p, int status)
 {
 	struct ssh_ptl *ptl = READ_ONCE(p->ptl);

+	trace_ssam_packet_complete(p, status);
 	ptl_dbg_cond(ptl, "ptl: completing packet %p (status: %d)\n", p, status);

 	if (p->ops->complete)
@@ -1007,6 +1019,8 @@ int ssh_ptl_submit(struct ssh_ptl *ptl, struct ssh_packet *p)
 	struct ssh_ptl *ptl_old;
 	int status;

+	trace_ssam_packet_submit(p);
+
 	/* Validate packet fields. */
 	if (test_bit(SSH_PACKET_TY_FLUSH_BIT, &p->state)) {
 		if (p->data.ptr || test_bit(SSH_PACKET_TY_SEQUENCED_BIT, &p->state))
@@ -1056,6 +1070,8 @@ static int __ssh_ptl_resubmit(struct ssh_packet *packet)
 	int status;
 	u8 try;

+	trace_ssam_packet_resubmit(packet);
+
 	spin_lock(&packet->ptl->queue.lock);

 	/* Check if the packet is out of tries. */
@@ -1139,6 +1155,8 @@ void ssh_ptl_cancel(struct ssh_packet *p)
 	if (test_and_set_bit(SSH_PACKET_SF_CANCELED_BIT, &p->state))
 		return;

+	trace_ssam_packet_cancel(p);
+
 	/*
 	 * Lock packet and commit with memory barrier. If this packet has
 	 * already been locked, it's going to be removed and completed by
@@ -1191,6 +1209,8 @@ static void ssh_ptl_timeout_reap(struct work_struct *work)
 	bool resub = false;
 	int status;

+	trace_ssam_ptl_timeout_reap(atomic_read(&ptl->pending.count));
+
 	/*
 	 * Mark reaper as "not pending". This is done before checking any
 	 * packets to avoid lost-update type problems.
@@ -1213,6 +1233,8 @@ static void ssh_ptl_timeout_reap(struct work_struct *work)
 			continue;
 		}

+		trace_ssam_packet_timeout(p);
+
 		status = __ssh_ptl_resubmit(p);

 		/*
@@ -1405,6 +1427,8 @@ static size_t ssh_ptl_rx_eval(struct ssh_ptl *ptl, struct ssam_span *source)
 	if (!frame)	/* Not enough data. */
 		return aligned.ptr - source->ptr;

+	trace_ssam_rx_frame_received(frame);
+
 	switch (frame->type) {
 	case SSH_FRAME_TYPE_ACK:
 		ssh_ptl_acknowledge(ptl, frame->seq);
diff --git a/drivers/platform/surface/aggregator/ssh_request_layer.c b/drivers/platform/surface/aggregator/ssh_request_layer.c
index 80bea8e781d3..e91d2ed4c173 100644
--- a/drivers/platform/surface/aggregator/ssh_request_layer.c
+++ b/drivers/platform/surface/aggregator/ssh_request_layer.c
@@ -22,6 +22,8 @@
 #include "ssh_packet_layer.h"
 #include "ssh_request_layer.h"

+#include "trace.h"
+
 /*
  * SSH_RTL_REQUEST_TIMEOUT - Request timeout.
  *
@@ -144,6 +146,8 @@ static void ssh_rtl_complete_with_status(struct ssh_request *rqst, int status)
 {
 	struct ssh_rtl *rtl = ssh_request_rtl(rqst);

+	trace_ssam_request_complete(rqst, status);
+
 	/* rtl/ptl may not be set if we're canceling before submitting. */
 	rtl_dbg_cond(rtl, "rtl: completing request (rqid: %#06x, status: %d)\n",
 		     ssh_request_get_rqid_safe(rqst), status);
@@ -157,6 +161,8 @@ static void ssh_rtl_complete_with_rsp(struct ssh_request *rqst,
 {
 	struct ssh_rtl *rtl = ssh_request_rtl(rqst);

+	trace_ssam_request_complete(rqst, 0);
+
 	rtl_dbg(rtl, "rtl: completing request with response (rqid: %#06x)\n",
 		ssh_request_get_rqid(rqst));

@@ -329,6 +335,8 @@ static void ssh_rtl_tx_work_fn(struct work_struct *work)
  */
 int ssh_rtl_submit(struct ssh_rtl *rtl, struct ssh_request *rqst)
 {
+	trace_ssam_request_submit(rqst);
+
 	/*
 	 * Ensure that requests expecting a response are sequenced. If this
 	 * invariant ever changes, see the comment in ssh_rtl_complete() on what
@@ -439,6 +447,8 @@ static void ssh_rtl_complete(struct ssh_rtl *rtl,
 	struct ssh_request *p, *n;
 	u16 rqid = get_unaligned_le16(&command->rqid);

+	trace_ssam_rx_response_received(command, command_data->len);
+
 	/*
 	 * Get request from pending based on request ID and mark it as response
 	 * received and locked.
@@ -688,6 +698,8 @@ bool ssh_rtl_cancel(struct ssh_request *rqst, bool pending)
 	if (test_and_set_bit(SSH_REQUEST_SF_CANCELED_BIT, &rqst->state))
 		return true;

+	trace_ssam_request_cancel(rqst);
+
 	if (pending)
 		canceled = ssh_rtl_cancel_pending(rqst);
 	else
@@ -779,6 +791,8 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)
 	ktime_t timeout = rtl->rtx_timeout.timeout;
 	ktime_t next = KTIME_MAX;

+	trace_ssam_rtl_timeout_reap(atomic_read(&rtl->pending.count));
+
 	/*
 	 * Mark reaper as "not pending". This is done before checking any
 	 * requests to avoid lost-update type problems.
@@ -822,6 +836,8 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)

 	/* Cancel and complete the request. */
 	list_for_each_entry_safe(r, n, &claimed, node) {
+		trace_ssam_request_timeout(r);
+
 		/*
 		 * At this point we've removed the packet from pending. This
 		 * means that we've obtained the last (only) reference of the
@@ -849,6 +865,8 @@ static void ssh_rtl_timeout_reap(struct work_struct *work)
 static void ssh_rtl_rx_event(struct ssh_rtl *rtl, const struct ssh_command *cmd,
 			     const struct ssam_span *data)
 {
+	trace_ssam_rx_event_received(cmd, data->len);
+
 	rtl_dbg(rtl, "rtl: handling event (rqid: %#06x)\n",
 		get_unaligned_le16(&cmd->rqid));

diff --git a/drivers/platform/surface/aggregator/trace.h b/drivers/platform/surface/aggregator/trace.h
new file mode 100644
index 000000000000..dcca8007d876
--- /dev/null
+++ b/drivers/platform/surface/aggregator/trace.h
@@ -0,0 +1,601 @@
+/* SPDX-License-Identifier: GPL-2.0+ */
+/*
+ * Trace points for SSAM/SSH.
+ *
+ * Copyright (C) 2020 Maximilian Luz <luzmaximilian@gmail.com>
+ */
+
+#undef TRACE_SYSTEM
+#define TRACE_SYSTEM surface_aggregator
+
+#if !defined(_SURFACE_AGGREGATOR_TRACE_H) || defined(TRACE_HEADER_MULTI_READ)
+#define _SURFACE_AGGREGATOR_TRACE_H
+
+#include <linux/surface_aggregator/serial_hub.h>
+
+#include <asm/unaligned.h>
+#include <linux/tracepoint.h>
+
+TRACE_DEFINE_ENUM(SSH_FRAME_TYPE_DATA_SEQ);
+TRACE_DEFINE_ENUM(SSH_FRAME_TYPE_DATA_NSQ);
+TRACE_DEFINE_ENUM(SSH_FRAME_TYPE_ACK);
+TRACE_DEFINE_ENUM(SSH_FRAME_TYPE_NAK);
+
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_LOCKED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_QUEUED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_PENDING_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_TRANSMITTING_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_TRANSMITTED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_ACKED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_CANCELED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_SF_COMPLETED_BIT);
+
+TRACE_DEFINE_ENUM(SSH_PACKET_TY_FLUSH_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_TY_SEQUENCED_BIT);
+TRACE_DEFINE_ENUM(SSH_PACKET_TY_BLOCKING_BIT);
+
+TRACE_DEFINE_ENUM(SSH_PACKET_FLAGS_SF_MASK);
+TRACE_DEFINE_ENUM(SSH_PACKET_FLAGS_TY_MASK);
+
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_LOCKED_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_QUEUED_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_PENDING_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_TRANSMITTING_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_TRANSMITTED_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_RSPRCVD_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_CANCELED_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_SF_COMPLETED_BIT);
+
+TRACE_DEFINE_ENUM(SSH_REQUEST_TY_FLUSH_BIT);
+TRACE_DEFINE_ENUM(SSH_REQUEST_TY_HAS_RESPONSE_BIT);
+
+TRACE_DEFINE_ENUM(SSH_REQUEST_FLAGS_SF_MASK);
+TRACE_DEFINE_ENUM(SSH_REQUEST_FLAGS_TY_MASK);
+
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_SAM);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_BAT);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_TMP);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_PMC);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_FAN);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_PoM);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_DBG);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_KBD);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_FWU);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_UNI);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_LPC);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_TCL);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_SFL);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_KIP);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_EXT);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_BLD);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_BAS);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_SEN);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_SRQ);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_MCU);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_HID);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_TCH);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_BKL);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_TAM);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_ACC);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_UFI);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_USC);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_PEN);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_VID);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_AUD);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_SMC);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_KPD);
+TRACE_DEFINE_ENUM(SSAM_SSH_TC_REG);
+
+#define SSAM_PTR_UID_LEN		9
+#define SSAM_U8_FIELD_NOT_APPLICABLE	((u16)-1)
+#define SSAM_SEQ_NOT_APPLICABLE		((u16)-1)
+#define SSAM_RQID_NOT_APPLICABLE	((u32)-1)
+#define SSAM_SSH_TC_NOT_APPLICABLE	0
+
+#ifndef _SURFACE_AGGREGATOR_TRACE_HELPERS
+#define _SURFACE_AGGREGATOR_TRACE_HELPERS
+
+/**
+ * ssam_trace_ptr_uid() - Convert the pointer to a non-pointer UID string.
+ * @ptr: The pointer to convert.
+ * @uid_str: A buffer of length SSAM_PTR_UID_LEN where the UID will be stored.
+ *
+ * Converts the given pointer into a UID string that is safe to be shared
+ * with userspace and logs, i.e. doesn't give away the real memory location.
+ */
+static inline void ssam_trace_ptr_uid(const void *ptr, char *uid_str)
+{
+	char buf[2 * sizeof(void *) + 1];
+
+	BUILD_BUG_ON(ARRAY_SIZE(buf) < SSAM_PTR_UID_LEN);
+
+	snprintf(buf, ARRAY_SIZE(buf), "%p", ptr);
+	memcpy(uid_str, &buf[ARRAY_SIZE(buf) - SSAM_PTR_UID_LEN],
+	       SSAM_PTR_UID_LEN);
+}
+
+/**
+ * ssam_trace_get_packet_seq() - Read the packet's sequence ID.
+ * @p: The packet.
+ *
+ * Return: Returns the packet's sequence ID (SEQ) field if present, or
+ * %SSAM_SEQ_NOT_APPLICABLE if not (e.g. flush packet).
+ */
+static inline u16 ssam_trace_get_packet_seq(const struct ssh_packet *p)
+{
+	if (!p->data.ptr || p->data.len < SSH_MESSAGE_LENGTH(0))
+		return SSAM_SEQ_NOT_APPLICABLE;
+
+	return p->data.ptr[SSH_MSGOFFSET_FRAME(seq)];
+}
+
+/**
+ * ssam_trace_get_request_id() - Read the packet's request ID.
+ * @p: The packet.
+ *
+ * Return: Returns the packet's request ID (RQID) field if the packet
+ * represents a request with command data, or %SSAM_RQID_NOT_APPLICABLE if not
+ * (e.g. flush request, control packet).
+ */
+static inline u32 ssam_trace_get_request_id(const struct ssh_packet *p)
+{
+	if (!p->data.ptr || p->data.len < SSH_COMMAND_MESSAGE_LENGTH(0))
+		return SSAM_RQID_NOT_APPLICABLE;
+
+	return get_unaligned_le16(&p->data.ptr[SSH_MSGOFFSET_COMMAND(rqid)]);
+}
+
+/**
+ * ssam_trace_get_request_tc() - Read the packet's request target category.
+ * @p: The packet.
+ *
+ * Return: Returns the packet's request target category (TC) field if the
+ * packet represents a request with command data, or %SSAM_TC_NOT_APPLICABLE
+ * if not (e.g. flush request, control packet).
+ */
+static inline u32 ssam_trace_get_request_tc(const struct ssh_packet *p)
+{
+	if (!p->data.ptr || p->data.len < SSH_COMMAND_MESSAGE_LENGTH(0))
+		return SSAM_SSH_TC_NOT_APPLICABLE;
+
+	return get_unaligned_le16(&p->data.ptr[SSH_MSGOFFSET_COMMAND(tc)]);
+}
+
+#endif /* _SURFACE_AGGREGATOR_TRACE_HELPERS */
+
+#define ssam_trace_get_command_field_u8(packet, field) \
+	((!(packet) || (packet)->data.len < SSH_COMMAND_MESSAGE_LENGTH(0)) \
+	 ? 0 : (packet)->data.ptr[SSH_MSGOFFSET_COMMAND(field)])
+
+#define ssam_show_generic_u8_field(value)				\
+	__print_symbolic(value,						\
+		{ SSAM_U8_FIELD_NOT_APPLICABLE,		"N/A" }		\
+	)
+
+#define ssam_show_frame_type(ty)					\
+	__print_symbolic(ty,						\
+		{ SSH_FRAME_TYPE_DATA_SEQ,		"DSEQ" },	\
+		{ SSH_FRAME_TYPE_DATA_NSQ,		"DNSQ" },	\
+		{ SSH_FRAME_TYPE_ACK,			"ACK"  },	\
+		{ SSH_FRAME_TYPE_NAK,			"NAK"  }	\
+	)
+
+#define ssam_show_packet_type(type)					\
+	__print_flags(flags & SSH_PACKET_FLAGS_TY_MASK, "",		\
+		{ BIT(SSH_PACKET_TY_FLUSH_BIT),		"F" },		\
+		{ BIT(SSH_PACKET_TY_SEQUENCED_BIT),	"S" },		\
+		{ BIT(SSH_PACKET_TY_BLOCKING_BIT),	"B" }		\
+	)
+
+#define ssam_show_packet_state(state)					\
+	__print_flags(flags & SSH_PACKET_FLAGS_SF_MASK, "",		\
+		{ BIT(SSH_PACKET_SF_LOCKED_BIT),	"L" },		\
+		{ BIT(SSH_PACKET_SF_QUEUED_BIT),	"Q" },		\
+		{ BIT(SSH_PACKET_SF_PENDING_BIT),	"P" },		\
+		{ BIT(SSH_PACKET_SF_TRANSMITTING_BIT),	"S" },		\
+		{ BIT(SSH_PACKET_SF_TRANSMITTED_BIT),	"T" },		\
+		{ BIT(SSH_PACKET_SF_ACKED_BIT),		"A" },		\
+		{ BIT(SSH_PACKET_SF_CANCELED_BIT),	"C" },		\
+		{ BIT(SSH_PACKET_SF_COMPLETED_BIT),	"F" }		\
+	)
+
+#define ssam_show_packet_seq(seq)					\
+	__print_symbolic(seq,						\
+		{ SSAM_SEQ_NOT_APPLICABLE,		"N/A" }		\
+	)
+
+#define ssam_show_request_type(flags)					\
+	__print_flags((flags) & SSH_REQUEST_FLAGS_TY_MASK, "",		\
+		{ BIT(SSH_REQUEST_TY_FLUSH_BIT),	"F" },		\
+		{ BIT(SSH_REQUEST_TY_HAS_RESPONSE_BIT),	"R" }		\
+	)
+
+#define ssam_show_request_state(flags)					\
+	__print_flags((flags) & SSH_REQUEST_FLAGS_SF_MASK, "",		\
+		{ BIT(SSH_REQUEST_SF_LOCKED_BIT),	"L" },		\
+		{ BIT(SSH_REQUEST_SF_QUEUED_BIT),	"Q" },		\
+		{ BIT(SSH_REQUEST_SF_PENDING_BIT),	"P" },		\
+		{ BIT(SSH_REQUEST_SF_TRANSMITTING_BIT),	"S" },		\
+		{ BIT(SSH_REQUEST_SF_TRANSMITTED_BIT),	"T" },		\
+		{ BIT(SSH_REQUEST_SF_RSPRCVD_BIT),	"A" },		\
+		{ BIT(SSH_REQUEST_SF_CANCELED_BIT),	"C" },		\
+		{ BIT(SSH_REQUEST_SF_COMPLETED_BIT),	"F" }		\
+	)
+
+#define ssam_show_request_id(rqid)					\
+	__print_symbolic(rqid,						\
+		{ SSAM_RQID_NOT_APPLICABLE,		"N/A" }		\
+	)
+
+#define ssam_show_ssh_tc(rqid)						\
+	__print_symbolic(rqid,						\
+		{ SSAM_SSH_TC_NOT_APPLICABLE,		"N/A" },	\
+		{ SSAM_SSH_TC_SAM,			"SAM" },	\
+		{ SSAM_SSH_TC_BAT,			"BAT" },	\
+		{ SSAM_SSH_TC_TMP,			"TMP" },	\
+		{ SSAM_SSH_TC_PMC,			"PMC" },	\
+		{ SSAM_SSH_TC_FAN,			"FAN" },	\
+		{ SSAM_SSH_TC_PoM,			"PoM" },	\
+		{ SSAM_SSH_TC_DBG,			"DBG" },	\
+		{ SSAM_SSH_TC_KBD,			"KBD" },	\
+		{ SSAM_SSH_TC_FWU,			"FWU" },	\
+		{ SSAM_SSH_TC_UNI,			"UNI" },	\
+		{ SSAM_SSH_TC_LPC,			"LPC" },	\
+		{ SSAM_SSH_TC_TCL,			"TCL" },	\
+		{ SSAM_SSH_TC_SFL,			"SFL" },	\
+		{ SSAM_SSH_TC_KIP,			"KIP" },	\
+		{ SSAM_SSH_TC_EXT,			"EXT" },	\
+		{ SSAM_SSH_TC_BLD,			"BLD" },	\
+		{ SSAM_SSH_TC_BAS,			"BAS" },	\
+		{ SSAM_SSH_TC_SEN,			"SEN" },	\
+		{ SSAM_SSH_TC_SRQ,			"SRQ" },	\
+		{ SSAM_SSH_TC_MCU,			"MCU" },	\
+		{ SSAM_SSH_TC_HID,			"HID" },	\
+		{ SSAM_SSH_TC_TCH,			"TCH" },	\
+		{ SSAM_SSH_TC_BKL,			"BKL" },	\
+		{ SSAM_SSH_TC_TAM,			"TAM" },	\
+		{ SSAM_SSH_TC_ACC,			"ACC" },	\
+		{ SSAM_SSH_TC_UFI,			"UFI" },	\
+		{ SSAM_SSH_TC_USC,			"USC" },	\
+		{ SSAM_SSH_TC_PEN,			"PEN" },	\
+		{ SSAM_SSH_TC_VID,			"VID" },	\
+		{ SSAM_SSH_TC_AUD,			"AUD" },	\
+		{ SSAM_SSH_TC_SMC,			"SMC" },	\
+		{ SSAM_SSH_TC_KPD,			"KPD" },	\
+		{ SSAM_SSH_TC_REG,			"REG" }		\
+	)
+
+DECLARE_EVENT_CLASS(ssam_frame_class,
+	TP_PROTO(const struct ssh_frame *frame),
+
+	TP_ARGS(frame),
+
+	TP_STRUCT__entry(
+		__field(u8, type)
+		__field(u8, seq)
+		__field(u16, len)
+	),
+
+	TP_fast_assign(
+		__entry->type = frame->type;
+		__entry->seq = frame->seq;
+		__entry->len = get_unaligned_le16(&frame->len);
+	),
+
+	TP_printk("ty=%s, seq=%#04x, len=%u",
+		ssam_show_frame_type(__entry->type),
+		__entry->seq,
+		__entry->len
+	)
+);
+
+#define DEFINE_SSAM_FRAME_EVENT(name)				\
+	DEFINE_EVENT(ssam_frame_class, ssam_##name,		\
+		TP_PROTO(const struct ssh_frame *frame),	\
+		TP_ARGS(frame)					\
+	)
+
+DECLARE_EVENT_CLASS(ssam_command_class,
+	TP_PROTO(const struct ssh_command *cmd, u16 len),
+
+	TP_ARGS(cmd, len),
+
+	TP_STRUCT__entry(
+		__field(u16, rqid)
+		__field(u16, len)
+		__field(u8, tc)
+		__field(u8, cid)
+		__field(u8, iid)
+	),
+
+	TP_fast_assign(
+		__entry->rqid = get_unaligned_le16(&cmd->rqid);
+		__entry->tc = cmd->tc;
+		__entry->cid = cmd->cid;
+		__entry->iid = cmd->iid;
+		__entry->len = len;
+	),
+
+	TP_printk("rqid=%#06x, tc=%s, cid=%#04x, iid=%#04x, len=%u",
+		__entry->rqid,
+		ssam_show_ssh_tc(__entry->tc),
+		__entry->cid,
+		__entry->iid,
+		__entry->len
+	)
+);
+
+#define DEFINE_SSAM_COMMAND_EVENT(name)					\
+	DEFINE_EVENT(ssam_command_class, ssam_##name,			\
+		TP_PROTO(const struct ssh_command *cmd, u16 len),	\
+		TP_ARGS(cmd, len)					\
+	)
+
+DECLARE_EVENT_CLASS(ssam_packet_class,
+	TP_PROTO(const struct ssh_packet *packet),
+
+	TP_ARGS(packet),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, state)
+		__array(char, uid, SSAM_PTR_UID_LEN)
+		__field(u8, priority)
+		__field(u16, length)
+		__field(u16, seq)
+	),
+
+	TP_fast_assign(
+		__entry->state = READ_ONCE(packet->state);
+		ssam_trace_ptr_uid(packet, __entry->uid);
+		__entry->priority = READ_ONCE(packet->priority);
+		__entry->length = packet->data.len;
+		__entry->seq = ssam_trace_get_packet_seq(packet);
+	),
+
+	TP_printk("uid=%s, seq=%s, ty=%s, pri=%#04x, len=%u, sta=%s",
+		__entry->uid,
+		ssam_show_packet_seq(__entry->seq),
+		ssam_show_packet_type(__entry->state),
+		__entry->priority,
+		__entry->length,
+		ssam_show_packet_state(__entry->state)
+	)
+);
+
+#define DEFINE_SSAM_PACKET_EVENT(name)				\
+	DEFINE_EVENT(ssam_packet_class, ssam_##name,		\
+		TP_PROTO(const struct ssh_packet *packet),	\
+		TP_ARGS(packet)					\
+	)
+
+DECLARE_EVENT_CLASS(ssam_packet_status_class,
+	TP_PROTO(const struct ssh_packet *packet, int status),
+
+	TP_ARGS(packet, status),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, state)
+		__field(int, status)
+		__array(char, uid, SSAM_PTR_UID_LEN)
+		__field(u8, priority)
+		__field(u16, length)
+		__field(u16, seq)
+	),
+
+	TP_fast_assign(
+		__entry->state = READ_ONCE(packet->state);
+		__entry->status = status;
+		ssam_trace_ptr_uid(packet, __entry->uid);
+		__entry->priority = READ_ONCE(packet->priority);
+		__entry->length = packet->data.len;
+		__entry->seq = ssam_trace_get_packet_seq(packet);
+	),
+
+	TP_printk("uid=%s, seq=%s, ty=%s, pri=%#04x, len=%u, sta=%s, status=%d",
+		__entry->uid,
+		ssam_show_packet_seq(__entry->seq),
+		ssam_show_packet_type(__entry->state),
+		__entry->priority,
+		__entry->length,
+		ssam_show_packet_state(__entry->state),
+		__entry->status
+	)
+);
+
+#define DEFINE_SSAM_PACKET_STATUS_EVENT(name)				\
+	DEFINE_EVENT(ssam_packet_status_class, ssam_##name,		\
+		TP_PROTO(const struct ssh_packet *packet, int status),	\
+		TP_ARGS(packet, status)					\
+	)
+
+DECLARE_EVENT_CLASS(ssam_request_class,
+	TP_PROTO(const struct ssh_request *request),
+
+	TP_ARGS(request),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, state)
+		__field(u32, rqid)
+		__array(char, uid, SSAM_PTR_UID_LEN)
+		__field(u8, tc)
+		__field(u16, cid)
+		__field(u16, iid)
+	),
+
+	TP_fast_assign(
+		const struct ssh_packet *p = &request->packet;
+
+		/* Use packet for UID so we can match requests to packets. */
+		__entry->state = READ_ONCE(request->state);
+		__entry->rqid = ssam_trace_get_request_id(p);
+		ssam_trace_ptr_uid(p, __entry->uid);
+		__entry->tc = ssam_trace_get_request_tc(p);
+		__entry->cid = ssam_trace_get_command_field_u8(p, cid);
+		__entry->iid = ssam_trace_get_command_field_u8(p, iid);
+	),
+
+	TP_printk("uid=%s, rqid=%s, ty=%s, sta=%s, tc=%s, cid=%s, iid=%s",
+		__entry->uid,
+		ssam_show_request_id(__entry->rqid),
+		ssam_show_request_type(__entry->state),
+		ssam_show_request_state(__entry->state),
+		ssam_show_ssh_tc(__entry->tc),
+		ssam_show_generic_u8_field(__entry->cid),
+		ssam_show_generic_u8_field(__entry->iid)
+	)
+);
+
+#define DEFINE_SSAM_REQUEST_EVENT(name)				\
+	DEFINE_EVENT(ssam_request_class, ssam_##name,		\
+		TP_PROTO(const struct ssh_request *request),	\
+		TP_ARGS(request)				\
+	)
+
+DECLARE_EVENT_CLASS(ssam_request_status_class,
+	TP_PROTO(const struct ssh_request *request, int status),
+
+	TP_ARGS(request, status),
+
+	TP_STRUCT__entry(
+		__field(unsigned long, state)
+		__field(u32, rqid)
+		__field(int, status)
+		__array(char, uid, SSAM_PTR_UID_LEN)
+		__field(u8, tc)
+		__field(u16, cid)
+		__field(u16, iid)
+	),
+
+	TP_fast_assign(
+		const struct ssh_packet *p = &request->packet;
+
+		/* Use packet for UID so we can match requests to packets. */
+		__entry->state = READ_ONCE(request->state);
+		__entry->rqid = ssam_trace_get_request_id(p);
+		__entry->status = status;
+		ssam_trace_ptr_uid(p, __entry->uid);
+		__entry->tc = ssam_trace_get_request_tc(p);
+		__entry->cid = ssam_trace_get_command_field_u8(p, cid);
+		__entry->iid = ssam_trace_get_command_field_u8(p, iid);
+	),
+
+	TP_printk("uid=%s, rqid=%s, ty=%s, sta=%s, tc=%s, cid=%s, iid=%s, status=%d",
+		__entry->uid,
+		ssam_show_request_id(__entry->rqid),
+		ssam_show_request_type(__entry->state),
+		ssam_show_request_state(__entry->state),
+		ssam_show_ssh_tc(__entry->tc),
+		ssam_show_generic_u8_field(__entry->cid),
+		ssam_show_generic_u8_field(__entry->iid),
+		__entry->status
+	)
+);
+
+#define DEFINE_SSAM_REQUEST_STATUS_EVENT(name)				\
+	DEFINE_EVENT(ssam_request_status_class, ssam_##name,		\
+		TP_PROTO(const struct ssh_request *request, int status),\
+		TP_ARGS(request, status)				\
+	)
+
+DECLARE_EVENT_CLASS(ssam_alloc_class,
+	TP_PROTO(void *ptr, size_t len),
+
+	TP_ARGS(ptr, len),
+
+	TP_STRUCT__entry(
+		__field(size_t, len)
+		__array(char, uid, SSAM_PTR_UID_LEN)
+	),
+
+	TP_fast_assign(
+		__entry->len = len;
+		ssam_trace_ptr_uid(ptr, __entry->uid);
+	),
+
+	TP_printk("uid=%s, len=%zu", __entry->uid, __entry->len)
+);
+
+#define DEFINE_SSAM_ALLOC_EVENT(name)					\
+	DEFINE_EVENT(ssam_alloc_class, ssam_##name,			\
+		TP_PROTO(void *ptr, size_t len),			\
+		TP_ARGS(ptr, len)					\
+	)
+
+DECLARE_EVENT_CLASS(ssam_free_class,
+	TP_PROTO(void *ptr),
+
+	TP_ARGS(ptr),
+
+	TP_STRUCT__entry(
+		__array(char, uid, SSAM_PTR_UID_LEN)
+	),
+
+	TP_fast_assign(
+		ssam_trace_ptr_uid(ptr, __entry->uid);
+	),
+
+	TP_printk("uid=%s", __entry->uid)
+);
+
+#define DEFINE_SSAM_FREE_EVENT(name)					\
+	DEFINE_EVENT(ssam_free_class, ssam_##name,			\
+		TP_PROTO(void *ptr),					\
+		TP_ARGS(ptr)						\
+	)
+
+DECLARE_EVENT_CLASS(ssam_pending_class,
+	TP_PROTO(unsigned int pending),
+
+	TP_ARGS(pending),
+
+	TP_STRUCT__entry(
+		__field(unsigned int, pending)
+	),
+
+	TP_fast_assign(
+		__entry->pending = pending;
+	),
+
+	TP_printk("pending=%u", __entry->pending)
+);
+
+#define DEFINE_SSAM_PENDING_EVENT(name)					\
+	DEFINE_EVENT(ssam_pending_class, ssam_##name,			\
+		TP_PROTO(unsigned int pending),				\
+		TP_ARGS(pending)					\
+	)
+
+DEFINE_SSAM_FRAME_EVENT(rx_frame_received);
+DEFINE_SSAM_COMMAND_EVENT(rx_response_received);
+DEFINE_SSAM_COMMAND_EVENT(rx_event_received);
+
+DEFINE_SSAM_PACKET_EVENT(packet_release);
+DEFINE_SSAM_PACKET_EVENT(packet_submit);
+DEFINE_SSAM_PACKET_EVENT(packet_resubmit);
+DEFINE_SSAM_PACKET_EVENT(packet_timeout);
+DEFINE_SSAM_PACKET_EVENT(packet_cancel);
+DEFINE_SSAM_PACKET_STATUS_EVENT(packet_complete);
+DEFINE_SSAM_PENDING_EVENT(ptl_timeout_reap);
+
+DEFINE_SSAM_REQUEST_EVENT(request_submit);
+DEFINE_SSAM_REQUEST_EVENT(request_timeout);
+DEFINE_SSAM_REQUEST_EVENT(request_cancel);
+DEFINE_SSAM_REQUEST_STATUS_EVENT(request_complete);
+DEFINE_SSAM_PENDING_EVENT(rtl_timeout_reap);
+
+DEFINE_SSAM_ALLOC_EVENT(ctrl_packet_alloc);
+DEFINE_SSAM_FREE_EVENT(ctrl_packet_free);
+
+DEFINE_SSAM_ALLOC_EVENT(event_item_alloc);
+DEFINE_SSAM_FREE_EVENT(event_item_free);
+
+#endif /* _SURFACE_AGGREGATOR_TRACE_H */
+
+/* This part must be outside protection */
+#undef TRACE_INCLUDE_PATH
+#undef TRACE_INCLUDE_FILE
+
+#define TRACE_INCLUDE_PATH .
+#define TRACE_INCLUDE_FILE trace
+
+#include <trace/define_trace.h>
--
2.29.2

