Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 514CDFFD4F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Nov 2019 04:23:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbfKRDXp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 17 Nov 2019 22:23:45 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:41218 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726266AbfKRDXo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Nov 2019 22:23:44 -0500
Received: by mail-qk1-f195.google.com with SMTP id m125so13202495qkd.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Nov 2019 19:23:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z/WWVtJiMHUrRDu47kJ1UrISL3WhpKZ+7R1m8ty1A4M=;
        b=xVzDLpTe30ifpZKIstj89kf608mwe33D7oh+AM0D8jmCBvsdc3XKDhdBt0mgdAhbc+
         /U54ACogQkHH2eGNpEaK+E83hB34scLPxk3s/T6SsH1RdlgnXhwRvFDGleslzQeR2ZsT
         PFkWX6UjBr73JvfAoUMI6ZbqETw3ChGLAZNK1ZaJbIXohUUhFX72eqkyTA8ehQq9MwID
         iAm0J8rY8HdpflMWYs+hZn94nEGz2J9dck2Q0yJgOGdzvo/DzK95sL+2jrL1ELB6Mm2Z
         9+92w1uppdmWv6m7/kMWARJRFlTX+9zNBbPSNYKPMAGloorZdIz1BG/BIIIUDKAachb5
         /wZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z/WWVtJiMHUrRDu47kJ1UrISL3WhpKZ+7R1m8ty1A4M=;
        b=C2lYmrRHd/c/OKO/wEX5JpwMZbONzuNnfLjEMUgLlyqRhtMaXGK6jzPekclrn7jjEz
         L/7iPQsGE+AcoBVJd8N9K/oHyPz5Sh7fH8cW1QVxjadHq6hpmQ+l4Bm8qfwDIXfIu4wx
         KZDqj4LO2kKC+q28510CC/KYh1kAQUOXOYhYxoCcQkB3IjOR9yxym9DxiaD5lsD5BDVQ
         GGDGFii+0eUd0crCg3Y99RXJ2ouh7OomYvxX+jxA8jOxlhqEXhQ1vRI5QyrBcwvymKA2
         /4CBZ3hsPvyf2gExbrO3sbMMud3Fd7UYcPisgc4JC9fpVSiOQcp73L4mF2Oun7Ilbcbw
         X6jA==
X-Gm-Message-State: APjAAAUUdj6yghsHUoXgBo++c4L6TtvMPonQKQ3DSaN0CR4TX39N1v0B
        Mlqonw1grnY3si+0e7ldW9zSoGZEh+F8aWXgmZDtPlG/evmQXw==
X-Google-Smtp-Source: APXvYqxavYdgZDzCU3SkD+tXQK6wOU0KmNcr0ZNhN+PD+7FZ5HbApP+ux3kn4eUQ4wmdtbLwX9IqDXsPQy6K2cY4Nhs=
X-Received: by 2002:a05:620a:12c3:: with SMTP id e3mr22273021qkl.14.1574047421962;
 Sun, 17 Nov 2019 19:23:41 -0800 (PST)
MIME-Version: 1.0
References: <CAPW-Pu0KuxqbKSQ2JQaxh5AHbdZdNQZJfOgxoe_XZSxow+9e3A@mail.gmail.com>
 <CAPW-Pu2g3yiD8H5yUhAsCCN0vMzojoQ6QOn+4iOKCzHizE4T4A@mail.gmail.com>
In-Reply-To: <CAPW-Pu2g3yiD8H5yUhAsCCN0vMzojoQ6QOn+4iOKCzHizE4T4A@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Mon, 18 Nov 2019 11:23:31 +0800
Message-ID: <CAD8Lp46Sx004FiZm+1Lus_KBafCAvP5tdnRpE+NEkoEMWNz+jg@mail.gmail.com>
Subject: Re: [RFC PATCH 2/3] platform/x86: asus_wmi: Support fan boost mode on FX505DY/FX705DY
To:     Leon Maxx <leonmaxx@gmail.com>
Cc:     Linux Kernel <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Nov 4, 2019 at 6:55 PM Leon Maxx <leonmaxx@gmail.com> wrote:
>
> On ASUS FX505DY/FX705DY laptops fan boost mode is same as in other
> TUF laptop models but have different ACPI device ID and different key
> code.

In the spec (which is not publically available, sorry), this
0x00120075 device is described as "Throttle thermal policy" which
takes values 0 for default, 1 for overboost, 2 for silent.

I don't know exactly how this differs from "fan boost" but I suggest
mirroring the spec here, offer this as a separate sysfs control named
according to the spec, separate it from fan boost mode.

Thanks,
Daniel
