Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDEA23268F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 23:02:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726581AbgG2VCO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 17:02:14 -0400
Received: from hqnvemgate26.nvidia.com ([216.228.121.65]:19063 "EHLO
        hqnvemgate26.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726476AbgG2VCO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 17:02:14 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f21e3c80001>; Wed, 29 Jul 2020 14:02:01 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Wed, 29 Jul 2020 14:02:14 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Wed, 29 Jul 2020 14:02:14 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 21:02:13 +0000
Subject: Re: [PATCH v2] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
References: <78a56eca-f0e3-3520-f3d5-1222b54f6fe9@nvidia.com>
 <20200729171151.18426-1-ddadap@nvidia.com>
 <GoKyhrM1luIoUi_fRRWN3J3azOQGamWW7m4iEHqHHdhknqefRiKx3UcPNG2fr4Ff2HT2AYBD1Az8mKscizjLo7dpzsvQZFkTWznSfti5Xy8=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <0850ac9a-3d60-053d-1d70-5f20ce621b24@nvidia.com>
Date:   Wed, 29 Jul 2020 16:03:50 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <GoKyhrM1luIoUi_fRRWN3J3azOQGamWW7m4iEHqHHdhknqefRiKx3UcPNG2fr4Ff2HT2AYBD1Az8mKscizjLo7dpzsvQZFkTWznSfti5Xy8=@protonmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1596056521; bh=dbDqiKD4HJ77dFPGc7rugjRlyG95SvXYl4G0sEVSUvg=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=QidCf4sCquhJHcUQ6/DUuCCbsxpdaEULIh89EDEC5JYBw15F3+XfQ+6ecFLm8aFqc
         UjaYCMyb2pE4XlzejZ46vKQ4lRTaQPOdAq3Lpy8C+5AOdnio5ZEO4ZxWEGSqUT1dtR
         ho0HR7FJp+G7KTJpyz48IhjuLnhs08XH5nISyDKXb5naLGd+A35o1Ydd4RgTy1hspA
         RI9k3icJCgBQBXqshFKaA5Nkxyy4pXKCK71RBojTgNkQGoXYtgohlL+yOykMp8LsIf
         Mv+9TOX7b7toKWfzVjFVcHE7jvoCir+Cv3A4OzDh0JK6ulILKuG7wwLvNft46dCyxQ
         pjLyqiK2wos7A==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 7/29/20 2:32 PM, Barnab=C3=A1s P=C5=91cze wrote:
> External email: Use caution opening links or attachments
>
>
> 2020. j=C3=BAlius 29., szerda 19:11 keltez=C3=A9ssel, Daniel Dadap <ddada=
p@nvidia.com> =C3=ADrta:
>
>> [...]
> I think
>
> #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>
> (or similar)
>
> should be defined before any includes since you use pr_*().
> Otherwise the messages won't be prefixed by the module name.
>

Yes, sloppy of me to not add that when adding the pr_err() statements,=20
which weren't in the v1 patch.


>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/pci.h>
>> +#include <linux/vga_switcheroo.h>
>> +#include <linux/delay.h>
>> +
>> [...]
>> +static void set_mux_state(acpi_handle handle, enum mux_state_command co=
mmand)
>> +{
>> +     acpi_helper(handle, MXDS, command);
>> +}
>> +
> It's really a nitpick and a moot point, but I'd think set_mux_state() tak=
es the state as
> one of its arguments, not the command to set that state.
>

Yeah, the old function signature from the v1 patch was more intuitive. I=20
was just trying to save a switch statement since the caller already had=20
one to convert the switcheroo IDs to the appropriate commands, but=20
there's really no point in doing so if it makes the code less clear.


>> [...]
>> +static int __init mxds_gmux_init(void)
>> +{
>> +     int ret =3D 0;
>> +     struct pci_dev *dev =3D NULL;
>> +
>> +     while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
>> +             switch (dev->vendor) {
>> +             case 0x8086:
>> +                     pci_dev_put(ig_dev);
>> +                     ig_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             case 0x10de:
>> +                     pci_dev_put(dg_dev);
>> +                     dg_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +     }
>> +
> I think I mentioned it last time, I personally dislike magic numbers,
> so I'd use PCI_VENDOR_ID_{INTEL,NVIDIA} from <linux/pci_ids.h> here, but
> I guess it's personal preference, so I don't want to bother you with that
> anymore. If you use magic numbers, then I think comments would be much
> appreciated.
>

You did mention that, and I intended to address it, but forgot to. Thank=20
you for the reminder.


>> [...]
>> +static void __exit mxds_gmux_exit(void)
>> +{
>> +     if (vga_switcheroo_registered)
>> +             vga_switcheroo_unregister_handler();
> The exit method of a module will not be run if it fails to load,
> so I think "vga_switcheroo_registered" is not necessary.
>

Good point. This began life as part of a multi-purpose kernel module,=20
where it was possible for the module as a whole to load even if the=20
switcheroo part failed.


>> +     pci_dev_put(ig_dev);
>> +     pci_dev_put(dg_dev);
>> +}
>> +module_exit(mxds_gmux_exit);
>> --
>> 2.18.4
>
> Barnab=C3=A1s P=C5=91cze
