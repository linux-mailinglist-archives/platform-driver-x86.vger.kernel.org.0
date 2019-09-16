Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A3044B36A3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Sep 2019 10:52:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728386AbfIPIwG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Sep 2019 04:52:06 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:52265 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728134AbfIPIwG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Sep 2019 04:52:06 -0400
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Mon, 16 Sep 2019 04:52:06 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568623925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lonZJ/LTG1kDBKj3inCy2hB5xc4kCJZfEkfoBnlXoGk=;
        b=R3fef8yHldq9CkBuokTDFrwGOKc0pIA3N6/5fngwckLzukRtYlwXUZNnKuu0YD4ERaLkyg
        rKBOo19VSbc1FnqNu5nPqk6Q83tjsTunYB94tF0aVTUKU9Kk5DytkAoHWYAIV4UggzKL08
        yHTaXRL3EXs4NIB1XuP+bQ4rDJob00s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-176-q9mvUiZuNxmARxUnXoQEmQ-1; Mon, 16 Sep 2019 04:45:16 -0400
Received: by mail-ed1-f71.google.com with SMTP id 34so22009390edf.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Sep 2019 01:45:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pD4UOSjXtHTUQ4fN7C/i4PVjYFoFlhSPJ44y0t1okLU=;
        b=X1mMZgdASkZph1hviPzrOfdmxycUhrZ2RTwuctiREMfA+9/IAs7ZELegZ83u7tRK9h
         TnN2PtUsB6kJXic9lCvH8dyNDpNlp9GcdWIG0xCt6ab6+JqshBPap27gQ9HwRxUimOwg
         peftxpOrv0vx+CG5RfXUlNhavvG6PNd6QoRUfgqGnOiQFpGeIhsK5gCkPF3IKlPhPJO6
         B8FIEhkgeOF7JVH3+V7ceWi1+kHvTWVO/4ho6YFtvOzcFh5gguUBHB+ztsxpXFieHqBX
         h+9M7pMGjdjHPNS3L2MaNVSGxzbKOxSDGCRMEnY/QNSkd1j+YTx8pzsjbBEGYA7DibLW
         aMOg==
X-Gm-Message-State: APjAAAXmBEaagF8pv3TenhRHAj8ZaLSH3dkiZPIZiCS2FKLNTQwHecAn
        ZMWdom/sTxa7DEFu0dvSLRaCegmLS+YLTjsqTpA7HnTTzO37TBZvsqP2nkDvU/Mhf7PRt1QLelz
        5GFMH1/3TrTkKM+pk8Pkj89OqYFCxXJZEVA==
X-Received: by 2002:a17:906:b298:: with SMTP id q24mr980728ejz.168.1568623515539;
        Mon, 16 Sep 2019 01:45:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxeNVNCewaiqx6Tu5Xw9DyGWhhMba5n5oyMWjqr/x599UVVYgE9wrgGOHhTtr8gIUZeNJVVSg==
X-Received: by 2002:a17:906:b298:: with SMTP id q24mr980716ejz.168.1568623515343;
        Mon, 16 Sep 2019 01:45:15 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id 7sm4155340ejh.81.2019.09.16.01.45.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Sep 2019 01:45:14 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to microUSB
 and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
 <20190809145135.GC30248@jeknote.loshitsa1.net>
 <13391bf6-b8d2-83ce-2bca-1c359829938f@redhat.com>
 <20190915195526.GA14558@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <32e4f7cc-df65-dcc5-adaa-5dcd63b3bfde@redhat.com>
Date:   Mon, 16 Sep 2019 10:45:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20190915195526.GA14558@jeknote.loshitsa1.net>
Content-Language: en-US
X-MC-Unique: q9mvUiZuNxmARxUnXoQEmQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 15-09-2019 21:55, Yauhen Kharuzhy wrote:
> Hi,
>=20
> Sorry for last answer, I didn't notice your answers. I have returned to
> this project now for some time.
>=20
> On Mon, Aug 12, 2019 at 07:11:07PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> On 09-08-19 16:51, Yauhen Kharuzhy wrote:
>>> On Fri, Aug 09, 2019 at 12:49:27PM +0200, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> Overall this looks good, thank you for your work on this.
>>>>
>>>> I have some small remarks inline / below:
>>>>> +EXPORT_SYMBOL_GPL(cht_int33fe_check_hw_compatible);
>>>>> +
>>>>> +MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device dr=
iver (common part)");
>>>>> +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
>>>>> +MODULE_LICENSE("GPL v2");
>>>>
>>>> I see from the Makefile changes that you are linking the common code
>>>> into both intel_cht_int33fe_typec.ko and into intel_cht_int33fe_musb.k=
o, that is fine
>>>> since it is tiny and not worth the trouble of creating its own .ko fil=
e for.
>>>
>>> No, this Makefile fragment adds two targets for every config variables,
>>> and intel_cht_int33fe_common.c compiles into one .ko file even if it wa=
s
>>> added twice
>>
>> Ah right, I misread it. But adding a new ko file just for the one helper=
 function
>> seems like massive overkill, the overhead will be quite big and on most =
systems
>> all 3 .ko files will end up getting loaded anyways, so we should probabl=
y try to
>> reduce the number of ko files here.
>=20
> Sounds reasonable.
>=20
>>
>>>> I do wonder what happens if you set the Kconfig value for both modules=
 to Y,
>>>> since that will like put the common code twice in the builtin.a file, =
I guess / hope
>>>> ar is smart enough to only add it once, but I'm not sure... can you pl=
ease give
>>>> this a try?
>>>
>>> For both Y it should be OK, but for one M and one Y... OK, it need to b=
e
>>> corrected.
>>
>> How about moving the entire helper function into intel_cht_int33fe_commo=
n.h as
>> static inline ... then both remaining .ko files get a private copy but s=
ince it is
>> small that is fine. This nicely solves the need for a third .ko file and=
 also
>> problems with one of the Kconfig options being builtin and the other bei=
ng modular.
>=20
> Yes, but this header file will contain relative big piece of code which
> will be included to modules and compiled twice.
>=20
> I think that I will use this approach and will move to separate module
> only when other common functions will be added.

thinking more about this, since both modules will have the same
acpi_device_id table they will both get auto-loaded anyways.

So how about the following:

1) We put a single struct platform_driver in the common bits
2) We create a new shared struct cht_int33fe_data in intel_cht_int33fe_comm=
on.h
    which has all the data members needed by both variants, e.g. just put t=
he
    intel_cht_int33fe_typec.c struct cht_int33fe_data definition in the com=
mon
    header and rename max17047 to the  more generic battery_fg used by the =
musb code.
    And add an enum int33fe_hw_type hw_type field to this struct
3) Have the typec and musb .c files export their probe + remove function
    (make them non-static add prototypes to common.h)
4) Add a new probe to the common.c file which does the usual checks and
    figures out hw_type. It then devm_kzalloc-s the struct, sets hw_type in=
 the
    struct and calls the right actual probe function depending on the board=
.
5) Add a new remove function to the common.c file which calls the right rem=
ove
    function based on the hw_type in the data struct.

And we build all 3 .c files into a single module (since if we have multiple
modules they will all get loaded anyways). I think this is the cleanest / b=
est
approach and it also answers the question of what to name the Kconfig optio=
ns,
since if we do as I suggest above we just stick with the single Kconfig opt=
ion
we already have.

Regards,

Hans

