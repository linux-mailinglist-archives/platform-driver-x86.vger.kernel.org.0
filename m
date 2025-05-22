Return-Path: <platform-driver-x86+bounces-12267-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 730C6AC016F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 May 2025 02:35:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 938941BA14ED
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 May 2025 00:35:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8D70817BD6;
	Thu, 22 May 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="l+TxdoxA"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66C4AA50
	for <platform-driver-x86@vger.kernel.org>; Thu, 22 May 2025 00:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747874103; cv=none; b=l63p3qsBic/XDapvLV6jGgcGdZaX85vt3EE958+lKdE6xoU18Arstp9rz/EGQUJZpgvoI0W1rKRSCmkC/xehdE+YWcFNX2rRwdzk2BExjE0e4E5HpKQUBffTxIM/6fAAN3VTSsXmWlwj5M0mrTuFMzwxRF6J8xxT4/52Ggjam8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747874103; c=relaxed/simple;
	bh=+CnNvVT5Y+uLas/Avh8CCtbPHdh8l9zXSlyW6wAXVoo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oM3zfwvtL9d+PrB+JBXEZNS8ZOjAiY2cKkES4qRq4WevRwrunBxxoYxU3uW7rWeR/CGWD+4FVPD+YeZgcq4wdv/Wj/AWpNNUs3kxgBciMznvG/ERBD+ucUmcKLnbeizknN0RDR1gq9sOfWfMTw2nje+ODihSjzoovEmxHOcPUNY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=l+TxdoxA; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D2CEC4CEE7;
	Thu, 22 May 2025 00:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747874102;
	bh=+CnNvVT5Y+uLas/Avh8CCtbPHdh8l9zXSlyW6wAXVoo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l+TxdoxAmU9b9ACf+9S4V7PNd21Z5tkB0CljoWuZ9ilB+p5bzlO8K3Im1KxZ9xSD6
	 okOKAveara07GL6OyYVzvWIy5E2veDs4KbdvJv6lE1RwIZhlU8ChcN0jig1cWfZuVf
	 XdXlJ7HzJhv1zsgXXi9jlerC3bkvrv/VaqjS1i3uX9XdaDbaZr4O8e7jzqY50BZJNZ
	 x4Vs8Luyz9iz0ka4cOCkFZVeyexSanfF+GEcJAQ5myg/ZSid26aTrNmg9/AmCSF2ye
	 1tlt6jIDfYQxNKEDay8pYTYbE4PpKR+pYFZinq6QKOliIPOWYN801UP2kkU8rEq7wC
	 lfr3JDzBYkTCA==
From: Mario Limonciello <superm1@kernel.org>
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org (open list:AMD PMF DRIVER),
	Mario Limonciello <mario.limonciello@amd.com>
Subject: [PATCH v5 1/3] platform/x86/amd: pmf: Use device managed allocations
Date: Wed, 21 May 2025 19:34:55 -0500
Message-ID: <20250522003457.1516679-2-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250522003457.1516679-1-superm1@kernel.org>
References: <20250522003457.1516679-1-superm1@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

If setting up smart PC fails for any reason then this can lead to
a double free when unloading amd-pmf.  This is because dev->buf was
freed but never set to NULL and is again freed in amd_pmf_remove().

To avoid subtle allocation bugs in failures leading to a double free
change all allocations into device managed allocations.

Fixes: 5b1122fc4995f ("platform/x86/amd/pmf: fix cleanup in amd_pmf_init_smart_pc()")
Link: https://lore.kernel.org/r/20250512211154.2510397-2-superm1@kernel.org
Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
---
v5:
 * Keep same flow as before patch for amd_pmf_get_pb_data()
---
 drivers/platform/x86/amd/pmf/core.c   |  3 +-
 drivers/platform/x86/amd/pmf/tee-if.c | 56 ++++++++++-----------------
 2 files changed, 22 insertions(+), 37 deletions(-)

diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
index 96821101ec773..395c011e837f1 100644
--- a/drivers/platform/x86/amd/pmf/core.c
+++ b/drivers/platform/x86/amd/pmf/core.c
@@ -280,7 +280,7 @@ int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev, bool alloc_buffer)
 			dev_err(dev->dev, "Invalid CPU id: 0x%x", dev->cpu_id);
 		}
 
-		dev->buf = kzalloc(dev->mtable_size, GFP_KERNEL);
+		dev->buf = devm_kzalloc(dev->dev, dev->mtable_size, GFP_KERNEL);
 		if (!dev->buf)
 			return -ENOMEM;
 	}
@@ -493,7 +493,6 @@ static void amd_pmf_remove(struct platform_device *pdev)
 	mutex_destroy(&dev->lock);
 	mutex_destroy(&dev->update_mutex);
 	mutex_destroy(&dev->cb_mutex);
