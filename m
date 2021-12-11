Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 60381471364
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Dec 2021 11:46:29 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230371AbhLKKq2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Dec 2021 05:46:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49334 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230347AbhLKKq1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Dec 2021 05:46:27 -0500
Received: from mail-qv1-xf32.google.com (mail-qv1-xf32.google.com [IPv6:2607:f8b0:4864:20::f32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FB23C061714
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 02:46:27 -0800 (PST)
Received: by mail-qv1-xf32.google.com with SMTP id kl8so10228335qvb.3
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Dec 2021 02:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:sender:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=9Pm1ZZNqNR51f3pcy0p7ZDjptiZvuuOtgQluWaY6SaQ=;
        b=DYm6zKx22I0KOLhK+PXAlq+VIGlqG4dngZ/yiXyRLzFkfqNajlHOoWNRMPUVtnITsw
         L+JU522H6k55k/4E1jjH3CCk4VVMud3b7kUqYXl0puoVbXijyw0tEdHtLOf9W5op5ZpW
         zYfPWNiSLtHjRlWT1wjjLopo7GUlEtKyVTj7foo0NStnHve4LNOSG7dyvr/nJAZCob5H
         zMLA/ZVMG88Bg9RymyfpcOI1hPhvFfrYZBAHbJkNMetbG59kwBoWwpM6OqYYNzbNBLNc
         hKVM1ILi4TPQL2AZoNnTsCPLAjgPxo4x8Bmdj0DQY2nM2bDT3ArPplGxbgFfvHedNNwJ
         80GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:sender:from:date
         :message-id:subject:to:content-transfer-encoding;
        bh=9Pm1ZZNqNR51f3pcy0p7ZDjptiZvuuOtgQluWaY6SaQ=;
        b=QjVwzC6fD/I1/MXLveLOkTzABEDSahqRl9kPbw58TTVDotdWkakpxH3FaP1MuiRI4z
         J7jgjl4/bmPc0xs+AQwSHwUklVz+QvwjX81bGH8jFe+jkblN879qa402V/XhoeykrHt/
         NP1FnF+3PvbjRxgO35VdMq0WvuHHmlRpy+Ks9Xa6LYRNyM1fzQ6KeWK5Yv0cny/WSxzk
         x4BvhfDKYxdcLUCnEyd5hMw6fTDPYusKJkccOo7FRahRr7otw4EcQNwjzY2l1XXu3ZDm
         y2YxOsNy8DWzewVW3tXd7rMIYIcn8cfMoOD49oSwkL/Qj+N0lfOFJAOvcr1mc0Yc0kou
         xrHQ==
X-Gm-Message-State: AOAM5323HFjhP6EcEMfa0z8WHXx7PkC78P3JLyuoSDA/4eWjsITb9/33
        d70BMOoA9p28CRSOqNqnGzD8y9HNxLwtHkiaVoc=
X-Google-Smtp-Source: ABdhPJynQBeUhqoVf4lSbTFCKVrVtpb8/a5UbxfyA8GvlzDKjRkRFl0j4GGWj3A10SlFtITIyyF0qY7dtFSUQ3SY+Wk=
X-Received: by 2002:a05:6214:c42:: with SMTP id r2mr31736930qvj.53.1639219586435;
 Sat, 11 Dec 2021 02:46:26 -0800 (PST)
MIME-Version: 1.0
Reply-To: martinafrancis022@gmail.com
Sender: maiduguibrahim2@gmail.com
Received: by 2002:a05:620a:46a3:0:0:0:0 with HTTP; Sat, 11 Dec 2021 02:46:25
 -0800 (PST)
From:   Martina Francis <martinafrancis61@gmail.com>
Date:   Sat, 11 Dec 2021 02:46:25 -0800
X-Google-Sender-Auth: X14aUbkblgKbKh0Vgat8WZaXXcw
Message-ID: <CABPG0o_DNcKT-BOoLouVtAm7J1X9eQdSSTNbLQpc=n0P6eP85g@mail.gmail.com>
Subject: Bom Dia meu querido
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Bom Dia meu querido
Como voc=C3=AA est=C3=A1 e sua fam=C3=ADlia.
Meu nome =C3=A9 Sra. Martina Francis, uma vi=C3=BAva doente. Estou entrando=
 em
contato para que voc=C3=AA saiba meu desejo de doar a soma de ($
2.700.000,00 MILH=C3=95ES de d=C3=B3lares) que herdei de meu falecido marid=
o
para caridade. Atualmente o fundo ainda est=C3=A1 no banco. Tenho uma
doen=C3=A7a grave de c=C3=A2ncer e minha vida n=C3=A3o est=C3=A1 mais garan=
tida, por isso
tomo essa decis=C3=A3o.

Eu quero que voc=C3=AA fa=C3=A7a uso deste fundo para os pobres, crian=C3=
=A7as
maltratadas, menos privilegiados, igrejas, orfanatos e vi=C3=BAvas
sofredoras na sociedade.

Por favor, volte para mim imediatamente ap=C3=B3s ler esta mensagem para
obter mais detalhes sobre esta agenda humanit=C3=A1ria.

Deus te aben=C3=A7oe enquanto espero sua resposta.


Sra. Martina Francis.
