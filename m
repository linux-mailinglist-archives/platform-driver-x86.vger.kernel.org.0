Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A2997437765
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Oct 2021 14:46:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230105AbhJVMsh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Oct 2021 08:48:37 -0400
Received: from relay1-d.mail.gandi.net ([217.70.183.193]:41523 "EHLO
        relay1-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232640AbhJVMsh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Oct 2021 08:48:37 -0400
Received: (Authenticated sender: peter@korsgaard.com)
        by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 48632240010;
        Fri, 22 Oct 2021 12:46:16 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.92)
        (envelope-from <peko@dell.be.48ers.dk>)
        id 1mdtw8-00059q-8y; Fri, 22 Oct 2021 14:46:16 +0200
From:   Peter Korsgaard <peter@korsgaard.com>
To:     platform-driver-x86@vger.kernel.org, hdegoede@redhat.com,
        santoshkumar.yadav@barco.com
Cc:     Peter Korsgaard <peter.korsgaard@barco.com>
Subject: [PATCH] platform/x86: barco-p50-gpio: use KEY_VENDOR for button insted of KEY_RESTART
Date:   Fri, 22 Oct 2021 14:46:12 +0200
Message-Id: <20211022124612.19780-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
References: <150f27d2-32b9-403b-01ff-8ab7d971d1d1@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Peter Korsgaard <peter.korsgaard@barco.com>

It turns out that systemd-logind by default listens for KEY_RESTART input
events and reboots the machine, which isn't great - So use KEY_VENDOR for
the vendor specific identify button instead to not conflict.

Signed-off-by: Peter Korsgaard <peter.korsgaard@barco.com>
---
 drivers/platform/x86/barco-p50-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index ca0b2564c407..f5c72e33f9ae 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -101,7 +101,7 @@ static struct gpio_led_platform_data leds_pdata = {
 /* GPIO keyboard */
 static struct gpio_keys_button buttons[] = {
 	{
-		.code = KEY_RESTART,
+		.code = KEY_VENDOR,
 		.gpio = P50_GPIO_LINE_BTN,
 		.active_low = 1,
 		.type = EV_KEY,
-- 
2.20.1

