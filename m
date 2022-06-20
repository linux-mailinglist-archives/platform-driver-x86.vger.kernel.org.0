Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA956552700
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jun 2022 00:37:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237003AbiFTWhM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Jun 2022 18:37:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235910AbiFTWhL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Jun 2022 18:37:11 -0400
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF97317074
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 15:37:10 -0700 (PDT)
Received: by mail-pf1-x436.google.com with SMTP id s37so11406450pfg.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Jun 2022 15:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=sJAj3Pibe4dV3Wn4iD8LqBV4Q9WtlAaW30I/eyeGRmY=;
        b=f0eMLPTOmxlkEtVsZoozUnFYLZmsDEayfM8bdhvT5sFumQZwtax0lfdKRYzy7oNPtf
         /DQwqUbpaMkzmtVpNttC0reNdY9K2TSLYJKkZaLJuQYQN2F3hWArvOAPJO7ozNO4PCUl
         /5KlNCBjpQQw2hQo9aBbtKqHxj3AQnZcAxSaQ/icnGRvZVf5+7F/DNeEXURKzY+RjzX+
         BzUgZ/aOYghLvdY7qZgtXdRZO4a22TMS3MuT1pyAX2Ineb+Q+wCssu4Ek25TDQ8XbE73
         b6GSn8QeJyskrnlSZ5dvd5YKGclDN1JqY6VjBxtWFhasCL34F+Opxo35TuJu87vZonm1
         BJ6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=sJAj3Pibe4dV3Wn4iD8LqBV4Q9WtlAaW30I/eyeGRmY=;
        b=lhGirnDPc7UNOd6wWNwb9gAOWFxP90OmHiXynZKA2k508Sw43HwPauX4QB/wrQO8lW
         E+lNdFcMfIf1CMS7spy6vDwsxG7BwBXfNqp/dzEb9I5dXCS18fjg3Y73PmUAe6A3APoz
         y8dN5vPaUILUhh/G/ydRQ/RNmkz3LBMwMcBdfdRiNR281c/cQAIyS/YRYveq0WLPnlmX
         k6ED+r/I8rppoaAKu1XafHCvIzkduMeGP7QWqKaSgtNIgBU4eXBMfBCzkM1P+Ki7tV/0
         0SDOq5LcmeN8HHF3S/XFX+htLf5OJtuSJJ4gUwaD36S0cFL7HhF2DDsvLaorlZwTvFn9
         oAVA==
X-Gm-Message-State: AJIora92VbxOzHVtzXGxwu6mdhHCXTZClqdFFQGrH6D5RkEC5qoCN6My
        2g3oPztgTHFyt+4TMWlFuRAge2Cj5qvyAUkudiw=
X-Google-Smtp-Source: AGRyM1uCreYzdeFTOUr89M5SKALuzwt/X2pNog+F2i+qbyELZsW3IAWCXpPtjERA1869nUxuQ3sN26Uzjavl+lPYs7o=
X-Received: by 2002:a63:305:0:b0:3fc:7f18:8d7 with SMTP id 5-20020a630305000000b003fc7f1808d7mr23242683pgd.186.1655764630236;
 Mon, 20 Jun 2022 15:37:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a20:63a4:b0:83:f676:f327 with HTTP; Mon, 20 Jun 2022
 15:37:09 -0700 (PDT)
Reply-To: mrsednaemmanuel1@gmail.com
From:   "Mrs. Edna Emmanuel" <mmikechristian06@gmail.com>
Date:   Mon, 20 Jun 2022 23:37:09 +0100
Message-ID: <CAHC1-pL_Z-EV4T2Bg2-6hppM8QMZ8JEnqsf7b+zPene56XQDsw@mail.gmail.com>
Subject: Greetings to you
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.3 required=5.0 tests=ADVANCE_FEE_5_NEW,BAYES_50,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_HK_NAME_FM_MR_MRS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:436 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mmikechristian06[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [mmikechristian06[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [mrsednaemmanuel1[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.0 T_HK_NAME_FM_MR_MRS No description available.
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.2 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  1.1 ADVANCE_FEE_5_NEW Appears to be advance fee fraud (Nigerian
        *      419)
        *  2.0 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Greetings to you

I am Mrs. Edna Emmanuel, I was touched by the spirit of God to send
this letter to you after I have carefully gone through your profile .
I have in mind to help the Orphanage homes, widows and less privileged
around the globe with the fund i inherited from my late husband but my
present health illness do not permit me to handle this divine project
alone, I therefore decided to seek for your noble assistance
especially in your country to put smiles on the faces of motherless
children and widows across the nation. In our marriage of 23 year I
and my husband did not have any children until death took my husband
away from me.

This is why i decided to donate the fund which i inherited from my
late husband as volunteer projects to put a smile on the Orphanage
homes, widows and less privileged around the globe, your prompt
response and support would be most gratefully appreciated to enable me
proceed with the transfer to you upon your response for more details .

Email Me back here: mrsednaemmanuel1@gmail.com

Peace be with you..!

Yours Respectfully,

Mrs. Edna Emmanuel.
