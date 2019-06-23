Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7D944FB88
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726439AbfFWMQn (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:43 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60409 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726452AbfFWMQn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:43 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:39 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1J001431;
        Sun, 23 Jun 2019 15:16:39 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 6/7] Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
Date:   Sun, 23 Jun 2019 12:16:29 +0000
Message-Id: <20190623121630.17945-7-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add documentation for the new attributes for exposing reset causes for
the next type of resets: caused by different watchdog, BIOS reload,
ASIC reset request.

Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 3544968f43cc..8ca498447aeb 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -120,3 +120,23 @@ Description:	These files show the system reset cause, as following: ComEx
 		the last reset cause.
 
 		The files are read only.
+
+Date:		June 2019
+KernelVersion:	5.3
+Contact:	Vadim Pasternak <vadimpmellanox.com>
+Description:	These files show the system reset cause, as following:
+		COMEX thermal shutdown; wathchdog power off or reset was derived
+		by one of the next components: COMEX, switch board or by Small Form
+		Factor mezzanine, reset requested from ASIC, reset cuased by BIOS
+		reload. Value 1 in file means this is reset cause, 0 - otherwise.
+		Only one of the above causes could be 1 at the same time, representing
+		only last reset cause.
+
+		The files are read only.
+
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_thermal
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_comex_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_from_asic
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_reload_bios
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_sff_wd
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/reset_swb_wd
-- 
2.11.0

