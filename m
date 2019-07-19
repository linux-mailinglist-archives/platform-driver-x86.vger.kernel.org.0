Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8219D6EA7A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Jul 2019 20:07:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729577AbfGSSHR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Jul 2019 14:07:17 -0400
Received: from proxy01.fsdata.se ([89.221.252.211]:46264 "EHLO
        mail-gw01.fsdata.se" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729485AbfGSSHR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jul 2019 14:07:17 -0400
Received: from localhost (94.234.55.24) by DAG01.HMC.local (192.168.46.11)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 19 Jul 2019 19:52:03
 +0200
From:   Mattias Jacobsson <2pi@mok.nu>
To:     <andy.shevchenko@gmail.com>
CC:     <2pi@mok.nu>, <platform-driver-x86@vger.kernel.org>
Subject: [PATCH] platform/x86: wmi: add missing struct parameter description
Date:   Fri, 19 Jul 2019 19:51:45 +0200
Message-ID: <20190719175145.24923-1-2pi@mok.nu>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [94.234.55.24]
X-ClientProxiedBy: PROXY05.HMC.local (192.168.46.55) To DAG01.HMC.local
 (192.168.46.11)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add a description for the context parameter in the struct wmi_device_id.

Reported-by: kbuild test robot <lkp@intel.com>
Fixes: a48e23385fcf ("platform/x86: wmi: add context pointer field to struct wmi_device_id")
Signed-off-by: Mattias Jacobsson <2pi@mok.nu>
---
Hi Andy,
Per your request here is the patch. Two things;
1) I'm not sure what to write on the Reported-by tag, is it correct?
2) The hash used for the Fixes tag is the current one in Linus's tree,
is that okey or should I go about it differently?
Thanks, 
//Mattias
--
 include/linux/mod_devicetable.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
index b2c1648f7e5d..5714fd35a83c 100644
--- a/include/linux/mod_devicetable.h
+++ b/include/linux/mod_devicetable.h
@@ -814,6 +814,7 @@ struct tee_client_device_id {
 /**
  * struct wmi_device_id - WMI device identifier
  * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
+ * @context: pointer to driver specific data
  */
 struct wmi_device_id {
 	const char guid_string[UUID_STRING_LEN+1];
-- 
2.22.0