-	kfree(dev->buf);
 }
 
 static const struct attribute_group *amd_pmf_driver_groups[] = {
diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
index d3bd12ad036ae..027e992b71472 100644
--- a/drivers/platform/x86/amd/pmf/tee-if.c
+++ b/drivers/platform/x86/amd/pmf/tee-if.c
@@ -358,30 +358,28 @@ static ssize_t amd_pmf_get_pb_data(struct file *filp, const char __user *buf,
 		return -EINVAL;
 
 	/* re-alloc to the new buffer length of the policy binary */
-	new_policy_buf = memdup_user(buf, length);
-	if (IS_ERR(new_policy_buf))
-		return PTR_ERR(new_policy_buf);
+	new_policy_buf = devm_kzalloc(dev->dev, length, GFP_KERNEL);
+	if (!new_policy_buf)
+		return -ENOMEM;
+
+	if (copy_from_user(new_policy_buf, buf, length)) {
+		devm_kfree(dev->dev, new_policy_buf);
+		return -EFAULT;
+	}
 
-	kfree(dev->policy_buf);
+	devm_kfree(dev->dev, dev->policy_buf);
 	dev->policy_buf = new_policy_buf;
 	dev->policy_sz = length;
 
-	if (!amd_pmf_pb_valid(dev)) {
-		ret = -EINVAL;
-		goto cleanup;
-	}
+	if (!amd_pmf_pb_valid(dev))
+		return -EINVAL;
 
 	amd_pmf_hex_dump_pb(dev);
 	ret = amd_pmf_start_policy_engine(dev);
 	if (ret < 0)
-		goto cleanup;
+		return ret;
 
 	return length;
-
-cleanup:
-	kfree(dev->policy_buf);
-	dev->policy_buf = NULL;
-	return ret;
 }
 
 static const struct file_operations pb_fops = {
@@ -532,13 +530,13 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	dev->policy_base = devm_ioremap_resource(dev->dev, dev->res);
 	if (IS_ERR(dev->policy_base)) {
 		ret = PTR_ERR(dev->policy_base);
-		goto err_free_dram_buf;
+		goto err_cancel_work;
 	}
 
-	dev->policy_buf = kzalloc(dev->policy_sz, GFP_KERNEL);
+	dev->policy_buf = devm_kzalloc(dev->dev, dev->policy_sz, GFP_KERNEL);
 	if (!dev->policy_buf) {
 		ret = -ENOMEM;
-		goto err_free_dram_buf;
+		goto err_cancel_work;
 	}
 
 	memcpy_fromio(dev->policy_buf, dev->policy_base, dev->policy_sz);
@@ -546,21 +544,21 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (!amd_pmf_pb_valid(dev)) {
 		dev_info(dev->dev, "No Smart PC policy present\n");
 		ret = -EINVAL;
-		goto err_free_policy;
+		goto err_cancel_work;
 	}
 
 	amd_pmf_hex_dump_pb(dev);
 
-	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
+	dev->prev_data = devm_kzalloc(dev->dev, sizeof(*dev->prev_data), GFP_KERNEL);
 	if (!dev->prev_data) {
 		ret = -ENOMEM;
-		goto err_free_policy;
+		goto err_cancel_work;
 	}
 
 	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
 		ret = amd_pmf_tee_init(dev, &amd_pmf_ta_uuid[i]);
 		if (ret)
-			goto err_free_prev_data;
+			goto err_cancel_work;
 
 		ret = amd_pmf_start_policy_engine(dev);
 		switch (ret) {
@@ -575,7 +573,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 		default:
 			ret = -EINVAL;
 			amd_pmf_tee_deinit(dev);
-			goto err_free_prev_data;
+			goto err_cancel_work;
 		}
 
 		if (status)
@@ -584,7 +582,7 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 
 	if (!status && !pb_side_load) {
 		ret = -EINVAL;
-		goto err_free_prev_data;
+		goto err_cancel_work;
 	}
 
 	if (pb_side_load)
@@ -600,12 +598,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
 	if (pb_side_load && dev->esbin)
 		amd_pmf_remove_pb(dev);
 	amd_pmf_tee_deinit(dev);
-err_free_prev_data:
-	kfree(dev->prev_data);
-err_free_policy:
-	kfree(dev->policy_buf);
-err_free_dram_buf:
-	kfree(dev->buf);
 err_cancel_work:
 	cancel_delayed_work_sync(&dev->pb_work);
 
@@ -621,11 +613,5 @@ void amd_pmf_deinit_smart_pc(struct amd_pmf_dev *dev)
 		amd_pmf_remove_pb(dev);
 
 	cancel_delayed_work_sync(&dev->pb_work);
-	kfree(dev->prev_data);
-	dev->prev_data = NULL;
-	kfree(dev->policy_buf);
-	dev->policy_buf = NULL;
-	kfree(dev->buf);
-	dev->buf = NULL;
 	amd_pmf_tee_deinit(dev);
 }
-- 
2.43.0


