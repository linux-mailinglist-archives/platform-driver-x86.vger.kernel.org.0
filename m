Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C34DC48BD20
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jan 2022 03:25:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348490AbiALCZ0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jan 2022 21:25:26 -0500
Received: from mga12.intel.com ([192.55.52.136]:50594 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1348482AbiALCZ0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 21:25:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1641954326; x=1673490326;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=pRlkgtVYHyK0F8BrC7N7odv1pJXwI6Azj/FyryriqSA=;
  b=dDJx/XQPT02yuYiXncxhaIOQB4QPekd76bxVXzzk9hoBw05pbMaD3BMB
   0o1ymsBo6Gjiy1tu/EdnPEIhCWS5WArzYVb6SmLrm6iUSwrJTAjMRCKHQ
   pTyp5LczthiDfhTagWFv+55J47bPIFuxPoyb80yIPHawUSIl0kl3VJ2Yl
   vzBUe1wUv0i6pcuhXBNAjpBJczsXnZCBvyhQJicPA7UtK9mJSdTSXxuRS
   PwtCjY5r0jAwQ++xz+knqWl48Y7AQMbhw6NqPWDf9HNgibG6IlmLodCwC
   HUdw51+KjUNDjhkV7R6q6zE3FcLXacfYD1yw0h7vunWdFHyVk9UkhjXjY
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10224"; a="223625374"
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; 
   d="scan'208";a="223625374"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2022 18:25:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.88,281,1635231600"; 
   d="scan'208";a="670012631"
Received: from spandruv-desk.jf.intel.com ([10.54.75.8])
  by fmsmga001.fm.intel.com with ESMTP; 11 Jan 2022 18:25:24 -0800
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     liwei.song@windriver.com, hdegoede@redhat.com, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Subject: [PATCH] platform/x86: ISST: Fix possible circular locking dependency detected
Date:   Tue, 11 Jan 2022 18:25:21 -0800
Message-Id: <20220112022521.54669-1-srinivas.pandruvada@linux.intel.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

As reported:

[  256.104522] ======================================================
[  256.113783] WARNING: possible circular locking dependency detected
[  256.120093] 5.16.0-rc6-yocto-standard+ #99 Not tainted
[  256.125362] ------------------------------------------------------
[  256.131673] intel-speed-sel/844 is trying to acquire lock:
[  256.137290] ffffffffc036f0d0 (punit_misc_dev_lock){+.+.}-{3:3}, at: isst_if_open+0x18/0x90 [isst_if_common]
[  256.147171]
[  256.147171] but task is already holding lock:
[  256.153135] ffffffff8ee7cb50 (misc_mtx){+.+.}-{3:3}, at: misc_open+0x2a/0x170
[  256.160407]
[  256.160407] which lock already depends on the new lock.
[  256.160407]
[  256.168712]
[  256.168712] the existing dependency chain (in reverse order) is:
[  256.176327]
[  256.176327] -> #1 (misc_mtx){+.+.}-{3:3}:
[  256.181946]        lock_acquire+0x1e6/0x330
[  256.186265]        __mutex_lock+0x9b/0x9b0
[  256.190497]        mutex_lock_nested+0x1b/0x20
[  256.195075]        misc_register+0x32/0x1a0
[  256.199390]        isst_if_cdev_register+0x65/0x180 [isst_if_common]
[  256.205878]        isst_if_probe+0x144/0x16e [isst_if_mmio]
...
[  256.241976]
[  256.241976] -> #0 (punit_misc_dev_lock){+.+.}-{3:3}:
[  256.248552]        validate_chain+0xbc6/0x1750
[  256.253131]        __lock_acquire+0x88c/0xc10
[  256.257618]        lock_acquire+0x1e6/0x330
[  256.261933]        __mutex_lock+0x9b/0x9b0
[  256.266165]        mutex_lock_nested+0x1b/0x20
[  256.270739]        isst_if_open+0x18/0x90 [isst_if_common]
[  256.276356]        misc_open+0x100/0x170
[  256.280409]        chrdev_open+0xa5/0x1e0
...

The call sequence suggested that misc_device /dev file can be opened
before misc device is yet to be registered, which is done only once.

Here punit_misc_dev_lock was used as common lock, to protect the
registration by multiple ISST HW drivers, one time setup, prevent
duplicate registry of misc device and prevent load/unload when device
is open.

We can split into locks:
- One which just prevent duplicate call to misc_register() and one
time setup. Also never call again if the misc_register() failed or
required one time setup is failed. This lock is not shared with
any misc device callbacks.

- The other lock protects registry, load and unload of HW drivers.

Sequence in isst_if_cdev_register()
- Register callbacks under punit_misc_dev_open_lock
- Call isst_misc_reg() which registers misc_device on the first
registry which is under punit_misc_dev_reg_lock, which is not
shared with callbacks.

Sequence in isst_if_cdev_unregister
Just opposite of isst_if_cdev_register

Reported-and-tested-by: Liwei Song <liwei.song@windriver.com>
Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
---
 .../intel/speed_select_if/isst_if_common.c    | 97 ++++++++++++-------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index c9a85eb2e860..e8424e70d81d 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -596,7 +596,10 @@ static long isst_if_def_ioctl(struct file *file, unsigned int cmd,
 	return ret;
 }
 
-static DEFINE_MUTEX(punit_misc_dev_lock);
+/* Lock to prevent module registration when already opened by user space */
+static DEFINE_MUTEX(punit_misc_dev_open_lock);
+/* Lock to allow one share misc device for all ISST interace */
+static DEFINE_MUTEX(punit_misc_dev_reg_lock);
 static int misc_usage_count;
 static int misc_device_ret;
 static int misc_device_open;
@@ -606,7 +609,7 @@ static int isst_if_open(struct inode *inode, struct file *file)
 	int i, ret = 0;
 
 	/* Fail open, if a module is going away */
-	mutex_lock(&punit_misc_dev_lock);
+	mutex_lock(&punit_misc_dev_open_lock);
 	for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
 		struct isst_if_cmd_cb *cb = &punit_callbacks[i];
 
@@ -628,7 +631,7 @@ static int isst_if_open(struct inode *inode, struct file *file)
 	} else {
 		misc_device_open++;
 	}
