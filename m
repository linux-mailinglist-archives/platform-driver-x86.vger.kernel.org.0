Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0033565D3EB
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Jan 2023 14:14:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230186AbjADNNv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 4 Jan 2023 08:13:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239422AbjADNNE (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Jan 2023 08:13:04 -0500
Received: from mail-yw1-x112a.google.com (mail-yw1-x112a.google.com [IPv6:2607:f8b0:4864:20::112a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A8A33AA81
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 Jan 2023 05:10:37 -0800 (PST)
Received: by mail-yw1-x112a.google.com with SMTP id 00721157ae682-4b6255ce5baso30158787b3.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 Jan 2023 05:10:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=PTjX/3ENcR1VjHdjWT2IDeJZU1DoGoCUF+4bIAmicnNSkyoS+qkI+5gQhBIJ9EmjoQ
         +aBmZI+bTO9FBnvB3vtZduj0xyaVWnLbMAs5ld41QhLSriL/JEyizGe26/nb4qIWZ1UK
         9NhxAavfXOLjz3M5oFCD8TPCoyK/aRPvxmgKepkzeHzmck5LJW6MGlc1p3cOivfER3tY
         Oy8278Mpnp4idopSIGqzabf56hBcFVW0bXNSItPLESzA98ifwFpnO4rrKn/6wdMjgaKT
         atWytUX0Rq4Z9Iac2mnNB4IpFb5j4hbUlB6c8TlEWTsjI2V8CuojGwRNzzl6+Pcu1pxM
         TF4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=acP1nTqZNQBYLqSyI/lESL0/RApC0I5T7WS1ZnhARFQRTU7OCfQPEoJshTjXY+1B5V
         qxfpBr6Xs+8thlH+oMxcX7JKiVRezOy5jOE7R0mYGNtiDv0PEFqM9sakNKlRR9OdJi86
         wYGkBYlucCDIPUFmc+h+2VPs5+Jf4mR5csRe+P6pG+G1c87iOrmJlroVRP6GYsTIIYDs
         10GxLVp0nRWsy2hLB16ueUZM6pwTMZ+UsEx0UiVZIiHFsuEzgleFUOmZ0kIS/MGw4pu/
         UEgsalKL0YK5S3UOeM5+R3FC2MKPcsmRenFNWAEq6z4FPVIYVRraKntugNb83jE5KPMn
         oz+Q==
X-Gm-Message-State: AFqh2kqXT9dYiYF8qtPviJrOgpPJp0d7sLL4suPmcdlpv72y92i2SEdT
        9cHMHsdxlFCWzlUMsfyv8q6+fi7ZQlTYCIraRDU=
X-Google-Smtp-Source: AMrXdXspWNNnGA7+/uvM/+2qqtWGErUjpRm13+0uaWXPmw//I/AiCl1V1xyJ6pVXatgzXIcAqgqmTvdOJ8TEHjDLDuw=
X-Received: by 2002:a05:690c:c02:b0:48d:1334:6e38 with SMTP id
 cl2-20020a05690c0c0200b0048d13346e38mr2865937ywb.316.1672837836316; Wed, 04
 Jan 2023 05:10:36 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:7000:77c4:b0:40c:29b2:2ce2 with HTTP; Wed, 4 Jan 2023
 05:10:35 -0800 (PST)
Reply-To: Gregdenzell9@gmail.com
From:   Greg Denzell <free2367@gmail.com>
Date:   Wed, 4 Jan 2023 13:10:35 +0000
Message-ID: <CAOwyN5ePkBKUfHqNRndKD81a=TWdFVoL0rBTpX-8=Rf8MMyD9Q@mail.gmail.com>
Subject: Seasons Greetings! This will remind you again that I have not yet
 received your reply to my last message to you.
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: Yes, score=7.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,EMPTY_MESSAGE,
        FREEMAIL_ENVFROM_END_DIGIT,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
        *      https://www.dnswl.org/, no trust
        *      [2607:f8b0:4864:20:0:0:0:112a listed in]
        [list.dnswl.org]
        *  0.8 BAYES_50 BODY: Bayes spam probability is 40 to 60%
        *      [score: 0.5000]
        *  0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
        *       in digit
        *      [free2367[at]gmail.com]
        * -0.0 SPF_PASS SPF: sender matches SPF record
        *  0.0 SPF_HELO_NONE SPF: HELO does not publish an SPF Record
        *  0.2 FREEMAIL_REPLYTO_END_DIGIT Reply-To freemail username ends in
        *      digit
        *      [gregdenzell9[at]gmail.com]
        *  0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
        *      provider
        *      [free2367[at]gmail.com]
        * -0.1 DKIM_VALID_EF Message has a valid DKIM or DK signature from
        *      envelope-from domain
        * -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
        * -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
        *      author's domain
        *  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
        *       valid
        *  2.3 EMPTY_MESSAGE Message appears to have no textual parts
        *  2.7 UNDISC_FREEM Undisclosed recipients + freemail reply-to
        *  1.0 FREEMAIL_REPLYTO Reply-To/From or Reply-To/body contain
        *      different freemails
X-Spam-Level: *******
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


