Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E5CE9CCCA4
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2019 22:14:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbfJEUO7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 5 Oct 2019 16:14:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:42146 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729509AbfJEUO6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Oct 2019 16:14:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1570306496;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=74m7R2QCNiRN5XO1W/NvGcgKkkecv4UuoVhWV1iP+dQ=;
        b=MoHvUZPEzSKzHDaQUEwkVufiJH/2wWth71O5KEgBuyTCUcq/c22y74Km7m3QQShCmy6kGf
        BxhyWeU36qc3xoKIwh7/WIaluXHGWVoVbNPHZT29shxh2OevuJ7BYyOOdSzjWQ6CShDe2+
        aqWsJxPner+gqMB9U4uUgqPSgbNzWyI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-238-mkO4kltBMTqrIo2aLwSs6Q-1; Sat, 05 Oct 2019 16:14:55 -0400
Received: by mail-ed1-f69.google.com with SMTP id h3so6338390edd.7
        for <platform-driver-x86@vger.kernel.org>; Sat, 05 Oct 2019 13:14:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tDL81Jt6nq7ggiYD7GVJv4TfLui66vmNV5jvA1q5UxI=;
        b=txLLSOxMQjP1toSyXeIDs2AFhEOUl/OKMznqj67IZvWyTXt4SP+p9H2cTvNnGDnwO8
         TNN0F4Mi45vKRLZ09Ea+3Dhz+w1A2qeskIL1vpypvOk2nCDXVtyr8JqFWK9TexfpJwXV
         kK/KW5cp3nPVlLI18L/cT/DAALEuB2AMlCiQbBNy3OBZFXEc4L0UR5qsgQGAYY/1+/NE
         oli9Ozuqua2cYvm3/ZJzFSjHWp/2o6oqPFNWROZquOmLEaaKsi+8mBASb2F218e1qIx0
         +MI46p8c3nLGeU31ZZt0m/XoT5B5NYWUkhJ4qz/1TFFC/eLuOcxGLubEK7x/fzvYltXz
         Z1+w==
X-Gm-Message-State: APjAAAVGDOj9g7IPepCHmzUbPqShx5IWrsy4RtjvpcpVRXLHkTesK1Mt
        ijN9y++IvrcNGxHD8I3TqUOdHtNRwIKADF2orz0u1Q1eXzBCN/2utxc/fcXWmhNENAlu9xj4NMY
        DKc7gF8WggpFTFqwfoKdIpRx1gQ3Kuwi5PQ==
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr21461289edi.75.1570306493955;
        Sat, 05 Oct 2019 13:14:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVWCrzdITY+i/ypf9AQx5ArY37dHswT/NrqAvrmx3g0SZ9rXFiUE3dKcN2ZWzo1xfXVJOhQg==
X-Received: by 2002:a50:cd1a:: with SMTP id z26mr21461273edi.75.1570306493729;
        Sat, 05 Oct 2019 13:14:53 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id c22sm2245620edc.9.2019.10.05.13.14.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Oct 2019 13:14:52 -0700 (PDT)
Subject: Re: [PATCH 5.4 regression fix] Input: soc_button_array - partial
 revert of support for newer surface devices
To:     Maximilian Luz <luzmaximilian@gmail.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20191005105551.353273-1-hdegoede@redhat.com>
 <222c364a-bc2b-5960-3fe4-7d1ce222e3e2@gmail.com>
 <96cea5be-d285-8323-1ab2-9c8e87993165@redhat.com>
 <65b265d2-f7a8-bcd7-e63f-f8efb7349324@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <ef31abf6-b3f2-f3aa-1536-3ecd5fc819e1@redhat.com>
Date:   Sat, 5 Oct 2019 22:14:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <65b265d2-f7a8-bcd7-e63f-f8efb7349324@gmail.com>
Content-Language: en-US
X-MC-Unique: mkO4kltBMTqrIo2aLwSs6Q-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 05-10-2019 17:01, Maximilian Luz wrote:
> Hi, again
>=20
> On 10/5/19 3:20 PM, Hans de Goede wrote:
>> Ok, on x86 the GPIO drivers really should all be builtin because
>> various ACPI methods including device D0 / D3 (power-on/off) methods
>> may depend on them. So normally this should never happen.
>>
>> If this (-EPROBE_DEFER on surface devices) somehow still is happening
>> please let me know and we will figure something out.
>=20
> I have never personally experienced this, only received reports which
> indicated this and that the change (as well as manually reloading
> soc_button_array) fixed it. I will come back to you if I hear anything
> in regards to this again.
>=20
> I have now also tested your patch on the Surface Book 2. Does not cause
> any issues as far as I can tell.
>=20
> Tested-by: Maximilian Luz <luzmaximilian@gmail.com>
>=20
> And if that is needed/wanted
>=20
> Acked-by: Maximilian Luz <luzmaximilian@gmail.com>

Great, thank you.

Regards,

Hans

