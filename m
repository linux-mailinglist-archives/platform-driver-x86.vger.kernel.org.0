Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0551C392153
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 May 2021 22:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233236AbhEZURL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 26 May 2021 16:17:11 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:42258 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234853AbhEZURH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 May 2021 16:17:07 -0400
Received: from [100.112.4.65] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id D3/CE-61458-76CAEA06; Wed, 26 May 2021 20:15:35 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrNIsWRWlGSWpSXmKPExsWSLveKXTd9zbo
  Eg2tzmS1eTjjMaHFowwEmi+7uuUwWb45PZ7JYvecFs8Wij0/YHNg8Js2cweyxc9Zddo/3+66y
  eXzeJBfAEsWamZeUX5HAmnHsTzdrwWTpijU/TrA3MO4S72Lk4hAS+M8o8ffkF1YI5w2jxLUXR
  5i6GDk52AS0JbZs+cXWxcjBISIgI/FhrSdIDbPAJkaJOws2gtUIC0RLnFsylR3EZhFQldj59y
  EbiM0rYCWxsOU7M4gtISAvcfrENUYQm1PAWqJt5xQWkJlCAiES7/fIQpQLSpyc+YQFxGYGKm/
  eOpsZwpaQOPjiBdQYBYmbL9axQNgJEj3/HrFNYBSYhaR9FpL2WUjaFzAyr2I0TSrKTM8oyU3M
  zNE1NDDQNTQ00jXTNbPQS6zSTdYrLdZNTSwu0TXUSywv1iuuzE3OSdHLSy3ZxAiMg5QCNpcdj
  EvefNA7xCjJwaQkyivlvzpBiC8pP6UyI7E4I76oNCe1+BCjDAeHkgTvxJXrEoQEi1LTUyvSMn
  OAMQmTluDgURLhvbAUKM1bXJCYW5yZDpE6xagoJc6rthooIQCSyCjNg2uDpYFLjLJSwryMDAw
  MQjwFqUW5mSWo8q8YxTkYlYR5f4Js58nMK4Gb/gpoMRPQYqFEsMUliQgpqQamAsmjuxOf1x1k
  tJkclV7FUBF6n32VTYrsrOmWmuE6C9myFHRnMu06/qG264f2Vc33TL7brBpU0iPjjvJ3hr2OP
  v24L0cis7t+9swpRdM17j48abX62k9D/q8yJRwa3uFTqoLDHC1fnjicuv1x4o3dtRs4gucVac
  6JVsnJu3b40z9Ji+dO8+b8/vhWps5j9sydM55sZgo+WLGrtVhSXZJhgRvr9fx28Y+nayJWLjH
  /WFLXZ3kptqlmzdTfF1fKL/JWzTK7dmFOySOWnG9i7t5XVjd/F6+b+7bljqGAqOlUe7eZOypv
  f2Sfn7PMV2e/1YNp4VusRT5v2srP9OmLfb4m69aFvbWS7T+knx8slJZRYinOSDTUYi4qTgQAM
  81RoH4DAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-406.messagelabs.com!1622060133!26968!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.75.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 14655 invoked from network); 26 May 2021 20:15:34 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-9.tower-406.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 May 2021 20:15:34 -0000
Received: from reswpmail01.lenovo.com (unknown [10.62.32.20])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 988EA1A02ACC0345682F;
        Thu, 27 May 2021 04:15:31 +0800 (CST)
Received: from localhost.localdomain.com (10.64.87.238) by
 reswpmail01.lenovo.com (10.62.32.20) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2176.2; Wed, 26 May 2021 16:15:28 -0400
From:   Mark Pearson <markpearson@lenovo.com>
To:     <markpearson@lenovo.com>
CC:     <hdegoede@redhat.com>, <andy.shevchenko@gmail.com>,
        <prasanth.ksr@dell.com>, <divya.bharathi@dell.com>,
        <Dell.Client.Kernel@dell.com>,
        <platform-driver-x86@vger.kernel.org>
