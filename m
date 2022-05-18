Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 79FB952C748
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 May 2022 01:03:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230088AbiERXDd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 May 2022 19:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229752AbiERXDc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 May 2022 19:03:32 -0400
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com [IPv6:2607:f8b0:4864:20::b2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D5C214C74A
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 16:03:31 -0700 (PDT)
Received: by mail-yb1-xb2d.google.com with SMTP id q135so6144241ybg.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 16:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=ZOWKL2a5YAULp3xCPZWW0AfOGBC9qOCSnbSOBPFpNTADv4ekt2OyewRQzIgKPc5v5n
         J4/BNSpT64FsD683lRLOWbND0BMgUvpMKwdc35/zOqBkhgFR2g5jdBavCpWNZgRC7859
         7WIsChvwYVF+0f91uKB1OB4NZbOL5hrsR8eEZQPxDQdYWqxWxBp11kKtpRHGQFttvIKO
         G9NMqJh/mSfBMMdYbkf7iDEd6vVD39fHgOznTfBBPCb3K+CW4Vz/qPyRoXhSpLHZvMg2
         8FsG6zPLDkv1YfCzM3dw0gkJTlA1x569+pKVwoq78sfi2uSzvOJ7ElSD/+Zsje9z4C8I
         Cllw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=mZ3wqB4NmL7z6lpFr/h15h1rYqsZKafJnUpMVahbEPg=;
        b=cQqWA/mZ+4bTfWNSkbL2+KVpzG8NdXyIUDbRl02yMqmdVFhRGdsEmkicksAR5qPZbq
         eNXAwLPHULkyigRmpm90CFDqn5rPcIxiaYA8YCOPReeL76c5ZFleYT2esfQeDg8h45Gg
         K1iUT3bFdURqq3oFuWxlebl4p5k2e7qSfBMC+0mvMrqonrAzwRBfZ4iKqVQALCHCzp6B
         CJIuEJpqNWCjO7XIneZuIjOE5K/424Pg3DIDuZRjqT/jJV7V4RpI+QcJQq1mclL1WE0R
         IhBexCS5GxnaJ0+WfYUZ4sfl9hxieukU/M33v7oLl3FEfyue90FEgrdfVHJSPzZHSIfg
         OhkQ==
X-Gm-Message-State: AOAM533iGQ24TF0bCHDlGx8Au+u6VXs4X+szp0YSoflIbhdsJBHZVYvL
        MyX0InrQtEZea4bqifWf8KsM9M/PGLhICf0eu/Y=
X-Google-Smtp-Source: ABdhPJxf0tV08vbzN0rAFCI3UEXsuJ12IdkPsLmyZH50P5b/emd8l5uHEOLPh+wJvW5UqwAUsVSEb1BnrFoN6RVV1B4=
X-Received: by 2002:a25:2488:0:b0:64e:a74d:fc7e with SMTP id
 k130-20020a252488000000b0064ea74dfc7emr1804952ybk.563.1652915010915; Wed, 18
 May 2022 16:03:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7000:7143:0:0:0:0 with HTTP; Wed, 18 May 2022 16:03:30
 -0700 (PDT)
Reply-To: tonywenn@asia.com
From:   Tony Wen <weboutloock4@gmail.com>
Date:   Thu, 19 May 2022 07:03:30 +0800
Message-ID: <CAE2_YrD_q4RQ8FABWS-V7Ntbjw=B4TRdbwdVhRsdjWZbffLM8Q@mail.gmail.com>
Subject: engage
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:b2d listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.4722]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [weboutloock4[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [weboutloock4[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  3.4 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Can I engage your services?
