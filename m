Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1D8774C1D6D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Feb 2022 22:00:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242066AbiBWVAu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Feb 2022 16:00:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37584 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242050AbiBWVAu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Feb 2022 16:00:50 -0500
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AB2A4D257
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 13:00:22 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id r13so19661ejd.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Feb 2022 13:00:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=UEuPurABFKaRoRO93O0mSwlV86r7QXQpoBqrdQ4MI4E=;
        b=kBWw2tSOM/LQgaTbZ7MIAZ5j15aw/y8+TqwuVpBuA01qu+o5akScljOCi514Mh2z//
         lWBcYBYR/8PNdAnwt8UCitOOL3pTb/Q7HZD5hCwBPolH9hTy4WBm4PjCSaVKzg2yf+TM
         /AMZhiBhbbMiU7A7m8PHZnJKDyDY4dOQX9R5FIRHQTR9nPrd8lXI+WGqp4jgQBLmiiUn
         bAAya1XEB8AbIZuNKT8BF/j7z3S5vtJRks2Nzh3D1aebFOPYfVB/z8DO00LXcMDQhnxO
         WzT9vyQazXT1tQ58UWQpGbBjpEqZSKZE63eMJN1atiVMDRGS7TFloo8WnYTt+nNuAZ3D
         MZVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=UEuPurABFKaRoRO93O0mSwlV86r7QXQpoBqrdQ4MI4E=;
        b=wfag7Id/0tSsXGInz8Csxwwx8Le8j9ieXoJfHNVVAXefODWBi7h3mxmvySIl6A69y3
         A2Kta2ktSPKxcT0Td5T6RwKHBdksBF2907wslflWka3nbJPYecinKKtUZsYUZj/9NFII
         Yk0kmsIDvYICnt+iCrYR6TQuiNia6EUFG8Vj9eL/zkp44kDy9t9UKe/VgyUi8VCmjBDW
         1nup+2NmbSrdzatkq8geTFcNzJTkwxzlBznU1FBEzN1LpGOvxQ7EhVeD6P8Sm5voIdQu
         pdg05c5yvDMS4OMi9pXSat5avsmZauRxgD2Zlcp5S/k9YqmGytg2Itj+4RpJmyu9EtuI
         wMkQ==
X-Gm-Message-State: AOAM530rBJm2PwTAHpAVdAZS73XOzuXm0evDCmk8TKhUo6NYggIiJJo4
        Zhj36e+70E0EDOTMb9hQ/OL4XtIi0D00FwPe9Ww=
X-Google-Smtp-Source: ABdhPJy1MD2v2hkx2SozXy2fwJbxtbeyPiHwFr4d9ugg9ZXUQM9S8JzUq/AC3MEIzi/oHwJpZgF5BIMwPVmmlh/pVEs=
X-Received: by 2002:a17:906:3a4f:b0:6cf:86e0:586c with SMTP id
 a15-20020a1709063a4f00b006cf86e0586cmr1149195ejf.626.1645650020840; Wed, 23
 Feb 2022 13:00:20 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:ab4:9988:0:0:0:0:0 with HTTP; Wed, 23 Feb 2022 13:00:20
 -0800 (PST)
Reply-To: db.bankdirecttg@gmail.com
From:   "db.bankdirecttg@gmail.com" <jpaulesqqc@gmail.com>
Date:   Wed, 23 Feb 2022 21:00:20 +0000
Message-ID: <CABzOjNddyQbhOykmWXqT6waSMSMLbiMS9J2t_6oCoJ_X9YXrzA@mail.gmail.com>
Subject: Hello
To:     db.bankdirecttg@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        LOTS_OF_MONEY,MONEY_FREEMAIL_REPTO,NAME_EMAIL_DIFF,PDS_TO_EQ_FROM_NAME,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: *
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
 Irod=C3=A1nk el=C3=A9rhet=C5=91s=C3=A9ge: 2554 Road Of Kpalime Face Pharma=
cy Bet, Lome, Gulf.

Ez a WU bank igazgat=C3=B3ja =C3=A9rtes=C3=ADti =C3=96nt arr=C3=B3l, hogy a=
 Nemzetk=C3=B6zi
Valutaalap (IMF) 850 000,00 USD k=C3=A1rt=C3=A9r=C3=ADt=C3=A9st fizet =C3=
=96nnek, mert
megtal=C3=A1lta az =C3=96n e-mail c=C3=ADm=C3=A9t a csal=C3=A1s =C3=A1ldoza=
tainak list=C3=A1j=C3=A1n. Hajland=C3=B3
vagy venni ezt az alapot vagy sem?

S=C3=BCrg=C5=91sen v=C3=A1rjuk a h=C3=ADrt.

Tisztelettel
  Tony Albert
  BANKIGAZGAT=C3=93
L=C3=A9pjen kapcsolatba a Whatsappal, +22892905783
