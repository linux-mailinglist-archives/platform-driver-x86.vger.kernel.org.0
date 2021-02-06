Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F31ED311E26
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Feb 2021 15:57:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230146AbhBFO4y (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 6 Feb 2021 09:56:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55688 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230104AbhBFO4v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 6 Feb 2021 09:56:51 -0500
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA2BC06174A
        for <platform-driver-x86@vger.kernel.org>; Sat,  6 Feb 2021 06:55:53 -0800 (PST)
Received: by mail-ej1-x635.google.com with SMTP id p20so17646957ejb.6
        for <platform-driver-x86@vger.kernel.org>; Sat, 06 Feb 2021 06:55:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=AR/QhrPQruWll6eXF7MZaSUhJJFfa6rBSyVIOpyZ2HPX2RoOBvbUAMof8f/CHjKckV
         pAaFVZoxGf/yyTyPFLfc1oYaqEKcbvnO4EuldJzhh8ESiAObihdB5wASPw8MGjs9rJ15
         5qJUSkFco5MeKyt3/fxM/lPljsbSjxVYoyitW13LVc+/OV9QDz1ttXK5hx49orPFFzqm
         +uqjBhxsMfO7dT/VvJLyTUNCzOjPyK0oTSpu99C9Y+OZ5Z3QwR4iTbhwB3S5ja13uiqx
         eo6dDFPExyJax7R7MKEm5bHfHEcKWsgwhk8QvFsLAtoYLcz8ViVjoy/yRvG+BkyRrYV1
         Pkxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=sY4fgq/DSyThalwU7QX+pWYKs/8sGH7ZznMUn5qQ1EY=;
        b=KHs7tOas4tS46CPpYxZjLppmT7pZSgtgmTTxiIwtNS00W2USQ5cNRGeZWPnDF+Jx03
         UQeKJSCqDdLleNkLEvsu8S3H5MA0eHxeJVv1PfVtT5ssa+1bLh031BlE3JiQEUYgfCBS
         +VaO1Hhxk8vbPHH1xWixGbfN4tADE1lS9IBxMm9qMzLAM9eKrCUkjnivCvRpUCICfB9b
         COT3N98FyG8TiF36UwzulAiLjjnVJAx+++0YMgAXwi8fVxwLUXEBhxkLhAmcacy78E9F
         GkSAnaKTuVykmHX6672vHSnPLEGWm3pb6uZr/ZtlG2OghBs9FmZC+spdcVTM365OvaPi
         C0Tg==
X-Gm-Message-State: AOAM530yV9trlN/7tdDfSXrwfk4wITDAabTZ5e88JxwI40uGBXqb85eP
        XqaPMiC0D2oNa/mcG8Iv+NeIsT5o16hZkaJAp4M=
X-Google-Smtp-Source: ABdhPJx37n8ny890wOvPLPmXJP8eHNacvPPOQ8GSuwAST0dU5XsxdHmzDpoMVVQgeGPzyxAMfHzhNKGJlKNXQkY/4T4=
X-Received: by 2002:a17:906:408b:: with SMTP id u11mr8882036ejj.299.1612623352562;
 Sat, 06 Feb 2021 06:55:52 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a17:906:25d0:0:0:0:0 with HTTP; Sat, 6 Feb 2021 06:55:51
 -0800 (PST)
Reply-To: lawyer.nba@gmail.com
From:   Barrister Daven Bango <stephennbada9@gmail.com>
Date:   Sat, 6 Feb 2021 15:55:51 +0100
Message-ID: <CAGSHw-BYzm1g5x=+4aJ7LJUVhK-8ZVgtmMKo7Wr-2YYP0tUObg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

--=20
Korisnik fonda =C4=8Destitanja, Va=C5=A1a sredstva za naknadu od 850.000,00
ameri=C4=8Dkih dolara odobrila je Me=C4=91unarodna monetarna organizacija (=
MMF)
u suradnji s (FBI) nakon mnogo istraga. =C4=8Cekamo da se obratimo za
dodatne informacije

Advokat: Daven Bango
Telefon: +22891667276
(URED MMF-a LOME TOGO)
