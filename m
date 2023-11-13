Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 305787EA5CF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Nov 2023 23:15:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231919AbjKMWPk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Nov 2023 17:15:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38762 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231855AbjKMWPh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 17:15:37 -0500
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com [IPv6:2a00:1450:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 31ABE1729
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 14:15:34 -0800 (PST)
Received: by mail-lj1-x22e.google.com with SMTP id 38308e7fff4ca-2c595f5dc84so64857201fa.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 14:15:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699913732; x=1700518532; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=WVEI1Zl28JemvpDCFyVQCs7IgWzSn8bftEA8hSGlp3GkYM/5L7rwDGU/uTFG+S4aKG
         uYlTX3TbPmiszUFlD4PYb37ZJnvelFX89oqgqX9EFtK8UZ0QcknmeuZ7wMXAHSPYFaoh
         bEeqApwL0JW6Sdsyx8qtNEGw0mKKMRot795jKvMEGUQYBk8auhh6ulEYPnOLcQv3M96k
         nZPQBIyG+XivJLKFLBtb4UZFk+wB2Qis4ZMTr3nyUheh5X35x+LkAdra9AWjGWYM2m1V
         JN6DurXjHToCEb/VmWEO92Ka/vtnqgG0/niIr+31HsSTdq+jXHAParFrw/FwNm795V6P
         bVww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699913732; x=1700518532;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KajBuUuJpwuy15xSzO9YMy+TSc6B+gUFFD30MmfVQnM=;
        b=uW1DYHYTT98IjKvNzKqcYpH6UvXhUU1EkmoMv7kUyCw+6FBOqhqh1pONyw8cMgEgK1
         QlTEMTkZ/ejdemvhhB1gdu/tfyln+PVJJRu5ay8fw0y7e41t2Lp/FPcS6qqJ2Ou8XeF4
         q/v5VPRhta+7tMUB8/Vnu1L0DikQLr1HbtAnFCRjkh8NPLqY+ti8x5HMhp12OvA04rtM
         FyJZUZGguV7yEzD1d0m2yrOtSZZmrf8kinNANwxSp1x+OjLtAGafg97jtxCoFR0wcGx4
         ZUxalopeIwzkLgPSZQmDejhJodUVuN6bTcl6MWtNKxEDvAKKGfjl5uLzoKykPD3emKKL
         w+ww==
X-Gm-Message-State: AOJu0YwyvPT9aLmPomw7Mjkk7p6SrxyaUgkcOrV3aSpuA8QOHDXwvvxV
        ya9AMhFZNxjLjQEHoQ9iVrAkUw==
X-Google-Smtp-Source: AGHT+IH/jEmW6mRmKSmrElSDPBjzh15unoJsWN6Vt6NCJockDC6d+ppH/ijeD4ElxXqQBySLegWChg==
X-Received: by 2002:ac2:4a63:0:b0:504:33ff:156a with SMTP id q3-20020ac24a63000000b0050433ff156amr224964lfp.11.1699913732301;
        Mon, 13 Nov 2023 14:15:32 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id w8-20020a0565120b0800b00507f18af7e0sm1097578lfu.4.2023.11.13.14.15.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 14:15:31 -0800 (PST)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-usb@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid
Date:   Tue, 14 Nov 2023 00:13:29 +0200
Message-ID: <20231113221528.749481-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
References: <20231113221528.749481-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Follow the bindings and use 16-bit value for AltMode SVID instead of
using the full u32.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
index c8cd40a462a3..88b37ceb13ed 100644
--- a/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
+++ b/arch/arm64/boot/dts/qcom/qrb5165-rb5.dts
@@ -1425,7 +1425,7 @@ PDO_FIXED_USB_COMM |
 
 		altmodes {
 			displayport {
-				svid = <0xff01>;
+				svid = /bits/ 16 <0xff01>;
 				vdo = <0x00001c46>;
 			};
 		};
-- 
2.42.0

