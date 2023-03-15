Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D06AA6BAB4C
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Mar 2023 09:57:12 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231657AbjCOI5M (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Mar 2023 04:57:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231236AbjCOI5L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Mar 2023 04:57:11 -0400
Received: from mail-ed1-x541.google.com (mail-ed1-x541.google.com [IPv6:2a00:1450:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 592FE6230C
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 01:57:09 -0700 (PDT)
Received: by mail-ed1-x541.google.com with SMTP id h8so28728945ede.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Mar 2023 01:57:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678870628;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2db15S6iWXRPdgvftXuDGGeFS+ITB9v/lZ4kZjfX2FE=;
        b=bbgttw82VabKnfSALPKyY6CSe5VdryHXsV8GlOAO7bL4cN2r6fMuQVqFB1Jm6hk3vn
         S2zsqJVs+JfWweRwNgUAh0c6MmfoFevIquw2Khmo4dYBtWNoBUeJfG9YU8QQ0X1KmtaY
         1uXiiXhudEt2ASXi58kMvZrWXf6vIgs1X/u9hrWDGNCqpeNHRp3I8bfm4X5UDrHsla0E
         PevXgj+2984Uyab6h7MP0Yv5peGmRHMtPdXw8CiPz/wZ25YefClVetVFYq/VeVugxtXh
         uwVlcgFA11uM86vcNDLXWGXEIB6E/OU5HYebKC9wzZrZUyDu8LblTOcSKiSMrU4dUzmf
         lmWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678870628;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2db15S6iWXRPdgvftXuDGGeFS+ITB9v/lZ4kZjfX2FE=;
        b=P4ThYTNkazcRoN4LBDqY6zkR4sFli5XHGjSng6L+gyGdjrOhm5pHKby8JBMKBCNf3U
         WLYsDIxLonB+YBm3VJN16dF9XUv+7OW47K12qdazFVC/KhqqsBSMCulIKCtF1EIZTWsq
         Lm8BTo/umFNcvt31TbbwlkVt2/9HZGmvVxP+GKlG8aghy4ScxxLlUD6x3XpuniAgt1ZQ
         A3j/5vxWV9plWIw+Kcovs22ANZMEgYK4uyUR2YB/12lRL73T4yM7YgsmWhBEwfenpy/j
         TgtwzkIz0VKADweslMxunH7NP8agwv0h1t15BHN/epQMK/J0r4seTnHmRV80KE90Cda3
         WCQw==
X-Gm-Message-State: AO0yUKUUdbJrI8pkPtwuqWAgUE+Z2jBLPeFeMYdDCFAMDWVdyQMyc7eK
        Wqv57VYk4QKxOi0nsD0xa2CuMQrLuvv6VJ+TtWo=
X-Google-Smtp-Source: AK7set888hevlxtdurMiEgh70tqqe1B1++4hrC93S6R+CrYfiBR+1djVWX+sQvl0YvLZOj5Ey/IQcyygvvEu8r8sfTs=
X-Received: by 2002:a17:906:cf91:b0:919:2e39:95e5 with SMTP id
 um17-20020a170906cf9100b009192e3995e5mr2673267ejb.6.1678870627779; Wed, 15
 Mar 2023 01:57:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7208:70ce:b0:65:6438:62d9 with HTTP; Wed, 15 Mar 2023
 01:57:07 -0700 (PDT)
Reply-To: hitnodeby23@yahoo.com
From:   Hinda Itno Deby <georginaaaibi17@gmail.com>
Date:   Wed, 15 Mar 2023 01:57:07 -0700
Message-ID: <CAFDg=jX6rPgtjuqQNXRA4=NHzdreToopJSdg+ajVZ8JXOgub2g@mail.gmail.com>
Subject: Reply
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.6 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM,UNDISC_MONEY,
        URG_BIZ autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:541 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5030]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [georginaaaibi17[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [georginaaaibi17[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [hitnodeby23[at]yahoo.com]
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.6 URG_BIZ Contains urgent matter
        *  2.9 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello

My name is Hinda Itno Deby Please I want us to discuss Urgent Business
Proposal, if you are interested kindly reply to me so i can give you
all the details.Thanks and God Bless You.
Ms Hinda Itno Deby
