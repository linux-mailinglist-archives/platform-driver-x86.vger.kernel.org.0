Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6B6D37E9F39
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Nov 2023 15:53:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230466AbjKMOxf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Nov 2023 09:53:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbjKMOxe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 09:53:34 -0500
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com [IPv6:2a00:1450:4864:20::12e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FC9B1728
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 06:53:31 -0800 (PST)
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-507f1c29f25so6118362e87.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Nov 2023 06:53:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699887209; x=1700492009; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=h53jKEflW3e/C/cuKnWnlAqCfzD5OxoKB9wqj+QaJ9E=;
        b=cQQEoaJQpUIvNyXM+Zrt7QDmVvZDwUD8AFvXeaYQQ8b4HwbhKu3leLBD9ewNjEoGDu
         Ijyd0LNohIvYFtJ4pU5tPSQOGGwHzKy6fDni5vaLKtjwSyNq/2pmfDmMnlrLOhCvJzBU
         VYInYRckRoBNMBLOCC18Si2dDsipo+YVfz4JcaqncesHZO7piwq5599fsqTslSS5djI5
         f4kTwpDtSXTWHm3YUo51NTWLvtN7MWNTwi9my/sxPERKvhWOYbp45zPpz2flx3Swla3i
         Hj2RcbfJOR95hZuV58etrbURfCXB60AjU/huMfwTHORNsbt0mljHqEorCqN4FXW3P4lP
         J8Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699887209; x=1700492009;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h53jKEflW3e/C/cuKnWnlAqCfzD5OxoKB9wqj+QaJ9E=;
        b=eoHzKm5y22n8QTIQmBG0ArgSFAnR42R9Vqg53/DistGHqxPZD9MhFK3caA647/AFFr
         iRU0shDWRwTBx5bx71zCyH9HNOZVUjODyn5/cMKZtXTrWs+CZho2Iin7hEoxCK/+ZA84
         A3N3rEenFxyjhPrSnG0WWiGOIBdr2BN8DBG/cZsMUeLy1mujulALqBZ7eYkrTTaXgd/u
         xXaaCD0Bvaa1/jzsFYmdbI0q+ekQDsWG77layOUiGfxtJQcpWbCDSedKwWFIe0Ob0Oql
         7P4ZhZlBvIOM/fSo5FNlGiuDQTr4LocmA7ed8WI9fFpQVuIqVncFyrblfKOMTInO+gWX
         YsVw==
X-Gm-Message-State: AOJu0YwBnPoRS2/C/gYt/FWpYZ9h1KsPynqhbzwqLm+mIJGRob+lYgfL
        keKLLGE/0raauM3R5qBSAshqAA==
X-Google-Smtp-Source: AGHT+IEfWdXO8U4PcYgb7/pI01WDceQuQrzLOIYLYfOMG5ddcS10/Cscv2kajtCO4iZUCZ+f2JiyYA==
X-Received: by 2002:ac2:5def:0:b0:509:f45c:fae6 with SMTP id z15-20020ac25def000000b00509f45cfae6mr4757338lfq.10.1699887209584;
        Mon, 13 Nov 2023 06:53:29 -0800 (PST)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
        by smtp.gmail.com with ESMTPSA id x24-20020ac24898000000b0050794b05c8asm991429lfc.42.2023.11.13.06.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 06:53:28 -0800 (PST)
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
Subject: [PATCH 0/3] dt-bindings: connector: usb: provide bindings for altmodes
Date:   Mon, 13 Nov 2023 16:33:06 +0200
Message-ID: <20231113145328.42575-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.42.0
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

In some cases we need a way to specify USB-C AltModes that can be
supportd on the particular USB-C connector. For example, x86 INT33FE
driver does this by populating fwnode properties internally. For the
Qualcomm Robotics RB5 platform (and several similar devices which use
Qualcomm PMIC TCPM) we have to put this information to the DT.

Provide the DT bindings for this kind of information and while we are at
it, change svid property to be 16-bit unsigned integer instead of a
simple u32.

Dmitry Baryshkov (3):
  dt-bindings: connector: usb: add altmodes description
  usb: typec: change altmode SVID to u16 entry
  arm64: dts: qcom: qrb5165-rb5: use u16 for DP altmode svid

 .../bindings/connector/usb-connector.yaml     | 35 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/qrb5165-rb5.dts      |  2 +-
 drivers/platform/x86/intel/chtwc_int33fe.c    |  2 +-
 drivers/usb/typec/class.c                     |  5 +--
 4 files changed, 40 insertions(+), 4 deletions(-)

-- 
2.42.0

