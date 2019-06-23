Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 127AF4FB89
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726452AbfFWMQq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:46 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60413 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726417AbfFWMQq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:46 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:40 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1K001431;
        Sun, 23 Jun 2019 15:16:40 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated attribute for mlxreg-io sysfs interfaces
Date:   Sun, 23 Jun 2019 12:16:30 +0000
Message-Id: <20190623121630.17945-8-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20190623121630.17945-1-vadimp@mellanox.com>
References: <20190623121630.17945-1-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove duplicated attribute ‘jtag_en’, add instead missed attribute
‘cpld3_version’.

Fixes: 52675da1d087f ("Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces")
Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
---
 Documentation/ABI/stable/sysfs-driver-mlxreg-io | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
index 8ca498447aeb..54202975ac3b 100644
--- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
+++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
@@ -29,7 +29,7 @@ Description:	This file shows the system fans direction:
 
 		The files are read only.
 
-What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag_enable
+What:		/sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld3_version
 
 Date:		November 2018
 KernelVersion:	5.0
-- 
2.11.0

