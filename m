Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EBA0A48AC37
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jan 2022 12:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238521AbiAKLNX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jan 2022 06:13:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:56333 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238485AbiAKLNW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 06:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641899601;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=CJn1ZsUO+57yCIA3zW0DEiH6tI8kFy3djSlOrMnh6YQ=;
        b=FCvo1UeVS2VWiqMeRDBar5MRwdL0V9A0K99kYOSgPEOR3G3Wk2iCt25o9PafHjtF+b+1iz
        yPI+egJRYH/X+IGEvDEA2ASz3HT6gb4XsKHXCM57k28V0n5uDSPJvCnxfoxHHkxbl+QhZZ
        Xn8nGdt+q9rSwltxLWV6xDa0k7FWLZI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-659-7lVQgMWkPG2eA6JKwj1xkw-1; Tue, 11 Jan 2022 06:13:20 -0500
X-MC-Unique: 7lVQgMWkPG2eA6JKwj1xkw-1
Received: by mail-pj1-f69.google.com with SMTP id v8-20020a17090a778800b001b2e6d08cd1so3164364pjk.8
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 03:13:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CJn1ZsUO+57yCIA3zW0DEiH6tI8kFy3djSlOrMnh6YQ=;
        b=BldYMtYDa1sbJS4hW4AN+j3dkWOHharrMgokZcTGrgFTiI1iJuOOm1YCufpqpvs0q7
         jI0AROfbQWB1N69P/Tn7qwpzTHhIPwdaxp6Ack/4apRs2uia9gmACSfXYaSBiUZOnmsi
         ZxauvqQhPGQtmq/hbaehx/go/En3RIGoIDlVDKhrOJ4MFMuAZzRkdXcE/JmdOiXCV6Vd
         +NfRH7Q65fsELQPvCxNMkMwhs4gUQogVOr/QSgduDb9YxW0uL0pP8mTXvbkoi9mxGdo4
         YSbRsWMkrnb0c3E1toqYExG6DPAJLNNiT0Ac7IGXDPc5gIdkA+pLzduK4CbVO3+PN+Nk
         apWg==
X-Gm-Message-State: AOAM533Mt7syz3J4S/xrWDeq+pqefXzmoMFHCsPcLPX6w0SI2bfJBKV1
        LtvlkkzZR4wZ9LEXuWcRBAjQPIIK1886gbvRjLRWk6y2AnLvF9GyBWvTQ6zKHgBSWndVvRTHIBM
        XHd8Lzv1GAxvfcMZI2O9+lydrtlxYjNpx6q6s5gyCukD5njI0Zg==
X-Received: by 2002:a17:90a:380b:: with SMTP id w11mr2568390pjb.113.1641899599514;
        Tue, 11 Jan 2022 03:13:19 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxF/JTj/8l5xS1aq99JcTum7f5Q6llZ/VZkO/th5eIeq1asWLdONyuTs3xJ58A9ZBRt+zKQEiV4xn7ogC3kXmk=
X-Received: by 2002:a17:90a:380b:: with SMTP id w11mr2568366pjb.113.1641899599281;
 Tue, 11 Jan 2022 03:13:19 -0800 (PST)
MIME-Version: 1.0
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato> <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
In-Reply-To: <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
From:   Benjamin Tissoires <btissoir@redhat.com>
Date:   Tue, 11 Jan 2022 12:13:08 +0100
Message-ID: <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Wolfram Sang <wsa@kernel.org>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Mario Limonciello <mario.limonciello@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jan 11, 2022 at 11:34 AM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi Wolfram,
>
> On 1/6/22 14:14, Wolfram Sang wrote:
> > Hi Hans,
> >
> > bumping this old thread because there might be some progress and it
> > still affects quite some people.
> >
> >> But I must be honest here, I don't see much progress being made
> >> on this until someone with a significant amount of kernel / hw-enablement
> >> experience gets it hands on one of these models. Either because some
> >
> > So, I am quite optimistic that Andrea's issue is the same one which
> > Miroslav Bendik dived into [1]. I will surely try to help with part of
> > the PIIX I2C driver, but I lack the experience with the RMI4 driver. I
> > wonder if you could have a look and maybe share your thoughts?
> >
> > Thanks and all the best,
> >
> >    Wolfram
> >
> > [1] https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com
>
> Benjamin Tissoires really is the export on the synaptics PS/2 -> switch to
> smbus mode devices, he did all the initial hw-enablement for them.
>
> Benjamin, see the email Wolfram linked above. It seems that on AMD
> laptops we have synaptics intertouch devices connected to a plain
> PIIX4 compatible I2C controller.

Oh, nice (looking at the thread). IIRC last time somebody tried to
communicate with those touchpads it wasn't working at all.

>
> So we need to either add support for SMBUS host-notify to the
> PIIX4 smbus driver (at least for AMD parts) or we need to support
> OOB IRQ signalling in the rmi4 code, assuming there is an OOB IRQ
> at all.

If the touchpad is using SMBus, we need to have Host Notify. Google
gave me the following datasheet for PIIX4
https://www.intel.com/Assets/PDF/datasheet/290562.pdf and it seems we
would need to enable something in the section 7.3.9.

However, without the hardware it's going to be tough for me to enable :/

For regular I2C touchpads, there is an OOB IRQ we can set up, but when
the devices are presented and enabled through PS/2 first, they are
using SMBus only AFAICT.

Cheers,
Benjamin

>
> I've also added Mario Limonciello from AMD's client group to the Cc,
>
> Mario, we can really use some help / insight from AMD here, both with
> the problem to detect the IO addresses of the AMD PIIX4 compatible
> smbus controller as well as with smbus host-notify support, see:
>
> https://lore.kernel.org/r/CAPoEpV0ZSidL6aMXvB6LN1uS-3CUHS4ggT8RwFgmkzzCiYJ-XQ@mail.gmail.com
>
> Regards,
>
> Hans
>

