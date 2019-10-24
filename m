Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id D7920E2BCA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 24 Oct 2019 10:09:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438026AbfJXIJs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 24 Oct 2019 04:09:48 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23817 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725977AbfJXIJr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 24 Oct 2019 04:09:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571904585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=BeX4D8O9z+tVBCKqcGZcr5ign6JXERCJLYcp/HFmwQY=;
        b=b2d5X7p2S0e5edym/MFUCJwObG8BLOB1kAA2IcyKpAhjuiMF1v6SfNaj8DpLp1ECNBzQ1/
        WFkSx0gGCszpQv31gN8oX5Iq4ctm4PLaSULSND4isS/EQfzNjgIcA3SIatL3p8VLVSmkAG
        vqkqGwr/r7uqrLiaUZOZJafNAjg1rME=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-PUAmjVe5PbGhAjut2ZYRIQ-1; Thu, 24 Oct 2019 04:09:44 -0400
Received: by mail-wm1-f71.google.com with SMTP id i23so549044wmb.3
        for <platform-driver-x86@vger.kernel.org>; Thu, 24 Oct 2019 01:09:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=F8182UJbr670CLsPagPoudZb9pdwLWvpPAyPH6nj5ZE=;
        b=EgPt/hCUDwlOBKkHhEgMlRv2qo+Of5WkiE4KysiGdgSnth8Pu5AlyWvNdJxU0F4sqf
         ROEcRF4i7lGod49tzyjhRMf591LeMN+gUEYGwNo+fsPEL1J8ZXNwAm5Rvhkgv/+vuJMY
         pEK9SBY9XaEo0F/i2wJNkTGIyVgM2d4tyoVtG2a69cfTN6kuinmslR6Db4ENSMgdtDUi
         DzSE1rNYko4WfM4VDrupj9/clp4lq1KemlE2MTcvcI9rYmCz5UvCOZIlQNDslswTPaWC
         mkPCK6B9jB11c5NCuA8IrdfDepX8kQiZGQLI9F96Z8G7Mw2CLaQqA0vU0KQQqinDXVlP
         YoJg==
X-Gm-Message-State: APjAAAXcwTCFGrOc+YQ54hUNtrUJr5ZiG+KjQzDO3eTMgAOLC0gzbG/w
        62cwfQuaTq60EvJsz8TP8KtO6D7bs+jwxtNVP9wquhBly94vuuyGvF3TpS9Z48Ksj8OWG/ow2Z2
        kVVA0RX3htjc7DLy5nkO0FmOnCW/IJOHq5g==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr2392134wrv.99.1571904583067;
        Thu, 24 Oct 2019 01:09:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyKZOyZYyIUZdVQo/tZ2TZK5072qWStDiP0lwOfbyMiILgwgIpJZBlmoNkgpPMnERM/NoB8nQ==
X-Received: by 2002:a5d:54c7:: with SMTP id x7mr2392118wrv.99.1571904582820;
        Thu, 24 Oct 2019 01:09:42 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id w22sm1557244wmc.16.2019.10.24.01.09.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Oct 2019 01:09:42 -0700 (PDT)
Subject: Re: [PATCH resend] Add touchscreen platform data for the Schneider
 SCT101CTM tablet
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Daniel Gorbea Ainz <danielgorbea@hotmail.com>
References: <20191023185323.13552-1-hdegoede@redhat.com>
 <CAHp75VfhKzXfJEwHLdkwJHPXmL6bCRMtvo-0aCSQxdiHQyXHHQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <1274f8b7-234b-1af4-0715-b47018d96946@redhat.com>
Date:   Thu, 24 Oct 2019 10:09:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfhKzXfJEwHLdkwJHPXmL6bCRMtvo-0aCSQxdiHQyXHHQ@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: PUAmjVe5PbGhAjut2ZYRIQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 23-10-2019 21:08, Andy Shevchenko wrote:
> On Wed, Oct 23, 2019 at 9:53 PM Hans de Goede <hdegoede@redhat.com> wrote=
:
>>
>> From: Daniel Gorbea Ainz <danielgorbea@hotmail.com>
>>
>> Add touchscreen platform data for the Schneider SCT101CTM tablet
>=20
> Thanks, now patchwork sees it.
>=20
>> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
>=20
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>=20
> I'm not sure you need to put Rb when you have your SoB.
> Do you think it's fine if I remove Rb when applying?

I believe having a r-b here is fine, but if you want to remove
it that is fine with me too.

Regards,

Hans




>=20
>> ---
>> hdegoede: Resend from my email address as vger.kernel.org does not like
>> Daniel's emails
>> ---
>>   drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>>   1 file changed, 26 insertions(+)
>>
>> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x=
86/touchscreen_dmi.c
>> index 8bfef880e216..ba494ace83d4 100644
>> --- a/drivers/platform/x86/touchscreen_dmi.c
>> +++ b/drivers/platform/x86/touchscreen_dmi.c
>> @@ -549,6 +549,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p1=
006w_v10_data =3D {
>>          .properties     =3D pov_mobii_wintab_p1006w_v10_props,
>>   };
>>
>> +static const struct property_entry schneider_sct101ctm_props[] =3D {
>> +       PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
>> +       PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
>> +       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
>> +       PROPERTY_ENTRY_STRING("firmware-name",
>> +                             "gsl1680-schneider-sct101ctm.fw"),
>> +       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
>> +       PROPERTY_ENTRY_BOOL("silead,home-button"),
>> +       { }
>> +};
>> +
>> +static const struct ts_dmi_data schneider_sct101ctm_data =3D {
>> +       .acpi_name      =3D "MSSL1680:00",
>> +       .properties     =3D schneider_sct101ctm_props,
>> +};
>> +
>>   static const struct property_entry teclast_x3_plus_props[] =3D {
>>          PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>>          PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
>> @@ -968,6 +986,14 @@ const struct dmi_system_id touchscreen_dmi_table[] =
=3D {
>>                          DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>>                  },
>>          },
>> +       {
>> +               /* Schneider SCT101CTM */
>> +               .driver_data =3D (void *)&schneider_sct101ctm_data,
>> +               .matches =3D {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
>> +               },
>> +       },
>>          {
>>                  /* Teclast X3 Plus */
>>                  .driver_data =3D (void *)&teclast_x3_plus_data,
>> --
>> 2.23.0
>>
>=20
>=20