Subject: [PATCH v4 2/3] platform/x86: dell-wmi-sysman: Use firmware_attributes_class helper
Date:   Wed, 26 May 2021 16:14:46 -0400
Message-ID: <20210526201447.3686-2-markpearson@lenovo.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210526201447.3686-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
 <20210526201447.3686-1-markpearson@lenovo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.64.87.238]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail01.lenovo.com (10.62.32.20)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Update Dell WMI sysman driver to use newly implemented helper module.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Mark Pearson <markpearson@lenovo.com>
---
Changes in v2:
 - firmare_attributes_class.c added as reqested during review of the
   proposed think_lmi.c driver. Labeling as V2 to keep series
   consistent
 - Note, compile tested only due to lack of HW to test on. Matching
   changes were made in the think-lmi.c driver and worked. Please let me
   know if any problems!

Changes in v3:
 - Updated to use new firmware attribute class API names

Changes in v4:
 - version bump for consistency in series

 drivers/platform/x86/dell/Kconfig              |  1 +
 .../platform/x86/dell/dell-wmi-sysman/sysman.c | 18 ++++++++----------
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/platform/x86/dell/Kconfig b/drivers/platform/x86/dell/Kconfig
index e0a55337f..931f616ff 100644
--- a/drivers/platform/x86/dell/Kconfig
+++ b/drivers/platform/x86/dell/Kconfig
@@ -197,6 +197,7 @@ config DELL_WMI_SYSMAN
 	depends on ACPI_WMI
 	depends on DMI
 	select NLS
+	select FW_ATTR_CLASS
 	help
 	  This driver allows changing BIOS settings on many Dell machines from
 	  2018 and newer without the use of any additional software.
diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
index c8d276d78..06b3fe7da 100644
--- a/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
+++ b/drivers/platform/x86/dell/dell-wmi-sysman/sysman.c
@@ -13,14 +13,11 @@
 #include <linux/kernel.h>
 #include <linux/wmi.h>
 #include "dell-wmi-sysman.h"
+#include "../../firmware_attributes_class.h"
 
 #define MAX_TYPES  4
 #include <linux/nls.h>
 
-static struct class firmware_attributes_class = {
-	.name = "firmware-attributes",
-};
-
 struct wmi_sysman_priv wmi_priv = {
 	.mutex = __MUTEX_INITIALIZER(wmi_priv.mutex),
 };
@@ -28,6 +25,7 @@ struct wmi_sysman_priv wmi_priv = {
 /* reset bios to defaults */
 static const char * const reset_types[] = {"builtinsafe", "lastknowngood", "factory", "custom"};
 static int reset_option = -1;
+struct class *fw_attr_class;
 
 
 /**
@@ -541,11 +539,11 @@ static int __init sysman_init(void)
 		goto err_exit_bios_attr_pass_interface;
 	}
 
-	ret = class_register(&firmware_attributes_class);
+	ret = fw_attributes_class_get(&fw_attr_class);
 	if (ret)
 		goto err_exit_bios_attr_pass_interface;
 
-	wmi_priv.class_dev = device_create(&firmware_attributes_class, NULL, MKDEV(0, 0),
+	wmi_priv.class_dev = device_create(fw_attr_class, NULL, MKDEV(0, 0),
 				  NULL, "%s", DRIVER_NAME);
 	if (IS_ERR(wmi_priv.class_dev)) {
 		ret = PTR_ERR(wmi_priv.class_dev);
@@ -602,10 +600,10 @@ static int __init sysman_init(void)
 	release_attributes_data();
 
 err_destroy_classdev:
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
+	device_destroy(fw_attr_class, MKDEV(0, 0));
 
 err_unregister_class:
-	class_unregister(&firmware_attributes_class);
+	fw_attributes_class_put();
 
 err_exit_bios_attr_pass_interface:
 	exit_bios_attr_pass_interface();
@@ -619,8 +617,8 @@ static int __init sysman_init(void)
 static void __exit sysman_exit(void)
 {
 	release_attributes_data();
-	device_destroy(&firmware_attributes_class, MKDEV(0, 0));
-	class_unregister(&firmware_attributes_class);
+	device_destroy(fw_attr_class, MKDEV(0, 0));
+	fw_attributes_class_put();
 	exit_bios_attr_set_interface();
 	exit_bios_attr_pass_interface();
 }
-- 
2.31.1

