Return-Path: <platform-driver-x86+bounces-3429-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D058CC088
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 May 2024 13:47:37 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 078E01F23251
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 May 2024 11:47:37 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4220813D51F;
	Wed, 22 May 2024 11:47:33 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1EB4B81748;
	Wed, 22 May 2024 11:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716378453; cv=none; b=cDOszeEIqLnAESv9/SAIPLlVpybuNi84xjgqziTAOs09gDfjOw/CyVDYtJ5E4HtQFvkTjW764HOWAgN1x5GTj9yBqQ72H1NLJf0MEXKbtM71YzQpNJLRmz0IPtgJNGpAJySZyfWrNNvtU19qFR97KXGUoXSW31wkLXKJoUGRCZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716378453; c=relaxed/simple;
	bh=ppwqjPG9mdV4Umy1sHG2Px7mW5uUSyzM6jDoXKQ5aQk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=JEtT26r6p0N0vR7dqiwwUENrMeIGEO189pyesMsC/FQhd5kq5DCDT+6Jyixt5xlTHjEvVxaQbM26WjuJcHrfc7DDQtzX7KUBl5ZnQvdDFcKoSs6ESq2LGT+Rryhwt2Cu4Ih0iAzjy0X3S4k8oYuo/S0B4Ojjgbxq61ohn/Fr6yo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEDA8C2BD11;
	Wed, 22 May 2024 11:47:31 +0000 (UTC)
Date: Wed, 22 May 2024 07:48:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Hans de Goede
 <hdegoede@redhat.com>, "Ilpo =?UTF-8?B?SsOkcnZpbmVu?="
 <ilpo.jarvinen@linux.intel.com>, platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: thinkpad_acpi: Select INPUT_SPARSEKMAP in
 Kconfig
Message-ID: <20240522074813.379b9fc2@gandalf.local.home>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

From: "Steven Rostedt (Google)" <rostedt@goodmis.org>

Now that drivers/platform/x86/thinkpad_acpi.c uses
sparse_keymap_report_event(), it must select INPUT_SPARSEKMAP in its
Kconfig option otherwise the build fails with:

  ld: vmlinux.o: in function `tpacpi_input_send_key':
  thinkpad_acpi.c:(.text+0xd4d27f): undefined reference to `sparse_keymap_report_event'
  ld: vmlinux.o: in function `hotkey_init':
  thinkpad_acpi.c:(.init.text+0x66cb6): undefined reference to `sparse_keymap_setup'

Fixes: 42f7b965de9d ("platform/x86: thinkpad_acpi: Switch to using sparse-keymap helpers")
Signed-off-by: Steven Rostedt (Google) <rostedt@goodmis.org>
---
 drivers/platform/x86/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
index 0ec952b5d03e..1953317541ea 100644
--- a/drivers/platform/x86/Kconfig
+++ b/drivers/platform/x86/Kconfig
@@ -515,6 +515,7 @@ config THINKPAD_ACPI
 	select NVRAM
 	select NEW_LEDS
 	select LEDS_CLASS
+	select INPUT_SPARSEKMAP
 	help
 	  This is a driver for the IBM and Lenovo ThinkPad laptops. It adds
 	  support for Fn-Fx key combinations, Bluetooth control, video
-- 
2.43.0


