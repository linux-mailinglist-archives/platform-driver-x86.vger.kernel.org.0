Return-Path: <platform-driver-x86+bounces-4602-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 505AF947BEC
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Aug 2024 15:37:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 05E621F21E6E
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Aug 2024 13:37:45 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6257E2D638;
	Mon,  5 Aug 2024 13:37:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="dC/ySX8G"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A528328366
	for <platform-driver-x86@vger.kernel.org>; Mon,  5 Aug 2024 13:37:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722865061; cv=none; b=NGVMYVQ45yuKZvMpKxySwxsGoVSlp77a62P7zrP6leKZMeuObQ53qKLuZAuXe3rtpqjFE3AxlFPEx9xrqdMmJq/CGueP1oz6k8D6V5k57noTP4za95+3ly8Z7y3lv23pObqKE0zvjkzj4q/0Kai1K20ROWSLhZp22e1HE6Dn31M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722865061; c=relaxed/simple;
	bh=oWOGPctyxHWyELdA5kMF208Dy9jFDVQ7OOiRB338u3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YjqeeKMB3T7ZY3wBp0Cie1Tug5Ks65bz6NcqK0VrmrMw8uRN66lACQ33DfF2noROyQ+qNGeWE5xmQzlEzXYwpRCBA0gC5lRtcj63sVRhw445j5lhDP2rbjykKF80JTZgpGYiAzQ5q2K7Ql7F9+Kk7OahMfOBvvGr6c7OWLXxbvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=dC/ySX8G; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722865058;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NPLyN/m8QCxqivSHHLBDb1oDWy9V+7mt3qNo/WPWUJ0=;
	b=dC/ySX8G/3z9NWmd8d5DV90FogSdLhLqQcN4npSs05nj6ZUEx3Fm5crStePvcDcvoWUTN7
	KfLwXaTBhf/FmvzdkZdELxf9GqncKWenW/8T7tt649GtyeBlLh1W9bXSqeYWaPtdn/TRw0
	oo0Z0XApnK8JDCV/2oZrIvujVvAmMBc=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-682-12AIiJI8OmCBRJr5eRt1Yw-1; Mon,
 05 Aug 2024 09:37:35 -0400
X-MC-Unique: 12AIiJI8OmCBRJr5eRt1Yw-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 0692C1955F6B;
	Mon,  5 Aug 2024 13:37:32 +0000 (UTC)
Received: from x1.localdomain.com (unknown [10.39.193.139])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DF5AB30001A6;
	Mon,  5 Aug 2024 13:37:20 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v7 1/6] i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
Date: Mon,  5 Aug 2024 15:37:03 +0200
Message-ID: <20240805133708.160737-2-hdegoede@redhat.com>
In-Reply-To: <20240805133708.160737-1-hdegoede@redhat.com>
References: <20240805133708.160737-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Platform glue code, which is not build into the kernel and thus cannot
use i2c_register_board_info() may want to use bus_register_notifier()
to listen for i2c-adapters to show up on which the platform code needs
to manually instantiate platform specific i2c_clients.

This results in calling i2c_new_client_device() from the bus notifier
which happens near the device_add() call.

If the i2c-core has not yet setup runtime-pm (specifically the
no-callbacks and ignore-children flags) for the device embedded
inside struct i2c_adapter and the driver for the i2c_client
calls pm_runtime_set_active() this will trigger the following
error inside __pm_runtime_set_status():

"runtime PM trying to activate child device %s but parent (%s) is not active\n"

and the i2c_client's runtime-status will not be updated.

Split the device_register() call for the adapter into device_initialize()
and device_add() and move the pm-runtime init calls inbetween these 2 calls
so that the runtime-status can be correctly set when a driver binds from
the bus-notifier.

Note the moved pm-runtime init calls just override the initial value of
some flags in struct device set by device_initialize() and calling these
before device_add() is safe.

Reviewed-by: Pali Rohár <pali@kernel.org>
Reviewed-by: Andi Shyti <andi.shyti@kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Add a comment explaining why runtime-pm needs to be setup before
  the device_add()

Changes in v3:
- This is a new patch in v3 of this patch-set
---
 drivers/i2c/i2c-core-base.c | 18 ++++++++++++------
 1 file changed, 12 insertions(+), 6 deletions(-)

diff --git a/drivers/i2c/i2c-core-base.c b/drivers/i2c/i2c-core-base.c
index b63f75e44296..8ef459eb85cc 100644
--- a/drivers/i2c/i2c-core-base.c
+++ b/drivers/i2c/i2c-core-base.c
@@ -1524,7 +1524,18 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	dev_set_name(&adap->dev, "i2c-%d", adap->nr);
 	adap->dev.bus = &i2c_bus_type;
 	adap->dev.type = &i2c_adapter_type;
-	res = device_register(&adap->dev);
+	device_initialize(&adap->dev);
+
+	/*
+	 * This adapter can be used as a parent immediately after device_add(),
+	 * setup runtime-pm (especially ignore-children) before hand.
+	 */
+	device_enable_async_suspend(&adap->dev);
+	pm_runtime_no_callbacks(&adap->dev);
+	pm_suspend_ignore_children(&adap->dev, true);
+	pm_runtime_enable(&adap->dev);
+
+	res = device_add(&adap->dev);
 	if (res) {
 		pr_err("adapter '%s': can't register device (%d)\n", adap->name, res);
 		goto out_list;
@@ -1536,11 +1547,6 @@ static int i2c_register_adapter(struct i2c_adapter *adap)
 	if (res)
 		goto out_reg;
 
-	device_enable_async_suspend(&adap->dev);
-	pm_runtime_no_callbacks(&adap->dev);
-	pm_suspend_ignore_children(&adap->dev, true);
-	pm_runtime_enable(&adap->dev);
-
 	res = i2c_init_recovery(adap);
 	if (res == -EPROBE_DEFER)
 		goto out_reg;
-- 
2.45.2


