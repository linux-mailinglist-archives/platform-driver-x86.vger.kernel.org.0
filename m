Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C1AF9676425
	for <lists+platform-driver-x86@lfdr.de>; Sat, 21 Jan 2023 07:21:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229523AbjAUGVW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 21 Jan 2023 01:21:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34132 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjAUGVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 21 Jan 2023 01:21:21 -0500
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com [IPv6:2a00:1450:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7FC67134D
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 22:21:20 -0800 (PST)
Received: by mail-wr1-x42a.google.com with SMTP id e3so6509126wru.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Jan 2023 22:21:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NK4DjyGQpMqw10x+mS5KkcoMyzskXFHKTg9WGMfZ5sk=;
        b=SlIXJPrQdsl8ftL0XvWTaeptlMLDvdkp5+x8rRtWgiY/OiMXFsoCugN6GWnjRIrHKm
         VSqVx6x8PVlJXZii196GS5LSHqycbTbu29R4Y7Kh7KH+UTBtLOV4cITYcOmFEF7o3pkD
         zbAmnHiEbpNxjuvxavu8KczhL0/1pMVIKrMqWpta/CqfJ9BZIi3yxqfV+ERif3eKd2xn
         FbK33yhd3W43JDzQ2oN6Ebn8SNUC/mhLTgZdi8EYPp7Li45t0LsMHzRuQ5oFkQARySq8
         pp6YC24au2wYcIiK1xL2s5Ri9/hS5Ih5I6mnkwxPsW3Fpp8CasR41lgiscCdGUC/4/1t
         gwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NK4DjyGQpMqw10x+mS5KkcoMyzskXFHKTg9WGMfZ5sk=;
        b=h12ygNWXm3Fg3dyf/9TPBnoFrpOl49h1Fi/v+3KobkHIeVJyq7vpUeDgU9W96f0T4a
         8ZWYbq1qo/E1iaOY5gn0GvuxgTlVpRElcNjeh/HERxdxR8GhGUnGv+syopweyzWc1Qow
         rwGYyZvQl7zp0t/FSqdFwbmvpxQktV+ajNMJjRsDG3XYf3KRnwyVyraO1rSJIjy1jAjL
         RPC0B0i0eY1FXOutvf5gok67yBVxIpa+jeSe50EblQIxBjVC165/RfI/JkiWVwOyEYnr
         3qPUwQzK8w9Okhm9/9QYzx7LWnEAY/5BYY5QlOhuI8U/ZgkeZPCkrNTiyZdBaec43E87
         9sWA==
X-Gm-Message-State: AFqh2kqDf51uck6VV+ydZJ29F43Wbcw3WitfqeSbJD0cAyVm5yrsLjan
        /O9cMV3Rd6KSKfEosti6NgWFxH07r+l7DQc/2ak=
X-Google-Smtp-Source: AMrXdXsEbbWBHbLnQJdDqyRKyQE+MPkGSljCT+OiQeRbKTd6uL8/osz8jgSuSQmM6N+CJqsAFylMQbzq+l60phj1tNs=
X-Received: by 2002:a5d:4b06:0:b0:2be:858:5d4c with SMTP id
 v6-20020a5d4b06000000b002be08585d4cmr444771wrq.88.1674282079273; Fri, 20 Jan
 2023 22:21:19 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:5948:0:0:0:0:0 with HTTP; Fri, 20 Jan 2023 22:21:18
 -0800 (PST)
Reply-To: charleswjacksonjr32@gmail.com
From:   Charles W Jackson Jr <umarharuna1050@gmail.com>
Date:   Fri, 20 Jan 2023 22:21:18 -0800
Message-ID: <CALc5pju1+Gtnpi_G_dN1W7dxVOVQPSjBvOwcVv1a5kHWC1ofYA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: Yes, score=7.7 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM,UNDISC_MONEY autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2a00:1450:4864:20:0:0:0:42a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [umarharuna1050[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [umarharuna1050[at]gmail.com]
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [charleswjacksonjr32[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.0 LOTS_OF_MONEY Huge... sums of money
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  0.0 MONEY_FREEMAIL_REPTO Lots of money from someone using free
        *      email?
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
        *  2.9 UNDISC_MONEY Undisclosed recipients + money/fraud signs
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
IHR E-MAIL-KONTO WURDE F=C3=9CR EINE SPENDE IN H=C3=96HE VON 3.500.000,00 U=
SD
F=C3=9CR CHARITY AUSGEW=C3=84HLT. BITTE KONTAKTIEREN SIE UNS F=C3=9CR WEITE=
RE
INFORMATIONEN.
