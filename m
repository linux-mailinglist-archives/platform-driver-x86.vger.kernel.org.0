Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C9C4047400E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Dec 2021 11:04:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232847AbhLNKEC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Dec 2021 05:04:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232821AbhLNKD5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Dec 2021 05:03:57 -0500
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DF1AC06173F
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 02:03:57 -0800 (PST)
Received: by mail-pj1-x1034.google.com with SMTP id h24so13959395pjq.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Dec 2021 02:03:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=NBbb5ineoHSXxgxWYrMC7twB6sYssTuu0bNdk8QGvAM=;
        b=PdPzrMDijm0uqwGOKVT65IRNXx0gV2L3UXbYUD+QhK2NHq3nJy4Jyd90RV06eJgb2Q
         LT2tLazdbxCPnL3PgPJQtGrh58GezDdpuBmaZ4tAI3oeQ3MT0GEKKxTD6AgiXjVbR06t
         QRiUgobH6PLK9kLekpxDUE7n8rx4ByLKh4bgpzq2U5/bHcEhgRwyu4vcgBFOqTSnpEYY
         X+9O4KMCQmk/sHzcom2aQ4o6MjpabVdrgPETSs09Zx633YkEhmpQhpi/+28Za+HpyCZv
         ienxKIj1YtCKMJTIeh/DLGK+cCJaL0OJMsnKj/pgsRkJDUEhC/nQZszPtM9g244VkwmG
         qjPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=NBbb5ineoHSXxgxWYrMC7twB6sYssTuu0bNdk8QGvAM=;
        b=nivlMltTHu4ipgZhfHsWstyZEpaJoMAifCn5ZZNdKZhpwSonp7R/N3jxSCkbAfkyBn
         sTjA2z2NwBNgUKl8QW3UMxH8luH2Ffl9gTvLtvZkOP+3qisHqaDmG8Ftxiqx+LFnwPy2
         yNXRP/j30O8FAvstJCNz0aXEt9kEOrrWrOB2R660IExkq5Gs4A/aeGD0xLdJxEtbkv3j
         k+bREWt1w6iVG9lpttNf7ASm4siYXqpnM5IpVXJBNOHtVX0jaeDf9WZO+Opj3vs2GvKo
         qDvf7j+/Kp3bhaq6xGCd/I1wJ0GURYDyHvD6jSX34Mhb/SSHuSEiEWTQYPdZe8Arpcv4
         wcRQ==
X-Gm-Message-State: AOAM533KUmSaVAL/RwmVCkPm9ETMt5pWWsXr+lEdsUKLgYlbPkNSR9tP
        6xy/gHqGH4NyfMBUfIOFvWOUbgosHrmv3B/fCWo=
X-Google-Smtp-Source: ABdhPJz3UCv8s2ox5CMoJhARqtiSRf1RC0Vpr4ACM85mVMRGo1Cau3pfJ3MWMDLVvqRKsj37uIpv5tX/A9rwgvTWqag=
X-Received: by 2002:a17:902:db12:b0:142:3ac:7ec3 with SMTP id
 m18-20020a170902db1200b0014203ac7ec3mr4759156plx.2.1639476236714; Tue, 14 Dec
 2021 02:03:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:6a10:169b:0:0:0:0 with HTTP; Tue, 14 Dec 2021 02:03:56
 -0800 (PST)
Reply-To: cristinacampeell@outlook.com
From:   "Mrs. Cristina Campbell" <sp2295675@gmail.com>
Date:   Tue, 14 Dec 2021 10:03:56 +0000
Message-ID: <CANV8sVE+_4WkqAR=sujAtcpCii-oQoDhHhnYf2mzn6JkSH6f2Q@mail.gmail.com>
Subject: Kannst du mir helfen?
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Lieber geliebter,

