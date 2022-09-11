Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6F3655B50DF
	for <lists+platform-driver-x86@lfdr.de>; Sun, 11 Sep 2022 21:32:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229498AbiIKTcT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 11 Sep 2022 15:32:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49572 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229517AbiIKTcT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 15:32:19 -0400
Received: from vorpal.se (unknown [151.236.221.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A904252B3
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 12:32:09 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id A322F147DF;
        Sun, 11 Sep 2022 19:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1662924695; bh=ccmVeU4xvg7Fw7K5rRDGwZfDM5GYI4Hc27WkLWevmfc=;
        h=From:To:Cc:Subject:Date:From;
        b=Q3WyRP8SkjJA4byjplQh2BSKWVtHeW8te0Wr0QQnw1ahJjTYebcPd43xg6isPqn1w
         O+09rwO+TAxjr0EJZk4Ekvh3sXVhsoFXV4g+H1O2g4fRuxOIwzHRYeUMOv7XYPbK5Q
         KuozlSoR8kQNKzeBHwJP60iSi45BIPi4ewOF+kjteNOI6fDX7KPZmWmf3kKJL5/Lor
         Und8ItcwqVscyW/cGBW2dJ21jankBQWsI8R6beH93fdHF3Uf7IcPmfqkeeLVlrG0gI
         P9ixVt25cfcMw6Z95VZaiWaXIQ9HuBMXqcP4bx1yJSoSoRvxNIx8YaBS9xz6QUbw99
         s9i6LGifxliwQ==
From:   Arvid Norlander <lkml@vorpal.se>
To:     platform-driver-x86@vger.kernel.org
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Azael Avalos <coproscefalo@gmail.com>,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH] platform/x86: toshiba_acpi: Set correct parent for input device.
Date:   Sun, 11 Sep 2022 21:31:06 +0200
Message-Id: <20220911193106.555938-1-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.7 required=5.0 tests=BAYES_00,DKIM_INVALID,
        DKIM_SIGNED,T_SCC_BODY_TEXT_LINE,T_SPF_HELO_TEMPERROR,T_SPF_TEMPERROR
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This solves the input device showing up as a virtual device.

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/toshiba_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 3227a5f57633..9f1394b73895 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -2883,6 +2883,7 @@ static int toshiba_acpi_setup_keyboard(struct toshiba_acpi_dev *dev)
 	dev->hotkey_dev->name = "Toshiba input device";
 	dev->hotkey_dev->phys = "toshiba_acpi/input0";
 	dev->hotkey_dev->id.bustype = BUS_HOST;
+	dev->hotkey_dev->dev.parent = &dev->acpi_dev->dev;
 
 	if (dev->hotkey_event_type == HCI_SYSTEM_TYPE1 ||
 	    !dev->kbd_function_keys_supported)
-- 
2.37.3

