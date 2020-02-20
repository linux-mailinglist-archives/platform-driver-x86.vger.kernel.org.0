Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 977CA1666EB
	for <lists+platform-driver-x86@lfdr.de>; Thu, 20 Feb 2020 20:13:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728334AbgBTTNv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 Feb 2020 14:13:51 -0500
Received: from mail-lf1-f67.google.com ([209.85.167.67]:40117 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728315AbgBTTNv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Feb 2020 14:13:51 -0500
Received: by mail-lf1-f67.google.com with SMTP id c23so3987068lfi.7
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Feb 2020 11:13:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=jtGfCZ6Tt9nUtJs/4fCZbyPWZOZzIWbBkr2JPN+tTJ8=;
        b=YGBQF1DwPBtMmghk2sblaYVP5/14qwbXmY/QJcnKFI9whyFZjAeC8/6poFolPl9sHk
         15xN02AviSmyITu7QB9VdCGClnENhzaUzT0+Padx+4z5I0Ml73Z6jKoH4cUIPWi6XRov
         daM0gPriqHZy87AFnXdWz4XDbM3cmh8uagZJoDG5Dohn4QSU6WsDmsp865rsBbyIZB4o
         feMlIJRP/8hJ3IaIIOijFujFaxe9jV5AUZqWb17+Ww08CNgkSteV4cQsRCT1V/LFJOYi
         N/noj6dQi7+yD1icEzllmTVLaR2q20B96dB+5RPMC9I6Jh4uLdPqnIFOxC3MBhxxMMSJ
         uh2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=jtGfCZ6Tt9nUtJs/4fCZbyPWZOZzIWbBkr2JPN+tTJ8=;
        b=FdZQB0WnDz7xT7sPmYWSPweB4EH/s5p6N3ku5s7HWE8jIjRPf3H0JVVYPKwKiIV4XU
         27Kqo49tvgk89TyCkEjkUzUOjJtCaqrPR1FID5PZGInaVng+DsGGDNiWUOC1QWdiugJY
         1vMXsOxFs1YOFPsxLtx9DgiK/gu8mfP2q0U91M4cLR1ikd2SizTmUIVm766aJf8iPMRb
         6OjB0n3gT0IQJeOK8x0isTP1JCVr83VP+ezBdxFKPyqDyi/hxkQySCGGCcQ/UFIkJf7J
         5I2b6fGeTuaf1KLKdt/h4rfDe+EWMsrf9aAFxmvTBB5Zpnn/GM7MgRXUidsaiq0DOulp
         kyOA==
X-Gm-Message-State: APjAAAUPGa6BmL48M0jJBO+V5cTXk0fh7/hSebCZeYyiCDTs8Aa3eoSb
        vmmZx9A50eGzW0Us/7aVDmYf6+X3rjh75xLRABnRJg==
X-Google-Smtp-Source: APXvYqzg8s50xmcwT+LpIu6nvPTBFwgpY+hE0DY/gee/4/ibTmwRrPaemXe5HVlQzJgdENN2Q7BMW397mtDgSpOswVg=
X-Received: by 2002:a19:5e1d:: with SMTP id s29mr17601785lfb.21.1582226028830;
 Thu, 20 Feb 2020 11:13:48 -0800 (PST)
MIME-Version: 1.0
References: <20200220074637.7578-1-njoshi1@lenovo.com> <CAHp75VcJmEOu1-b7F2UAsv=Gujb=pPLzjz2ye9t4=Q68+ors-w@mail.gmail.com>
 <HK2PR0302MB25937E2946BF38583B3A905DBD130@HK2PR0302MB2593.apcprd03.prod.outlook.com>
 <CACK8Z6GwuOnJUUscriGwKWGBp5PFKyuqUkFYC8tEXa0UEuEZww@mail.gmail.com> <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
In-Reply-To: <PS1PR0302MB260492DDE243BE0A64A39AA7BD130@PS1PR0302MB2604.apcprd03.prod.outlook.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 20 Feb 2020 11:13:12 -0800
Message-ID: <CACK8Z6HWkafL4EzOndRyiA3k-VyUg8bQ=2diw_wJSxSTyqsE+w@mail.gmail.com>
Subject: Re: [External] Re: [PATCH] thinkpad_acpi: Add sysfs entry for
 lcdshadow feature
To:     Mark Pearson <mpearson@lenovo.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Nitin Joshi <nitjoshi@gmail.com>,
        Mat King <mathewk@google.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi1 <njoshi1@lenovo.com>,
        Benjamin Berg <bberg@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mark,


On Thu, Feb 20, 2020 at 11:03 AM Mark Pearson <mpearson@lenovo.com> wrote:
>
> Hi Rajat,
>
> > -----Original Message-----
> > From: Rajat Jain <rajatja@google.com>
> > Sent: Thursday, February 20, 2020 1:39 PM
> > >
> > > For this particular issue what is the best way to contribute and get
> > > involved? We'd like to make it so ePrivacy can be used more easily fr=
om
> > > Linux. I agree a more generic way of controlling it would be good.
> > > I looked at the proposed patch from Rajat
> > > (https://lkml.org/lkml/2019/10/22/967) - it seems like a good solutio=
n to me.
> > > We can help with testing that on our platforms if that would be usefu=
l.
> >
> > Thanks you, just so that you know, the latest patchset is at:
> > https://lkml.org/lkml/2019/12/20/794
> >
> > It would be great to get some additional testing if possible. I can
> > send a sample ACPI (for our platform) in case it helps.
> >
> Sounds good - we'll definitely try this out and see how it goes. I suspec=
t we'll have some questions once we try it out and get more familiar.
>
> > >
> > > I need to understand how we connect that implementation with the ACPI
> > > controls we have (as I believe what we have are thinkpad specific and=
 not to
> > > a drm spec; we need to confirm that). We also have the ACPI events th=
at
> > > notify if ePrivacy was changed by the hotkeys and that seems like som=
ething
> > > that should be done in thinkpad_acpi.c and not the drm code.
> > >
> > > Not sure if the two need to be connected somehow (or if handling the
> > > event is actually not important and polling is acceptable)?
> >
> > So there was some brief discussion about this on my patches - but
> > atleast on  the platforms I have seen, there was no way to change the
> > privacy screen out of software / kernel control. Essentially, if there
> > are hotkeys, they would send an input event to the kernel, who'd send
> > them to userspace, who'd use the DRM method to toggle the privacy
> > screen. Thus the current version of the patch only supports
> > controlling the privacy screen via set() method. The get() method just
> > returns the cached value.I hope that works for you.
> >
> OK - on the thinkpads we have function+D as a 'hotkey' to control the fea=
ture...and my understanding is that bypasses everything and goes straight t=
o the firmware.
>
> The changes Nitin had been working on in thinkpad_acpi.c was to make this=
 more Linux and friendly - provide a sysfs hook for user space to connect t=
o with the aim of allowing it to be configured from user space and have on =
screen display when it was triggered etc.
>
> I'm personally not sure yet how this ties up with the DRM method - more d=
igging required. I'm intrigued to see if it works on our systems (sadly I d=
on't have anything with that feature available on my desk right now...I nee=
d to get my hands on one)

Just FYI, Here is the brief discussion we had about an interrupt
mechanism to support a (hardware based) "kill switch" for the privacy
screen.
https://lkml.org/lkml/2019/10/25/992

Thanks,

Rajat

>
> Thanks
> Mark
