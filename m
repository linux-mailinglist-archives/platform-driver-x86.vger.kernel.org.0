Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B038266981
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 22:25:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725853AbgIKUZI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 16:25:08 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:24550 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725793AbgIKUZG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 16:25:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599855903;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=X+8R133/8zo/eRC4wrfJtXZK5ANIEksKqtTL1OkCmKM=;
        b=S5jM8Q+6cSbFrCMy9FyfIa/R0AbreCBydNHB5dRCcIYqx+KfJaNy1Qo3AEoX+5S2AGR8/C
        8CGm+vSRKGxSKzClfO2TLGJ2mlarQOMGonCNuLj8cod6L0LcpB/HOU+XXetOYwHQad0iJw
        ug8I9IdggItEhIHaQppgf42gDBnqESk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-313-YlWaYxWDPeyu6_ZaVgl6aQ-1; Fri, 11 Sep 2020 16:24:55 -0400
X-MC-Unique: YlWaYxWDPeyu6_ZaVgl6aQ-1
Received: by mail-ed1-f71.google.com with SMTP id x14so5420770edv.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 13:24:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:cc:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=X+8R133/8zo/eRC4wrfJtXZK5ANIEksKqtTL1OkCmKM=;
        b=H5K/+YP5KKCYwlt5vZr7URukqEEGLBTKTzeUy8nyK3wnxqjtWLuJ52+Y+38dUgpP3t
         N2ikVv2vfdH/E7kP97IEUEEFh28r6t0gIYG6Oim+vcYGrDRGg+/BISt1gBBr4uHAjkww
         MPVXIH+pRL37tefYhAyUwsVu3cU0+mZrHq/z8IdCSXlly6PxfBZmiQhl+NiOfkZJS8HG
         kb++o2jhlaNqJBM3wzXJKaxT/aaOH/1vEvTPL3As4V7DOwu19EJhbMlWZ5zfFTBxW5ZE
         ncH4zZV9bxYl0tIZJqZvdFKqLAAEqFjq6hIOAk06bwXX7wX6aZRqmBBq11NTFqUx4Qsz
         XGmQ==
X-Gm-Message-State: AOAM533F0LtsAQdHEATq0WhMQZpYl4EfbOZfMw/iBShqKx5qPiV0k41b
        f51p22eXorNDZ1rph2r0X14A5kaU9QjvvM/iXk81Qmr8e7lRiUSdNofWWTeT+ibfNIxmx1lFbHJ
        7OicQ+YG7iE8pIx2/1yEG/lqfN+6wTIRFOw==
X-Received: by 2002:a05:6402:17f6:: with SMTP id t22mr4231425edy.374.1599855894024;
        Fri, 11 Sep 2020 13:24:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLJC9ZFjiC91Isgr9QeX3Ji86AXewU5WVfuUKWcnwaAtO2MUTCqQgQ7timl37Svjn/IjVCRA==
X-Received: by 2002:a05:6402:17f6:: with SMTP id t22mr4231407edy.374.1599855893834;
        Fri, 11 Sep 2020 13:24:53 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id ce14sm2577199edb.25.2020.09.11.13.24.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 13:24:53 -0700 (PDT)
Subject: Re: Asus illuminated numpads
To:     Dmitry Tunin <hanipouspilot@gmail.com>
References: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <btissoir@redhat.com>
Message-ID: <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com>
Date:   Fri, 11 Sep 2020 22:24:52 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Dmitry,

On 9/11/20 9:11 PM, Dmitry Tunin wrote:
> Hi,
> 
> Could anyone push me in the correct direction with this?
> 
> New Asus 14' laptops have fancy touchpads. On Windows if you press a
> button on the touchpad a built-in led illuminates and shows a numpad
> on the touchpad, that can be used to enter numbers. I have an Asus
> X415DA one. Other ZenBooks and Vivobooks have this touchpad.
> 
> It's kinda detected by kernel. An input device called "ELAN1401:00
> 04F3:30F2 Keyboard" is detected that has LEDs,buttons, etc.
> 
> I: Bus=0018 Vendor=04f3 Product=30f2 Version=0100
> N: Name="ELAN1401:00 04F3:30F2 Keyboard"
> P: Phys=i2c-ELAN1401:00
> S: Sysfs=/devices/platform/AMDI0010:01/i2c-0/i2c-ELAN1401:00/0018:04F3:30F2.0001/input/input12
> U: Uniq=
> H: Handlers=sysrq kbd event9 leds
> B: PROP=0
> B: EV=120013
> B: KEY=1000000000007 ff800000000007ff febeffdfffefffff fffffffffffffffe
> B: MSC=10
> B: LED=1f
> 
> root@pilot6-X412DA:/sys/bus/i2c/devices/i2c-ELAN1401:00/0018:04F3:30F2.0001/input/input12#
> ls
> capabilities  event9  input12::capslock  input12::kana
> input12::scrolllock  name  power       subsystem  uniq
> device        id      input12::compose   input12::numlock  modalias
>           phys  properties  uevent
> 
> So kernel sees the LEDs, etc.
> 
> root@pilot6-X412DA:/sys/class/leds# ls /sys/class/leds
> asus::kbd_backlight  input12::compose  input12::numlock
> input4::capslock  input4::scrolllock
> input12::capslock    input12::kana     input12::scrolllock
> input4::numlock   phy0-led
> 
> But nothing works. I tried to write 1 to 'brightness', also emulated
> Num_Lock event on the keyboard, etc.

So I found some pictures and when you say "press a button on the touchpad"
you mean touch the icon in the top right corner of the touchpad I assume?

So not really a physical button, right ?  Given that there is a keyboard
HID interface on the touchpad, I guess that that corner-button is handled
in software by the Windows driver and the Windows driver then sends a command
to the touchpad to switch to numpad mode and then the rest is handled by
firmware in the touchpad.

Which leaves the challenge of switching the touchpad to numpad mode
(and back again).

BTW what is the top left corner icon on the touchpad supposed to do ?

> There is a Windows driver at asus.com that handles the touchpad. Some
> time ago we could reverse engineer a Windows driver for Focaltech
> touchpads and find out how it worked. We installed a virtual Windows
> and sniffed some data.
> But that was a PS/2 device. I am not very much familiar with i2c, but
> it is fixable ;-)
> 
> Is there a way to do something similar?

Yes, sniffing the Windows i2c traffic is possible, see:

https://github.com/bentiss/SimplePeripheralBusProbe

Getting that to work is somewhat tricky do, if you get
stuck it is probably best to directly email bentiss about
this, I've added him to the Cc do you have his email address,
feel free to blame me for directly contacting him.

What might help is as root, with secure-boot off, do:

cat /sys/kernel/debug/hid/0018:04F3:30F2.0001/rdesc > rdesc

This will give us the HID descriptors of the touchpad,
which will help interpret the i2c traffic.

WARNING before you read the below, writing the wrong
feature report might put the touchpad in firmware update
mode. I've had a Logitech keyboard where there was no
"handshake" to confirm you really wanted to enter firmware
update mode, it just went into that mode and for good
measure also erased its current firmware as part of that
(not good).

There will probably be some feature output reports there
using vendor specific usage codes and chances are we need
to set one of those feature reports to 0/1 to enable/disable
the numpad mode.

If there is like a 1 byte vendor-specific usage code there,
you could even directly try poking it through the matching
/dev/hidraw interface for the touchpad, but see the above
warning!

Regards,

Hans

