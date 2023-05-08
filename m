Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB0566FAF2B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 May 2023 13:54:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234720AbjEHLyE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 May 2023 07:54:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229464AbjEHLxg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 May 2023 07:53:36 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF6C05FD2
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 May 2023 04:53:28 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-1aaec6f189cso29517075ad.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 May 2023 04:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1683546808; x=1686138808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=fBHUfS8fWSAOqlwT6Q08NJnR0u3M9PyiSxhBSIcvPa/yshAYWNpI0o9m3i1+avJke7
         UpdOLZb8RloM1SZR7kh5kmhzwoaBrLsvxZoeqYVZqqF396fb/4BhWwd23qb9VCpaKumw
         +uzkOQJbxs7oZeo9NsWhaHt5YsTFd1D2MQy8quk+pYQZ9V1E+g372HhAHRdQNMKrPpL/
         Y2eneBn1k8hN2tTm1lHK/RgQHMRZvomTuBl9iOkHafRg69ncMDwy+Yu/SoJirdME89sk
         +YabmC7IczGRfgKnOXQXtodoUNlYgFuPjduPauQRgsg6YGZbopdDa3L+DuoJF7LnTN5O
         CPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683546808; x=1686138808;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1wcGbfhUP5NrwGCYl7Q1yL0FMzRdJBr1PIlnUSkktJs=;
        b=bGPczoSxuFW1ACG5io6lMbckjv4e0muPiAV1aujZ84YEtywlGurqmrtU+b74p0cnWe
         38ZtuJ124v1oWkiqh0jSXCUbD/tN5pJ6vl2+e0CDbKL53Et6CEcDNUBJo8Y11j1FMfS0
         f5dBrdEUCv01MWpY7bkBdSbftSDxIr9KPTEb4SIWjB1Dn9YBbn4F2ZsDYWz74cquIeEO
         ZRTW/bYWIIHbiS8thMNank/ImORFMf66PbbEYWH8Oz0h4AE7DDUbC5u2mhaqAsFRDjwL
         9zAadhve4jvfxXAR+BMSI9bg8Gj959tJQy406uGO0ScQE6XrBQJzJUCJY7TS2j7L7V4Z
         NZPg==
X-Gm-Message-State: AC+VfDyqOMHtuiSuEnF9gai0UkKTv3iCPfkjsOdfXoF36xYJU62Kzb5g
        FqoOP9aiCb7xGU+RrDfMui0RHw==
X-Google-Smtp-Source: ACHHUZ4YPZPXYK0bFQvCKyd/gnSncEBJ6qVKzMyJ4dAbIZymuHBA+fio0dFknn2dgtRYb5PHf8ADKA==
X-Received: by 2002:a17:902:b405:b0:1a5:a1b:bbd8 with SMTP id x5-20020a170902b40500b001a50a1bbbd8mr9546124plr.45.1683546808426;
        Mon, 08 May 2023 04:53:28 -0700 (PDT)
Received: from sunil-laptop.. ([106.51.189.144])
        by smtp.gmail.com with ESMTPSA id w9-20020a170902904900b001aaed524541sm7015149plz.227.2023.05.08.04.53.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 May 2023 04:53:28 -0700 (PDT)
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
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
        Andrew Jones <ajones@ventanamicro.com>
Subject: [PATCH V5 04/21] ACPI: tables: Print RINTC information when MADT is parsed
Date:   Mon,  8 May 2023 17:22:20 +0530
Message-Id: <20230508115237.216337-5-sunilvl@ventanamicro.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230508115237.216337-1-sunilvl@ventanamicro.com>
References: <20230508115237.216337-1-sunilvl@ventanamicro.com>
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

When MADT is parsed, print RINTC information as below:

ACPI: RISC-V INTC (acpi_uid[0x0000] hart_id[0x0] enabled)
ACPI: RISC-V INTC (acpi_uid[0x0001] hart_id[0x1] enabled)
...
ACPI: RISC-V INTC (acpi_uid[0x000f] hart_id[0xf] enabled)

This debug information will be very helpful during bring up.

Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
 drivers/acpi/tables.c | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/drivers/acpi/tables.c b/drivers/acpi/tables.c
index 7b4680da57d7..8ab0a82b4da4 100644
--- a/drivers/acpi/tables.c
+++ b/drivers/acpi/tables.c
@@ -220,6 +220,16 @@ void acpi_table_print_madt_entry(struct acpi_subtable_header *header)
 		}
 		break;
 
+	case ACPI_MADT_TYPE_RINTC:
+		{
+			struct acpi_madt_rintc *p = (struct acpi_madt_rintc *)header;
+
+			pr_debug("RISC-V INTC (acpi_uid[0x%04x] hart_id[0x%llx] %s)\n",
+				 p->uid, p->hart_id,
+				 (p->flags & ACPI_MADT_ENABLED) ? "enabled" : "disabled");
+		}
+		break;
+
 	default:
 		pr_warn("Found unsupported MADT entry (type = 0x%x)\n",
 			header->type);
-- 
2.34.1

