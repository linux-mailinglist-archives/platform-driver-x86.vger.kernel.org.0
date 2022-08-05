Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 740AB58ACD8
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Aug 2022 16:59:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241222AbiHEO7m (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Aug 2022 10:59:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46140 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241149AbiHEO6m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Aug 2022 10:58:42 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 432A061D88
        for <platform-driver-x86@vger.kernel.org>; Fri,  5 Aug 2022 07:58:17 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id j7so3566223wrh.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 05 Aug 2022 07:58:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc;
        bh=+LKPhNKLGEVFzXPLROXys6y1jDgivXC9DTGdXpCbdug=;
        b=esaMTjnp69RL3woTrdc24TQt0JCs8qISF4KHdB2djLUrswQOeXm4f1WklijtlNaS8W
         y/Lb4HeyDgvShVesCqKsGyd1+kO6fLVgxMcftLr+sMbS/Hifl9STEeUOE4dwtDEToE6y
         DZyj99tqanRhk91LPmTtpFJbq4vMT/A74niwa3YHDhIiZev8NL5wwzqccBYvBOkJ2Ruc
         Xgjl3H7vC5E2PTXbfzrTUP3VRiHGRElS7IaVAU0FuWAJnaKAP6Dj/mYRbOVqG8Uxt6hN
         esVhoie2iQtM1rAPzjDUaQ5gZocv2ffH3WclUad+iXQc/i83mMZDvv5t8KCHxMgH0zus
         sWfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
        bh=+LKPhNKLGEVFzXPLROXys6y1jDgivXC9DTGdXpCbdug=;
        b=WqhC8zLeNl8s1XSWx17ygTVtrvxy2aJ3+u0GQCx9XOO+WMczLjWtDw30EX3/OLe5Vn
         UbaU6kvPBKVDPDiFGCEc4TmRqZR8YGfvHlpKTBfGRbE0xuIvtGwaZVsradPOUlVzNFgA
         EWMbeYeFkNjiFLgzFyWGljZoDdNMLUkj62NwaadUunxRRqLaJZ3SPOW6GhCaihjt6fzq
         DK2H+/l2llkUuxYwcWHYihnABgKuErz3WnkyYhy/TuJsMR1dMB29fthnv6ao8wXBNvyI
         hsUvf6knT0hQvj0nJqsFFyvwE1GUK3wnq+AFhcdZ+9GCuS1TMHiXegzCiruc5IPSGEyN
         xibQ==
X-Gm-Message-State: ACgBeo0Hzt2jI7ofJ6OW9gXx4/Ubg8B+7M5BPZuN3DHMvc5D4/GybLmx
        AT7t2IWh2QtKuJW9EG/SoiY+0JfbBJw6Gg==
X-Google-Smtp-Source: AA6agR7u6zk+rXVU+V7Sgy68MHi+eF2Emd07lie03xAjqv2erUPFXDdl1laFdt+SVm/JxI/N9bNeoA==
X-Received: by 2002:a5d:595f:0:b0:220:619d:da07 with SMTP id e31-20020a5d595f000000b00220619dda07mr4567517wri.10.1659711496782;
        Fri, 05 Aug 2022 07:58:16 -0700 (PDT)
Received: from mai.box.freepro.com ([2a05:6e02:1041:c10:aef0:8606:da6b:79ef])
        by smtp.gmail.com with ESMTPSA id y1-20020adfd081000000b0022159d92004sm3102448wrh.82.2022.08.05.07.58.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:58:16 -0700 (PDT)
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
To:     daniel.lezcano@linaro.org, rafael@kernel.org
Cc:     rui.zhang@intel.com, linux-pm@vger.kernel.org,
        linux-kernel@vger.kernel.org, Peter Kaestle <peter@piie.net>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org (open list:ACER ASPIRE ONE
        TEMPERATURE AND FAN DRIVER)
Subject: [PATCH v1 23/26] thermal/drivers/acerhdf: Use generic thermal_zone_get_trip() function
Date:   Fri,  5 Aug 2022 16:57:26 +0200
Message-Id: <20220805145729.2491611-24-daniel.lezcano@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
References: <20220805145729.2491611-1-daniel.lezcano@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The thermal framework gives the possibility to register the trip
points with the thermal zone. When that is done, no get_trip_* ops are
needed and they can be removed.

Convert ops content logic into generic trip points and register them with the
thermal zone.

Signed-off-by: Daniel Lezcano <daniel.lezcano@linaro.org>
---
 drivers/platform/x86/acerhdf.c | 73 ++++++++++++----------------------
 1 file changed, 26 insertions(+), 47 deletions(-)

diff --git a/drivers/platform/x86/acerhdf.c b/drivers/platform/x86/acerhdf.c
index 3463629f8764..cf757f3a1e6b 100644
--- a/drivers/platform/x86/acerhdf.c
+++ b/drivers/platform/x86/acerhdf.c
@@ -46,6 +46,8 @@
  * measured by the on-die thermal monitor are within 0 <= Tj <= 90. So,
  * assume 89°C is critical temperature.
  */
+#define ACERHDF_DEFAULT_TEMP_FANON 60000
+#define ACERHDF_DEFAULT_TEMP_FANOFF 53000
 #define ACERHDF_TEMP_CRIT 89000
 #define ACERHDF_FAN_OFF 0
 #define ACERHDF_FAN_AUTO 1
@@ -70,8 +72,8 @@ static int kernelmode;
 #endif
 
 static unsigned int interval = 10;
-static unsigned int fanon = 60000;
-static unsigned int fanoff = 53000;
+static unsigned int fanon = ACERHDF_DEFAULT_TEMP_FANON;
+static unsigned int fanoff = ACERHDF_DEFAULT_TEMP_FANOFF;
 static unsigned int verbose;
 static unsigned int list_supported;
 static unsigned int fanstate = ACERHDF_FAN_AUTO;
@@ -137,6 +139,15 @@ struct ctrl_settings {
 	int mcmd_enable;
 };
 
+static struct thermal_trip trips[] = {
+	[0] = { .temperature = ACERHDF_DEFAULT_TEMP_FANON,
+		.hysteresis = ACERHDF_DEFAULT_TEMP_FANON - ACERHDF_DEFAULT_TEMP_FANOFF,
+		.type = THERMAL_TRIP_ACTIVE },
+
+	[1] = { .temperature = ACERHDF_TEMP_CRIT,
+		.type = THERMAL_TRIP_CRITICAL }
+};
+
 static struct ctrl_settings ctrl_cfg __read_mostly;
 
 /* Register addresses and values for different BIOS versions */
@@ -326,6 +337,15 @@ static void acerhdf_check_param(struct thermal_zone_device *thermal)
 		fanon = ACERHDF_MAX_FANON;
 	}
 
