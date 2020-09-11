Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AAD40266893
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 21:11:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725802AbgIKTLx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 15:11:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725780AbgIKTLu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 15:11:50 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 595A1C061573
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 12:11:49 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id b12so11157174edz.11
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 12:11:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=7TMdJyl4j2vpmJ0tGCiXMyOYeopZ1n6rvkacc0CwjbI=;
        b=CV+0gl7GXlTM4tDtKaH07jyK3LTlngMYAsBoQ06cbxUvtgA02r5/+7BOVtF07wA70u
         VD6f+OtKT5216RJPBZ5xRSrSL1+Z41eoSvpTPpqMe6jr9uu+obWsPEb3nL5sL5/CKWxy
         xSIvwLo9d9NFVchX58/4gUbFeQYS+hik6WRy9XsoqMSLtha60ZZLIkYiSnA8VSYPGS6c
         8lYb9j/X5KbSnnigCRtXE6QLlhqpQlW0X7oFLvi3CzWgL5B1+BrEXaYqrf4ytvKKalCf
         WiCNWNhJM00orKo0ZhiIEV91ZzTHfjWmU3e8E9hQb28m7rI+qZlvaR1jwQF+/EYO3NB5
         Muhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=7TMdJyl4j2vpmJ0tGCiXMyOYeopZ1n6rvkacc0CwjbI=;
        b=PUb/IF6XBKdExKmE7a80Yc4/BDqLbATDhf5lQtLvNYlXaCZcs2nYmSKipv9aiASLuo
         vDa2T2V48yp/0syu4WSnmdNPKwdVz2MyVbGO4YNDCMVCk9eWbDmuTy1j9ziNdPLuWl+0
         R6/eJVb+FIZALd2OugqkqDkw8hWb84Ixrlgv7gCMGXwah7byd+fdH3PwYOm3PqaHixjb
         kVLef7T49ai5VXT6K691On/tjL4Z/ZkYVruW7Hq/5kUUwr025MGbsH+d1/jUnTcvWnzy
         dDVHN1f4RuU30gwulyZjfYtj/jQxZmGl4SmmqVrtiNJcPlOD99CiX9g2UaRmhYUfkS4V
         W42A==
X-Gm-Message-State: AOAM531WOaxCIv/hLuv07h/QUPeS3JWVBsXaphOQLg8IoW9S/xxTiTSd
        tEPyooGGFY0vuGsy4ekCO5FBiZtde1noW9giJ38=
X-Google-Smtp-Source: ABdhPJzqVeB8IGB+cnvLKmTsHEvIHKBS+WT2hcIQXleBSkWKiqUXcFT0U+PHrhE+NoyWLN0Db16O7alem0FAx12GhFk=
X-Received: by 2002:a05:6402:1451:: with SMTP id d17mr3867606edx.48.1599851507744;
 Fri, 11 Sep 2020 12:11:47 -0700 (PDT)
MIME-Version: 1.0
From:   Dmitry Tunin <hanipouspilot@gmail.com>
Date:   Fri, 11 Sep 2020 22:11:36 +0300
Message-ID: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
Subject: Asus illuminated numpads
To:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Could anyone push me in the correct direction with this?

New Asus 14' laptops have fancy touchpads. On Windows if you press a
button on the touchpad a built-in led illuminates and shows a numpad
on the touchpad, that can be used to enter numbers. I have an Asus
X415DA one. Other ZenBooks and Vivobooks have this touchpad.

It's kinda detected by kernel. An input device called "ELAN1401:00
04F3:30F2 Keyboard" is detected that has LEDs,buttons, etc.

I: Bus=0018 Vendor=04f3 Product=30f2 Version=0100
N: Name="ELAN1401:00 04F3:30F2 Keyboard"
P: Phys=i2c-ELAN1401:00
S: Sysfs=/devices/platform/AMDI0010:01/i2c-0/i2c-ELAN1401:00/0018:04F3:30F2.0001/input/input12
U: Uniq=
H: Handlers=sysrq kbd event9 leds
B: PROP=0
B: EV=120013
B: KEY=1000000000007 ff800000000007ff febeffdfffefffff fffffffffffffffe
B: MSC=10
B: LED=1f

root@pilot6-X412DA:/sys/bus/i2c/devices/i2c-ELAN1401:00/0018:04F3:30F2.0001/input/input12#
ls
capabilities  event9  input12::capslock  input12::kana
input12::scrolllock  name  power       subsystem  uniq
device        id      input12::compose   input12::numlock  modalias
         phys  properties  uevent

So kernel sees the LEDs, etc.

root@pilot6-X412DA:/sys/class/leds# ls /sys/class/leds
asus::kbd_backlight  input12::compose  input12::numlock
input4::capslock  input4::scrolllock
input12::capslock    input12::kana     input12::scrolllock
input4::numlock   phy0-led

But nothing works. I tried to write 1 to 'brightness', also emulated
Num_Lock event on the keyboard, etc.

There is a Windows driver at asus.com that handles the touchpad. Some
time ago we could reverse engineer a Windows driver for Focaltech
touchpads and find out how it worked. We installed a virtual Windows
and sniffed some data.
But that was a PS/2 device. I am not very much familiar with i2c, but
it is fixable ;-)

Is there a way to do something similar?

Regards,

Dmitry.
