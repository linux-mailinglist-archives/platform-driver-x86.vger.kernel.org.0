Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F33748C407
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jan 2022 13:31:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1353149AbiALMb3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jan 2022 07:31:29 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:30858 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240498AbiALMb1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jan 2022 07:31:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641990686;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tpJ4zcL8zME16M97y3IC2Y4DEC9svpHZ7qIBIrbUhks=;
        b=SDyh9VLbEUEIZ951TFQDMHokzf8oT5Xd0jGvD0eKR2iHon5s8vkvtCp/HbEmVB/1AOaTM1
        a3u5YEsC2bpbhysaR1+i1MLjnJJekWP04mb9oy7Z1zSbQbTHAxiUO1Uq0eiOAI4tOR8HRf
        rIdvF8HpZ0FRn7r6GdysBtDEpUVRGsc=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-32-0NxmVLxqOE26mkR87NPC6g-1; Wed, 12 Jan 2022 07:31:25 -0500
X-MC-Unique: 0NxmVLxqOE26mkR87NPC6g-1
Received: by mail-ed1-f71.google.com with SMTP id x19-20020a05640226d300b003f8b80f5729so2102872edd.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jan 2022 04:31:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=tpJ4zcL8zME16M97y3IC2Y4DEC9svpHZ7qIBIrbUhks=;
        b=f5x/kmUOk7wtatajpeoxvJj7s0Cuk11DqJQwW0FUkhz4v09Y8yneRu8geDJ7lmDbdX
         A9+rzsKjdK5WPcjbv6fBXuMb+qH6L7ezqSORviZg5Ag7XR0B37RKABIzjIMAKGZvqZx4
         WrIVPp9ZDnT/GrsGJNBRaDukdQY1ysEp89UPGUNa6/P5XpvLwUj3otLTusn75LiBXmf+
         yzEhZcwjPMramI28J6AInClIXpgvdWEGCChJT6quHCrIhSXG/n9u3O74E046edvNE6/W
         wtgAAHkL1QUdrVwdztYZxIG37AzTrUlFUVRBC+UCw6Ku0oVKMmhja4DpDgPrCE0Y9vEA
         KBmQ==
X-Gm-Message-State: AOAM532SJUhphX32TLqylfuOFjRZxYKUWxWpMu85+X+tV2HnallBoS/E
        x2CLR0L38qX7BTVqWQpNbvPgDcg2VwDg5BNmx+QOEgmO1EVl91hikw8QIARAsMdvnGUYXDz872I
        aL//GFOaxpbPT3pcgRuZCH+TzrPEGrGX98g==
X-Received: by 2002:a17:906:b854:: with SMTP id ga20mr7356647ejb.605.1641990683834;
        Wed, 12 Jan 2022 04:31:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyLf12Kfn3ZQIzFIrLAhx6O3rrxDsG8k2/3avuyLvm56f0J0xGRmpemO3K3JdMIsJbzPJ6Q3A==
X-Received: by 2002:a17:906:b854:: with SMTP id ga20mr7356636ejb.605.1641990683644;
        Wed, 12 Jan 2022 04:31:23 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id w17sm705292edr.68.2022.01.12.04.31.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jan 2022 04:31:23 -0800 (PST)
Message-ID: <8a693ece-5466-69b9-4d9a-2f1cef0a5ae2@redhat.com>
Date:   Wed, 12 Jan 2022 13:31:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: Touchpad stickiness on AMD laptops (was Dell Inspiron/XPS)
Content-Language: en-US
To:     Wolfram Sang <wsa@kernel.org>,
        "Limonciello, Mario" <mario.limonciello@amd.com>,
        Benjamin Tissoires <btissoir@redhat.com>,
        Andrea Ippolito <andrea.ippo@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Alex Hung <alex.hung@canonical.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        "open list:HID CORE LAYER" <linux-input@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Shah, Nehal-bakulchandra" <Nehal-bakulchandra.Shah@amd.com>
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
 <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com> <YdbrLz3tU4ohANDk@ninjato>
 <42c83ec8-bbac-85e2-9ab5-87e59a679f95@redhat.com>
 <CAO-hwJJ9ALxpd5oRU8SQ3F65hZjDitR=MzmwDk=uiEguaXZYtw@mail.gmail.com>
 <5409e747-0c51-24e2-7ffa-7dd9c8a7aec7@amd.com> <Yd6SRl7sm8zS85Al@ninjato>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Yd6SRl7sm8zS85Al@ninjato>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/12/22 09:33, Wolfram Sang wrote:
> Hi Mario,
> 
> thanks for joining the discussion!
> 
>> 1) Systems returning SMBUS address 0xff
>>
>> The address can be potentially be returned using port I/O or it can be done
>> using MMIO.
>>
>> There is already a thread in process to add support for MMIO, but last I
>> heard it's waiting for review comments.
>>
>> https://lore.kernel.org/all/20210715221828.244536-1-Terry.Bowman@amd.com/
> 
> This thread is under active discussion again.
> 
>> Now something else interesting - the SMBUS controller in these laptops often
>> is listed in the ACPI tables on IRQ7 with a _HID of SMB0001.
> 
> IIRC tests done by Miroslav showed that interrupt 7 was used for
> completing SMBus Block transfers and alike, but not for HostNotify. He
> suspects this is wired via GPIO somehow.

I expect host-notify to use IRQ7 too, but that it first needs to be
enabled by poking some registers in the SMBUS controller.

Regards,

Hans

