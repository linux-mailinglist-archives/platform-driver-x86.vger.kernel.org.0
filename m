Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6E6DD69E715
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Feb 2023 19:09:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231265AbjBUSJd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Feb 2023 13:09:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229702AbjBUSI5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 13:08:57 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE9442FCFA
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 10:08:13 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id j2so5237513wrh.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 10:08:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=Tp8eP0PUoiVcM75LMYL8aaZZbsS7AeKgdfxwsUZrAvJX8kJ1lowfTamb4kvxSEf+OC
         iB0PF3Gj8urd+sZWlrpDP+jxK5eYX1FiS6nMy7OeuwpvIpPFCtwnBfq868njYeAUJELL
         kUV3d20eLe2U8n1x7q6bvPUb83Mxd9ozIsFLsYcJ0Ii779JMjncM0lK2xL9UIhjPhBhr
         rStCkRe5460M5VTyYeGLHaEY1FBFRs5ffrpi7kPJIN1POC4Pv7m5WK9JL05dMsxbRWyR
         BC7udu4t16lTiwT36ekj1WW4wIarX2yjYV3PKcaTti/qjQxNurT0U+5quYgrkjTPYRe5
         UILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=yM2KCMdUEBw1vVkD+sGNXQVh5aZ7s3yPhnHAEyxjqHxjpK99onG4cQn3JyoyAWX3+N
         OIB5Bw8pRRhOeMpNIQsohYOpvIHm3FGiUTCXjRNxooikcu++FSZ0eaH9864UE+6QECX+
         n3FMbXopklCDGMLuNa/G+hDMNaabt34PKIZGqXDN5SGIlZnmR1dMGKVyOmB9wsOtxpvx
         i1EkvO/ROmd/OH3E+Mibr7AInrtmiZcP0EWi9eqCaAfq6XL9hQZuaQHBz+lmtuN+63ue
         ynNmAZeH0tWYtBkOWYlTARKnrbRzLHk84c8kfTpqi5IkuRVk0ls6zZfu2uZZUnYXF5vx
         rk5g==
X-Gm-Message-State: AO0yUKV+tfPVzbWKvoWj9OtKRzGw0/ji8+ZYskjoWxMzgrGwPL9O0vIN
        s+HDuDyJhae+7xUnl/FV9Hhutg==
X-Google-Smtp-Source: AK7set/iZL0sNcSr7TU3hL+KxyxJYOv0oEHnJFiWZ3jR9FR+vy6ZKAmrWi7nkVzkyX+LRfH7CCtbtQ==
X-Received: by 2002:adf:e4c5:0:b0:2c6:ca11:6c94 with SMTP id v5-20020adfe4c5000000b002c6ca116c94mr5101514wrm.60.1677002891504;
        Tue, 21 Feb 2023 10:08:11 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:1e9:315c:bb40:e382])
        by smtp.gmail.com with ESMTPSA id c128-20020a1c3586000000b003e21558ee9dsm5107815wma.2.2023.02.21.10.08.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 10:08:11 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v2 15/16] thermal/drivers/acerhdf: Remove pointless governor test
Date:   Tue, 21 Feb 2023 19:07:09 +0100
Message-Id: <20230221180710.2781027-16-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
References: <20230221180710.2781027-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal zone parameter specifies the bang-bang governor.

The Kconfig selects the bang-bang governor. So it is pointless to test
if the governor was set for the thermal zone assuming it may not have
been compiled-in.

Remove the test and prevent another access into the thermal internals.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
Acked-by: Peter Kaestle <peter@piie.net>
---
 drivers/platform/x86/acerhdf.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 61f1c3090867..71b9c1f922d9 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -697,13 +697,6 @@ static int __init acerhdf_register_thermal(void)
 	if (ret)
 		return ret;
 
-	if (strcmp(thz_dev->governor->name,
-				acerhdf_zone_params.governor_name)) {
-		pr_err("Didn't get thermal governor %s, perhaps not compiled into thermal subsystem.\n",
-				acerhdf_zone_params.governor_name);
-		return -EINVAL;
-	}
-
 	return 0;
 }
 
-- 
2.34.1