+	if (fanon < fanoff) {
+		pr_err("fanoff temperature (%d) is above fanon temperature (%d), clamping to %d\n",
+		       fanoff, fanon, fanon);
+		fanoff = fanon;
+	};
+	
+	trips[0].temperature = fanon;
+	trips[0].hysteresis  = fanon - fanoff;
+	
 	if (kernelmode && prev_interval != interval) {
 		if (interval > ACERHDF_MAX_INTERVAL) {
 			pr_err("interval too high, set to %d\n",
@@ -424,43 +444,6 @@ static int acerhdf_change_mode(struct thermal_zone_device *thermal,
 	return 0;
 }
 
-static int acerhdf_get_trip_type(struct thermal_zone_device *thermal, int trip,
-				 enum thermal_trip_type *type)
-{
-	if (trip == 0)
-		*type = THERMAL_TRIP_ACTIVE;
-	else if (trip == 1)
-		*type = THERMAL_TRIP_CRITICAL;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
-static int acerhdf_get_trip_hyst(struct thermal_zone_device *thermal, int trip,
-				 int *temp)
-{
-	if (trip != 0)
-		return -EINVAL;
-
-	*temp = fanon - fanoff;
-
-	return 0;
-}
-
-static int acerhdf_get_trip_temp(struct thermal_zone_device *thermal, int trip,
-				 int *temp)
-{
-	if (trip == 0)
-		*temp = fanon;
-	else if (trip == 1)
-		*temp = ACERHDF_TEMP_CRIT;
-	else
-		return -EINVAL;
-
-	return 0;
-}
-
 static int acerhdf_get_crit_temp(struct thermal_zone_device *thermal,
 				 int *temperature)
 {
@@ -474,13 +457,9 @@ static struct thermal_zone_device_ops acerhdf_dev_ops = {
 	.unbind = acerhdf_unbind,
 	.get_temp = acerhdf_get_ec_temp,
 	.change_mode = acerhdf_change_mode,
-	.get_trip_type = acerhdf_get_trip_type,
-	.get_trip_hyst = acerhdf_get_trip_hyst,
-	.get_trip_temp = acerhdf_get_trip_temp,
 	.get_crit_temp = acerhdf_get_crit_temp,
 };
 
-
 /*
  * cooling device callback functions
  * get maximal fan cooling state
@@ -710,10 +689,10 @@ static int __init acerhdf_register_thermal(void)
 	if (IS_ERR(cl_dev))
 		return -EINVAL;
 
-	thz_dev = thermal_zone_device_register("acerhdf", 2, 0, NULL,
-					      &acerhdf_dev_ops,
-					      &acerhdf_zone_params, 0,
-					      (kernelmode) ? interval*1000 : 0);
+	thz_dev = thermal_zone_device_register_with_trips("acerhdf", trips, ARRAY_SIZE(trips),
+							  0, NULL, &acerhdf_dev_ops,
+							  &acerhdf_zone_params, 0,
+							  (kernelmode) ? interval*1000 : 0);
 	if (IS_ERR(thz_dev))
 		return -EINVAL;
 
-- 
2.25.1

