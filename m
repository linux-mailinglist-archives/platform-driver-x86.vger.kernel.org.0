Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 10935515687
	for <lists+platform-driver-x86@lfdr.de>; Fri, 29 Apr 2022 23:14:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235065AbiD2VRs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 29 Apr 2022 17:17:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234608AbiD2VRr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 Apr 2022 17:17:47 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id CC037D3DAA
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 Apr 2022 14:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1651266868;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OVJgetryfXSVXe5yvSCCfrQu6gny1xdVtA3tH62iDPs=;
        b=MtiKwjb/VXp2wN5p0bMtpxo2luOTtr4is5NFWIGQQJZwxEn8qdE13MhdgGflupHX4k3BPR
        jIjGhNm3QOZWa5rUjvB2518Az2MeGPZJFwBg8Po1K/nKuwHUdBg1Lmn7OacYq27J7InV+7
        aae0o3AgOPc8H5luV7uS6R60UPvcNjA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-558-yE_d1nJVNU2UXq_hLYQ76A-1; Fri, 29 Apr 2022 17:14:23 -0400
X-MC-Unique: yE_d1nJVNU2UXq_hLYQ76A-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2B4B7101AA42;
        Fri, 29 Apr 2022 21:14:23 +0000 (UTC)
Received: from emerald.lyude.net (unknown [10.22.8.66])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B19B9111CD36;
        Fri, 29 Apr 2022 21:14:22 +0000 (UTC)
From:   Lyude Paul <lyude@redhat.com>
To:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Subject: [PATCH 1/2] platform/x86: thinkpad_acpi: Restore X1 Carbon 9th Gen dual fan quirk
Date:   Fri, 29 Apr 2022 17:14:17 -0400
Message-Id: <20220429211418.4546-2-lyude@redhat.com>
In-Reply-To: <20220429211418.4546-1-lyude@redhat.com>
References: <20220429211418.4546-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The new method of probing dual fan support introduced in:

bf779aaf56ea ("platform/x86: thinkpad_acpi: Add dual fan probe")

While this commit says this works on the X1 Carbon 9th Gen, it actually
just results in hiding the second fan on my local machine. Additionally,
I'm fairly sure this machine powers on quite often without either of the
two fans spinning.

So let's fix this by adding back the dual fan quirk for the X1 Carbon 9th
Gen.

Signed-off-by: Lyude Paul <lyude@redhat.com>
Fixes: bf779aaf56ea ("platform/x86: thinkpad_acpi: Add dual fan probe")
Cc: Mark Pearson <markpearson@lenovo.com>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Mark Gross <markgross@kernel.org>
Cc: ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
---
 drivers/platform/x86/thinkpad_acpi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index c568fae56db2..9067fd0a945c 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -8699,6 +8699,7 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
 	TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (1st gen) */
 	TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),	/* P1 / X1 Extreme (2nd gen) */
 	TPACPI_Q_LNV3('N', '3', '0', TPACPI_FAN_2CTL),	/* P15 (1st gen) / P15v (1st gen) */
+	TPACPI_Q_LNV3('N', '3', '2', TPACPI_FAN_2CTL),  /* X1 Carbon (9th gen) */
 	TPACPI_Q_LNV3('N', '3', '7', TPACPI_FAN_2CTL),  /* T15g (2nd gen) */
 	TPACPI_Q_LNV3('N', '1', 'O', TPACPI_FAN_NOFAN),	/* X1 Tablet (2nd gen) */
 };
-- 
2.35.1

