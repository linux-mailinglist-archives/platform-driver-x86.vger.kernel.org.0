Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C7E5261C17
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Sep 2020 21:14:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731448AbgIHTOk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Sep 2020 15:14:40 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:57144 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731191AbgIHQEv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Sep 2020 12:04:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599581086;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=IIzrHUv8ibcbWv5IZd04X9ojSRoI+IcjBa56NjrRf8s=;
        b=LSHVdKmqda3GEc++Qt4VCAR9M+G5olRIhjgbHO3fPTXnTYrqT5xnfV+m4bn38484/UIzrN
        QfrDTgdQBZ0vQ3AZL6ueqo8r7YQ4k4ew+x03pYPTFh22JwG9/Bzo7mO6PIqLTP5J4HH7uY
        NJefBoteabEJNFECdmHRtJ7EUI4H3/4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-159-Ba-J-m8mPv-7reFMOdqKJw-1; Tue, 08 Sep 2020 09:52:12 -0400
X-MC-Unique: Ba-J-m8mPv-7reFMOdqKJw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 3DF7C1084CA3;
        Tue,  8 Sep 2020 13:52:10 +0000 (UTC)
Received: from x1.localdomain (ovpn-114-188.ams2.redhat.com [10.36.114.188])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9C15D27CC7;
        Tue,  8 Sep 2020 13:51:59 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-input@vger.kernel.org,
        Mark Pearson <mpearson@lenovo.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Bastien Nocera <hadess@hadess.net>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Subject: [PATCH v2 4/4] platform/x86: thinkpad_acpi: Map Clipping tool hotkey to KEY_SELECTIVE_SCREENSHOT
Date:   Tue,  8 Sep 2020 15:51:47 +0200
Message-Id: <20200908135147.4044-5-hdegoede@redhat.com>
In-Reply-To: <20200908135147.4044-1-hdegoede@redhat.com>
References: <20200908135147.4044-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Commit 696c6523ec8f ("platform/x86: thinkpad_acpi: add mapping for new
hotkeys") added support for a bunch of new hotkeys, but the
clipping/snipping tool hotkey got ignored because there was no good
key-code to map it to.

Recently a new KEY_SELECTIVE_SCREENSHOT keycode was added by commit
3b059da9835c ("Input: allocate keycode for "Selective Screenshot" key")
quoting from the commit message:

"New Chrome OS keyboards have a "snip" key that is basically a selective
screenshot (allows a user to select an area of screen to be copied).
Allocate a keycode for it."

Support for this "snip" key seems like it is also a good match for the
clipping/snipping tool hotkey, so map this hotkey to the new
KEY_SELECTIVE_SCREENSHOT key-code.

Reviewed-by: Bastien Nocera <hadess@hadess.net>
Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/thinkpad_acpi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 4b701e9a0392..47925c319d7b 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -3434,7 +3434,7 @@ static int __init hotkey_init(struct ibm_init_struct *iibm)
 		KEY_UNKNOWN,
 
 		KEY_BOOKMARKS,			/* Favorite app, 0x311 */
-		KEY_RESERVED,			/* Clipping tool */
+		KEY_SELECTIVE_SCREENSHOT,	/* Clipping tool */
 		KEY_CALC,			/* Calculator (above numpad, P52) */
 		KEY_BLUETOOTH,			/* Bluetooth */
 		KEY_KEYBOARD,			/* Keyboard, 0x315 */
-- 
2.28.0

