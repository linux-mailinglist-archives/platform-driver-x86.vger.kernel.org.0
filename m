Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9B7D400C50
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237260AbhIDR4I (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:08 -0400
Received: from mail-4322.protonmail.ch ([185.70.43.22]:34321 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR4H (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:07 -0400
Date:   Sat, 04 Sep 2021 17:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778104;
        bh=C+jpbm2TvlGkGChkqX7eTQhlM2Tx9ChZ6WVNZ5eQHts=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=eUhHkmyRryNjupBQPFP1U5jhXrNF6hlBaV43WV4jXcWdxLd6S1mCvV8xSNUSc4EV5
         c4MCq1QrpoxTRU/tLauF1X6U1rDA4QdY2xE1ctKR0pBklHSVT6ngI7lB7C2MxAnzlU
         dhBnff9I8MRQWu+hxf5NTEJHuc46QKdXg9V5n54M=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 01/30] platform/x86: wmi: fix kernel doc
Message-ID: <20210904175450.156801-2-pobrn@protonmail.com>
In-Reply-To: <20210904175450.156801-1-pobrn@protonmail.com>
References: <20210904175450.156801-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The kernel doc erroneously specified `wmi_uninstall_notify_handler()`
for the `wmi_remove_notify_handler()` function. Fix that.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 drivers/platform/x86/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index a76313006bdc..0b931629f0b0 100644
--- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -551,7 +551,7 @@ wmi_notify_handler handler, void *data)
 EXPORT_SYMBOL_GPL(wmi_install_notify_handler);

 /**
- * wmi_uninstall_notify_handler - Unregister handler for WMI events
+ * wmi_remove_notify_handler - Unregister handler for WMI events
  * @guid: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
  *
  * Unregister handler for events sent to the ACPI-WMI mapper device.
--
2.33.0


