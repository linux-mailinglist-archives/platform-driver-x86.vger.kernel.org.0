Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 4491953F9E1
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Jun 2022 11:34:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234297AbiFGJeP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Jun 2022 05:34:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239176AbiFGJeN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Jun 2022 05:34:13 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3A6741C939
        for <platform-driver-x86@vger.kernel.org>; Tue,  7 Jun 2022 02:34:09 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-edeb6c3642so22455555fac.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 07 Jun 2022 02:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=ohM259uqobJqtM7gttWurWj7P+4iDfPJquHax95olDY=;
        b=KjKOLTuVP/QAf9yH8iPuuU/x6DeKYvDoO2kd21ZDgmKT03P3TujSiuChwLy76VmkEu
         mvlpNk7wxttEfoG7OzCYvnEvX+b0+4YUs/nxfLxIZrF1+B3Uj34cKOr944BljsBdyBfR
         hbM4xviWDxlvEE2dAjvBA/1hwVpYir9ZTzmm36jE4J6vhnY/Bha+1v8oD9HDELc0YZ/A
         LzUqCIA+p9vcnoxLVqvZGvBTYaPy7O03uFH8rgtd9hYo7SK29FmQOUziLkceOOozaHRk
         giP15UzqazPmkirENyunOArKoheiK7IObLq32O13/LCN+KFtwUB5lVGJUWgdvv6AbFwR
         fJPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=ohM259uqobJqtM7gttWurWj7P+4iDfPJquHax95olDY=;
        b=SGwScc25PHEE1/u7OdK8ljY2vfa9ywn0dYa9+FtdjPEjzlpYIM4DFzXvnVS83s80sQ
         nfe/6mOazLhXJ5zenZ0tIV/QM9X4qa7WShiTlXYX5J96Ch5oOJKjWw9HQieUcTOE2go+
         scnqKSAD/FWO5Xo3jYRbZda6k7/SwvMoww6fhAlG8ZfdAN/6L8HvxxjaWEaNBUw0x1S0
         YUgx6/GUvVqE3kinTFw/csXvvxXCWwWlPTQm8FNGKFJf6kuZlRS2Nv7fqLa5K0c3w5Ks
         KmCzTlSg0zMwSD+xrfiW2WBB8jCQ7rqHXPMtSzlY3X/zLDSwz5buaWVwDyn6HkzxLy2I
         enAg==
X-Gm-Message-State: AOAM532y9OJk/toMd4/PrhZiJPDvHbGzFqXbmCIq0/PlpyB0jKy2Xjsq
        bhSQxDB5PyN4tV4tUBnnh7CymGgeTm0vqam3HgU=
X-Google-Smtp-Source: ABdhPJzPuYhrAb27uNBTRB+tm5UX6G4/G//vGm2Rl7BPctzuqMmOzshbGpr2jaKLmyFzPARSFVGO8TXVf5EsZCHCbFA=
X-Received: by 2002:a05:6870:b41b:b0:f2:c8c7:b30a with SMTP id
 x27-20020a056870b41b00b000f2c8c7b30amr32691784oap.22.1654594448529; Tue, 07
 Jun 2022 02:34:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6358:99a5:b0:a2:a1fa:9308 with HTTP; Tue, 7 Jun 2022
 02:34:08 -0700 (PDT)
Reply-To: robertbaileys_spende@aol.com
From:   Robert Baileys <mercymiji.j@gmail.com>
Date:   Tue, 7 Jun 2022 11:34:08 +0200
Message-ID: <CAAD1zObf1QRSpvefhLk-vDU1+buEz4S12HYauiaRggn5nne+pA@mail.gmail.com>
Subject: 
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
        *      [2001:4860:4864:20:0:0:0:36 listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [mercymiji.j[at]gmail.com]
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

--=20
Hallo, lieber Beg=C3=BCnstigter,

Sie haben diese E-Mail von der Robert Bailey Foundation erhalten. Ich
bin ein pensionierter Regierungsangestellter aus Harlem und ein
Powerball-Lotterie-Jackpot-Gewinner von 343,8 Millionen Dollar. Ich
bin der gr=C3=B6=C3=9Fte Jackpot-Gewinner in der Geschichte der New York Lo=
ttery
in Amerika. Ich habe diesen Wettbewerb am 27. Oktober 2018 gewonnen
und m=C3=B6chte Ihnen mitteilen, dass Google in Kooperation mit Microsoft
Ihre "E-Mail-Adresse" f=C3=BCr meine Anfrage hat und diese 3.000.000,00
Millionen Euro kosten wird. Ich spende diese 3 Millionen Euro an Sie,
um auch Wohlt=C3=A4tigkeitsorganisationen und armen Menschen in Ihrer
Gemeinde zu helfen, damit wir die Welt zu einem besseren Ort f=C3=BCr alle
machen k=C3=B6nnen. Bitte besuchen Sie die folgende Website f=C3=BCr weiter=
e
Informationen, damit Sie diesen 3 Mio. EUR Ausgaben nicht skeptisch
gegen=C3=BCberstehen.
https://nypost.com/2018/11/14/meet-the-winner-of-the-biggest-lottery-jackpo=
t-in-new-york-history/Sie
Weitere Best=C3=A4tigungen kann ich auch auf meinem Youtube suchen:
https://www.youtube.com/watch?v=3DH5vT18Ysavc
Bitte antworten Sie mir per E-Mail (robertbaileys_spende@aol.com).
Sie m=C3=BCssen diese E-Mail sofort beantworten, damit die =C3=BCberweisend=
e
Bank mit dem Erhalt dieser Spende in H=C3=B6he von 3.000.000,00 Millionen
Euro beginnen kann.
Bitte kontaktieren Sie die untenstehende E-Mail-Adresse f=C3=BCr weitere
Informationen, damit Sie diese Spende von der =C3=BCberweisenden Bank
erhalten k=C3=B6nnen. E-Mail: robertbaileys_spende@aol.com

Gr=C3=BC=C3=9Fe,
Robert Bailey
* * * * * * * * * * * * * * * *

Powerball-Jackpot-Gewinner
E-Mail: robertbaileys_spende@aol.com
