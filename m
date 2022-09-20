Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id ED7555BE22C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Sep 2022 11:37:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbiITJha (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 20 Sep 2022 05:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbiITJh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Sep 2022 05:37:29 -0400
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com [IPv6:2607:f8b0:4864:20::112e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0FC8260523
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 02:37:29 -0700 (PDT)
Received: by mail-yw1-x112e.google.com with SMTP id 00721157ae682-349c4310cf7so20333477b3.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Sep 2022 02:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date;
        bh=QmySyHStMNKJAfnalsbXlfP+WCAMWHt65Ki2iNf9Kdk=;
        b=JYFIgirksbdAcLxnDPMYYw4VOO4Xpx4Kc7vRK+S8Lcx34jB6BDLH+M/U9Pr4XbqdXA
         GZrzDPPNK3iBU7UONkHmqJ/RqRlk5d0sPQD6ZETXG10JsAdVNYKYubvDgo64xhI7Juiq
         ysAyc5iNflGsePVZ0nkf8fDI8D6ywrnzVWOs33sSS69fLEJkrsaSp/e9s7BiGuvcWbqh
         kIs/sOZuSO5hRGHOXGgD8Canr/Ak4M6P4ak9eGeEHr5NckkjN74tF0XX74brTCJNXVUB
         sYZ/qtlBxLaA4epACxBYSpxvqacs6YHfcfQL6DBmupI0M82On9sJVnCEYZCJXbochhO5
         Vr+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=QmySyHStMNKJAfnalsbXlfP+WCAMWHt65Ki2iNf9Kdk=;
        b=wqhuCMQkgQxmqNItLbD7wDfxUF8/UMMNfbXSi8zoWHSu29M0UkayCcR71iz3PKyOTn
         LBE5Bl60/dup70hROY2YOyze10EHrHV33Jmk2CGB4s/AtIHFZ8+N5Lz5Jx2rQQRHXTC3
         wxgU/PKOYxkDSarUSn91GXgTkdnAU2P4IkZtnJGT/mIKkwFMD4ffWSz/M/F/tV5r6OqN
         0WYzjmxy3hD9IEKijl8sjD7amtISww9jTXmqu9Kg8ZRfvPYu8ceUHrw+aSFBwrMYV+RT
         jzIVT021owfwfN705FMSOQ75mL47cohQHqA8vOnrWHWW9RorCouQLq+i7pxkOlnfOFK9
         tQXg==
X-Gm-Message-State: ACrzQf3KVoDx7/92/pBS23mUPLFtG/hYQrRy9ZaS2pVJtNW8p5bXIaff
        2J12PFLKhqx85IO+Q9HKMnI8LgYqES22G2zPIHI=
X-Google-Smtp-Source: AMsMyM5Yqxk/azzFzPywaeX0jcG9POONaVo7IEneHr/z74P3NKpVmlda3F5v8+7ccnxA+Rdrj9FwiEH5mnkvvwjLhEI=
X-Received: by 2002:a81:c241:0:b0:336:f5a6:2e36 with SMTP id
 t1-20020a81c241000000b00336f5a62e36mr19292194ywg.123.1663666648157; Tue, 20
 Sep 2022 02:37:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:7010:268c:b0:2ef:dad0:acf6 with HTTP; Tue, 20 Sep 2022
 02:37:27 -0700 (PDT)
Reply-To: deutschebank282@gmail.com
From:   Deutsche Bank <emmanuelalheri55@gmail.com>
Date:   Tue, 20 Sep 2022 10:37:27 +0100
Message-ID: <CAHo5D3cxmvsLALx2bo=5HNRn7g8sFhcC0+P2YE3knko6nqwOLw@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=5.2 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112e listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [emmanuelalheri55[at]gmail.com]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [emmanuelalheri55[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [deutschebank282[at]gmail.com]
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  3.1 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Do you urgently need a loan to buy a house?
Do you need a business or personal loan to invest?
Open a business, pay bills? And pay us this
installations back? We are a certified financial company.
We offer loans to individuals and companies. We offer
Reliable types of credit at a very competitive interest rate of 2%.
For more information email us at: deutschebank282@gmail.com

Ben=C3=B6tigen Sie dringend einen Kredit f=C3=BCr den Hauskauf?
Ben=C3=B6tigen Sie einen Gesch=C3=A4fts- oder Privatkredit, um zu investier=
en?
Gesch=C3=A4ft er=C3=B6ffnen, Rechnungen bezahlen? Und zahlen Sie uns das
Installationen zur=C3=BCck? Wir sind ein zertifiziertes Finanzunternehmen.
Wir bieten Privatpersonen und Unternehmen Kredite an. Wir bieten
Zuverl=C3=A4ssige Kreditarten zu einem sehr g=C3=BCnstigen Zinssatz von 2 %=
.
F=C3=BCr weitere Informationen senden Sie uns eine E-Mail an:
deutschebank282@gmail.com
