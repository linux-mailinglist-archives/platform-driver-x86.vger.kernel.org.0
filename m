Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A0C6E3D616
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 21:01:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392230AbfFKTAr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 15:00:47 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46786 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392229AbfFKTAr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 15:00:47 -0400
Received: by mail-pf1-f196.google.com with SMTP id 81so7991260pfy.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jun 2019 12:00:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2aTa8cp+r4B4zpQMNEb2MVDJN0c0hqMYNPlHUSkR5zY=;
        b=DzQMiI9Nk0AZblaD+GSWYu05wtJRv5xdHI0Eh6oTKU+3xMdaX+w3zMLEOsaTaFViYy
         DM1xXjW6Z3FrtuTGPQSDF/vTFxh8rtwuICyF9HzbfCDdnl04MIKDhXHQ4x6xpXra8EV5
         dXBtzVvwiMq93ovA6d7BoC+3L/nHhqTUORohy1LSFyWt+JrplWozDs6zMQKH5U2uAtPF
         7hadTtmu/ovWkVftkIUp1JqI378oR1U6MK77V/TFPjTuw3/LNHwaYG6vUYlvtsA7CxhD
         sIL2ilB12MAA1ImMjJmaW6xmgS6CQH51xuFSO50NiPd88fCvp2oadhsKcgXsDGm+jC9P
         KzxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2aTa8cp+r4B4zpQMNEb2MVDJN0c0hqMYNPlHUSkR5zY=;
        b=e2woAPuylq72n7FkUXjSOFj+Yh4lS1rNnwPn0tZuxCI+Jfo5sE+yrNV3jRC8QFm+nU
         NGovNHH7GynTviZmhGJhci3W4Y39+kz0iNFXvTAvKsu8VaVcur0U1+A5Bz/EPbeItiQk
         AvSYUb3eoIvY8/py2a5JaZKB6jiYTlirj503CBEBMSleBrw/AVKCY2+8Jv4vVgbrUZE4
         1Qq5KiuhI2mJWbkstULZH1BVtrRVTDrkUNwYirBoWOVDzQFIUuGij3Mx9MacNvzKi2qn
         0TJCkagUZyoXH7FFjhltNwfhJwNfmgtLKV0ELWk6wT43CWYCW/A8xZ3Sx2hqj6l9Plza
         FiIQ==
X-Gm-Message-State: APjAAAWgVjEs4kwMWy3JciViQk+Di9gm7RmX05HvvOy16XORst1JHpk5
        2cKisI05wWMIFmwp01Ji13KtR/DobvsJBhpJxFI=
X-Google-Smtp-Source: APXvYqzS78kywwuLa8pM2s/anE0jkNgQewr+TXtUZIVfmydGKDZ7m1seqgeQvjd1h9DDN+tBX8bBxjloJdSUwVHbvdU=
X-Received: by 2002:aa7:9159:: with SMTP id 25mr81347275pfi.64.1560279646392;
 Tue, 11 Jun 2019 12:00:46 -0700 (PDT)
MIME-Version: 1.0
References: <13513063.74pX3ZfeIS@sanji> <CAHp75VdtuqS1+hqXuLT-0qZiy4WANXhnSmHr6=hUSxheqpiTJQ@mail.gmail.com>
 <CAJ=jquaSc9qjYde7A75KxzGV+XRqJokunV5CbAM28Qge-_Zvrw@mail.gmail.com>
 <1525059933.1098515.1355095072.21C4A0BE@webmail.messagingengine.com>
 <1525062909.1113096.1355123680.2B2A0D81@webmail.messagingengine.com> <CAJ=jquZmqQitoHz_asNfqvQhEWepGmNRhY-1kRC+2oyFjoA59Q@mail.gmail.com>
In-Reply-To: <CAJ=jquZmqQitoHz_asNfqvQhEWepGmNRhY-1kRC+2oyFjoA59Q@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 11 Jun 2019 22:00:35 +0300
Message-ID: <CAHp75VcDMjaMWrj_h6Q-xm5AG=Cz1n1pzg1hwaOZGobdzRhfag@mail.gmail.com>
Subject: Re: [PATCH] Make power-button key report the button-up event when the
 5-button array does not exist
To:     Alex Hung <alex.hung@canonical.com>
Cc:     Tristian Celestin <tristiancelestin@fastmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 30, 2018 at 8:20 AM Alex Hung <alex.hung@canonical.com> wrote:
>
> On Sun, Apr 29, 2018 at 9:35 PM, Tristian Celestin
> <tristiancelestin@fastmail.com> wrote:
> > I have a patch ready, but I don't know the underlying cause of the problem, and this is preventing from writing a meaningful commit message.
>
> According to my understanding, the original intel-hid spec supported
> 0xC0 notification and events are reported by HDEM method, and an
> update of "5 button array" added other notification numbers such as
> 0xce for power button; however, some BIOS failed to report 5 button
> array is supported via HEBC method, and the DMI quirk was a workaround
> to always enable 5 button array.
>
> I personally think a commit message similar to c454a99d4ce1cebb is
> good enough, but Andy or Darren will provide more feedbacks if they
> think a refinement is necessary.
>