-	mutex_unlock(&punit_misc_dev_lock);
+	mutex_unlock(&punit_misc_dev_open_lock);
 
 	return ret;
 }
@@ -637,7 +640,7 @@ static int isst_if_relase(struct inode *inode, struct file *f)
 {
 	int i;
 
-	mutex_lock(&punit_misc_dev_lock);
+	mutex_lock(&punit_misc_dev_open_lock);
 	misc_device_open--;
 	for (i = 0; i < ISST_IF_DEV_MAX; ++i) {
 		struct isst_if_cmd_cb *cb = &punit_callbacks[i];
@@ -645,7 +648,7 @@ static int isst_if_relase(struct inode *inode, struct file *f)
 		if (cb->registered)
 			module_put(cb->owner);
 	}
-	mutex_unlock(&punit_misc_dev_lock);
+	mutex_unlock(&punit_misc_dev_open_lock);
 
 	return 0;
 }
@@ -662,6 +665,43 @@ static struct miscdevice isst_if_char_driver = {
 	.fops		= &isst_if_char_driver_ops,
 };
 
+static int isst_misc_reg(void)
+{
+	mutex_lock(&punit_misc_dev_reg_lock);
+	if (misc_device_ret)
+		goto unlock_exit;
+
+	if (!misc_usage_count) {
+		misc_device_ret = isst_if_cpu_info_init();
+		if (misc_device_ret)
+			goto unlock_exit;
+
+		misc_device_ret = misc_register(&isst_if_char_driver);
+		if (misc_device_ret) {
+			isst_if_cpu_info_exit();
+			goto unlock_exit;
+		}
+	}
+	misc_usage_count++;
+
+unlock_exit:
+	mutex_unlock(&punit_misc_dev_reg_lock);
+
+	return misc_device_ret;
+}
+
+static void isst_misc_unreg(void)
+{
+	mutex_lock(&punit_misc_dev_reg_lock);
+	if (misc_usage_count)
+		misc_usage_count--;
+	if (!misc_usage_count && !misc_device_ret) {
+		misc_deregister(&isst_if_char_driver);
+		isst_if_cpu_info_exit();
+	}
+	mutex_unlock(&punit_misc_dev_reg_lock);
+}
+
 /**
  * isst_if_cdev_register() - Register callback for IOCTL
  * @device_type: The device type this callback handling.
@@ -679,38 +719,31 @@ static struct miscdevice isst_if_char_driver = {
  */
 int isst_if_cdev_register(int device_type, struct isst_if_cmd_cb *cb)
 {
-	if (misc_device_ret)
-		return misc_device_ret;
+	int ret;
 
 	if (device_type >= ISST_IF_DEV_MAX)
 		return -EINVAL;
 
-	mutex_lock(&punit_misc_dev_lock);
+	mutex_lock(&punit_misc_dev_open_lock);
+	/* Device is already open, we don't want to add new callbacks */
 	if (misc_device_open) {
-		mutex_unlock(&punit_misc_dev_lock);
+		mutex_unlock(&punit_misc_dev_open_lock);
 		return -EAGAIN;
 	}
-	if (!misc_usage_count) {
-		int ret;
-
-		misc_device_ret = misc_register(&isst_if_char_driver);
-		if (misc_device_ret)
-			goto unlock_exit;
-
-		ret = isst_if_cpu_info_init();
-		if (ret) {
-			misc_deregister(&isst_if_char_driver);
-			misc_device_ret = ret;
-			goto unlock_exit;
-		}
-	}
 	memcpy(&punit_callbacks[device_type], cb, sizeof(*cb));
 	punit_callbacks[device_type].registered = 1;
-	misc_usage_count++;
-unlock_exit:
-	mutex_unlock(&punit_misc_dev_lock);
+	mutex_unlock(&punit_misc_dev_open_lock);
 
-	return misc_device_ret;
+	ret = isst_misc_reg();
+	if (ret) {
+		/*
+		 * No need of mutex as the misc device register failed
+		 * as no one can open device yet. Hence no contention.
+		 */
+		punit_callbacks[device_type].registered = 0;
+		return ret;
+	}
+	return 0;
 }
 EXPORT_SYMBOL_GPL(isst_if_cdev_register);
 
@@ -725,16 +758,12 @@ EXPORT_SYMBOL_GPL(isst_if_cdev_register);
  */
 void isst_if_cdev_unregister(int device_type)
 {
-	mutex_lock(&punit_misc_dev_lock);
-	misc_usage_count--;
+	isst_misc_unreg();
+	mutex_lock(&punit_misc_dev_open_lock);
 	punit_callbacks[device_type].registered = 0;
 	if (device_type == ISST_IF_DEV_MBOX)
 		isst_delete_hash();
-	if (!misc_usage_count && !misc_device_ret) {
-		misc_deregister(&isst_if_char_driver);
-		isst_if_cpu_info_exit();
-	}
-	mutex_unlock(&punit_misc_dev_lock);
+	mutex_unlock(&punit_misc_dev_open_lock);
 }
 EXPORT_SYMBOL_GPL(isst_if_cdev_unregister);
 
-- 
2.25.1

