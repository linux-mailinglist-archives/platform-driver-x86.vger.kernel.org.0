Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3253234CA9
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 23:06:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgGaVGa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 17:06:30 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:12801 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726884AbgGaVG3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 17:06:29 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2487760000>; Fri, 31 Jul 2020 14:04:54 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 14:06:28 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Fri, 31 Jul 2020 14:06:28 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 21:06:28 +0000
Subject: Re: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "mario.limonciello@dell.com" <mario.limonciello@dell.com>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <20200731202154.11382-2-ddadap@nvidia.com>
 <fsd8MQGEGF_h1zzuA1-3WGloDVdnVydyrpBvaUzkXZsb6ert8azm82EXgKOI3kp7O3frRedkvguBCYCf6k-Jnk0kkaSNSH9Ga_FG6Yziq6E=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <857ce3e9-8bac-c397-f3b0-b8c2261d0b12@nvidia.com>
Date:   Fri, 31 Jul 2020 16:08:03 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <fsd8MQGEGF_h1zzuA1-3WGloDVdnVydyrpBvaUzkXZsb6ert8azm82EXgKOI3kp7O3frRedkvguBCYCf6k-Jnk0kkaSNSH9Ga_FG6Yziq6E=@protonmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596229494; bh=5KqaESa0VC0cIH440ydNu2PIBSSkwuQq0cdXHRZf9Do=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=F9vUYE/RQnU+0bFG32sj9T1c2rgTZw1NtGZstUQYMkkBA6FG9AhkVHXfeHXlTHVqk
         CqIxuIMiGyzmTQlIpA95nmrYX4FOO2EoXO6AHJMO96t9OrJVIjhsfTEN5s7qLuY4UC
         gu6WOGOX3nSe45xCxumZR/+0Ldi1OXIqWjafoN62iu5Fdw6yct4ljV60Vp0hXKBh/W
         UndCjwqBF/SphNJbL2di0ei7teP9NBLKT/A08Bsk+UCn/HT9Hhhr8yUoslvpWQJJUw
         Mv/nAd+/pgbcOcJ0kTpvIGcruOStQV4pxjRFRCSkuZQ2CFxevCeXbtNZDO4LOxHaDF
         PrbydEx2KOvPg==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/31/20 3:56 PM, Barnab=C3=A1s P=C5=91cze wrote:
>
> 2020. j=C3=BAlius 31., p=C3=A9ntek 22:21 keltez=C3=A9ssel, Daniel Dadap <=
ddadap@nvidia.com> =C3=ADrta:
>> If a driver registers with WMI, and none of the GUIDs in its ID table
>> is present on the system, then that driver will not be probed and
>> automatically loaded. However, it is still possible to load such a
>> driver explicitly on a system which doesn't include the relevant
>> hardware.
>>
>> Update wmi_driver_register to test for the presence of at least one
>> GUID from the driver's ID table at driver registration time, and
>> fail registration if none are found.
>>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   drivers/platform/x86/wmi.c | 18 ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>
>> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
>> index 941739db7199..19aa23d1cf8e 100644
>> --- a/drivers/platform/x86/wmi.c
>> +++ b/drivers/platform/x86/wmi.c
>> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, stru=
ct wmi_block **out)
>>        return false;
>>   }
>>
>> +static bool find_driver_guid(const struct wmi_driver *wdriver)
>> +{
>> +     const struct wmi_device_id *id;
>> +
>> +     if (wdriver =3D=3D NULL)
>> +             return false;
>> +
>> +     for (id =3D wdriver->id_table; *id->guid_string; id++) {
>> +             if (find_guid(id->guid_string, NULL))
>> +                     return true;
>> +     }
>> +
>> +     return false;
>> +}
>> +
>>   static const void *find_guid_context(struct wmi_block *wblock,
>>                                      struct wmi_driver *wdriver)
>>   {
>> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device *=
device)
>>   int __must_check __wmi_driver_register(struct wmi_driver *driver,
>>                                       struct module *owner)
>>   {
>> +     if (!find_driver_guid(driver))
>> +             return -ENODEV;
>> +
>>        driver->driver.owner =3D owner;
>>        driver->driver.bus =3D &wmi_bus_type;
>>
>> --
>> 2.18.4
>
>
> Can you elaborate as to why this change in behaviour of the wmi
> driver is needed? If I understand it correctly you want to prevent
> WMI drivers from successfully loading when there are no matching
> GUIDs. Is that correct?


Currently, a driver that registers with WMI can be explicitly loaded,=20
even on a system that lacks the relevant hardware. It's not a huge deal=20
if this happens, since most people won't bother explicitly loading a=20
driver their system can't use, and since the probe routine will never be=20
called, the module just sits around uselessly loaded into the kernel. I=20
discovered this behavior when testing the version of the patch reworked=20
to register with WMI, and thought it would be nice to not allow useless=20
modules to be loaded, but if anybody disagrees with this change, it's=20
certainly not essential, and I'm happy to leave the behavior the way it=20
currently is.


>
> Barnab=C3=A1s P=C5=91cze
>
