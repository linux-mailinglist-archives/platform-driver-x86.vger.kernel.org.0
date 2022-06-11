Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C6002547406
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jun 2022 12:56:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229775AbiFKK4z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jun 2022 06:56:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230367AbiFKK4y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jun 2022 06:56:54 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4498A737B4
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jun 2022 03:56:54 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id g10-20020a17090a708a00b001ea8aadd42bso1650052pjk.0
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jun 2022 03:56:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=NkqkIm6NRuvnh36ZiCD/S9l+w84cqlTuqp9AoZn8V4o=;
        b=TnQT+ASehQ9pl1fUqvF85eXscRDlMEB5s3xFzERs9OLqaubF/eFeqZ8DIXgdSKOYzQ
         I6eN+g7PGj4ezgqJqWmt6T6dduIWHOcIPqfbGB67whaD2OTdJqMv3ABszTcvDCi7o6uo
         WZWhhWQ4giLqR75Nn4mHEx02XjCJ7wodWfFKFR4UQp0tKUSA7FaFIAnOFZeOkm1YD+B8
         DqWzFrAg3e/4GROoBmaKKEGLsa2pzbYEwyPpoqGcC4lDqH4+tq37VWlKl4xMjme5qV84
         cieGhVanhUE4iS/4cJaCBBxK420kaO8FkuoVmF809jwN2lmEBP7CQ3RCWayTCKIjsgi3
         ZFmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:sender:from:date:message-id:subject
         :to:content-transfer-encoding;
        bh=NkqkIm6NRuvnh36ZiCD/S9l+w84cqlTuqp9AoZn8V4o=;
        b=JVp+KZ1oZZNzYvVs1oUjLSejlXcUKW2W/brdcfRRfTzQhXqLd298wuo1njp2XHrz74
         KQrOW42qG3KVzBui71Ls8jpO4vKYf0mYuPLFbNEjlYh/4sfQRuMJEjd8g4rqMtLMuY9G
         EjWVs4rTQD4rzsD8BP63wkoUKMD//lyXeTsUhYbryyS8mH8j3KXhW3f8XrTkuHEV/Egi
         a+5LpDsKaefu5d6bwRCbXVUoty7kid4ai/2NwZAOSKV2Q57rktaJs35pNmasPCzyCCab
         CRRE/v6hIWHJ2w9/9BTNbf2pqE0MeWgx9REEr/89s7ZIR23pQQgc2y8bz7PXQRjtZh+G
         tXlA==
X-Gm-Message-State: AOAM532rPyNa0DpOQdkqvZIDx6wpH+nJBD0C5WudFyqUYRkbF99L0YOd
        6tQXdtgHClMsdw2gC1OeoRQb76sB3g0zPdK2NOo=
X-Google-Smtp-Source: ABdhPJzpJNc4ywunqjpxHqIyYiZtlcopSADVlk26C5pLyTnMoLpV917/K1gC4gZediS+XfnYCxjmaSLuNoxHVpn28gA=
X-Received: by 2002:a17:902:d4cc:b0:167:735a:e796 with SMTP id
 o12-20020a170902d4cc00b00167735ae796mr32860819plg.5.1654945013680; Sat, 11
 Jun 2022 03:56:53 -0700 (PDT)
MIME-Version: 1.0
Sender: ekpem.and.sons@gmail.com
Received: by 2002:a17:90b:1d01:0:0:0:0 with HTTP; Sat, 11 Jun 2022 03:56:53
 -0700 (PDT)
From:   Jackie Grayson <jackiegrayson08@gmail.com>
Date:   Fri, 10 Jun 2022 22:56:53 -1200
X-Google-Sender-Auth: FQm8nNf887ao32Pb1L0zneP4DAU
Message-ID: <CAKA2oYs6z-aLKTrOZwFJo3d92sJV2MvtGe+tPO_TJSBqTcMVfw@mail.gmail.com>
Subject: Greethings my beloved
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.2 required=5.0 tests=ADVANCE_FEE_5_NEW_MONEY,
        BAYES_50,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        FREEMAIL_FROM,LOTS_OF_MONEY,MONEY_FRAUD_8,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_MONEY autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello my beloved,

  I sent this mail praying it will get to you in a good condition of
health, since I myself are in a very critical health condition in
which I sleep every night without knowing if I may be alive to see the
next day. I bring peace and love to you. It is by the grace of God, I
had no choice than to do what is lawful and right in the sight of God
for eternal life and in the sight of man, for witness of God=E2=80=99s merc=
y
and glory upon my life,I am Mrs,Jackie Grayson.a widow,I am suffering
from a long time brain tumor, It has defiled all forms of medical
treatment, and right now I have about a few months to leave, according
to medical experts.

   The situation has gotten complicated recently with my inability to
hear proper, am communicating with you with the help of the chief
nurse herein the hospital, from all indication my conditions is really
deteriorating and it is quite obvious that, according to my doctors
they have advised me that I may not live too long, Because this
illness has gotten to a very bad stage. I plead that you will not
expose or betray this trust and confidence that I am about to repose
on you for the mutual benefit of the orphans and the less privilege. I
have some funds I inherited from my late husband, the sum of
($11,500,000.00 Dollars).Having known my condition, I decided to
donate this fund to you believing that you will utilize it the way i
am going to instruct herein.

   I need you to assist me and reclaim this money and use it for
Charity works, for orphanages and gives justice and help to the poor,
needy and widows says The Lord." Jeremiah 22:15-16.=E2=80=9C and also build
schools for less privilege that will be named after my late husband if
possible and to promote the word of God and the effort that the house
of God is maintained. I do not want a situation where this money will
be used in an ungodly manner. That's why I'm taking this decision. I'm
not afraid of death, so I know where I'm going. I accept this decision
because I do not have any child who will inherit this money after I
die. Please I want your sincerely and urgent answer to know if you
will be able to execute this project for the glory of God, and I will
give you more information on how the fund will be transferred to your
bank account. May the grace, peace, love and the truth in the Word of
God be with you and all those that you love and care for.
I'm waiting for your immediate reply,
Faithfully.
Mrs,Jackie Grayson.
Writting From the hospital.
May God Bless you.
