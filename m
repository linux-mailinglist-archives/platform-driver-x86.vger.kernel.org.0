Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 213AE50356C
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Apr 2022 11:02:04 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230449AbiDPJEc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Apr 2022 05:04:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45680 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229704AbiDPJEb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Apr 2022 05:04:31 -0400
Received: from mail-io1-xd41.google.com (mail-io1-xd41.google.com [IPv6:2607:f8b0:4864:20::d41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 776D0106113
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Apr 2022 02:01:59 -0700 (PDT)
Received: by mail-io1-xd41.google.com with SMTP id r12so4366898iod.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 16 Apr 2022 02:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=PeCqpIa9UAi2YKX+ZqpjTxaiYiOixzUQw32E0azWsPZ4tXqTQwM+wvoWnDLOSAAvLG
         um5E2C1/xF1fKiC5ohVVoe4vqETzIx+PsdkN2D6S/Zh9gwv/JkxqsGpJUh0DtkbZWim7
         Glj+/jH28SwfYPecfJal6kNOine4RQmRvMTQdAAkZCm94e+euZj09YR7tYXHYstT7rQH
         lTENs3pAiFDfT+A1eFuJDbQZm8LWja61i1pSBqfxbAltsj1UaZ+K0KAk5iw8HBjDP8Pn
         ZHIEMV8jshYhfhY11ZDS7K2cmcnFO/RRcgnzgS8VxY8YQVq8+TbbPE+jjWSWziQcL5Ri
         p3sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=KeMi8W+p20zdR41YZoRj2EapY7imNsLYkAgQIQsIzqY=;
        b=1UkPGnRfTYsiefZ+knjBBGXI/fv6kWg6+c8Cxu/scTdxtEIYidhU2OUBOxSJRmT3Gq
         olQC22GpJ60DAHP6Fj93+5sz52fEYkhSbOTblF8b6ADNPW0O1ZHCL//JXEzVrpPXAWNZ
         ltQKR8G5YLTOA897kGB2n4kPeVqw6ljLvhWrcngoLuSbyw+81jjOC8XxdjToRofYwLv4
         p+aORIngSTO6YPi1gsyFw/ia6zu86Q6gbinqz3IsWNdtiDlQS+IVfvKLGBYRp+/iEs+r
         UggEI1qbp3InEv8qBSffsrMQb2BH/NU3oR0TWskqFbA5sSixAzPnhamWgvv223asV28f
         x0kA==
X-Gm-Message-State: AOAM531wGWLC6fPkLgi8uqUaloBX+SMTSteuslrPWxJUdak0u+J+fSo1
        59owWSalOQK8xhdHA7JpkEQhLsgouQSMAlr8k0Q=
X-Google-Smtp-Source: ABdhPJzsiLGi4bW6dEvU94KGddrCJcne43AQWkGkNSVa33ImA5XqzX3CoN4X4uwcSXbc2Nh2bU37DRSvyDvCfpJMGJU=
X-Received: by 2002:a05:6638:ec5:b0:326:7c83:965d with SMTP id
 q5-20020a0566380ec500b003267c83965dmr1074224jas.139.1650099718729; Sat, 16
 Apr 2022 02:01:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a5d:91c1:0:0:0:0:0 with HTTP; Sat, 16 Apr 2022 02:01:58
 -0700 (PDT)
Reply-To: danielseyba@yahoo.com
From:   Seyba Daniel <handase0011@gmail.com>
Date:   Sat, 16 Apr 2022 11:01:58 +0200
Message-ID: <CAOrmDEC8dT72rg6T+hfUk6et+wwH_3cAWPFOpzZzt54RS2zX_A@mail.gmail.com>
Subject: Hello,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:d41 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [handase0011[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [handase0011[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

I am so sorry contacting you in this means especially when we have never
met before. I urgently seek your service to represent me in investing in
your region / country and you will be rewarded for your service without
affecting your present job with very little time invested in it.

My interest is in buying real estate, private schools or companies with
potentials for rapid growth in long terms.

So please confirm interest by responding back.

My dearest regards

Seyba Daniel