Bitte lesen Sie dies langsam und sorgf=C3=A4ltig durch, da es sich
m=C3=B6glicherweise um eine der wichtigsten E-Mails handelt, die Sie jemals
erhalten. Ich bin Mrs. Cristina Campbell, ich war mit dem verstorbenen
Edward Campbell verheiratet. Er arbeitete fr=C3=BCher f=C3=BCr die Shell
Petroleum Development Company London und war auch ein erfahrener
Bauunternehmer in der Region Ostasien. Er starb am Montag, 31. Juli
2003 in Paris. Wir waren sieben Jahre ohne Kind verheiratet.

W=C3=A4hrend Sie dies lesen, m=C3=B6chte ich nicht, dass Sie Mitleid mit mi=
r
haben, denn ich glaube, dass jeder eines Tages sterben wird. Bei mir
wurde Speiser=C3=B6hrenkrebs diagnostiziert und mein Arzt sagte mir, dass
ich aufgrund meiner komplizierten Gesundheitsprobleme nicht lange
durchhalten w=C3=BCrde.

Ich m=C3=B6chte, dass Gott mir gegen=C3=BCber barmherzig ist und meine Seel=
e
annimmt, deshalb habe ich beschlossen, Almosen an
Wohlt=C3=A4tigkeitsorganisationen / Kirchen / buddhistische Tempel /
Moscheen / mutterlose Babys / weniger Privilegierte und Witwen zu
geben, da ich m=C3=B6chte, dass dies eine der letzten guten Taten ist Ich
tue es auf der Erde, bevor ich sterbe. Bisher habe ich Geld an einige
Wohlt=C3=A4tigkeitsorganisationen in Schottland, Wales, Panama, Finnland
und Griechenland verteilt. Jetzt, wo sich mein Gesundheitszustand so
stark verschlechtert hat, kann ich das nicht mehr selbst machen.

Ich habe einmal Mitglieder meiner Familie gebeten, eines meiner Konten
zu schlie=C3=9Fen und das Geld, das ich dort habe, an
Wohlt=C3=A4tigkeitsorganisationen in =C3=96sterreich, Luxemburg, Deutschlan=
d,
Italien und der Schweiz zu verteilen, sie weigerten sich und behielten
das Geld f=C3=BCr sich. Daher vertraue ich nicht sie nicht mehr, da sie
anscheinend nicht mit dem zufrieden sind, was ich ihnen hinterlassen
habe. Das letzte von meinem Geld, von dem niemand wei=C3=9F, ist die
riesige Bareinzahlung von sechs Millionen US-Dollar $ 6.000.000,00,
die ich bei einer Bank in Thailand habe, bei der ich den Fonds
hinterlegt habe. Ich m=C3=B6chte, dass Sie diesen Fonds f=C3=BCr
Wohlt=C3=A4tigkeitsprogramme verwenden und die Menschheit in Ihrem Land
unterst=C3=BCtzen, wenn Sie nur aufrichtig sind.

Ich habe diese Entscheidung getroffen, weil ich kein Kind habe, das
dieses Geld erben wird. Ich habe keine Angst vor dem Tod, daher wei=C3=9F
ich, wohin ich gehe. Ich wei=C3=9F, dass ich im Scho=C3=9F des Herrn sein w=
erde.
Sobald ich Ihre Antwort erhalten habe, werde ich Ihnen den Kontakt der
Bank mitteilen und Ihnen eine Vollmacht ausstellen, die Sie als
urspr=C3=BCnglichen Beg=C3=BCnstigten dieses Fonds bevollm=C3=A4chtigt, die=
ses
Wohlt=C3=A4tigkeitsprogramm sofort in Ihrem Land zu beginnen.

Nur ein Leben, das f=C3=BCr andere gelebt wird, ist ein lebenswertes Leben.
Ich m=C3=B6chte, dass Sie immer f=C3=BCr mich beten. Jede Verz=C3=B6gerung =
Ihrer
Antwort wird mir Raum geben, eine andere Person zu diesem Zweck zu
finden. Wenn Sie kein Interesse haben, bitte ich um Entschuldigung f=C3=BCr
die Kontaktaufnahme. Du kannst mich mit meiner privaten E-Mail
erreichen oder mir antworten: (cristinacampeell@outlook.com).

Danke,
Dein,
Frau Cristina Campbell
Email; cristinacampeell@outlook.com
