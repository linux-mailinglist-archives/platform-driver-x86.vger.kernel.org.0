Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2AB423F11C0
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Aug 2021 05:32:27 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236977AbhHSDc5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Aug 2021 23:32:57 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:53847 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S236933AbhHSDcz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Aug 2021 23:32:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629343939;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=t+dxYdnLHHLiH5KtqU+57r0e4Mg/OrQotuXwyv/yF7E=;
        b=ZW+Num2OiZxRCrPsOjXIwFlS6/6+wdscFYSipMZBU94s09nDwpJcS/q5zOT2q9G6um9hrE
        TBUlcAPKDqej3Ppuozy8X2dIe9W8C1bfOh+HG41h+thhXTTwRuCfg8pHadesKcOtkq1ocf
        UG2TV1XyegE6HrEIn9xdnZNQx2oNIsA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-124-DGYtKKGMMcitWDABxR-uAA-1; Wed, 18 Aug 2021 23:32:18 -0400
X-MC-Unique: DGYtKKGMMcitWDABxR-uAA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5590E8799F1;
        Thu, 19 Aug 2021 03:32:16 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.64.242.122])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1C89E19C87;
        Thu, 19 Aug 2021 03:32:12 +0000 (UTC)
From:   Kate Hsuan <hpa@redhat.com>
To:     Alex Hung <alex.hung@canonical.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        linux-kernel@vger.kernel.org, Dell.Client.Kernel@dell.com
Cc:     platform-driver-x86@vger.kernel.org, Kate Hsuan <hpa@redhat.com>
Subject: [PATCH v3 20/20] platform/x86: intel-wmi-thunderbolt: Move to intel sub-directory
Date:   Thu, 19 Aug 2021 11:30:01 +0800
Message-Id: <20210819033001.20136-21-hpa@redhat.com>
In-Reply-To: <20210819033001.20136-1-hpa@redhat.com>
References: <20210819033001.20136-1-hpa@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Move intel-wmi-thunderbolt to intel sub-directory to improve
readability.

Signed-off-by: Kate Hsuan <hpa@redhat.com>
---
 drivers/platform/x86/Kconfig                         | 12 ------------
 drivers/platform/x86/Makefile                        |  2 --
 drivers/platform/x86/intel/Makefile                  |  1 +
 drivers/platform/x86/intel/wmi/Kconfig               | 12 ++++++++++++
 drivers/platform/x86/intel/wmi/Makefile              |  2 ++
 .../wmi/thunderbolt.c}                               |  0
 6 files changed, 15 insertions(+), 14 deletions(-)
 rename drivers/platform/x86/{intel-wmi-thunderbolt.c => intel/wmi/thunderbolt.c} (100%)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 611930985b1d..adecdc0d4748 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -77,18 +77,6 @@ config UV_SYSFS
 	  To compile this driver as a module, choose M here: the module will
 	  be called uv_sysfs.
 
-config INTEL_WMI_THUNDERBOLT
-	tristate "Intel WMI thunderbolt force power driver"
-	depends on ACPI_WMI
-	help
-	  Say Y here if you want to be able to use the WMI interface on select
-	  systems to force the power control of Intel Thunderbolt controllers.
-	  This is useful for updating the firmware when devices are not plugged
-	  into the controller.
-
-	  To compile this driver as a module, choose M here: the module will
-	  be called intel-wmi-thunderbolt.
-
 config MXM_WMI
        tristate "WMI support for MXM Laptop Graphics"
        depends on ACPI_WMI
diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
index 0a6dca068d5a..56cff979428b 100644
--- a/drivers/platform/x86/Makefile
+++ b/drivers/platform/x86/Makefile
@@ -10,8 +10,6 @@ obj-$(CONFIG_WMI_BMOF)		+= wmi-bmof.o
 
 # WMI drivers
 obj-$(CONFIG_HUAWEI_WMI)		+= huawei-wmi.o
-
-obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
 obj-$(CONFIG_MXM_WMI)			+= mxm-wmi.o
 obj-$(CONFIG_PEAQ_WMI)			+= peaq-wmi.o
 obj-$(CONFIG_XIAOMI_WMI)		+= xiaomi-wmi.o
diff --git a/drivers/platform/x86/intel/Makefile b/drivers/platform/x86/intel/Makefile
index 0b27be3b9334..2c1bab610499 100644
--- a/drivers/platform/x86/intel/Makefile
+++ b/drivers/platform/x86/intel/Makefile
@@ -50,3 +50,4 @@ obj-$(CONFIG_INTEL_SPEED_SELECT_INTERFACE)	+= speed_select_if/
 
 #WMI drivers
 obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)		+= wmi/
+obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)		+= wmi/
diff --git a/drivers/platform/x86/intel/wmi/Kconfig b/drivers/platform/x86/intel/wmi/Kconfig
index fc70728e0f1f..0d65fc90f5b1 100644
--- a/drivers/platform/x86/intel/wmi/Kconfig
+++ b/drivers/platform/x86/intel/wmi/Kconfig
@@ -12,3 +12,15 @@ config INTEL_WMI_SBL_FW_UPDATE
 
 	  To compile this driver as a module, choose M here: the module will
 	  be called intel-wmi-sbl-fw-update.
+
+config INTEL_WMI_THUNDERBOLT
+	tristate "Intel WMI thunderbolt force power driver"
+	depends on ACPI_WMI
+	help
+	  Say Y here if you want to be able to use the WMI interface on select
+	  systems to force the power control of Intel Thunderbolt controllers.
+	  This is useful for updating the firmware when devices are not plugged
+	  into the controller.
+
+	  To compile this driver as a module, choose M here: the module will
+	  be called intel-wmi-thunderbolt.
diff --git a/drivers/platform/x86/intel/wmi/Makefile b/drivers/platform/x86/intel/wmi/Makefile
index bf1f118b6839..c2d56d25dea0 100644
--- a/drivers/platform/x86/intel/wmi/Makefile
+++ b/drivers/platform/x86/intel/wmi/Makefile
@@ -5,3 +5,5 @@
 
 intel-wmi-sbl-fw-update-y				:= sbl-fw-update.o
 obj-$(CONFIG_INTEL_WMI_SBL_FW_UPDATE)	+= intel-wmi-sbl-fw-update.o
+intel-wmi-thunderbolt-y					:= thunderbolt.o
+obj-$(CONFIG_INTEL_WMI_THUNDERBOLT)	+= intel-wmi-thunderbolt.o
diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel/wmi/thunderbolt.c
similarity index 100%
rename from drivers/platform/x86/intel-wmi-thunderbolt.c
rename to drivers/platform/x86/intel/wmi/thunderbolt.c
-- 
2.31.1

