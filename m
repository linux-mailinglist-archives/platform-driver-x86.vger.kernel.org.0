Return-Path: <platform-driver-x86+bounces-11747-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 04B35AA6C4C
	for <lists+platform-driver-x86@lfdr.de>; Fri,  2 May 2025 10:09:24 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7A3D47A70BF
	for <lists+platform-driver-x86@lfdr.de>; Fri,  2 May 2025 08:08:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5970422A4DA;
	Fri,  2 May 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tI5PG4Qe"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30DDE19FA92;
	Fri,  2 May 2025 08:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746173357; cv=none; b=b6LIK5Z7zC/sdeJmqlGRZ4s7XSRPMrDCkZUjGn2u8/spVc370x+ts1+Lc5IQo1bO3etAjCMlYGOYxEWOmmIcWz9ZhsPBpvAIMdmE7ibnrA4xvPfGSfeR6tR7pl4t7Y9m9ajf+ws9GSUcVOuZwMy7rQC6EPLjNfuGQ+E72qnxFL8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746173357; c=relaxed/simple;
	bh=222XQO8mIFdeK93gPTX+FiisVY1wVm+zHaX+uMTtNyk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pQLmi9sQdFA093lGkewBPKxUH7B+AA8iSpLsVbAIrkf+rOciE8T13af9T2N61is/l69vIs6Dz632AvxGzYuHEnpDmPil4JJWgb4+Be/aqZYqDCy1lt9NiF/RV5NzKV1It+fIn637iRr/9ru3hn1QtSQPxpBtPjg8I3AWBO5LLGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tI5PG4Qe; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0DF5BC4CEE9;
	Fri,  2 May 2025 08:09:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746173357;
	bh=222XQO8mIFdeK93gPTX+FiisVY1wVm+zHaX+uMTtNyk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=tI5PG4QeQvzMFh47B/4Vn8cSYMmEDtnZfQ6+CoGrMrCPy1Usjv22jk7ewble98gBB
	 o9F6c0qSUFJtrdntZRhROKrQbJk1Nb/982wVWnneyo/1COamhi+t9gCZjSY7XIrLrx
	 5PT+ZNRhI3808sFc0RolUwj/9IdL8hyvmw+ucX19uc1QjXlpUHqxKgM/pLuKN2rJ1T
	 4FTtscmRJ45dRUj1nRXdsHecB4xdLCZCjo9F4TQRwIA6LjhScl5je06ovdyUCKxvPx
	 muzrIdZ6SXEEG8bm9snzIc8LBSrRS2BUNSkPxrxytRtewLuS2wuNz+nKA+zpY7lsZx
	 eE6fMBWz5S/dg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F337AC3ABA3;
	Fri,  2 May 2025 08:09:16 +0000 (UTC)
From: Kurt Borja via B4 Relay <devnull+kuurtb.gmail.com@kernel.org>
Date: Fri, 02 May 2025 05:09:01 -0300
Subject: [PATCH v3 2/2] Documentation: wmi: alienware-wmi: Add GPIO control
 documentation
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-awcc-gpio-v3-2-ea9a932d1124@gmail.com>
References: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
In-Reply-To: <20250502-awcc-gpio-v3-0-ea9a932d1124@gmail.com>
To: Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Armin Wolf <W_Armin@gmx.de>
Cc: Gabriel Marcano <gabemarcano@yahoo.com>, 
 platform-driver-x86@vger.kernel.org, Dell.Client.Kernel@dell.com, 
 linux-kernel@vger.kernel.org, Kurt Borja <kuurtb@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5479; i=kuurtb@gmail.com;
 h=from:subject:message-id;
 bh=E4gkeRIqe9/4ceUXqpKcpLW0DOBvrYPY99p6cCu4H4U=;
 b=owGbwMvMwCUmluBs8WX+lTTG02pJDBkitas33Wpax7vO/vsO0Z+r3/C2PTH6evzfVsu1txJvR
 JYHaQbP6yhlYRDjYpAVU2RpT1j07VFU3lu/A6H3YeawMoEMYeDiFICJXDvEyPCHp6bqjYCasOVS
 oZ5qY7d9k9ezm1+1lQoOfb3qveZ/Q15Ghp677y2PvPnCbTfffMkkLW3BOKOiZe84bs48bKa5KIB
 RjxEA
X-Developer-Key: i=kuurtb@gmail.com; a=openpgp;
 fpr=54D3BE170AEF777983C3C63B57E3B6585920A69A
