Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 98959F4C89
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 Nov 2019 14:04:48 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727351AbfKHNDy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 8 Nov 2019 08:03:54 -0500
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:55237 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727233AbfKHNDx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 Nov 2019 08:03:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1573218232;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qScJNJT8LQZ7/Vmiq3Z4jfcYsGn2MNSrrD8dwtk2y10=;
        b=X8P+dSWuGakk49j2aORXoN8tpjcSpFMo2VBtmocilXBN+nSZ5qYP0lO6JWVO7h2vO8yN/z
        fSUob1c1hiZlx0BOw/ZLcTGmqcqdEtKPjOHKyctkp/wGTBiQ333tRzuIXc5kOKDs2JzUYv
        RmGjoIFfWavMdJCMMJYFqAip2CcYuJM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-371-tI97XGIIP-GpGJT7lJ120A-1; Fri, 08 Nov 2019 08:03:48 -0500
Received: by mail-wr1-f70.google.com with SMTP id m17so3112487wrn.23
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 Nov 2019 05:03:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MPRn7xHAxLEEBoC+B3mR8Cn0jJEgquXpvZWy0NOIgzM=;
        b=fn1+mhRGbGv4YhEUNO8ijBYn5jjoz37neSPrGR8cQ6ierS173bz/5IiFY6QlUD4IxH
         pYIbiScx7WM+h/J9G7PM5/616MYWEJLG3kwumF6xIJGteKhNMUURhDnMVmUHImvEjim1
         jUpg3y58XxH+EKM12BzQD35rFwO0MEPTebuv5FqaHcAIV1b9F37cBdEGN7V1vioEu5MA
         Zc8RNRjK6OMr5s1PWe9c765aCdE3oZXQMbQrZlsW37zRsdalsjYn6dkkcVRaGgKS0wNI
         3HVRP3ZQSS8Ca446XGQR2ka7dlhFIeNvL6OasXsIAN0/Y3iPnjrcGVpiJoXSArjbMDn4
         N73g==
X-Gm-Message-State: APjAAAWVJiDhkhIO9T6GoydUVD3PFY//5bhyXxWfVYDdN/Fk1PteXswM
        gcC7jrMl9rZWKc3iC57DE+OyvYkTcGrarjMUJv2Eui84YsgRM/b6n8AJ/FotWNESROAHOn0WqOt
        uoH5rF9ctlVT8Q1E1/87VOOkm11I7MoKjhw==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr5304664wrp.29.1573218227243;
        Fri, 08 Nov 2019 05:03:47 -0800 (PST)
X-Google-Smtp-Source: APXvYqxxpvQhwRkznAxJGsmhxme97djPCx5X9d7QVpRMwkYD+bpsU9WEBS31Y8Y42fc4nmMuIodBFg==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr5304636wrp.29.1573218227004;
        Fri, 08 Nov 2019 05:03:47 -0800 (PST)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id z4sm3923941wmf.36.2019.11.08.05.03.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2019 05:03:46 -0800 (PST)
Subject: Re: ASUS FX505DT wmi backlight/amdgpu backlight conflict
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kristian Angelov <kristiana2000@abv.bg>,
        Corentin Chary <corentin.chary@gmail.com>,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>
References: <214485435.80619.1571852088722@nm83.abv.bg>
 <CAHp75VdqFQ5Ri2YNfZbbm9BukYtbXjjtnRYe-Dc+xN-_gkgsfw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <b9af41a9-0ff3-26d3-203e-cba9f7e5cfbb@redhat.com>
Date:   Fri, 8 Nov 2019 14:03:45 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VdqFQ5Ri2YNfZbbm9BukYtbXjjtnRYe-Dc+xN-_gkgsfw@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: tI97XGIIP-GpGJT7lJ120A-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/7/19 5:59 PM, Andy Shevchenko wrote:
> Thank you for your report. Unfortunately I have no such device to test.
> Nevertheless, I Cc'ed to people who may share their thoughts about the to=
pic.
>=20
> Note, you should Cc maintainers of subsystem and driver in question in
> the first place.

