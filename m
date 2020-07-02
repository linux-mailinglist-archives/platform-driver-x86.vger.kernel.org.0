Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E0DE62121A0
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jul 2020 12:57:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727900AbgGBK5G (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Jul 2020 06:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42570 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726805AbgGBK5G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jul 2020 06:57:06 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E5ACC08C5C1
        for <platform-driver-x86@vger.kernel.org>; Thu,  2 Jul 2020 03:57:06 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id o13so10329427pgf.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jul 2020 03:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=06wVRBUw5sU6HeeBW+uzGWclrs60UMpE1NyO8Qk7/YY=;
        b=grfnpMycLdylON5naV2oSZu+n1o9Ni/pE7vv33/lW1UMlPSV++fubzQe4DGyJ6uXzY
         rbDQWCSCEcivfpsiLPgSJR8qeNNpSnTqqAd+7vmdPuolICBdzV+lIAqod/mpGfst2Kdc
         NyBebcHCN8kNl3Nb0cUFo6xDIRjmT3M7o7g+HsAuaTZEJiNCivrML1canpU1Ew6DmUOE
         Ip2G3nVmLS1G0jPNTlYrodTtMzqRJU3HQrDMx1miqa7IwU/idqmY8G3tWT1ut8uvOJ55
         yoLwMoxcJBu0+Dttp1sCgzGqRSsS/t0oTAVYy35GVT4UP2eAwMB08ipX+YSvpblFBY/0
         IAuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=06wVRBUw5sU6HeeBW+uzGWclrs60UMpE1NyO8Qk7/YY=;
        b=fZaplN0p2gupbeztR+yh17qVQeq3KYybagA8+tb2uN35WwULPUKogaj3b569Xr7iz9
         qIN2qxunjKgJPPtYH9MqGWPBpdjqKtV9tD0rSWZIrTN2Pg9vEib5idzkANLdlMGOMKpb
         qpWzW1ooYFQTto4vRlJQSyOG1ObumwGUImXkjQnqBG18Uam0rgNfmH52hl8PlbXvXWbI
         zsC5aHQ5r7HJ/inkIhj9xu9kq591lDgJmVeFtJejjfio8o+kQXOy/6WzwN46gSMgMHZx
         uqfv5VyWDjpJY5Ah14mv2q8D0Xv8+efiQoIW+X1ObhnNWRz7I1tC1spXL/iGhE/iUth2
         kxnA==
X-Gm-Message-State: AOAM532n4Rd3ELp/aSvqXEqxGi2ewvbc22LIibPDsvNALxzowfXH7yA9
        ff5fzTcV8tPlfvlFL3APWfxupqzNXpXtdS3p7kQ=
X-Google-Smtp-Source: ABdhPJyaWAJfuvQ5qJmv2QxaphDS1/PE7a4nmUeRCtiwOIllzJlabporD1fs8Ewl+NJ4r3b8f++1Hl3vby77EUlPaVU=
X-Received: by 2002:a62:7657:: with SMTP id r84mr27243754pfc.130.1593687425894;
 Thu, 02 Jul 2020 03:57:05 -0700 (PDT)
MIME-Version: 1.0
References: <markpearson@lenovo.com> <20200629191748.3859-1-markpearson@lenovo.com>
 <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com> <7d0e1dcc-7285-71e1-7125-604cb2630595@lenovo.com>
In-Reply-To: <7d0e1dcc-7285-71e1-7125-604cb2630595@lenovo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 2 Jul 2020 13:56:48 +0300
Message-ID: <CAHp75Vemyxv6KWBwAB+EyzvBRO_3OPaad9qCXdos_x8QhLupiw@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v4] platform/x86: thinkpad_acpi: lap or
 desk mode interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        bnocera@redhat.com, Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 2, 2020 at 1:45 PM Mark Pearson <markpearson@lenovo.com> wrote:
> On 7/2/2020 5:29 AM, Andy Shevchenko wrote:
> > On Mon, Jun 29, 2020 at 10:23 PM Mark Pearson <markpearson@lenovo.com> wrote:

...

> > You specifically added a new ABI, where is documentation? It's a show stopper.
> Ah - my apologies I didn't know that was a requirement.
>
> Any pointers on where to add it? I looked in Documentation/ABI and I
> couldn't find anything around thinkpad_acpi to add this to.
> Should there be a sysfs-devices-platform-thinkpad_acpi file?
>
> If that's the case I'm happy to look at creating that but as a first
> time kernel contributor would you object if I took that on as a separate
> exercise rather than as part of this patch. I'm guessing it would need
> more time, care and reviewers from other contributors to the
> thinkpad_acpi.c driver

Since it's an old driver its ABI is listed here

https://elixir.bootlin.com/linux/latest/source/Documentation/admin-guide/laptops/thinkpad-acpi.rst

...

> > Why not simple
> >
> >   if (output < 0)
> >     return output;
> Agreed. I'll fix

> > I think your prototype should be
> >
> > int foo(cmd, *output);
> Looking at it again - I agree.

And after returning only error codes, you may do above as simple as

int ret;

ret = ...(.., &output);
if (ret)
  return ret;
...
return 0;

...

> As a minor note I think these all arose because of getting checkpatch to
> run cleanly. I prefer one line too and if that's your preference it
> works for me.

Checkpatch shouldn't complain (update it if it does).

-- 
With Best Regards,
Andy Shevchenko
