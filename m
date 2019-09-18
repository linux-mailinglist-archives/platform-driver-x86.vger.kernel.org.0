Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 76660B6395
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Sep 2019 14:53:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731297AbfIRMx5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Sep 2019 08:53:57 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:60913 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726413AbfIRMx5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Sep 2019 08:53:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568811235;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ycL5oW5FYNJjUQjrUvcbVifqvSx3XJongUQgpzwLpv8=;
        b=Y8/6JHkIYqsuTOwuHSw1i9XXg1e5iKZiRHRdYjzNtkU8Um7B4JL4g2nxlVliB6DqdSJLwo
        0kV5p382f6O0yBGtHTqsfvAxeMNlL+Q5vOE+mUWiLyLJ0k0dlBO1zb/hCBwkxKdoWDARTK
        oHeR0C4QANYSYSBIgposVHwIqCf0O4w=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-358-WVUQzlxzP6GyFBz_7Qmf-g-1; Wed, 18 Sep 2019 08:53:54 -0400
Received: by mail-ed1-f70.google.com with SMTP id y66so4344789ede.16
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2019 05:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vszg+W+WXavX+2L9Kk3QRPhq1ht0GvDGZ0kiRY4GbPg=;
        b=tUeEYVR9y+BW6RlTY+zFOHwhPqBQssnvkLAPGIQlyisO8LpJ1hxO1oGOhSXi7VocFY
         +yzF+OzMbqqXu9nPguZiu83QhA5PrMHyH91UMF/tLmXi5AJuZrbjl3YOzCH3bGqqraym
         sV8uG4Zv/NAWe/d4jBZDG+rHD23ZITlvHxNpMKyXCgnpx5ikNokYIpBP3esns3qIUJ57
         u0fuzZd/gnFXesEO2awZgfAhz3tNY7ry/is9dLscZ/Xr8sc4pO1oFMIRW4eOhCE5dqMq
         r7UeABSfwks1BimoCdwurMFFsnz9teQ89hvGZgfpUrPaBRdZof6kthsSlVjzGFE1RAnA
         Yl0A==
X-Gm-Message-State: APjAAAUPCdnOEnkuANBVUfJk9BeUK5EK6ZAAXEwOOLtXTDhmaRd4bI8S
        u3fgjI7BYCSpRhiyhkgSlatilkzsKMZFa6lnAqVwb2wlkNefFpm9V696qu3KOMEz4UIRM9Gp0c5
        DO4vfn5nl/DTEBzO+i56ga2UlBjDspculhA==
X-Received: by 2002:a05:6402:1688:: with SMTP id a8mr1250409edv.225.1568811233191;
        Wed, 18 Sep 2019 05:53:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwkPtdTN1u+9c+esJNyeY2qigBbptrNK5/lYQVegkGY+1YkDa/JNljIAQa6OK+N4D9KWvBPng==
X-Received: by 2002:a05:6402:1688:: with SMTP id a8mr1250393edv.225.1568811233017;
        Wed, 18 Sep 2019 05:53:53 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id s21sm1035118edi.85.2019.09.18.05.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 05:53:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <20190918113835.GA16243@kuha.fi.intel.com>
 <20190918115251.GA28946@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <61df124e-18fc-c047-5490-a6b79cbed85c@redhat.com>
Date:   Wed, 18 Sep 2019 14:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190918115251.GA28946@jeknote.loshitsa1.net>
Content-Language: en-US
X-MC-Unique: WVUQzlxzP6GyFBz_7Qmf-g-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 18-09-2019 13:52, Yauhen Kharuzhy wrote:
> On Wed, Sep 18, 2019 at 02:38:35PM +0300, Heikki Krogerus wrote:
>> On Tue, Sep 17, 2019 at 10:45:07PM +0300, Yauhen Kharuzhy wrote:
>>> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
>>> hardware has TypeC connector and register related devices described as
>>> I2C connections in the _CRS resource.
>>>
>>> There is at least one hardware (Lenovo Yoga Book YB1-91L/F) with micro
>>> USB B connector exists. It has INT33FE device in the DSDT table but
>>> there are only two I2C connection described: PMIC and BQ27452 battery
>>> fuel gauge.
>>>
>>> Splitting existing INT33FE driver allow to maintain code for USB type B
>>> (AB) connector variant separately and make it simpler.
>>
>> Sorry, but "Type B" is even more confusing here. Type B refers to the
>> Standard-B USB connector, so _not_ the micro connector family. You can
>> check the connector definitions from the latest USB 3.2 specification.
>> The standard-b definition goes something like this:
>>
>>          "The standard _Type-B_ connector defined by the USB x specifica=
tion."
>>
>> Note that all the five supported connectors are listed in ch5
>> "Mechanical":
>>
>>          Standard-A
>>          Standard-B
>>          Micro-B
>>          Micro-AB
>>          Type-C
>>
>> So what was the problem with names that refer to the micro connector
>> family, for example "micro-ab" or "micro-b"?
>=20
> Only one problem: there is no difference between micro B, micro AB, mini
> B or Standard-B types of connectors from this driver point of view =E2=80=
=93 all
> of them can be used for device charging. Now we have only two kind of
> hardware with INT33FE pseudo-device: with Micro-B and Type-C connectors
> but other kind may exist. TypeB is not standartized but it seemed to me
> a good generalization of "USB connectors to charger connection but not
> Type-C". No problem to change it to other suitable name, 'simple', 'dumb'=
,
> 'non-TypeC' or 'micro-B'. All this names are not ideal.

Since the one non Type-C connector device we has has a micro-B I would just
call the file drivers/platform/x86/intel_cht_int33fe_microb.c and be done
with it.

Regards,

Hans

