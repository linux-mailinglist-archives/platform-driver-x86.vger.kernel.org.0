Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F41D234D4A
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 Jul 2020 23:47:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgGaVrU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 31 Jul 2020 17:47:20 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:4024 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbgGaVqS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 31 Jul 2020 17:46:18 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f2490fb0000>; Fri, 31 Jul 2020 14:45:31 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Fri, 31 Jul 2020 14:46:18 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Fri, 31 Jul 2020 14:46:18 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Fri, 31 Jul
 2020 21:46:17 +0000
Subject: Re: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when
 no GUID is found
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "pobrn@protonmail.com" <pobrn@protonmail.com>
CC:     "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "aplattner@nvidia.com" <aplattner@nvidia.com>
References: <DM6PR19MB2636AB267CD321DE40EF324AFA730@DM6PR19MB2636.namprd19.prod.outlook.com>
 <20200731202154.11382-1-ddadap@nvidia.com>
 <20200731202154.11382-2-ddadap@nvidia.com>
 <DM6PR19MB26369DD7B9037D6E2C91B33DFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <4780a14a-9454-f519-da2a-4a83bbeee9ca@nvidia.com>
Date:   Fri, 31 Jul 2020 16:47:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26369DD7B9037D6E2C91B33DFA4E0@DM6PR19MB2636.namprd19.prod.outlook.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596231931; bh=TA6R8zLJZXAMXTFtVV/t1CMSUASGkMArM8HBnND/8iE=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=pYRY2QO63TM2oSRmc3BSBMsNUH/Qzo/xKshibwNPyIQlpl/VIsiYgMI7uu2QZzfv0
         eKZPJgmNNX0/mfftdaWR/rj/nW1QxgwplRwWZOGTbWUlH/8UOsyvryX4e4aKBR86Fg
         EsYz75+gjh8m/vpFfmFgFA5mxJ7utvEXWAC/sSZdmtCg6b5OcyN+dYg/XM/N08+rks
         uR/VpPjVdKyQLYIfHinby89zbGqLnbB7ZoJ7W/qP6S6PZx4bmhOyyP8Hf4YlvDEcXP
         78kedv1j0wzy9OQc0Wfd59zK2cOaXda0MacD/vhOa5kjx1YMswb/apuDl1hJ/Q/z8t
         zrV3JF4SzGDvQ==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/31/20 3:52 PM, Limonciello, Mario wrote:
>> -----Original Message-----
>> From: Daniel Dadap <ddadap@nvidia.com>
>> Sent: Friday, July 31, 2020 3:22 PM
>> To: platform-driver-x86@vger.kernel.org; Limonciello, Mario;
>> pobrn@protonmail.com
>> Cc: andy@infradead.org; dvhart@infradead.org; aplattner@nvidia.com; Daniel
>> Dadap
>> Subject: [PATCH v2 2/2] platform/x86: wmi: fail wmi_driver_register when no
>> GUID is found
>>
>>
>> [EXTERNAL EMAIL]
>>
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
>> @@ -130,6 +130,21 @@ static bool find_guid(const char *guid_string, struct
>> wmi_block **out)
>>        return false;
>>   }
>>
>> +static bool find_driver_guid(const struct wmi_driver *wdriver)
>> +{
>> +     const struct wmi_device_id *id;
>> +
>> +     if (wdriver == NULL)
>> +             return false;
>> +
>> +     for (id = wdriver->id_table; *id->guid_string; id++) {
>> +             if (find_guid(id->guid_string, NULL))
>> +                     return true;
>> +     }
>> +
>> +     return false;
>> +}
>> +
> As a point of preference, why not in this function return -ENODEV directly
> rather than it be boolean and map all errors to -ENODEV?


Sure, if others think this behavior change is useful/desirable, I'd be 
happy to change find_driver_guid() to return an error code directly, and 
maybe return -EINVAL in the wdriver == NULL case.


>>   static const void *find_guid_context(struct wmi_block *wblock,
>>                                      struct wmi_driver *wdriver)
>>   {
>> @@ -1419,6 +1434,9 @@ static int acpi_wmi_probe(struct platform_device
>> *device)
>>   int __must_check __wmi_driver_register(struct wmi_driver *driver,
>>                                       struct module *owner)
>>   {
>> +     if (!find_driver_guid(driver))
>> +             return -ENODEV;
>> +
> Then the logic here can be something like:
>
> ret = find_driver_guid(driver);
> if (ret)
>      return ret;
>
>>        driver->driver.owner = owner;
>>        driver->driver.bus = &wmi_bus_type;
>>
>> --
>> 2.18.4
> S
