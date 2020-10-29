Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E5A9B29EA63
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Oct 2020 12:22:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726078AbgJ2LWd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 29 Oct 2020 07:22:33 -0400
Received: from szxga05-in.huawei.com ([45.249.212.191]:7098 "EHLO
        szxga05-in.huawei.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbgJ2LWc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Oct 2020 07:22:32 -0400
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
        by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4CMNMG226MzLn2f;
        Thu, 29 Oct 2020 19:22:18 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 29 Oct 2020 19:22:10 +0800
From:   Zou Wei <zou_wei@huawei.com>
To:     <hdegoede@redhat.com>, <mgross@linux.intel.com>
CC:     <platform-driver-x86@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, "Zou Wei" <zou_wei@huawei.com>
Subject: [PATCH -next] platform/x86/dell-wmi-sysman: Make some symbols static
Date:   Thu, 29 Oct 2020 19:34:09 +0800
Message-ID: <1603971249-64044-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Fix the following sparse warnings:

drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:38:23:
warning: symbol 'po_is_pass_set' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:70:23: warning: 
symbol 'po_current_password' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:99:23:
warning: symbol 'po_new_password' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:103:23:
warning: symbol 'po_min_pass_length' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:107:23:
warning: symbol 'po_max_pass_length' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:116:23:
warning: symbol 'po_mechanism' was not declared. Should it be static?
drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c:129:23:
warning: symbol 'po_role' was not declared. Should it be static?

po_is_pass_set, po_current_password, po_new_password, 
po_min_pass_length, po_max_pass_length, po_mechanism and po_role
have only call within passobj-attributes.c
They should be static

Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c b/drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c
index e6199fb..81562b1 100644
--- a/drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c
+++ b/drivers/platform/x86/dell-wmi-sysman/passobj-attributes.c
@@ -35,7 +35,7 @@ static ssize_t is_enabled_show(struct kobject *kobj, struct kobj_attribute *attr
 	return ret;
 }
 
-struct kobj_attribute po_is_pass_set =
+static struct kobj_attribute po_is_pass_set =
 		__ATTR_RO(is_enabled);
 
 static ssize_t current_password_store(struct kobject *kobj,
@@ -67,7 +67,7 @@ static ssize_t current_password_store(struct kobject *kobj,
 	return count;
 }
 
-struct kobj_attribute po_current_password =
+static struct kobj_attribute po_current_password =
 		__ATTR_WO(current_password);
 
 static ssize_t new_password_store(struct kobject *kobj,
@@ -96,15 +96,15 @@ static ssize_t new_password_store(struct kobject *kobj,
 	return ret ? ret : count;
 }
 
-struct kobj_attribute po_new_password =
+static struct kobj_attribute po_new_password =
 		__ATTR_WO(new_password);
 
 attribute_n_property_show(min_password_length, po);
-struct kobj_attribute po_min_pass_length =
+static struct kobj_attribute po_min_pass_length =
 		__ATTR_RO(min_password_length);
 
 attribute_n_property_show(max_password_length, po);
-struct kobj_attribute po_max_pass_length =
+static struct kobj_attribute po_max_pass_length =
 		__ATTR_RO(max_password_length);
 
 static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -113,7 +113,7 @@ static ssize_t mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
 	return sprintf(buf, "password\n");
 }
 
-struct kobj_attribute po_mechanism =
+static struct kobj_attribute po_mechanism =
 	__ATTR_RO(mechanism);
 
 static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
@@ -126,7 +126,7 @@ static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
 	return -EIO;
 }
 
-struct kobj_attribute po_role =
+static struct kobj_attribute po_role =
 	__ATTR_RO(role);
 
 static struct attribute *po_attrs[] = {
-- 
2.6.2

