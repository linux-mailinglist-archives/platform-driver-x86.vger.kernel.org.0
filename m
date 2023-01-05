Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8B23165EFE4
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Jan 2023 16:23:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229713AbjAEPXW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Jan 2023 10:23:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234222AbjAEPW6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Jan 2023 10:22:58 -0500
Received: from mail-vk1-xa35.google.com (mail-vk1-xa35.google.com [IPv6:2607:f8b0:4864:20::a35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E5BA5D416
        for <platform-driver-x86@vger.kernel.org>; Thu,  5 Jan 2023 07:22:38 -0800 (PST)
Received: by mail-vk1-xa35.google.com with SMTP id w72so532760vkw.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Jan 2023 07:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FJYPIPbgrLqbUEgstYOfOz1W7/cTonzcVLLdfFZxjek=;
        b=JKNJhvFidsnh8BRdGh0+npXSnSFpoq9VCEcAj5q7euFwKspnKfFogoYpxfE+dbS48O
         Onl0yACtA4+szMguUT73nnD/lxQX5F1LwfK8aEdp/WgCDMb1laRaDEDqJwTcEvIu5c5A
         HO6D6gEXYhB4eJEGEp0AiY14GtcSObHMvvjTmaP8qp35IYaZGeLKC0rm9Itrf/x/dkVz
         JM3k/Ew+OD0fJHYpMqE5UHHT/oLLpvV5Kby30VTq7g187MJ0R6UQnBCn8q0lOmr/TBBQ
         I7FpNkoqMKKaHPzWfa8JCejcRxTb+SxpGYwEan7x2uCr97rTuQydGz3rqITvrAeq5rwr
         nCRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:to:subject:message-id:date:from:reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FJYPIPbgrLqbUEgstYOfOz1W7/cTonzcVLLdfFZxjek=;
        b=hmLFD+nYodbFmzjqe4jeNmPVbLgYu5hVyIytcQ0kn56GGgF2RgalcHcElxZt32NEYF
         tmm0eGQq58MwlmJfI2295FrHunXCKm7xVbLdpwUp4sPl183GKUlletT95DVOp0fAyAlk
         F1iwWVHPapR7WsX7BgCIdnYZZUwdlasa2ITTP5i7a4Z+nU14EjGU0jlp5+keGcFZvbLQ
         hHQ+3EFXcnX266HxCscblsJkwc44nYw55y8VaGMdUbg5PyNDzSS0z4v55JX8SoWGHJYv
         lirMPPwkD+5ulZ2kwUkNpkUeccL5WhudCkuvEeSwyj+PqAY8MqUWkoDQ9yVeWPSUmLaa
         Z47Q==
X-Gm-Message-State: AFqh2krxIiASSTC96iBCQYy+KmX8xrqEfNKtG7IeS2b+II0WXFRYjwY5
        HHd4KpMD7zAL5zvk1lVggw9hRjrY6JiK7ANV4qg=
X-Google-Smtp-Source: AMrXdXtRXQa8CWkpyAMQrByYuVWK8kR48Mn7wsLsiY4FWyUe0v+dZ3qGUtemynpHh3wQC7Pi8YHTNvF//XmbsimfWwM=
X-Received: by 2002:a1f:2016:0:b0:3d5:53d8:aa10 with SMTP id
 g22-20020a1f2016000000b003d553d8aa10mr4295778vkg.21.1672932157562; Thu, 05
 Jan 2023 07:22:37 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a59:b3cb:0:b0:382:a722:ce36 with HTTP; Thu, 5 Jan 2023
 07:22:37 -0800 (PST)
Reply-To: wongshiule@gmail.com
From:   Wong Shiu <sabinemary54@gmail.com>
Date:   Thu, 5 Jan 2023 17:22:37 +0200
Message-ID: <CAKnThVtQho_ooveY2su+i5U5B_fs6eumfu3XqaDTcie-9OW3wA@mail.gmail.com>
Subject: Guten Tag
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Guten Tag

Ich habe Ihre E-Mail-Adresse in der Google-Datenbank gefunden,

Ist Ihre E-Mail-Adresse noch g=C3=BCltig? Ich habe einen guten
Gesch=C3=A4ftsvorschlag f=C3=BCr Sie,

Bei Interesse kontaktieren Sie mich bitte f=C3=BCr weitere Informationen
unter: wongshiule@gmail.com

Wong Shiu
