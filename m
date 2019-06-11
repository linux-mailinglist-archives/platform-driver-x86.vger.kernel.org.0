Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 665A93CC58
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 14:58:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388225AbfFKM6T (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 08:58:19 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44756 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388178AbfFKM6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 08:58:18 -0400
Received: by mail-pl1-f196.google.com with SMTP id t7so2476620plr.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 05:58:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=pXtlDQHSEs4WVeSAL19OGNzZcdoBkMvgqmy7TAlkhME=;
        b=RVKc7toGbgsf0eQy0HoFZWjudTTuk61JAhVdbWXGyxlbZaCV4HBCWa5igiiY1QPbXw
         SGtjEzhxbfQwO+Qv05FP4QZoWp0RyVEADerwkBGqvf2j+zThrRXxrdmOGu56DYn/4m3T
         qgL30f0F7SKLsnoFtl7ObMvn5gWQKqrAtk0OnFaZ4hBOTcbCZPcYzhtiUF+Snyyt4P0l
         JVqU1IPOOIgGhYnAbHowpgdiPnkPr+IxDQESvXmNZ+q9DZdvAmZ3H18BpCxV8u7IcvRM
         mznkssoqTAw8MDosnw1CYABGpnOIVOZigQkbOEMD6cB/VsIJkbrzkSPIfcT1ivaNRxrH
         hQRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=pXtlDQHSEs4WVeSAL19OGNzZcdoBkMvgqmy7TAlkhME=;
        b=rphBA9bf4vkjY+d27+z6tRQXgeMpDuDG1E1XbRm046i7pVKap1SJs37bURMXRQ45k4
         Dj7mbL4QCApoXFAc7tzOLqSiAx6kjmtZRSmrmomXZl++5J5sEDdVXk1dcSCp9dw0cFPj
         bKO/hyW2oJjCPbK2XxVNxVaupHCNkVU0xNYQngUTFAeys911IF+eYBQYnagJ832xJChD
         cTWx0BWrcEnu4nG0DBT2LfwKvGgAVYUhNu0LtjJiUn2ZBu0CbZ3p7So3QgDz7Z9Yd2uE
         fdDZD+TctlRTTf3ciCmsDAr5lIc58xj52qmw2ujCn4udsRP6qUlTkv9SNGVHNExIzG0X
         mdaw==
X-Gm-Message-State: APjAAAV+ud+gZjA/ReT/vnEasrIC8PKxbkKp9w/2zBYNCrA7+zMs9jsJ
        Rjdsw2MZHVurvga1FlFz8Mh0IN+hqj/BaDeMtuuDW+qG+xU=
X-Google-Smtp-Source: APXvYqyQyE97CtDPHn/PTivzvjy4OWe4TjBq4YAIqd7QUmrCnzxHtAkj1LOjLWNg1JO1IFqR+InHCRbAu6WYODIlnMo=
X-Received: by 2002:a17:902:694a:: with SMTP id k10mr2442079plt.255.1560257898022;
 Tue, 11 Jun 2019 05:58:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
In-Reply-To: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jun 2019 15:58:07 +0300
Message-ID: <CAHp75VdaafccAkuOnkh2M3LaOKT56FbMfRo1HWKnqcvm8W4Vcg@mail.gmail.com>
Subject: Re: [PATCH 1/2] x86/platform/intel-mid: Create pinctrl platform
 device at later initcall
To:     Jarkko Nikula <jarkko.nikula@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jun 11, 2019 at 1:33 PM Jarkko Nikula
<jarkko.nikula@linux.intel.com> wrote:
>
> Postpone "pinctrl-merrifield" platform device creation later than
> subsys_initcall. This is preparation for an another patch that does ACPI
> namespace walk which is not possible yet at subsys_initcall phase.
>
> Currently if kernel is built with ACPI support and platform has the ACPI
> device "INTC1002" with the same MMIO resources than "pinctrl-merrifield"
> platform device then these devices conflict and typically probing of
> "INTC1002" will fail in drivers/pinctrl/intel/pinctrl-merrifield.c due
> conflicting resources:
>
> [    0.873523] pinctrl-merrifield INTC1002:00: can't request region for resource [mem 0xff0c0000-0xff0c7fff]
> [    0.879464] pinctrl-merrifield: probe of INTC1002:00 failed with error -16
>
> Moreover also dependent drivers/gpio/gpio-merrifield.c will fail to
> probe due it tries to bind with pinctrl device named after "INTC1002"
> rather than "pinctrl-merrifield" when "INTC1002" is present in ACPI tables:
>
> [    5.825231] gpio gpiochip0: (0000:00:0c.0): could not create pin range
> [    5.825710] gpio-merrifield 0000:00:0c.0: failed to add GPIO pin range
>
> Signed-off-by: Jarkko Nikula <jarkko.nikula@linux.intel.com>
> ---
> Andy: I'm not sure is this with the next patch the right fix or would it be
> possible to just delete this "pinctrl-merrifield" initialization filei? I
> went to this path since I don't know are there platforms without
> "INTC1002" in their ACPI tables or do some users want to run non-ACPI
> kernels.

I have locally one hack with another approach, i.e. check for SFI
availability like the rest of the files in this folder works, with few
exceptions as this one.

So, something like

if (sfi_disabled)
  return -EINVAL.

If you have time, you can split and submit the
https://github.com/andy-shev/linux/commit/7a0cb10387a437f5811435b9c790043c64816d08


-- 
With Best Regards,
Andy Shevchenko
