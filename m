Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A28A65B5171
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Sep 2022 00:07:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229488AbiIKWHL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 11 Sep 2022 18:07:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54280 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229544AbiIKWHK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 11 Sep 2022 18:07:10 -0400
Received: from mail-oa1-x41.google.com (mail-oa1-x41.google.com [IPv6:2001:4860:4864:20::41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E532A24979
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 15:07:08 -0700 (PDT)
Received: by mail-oa1-x41.google.com with SMTP id 586e51a60fabf-11e9a7135easo18809988fac.6
        for <platform-driver-x86@vger.kernel.org>; Sun, 11 Sep 2022 15:07:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=gV4FLPv0C8DI29EVAGCzwmEVVx6HK46Xhg+FI9Ktcd8=;
        b=AdvTP4/u0lltzKcd5xUJm+9f6b590t0ySQ4b+Zi6iBr1Q4GugkIF2X7FGqbb86MIRe
         GkN2AsFxhfjD+ERn2qBn/29J6B/2a4tpveB6DzSZRkrU/iMBvbUpZwkmEDBEba9w6aN7
         EnDkgOAELby0nptbQsmpdxgxxxCt4LNZLovxSBb9X0LjpVpecuKWK42KtRXyu4UUdT0g
         Oy7zZ9hD/gW53iLdUr0qIo3DzVQJpU3MJYYspyKwOQOYbeOCWSbodYlEWaO3Txp+YS9j
         09VtBWdYVm+Xt4WnFfHupk+J/XEZBueC7jcAxEc3WVwPX+0i00DqdumZcSIvN3Rf0MCt
         c4iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gV4FLPv0C8DI29EVAGCzwmEVVx6HK46Xhg+FI9Ktcd8=;
        b=XTwKcbek4xu5gGwExoP0U39bt3Rhx9djsnac1e1HRY1QmsKDGGVlZSDG7OQTENlD2x
         BSZMgqEVrQgG1OOU2q26yO1tQ+jXk3pZq6AAS35y+uFddVJeXQH7aj2kTbxVUUcMIZlv
         qVk4W8IPIehGvViyEFTA0Wxrja2/KiwXW7PI+I7AlS7cMbIa+QYfB6C0Eb0uY8q4e0Xb
         0lVPFF82C3KM/VixMF2MjL1UHpPkbBzKypmMfdBQGiOmtZ96srtqheqgGN2Lj2VDkadt
         qQy0QhHxfJleMEfKBiAYhOQTeCT76Rq7aOj/MmCzAdVvgTja2z7FtP8dajn+TVrD0fmB
         X+qg==
X-Gm-Message-State: ACgBeo0EMe9ZpzINRZebOVeRdvFA+RaVecocuG2whgZPNDtIx/nC+WHF
        1f6iCj4y9Xs796POAO9EOKeQRmRBsgSlr2o/jFw=
X-Google-Smtp-Source: AA6agR4Twvde9YUjh6juIJIX+qovqFK0c2uyt1VWDo+DogrhBEUV7RGqbSHCpYeYlCkxCzA3PsU0uLyMu8rRFaGDXoU=
X-Received: by 2002:aca:43c6:0:b0:345:e524:1e56 with SMTP id
 q189-20020aca43c6000000b00345e5241e56mr8235599oia.49.1662934028139; Sun, 11
 Sep 2022 15:07:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5e85:0:0:0:0:0 with HTTP; Sun, 11 Sep 2022 15:07:07
 -0700 (PDT)
Reply-To: cafodorgluk1@gmail.com
From:   CAFOD ORG UK <devangsonii03@gmail.com>
Date:   Sun, 11 Sep 2022 23:07:07 +0100
Message-ID: <CABSDFGehUQtmkyKBvPo466u91iq3OS7+9ECRJjmhJ-ht8Cij9w@mail.gmail.com>
Subject: Attn, Our Appointed Coordinator
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.3 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2001:4860:4864:20:0:0:0:41 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5755]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [devangsonii03[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [cafodorgluk1[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [devangsonii03[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
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

CAFOD,
Romero House,
55 Westminster Bridge Road,
London, SE1 7JB




Attn, Our Appointed Coordinator



The CAFOD organization London UK has approved your country to be
assisted for humanitarian empowerment to the less privilege people,
Widows and youth=E2=80=99s scholarship program.


In order to achieve this aims for this humanitarian program, we do
humbly request to appoint you as our coordinator to handle this
program in your country and We have approved some palliative
incentives and funds to be use for this humanitarian program which
will be releasing to you as soon as we confirm your acceptance as our
appointed coordinator in your country.


If this appointment offer is accepted by you as our coordinator in
your Country, kindly send your CV detail information=E2=80=99s including yo=
ur
scanned ID card or scanned International passport copy, Phone Numbers
and sizable photograph to enable us issue the letter of appointment as
our new approved coordinator in your Country proceeding to the release
of the palliative=E2=80=99s incentives and funds.


Thanks
Ms. Anna Ford
CAFOD's Head P.R.O
