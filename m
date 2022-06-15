Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 298A154CBF5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jun 2022 16:56:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237373AbiFOO4Z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Jun 2022 10:56:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235863AbiFOO4Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jun 2022 10:56:24 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DCCF369FD
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 07:56:23 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id h36so619488lfv.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jun 2022 07:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=/BYPyMOjXCsTkiPsOYX4eJwwo6DncOl/SMCstK4BSww=;
        b=Jwzd5DP8dzR/oqEPNRj3RLIrLqzmZjdZvQCmHD67lxPfhcqVUFiEQra2/SWUBTbczF
         cXuBvurTNuiUjVJdrjpuvg1Lc+SXyhxf3mBh5lHwoK1m5xnoNGQ002Un2oUO/wRSjR1t
         Po8vFGtX4dYJSfP1Kjn0bP03CQu7a+WJDCmkYkHxa21/sfVZFzNz1iJ7gD5lCYQrGuam
         +2G/NoXIaFK+eQVi5LHJtUPaR4xneEfrDqjJiSgL9DaGslbdX7dbh03joPErUmkU/JlM
         zuk4gxXo8aa1NJiOt3M2ah42rQ2NgN1JmUzJPKl3ioHPj5xuXNtfUQJSTpeO8li1Qev/
         X41Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=/BYPyMOjXCsTkiPsOYX4eJwwo6DncOl/SMCstK4BSww=;
        b=m0w4ITp6jC2BjLmfAF/CB867fcZPgou56wJ342CDF79meLcQtoXiHn/lbiJHviFihw
         kkoyyqhWGV/T3aeSwT6bUCKD9urAdvbL37YDOXRgHq7kz/K5ZKcvjEScEYK8kJlx/vSW
         gSgkpvvRNLbvW16Pbsp/dDTJyTXdW0kMb6pGgFVQ6p955rpOfEdqBAI2IgFekBAkttJZ
         clQZnT6lJvly1JYqRALrH93J2EhdLtp0b9UlPAcP4nkiiBcVquSk2iCzFb2BxwdpsJ8g
         CjKYAIQV80snTfprha7y/RyfKXW2xSpDvYUbR1pSvQfEK3HIf0JCgy3WWHJY1KIccy3/
         PqrA==
X-Gm-Message-State: AJIora/hTWiHzVa0Vnh7bNXrcjCLc9JKtEQ0KbuxT/iCUbr1nXklgXNN
        4gmSEHXwO1/HKYzKoRh8akOK9FnJ15eJZlZ4eK0=
X-Google-Smtp-Source: AGRyM1vcayvtTWkIECBUSBS2td/p0wO4NTUmzAH+sNo/bGDFuu/pR5iTDfm89E0p9xeEH83yDFapOzNikCkm3NP7IsQ=
X-Received: by 2002:a05:6512:131d:b0:47d:d28d:f114 with SMTP id
 x29-20020a056512131d00b0047dd28df114mr6236341lfu.123.1655304981618; Wed, 15
 Jun 2022 07:56:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6520:2031:b0:1f2:6f99:c347 with HTTP; Wed, 15 Jun 2022
 07:56:21 -0700 (PDT)
Reply-To: Thelottoboard@australiamail.com
From:   Australia The-Lotto E <tassingt@gmail.com>
Date:   Wed, 15 Jun 2022 03:56:21 -1100
Message-ID: <CAGRDgB9-X5pCyASFfLqLYMtta-njmXEG_im10TsqQC22emj8Fg@mail.gmail.com>
Subject: =?UTF-8?Q?Re=3A_F=C3=A9licitation_=21?=
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=6.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:135 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [tassingt[at]gmail.com]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        * -0.0 T_SCC_BODY_TEXT_LINE No description available.
        *  2.3 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  2.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  0.6 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: ******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Bonjour =C3=A0 vous,

Madame Concorde Manet, de France vient de remporter la somme de 1 375
000,00 US$ de The-lott Australia.

Cagnotte organis=C3=A9e au Burkina Faso Heureusement pour vous, votre
e-mail est automatiquement envoy=C3=A9 en pi=C3=A8ce jointe aux num=C3=A9ro=
s gagnants
de Madame Concorde Manet.
Le gestionnaire de paiement, M. Troy Taylor, lui a vers=C3=A9 3 millions de
dollars et a d=C3=A9cid=C3=A9 de vous indemniser avec la somme de 375 000,0=
0 $
en tant que propri=C3=A9taire de l'e-mail porte-bonheur, ce paiement est
disponible en Malaisie et non au Burkina Faso.

Contactez le repr=C3=A9sentant des gagnants, M. Numa Chinchinde, son email
: TheAgent@australiamail.com
+226 60 69 50 43

Remarque : Le paiement est annul=C3=A9 apr=C3=A8s le 20 juin 2022.
f=C3=A9licitations d'avance

Acclamations
Australie The-Lotto Secr=C3=A9taire
Mme Mia Ethan .A .KimTinga
