Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0E7E06A351F
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Feb 2023 23:56:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229880AbjBZW4b (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Feb 2023 17:56:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229743AbjBZWzy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Feb 2023 17:55:54 -0500
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6E201A655
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 14:55:33 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id j2so4398512wrh.9
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Feb 2023 14:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=DgprYmeHBjj1QzTvylKGYwPam1q6cXCND0PzN/JHv1fIlxg+oS9gS+MrmgNuKZAI+1
         O0pEW4qREyxsNftF17Uw8vvkC+iavEQR9LTDHma6fBAAyP36KS2OJNzs/bhwnmNz8TH6
         3CFZBmKkQA2h6kzBDu5TuqiyoaFEthZxnHPJNj5QLUWeprwFH7S/p8ZP3z9iQceNrZTv
         E8vzBjUCBo2dogzXpNgzLOy4cJkNhNk8YRP7IG8g3OKyfPto5PBgvwl88Mtkg2D53HP5
         8mRk5vBC6uc9vttrEFYbzXzvaTZnKXgYxFHXX4P9LEItr7jTuyw3BusYV0zir1MY1pYQ
         /9iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FS5MMzUrtYY5N2w5QCadh2L/6Lyuv9jfcaqNKoRqTRU=;
        b=BjbnPvQgUiO6spIfFvak6oTnppIArR4+1OKFm1WOY04dss2qphR+pOFg16psp7xMKR
         0EI3NyPtwP9w+Jymj41ti+bpffhh/fe3qwYAfTsY16GCxFRuQx+6g/esiWGZEHiTausT
         0ORjP0P19gfkAoNHaBKfQVcP6AeIpIr2dRo+hcUEjLlq2VyIeindL4touTJWwm259/w2
         lkusEw8ronauFFYnFOTBzMH59rTnPKZ8p32rfNKYn4VOsIaKrytJw6gywlh9H5lcItv/
         bYo76qjYOou9zYtzyyt87GQSSMkpvvU92h/r9RNkE5hPdLCjljd/4rlriEZqUc2pE02g
         SKoA==
X-Gm-Message-State: AO0yUKXHvPZC2pz8KJ7riZt1cnVFS/qNuV5tusGKNV899auUNyxxvd8r
        0+dlPgxCXZ9PDmCfexULIKn8gQ==
X-Google-Smtp-Source: AK7set+h6bH1PS798t0mZMvOJZreT3hJ4B4BCSYDF4mYjx4jbb5JDOxUc4MvsYcrBJcRWeYdU1goCA==
X-Received: by 2002:a05:6000:1110:b0:2c8:42b5:8030 with SMTP id z16-20020a056000111000b002c842b58030mr6254219wrw.62.1677452123541;
        Sun, 26 Feb 2023 14:55:23 -0800 (PST)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:8baa:6b32:391b:62de])
        by smtp.gmail.com with ESMTPSA id d10-20020a05600c3aca00b003eb369abd92sm6138074wms.2.2023.02.26.14.55.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 14:55:23 -0800 (PST)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     rafael@kernel.org, daniel.lezcano@linaro.org
Cc:     linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v3 19/20] thermal/drivers/acerhdf: Remove pointless governor test
Date:   Sun, 26 Feb 2023 23:54:05 +0100
Message-Id: <20230226225406.979703-20-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230226225406.979703-1-daniel.lezcano@linaro.org>
References: <20230226225406.979703-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
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

