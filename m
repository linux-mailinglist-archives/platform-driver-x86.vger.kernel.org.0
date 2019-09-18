Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9E64DB6D52
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 Sep 2019 22:12:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391138AbfIRUMu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 Sep 2019 16:12:50 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:27465 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2391132AbfIRUMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 Sep 2019 16:12:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568837569;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=v9sv0DKh9f3NsnbGXTaL3YG4I+eX8M5sU84IvrSpMY0=;
        b=LDFxYat3YEvnErE7MdVDnIVgH9oepFygUSM78lBKYqRAfx0uC+Qu6YH6jEiIZVggoZhx1v
        0q5akxPDfDFoBA9wdQmziEhhX8CkP0aSNDBVT40qF3vAfdsMaZWXX8SFG/hSVKg2zE0jn4
        ckmmOehv3UlP4K/XIMGvQYaaMPkTBRw=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-148-WyR8Jij_NG-WWMskpwQRXA-1; Wed, 18 Sep 2019 16:12:47 -0400
Received: by mail-ed1-f70.google.com with SMTP id c23so475487edb.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 Sep 2019 13:12:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=De9bpu85iWCrg9FOtrMaR9Am6eWZHF17S1auesNwPzs=;
        b=ZlZwX0SAxXvO2E8WMWjz6j09rzEfeUQeoB50FIfGAtkMEHjLYvLkeAIZodK9aK+Kyk
         WLQ54sEgViT1HhSJvUkGf3fvxeTbz95Nc6MxWCQCHGQioWa5BCHA6nd5L/9dQpUHLV2E
         47+qjQyeyljQpBf8F9h31ADmhIHe926y4/zkOlyUub0XQy5rAfaZARSwBoKBtTkb0nRM
         +YYUTS4tVinGIFnHPNKRt+CdCZUht+h7oFOP2SgUZGihgeU40yAHUGFIHa/0tPTqACl7
         J5KdYrZFou93pNDpctD+OcCaSF+DqU0odR2aoY03VaHiwcXY1lit/mzbKp7hIl3g4Sv/
         Y6bg==
X-Gm-Message-State: APjAAAW7EAhpWQwNHmZFakk6HCuBPicTZIUzsebUWgMiGbEpgzEWbI/E
        ASKBtpHzDS8JYuvqfOyUdYQAkUUfm4lXMA51wRIbG0L2GV1NFg1qMJlZFShs/8waSPlR3d/9sOE
        81C7/CsEKg1SbsLRsoTV8EPRCfYvgb93TMg==
X-Received: by 2002:a50:9eee:: with SMTP id a101mr12230232edf.128.1568837565940;
        Wed, 18 Sep 2019 13:12:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyslwNM3rIG3aZMTd6CcIy0InQkvmt8LC0hs3cL6s31VQkeyNAAShugVbzD6QWLrZr87sFuxQ==
X-Received: by 2002:a50:9eee:: with SMTP id a101mr12230211edf.128.1568837565727;
        Wed, 18 Sep 2019 13:12:45 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id i63sm1221905edi.65.2019.09.18.13.12.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Sep 2019 13:12:45 -0700 (PDT)
Subject: Re: [PATCH v2 1/1] platform/x86/intel_cht_int33fe: Split code to USB
 TypeB and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>
References: <20190917194507.14771-1-jekhor@gmail.com>
 <20190917194507.14771-2-jekhor@gmail.com>
 <f578a65b-af02-5fe8-dd59-9918c000da64@redhat.com>
 <20190918114224.GA23318@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <029c7865-b9b3-1e58-7092-6d8495de0116@redhat.com>
Date:   Wed, 18 Sep 2019 22:12:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190918114224.GA23318@jeknote.loshitsa1.net>
Content-Language: en-US
X-MC-Unique: WyR8Jij_NG-WWMskpwQRXA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 18-09-2019 13:42, Yauhen Kharuzhy wrote:
> On Wed, Sep 18, 2019 at 11:20:21AM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 17-09-2019 21:45, Yauhen Kharuzhy wrote:
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
>>>
>>> Split driver to intel_cht_int33fe_common.c and
>>> intel_cht_int33fe_{typeb,typec}.c. Compile all this source to one .ko
>>> module to make user experience easier.
>>>
>>> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
>>
>> Thank you for doing this, this version looks much better IMHO.
>>
>> Note that this does not apply to Linus' current master, please
>> rebase. Specifically this conflicts with this patch:
>>
>> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commi=
t/?id=3D78cd4bf53635d3aeb73435bc89eb6eb39450f315
>>
>> Which just got merged. Instead of rebasing on Linus' master
>> (which is always a bit adventurous to use during the merge window)
>> you can also cherry-pick that single commit on top of v5.3
>> and use that as a base.
>>
>> Note that that patch makes changes to struct cht_int33fe_data
>> specifically it drops the:
>>
>> =09struct fwnode_handle *mux;
>>
>> Member, so when rebasing you should drop that in the new
>> version of the struct on common.h .
>>
>> Besides that this need a rebase, overall this looks good, I have some
>> small remarks inline:
>=20
> Arghh.. OK, I have rebased the patch but at current torvalds kernel
> i2c_acpi_new_device() fails with -EPROBE_DEFER at my hw, so I cannot chec=
k if it
> is fully working. But I will resend patch anyway soon, this error should
> not be related to the patch content.

Are you sure it is not working? -EPROBE_DEFER is normal(ish) it just means
that the i2c-controller driver for the bus has not initialized yet.

If you are building the i2c_designware or acpi_lpss drivers as module, or i=
f
you are building the intel_cht_int33fe code into the kernel, then this
is more or less expected to happen.

You can do "ls /sys/bus/i2c/devices" to check if it did succeed on
later re-probe attempts (the fuel-gauge device should be there if
things succeeded).

And you should probably do one more version, suppressing the dev_err
on -EPROBE_DEFER like e.g. this snippet from the typec code:

         if (fusb302_irq < 0) {
                 if (fusb302_irq !=3D -EPROBE_DEFER)
                         dev_err(dev, "Error getting FUSB302 irq\n");
                 return fusb302_irq;
         }

Regards,

Hans




>=20
>>> +=09data->hw_type =3D ret;
>>> +=09data->dev =3D dev;
>>> +
>>> +=09switch (data->hw_type) {
>>
>> I suggested adding hw_type to data so that it could be used to
>> select the right remove function in cht_int33fe_remove(),
>> since you are using a remove function pointer in data for this
>> (which is fine), there is no reason to store hw_type in
>> cht_int33fe_data anymore, please drop this and change the
>>
>> =09switch (data->hw_type) {
>>
>> to:
>>
>> =09switch (ret) {
>=20
> OK, sure
>=20
>>
>> p.s.
>>
>> I've done the rebase myself and I'm building a kernel with my re-based v=
ersion of this
>> patch to test it on a typec device. I will get back to you with the resu=
lts
>> (I expect things will just work, just making sure).
>>
>=20

