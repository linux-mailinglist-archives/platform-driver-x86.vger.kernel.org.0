Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4E74E543E97
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jun 2022 23:27:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbiFHV0O (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jun 2022 17:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235491AbiFHV0K (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jun 2022 17:26:10 -0400
X-Greylist: delayed 301 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 08 Jun 2022 14:25:48 PDT
Received: from ach1ajh122.fra1.oracleemaildelivery.com (ach1ajh122.fra1.oracleemaildelivery.com [138.1.108.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869DA19B68D
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Jun 2022 14:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=oci-fra1-20220101;
 d=augustwikerfors.se;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=ZsFEmbSgk1QEWoqn6V29rf7ma0za4KJnDNihcSqx/bM=;
 b=ikmOf12JpGapclKqKDNxnDV9qEdwn6NdbaCtiAnI8tKCxtMfL7jtftGPf7MmQk8PtYZgy5gwjnjJ
   /0VLdaKCsRqKGwVtHvvE/fUTb6Rf5vK2xuHE8o8AKRtB184XhQZu2wKFp2UQ1pUcMufbPSAzyHFY
   xGB+BQz7bYp977z72T0uXoZ76RMS6AWiw/BQjGXs1ltVj323B7BZTm41X/5dFV/fo0S8HHmFv5jr
   RMYVXGF3sCWiLK8akq2NSyckIZPSY6BfGD9NMkT4lP/+JA5h11djbVLgPXeD4yjmzQn17fml8yO6
   St6a/HWytKsQXJzUFYMzIciZPS3DR3J498qfhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; s=prod-fra-20191115;
 d=fra1.rp.oracleemaildelivery.com;
 h=Date:To:From:Subject:Message-Id:MIME-Version:Sender;
 bh=ZsFEmbSgk1QEWoqn6V29rf7ma0za4KJnDNihcSqx/bM=;
 b=EfTS9XO1X6O+LS8UuzHZxemh9rG6dpljFkpjy2HFCYadUzziiKcpHcjZoe85N5J1N2p9qJWXAkiA
   TfiqQ6Yt7ntdCfwO0s7vaFGCviHIE1mA5aXM/yrnBv3aEKBiGY76+llIRgUEfWUbrgRaK+gJJ//F
   h74GmEiFKGDy5ncfdwZhpM9nQNPXr8RKaf3/42dDce8nDWBKLitcSUpRADQGw6DmOZxUVoPkyaKR
   Q2oKDUI4kyXurCMlptOeWbNFp3z1GKA72Y+GKgIkNReXT0F5zIGEXp7i23TxCU+sNoLj+0J5s5dz
   HS/4qsNiPb4eu1ch0RffwDh5vrUAOPk/h6R92g==
Received: by omta-ad2-fd1-202-eu-frankfurt-1.omtaad2.vcndpfra.oraclevcn.com
 (Oracle Communications Messaging Server 8.1.0.1.20220517 64bit (built May 17
 2022))
 with ESMTPS id <0RD6008HMGMLJ050@omta-ad2-fd1-202-eu-frankfurt-1.omtaad2.vcndpfra.oraclevcn.com>
 for platform-driver-x86@vger.kernel.org; Wed, 08 Jun 2022 21:20:45 +0000 (GMT)
From:   August Wikerfors <git@augustwikerfors.se>
To:     =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas@weissschuh.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        August Wikerfors <git@augustwikerfors.se>
Subject: [PATCH] platform/x86: gigabyte-wmi: add support for B450M DS3H-CF
Date:   Wed,  8 Jun 2022 23:20:28 +0200
Message-id: <20220608212028.28307-1-git@augustwikerfors.se>
MIME-version: 1.0
Content-transfer-encoding: 8bit
Reporting-Meta: AAE4t7yYidoaH3rgatWjWKHvjaMZAsjMyZEOrKR5em6mzp3j1kt086dDZ7loDUsi
 Cfo1FP7CEhky0uUn07MTt86i9bbQ8UlMQcBPaqQHiXPHQCQbhyH78OzYU6xQOzmg
 YiZAjn0fOIubb/JoMcrGgo+2nEPGpLmuAUmLBOXQWVnU8wNIq3okYiPxAjcSFJWX
 c/av1P6uX+waN7oZ6eaIaxKwlGy5ynXNjEDDi0Y4GnzhBsjNOEFq/FxZAYS8cx+t
 OATXlywE3XVUiQbzmiczRjm0FVYMw9ZS9kRcLPmiyQoVP1Brh3Z7FTaxPWLWl4Ms
 rYBNmOCK2LYUswMd8bT3OIVrGnm84OL2uLWf9dbBj+pA8auz9/hArlBjHWreG75K
 j28Xb32fZ63Kzqdt4IGoXEc2TEpz7AIDznKZHMvBQxnLXSFqG4PUDacYWTN+Gjwe jmddxRpkbW6d
X-Spam-Status: No, score=0.1 required=5.0 tests=BAYES_20,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Tested and works on my system.

Signed-off-by: August Wikerfors <git@augustwikerfors.se>
---
 drivers/platform/x86/gigabyte-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/gigabyte-wmi.c b/drivers/platform/x86/gigabyte-wmi.c
index 1ef606e3ef80..12dbaef518e8 100644
--- a/drivers/platform/x86/gigabyte-wmi.c
+++ b/drivers/platform/x86/gigabyte-wmi.c
@@ -140,6 +140,7 @@ static u8 gigabyte_wmi_detect_sensor_usability(struct wmi_device *wdev)
 	}}
 
 static const struct dmi_system_id gigabyte_wmi_known_working_platforms[] = {
+	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M DS3H-CF"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B450M S2H V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE AX V2"),
 	DMI_EXACT_MATCH_GIGABYTE_BOARD_NAME("B550 AORUS ELITE"),
-- 
2.36.1

