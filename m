Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EE6C559B62E
	for <lists+platform-driver-x86@lfdr.de>; Sun, 21 Aug 2022 21:53:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231531AbiHUTxm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 21 Aug 2022 15:53:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiHUTxl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 21 Aug 2022 15:53:41 -0400
X-Greylist: delayed 217 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 21 Aug 2022 12:53:40 PDT
Received: from vorpal.se (vorpal.se [IPv6:2a01:7e00::f03c:91ff:fe73:398e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 44B75DF9B
        for <platform-driver-x86@vger.kernel.org>; Sun, 21 Aug 2022 12:53:40 -0700 (PDT)
Received: by vorpal.se (Postfix) with ESMTPSA id D713A147F4;
        Sun, 21 Aug 2022 19:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=vorpal.se; s=2019;
        t=1661111403; bh=f721RqTAx+CsWkI3Nmo0p5IQycITvOoqX1qYTpx3QwY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=E/c7dXPsBPxoadpvMuE/LkKWLl0fn8gJKegsKDO/04SaeeRuRMrJdUWFolwl5q5K1
         DrzjoPtxsDx7gKUWrO/8lSD13LiAuHtyfoUJh6PloDEj7x6hKXoFjEwLx1yyi9b9iZ
         ttkGcu33jwFi2Crn6Nq1alXSEg7nKKrq/wu7CMh1AV0zW+ajJ24jFDpQbgU0ag3TJq
         BcgUUXzfqL9ny5Y1aGIvtbodoFtHJ3fMrZZrCrwZ227x3p/+uV0vi+LMZLKo0BeJP/
         HNNKQpou037xJrCwrvd7H8EQGysOjJEJGU1T6ifBTRp7+Zw97vSvYlHykjUiH1FAzf
         EHlP3g3JyAwiA==
From:   lkml@vorpal.se
To:     platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>,
        Arvid Norlander <lkml@vorpal.se>
Subject: [PATCH 1/2] platform/x86: Fix ECO LED control on Toshiba Z830
Date:   Sun, 21 Aug 2022 21:49:26 +0200
Message-Id: <20220821194926.1813412-2-lkml@vorpal.se>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20220821194926.1813412-1-lkml@vorpal.se>
References: <20220821194926.1813412-1-lkml@vorpal.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=1.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_SBL_CSS,RCVD_IN_XBL,
        SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Arvid Norlander <lkml@vorpal.se>

The toshiba_acpi driver checks for TOS_INPUT_DATA_ERROR and tries a
different format. On the Z830 the error returned is TOS_NOT_SUPPORTED
though the different format still works. Allow either error.

Signed-off-by: Arvid Norlander <lkml@vorpal.se>
---
 drivers/platform/x86/toshiba_acpi.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
index 0fc9e8b8827b..6cc617b2940e 100644
--- a/drivers/platform/x86/toshiba_acpi.c
+++ b/drivers/platform/x86/toshiba_acpi.c
@@ -675,12 +675,15 @@ static void toshiba_eco_mode_available(struct toshiba_acpi_dev *dev)
 		return;
 	}
 
-	if (out[0] == TOS_INPUT_DATA_ERROR) {
+	if (out[0] == TOS_INPUT_DATA_ERROR || out[0] == TOS_NOT_SUPPORTED) {
 		/*
 		 * If we receive 0x8300 (Input Data Error), it means that the
 		 * LED device is present, but that we just screwed the input
 		 * parameters.
 		 *
+		 * On some laptops 0x8000 (Not supported) is also returned in
+		 * this case, so we need to allow for that as well.
+		 *
 		 * Let's query the status of the LED to see if we really have a
 		 * success response, indicating the actual presense of the LED,
 		 * bail out otherwise.
-- 
2.37.2

