Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 579E521B4E4
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 14:21:00 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726908AbgGJMU7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 08:20:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726774AbgGJMU7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 08:20:59 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 00779C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 05:20:58 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id 1so2465229pfn.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 05:20:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CTBlbIbJuXZzM/fT0KgwCGp0qaQ8YE6cwnWgRYPo0ks=;
        b=rSmExF17TiQ8MXbmzxV7x4G/bZG9b+GqexM1KxTZGCcTTOrAvBys1cnboz1sx+c35e
         3XPCBIky1q3TuLVKZKmsi/PuKAVBHnOBR6pIkjWfMLfr+cghuwgJgwfSf8Of65zCvTMW
         fdt53J7ZS15ydhgK9nfSEN/0/K5mKlV6Z0SnyodSEdwuZM3iT6rdkspjk+1APW+cSKyh
         JyE2xv4aANOhgxHQEIGZP5OfXbwSoHR6Zm2M9XJRelTFWUCoLFB3Qqw6bJzHTbo/Qac7
         nMFYjQ1M78JAnH1bflyhJGOxeWogImKPnaskNz85lJUpE+fz+1woI4VcpAgBD2hEoqW3
         mhsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CTBlbIbJuXZzM/fT0KgwCGp0qaQ8YE6cwnWgRYPo0ks=;
        b=akQkcC9AXFHFMX6kDgYIqNLcPRxw2yJvs+yssJn875g8H9YvVWVTomvz4G6PJgNtbW
         GHX2Dby1IHsOft2ZNCmUgV6U2P8v77+RY9wHEYlY+MAGlKvGlbaHVm+mLV/Au2+gW1ft
         uGStNgN3yPgEt7AvBgt8ryyM11y7s/efVkO7CbAnKpqehpcnm5q0srYnXQ/mWIaZMVGB
         IiYd7HU5fd8zh97r5eQsD+lq/7pVQ1fszTnB6EaVLxtVWTx1AEGBBUZ25Q91ae34+rai
         gnP6RWoaYz3e8ILJkVU6DWtfEwcAtkVrgQdNuLtMxqdYb1Z3NeSmfIMQtqs6tdUijVhJ
         pjzw==
X-Gm-Message-State: AOAM5315b+8bdye0chresxgxoizjNKhVwz/lRKGSmkfG5PagSiP3p85p
        XrcNU5eWTXQVWbdbrp/QK6x+GrYnVhYgSD9iEaE=
X-Google-Smtp-Source: ABdhPJw2pJczX94PnHWVUkkElfzoUXElds8HC47tOH7/y4KCSnsZSIxqQa6Eea93xaluEcuSdUfBUwLx6KKaDTOgejc=
X-Received: by 2002:a63:ce41:: with SMTP id r1mr35496732pgi.203.1594383658474;
 Fri, 10 Jul 2020 05:20:58 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20200703012353.26413-1-markpearson@lenovo.com>
 <CAHp75Vcs15wGCzwW8Pq7AXyqQnvnopNdFP1nDE0nf+ZTz=9zFw@mail.gmail.com> <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99@redhat.com>
In-Reply-To: <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 10 Jul 2020 15:20:41 +0300
Message-ID: <CAHp75Ve-qOs8VosoxEaHH1EnK-r16Sx0ki3uj14yZJWyuwC88w@mail.gmail.com>
Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: lap or desk mode interface
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Pearson <markpearson@lenovo.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jul 10, 2020 at 11:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 7/9/20 8:02 PM, Andy Shevchenko wrote:
> > On Fri, Jul 3, 2020 at 4:24 AM Mark Pearson <markpearson@lenovo.com> wrote:
> >>
> >> Newer Lenovo Thinkpad platforms have support to identify whether the
> >> system is on-lap or not using an ACPI DYTC event from the firmware.
> >>
> >> This patch provides the ability to retrieve the current mode via sysfs
> >> entrypoints and will be used by userspace for thermal mode and WWAN
> >> functionality
> >
> > Hans, do you think it's good to have custom ABI for this? I think you
> > may be know better what types of ABI we already have for such thing.
>
> Actually, Mark asked me the same question before submitting his
> patch upstream. I'm never a fan of custom ABI for this. But for now
> the solution Lenovo has chosen to deal with thermal management
> issues on modern hw is unique to Lenovo and we do not have anything
> like this anywhere else.
>
> So for now I believe that a custom ABI is best.
>
> If we see this becoming a common feature on more platforms then we can
> design a generic API for it once we have a better idea how this would
> look like when implemented by others and then thinkpad_acpi can easily
> add support for the new generic interface, while keeping its own
> custom interface for backward compatibility.

Thank you very much for the elaborative comment, appreciated!

-- 
With Best Regards,
Andy Shevchenko
