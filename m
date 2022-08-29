Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1EC395A5554
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Aug 2022 22:10:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229740AbiH2UKh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Aug 2022 16:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229472AbiH2UKg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2022 16:10:36 -0400
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com [IPv6:2607:f8b0:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E4B27174
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 13:10:34 -0700 (PDT)
Received: by mail-ot1-x335.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso6686816otv.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 13:10:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=d71CT5Ol/IvK/5h2IOc/UDNvNpa0+WDKIHxLwF8Xvxc=;
        b=NIAYJ3uRCPC3fLgqQmkdJOWFylJIntULgAJv4yxYEvYVSTq/Z6zVhtubZ1V+KKTf3c
         jcebZZs9kva6M1OGeV+pV4iiJy+Kqpw344ir6Sh3oP0Sg5gop7/FwvOe0mfghBcb9tWH
         DEf30oAetD7WtgLt0XWfXQ6f4Bnb6MKh5lhaq/avtNAKOil67e3sRmXomvL63tcDDGxE
         BQRVBQCbaE4SAunstDKRwqD8Lhq/s8aB4g2L4Haqhl9cJBVuUqvst7y1SMpwzhItYhQy
         MgbvXc1kpiWn0qeD33iz8G9aR2XAR/WAzdshraDFQMxw5R2mNgCc9ZqZK9k7ZU9eqt8C
         cFxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=d71CT5Ol/IvK/5h2IOc/UDNvNpa0+WDKIHxLwF8Xvxc=;
        b=fom0KajxuJ4tD+vXSghfsICLSPMOGWfDuu4kxbPZU4KSBusNNJfcgVrtUPBt/t7u/a
         P3Lw6t/TKCApH7uh58Ooq8tmqu9zlsuFsrS+eidv8UJJuPIpKvFxYlplkyGrTxKDgf0A
         /7lLFFOmLOwnj9pzVvqTzSk5PhV/RI6IL8qFhKy95EyO6vw+KVp5n+HOed2PxvTBmT5S
         rM0WdlcV++NswiDzw6WY7qxo6EtQs3UGL0QFWLDfwcOlOp5w2XAlaqK0o5LQNRL6E62h
         ok2iInKUKoNfWPppasgbDwT/IY64xho2AgT23xLC/yNrLyfleAlE/71E84LGQmkLhyfF
         cvzQ==
X-Gm-Message-State: ACgBeo0hf+O67LC8qDsU0fla8LU13QOCHM3Nw2CgWG/2sJP9KEyyFhek
        ipxUeXH1t/f90Il8q9OGUUAUoagd6FMTb3PWXko=
X-Google-Smtp-Source: AA6agR4kNyV87E8/efzM4r4PMbq8aFiGWvsDF2AM12BjJsaUugPK/P8vQVHpb0TD9Gb3zLBV+MUIBzS1PF1fHiqTjQM=
X-Received: by 2002:a05:6830:3194:b0:636:e7ef:aa1b with SMTP id
 p20-20020a056830319400b00636e7efaa1bmr7298620ots.24.1661803834249; Mon, 29
 Aug 2022 13:10:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:45cc:0:0:0:0:0 with HTTP; Mon, 29 Aug 2022 13:10:33
 -0700 (PDT)
Reply-To: sgtkaylam28@gmail.com
From:   sgt kayla manthey <tchaloelise@gmail.com>
Date:   Mon, 29 Aug 2022 14:10:33 -0600
Message-ID: <CAObQroVcubsaDnkG9L3S5yNP=KpRTrpQgpvm3yuU9qPv5BuVow@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.7 required=5.0 tests=BAYES_60,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:335 listed in]
        [list.dnswl.org]
        *  1.5 BAYES_60 BODY: Bayes spam probability is 60 to 80%
        *      [score: 0.6038]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tchaloelise[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [sgtkaylam28[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hi,
Did you get my previous letter? write me back
