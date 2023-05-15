Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6020D70238D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 May 2023 07:50:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238378AbjEOFuw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 May 2023 01:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238374AbjEOFuM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 May 2023 01:50:12 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE110272A
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 22:49:57 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-1ab13da70a3so119189965ad.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 14 May 2023 22:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1684129797; x=1686721797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4CWREIVCWjShI+1eEDBl6O/SQK7CU6Z/SOibOv3uDSU=;
        b=LaizqtRgx/46L7XZEEzAvGKk4DNL3cxT+KIJNCUnMf1yMdp2SUe33zOAN2WuA/4Nqa
         /LAFe6wDAvy8FAPxcIeoG6pPGKyP6nl643DNNFL+KPrNAFuDHIzEULjjVMBFtvhXZzUU
         pClnyaZQBT8RE1o5wOtGg7i+edZHRt2vGxLDwpWY4uqkjm3mPWxvLn7PvAmlO976y4M0
         SSdEWmIR2ddEnCrxb+0vrKy8bmwG0oqJe+I2DEh54a35nyzrEg+fQkaZPlfSFerS15iE
         iEhZ5R5TSoza6gkAxEX9fBXrJ2cae0PtGLkCNNS86q654yu8Vd7Utmk9+mrWq4i6JeA9
         Nk2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684129797; x=1686721797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4CWREIVCWjShI+1eEDBl6O/SQK7CU6Z/SOibOv3uDSU=;
        b=BEhAiDna2Gl5UuyPtg6mNU6npE11T/Ve7by8DSEvqyXtwaBa0pHj/tN0F8Bx/i3PRX
         28LTDcVMAX8nu1n1RyMAnvlLgovOUtrwvFiNOzthl2btzxR0Y07fFIKr8jNU2Y+V0/gK
         DGZQqttwlT5w4ukAT+yGUwP7DYxBx1skk+d8galzdw5Vuw5QTCnNF9PC6LcBoIzAvjq7
         7bAZlP7Urv1t2gkt1VGfNwjZu1s9uXNG5NK8kuGZ58P2QkEfMjIqtNObRqr9WlTM7ydp
         tgRx6eM3pGRVmvFGpCB0+ZZOv/hyq0IdvUbY3kSbQWZJVIxm2N+HlbD7Rs2FB4PTwvBO
         GGqw==
X-Gm-Message-State: AC+VfDyHGReA4024eMiX5QAuJa2Yty8qdgWht0PA5ONccQayYsAtJFwR
        KFAe9WU9/6v1eYNZNYcSgqqMIA==
X-Google-Smtp-Source: ACHHUZ5SBnZH4w/8kTkRxhSGgZWYJARyq6N8PLdcSNQB6VCfLcCyIRX0eY9eHJdSC6V7hPlOF0bM/g==
X-Received: by 2002:a17:902:ab89:b0:1ad:1c22:1b53 with SMTP id f9-20020a170902ab8900b001ad1c221b53mr16090936plr.40.1684129797303;
        Sun, 14 May 2023 22:49:57 -0700 (PDT)
Received: from localhost.localdomain ([106.51.191.118])
        by smtp.gmail.com with ESMTPSA id f10-20020a17090274ca00b001ab28f620d0sm12423277plt.290.2023.05.14.22.49.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 May 2023 22:49:56 -0700 (PDT)
From:   Sunil V L <sunilvl@ventanamicro.com>
To:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-acpi@vger.kernel.org,
        linux-crypto@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        llvm@lists.linux.dev
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Weili Qian <qianweili@huawei.com>,
        Zhou Wang <wangzhou1@hisilicon.com>,
        Herbert Xu <herbert@gondor.apana.org.au>,
        "David S . Miller" <davem@davemloft.net>,
        Marc Zyngier <maz@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tom Rix <trix@redhat.com>
Subject: [PATCH V6 03/21] crypto: hisilicon/qm: Fix to enable build with RISC-V clang
Date:   Mon, 15 May 2023 11:19:10 +0530
Message-Id: <20230515054928.2079268-4-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
References: <20230515054928.2079268-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

With CONFIG_ACPI enabled for RISC-V, this driver gets enabled in
allmodconfig build. However, build fails with clang and below
error is seen.

drivers/crypto/hisilicon/qm.c:627:10: error: invalid output constraint '+Q' in asm
                       "+Q" (*((char __iomem *)fun_base))
                       ^
This is expected error with clang due to the way it is designed.

To fix this issue, move arm64 assembly code under #if.

Link: https://github.com/ClangBuiltLinux/linux/issues/999
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
[sunilvl@ventanamicro.com: Moved tmp0 and tmp1 into the #if]
Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
---
 drivers/crypto/hisilicon/qm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/crypto/hisilicon/qm.c b/drivers/crypto/hisilicon/qm.c
index ad0c042b5e66..edc6fd44e7ca 100644
--- a/drivers/crypto/hisilicon/qm.c
+++ b/drivers/crypto/hisilicon/qm.c
@@ -610,7 +610,10 @@ EXPORT_SYMBOL_GPL(hisi_qm_wait_mb_ready);
 static void qm_mb_write(struct hisi_qm *qm, const void *src)
 {
 	void __iomem *fun_base = qm->io_base + QM_MB_CMD_SEND_BASE;
+
+#if IS_ENABLED(CONFIG_ARM64)
 	unsigned long tmp0 = 0, tmp1 = 0;
+#endif
 
 	if (!IS_ENABLED(CONFIG_ARM64)) {
 		memcpy_toio(fun_base, src, 16);
@@ -618,6 +621,7 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		return;
 	}
 
+#if IS_ENABLED(CONFIG_ARM64)
 	asm volatile("ldp %0, %1, %3\n"
 		     "stp %0, %1, %2\n"
 		     "dmb oshst\n"
@@ -626,6 +630,7 @@ static void qm_mb_write(struct hisi_qm *qm, const void *src)
 		       "+Q" (*((char __iomem *)fun_base))
 		     : "Q" (*((char *)src))
 		     : "memory");
+#endif
 }
 
 static int qm_mb_nolock(struct hisi_qm *qm, struct qm_mailbox *mailbox)
-- 
2.34.1

