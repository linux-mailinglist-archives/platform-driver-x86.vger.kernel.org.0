Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A73144D3AF
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Nov 2021 10:02:45 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232531AbhKKJFR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 11 Nov 2021 04:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232671AbhKKJCv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 11 Nov 2021 04:02:51 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1333C061208
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 00:59:44 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id v127so4393421wme.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 11 Nov 2021 00:59:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=immu-ne.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=btaOpG2HGUj1JZxl+ePRoLEyHu6nH/++aTWt9XqRAAk=;
        b=eogWlWUt+ywwdFLpwIg9PnNRB38ICeXHmX9WqKX+hKzInFg+gjw6gCrqZ0hrlIRHKZ
         4+oOOKY75ewDuO0vl+GbLlbJsFVoLPCWwtKgJGGsbwJA71ychtpjn3C8f/h41C693JiE
         cjIHxOw+/7mCzDgf00Fnh4IV16vC9eu8zpF4bGjIoOPxBuelTMOxKbuGjavVPpks8U4T
         pA2+XCEv1vSJzzsUbmmVWduTrWjOuDTEqd+EzjeDc7G3WLu2Befr3Jsq/F9pmZmQHC4+
         WLOKCjQflys5VU7smbZUIF+H4QkIR4tSK3YJWAE6FQqOcER4UhDAjwPIY3xroeUZ4Q0R
         m7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=btaOpG2HGUj1JZxl+ePRoLEyHu6nH/++aTWt9XqRAAk=;
        b=vH82HcOO8v/riCTYDh8xYqwYd65mZj8Ze5o43Mk7EJ8FehNjaDfWaiT8p/B2MZXJL1
         sTHkeIZ6QPWvEAByZd/LFiWN05Cx4QSBP6hQpZLzqB1rOneLCAEOJdNjIGJJ0X8iqqtD
         IiwOIWSCeKc10fcKDH7we5ITeiotHgBkTwCv9vkuVT92nQnn/4vMrUCtJ7bf+EK+P0Bt
         2EljIBpdHrOPH3Cxu/vM/9EWLSX9N31dTzotd3+ukufxCNwg4vdgiQ8FucKjpUMPIcRS
         DdI/Rg7C8/Y5UJhSCZwWP+CxE9RhYNR8hEgJTGg/alHPsiDRXOCDSkT7tFey+N8SYpBi
         xI/g==
X-Gm-Message-State: AOAM530es2weGn7ouR5kl1YGJJMSixBAVEPqkXULgUW/FpqZUSloB/Bw
        oTVsseZ9VsCibXFi9X2lckozMEENtCEtygk/AxXwhA==
X-Google-Smtp-Source: ABdhPJzN8HfHkw/HhQ69DeLN8FIVe242sAFG5SjILUWkcMAWJjh4vDu8FmfUybnIZ2xyUpwH9OYOlsdplVEj61C0YLM=
X-Received: by 2002:a05:600c:2dc1:: with SMTP id e1mr6488643wmh.170.1636621183492;
 Thu, 11 Nov 2021 00:59:43 -0800 (PST)
MIME-Version: 1.0
References: <CAHifhD6K5hbpHS-X+2L=pfUe+7OpyTbB7uyh8WGbdaeBMwoYPg@mail.gmail.com>
 <CAHp75VfbYsyC=7Ncnex1f_jiwrZhExDF7iy4oSGZgS1cHmsN0Q@mail.gmail.com>
 <CAHifhD5V9vwJenRLcPRH5ZMeLa_JnjZKfdcFZw1CjceBtC6=Ew@mail.gmail.com>
 <CAHp75VeyQEaABFOnEUh2pdFx9ROJvRcud-BuEbKWmaEWpL9_Uw@mail.gmail.com>
 <CAHifhD7Qf7+dc7K-MjNguqmiCWUxOJZmQoCTRUZOR-RWMm_JPw@mail.gmail.com>
 <CAHp75Ve9BMNy3gP=-Dajm+Lgu+E4FCqc4phLgV1_cr2qUnTX_w@mail.gmail.com>
 <CAHifhD4n7O5eWFPOjRAmHYL52tW0K=uXXzVj7L5+enTFwFXW2A@mail.gmail.com>
 <CAArk9MP5cKJ+VhAZUseW4LnQNRvux=MZe2eSy3rQkbHKnUsGig@mail.gmail.com>
 <CAHp75VdRwvU5WjFP5E4gg8U+_e34A0Lwze+nz_wVHoB49jLeLg@mail.gmail.com>
 <CAArk9MNGSxR+92n-D2pe_+r+Z0Q9FoTMPqk11sAKA=4Vckj0HQ@mail.gmail.com> <YYy7QZGKeEEfI1mH@lahna>
In-Reply-To: <YYy7QZGKeEEfI1mH@lahna>
From:   Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>
Date:   Thu, 11 Nov 2021 09:59:32 +0100
Message-ID: <CAHifhD5bXu2nP533RXyWDnyNt=k2rRZq5Z6A6CCik_2e6XNgGA@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Mauro Lima <mauro.lima@eclypsium.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        Richard Hughes <hughsient@gmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Do., 11. Nov. 2021 um 07:42 Uhr schrieb Mika Westerberg
<mika.westerberg@linux.intel.com>:
>
> Hi,
>
> On Wed, Nov 10, 2021 at 02:37:56PM -0300, Mauro Lima wrote:
> > > Try again to collaborate with Intel SPI driver author(s) /
> > > maintainer(s) by sending the proposal that may work.
> >
> > The proposal I sent makes the driver work only with read ops, but that
> > was not the issue with this driver. The issue was something related to
> > a status register and this was fixed. So if there is no issue with
> > write/erase ops, the bug was fixed and there is no intention to remove
> > the tag. What kind of proposal are we talking about?
>
> I think we discussed this previously already but in any case, instead of
> removing the tag from the "main" driver, we can make certain "safe"
> parts of the driver available without that tag. That would allow you to
> read the things the controller exposes and allow distros safely include
> the driver too. By "safe" parts, I mean the information available
> through the SPI flash controller without actually sending commands to
> the flash chip. I think this is the information everybody (on this
> thread at least) is interested in. Unless I'm mistaken - I did not check

Yes you are mistaken. My patch is about safely reading the BIOS/UEFI
binary on every past and future x86_64 system. There are tools out
there that use the interface my patch uses and they can not work any
longer when /dev/mem is locked down with SecureBoot enabled. The
tools, like fwupd, should work out-of-the-box on the typical
distribution. During this discussion we were told that my patch is not
welcome and that we have to work with you to achieve the same. So I'm
curious to hear how that can be done.

> the original patch. If that's not enough we can possibly expand it to
> cover the controllers that only use hardware sequencer since they
> operate on a certain limited set of ops that should not break anything
> accidentally.

Hans-Gert
