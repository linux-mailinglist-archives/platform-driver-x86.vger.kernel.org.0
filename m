Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 62F7421A78D
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:09:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726269AbgGITJi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:09:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGITJi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:09:38 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B997C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:09:38 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id b9so1207969plx.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9AVYXB+fL2KSlLkvSlEHQgNHj705A6Th7A9ZnTaKnNY=;
        b=ZfntF137U7ew3h4djsW4RRs7NqwbevZ0FpJWgQ12wY9E57NpCujr6eF/ymrHyb11t9
         31mB58sBEgKGJyB4/jcLeSaGdal55XvP0Xub64JxKEI8D5qheJ4t7ypnf06ia2vhn3Fk
         hEsIz314QrhVcjjKEudqoyqAh+CWWpXOENeJYFE6T9GAWSEI42tzGrx0wn3C6tY+3Rho
         b7s2J18Hhf9TBN1PIzCfo+EzTUs5kpdHBmz0zficV6AnM+0ugBUxhjlvdug6KJrjaCZ1
         qxtUwSdbIHInrK9SW+HKHK1Zb2Dm1D9e845R/3vzfJpu5LcQLwFQBO+s4UyR51qV0i3b
         Zspg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9AVYXB+fL2KSlLkvSlEHQgNHj705A6Th7A9ZnTaKnNY=;
        b=qpSqptJYWT0x9WGIxrMbW6EXsB1wKkdGNwwJPCsR4yl0Ucyk5nzHlmzKHsv64sMXjB
         Zn5mShk1Q0DhgcOdkyUqtIVBSEE5tD7glCwzMhiMwuyShqbjyoIJO7KJ4vk9l1gxsqit
         iNugi20yRKKK6b4y1DBgn845C2ivOGwt3e48qkjGUBUb5GsaPrxbi9fxJ4wjoQjovu1i
         OfrovAaUA5TJOJv0vuaaAxtSoEAl5SY22qTF49NKoz3pS9ltljLn/W47J92KXCrrnHN5
         5nOXev9e27poY5SQSFkFkNoIAKJweervXLy4ngHA6OUzzD93j1uChdQzQlEFgn+1dMSd
         K7OQ==
X-Gm-Message-State: AOAM530KprCUsAIh2S2ndt41Sb8RQtS/q0iNzZI2N0ACtSFATxZgQF5B
        TPGjQAyX/bZCWkaaG/mfUo9PHuGauwGvdVrxOKzV6Pv8
X-Google-Smtp-Source: ABdhPJx/4gTLbzbTuZObXLgRb3p9gEtrkahXAlX5E049e7kBsQ9Ab8+Q9c1tSRb4cRH0QhKrcJ0MfQhU0IjS7P21t1E=
X-Received: by 2002:a17:902:8491:: with SMTP id c17mr47394433plo.262.1594321777861;
 Thu, 09 Jul 2020 12:09:37 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com> <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com>
In-Reply-To: <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:09:21 +0300
Message-ID: <CAHp75VfTE90aUkHYN0MEYKzBqKG7952nPUE6j+4u8U=20DFU6A@mail.gmail.com>
Subject: Re: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     Aaron Honeycutt <aaron@system76.com>
Cc:     Nick Shipp <git@segbrk.com>, Jeremy Soller <jeremy@system76.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 9:55 PM Aaron Honeycutt <aaron@system76.com> wrote:
>
> Andy,
>
> These changes have already been applied in this commit:
>
> https://github.com/pop-os/system76-acpi-dkms/commit/54ac52e611b60adc50e5f977e908c5547021e4a4

I'm not sure I understand. Nick sent them to the upstream kernel,
which is the right thing to do. You are pointing to some custom kernel
from somewhere. Since your signature tells about relation to the
vendor, can you clarify what you want for the maintenance? Should I
drop the driver from upstream?

>
> Aaron Honeycutt
> System76, Inc.
> Happiness Engineer
> 720-226-9269 x602
> aaron@system76.com



-- 
With Best Regards,
Andy Shevchenko
