Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AB1C644B1EE
	for <lists+platform-driver-x86@lfdr.de>; Tue,  9 Nov 2021 18:23:40 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238350AbhKIR0Z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 9 Nov 2021 12:26:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbhKIR0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 9 Nov 2021 12:26:25 -0500
Received: from mail-ua1-x936.google.com (mail-ua1-x936.google.com [IPv6:2607:f8b0:4864:20::936])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8C93C061764
        for <platform-driver-x86@vger.kernel.org>; Tue,  9 Nov 2021 09:23:38 -0800 (PST)
Received: by mail-ua1-x936.google.com with SMTP id t13so24642481uad.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 09 Nov 2021 09:23:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=N5nPrSKzN9vmcopwOYkHrg5Z+wd4SAev+jGLXb+5VEI=;
        b=SKjv1B8DH8tgKNEdjjP41egZ1r1EkjwbLEjbi0K9Nv2iQ3wCnXuxpMg2ghh7eEDx+i
         sRXrogHaq213yhwQ1vC/SKaxl5rjmeLBriGV7IDetA2usyLGKyrtoCocM6hce79OnJiX
         c4/Z2Ekct72ASIaX7H2jCQkSbDj+/6HitoShT5HmPLd+sjYhVTOITaCrpTwcMCeRDUqH
         xAMBIY/YO4aZvTWDEpdDIw4sv+H3lVVngEzjMr9+ewtURCSaqrnrRvp3kJ8oAVKbmd8u
         TQna0W2apxJifTqphcRGufJP5bGQl3OezfCN8SLUsXSxJ+mWhJ/lP/wSZIICKusS9pG5
         vRPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=N5nPrSKzN9vmcopwOYkHrg5Z+wd4SAev+jGLXb+5VEI=;
        b=GCDpxwPZihE7ABWz32vJ9DnuKZYBuo2Ox9IF/9jNtEI/frDQY+EVHQq3Tzx1SkWLF0
         sDwoy3pJuukZXEBdIKGRqLR/ZyH1cN1/n0QaKrCoubFsEgRqUG3ZnA8viUaNOes+YSe7
         8AtgXrNH2RIenEY1ohY17hu1VRzlQKZd6tRncXGDtYcSCGK/kl2SdkKBUx2FAde2qn95
         a+nIMGjhIapTH18oKU016+dqmV4Y+tnJnZKHr9UDbbZLbOxOWVnYSBdZXd8CP0bouxMi
         Yz8eBufRjiMiPztpBctZbydxcpY1IP1In2deIQ8kmvSCGbAFFTXVSaPpQ7ZmC3TcoKCJ
         l2QA==
X-Gm-Message-State: AOAM530UtX5CwcGagtFT+DjnJ+ImadsBxRmFVqk2209Ki8JOoTNoKAfa
        nVO+e9u7MIFuByRkg9wqVogQYpk+VG0fXz4Tjcg/Dg==
X-Google-Smtp-Source: ABdhPJxyY9KohsPSx0s7aYMGDgrSX2QgYgT0iOW7D7XUZgPJEEWr2hYZwqoQwTTP1UMrQyEGCpSqESw4XCrmue7Xmvc=
X-Received: by 2002:a9f:21d7:: with SMTP id 81mr12035830uac.39.1636478614498;
 Tue, 09 Nov 2021 09:23:34 -0800 (PST)
MIME-Version: 1.0
References: <20211109000130.42361-1-hans-gert.dahmen@immu.ne>
 <YYoSPjF3M05dR0PX@kroah.com> <CAArk9MN99YjKV2AKCYsUqh7LNVCb2ddvcSnRgGGsXePkM6Q86Q@mail.gmail.com>
 <YYqd8pNx53BX13Sy@kroah.com>
In-Reply-To: <YYqd8pNx53BX13Sy@kroah.com>
From:   Mauro Lima <mauro.lima@eclypsium.com>
Date:   Tue, 9 Nov 2021 14:23:23 -0300
Message-ID: <CAArk9MPODL4W_MuRy_ruPNcHyynm_eZJgB5Owknkudwtpcqx4g@mail.gmail.com>
Subject: Re: [PATCH] firmware: export x86_64 platform flash bios region via sysfs
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     Hans-Gert Dahmen <hans-gert.dahmen@immu.ne>,
        akpm@linux-foundation.org, linux-kernel@vger.kernel.org,
        Philipp Deppenwiese <philipp.deppenwiese@immu.ne>,
        Richard Hughes <hughsient@gmail.com>,
        platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Nov 9, 2021 at 1:12 PM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Nov 09, 2021 at 10:55:54AM -0300, Mauro Lima wrote:
> > Hi all,
> >
> > On Tue, Nov 9, 2021 at 3:16 AM Greg KH <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Tue, Nov 09, 2021 at 01:01:30AM +0100, Hans-Gert Dahmen wrote:
> > > > Make the 16MiB long memory-mapped BIOS region of the platform SPI flash
> > > > on X86_64 system available via /sys/kernel/firmware/flash_mmap/bios_region
> > > > for pen-testing, security analysis and malware detection on kernels
> > > > which restrict module loading and/or access to /dev/mem.
> > >
> > > That feels like a big security hole we would be opening up for no good
> > > reason.
> > Please, can you explain why this could be a security hole?
>
> We restricted /dev/mem and now you want to open a portion of it back up,
> hence my worry that now you can read information that previously you
> could not read.

Thanks for the explanation, I understand the worry about changing this
again but still I don't understand what advantage it can give an
attacker to be able to read the binary :(.

> > IMO if the host is compromised the attacker already has information
> > about the BIOS version, and after a quick lookup they know the BIOS
> > vulnerabilities or the lack of them.
>
> So you are saying that you do NOT need this access to get the BIOS
> information if you have root access?  If not, then why is this needed?

Sorry if I did not express myself clearly, but the information I was
talking about, could be the BIOS version number for example. If the
host is compromised you can get the BIOS version and check what
vulnerabilities are not fixed in that version and exploit them.
You don't need the binary for this, just with the number you can go
and check on vendor sites for unpatched vulnerabilities for that
version.
But, if you could take this binary, somehow compare it to a certified
blob given by your vendor and see if they match or not (corrupted),
could be a good reason for this.

> confused,

Sorry again and thanks for your time.

> greg k-h

Thanks, Mauro.
