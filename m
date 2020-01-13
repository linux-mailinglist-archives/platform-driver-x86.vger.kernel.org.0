Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EE25F1389E4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Jan 2020 04:47:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387417AbgAMDri (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 12 Jan 2020 22:47:38 -0500
Received: from mail-qk1-f195.google.com ([209.85.222.195]:34175 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387402AbgAMDrh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 12 Jan 2020 22:47:37 -0500
Received: by mail-qk1-f195.google.com with SMTP id j9so7376466qkk.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 12 Jan 2020 19:47:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PExcPvgc6/JC2Ar9r1T4zc/h/pcxxQjdKuFy6nmEZXA=;
        b=RNzqCJVXNNXnDMN6b2ESf+l0CbgcBiNVVqy/jcbHWp4q7ss6+YegoHwonWgZVonmJE
         xfxi80gDEphZex+Be31dwvw7XppRkdyV0BKleW0GJzFQwurx7CvVMjjGPuUF1nVebsA9
         NO1g94A6EmTb49KTIKSsx5OlZxw+D6aGe+fNUy9UhbWMx+SROFAHh/SfuVdZnPQ4u+QK
         op2q97Tv3KwEkrQ37cyrMWJupZvcD672iBNR8voCr6PmOOLuu2G2nUU2Zd3zDumFHzpA
         CbLlMm0BljoC+VQ0S9Ts+N1TNp0UEsWRWatnQmg7qHO4GyoffUjVD4H8BPVps1y7wAqA
         GhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PExcPvgc6/JC2Ar9r1T4zc/h/pcxxQjdKuFy6nmEZXA=;
        b=s02REJyTV/ZrXS51sjuVONvgvDKhZDBaDohx5Ate+kPNd+04w94OKY+Z9MZg9MoDgo
         j4ttXvMwYQNx8I2ICCVvIypvY4SXrwkGdCSAKt660AyopmG5FyrX49iSu5m+fJa8mdl1
         Q53UqQncFknzDkzjsjj+gokcPvgwaWB4Xu3uWfqNJV+Syy+5AwgbMtYpHfdLrJaKxwJF
         AQH+nYxO/ui1S8LnOpDbkznSSDpmMATwcr4bAfIjvyZX+8ZdPchcgDXgO4Op93EFRaoQ
         evkrlVHfDEdYl5YvXapq+hhkUWGH/CIZ/nuJZDj07IaoKYJPZdZBps7K7x8lfcwIu/cM
         24cA==
X-Gm-Message-State: APjAAAWmcC7FdwDbQNQbhEN9Raz79y+mbZw3RfqiYn+wbfBO0Krp13JF
        6/lr0dhqZncGYAwJy0tU/hdqWHeXgpTxUl4fHOrDVw==
X-Google-Smtp-Source: APXvYqwxW6CiHtKx7wgAErCRRHPqiIgBTAMd69XAKg2ZAirZnO7V/RhS3zO7gBXaEoC5wEj5wU+tEYpD5aTQgQa0ASs=
X-Received: by 2002:a37:9ec2:: with SMTP id h185mr14185032qke.14.1578887256821;
 Sun, 12 Jan 2020 19:47:36 -0800 (PST)
MIME-Version: 1.0
References: <20191230083044.11582-1-jian-hong@endlessm.com> <CAD8Lp45Le=s=1Q9oi0JCJTPepNmX002hK7W6UwKztTq09QBUgw@mail.gmail.com>
In-Reply-To: <CAD8Lp45Le=s=1Q9oi0JCJTPepNmX002hK7W6UwKztTq09QBUgw@mail.gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Mon, 13 Jan 2020 11:47:25 +0800
Message-ID: <CAD8Lp44Vd6Moi+UmbdZDsQx-e_CHoHbgtZHpf8sV_yuHwzRrBA@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix keyboard brightness cannot be
 set to 0
To:     Jian-Hong Pan <jian-hong@endlessm.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>,
        nweibley@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Dec 31, 2019 at 2:53 PM Daniel Drake <drake@endlessm.com> wrote:
> Here, writing 0x80 to turn off the keyboard LED will result in an
> additional WRAM(0x9f0, 0) call that was not there before. I think we
> should double check this detail.
>
> Let's see if we can borrow one of the affected models and double check
> this patch there before proceeding. I'll follow up internally.

Asus were unable to find a product sample with the affected behaviour.
They did provide us with one from the list I had made, but with a
newer BIOS version where that behaviour has been eliminated. They also
advised that always setting bit 7 is the way they do it on Windows. So
I don't think we have the opportunity for extra verification, but it
should be safe.

Reviewed-by: Daniel Drake <drake@endlessm.com>
