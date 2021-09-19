Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 633A5410A1A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 Sep 2021 06:49:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231430AbhISEuw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 19 Sep 2021 00:50:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhISEuv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 Sep 2021 00:50:51 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 238ECC061574
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Sep 2021 21:49:27 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id p12-20020a17090adf8c00b0019c959bc795so4708604pjv.1
        for <platform-driver-x86@vger.kernel.org>; Sat, 18 Sep 2021 21:49:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=B3mNVASTgHaqt1c292FGdHauZR++Ifua1Qt5NnQe5eE=;
        b=ggY2HUBTwogJDr5zXCQ8ta1CEyferc4Duh/eepm3R6AiQaxJFEpAo0Ue9vnWQjyOcS
         oyuRyU/ZOecod8CxpBJo9XJdB5U+XtrHzGLWt5EsC+5jc7IIdfImIwulyrNiDEhBI1b8
         9I6O254ZYB0RTxIHGL3Yu5km291mS9Pr5xarNaA+RqYyQdMOEdSI5AlS3KBipGF3jdsR
         +zBOonOH2m+VrWa1Ysh1srGGMfEXMSHntfyAIXa4F0K2TxGKesuCn38CDaZ+IpmBnI2N
         7qeSEEwy5tsWrroHZSwyI9q2FCrD3Yybu0FKbzR86HEPI36ImHFDCTzpYotXPXOV7bDI
         oKqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=B3mNVASTgHaqt1c292FGdHauZR++Ifua1Qt5NnQe5eE=;
        b=UPOkLjak9IsvPyR87zSts8ii5BVDwx1DM+EZv4pMKtCLw8ccUX+SRcSA/6YEjhMcP3
         R1djEPYZj6UkTVrShUIwwG0vGCciWgKjvLG1nmucm6fiDlSttU76MbpTS6T+4bo1UPOr
         U9MOk0oOw5Q2pA5kqbaBh+on/VXYS0uY+u0HlXg2++iuU6mDhqphg2G644tJPnJ31wVg
         yA4xfpHOUWdDkxthU5eDRuGgrm+FIf/SrEU00qScDrXtrOCGKXKDHzh9zV4tQdq+2xPZ
         xUHgsnmhJFxT3wpWkswxWie4VB0Hp6h6+l0Is+Du7fRaRvXodCPsH2H1BFmdr+dxMVG5
         2VFw==
X-Gm-Message-State: AOAM533jV+uyy+d/lIRzW/Qux80S4C5T5PCkG5ivsREP7IuSvlGM5QcH
        Ymb48DGKCv1jwgndLqHZihf/QRBvR+95PD6YEwU=
X-Google-Smtp-Source: ABdhPJyDkOu3YQFZxS3Frh8Fl8o2RCPnHXXvXXjsirkkorqX/ehZ83XV0/xNPrxUNu4wjwyPV/+JbI7J5bsLQz4xGZk=
X-Received: by 2002:a17:902:bb16:b0:13c:a5e1:f0b5 with SMTP id
 im22-20020a170902bb1600b0013ca5e1f0b5mr13836491plb.35.1632026966595; Sat, 18
 Sep 2021 21:49:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a05:6a10:c7c5:0:0:0:0 with HTTP; Sat, 18 Sep 2021 21:49:26
 -0700 (PDT)
Reply-To: mr.luisfernando5050@gmail.com
From:   =?UTF-8?B?TXIuIEx1aXMgRmVybmFuZG/igJlz?= 
        <mrsnicolemarois999@gmail.com>
Date:   Sat, 18 Sep 2021 21:49:26 -0700
Message-ID: <CAPic1COkrrU5rqQ3BRTK1njVrJnub9VrAwrQNLDhBag=R52_fQ@mail.gmail.com>
Subject: GOOD DAY
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Je suis de M. Luis Fernando

Salut ami, je suis directeur de banque de l'UBA Bank Plc bf. Je
souhaite vous transf=C3=A9rer une somme abandonn=C3=A9e de 27,5 millions US=
D via
ATM VISA CARD. 50% sera pour vous. Aucun risque encouru. Contactez moi
pour plus de d=C3=A9tails. Veuillez me r=C3=A9pondre =C3=A0 mon adresse e-m=
ail
alternative (mr.luisfernando5050@gmail.com) M. Luis Fernando's
