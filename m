Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0D9446FAF33
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 May 2023 13:54:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236418AbjEHLy2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 May 2023 07:54:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236411AbjEHLxt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2023 07:53:49 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1228A431D0
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 May 2023 04:53:36 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1aaf2ede38fso43453025ad.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 May 2023 04:53:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546816; x=1686138816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=LI6hJFWMPnsAo7nIAUuNh8he07mq1qgBALuGpR9EPgsWn0RuQgqraPJfQDVda1IPzP
         dxfRnz2+Y1bBoCiW6MOE7juSAhHpWJ5eHqBpRXu6YmP8VojcJM4EoeZQlUqk7qVboH0r
         A+Q9G5B1hyxCv4ivTDFstBhRFjJb8+NWDTdCrbOGDjkl0MIJm5n95AroRQ88lMxfgPqT
         JrBnULZUv/fWaGdmODxR/f+VFKjEDxTExcbSfGxpMgB1dt+zxESFqt+Wjv/vLG4AQVAS
         35iYEQdCAIV6RHM2AkPKMrGfP5t56Mm4wvj4UplcEL3D8qytkfAH0uRNjcFGeSquvRNo
         SSAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546816; x=1686138816;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g9sxg5LZ/1sJSiDItv56ESM72UWoohRRXZed1vK0StQ=;
        b=bseAifSwoh2MgxZbWw3gO/phdG1b9LEUgeBeLW4M68yLYr0CxmYUx9ZHhrCrvl519j
         8C4WQh5eejk4d9fc7dqrsQQ9mX1NGxzeyHanQrxmf024hg5cj+iAEpezS548bhrRgMJl
         U14ktzj8Z4jUeByAWlpjOiIZ5Xfa+vIx54TBObfHuNYiBMpmmZHMxM62S30gz/p5k8i+
         gvAAIiee4mdwvUI9PfIasFC7AOccfH7n39ArX8omFROw6/KCN6w5OG/NI/WhRp48q0qO
         IrAiSMivNB/HoKJMX+eapkM1FQS6yRvOIb5Lojb3VbKDcJSS2FjmeLxSlQb+Kvnk82ls
         2B6A==
X-Gm-Message-State: AC+VfDyg02Cnwc//NuMSXfvrL45Ov1ObFZwlpZeJxvzD1DDADYoiD71N
        +ffeMkArrh1r27EMczTAh6SGwQ==
X-Google-Smtp-Source: ACHHUZ52W6P99fGjx1H1aTdF1PS++Nk8GKk+bQ6gsyNGyvgDs6xJ01TMTUEtUHiG/54yN9c7UrsPkQ==
X-Received: by 2002:a17:902:b085:b0:1aa:fdab:24a5 with SMTP id p5-20020a170902b08500b001aafdab24a5mr9199631plr.10.1683546816386;
        Mon, 08 May 2023 04:53:36 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:36 -0700 (PDT)
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
        Tom Rix <trix@redhat.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH V5 05/21] ACPI: OSL: Make should_use_kmap() 0 for RISC-V
Date:   Mon,  8 May 2023 17:22:21 +0530
Message-Id: <20230508115237.216337-6-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
MIME-Version: 1.0
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

Without this, if the tables are larger than 4K,
acpi_map() will fail.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
---
 drivers/acpi/osl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/acpi/osl.c b/drivers/acpi/osl.c
index 3269a888fb7a..f725813d0cce 100644
--- a/drivers/acpi/osl.c
+++ b/drivers/acpi/osl.c
@@ -276,7 +276,7 @@ acpi_map_lookup_virt(void __iomem *virt, acpi_size size)
 	return NULL;
 }
 
-#if defined(CONFIG_IA64) || defined(CONFIG_ARM64)
+#if defined(CONFIG_IA64) || defined(CONFIG_ARM64) || defined(CONFIG_RISCV)
 /* ioremap will take care of cache attributes */
 #define should_use_kmap(pfn)   0
 #else
-- 
2.34.1

