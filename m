Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id F1F954E4A6D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Mar 2022 02:21:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241110AbiCWBW6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 22 Mar 2022 21:22:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241090AbiCWBWu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 22 Mar 2022 21:22:50 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 932596A013
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 18:21:21 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id b19so42838wrh.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 22 Mar 2022 18:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:from:mime-version:content-transfer-encoding
         :content-description:subject:to:date:reply-to;
        bh=oCs30GAS7xzH0D7xuZKEPKsnlYW16+76z/XMLVXvO2I=;
        b=FECPAB4UmE2gCiACuR1xrKEljeRwg0mUn2UC6Ny7MJ5VN/CON0nq0eikthYtsCDV+W
         BgrqDSyJ2bAJMSLy96Kbn/Eew7XFA9dddFHZdDxRX6sfIZglbE0YjkiX3Uwpk5q3ok/J
         bXOchxA1PHkfIhAw9m/pDVAyuVYq1ksghiS75rMc4oECZkg1waszNgADyik8xwDLolVD
         YYb+xgASeFsogNWhj0STyCkbpMxbBurstUbOQnI1+N5xmmUcWmm73bzFKHB4LWGFWeTp
         YaIs+FGJQ5jISMTEZhEWba5dWCsDyozHCCHJ+gJamqqLQ6VqIgjBGTQfokP2Lr93xMyO
         ngKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:from:mime-version
         :content-transfer-encoding:content-description:subject:to:date
         :reply-to;
        bh=oCs30GAS7xzH0D7xuZKEPKsnlYW16+76z/XMLVXvO2I=;
        b=si6GPputdbI2IXqdgVoElrIXZ/QNWA76fYctrMgoHRs+1+x8/w9Vsf9174GcZyULW3
         v7FG6/XFi+AYeMDCaU34KsFfFXtD4oX9dNzZGXhGy44qu/so4aFfIw8S6szoRo2kgBqS
         r4b4OLt0kTtPj4dhsr76wH6Ske/gUIya4/Swc4wLNryU8vic8ym2fSB+pXQrCAgWmaX4
         tDcQGSmctqF8hV9sBvqGnfuj/E/O45AhaZVCjXGKiA56f2gy/B2wQ4GGrJ5BLs71L6qb
         3hQmeUwpDkEGROmgp1W6gbxegk/mwq4s7vgL6s4tcGgN/wZC/jxQF3yWzsIU6Nt4p0wD
         HU5A==
X-Gm-Message-State: AOAM530BpJsh3+jFgv/vwXAf3HYX8KJpNDC3jxJPImU2Mm1zCPM+6ezj
        8OiBgPRITamPNWRglBZL0Ks=
X-Google-Smtp-Source: ABdhPJwzxkwyDwH9Jmdp+2SyItLl6A9f0n8l8xRljVZpOkw5+OIzKJa1lrXUeay0LnhWykXaXEPiXg==
X-Received: by 2002:adf:dfc9:0:b0:203:fb83:83f1 with SMTP id q9-20020adfdfc9000000b00203fb8383f1mr17102363wrn.81.1647998480237;
        Tue, 22 Mar 2022 18:21:20 -0700 (PDT)
Received: from [192.168.43.198] ([105.112.99.128])
        by smtp.gmail.com with ESMTPSA id t6-20020a05600c198600b0038cafe3d47dsm3368247wmq.42.2022.03.22.18.21.15
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 Mar 2022 18:21:19 -0700 (PDT)
Message-ID: <623a760f.1c69fb81.a39f8.03ec@mx.google.com>
From:   "=?utf-8?q?UKRAIN_UNTERST=C3=9CTZUNG?=" 
        <salisuibrahimbabangida2018@gmail.com>
X-Google-Original-From: =?utf-8?q?UKRAIN_UNTERST=C3=9CTZUNG?=
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: =?utf-8?q?UKRAINISCHE_HUMANIT=C3=84RE_ORGANISATION?=
To:     Recipients <UKRAIN@vger.kernel.org>
Date:   Tue, 22 Mar 2022 18:21:10 -0700
Reply-To: support-research@mailfence.com
X-Spam-Status: No, score=1.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,PDS_BTC_ID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        SUBJ_ALL_CAPS,TO_MALFORMED,T_SCC_BODY_TEXT_LINE autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hallo'

   Inmitten des anhaltenden schrecklichen Krieges, den die Russen in die Uk=
raine brachten. Die ukrainische Regierung akzeptiert digitale Verm=F6genswe=
rte auf der Suche nach M=F6glichkeiten, Geld f=FCr ihre Armee und ihre ster=
benden B=FCrger, insbesondere vertriebene unschuldige Frauen und Kinder, zu=
 sammeln. Die meisten Finanzinstitute des Landes sind aufgrund der Krise di=
eses Krieges auf ukrainischem Boden geschlossen, und wir bitten Sie um fina=
nzielle Unterst=FCtzung, die es uns erm=F6glicht, mehr B=FCrger in die Sich=
erheitszone zu evakuieren und Nahrung, Unterkunft und Medizin f=FCr die Kra=
nken und Kranken bereitzustellen . verwundet. Aufgrund der Schlie=DFung von=
 Banken in der Ukraine bitten wir Sie, per Bitcoin auf das folgende Wallet-=
Konto zu spenden:
 =

Bitcoin-Wallet-Konto: bc1qd5zrvejw7x6s4sewyt4alhqg5wtzagewjpwsvn

ETH-Wallet-Konto: 0xD129Dd238001BEB85fBa9A5A0c7A328189334502

0,1 BTC-10 BTC kein kleiner Betrag Leute auf der Welt, wir werden eure Unte=
rst=FCtzung in diesen schwierigen Zeiten nie vergessen,
Danke
Wir sagen nein zum Krieg!!
Wir sagen nein zum T=F6ten eines Zivilisten!!
E-MAIL: support-research@mailfence.com
  Danke noch einmal.
Ukrainische humanit=E4re Organisation
