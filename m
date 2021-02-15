Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 97CC831BC92
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Feb 2021 16:33:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbhBOPbk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Feb 2021 10:31:40 -0500
Received: from mail-oo1-f51.google.com ([209.85.161.51]:41430 "EHLO
        mail-oo1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231137AbhBOPaU (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 10:30:20 -0500
Received: by mail-oo1-f51.google.com with SMTP id h38so1601533ooi.8;
        Mon, 15 Feb 2021 07:30:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=isume7MsAKJUgcVzBLxc8IgE/AUGm0k6pIY3I433ckM=;
        b=OvobKBSBeXAy0JPI9cTVTriqx2DUwKKsETEOZkrxX7N+gXuikpgKbF709C1f4o8X+z
         eZCIu0U1msaaF/hmTPAWpry1Gp2v2wXKmaDTekwQUmVrIL4GaXtWHnZIKXGQu3tccAdy
         P7k2YYm1J7NKKqTKXF6JCZZhGRo/Z1pA//HNEPBIOOWNSEeTOnWJYHxaOHWRA6sZi9g+
         NNMnuH9r0OtBxOoVicrJYE6QZOjVcgymv4O8q0mgnv2CD4k/uiY0CITDYF4zjyqFZZeL
         fbRRkwmY/9pHZZDwtD8Se61JdUFl4Mo8P5/3B4UuLmXOL6qUO076Z6OmBBE83qx4LUmF
         5z3w==
X-Gm-Message-State: AOAM5336yvJR7+ByjU96u6qiOrWlryRXsFGVg+fV37LZhph4Kf5R8eF5
        /4L8rGfNBv4ZeWkerCVhXzMLfIkh5Fn8tPfU9ZQ=
X-Google-Smtp-Source: ABdhPJwnWsWZoLW9MJCEykMJvynVICE7JSQVOd0x9prrkbClTU/T/lwqVm5btNHAJbcJkkbO9nu1r+2rI7zblj4jrHw=
X-Received: by 2002:a4a:9873:: with SMTP id z48mr11232958ooi.44.1613402979098;
 Mon, 15 Feb 2021 07:29:39 -0800 (PST)
MIME-Version: 1.0
References: <20210211201703.658240-1-luzmaximilian@gmail.com>
 <898aa498-8256-d59f-9e72-0e1199b3a62a@redhat.com> <CAJZ5v0jGUgHsNaqLarf=YLwjtOe-mQB48LkOQLi7FcZyW1Qchg@mail.gmail.com>
 <510803ab-b5b8-ce2c-e956-5539874d00bf@redhat.com>
In-Reply-To: <510803ab-b5b8-ce2c-e956-5539874d00bf@redhat.com>
From:   "Rafael J. Wysocki" <rafael@kernel.org>
Date:   Mon, 15 Feb 2021 16:29:23 +0100
Message-ID: <CAJZ5v0hBN2zTHj+KsAmdNWTL0e983CFE+LYBssJzUDOmdF7PPQ@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/surface: Add platform profile driver for
 Surface devices
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Mark Gross <mgross@linux.intel.com>,
        Len Brown <lenb@kernel.org>,
        Mark Pearson <markpearson@lenovo.com>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 15, 2021 at 4:22 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 2/15/21 3:54 PM, Rafael J. Wysocki wrote:
> > On Mon, Feb 15, 2021 at 3:36 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 2/11/21 9:16 PM, Maximilian Luz wrote:
> >>> This series adds a driver to provide platform profile support on 5th-
> >>> and later generation Microsoft Surface devices with a Surface System
> >>> Aggregator Module. On those devices, the platform profile can be used to
> >>> influence cooling behavior and power consumption.
> >>>
> >>> To achieve this, a new platform profile is introduced: the
> >>> 'balanced-performance' profile.
> >>>
> >>> In addition, a couple of fix-ups are performed:
> >>> - Hide CONFIG_ACPI_PLATFORM_PROFILE and change drivers so that it is
> >>>   selected instead of depended on.
> >>> - Fix some references to documentation in a comment.
> >>>
> >>> Note: This series (or more specifically "platform/surface: Add platform
> >>> profile driver") depends on the "platform/surface: Add Surface
> >>> Aggregator device registry" series.
> >>>
> >>> Changes in v2:
> >>>  - Introduce new 'balanced-performance' platform profile and change
> >>>    profile mapping in driver.
> >>>  - Perform some fix-ups for the ACPI platform profile implementation:
> >>>    - Fix some references to documentation in a comment.
> >>>    - Hide CONFIG_ACPI_PLATFORM_PROFILE
> >>
> >> Thanks, the entire series looks good to me, so for the series:
> >>
> >> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> >>
> >> Rafael, can you (once 5.12-rc1 is out) pick 1-3/4 and then provide a
> >> stable branch for me to merge?
> >
> > Since [1-3/4] appear to be uncontroversial, so IMO it would be better
> > to merge them during the merge window, so they are present in
> > 5.12-rc1.
>
> So I just realized one problem with this plan, patch 1/4 depends
> on (modifies) Kconfig bits which are only in my tree / my 5.12 pull-req
> (which I send out earlier today).

That should be fine.

I will be sending the first batch of pull requests tomorrow.  Then I
will wait for them to be merged and I will merge the mainline back at
that point.  The new patches will be applied on top of that merge, so
if your 5.12 material is included in it, they should build without
problems.
