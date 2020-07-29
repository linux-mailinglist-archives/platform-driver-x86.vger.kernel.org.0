Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 32B68232306
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 18:59:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727054AbgG2Q7m (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 12:59:42 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:1030 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726336AbgG2Q7l (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 12:59:41 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f21aaef0004>; Wed, 29 Jul 2020 09:59:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 09:59:40 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Wed, 29 Jul 2020 09:59:40 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 16:59:40 +0000
Subject: Re: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
References: <20200727205752.28224-1-ddadap@nvidia.com>
 <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com>
 <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
 <LE94tOCscM8Ks6-w8T82hGynVJkk6JTSnaVRDXXZS8Tl14o9t5bTlPQWTa-5Bl9b0VXYnfG-yCH5xlX_lxMFF8CsCgLicLYh245hMC8ofUY=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <78a56eca-f0e3-3520-f3d5-1222b54f6fe9@nvidia.com>
Date:   Wed, 29 Jul 2020 12:00:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <LE94tOCscM8Ks6-w8T82hGynVJkk6JTSnaVRDXXZS8Tl14o9t5bTlPQWTa-5Bl9b0VXYnfG-yCH5xlX_lxMFF8CsCgLicLYh245hMC8ofUY=@protonmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596041967; bh=gM0Rxh84WzCQZgzPNAVCCK1N81qmPMhJVW3LfVRmqUQ=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=H3xHf7+OpKwaCAjg5pd1uuULCM7oIQ/0AeDXVAM5SL3qzDlxQiQZocl7KFSE6ULMx
         dW+Uwfi24a8JzW9KbBd3doNbeswiQqbEjhoq1EPWP9vLhKZzJSNNubCSAu7ec8eoVn
         ucmr0z98Du24Iy/Ck/4Xpz4p7RHW9h4gjWYLQQOx5vMxc3vu2klzLZNWpL9z5F9Zes
         BmVpGMxqUgmoHcYDKw+AaC5anrMg2GNM1lwfDlWJEA6krqKKkrOhnCWeFWMPNsPQbO
         RvtWrIlv4cRShR+WQdLK8ccLkjKNzYkpRNemNXM+QSUth28GvqlIxkxrDy2yH3RYh7
         lrosq6kaYpgKQ==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/29/20 5:29 AM, Barnab=C3=A1s P=C5=91cze wrote:
> 2020. j=C3=BAlius 29., szerda 5:17 keltez=C3=A9ssel, Daniel Dadap <ddadap=
@nvidia.com> =C3=ADrta:
>
>> Thanks for your comments. A v2 patch will follow after I've had some
>> time to test it more; in the meantime, I've responded to your
>> suggestions inline:
>>
>> [...]
>>>> +
>>>> +static int mxds_gmux_init(void)
>>>> +{
>>>> +     int ret =3D 0;
>>>> +     struct pci_dev *dev =3D NULL;
>>>> +     static struct vga_switcheroo_handler handler =3D {
>>>> +             .switchto =3D mxds_gmux_switchto,
>>>> +             .get_client_id =3D mxds_gmux_get_client_id,
>>>> +     };
>>>> +
>>> Any reason why "handler" is inside the function and not const?
>>>
>> You're right, it can be const. I have it in the function (with static
>> storage) because we don't need to reference it anywhere else. I'd think
>> the static storage would allow the pointer to the struct to stay alive
>> even after the init function exits, but if you think it would be better
>> to have it out of the function's scope I can move it.
>>
> I see. I think having it out of the function better signals the intention=
 that
> this variable is supposed to live as long as the module is loaded. Furthe=
rmore,
> - although I am not sure about this, but - I think having a function stat=
ic variable
> here prevents mxds_gmux_init() from being marked __init.
>
> Also, I forgot to mention before, but mxds_gmux_fini() is not marked __ex=
it.
> Any reason why?


The same reason mxds_gmux_init() wasn't marked __init: an oversight.