X-Endpoint-Received: by B4 Relay for kuurtb@gmail.com/default with
 auth_id=387
X-Original-From: Kurt Borja <kuurtb@gmail.com>
Reply-To: kuurtb@gmail.com

From: Kurt Borja <kuurtb@gmail.com>

Add documentation for the GPIO control methods.

Reviewed-by: Armin Wolf <W_Armin@gmx.de>
Signed-off-by: Kurt Borja <kuurtb@gmail.com>
---
 Documentation/wmi/devices/alienware-wmi.rst | 82 +++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/Documentation/wmi/devices/alienware-wmi.rst b/Documentation/wmi/devices/alienware-wmi.rst
index 79238051b18bc5de9b502325017cd5c5fcf41748..1d9d43e2e314b03c134e6c63a0f9124036939e32 100644
--- a/Documentation/wmi/devices/alienware-wmi.rst
+++ b/Documentation/wmi/devices/alienware-wmi.rst
@@ -231,6 +231,74 @@ WMI method MemoryOCControl([in] uint32 arg2, [out] uint32 argr)
 AWCC supports memory overclocking, but this method is very intricate and has
 not been deciphered yet.
 
+GPIO control Methods
+====================
+
+Alienware and Dell G Series devices with the AWCC interface usually have an
+embedded STM32 RGB lighting controller with USB/HID capabilities. It's vendor ID
+is ``187c`` while it's product ID may vary from model to model.
+
+The control of two GPIO pins of this MCU is exposed as WMI methods for debugging
+purposes.
+
++--------------+--------------------------------------------------------------+
+| Pin          | Description                                                  |
++==============+===============================+==============================+
+| 0            | Device Firmware Update (DFU)  | **HIGH**: Enables DFU mode   |
+|              | mode pin.                     | on next MCU boot.            |
+|              |                               +------------------------------+
+|              |                               | **LOW**: Disables DFU mode   |
+|              |                               | on next MCU boot.            |
++--------------+-------------------------------+------------------------------+
+| 1            | Negative Reset (NRST) pin.    | **HIGH**: MCU is ON.         |
+|              |                               |                              |
+|              |                               +------------------------------+
+|              |                               | **LOW**: MCU is OFF.         |
+|              |                               |                              |
++--------------+-------------------------------+------------------------------+
+
+See :ref:`acknowledgements` for more information on this MCU.
+
+.. note::
+   Some GPIO control methods break the usual argument structure and take a
+   **Pin number** instead of an operation on the first byte.
+
+WMI method FWUpdateGPIOtoggle([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| Pin number         | Set the pin status                 | - Byte 1: Pin      |
+|                    |                                    |   status           |
++--------------------+------------------------------------+--------------------+
+
+WMI method ReadTotalofGPIOs([out] uint32 argr)
+----------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| N/A                | Get the total number of GPIOs      | - None             |
++--------------------+------------------------------------+--------------------+
+
+.. note::
+   Due to how WMI methods are implemented on the firmware level, this method
+   requires a dummy uint32 input argument when invoked.
+
+WMI method ReadGPIOpPinStatus([in] uint32 arg2, [out] uint32 argr)
+------------------------------------------------------------------
+
++--------------------+------------------------------------+--------------------+
+| Operation (Byte 0) | Description                        | Arguments          |
++====================+====================================+====================+
+| Pin number         | Get the pin status                 | - None             |
++--------------------+------------------------------------+--------------------+
+
+.. note::
+   There known firmware bug in some laptops where reading the status of a pin
+   also flips it.
+
 Other information Methods
 =========================
 
@@ -239,10 +307,16 @@ WMI method ReadChassisColor([out] uint32 argr)
 
 Returns the chassis color internal ID.
 
+.. _acknowledgements:
+
 Acknowledgements
 ================
 
-Kudos to `AlexIII <https://github.com/AlexIII/tcc-g15>`_ and
-`T-Troll <https://github.com/T-Troll/alienfx-tools/>`_ for documenting and
-testing some of this device's functionality, making it possible to generalize
-this driver.
+Kudos to
+
+* `AlexIII <https://github.com/AlexIII/tcc-g15>`_
+* `T-Troll <https://github.com/T-Troll/alienfx-tools/>`_
+* `Gabriel Marcano <https://gabriel.marcanobrady.family/blog/2024/12/16/dell-g5-5505-se-acpi-or-figuring-out-how-to-reset-the-rgb-controller/>`_
+
+for documenting and testing some of this device's functionality, making it
+possible to generalize this driver.

-- 
2.49.0



