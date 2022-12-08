Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 07EFE646CA5
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Dec 2022 11:23:11 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbiLHKXJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Dec 2022 05:23:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229813AbiLHKW7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Dec 2022 05:22:59 -0500
Received: from mail-qv1-xf43.google.com (mail-qv1-xf43.google.com [IPv6:2607:f8b0:4864:20::f43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82A3754769
        for <platform-driver-x86@vger.kernel.org>; Thu,  8 Dec 2022 02:22:57 -0800 (PST)
Received: by mail-qv1-xf43.google.com with SMTP id o12so663291qvn.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 08 Dec 2022 02:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=BSDkslC/jbwW0F/p7HUhNsoaw+AorqjuGrORPHHcLxl0G1Mqy6O070AxVxk02H1T1x
         /ahxfpJSw8mjEseQxNQRB2cr/utCSQHcq2AvGEv0AeydQXcuUGuV3Wcivm6rtJfEYs8F
         Zc05NpgZCKbLvNclE7a46qfJFDd1Iaejsvq4MJtm6lAlHBPJi65iFSTLvO7wsUAQslo7
         Ofrr0iic5QfZ02frr3tByqVe1o+Goo+chSlqRv0RV4rUxbX6b6sQmLSPMUZVImel+QO2
         HaGP8ADyx3pIvTTfZejg5VMPC2LfUBQQT54VMWE+4oA6wDuVRlM5dz5XUA2GRUZChky3
         vohw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=O4WPtqOs6pYDke8VCfpzwsIX+8zN33o8tLS2XMy/lFU=;
        b=XS+aNMgaERzzP0UyyvVKeWMHbOVT62Y3g6sd4QGSwXSVvWkobr0ekJVyvkp9e5ffGA
         d2tIwQWevvap96nbHgkBL/UEZJo90MXLI678t9hRzUY5BygnbvzjEqJp+O+c3YCiJTAZ
         BDm8iQV2QmtJkjLCmnHLpWNtU9gc4Xdhc7NcnLZxJ0+Hzb1uK3sYoK7PGReIyPTIDNnI
         m8U22EVaQxChQgk4TbAdMFVDGTZgS+wXdhF8ZdK2ZDcnXX/FMltET8aeoQfLRdP8iQAk
         ZAApwgLH6/TeS6dny/tRMIqLMO0rxceDqN/18DdVM2RJ7t/GzMsf+r8/1xANgshga766
         /pVw==
X-Gm-Message-State: ANoB5pn2ArVpt/ev9pXAXfcJVSbbr/I2L7uJUtnY2CFOQy4oxN0xJOdL
        VjxFgQ8MLSjxIvdFk+ZQ1LqeGrJ+TfFIBViWFeE=
X-Google-Smtp-Source: AA0mqf5yUfTHBuhJ48b7WyuMqvJxtVvD5ZcFTkwazS3yVSGF54evcLEoLuQnxPNgkS4D7Kh/Plh/Zcyr/FYlLDODaVM=
X-Received: by 2002:ad4:48d3:0:b0:4c7:7770:e8e1 with SMTP id
 v19-20020ad448d3000000b004c77770e8e1mr11068310qvx.95.1670494976709; Thu, 08
 Dec 2022 02:22:56 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:620a:45a0:0:0:0:0 with HTTP; Thu, 8 Dec 2022 02:22:56
 -0800 (PST)
Reply-To: plml47@hotmail.com
From:   Philip Manul <barrgabgom113@gmail.com>
Date:   Thu, 8 Dec 2022 02:22:56 -0800
Message-ID: <CAMVQsDT0DKBV6=qDCZTUCRi44jUBwP7T7c2qzxMkmcCCF5L7HA@mail.gmail.com>
Subject: RV:
To:     in <in@proposal.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=2.1 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,FREEMAIL_REPLYTO_END_DIGIT,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Guten tag,
Mein Name ist Philip Manul. Ich bin von Beruf Rechtsanwalt. Ich habe
einen verstorbenen Kunden, der zuf=C3=A4llig denselben Namen mit Ihnen
teilt. Ich habe alle Papierdokumente in meinem Besitz. Ihr Verwandter,
mein verstorbener Kunde, hat hier in meinem Land einen nicht
beanspruchten Fonds zur=C3=BCckgelassen. Ich warte auf Ihre Antwort zum
Verfahren.
Philip Manul.