Right, so what is happening here is that during boot the video (acpi_video)
module loads first, registers /sys/class/backlight/acpi_video0 then amdgpu
loads, registers its own native backlight driver which has a higher prio an=
d then
the acpi video-detect.c code detects this and unregisters the /sys/class/ba=
cklight/acpi_video0
device, so the device is briefly there which causes this ugly but harmless
systemd error.

Passing acpi_backlight=3Dnative on the kernel commandline likely will work
around this. Note please do NOT submit a patch with a quirk for this, we
need to come up with a generic fix for this ordering problem (which require=
s
someone with a significant amount of time to sit down and look into this).

Regards,

Hans



>=20
> On Thu, Oct 24, 2019 at 11:50 AM Kristian Angelov <kristiana2000@abv.bg> =
wrote:
>>
>> Hello,
>>
>>
>> I own an ASUS FX505DT (integrated vega amdgpu), and the backlight contro=
l seems
>> to be conflicting with the asus-nb-wmi driver.
>>
>>
>> Upon booting normally with a standard kernel 5.3.7 on Arch, the asus-nb-=
wmi
>> driver gets loaded properly. It does not create any backlight devices in
>> /sys/class/backlight. However, ACPI-video seems to fail to get created a=
nd I get
>> This in my systemd log:
>>
>>
>> systemd-backlight[771]: Failed to get backlight or LED device 'backlight=
:acpi_vi
>> deo0': No such device
>>
>>
>> This implies that acpi_video0 gets registered by systemd but fails early=
 on
>> during the boot process. Regardless, backlight seems to work fine using =
the
>> hotkeys as the only device present in /sys/class/backlight is amdgpu_bl0=
.
>>
>>
>> As any sane person, I want to remove those nasty fail messages from my l=
og. with
>> the solution being to set acpi_backlight=3Dvendor in my boot flags, whic=
h stops
>> acpi_video0 from being registered and removes the log, however asus-nb-w=
mi kicks
>> in and registers it's own backlight device. There are two backlight devi=
ces
>> currently active amdgpu_bl0 and asus-nb-wmi and the latter does not cont=
rol the
>> backlight but seems to take priority in the keybinds.
>>
>>
>> I looked throught the driver and implemented the following:
>>
>>
>> index b361c73..e0ca145 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -105,6 +105,11 @@ static struct quirk_entry quirk_asus_x550lb =3D {
>>          .xusb2pr =3D 0x01D9,
>>   };
>>
>> +static struct quirk_entry quirk_asus_fx505dt =3D {
>> +       .wmi_backlight_power =3D true,
>> +       .wmi_backlight_set_devstate =3D true,
>> +};
>> +
>>   static struct quirk_entry quirk_asus_forceals =3D {
>>          .wmi_backlight_set_devstate =3D true,
>>          .wmi_force_als_set =3D true,
>> @@ -411,6 +416,15 @@ static const struct dmi_system_id asus_quirks[] =3D=
 {
>>                  },
>>                  .driver_data =3D &quirk_asus_forceals,
>>          },
>> +       {
>> +               .callback =3D dmi_matched,
>> +               .ident =3D "ASUSTeK COMPUTER INC. FX505DT TESTING",
>> +               .matches =3D {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC.=
"),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "FX505DT"),
>> +               },
>> +               .driver_data =3D &quirk_asus_fx505dt,
>> +       },
>>          {},
>>   };
>>
>>
>> where wmi_backlight_power is supposed to prevent the creation (or use) o=
f this
>> new backlight device. However this does not seem to be the case. So far =
the only
>> way the backlight works is with acpi_backlight not defined at all. If I =
set it
>> to anything, even video, it creates another worthless backlight device. =
I do
>> believe this is either a bug in asus-wmi and wmi_backlight_power doing n=
ot what
>> it's supposed to. Either that or I am mistaken as to how any of this wor=
ks, and
>> would like help with implementing my device.
>=20
>=20
>=20

