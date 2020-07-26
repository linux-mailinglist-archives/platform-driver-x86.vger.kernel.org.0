Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8502122E12C
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 18:20:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgGZQUh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 12:20:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726044AbgGZQUh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 12:20:37 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47DE9C0619D2
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2020 09:20:37 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id z5so8063349pgb.6
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jul 2020 09:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/JdGATcy2bddW5Gv8ltkI4JjL9sXZIkF4OUBbnjeJN0=;
        b=V5c7w0VbL6wO1Myq1skQeDNQDk/tWHKSv4iOd+IoFZGQlQwbG/cFVfHJubMqDbPesc
         GaPNFak87HawZlSSyWdYL6SIU3f9QgO+tYB7wnEtLTgEZnBVK4+ej9j1ILzO7WL3XTcz
         tz+OHVQDoxIlk8fXTZaizKwvObCLHaQ+3y7W8kzAj//St9YGOtYkY389kyz6JZqxAJRy
         X8bS2dtK6+mkrDNUXuSfeC0hzBuNjG8HJo52e3qYGPbxIr3RJ2xd/R/9X9eOcB2M9P8u
         Vr+sZIw6DbV4OPDc/3F6uTygJHKNrrFD4UdDij1B0RUhVuQoY1XU3s5TXgYvFo8VZUaT
         3YsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/JdGATcy2bddW5Gv8ltkI4JjL9sXZIkF4OUBbnjeJN0=;
        b=FwD2tKR52rSEl1xeOLr35tFhBBvT7OJ2x26rovUzyF2bk4wruMXCrulqkrMJ5Sq5Ue
         +EfgmPSA3EL5CHySMySz0iaqrkylqmqfCSFyBclylg4IEvQ6XMvNGB796UDdtvH/nx43
         Utwh9lIhHlCpGYA76KhPBa9RHCvWilriIegL5iezBENsYo25oVcF+qSC2grdRw/+nlqt
         r/JwwFUZnBo1uDajJldDSEJAJRNHQyDQAttHUOrES7iVOyFVohq7xCfcJY8j/8RHQhRg
         /fme3E7mfOv0/Qk6Nn1wpft8EaS2aCnYd7mvDyiltspr5W9fiaZ8nuyCXwmhcXoVbIvr
         fnlQ==
X-Gm-Message-State: AOAM532n2vxWYwz6/lCyr0H2NNsG9DseyYSeCAANtxxLm6Z8856bGAkX
        n/4q793G3HQ7Onl512ujTxAw8k6+iH+SipcIwOyftB+NVAk=
X-Google-Smtp-Source: ABdhPJya9UScU7BjpeWevcMvzfh6sl4ZLbbNo31BldLIWqcXMR1Hue60wkd0Slr3/P9LG+s8AozmhNkYSqI9Cr2tcjY=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr16722743pgi.203.1595780436668;
 Sun, 26 Jul 2020 09:20:36 -0700 (PDT)
MIME-Version: 1.0
References: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com>
In-Reply-To: <yd2bCHtPzC6enuHPlu9VQ2IpJwlZ6PLFS9argTrXd_gCiRqahT4_1tKWfXHiKNOBHiwwMkTXo8z27oUGWZMEkPx-2ZwVW95Ctmu3QkM8T5U=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 26 Jul 2020 19:20:20 +0300
Message-ID: <CAHp75VdfNzYLB0jXUk25Hdaf5g2VHGPPjGo2c5vRc7yQ8o7T0A@mail.gmail.com>
Subject: Re: platform/x86: status of thinkpad_acpi patch from January
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 26, 2020 at 6:45 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:
>
> Hello Andy,
>
> please excuse me that I am writing to you personally.
>
> A patch series[1] has been submitted to the platform-driver-x86 list befo=
re I subscribed to that list, so I cannot react to it in the form of a repl=
y,

JFYI: patchwork allows you to download messages in mbox format which
most of MUA allows to use and reply to.
I'm Cc'ing this to a mailing list.

> so I resorted to writing to you personally, since you were the last (and =
only) person to react to that series.
>
> Patchwork shows its state as "Changes requested", but I don't see any com=
ments on v3 of the series. Can you please take a look and explain what need=
s to be done for it to be merged?

As pointed out during v2 review [2] the work is needed to be done, i.e.

"Don't forget to update any documentation if needed."

So I'm waiting for either v4 with documentation update, or a comment
explaining why it's not needed (however, I don't believe we shouldn't
update it, b/c at least we shall mark the old interface obsolete and
give people reference to a new (standard) one).
Sorry if it wasn't clear.

In any case it requires v4 for the matter of rebase to the latest code base=
.

> [1]: https://patchwork.kernel.org/cover/11362557/

[2]: https://patchwork.kernel.org/patch/11359999/

--=20
With Best Regards,
Andy Shevchenko