This is still in the patchwork queue by some reason.
Can you elaborate if this needed or not? If so, would it be
anticipated a new version?

> >
> >
> > On Sun, Apr 29, 2018, at 8:45 PM, Tristian Celestin wrote:
> >>
> >>
> >>
> >> On Mon, Apr 23, 2018, at 8:55 PM, Alex Hung wrote:
> >>> On Mon, Apr 23, 2018 at 7:36 AM, Andy Shevchenko
> >>> <andy.shevchenko@gmail.com> wrote:
> >>>> On Sun, Apr 22, 2018 at 1:25 AM, Tristian Celestin
> >>>> <tristiancelestin@fastmail.com> wrote:
> >>>>
> >>>> Thanks for the patch.
> >>>>
> >>>> First of all, please, include all PDx86 maintainers to the discussion as well.
> >>>> Second, please, use `git send-email` tool to send patches, it avoids
> >>>> attachments.
> >>
> >> Thank you for the guidance. Will do.
> >>
> >>>>> I am running Fedora 28 and Android-x86 on a Dell Latitude 5175 tablet. The
> >>>>> power button functionality is driven by the intel-hid driver. I am using
> >>>>> kernel version 4.16.
> >>>>>
> >>>>> Currently, the intel-hid driver does not supply a KEY_POWER up event in cases
> >>>>> where the platform doesn't expose the 5-button array. Without this patch, the
> >>>>> power button can't reliably respond when the platform is running Android.
> >>>>>
> >>>>> When running Fedora, I can use the power button to suspend and resume the
> >>>>> tablet. I can initiate this suspend by short-pressing the power button for a
> >>>>> second, and can resume it using another short-press.
> >>>>>
> >>>>> When running Android-x86, I can only short-press the power button once. After
> >>>>> the press, the button seems to no longer respond. This is problematic when
> >>>>> using a short-press to initiate a suspend, since a subsequent short press will
> >>>>> not wake the tablet.
> >>>>>
> >>>>> I used getevent to display the KeyEvents[1] detected by Android, and a
> >>>>> combination of 'cat /proc/kmsg' and debug statements in the intel-hid driver
> >>>>> to display the events generated by the driver. I found the block in the intel-
> >>>>> hid driver that generates power button events for my device. On line 253 of
> >>>>> intel-hid.c:
> >>>>>
> >>>>>       if (!priv->array) {
> >>>>>               if (event == 0xce) {
> >>>>>                       input_report_key(priv->input_dev, KEY_POWER, 1);
> >>>>>                       input_sync(priv->input_dev);
> >>>>>                       return;
> >>>>>               }
> >>>>>
> >>>>>               if (event == 0xcf)
> >>>>>                       return;
> >>>>> }
> >>>
> >>> Thanks for the work. This somehow sounds similar to Wacom MobileStudio
> >>> Pro that we worked on before. A quirk was added to enable 5 button
> >>> array, and the commit is c454a99d4ce1cebb.
> >>>
> >>> Could you please try to add a DMI entry in button_array_table[] and
> >>> verify the power button again? If this works, we can use the DMI quirk
> >>> instead.
> >>
> >> Thank you for the guidance. I added a DMI entry to button_array_table[] for the Latitude 5175, and the
> >> tablet now also responds to short presses while suspended.
> >>
> >>>>>
> >>>>> When I short-press the power button, intel-hid produces a KEY_POWER down
> >>>>> event, but doesn't produce a KEY_POWER up event when I release the power
> >>>>> button. Suppose intel-hid has been mapped to the input device /dev/input/
> >>>>> event19. Then, on Android-x86, the command "getevent -lt" produces the
> >>>>> following output:
> >>>>>
> >>>>> /dev/input/event19: EV_KEY       KEY_POWER            DOWN
> >>>>> /dev/input/event19: EV_SYN       SYN_REPORT           00000000
> >>>>>
> >>>>> Subsequent presses produced no output for that input device.
> >>>>>
> >>>>> When I added a call to input_report_key(...) and input_sync(...) on the
> >>>>> KEY_POWER up event in the intel-hid driver, I could repeatedly short-press the
> >>>>> power button and have Android respond appropriately, including resuming the
> >>>>> device from suspend. My hunch as to why this is the case is that Android needs
> >>>>> a paired KEY_POWER DOWN and UP event before it will handle the press.
> >>>>
> >>>> WRT, patch contents:
> >>>> - please, do a proper commit message
> >>>> - while it has crucial semantic mistake (missing {}) it suddenly works
> >>>> because nothing behind the condition you had touched
> >>>> - I would rather unify conditionals, though I would like to hear from
> >>>> Alex and Dmitry if it's fine to do what you are trying to do in the
> >>>> patch
> >>>>
> >>>> --
> >>>> With Best Regards,
> >>>> Andy Shevchenko
> >>>
> >>>
> >>>
> >>> --
> >>> Cheers,
> >>> Alex Hung
>
>
>
> --
> Cheers,
> Alex Hung



-- 
With Best Regards,
Andy Shevchenko
