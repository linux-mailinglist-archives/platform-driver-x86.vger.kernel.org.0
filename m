Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AB3B5568DC6
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 Jul 2022 17:44:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234331AbiGFPfd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 Jul 2022 11:35:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234253AbiGFPev (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 Jul 2022 11:34:51 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DF212A407;
        Wed,  6 Jul 2022 08:33:08 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 8A2CCB81DA0;
        Wed,  6 Jul 2022 15:33:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8972CC341D2;
        Wed,  6 Jul 2022 15:33:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1657121586;
        bh=Z5YrrhxMm8za0uYKI6qSlgLlgLKeej1KH6n3JakE+V0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YK/MJs8VZsU400i0M+KIeWIG06gSNdfqG9fqoNQRkUQxvNMuzXSQpp21vP0RykRc2
         kJzoGAT54SzUfGYQtGDpNrZo9RXsLFrcFnW5hLKMrGL5ARRKZ9BIzSSW3hYI/KT4YO
         Ob2z4ujj0BrTVibKmIGzTgUSMTpVJ1WHhsfI6KVCoMZr3wh/4jtaohfXuTDAzp9pX7
         BuVDxwmFjMAeF1DH/iqi4U377DW3O+rL9Vx7x0QVfsyjWKJiGjPed21zzn/UNbSzFL
         MM/Bx5kmdY756e6wMdpMudtmmxZJOUVRj9hjughxhdFJjPCZzGWf45iZhvAxpmvxGa
         3YV0sMg+jsAvA==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Jorge Lopez <jorge.lopez2@hp.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Sasha Levin <sashal@kernel.org>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.10 06/11] platform/x86: hp-wmi: Ignore Sanitization Mode event
Date:   Wed,  6 Jul 2022 11:32:51 -0400
Message-Id: <20220706153256.1598411-6-sashal@kernel.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220706153256.1598411-1-sashal@kernel.org>
References: <20220706153256.1598411-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-7.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Kai-Heng Feng <kai.heng.feng@canonical.com>

[ Upstream commit 9ab762a84b8094540c18a170e5ddd6488632c456 ]

After system resume the hp-wmi driver may complain:
[ 702.620180] hp_wmi: Unknown event_id - 23 - 0x0

According to HP it means 'Sanitization Mode' and it's harmless to just
ignore the event.

Cc: Jorge Lopez <jorge.lopez2@hp.com>
Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
Link: https://lore.kernel.org/r/20220628123726.250062-1-kai.heng.feng@canonical.com
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/hp-wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
index e94e59283ecb..012639f6d335 100644
--- a/drivers/platform/x86/hp-wmi.c
+++ b/drivers/platform/x86/hp-wmi.c
@@ -62,6 +62,7 @@ enum hp_wmi_event_ids {
 	HPWMI_BACKLIT_KB_BRIGHTNESS	= 0x0D,
 	HPWMI_PEAKSHIFT_PERIOD		= 0x0F,
 	HPWMI_BATTERY_CHARGE_PERIOD	= 0x10,
+	HPWMI_SANITIZATION_MODE		= 0x17,
 };
 
 struct bios_args {
@@ -629,6 +630,8 @@ static void hp_wmi_notify(u32 value, void *context)
 		break;
 	case HPWMI_BATTERY_CHARGE_PERIOD:
 		break;
+	case HPWMI_SANITIZATION_MODE:
+		break;
 	default:
 		pr_info("Unknown event_id - %d - 0x%x\n", event_id, event_data);
 		break;
-- 
2.35.1

