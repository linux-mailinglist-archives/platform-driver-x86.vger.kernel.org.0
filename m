Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC46371F142
	for <lists+platform-driver-x86@lfdr.de>; Thu,  1 Jun 2023 19:59:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229603AbjFAR7G (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 1 Jun 2023 13:59:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbjFAR7F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 1 Jun 2023 13:59:05 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04E80123
        for <platform-driver-x86@vger.kernel.org>; Thu,  1 Jun 2023 10:59:05 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id 41be03b00d2f7-54290603887so128905a12.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 01 Jun 2023 10:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685642344; x=1688234344;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PLCdGNeHnov65Y+Zq20pjDQdE63Mou+yTmivLkBstDM=;
        b=onT8DTHqMqqHMO4LpczfwfgtDr3x6Pn8UzwAm5gulbX5VG3T37xSdMRtJTNNRZTTZe
         qa7d8eHKPo7CSYzNSNprSkP7dU0kkirGjcZotWJo7v38EXldBY1gM5HfQAFuX40DHweq
         x3iN7fp6NqU2a8bKBcpUFBShok4GAqUI8dzZJRSWV03OwEtQozQDulOi7lENo/e2799V
         qsTWjxIw+V2qYGj8N59VBDEKYDEqMXTS0cFw6tFi/CmYzW3wTTVmjmlKDuQmF2xQahTa
         FJWs+tpVm2d6KLmlirq/QrHGbBJBAHkERr8vX6KqKZlxKedQk2sxzvdHqKTgDo7Uljr5
         zG0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685642344; x=1688234344;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PLCdGNeHnov65Y+Zq20pjDQdE63Mou+yTmivLkBstDM=;
        b=Fpe2bqpFH/NWikcCFNCB7+jqxsFy+RBeaB3OSHsDgyBRIbJpep2LKfDe4jSmyr9Ms5
         q884UW4G0xmhN0nvp0CsUWYonnF/6oS59MqpRKyfMC9Zh6V/Bh+YpCPXQXdh7h6MA1eo
         WBg5jqLM5kYASr/EbclEyz4m0IXGRHK+DwYEkeONeW6YZNI91c8VdSqmczaO4otahEYm
         Mvu+Dp4IdzDbV9iC/t9bzGT7ZS/lpWpq7NUjz/wUDSmcJvnufQd/5imRoh5+P0Zqg+Qd
         3Kgle5kIBn6TLIfYqcr6V/3Dj2xT0jVVYtS1RvK4kWK4YhFB70bPXijjqqQ7kUObX+pR
         QLJQ==
X-Gm-Message-State: AC+VfDz4Hq5JDeOLwBKO245BTjjhViP+fWb0+Xq9H+dWxORaeBr96X6u
        LXPlZqDNprArZM2jKswN3i5kqJ3sfwvai5HESgI=
X-Google-Smtp-Source: ACHHUZ6qqwWzoLiOoWNsNJ5cDYx2kMzLIJzggX+Smod/dFRZp2RQPatH6D7lHFF4BN1nqR3CEXOd6y6jzFffh5Pu7NM=
X-Received: by 2002:a17:90a:670b:b0:256:57e0:9c11 with SMTP id
 n11-20020a17090a670b00b0025657e09c11mr222952pjj.0.1685642343900; Thu, 01 Jun
 2023 10:59:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a11:af13:b0:4be:8032:9815 with HTTP; Thu, 1 Jun 2023
 10:59:02 -0700 (PDT)
Reply-To: philipsjohnsongoodp@gmail.com
From:   philips <okeyyoyopa7@gmail.com>
Date:   Thu, 1 Jun 2023 19:59:02 +0200
Message-ID: <CAH8nkvbBZubC8mwJfMCcyokEMsZaE3fK-TyPTV2_cpqwv-PHyA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,HK_RANDOM_ENVFROM,HK_RANDOM_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

0JTQvtGA0L7Qs9C+0Lkg0LTRgNGD0LMsDQrQnNC10L3RjyDQt9C+0LLRg9GCINCR0LDRgC7QpNC4
0LvQuNC/0YEg0JTQttC+0L3RgdC+0L0sINGPINCw0LTQstC+0LrQsNGCINC4INGH0LDRgdGC0L3R
i9C5DQrQvNC10L3QtdC00LbQtdGAINC/0L4g0YDQsNCx0L7RgtC1INGBINC60LvQuNC10L3RgtCw
0LzQuCDQvNC+0LXQvNGDINC/0L7QutC+0LnQvdC+0LzRgyDQutC70LjQtdC90YLRgy4g0JIgMjAx
NyDQs9C+0LTRgw0K0LzQvtC5INC60LvQuNC10L3RgiDQv9C+INC40LzQtdC90LgNCtCc0LjRgdGC
0LXRgCDQnNC10YjQtdC7KSwg0L/RgNC40YfQuNC90LAsINC/0L4g0LrQvtGC0L7RgNC+0Lkg0Y8g
0YHQstGP0LfQsNC70YHRjyDRgSDQstCw0LzQuCwg0LfQsNC60LvRjtGH0LDQtdGC0YHRjyDQsiDR
gtC+0LwsINGH0YLQviDQstGLDQrQvdC+0YHQuNGC0Ywg0L7QtNC90YMg0YTQsNC80LjQu9C40Y4g
0YEg0L/QvtC60L7QudC90YvQvCwg0Lgg0Y8g0LzQvtCz0YMg0L/RgNC10LTRgdGC0LDQstC40YLR
jCDQstCw0YEg0LrQsNC6DQrQsdC10L3QtdGE0LjRhtC40LDRgCDQuCDQsdC70LjQttCw0LnRiNC4
0Lkg0YDQvtC00YHRgtCy0LXQvdC90LjQuiDRgdGA0LXQtNGB0YLQsiDQvNC+0LXQs9C+INC/0L7Q
utC+0LnQvdC+0LPQviDQutC70LjQtdC90YLQsCwg0YLQvtCz0LTQsCDQstGLDQrQstGL0YHRgtGD
0L/QuNGC0Ywg0LIg0LrQsNGH0LXRgdGC0LLQtSDQtdCz0L4g0LHQu9C40LbQsNC50YjQtdCz0L4g
0YDQvtC00YHRgtCy0LXQvdC90LjQutCwINC4INC/0L7RgtGA0LXQsdC+0LLQsNGC0YwNCtGB0YDQ
tdC00YHRgtCy0LAuINC+0YHRgtCw0LLQu9GP0YLRjCDQvdCw0LvQuNGH0L3Ri9C1DQrQvdCw0YHQ
u9C10LTRgdGC0LLQviDRgdC10LzQuCDQvNC40LvQu9C40L7QvdC+0LIg0L/Rj9GC0LjRgdC+0YIg
0YLRi9GB0Y/RhyDQodC+0LXQtNC40L3QtdC90L3Ri9GFINCo0YLQsNGC0L7Qsg0K0JTQvtC70LvQ
sNGA0L7QsiAoNyA1MDAgMDAwLDAwINC00L7Qu9C70LDRgNC+0LIg0KHQqNCQKS4g0JzQvtC5INC/
0L7QutC+0LnQvdGL0Lkg0LrQu9C40LXQvdGCINC4INC30LDQutCw0LTRi9GH0L3Ri9C5DQrQtNGA
0YPQsyDQstGL0YDQvtGBINCyDQrCq9CU0L7QvCDQsdC10Lcg0LzQsNGC0LXRgNC4wrsuINCjINC9
0LXQs9C+INC90LUg0LHRi9C70L4g0L3QuCDRgdC10LzRjNC4LCDQvdC4INCx0LXQvdC10YTQuNGG
0LjQsNGA0LAsINC90Lgg0YHQu9C10LTRg9GO0YnQtdCz0L4NCtGA0L7QtNGB0YLQstC10L3QvdC4
0LrQvtCyINCyINC90LDRgdC70LXQtNGB0YLQstC+INCh0YDQtdC00YHRgtCy0LAg0L7RgdGC0LDQ
stC70LXQvdGLINCyINCx0LDQvdC60LUuDQrQktGLINC00L7Qu9C20L3RiyDRgdCy0Y/Qt9Cw0YLR
jNGB0Y8g0YHQviDQvNC90L7QuSDRh9C10YDQtdC3INC80L7QuSDQu9C40YfQvdGL0Lkg0LDQtNGA
0LXRgSDRjdC70LXQutGC0YDQvtC90L3QvtC5INC/0L7Rh9GC0Ys6DQpwaGlsaXBzam9obnNvbmdv
b2RwQGdtYWlsLmNvbQ0K0KEg0L3QsNC40LvRg9GH0YjQuNC80Lgg0L/QvtC20LXQu9Cw0L3QuNGP
0LzQuCwNCtCR0LDRgC4g0KTQuNC70LjQv9GBINCU0LbQvtC90YHQvtC9DQo=
