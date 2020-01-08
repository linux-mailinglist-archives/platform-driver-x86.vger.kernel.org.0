Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B10C91341A2
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jan 2020 13:27:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727862AbgAHM1r (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jan 2020 07:27:47 -0500
Received: from mail-pl1-f177.google.com ([209.85.214.177]:45104 "EHLO
        mail-pl1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727795AbgAHM1r (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jan 2020 07:27:47 -0500
Received: by mail-pl1-f177.google.com with SMTP id b22so1055363pls.12
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jan 2020 04:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bME96XZCBZ5wB08lo5DwU+ZW3cZyrABuDgMkFAQPgiw=;
        b=YlAuYXwvRH/VW5pBvVYS/cU1jELvfsvW3vnzL9AikvkggE+kQ9YsUYKSGi8F4t/vXP
         jKYJEsntcCaMxC/8XTaQYT8y+emXIfodtgQ73vudRu82XFrSWtwFywp1+kB4XsxCQjh5
         Wylf6B2IPISTjta53JYKTAYzRJIG7F1VGzdWMNoFMtW8l48l7XUP2/UPRkObq/z4KD5k
         H7SKffkcoLpRgvl6o0y356JEZ9B8+JRDSPoJmRu6RrjH9Dh2P7wRb1ZxpqgtpgodcLaT
         nprYLx2giTk4Q/B+L6qhbi51RsBmIwI0LDnxlBZJ4OsDXoc3aBG9RWQoxqwlFO7HTBl4
         M9fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bME96XZCBZ5wB08lo5DwU+ZW3cZyrABuDgMkFAQPgiw=;
        b=RSfgQ5YZ4X/cY16cjRuXYxDqAOMDOfAG5/if3rSTAcmVvFwIfXrCdbRyscU9Ye3uRD
         RUpAVk4YQWNMQzbI8jGJ+4G61eobKCnJPwVQZnNaleBjIlSyOZnP+2zjryjs01SvVREd
         1IMv834Ba+u5yPCKW7moRK1h4ujeG67vGf30NlUuBVA6biYnQldCYWYgus8r3vqqiMss
         s7CZcvkkVIIYduASYwnW5nSOdwarTmEndsdLcwmaBI9GIsPL/6wv1vuXpnCg0POY+iJM
         xF+A3jiXeJlDzHaOPqZHHOtzzfgG1VEZQZ5pYQlL5oyV24ZXFcLbSKnkOY1Mjen1FwTT
         OFlA==
X-Gm-Message-State: APjAAAX+h59JdLdh4frWkwvDgiaxizfOyyt+S2f0QBg97ghqYUYNs7w7
        US+NXf/tfEBQdzbdlsfnq0IvepF+HOYAOdNydP0SriY5LK0=
X-Google-Smtp-Source: APXvYqzBS1ESHOEQvqGf/rct4EeHp6S62psVzF+Imc8RadHsb0vCPh2HDwzLimTbEjuGkKBWXAotVHCulsLqioAGmv0=
X-Received: by 2002:a17:902:8d96:: with SMTP id v22mr4992712plo.262.1578486466783;
 Wed, 08 Jan 2020 04:27:46 -0800 (PST)
MIME-Version: 1.0
References: <20191224140931.GA5947@local.marc.ngoe.de>
In-Reply-To: <20191224140931.GA5947@local.marc.ngoe.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 Jan 2020 14:27:38 +0200
Message-ID: <CAHp75VfWOjcVgWouTnTdqFF_+Ypzp-y9FF2Sd1msfGC9pEuPgA@mail.gmail.com>
Subject: Re: Regarding "Add Second Fan Support for Thinkpad P50"]
To:     Marc Burkhardt <marc@marc.ngoe.de>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 24, 2019 at 4:16 PM Marc Burkhardt <marc@marc.ngoe.de> wrote:
>
> Sorry, missed to CC this list.

Not only this, but all stakeholders.
Can you resend with all involved people being Cc'ed?


-- 
With Best Regards,
Andy Shevchenko
