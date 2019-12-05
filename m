Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 747551140DF
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:35:24 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729386AbfLEMfY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:35:24 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:34141 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729240AbfLEMfX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:35:23 -0500
Received: by mail-pf1-f196.google.com with SMTP id n13so1576942pff.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:35:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3MV6ixijKtdz/BNE8QwTu1lE6UeuoOENl5nhEzgclXE=;
        b=mhN/O5tZqPVmSE7zG/bp8TVicsJe39O5R7Y81dVC6lqNQn6pnBX4QYLeEgBylcCG+u
         RtfYNKRpSqjGitNqMOmBFXDmz9MHrunKr3pnBTg23I2eqa0UD/qvUYXhcKO5dOOz7QL2
         IMsqaRlQrXjYMf2+JLbqGNi/r9VmtlexnVu4ESg0S1URMOEd+rplZK7h0PsOgufBHDWC
         SsyakOjfMoe/apS1LzC4NbUbLPzWFV10n3c7DZVRsT/SIH/pMtQSjls9KzcI8OR5x4fI
         rZSYNSL7RpeLnNkcadTPqD5fvA+r6DLSDtxpA0lihMGG0m4lfW1gHnjYcmXd5gg7vV/c
         w6KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3MV6ixijKtdz/BNE8QwTu1lE6UeuoOENl5nhEzgclXE=;
        b=PaFjWFA91R3E0Zw9M3VDKIha57+VY7JhDHh7TKFr6Ql4lhhKxHaVKy+/fIU8Wfsi8b
         VzF2ufh1HttKSpjuANPyzDHz2uyeMsk8yHV3WEV8unN01aZBVU8Z/Eq/YVP4lL7uOpJe
         cc8lZ8HUBKGQmUIm8vPWhaAu48FET0DmqqeQUpNjFvLH2YTTr30+YY/f1LG0QdDfbZPl
         I0MCX1CfTO5UHhoY+B7wr1geYFa4FHom2LijHqxokE63C77nsXx4P8Wxk6Z78Ri2TAdB
         4eaH2nvXtVtsTFmFVXEE5a7+sFfIfK0/r/l3i+GqQ0CGaI9kkwmGJdojnNsiv6aznmvg
         dZ4Q==
X-Gm-Message-State: APjAAAVhYemKoTXWsXSK6fu7ap0738WmlpzkP+mJViSOs7mVU6QRBLsc
        RQFyBDQxXrLl3EU9jl1cgWkOG/6vtmhkDVM1hlM=
X-Google-Smtp-Source: APXvYqyE57HA5THIcgTbSYiWIb81GMRmlojd2r9SHTZtSUHnyUYAPR7rmhgdiaycVE0qYrlyRTdDMOdgbxp5VfRFtSE=
X-Received: by 2002:a62:1944:: with SMTP id 65mr8944925pfz.151.1575549323093;
 Thu, 05 Dec 2019 04:35:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <d92d9a30ce01b450857cee065317e6de0fb571d3.1575103866.git.matan@svgalib.org>
In-Reply-To: <d92d9a30ce01b450857cee065317e6de0fb571d3.1575103866.git.matan@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:35:13 +0200
Message-ID: <CAHp75VeydpMqCEP+f09rcUbBp1hdtk-9mubR9NNaS_8d0NkWrQ@mail.gmail.com>
Subject: Re: [PATCH V2 3/7] platform/x86: lg-laptop.c: Fix a bug in writing
 fan mode value
To:     Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Nov 30, 2019 at 10:53 AM Matan Ziv-Av <matan@svgalib.org> wrote:
>
> Simply write the desired value to the register. This seems to work,
> unlike the previous complex method.

Do you have by any chance a specification to this method?
I'm afraid that on some models it might not make it.

-- 
With Best Regards,
Andy Shevchenko
