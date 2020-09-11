Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 73E0726699D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 22:40:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725817AbgIKUkS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 16:40:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725803AbgIKUkP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 16:40:15 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B52CC061573
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 13:40:15 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id nw23so15426686ejb.4
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 13:40:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=/N6MSws1S5o/L/UhQx9R31wjHubfPDdWaqdJ91Gy/VI=;
        b=ByuNfD6xt7oFPh8m1owscchBVnwLpNZQv2Al8Atn6Zw0RX9son67bJGCEKgkAeU69H
         maeMeLU4j8AFsEAyqzQiZGZcr0PjBaauJqvESZz7K43zwDtSA+clxrhm3tb2T38i7jPc
         MXESlqQkzqBVgRjG5Xk+HVTuaiIq3AcN8POcsXjtg1t7XIA68GJy1apJwGtSO1v5A9KY
         5QY1LKIWSG5zi0zbT2Q79YSIIv0cW6F4r0WQoNoQdt5k4rwKnUZsoiPQ0Hzy2fRDGD9j
         3FmSNjWn1DNJQzUTIEb5H+iZXqcd3q6nFIaXFRwS23llrmASbTtmPYkpGOeVida3LTwR
         hINQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=/N6MSws1S5o/L/UhQx9R31wjHubfPDdWaqdJ91Gy/VI=;
        b=CdSufHPi37UG4/mWeL/1VrBdZgr1aSuzYowXd3K0LdnuyKLfdo3k8hWcN4nso/XP0v
         vQlhhvNwDpBbVUcDFMWHfi2rVXqZ0H3Pqe8X/d+qflPWz75ZUnaHuhQw384/3q9jlR+/
         nAtCAry6xWL9FZbHSXhoCygMNUvHC/dRk1JNYUs1NUwMwZI/NweCxJeMzu1cQWfBqhHX
         rUzlhPTH0tJDA5lJzkNEr7CoI6WEIUj2d38XxDwsOq6fLtsJRJn+jTlkzqBVHccpWrgx
         5aSFK/U/0Aa5Lk77QycXHZcKRXshNpbIB9ku9pt6yRZMXiECjZsXs7FmsmAVUEz/Qeg8
         nzpw==
X-Gm-Message-State: AOAM532uHhaV12Xd/0Q+b0knV7Oc0No2oFeQ5Ws7QCTpy3Ajwo4U7PKf
        4lj2zaSs1GjpFnBiaBv9/Sa3DdEl4xst0BWAvdw=
X-Google-Smtp-Source: ABdhPJzanRWzRQOG1efTMJvk7bRWzbY4MDLD2cmoDz8nk8v+fTu5DA7RDQPg0FO1mJFtSdRU04H1vTRr1OSC7pX4iSw=
X-Received: by 2002:a17:906:455:: with SMTP id e21mr3937389eja.170.1599856813346;
 Fri, 11 Sep 2020 13:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <CANoib0GPQTABpuHrBBCLCwhRG7LMR215ZmKk-KazMzY7rYVP8Q@mail.gmail.com>
 <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com>
In-Reply-To: <ed3a0dd2-0865-cb84-975a-2c8e9f28d6eb@redhat.com>
From:   Dmitry Tunin <hanipouspilot@gmail.com>
Date:   Fri, 11 Sep 2020 23:40:01 +0300
Message-ID: <CANoib0HSpPR=dX7qbW-p62S1BGhYmARACcSQy-ag6B1tNT58Yg@mail.gmail.com>
Subject: Re: Asus illuminated numpads
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86 <platform-driver-x86@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <btissoir@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans,

Thanks for the reply.
>
> Hi Dmitry,
>
> So I found some pictures and when you say "press a button on the touchpad"
> you mean touch the icon in the top right corner of the touchpad I assume?

Exactly.
>
> So not really a physical button, right ?  Given that there is a keyboard
> HID interface on the touchpad, I guess that that corner-button is handled
> in software by the Windows driver and the Windows driver then sends a command
> to the touchpad to switch to numpad mode and then the rest is handled by
> firmware in the touchpad.
>
> Which leaves the challenge of switching the touchpad to numpad mode
> (and back again).
>
> BTW what is the top left corner icon on the touchpad supposed to do ?
I don't have anything at the top left corner

>
> What might help is as root, with secure-boot off, do:
>
> cat /sys/kernel/debug/hid/0018:04F3:30F2.0001/rdesc > rdesc
>
> This will give us the HID descriptors of the touchpad,
> which will help interpret the i2c traffic.

05 01 09 02 a1 01 85 01 09 01 a1 00 05 09 19 01 29 02 15 00 25 01 75
01 95 02 81 02 95 06 81 03 05 01 09 30 09 31 09 38 15 81 25 7f 75 08
95 03 81 06 05 0c 0a 38 02 95 01 81 06 75 08 95 03 81 03 c0 c0 05 0d
09 05 a1 01 85 04 09 22 a1 02 15 00 25 01 09 47 09 42 95 02 75 01 81
02 75 01 95 02 81 03 95 01 75 04 25 0f 09 51 81 02 05 01 15 00 26 78
0c 75 10 55 0e 65 13 09 30 35 00 46 90 01 95 01 81 02 46 d3 00 26 93
06 26 93 06 09 31 81 02 05 0d 15 00 25 64 95 03 c0 55 0c 66 01 10 47
ff ff 00 00 27 ff ff 00 00 75 10 95 01 09 56 81 02 09 54 25 7f 95 01
75 08 81 02 05 09 09 01 25 01 75 01 95 01 81 02 95 07 81 03 09 c5 75
08 95 04 81 03 05 0d 85 02 09 55 09 59 75 04 95 02 25 0f b1 02 85 07
09 60 75 01 95 01 15 00 25 01 b1 02 95 0f b1 03 06 00 ff 06 00 ff 85
06 09 c5 15 00 26 ff 00 75 08 96 00 01 b1 02 85 0d 09 c4 15 00 26 ff
00 75 08 95 04 b1 02 85 0c 09 c6 96 8a 02 75 08 b1 02 85 0b 09 c7 95
80 75 08 b1 02 c0 05 0d 09 0e a1 01 85 03 09 22 a1 00 09 52 15 00 25
0a 75 10 95 01 b1 02 c0 09 22 a1 00 85 05 09 57 09 58 15 00 75 01 95
02 25 03 b1 02 95 0e b1 03 c0 c0 05 01 09 06 a1 01 85 0e 05 07 19 e0
29 e7 15 00 25 01 75 01 95 08 81 02 81 03 95 05 05 08 19 01 29 05 91
02 95 01 75 03 91 01 95 06 75 08 15 00 26 a4 00 05 07 19 00 2a a4 00
81 00 c0

  INPUT(1)[INPUT]
    Field(0)
      Physical(GenericDesktop.Pointer)
      Application(GenericDesktop.Mouse)
      Usage(2)
        Button.0001
        Button.0002
      Logical Minimum(0)
      Logical Maximum(1)
      Report Size(1)
      Report Count(2)
      Report Offset(0)
      Flags( Variable Absolute )
    Field(1)
      Physical(GenericDesktop.Pointer)
      Application(GenericDesktop.Mouse)
      Usage(3)
        GenericDesktop.X
        GenericDesktop.Y
        GenericDesktop.Wheel
      Logical Minimum(-127)
      Logical Maximum(127)
      Report Size(8)
      Report Count(3)
      Report Offset(8)
      Flags( Variable Relative )
    Field(2)
      Physical(GenericDesktop.Pointer)
      Application(GenericDesktop.Mouse)
      Usage(1)
        Consumer.HorizontalWheel
      Logical Minimum(-127)
      Logical Maximum(127)
      Report Size(8)
      Report Count(1)
      Report Offset(32)
      Flags( Variable Relative )
  INPUT(4)[INPUT]
    Field(0)
      Logical(Digitizers.Finger)
      Application(Digitizers.TouchPad)
      Usage(2)
        Digitizers.Confidence
        Digitizers.TipSwitch
      Logical Minimum(0)
      Logical Maximum(1)
      Report Size(1)
      Report Count(2)
      Report Offset(0)
      Flags( Variable Absolute )
    Field(1)
      Logical(Digitizers.Finger)
      Application(Digitizers.TouchPad)
      Usage(1)
        Digitizers.ContactID
      Logical Minimum(0)
      Logical Maximum(15)
      Report Size(4)
      Report Count(1)
      Report Offset(4)
      Flags( Variable Absolute )
    Field(2)
      Logical(Digitizers.Finger)
      Application(Digitizers.TouchPad)
      Usage(1)
        GenericDesktop.X
      Logical Minimum(0)
      Logical Maximum(3192)
      Physical Minimum(0)
      Physical Maximum(400)
      Unit Exponent(-2)
      Unit(English Linear : Inch)
      Report Size(16)
      Report Count(1)
      Report Offset(8)
      Flags( Variable Absolute )
    Field(3)
      Logical(Digitizers.Finger)
      Application(Digitizers.TouchPad)
      Usage(1)
        GenericDesktop.Y
      Logical Minimum(0)
      Logical Maximum(1683)
      Physical Minimum(0)
      Physical Maximum(211)
      Unit Exponent(-2)
      Unit(English Linear : Inch)
      Report Size(16)
      Report Count(1)
      Report Offset(24)
      Flags( Variable Absolute )
    Field(4)
      Application(Digitizers.TouchPad)
      Usage(1)
        Digitizers.0056
      Logical Minimum(0)
      Logical Maximum(65535)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(16)
      Report Count(1)
      Report Offset(40)
      Flags( Variable Absolute )
    Field(5)
      Application(Digitizers.TouchPad)
      Usage(1)
        Digitizers.ContactCount
      Logical Minimum(0)
      Logical Maximum(127)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(1)
      Report Offset(56)
      Flags( Variable Absolute )
    Field(6)
      Application(Digitizers.TouchPad)
      Usage(1)
        Button.0001
      Logical Minimum(0)
      Logical Maximum(1)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(1)
      Report Count(1)
      Report Offset(64)
      Flags( Variable Absolute )
    Field(7)
      Application(Digitizers.TouchPad)
      Usage(4)
        Button.00c5
        Button.00c5
        Button.00c5
        Button.00c5
      Logical Minimum(0)
      Logical Maximum(1)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(4)
      Report Offset(72)
      Flags( Constant Variable Absolute )
  INPUT(14)[INPUT]
    Field(0)
      Application(GenericDesktop.Keyboard)
      Usage(8)
        Keyboard.00e0
        Keyboard.00e1
        Keyboard.00e2
        Keyboard.00e3
        Keyboard.00e4
        Keyboard.00e5
        Keyboard.00e6
        Keyboard.00e7
      Logical Minimum(0)
      Logical Maximum(1)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(1)
      Report Count(8)
      Report Offset(0)
      Flags( Variable Absolute )
    Field(1)
      Application(GenericDesktop.Keyboard)
      Usage(165)
        Keyboard.0000
        Keyboard.0001
        Keyboard.0002
        Keyboard.0003
        Keyboard.0004
        Keyboard.0005
        Keyboard.0006
        Keyboard.0007
        Keyboard.0008
        Keyboard.0009
        Keyboard.000a
        Keyboard.000b
        Keyboard.000c
        Keyboard.000d
        Keyboard.000e
        Keyboard.000f
        Keyboard.0010
        Keyboard.0011
        Keyboard.0012
        Keyboard.0013
        Keyboard.0014
        Keyboard.0015
        Keyboard.0016
        Keyboard.0017
        Keyboard.0018
        Keyboard.0019
        Keyboard.001a
        Keyboard.001b
        Keyboard.001c
        Keyboard.001d
        Keyboard.001e
        Keyboard.001f
        Keyboard.0020
        Keyboard.0021
        Keyboard.0022
        Keyboard.0023
        Keyboard.0024
        Keyboard.0025
        Keyboard.0026
        Keyboard.0027
        Keyboard.0028
        Keyboard.0029
        Keyboard.002a
        Keyboard.002b
        Keyboard.002c
        Keyboard.002d
        Keyboard.002e
        Keyboard.002f
        Keyboard.0030
        Keyboard.0031
        Keyboard.0032
        Keyboard.0033
        Keyboard.0034
        Keyboard.0035
        Keyboard.0036
        Keyboard.0037
        Keyboard.0038
        Keyboard.0039
        Keyboard.003a
        Keyboard.003b
        Keyboard.003c
        Keyboard.003d
        Keyboard.003e
        Keyboard.003f
        Keyboard.0040
        Keyboard.0041
        Keyboard.0042
        Keyboard.0043
        Keyboard.0044
        Keyboard.0045
        Keyboard.0046
        Keyboard.0047
        Keyboard.0048
        Keyboard.0049
        Keyboard.004a
        Keyboard.004b
        Keyboard.004c
        Keyboard.004d
        Keyboard.004e
        Keyboard.004f
        Keyboard.0050
        Keyboard.0051
        Keyboard.0052
        Keyboard.0053
        Keyboard.0054
        Keyboard.0055
        Keyboard.0056
        Keyboard.0057
        Keyboard.0058
        Keyboard.0059
        Keyboard.005a
        Keyboard.005b
        Keyboard.005c
        Keyboard.005d
        Keyboard.005e
        Keyboard.005f
        Keyboard.0060
        Keyboard.0061
        Keyboard.0062
        Keyboard.0063
        Keyboard.0064
        Keyboard.0065
        Keyboard.0066
        Keyboard.0067
        Keyboard.0068
        Keyboard.0069
        Keyboard.006a
        Keyboard.006b
        Keyboard.006c
        Keyboard.006d
        Keyboard.006e
        Keyboard.006f
        Keyboard.0070
        Keyboard.0071
        Keyboard.0072
        Keyboard.0073
        Keyboard.0074
        Keyboard.0075
        Keyboard.0076
        Keyboard.0077
        Keyboard.0078
        Keyboard.0079
        Keyboard.007a
        Keyboard.007b
        Keyboard.007c
        Keyboard.007d
        Keyboard.007e
        Keyboard.007f
        Keyboard.0080
        Keyboard.0081
        Keyboard.0082
        Keyboard.0083
        Keyboard.0084
        Keyboard.0085
        Keyboard.0086
        Keyboard.0087
        Keyboard.0088
        Keyboard.0089
        Keyboard.008a
        Keyboard.008b
        Keyboard.008c
        Keyboard.008d
        Keyboard.008e
        Keyboard.008f
        Keyboard.0090
        Keyboard.0091
        Keyboard.0092
        Keyboard.0093
        Keyboard.0094
        Keyboard.0095
        Keyboard.0096
        Keyboard.0097
        Keyboard.0098
        Keyboard.0099
        Keyboard.009a
        Keyboard.009b
        Keyboard.009c
        Keyboard.009d
        Keyboard.009e
        Keyboard.009f
        Keyboard.00a0
        Keyboard.00a1
        Keyboard.00a2
        Keyboard.00a3
        Keyboard.00a4
      Logical Minimum(0)
      Logical Maximum(164)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(6)
      Report Offset(16)
      Flags( Array Absolute )
  OUTPUT(14)[OUTPUT]
    Field(0)
      Application(GenericDesktop.Keyboard)
      Usage(5)
        LED.NumLock
        LED.CapsLock
        LED.ScrollLock
        LED.Compose
        LED.Kana
      Logical Minimum(0)
      Logical Maximum(1)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(1)
      Report Count(5)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(2)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(2)
        Digitizers.ContactMaximumNumber
        Digitizers.ButtonType
      Logical Minimum(0)
      Logical Maximum(15)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(4)
      Report Count(2)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(7)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(1)
        Digitizers.0060
      Logical Minimum(0)
      Logical Maximum(1)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(1)
      Report Count(1)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(6)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(256)
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
        ff00.00c5
      Logical Minimum(0)
      Logical Maximum(255)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(256)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(13)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(4)
        ff00.00c4
        ff00.00c4
        ff00.00c4
        ff00.00c4
      Logical Minimum(0)
      Logical Maximum(255)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(4)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(12)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(650)
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
        ff00.00c6
      Logical Minimum(0)
      Logical Maximum(255)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(650)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(11)[FEATURE]
    Field(0)
      Application(Digitizers.TouchPad)
      Usage(128)
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
        ff00.00c7
      Logical Minimum(0)
      Logical Maximum(255)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(8)
      Report Count(128)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(3)[FEATURE]
    Field(0)
      Physical(Digitizers.Finger)
      Application(Digitizers.DeviceConfiguration)
      Usage(1)
        Digitizers.InputMode
      Logical Minimum(0)
      Logical Maximum(10)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(16)
      Report Count(1)
      Report Offset(0)
      Flags( Variable Absolute )
  FEATURE(5)[FEATURE]
    Field(0)
      Physical(Digitizers.Finger)
      Application(Digitizers.DeviceConfiguration)
      Usage(2)
        Digitizers.0057
        Digitizers.0058
      Logical Minimum(0)
      Logical Maximum(3)
      Physical Minimum(0)
      Physical Maximum(65535)
      Unit Exponent(-4)
      Unit(SI Linear : Seconds)
      Report Size(1)
      Report Count(2)
      Report Offset(0)
      Flags( Variable Absolute )

Button.0001 ---> Key.LeftBtn
Button.0002 ---> Key.RightBtn
GenericDesktop.X ---> Relative.X
GenericDesktop.Y ---> Relative.Y
GenericDesktop.Wheel ---> Relative.?
Consumer.HorizontalWheel ---> Relative.?
Digitizers.Confidence ---> Sync.Report
Digitizers.TipSwitch ---> Sync.Report
Digitizers.ContactID ---> Sync.Report
GenericDesktop.X ---> Sync.Report
GenericDesktop.Y ---> Sync.Report
Digitizers.0056 ---> Sync.Report
Digitizers.ContactCount ---> Sync.Report
Button.0001 ---> Key.LeftBtn
Button.00c5 ---> Sync.Report
Button.00c5 ---> Sync.Report
Button.00c5 ---> Sync.Report
Button.00c5 ---> Sync.Report
Keyboard.00e0 ---> Key.LeftControl
Keyboard.00e1 ---> Key.LeftShift
Keyboard.00e2 ---> Key.LeftAlt
Keyboard.00e3 ---> Key.LeftMeta
Keyboard.00e4 ---> Key.RightCtrl
Keyboard.00e5 ---> Key.RightShift
Keyboard.00e6 ---> Key.RightAlt
Keyboard.00e7 ---> Key.RightMeta
Keyboard.0000 ---> Sync.Report
Keyboard.0001 ---> Sync.Report
Keyboard.0002 ---> Sync.Report
Keyboard.0003 ---> Sync.Report
Keyboard.0004 ---> Key.A
Keyboard.0005 ---> Key.B
Keyboard.0006 ---> Key.C
Keyboard.0007 ---> Key.D
Keyboard.0008 ---> Key.E
Keyboard.0009 ---> Key.F
Keyboard.000a ---> Key.G
Keyboard.000b ---> Key.H
Keyboard.000c ---> Key.I
Keyboard.000d ---> Key.J
Keyboard.000e ---> Key.K
Keyboard.000f ---> Key.L
Keyboard.0010 ---> Key.M
Keyboard.0011 ---> Key.N
Keyboard.0012 ---> Key.O
Keyboard.0013 ---> Key.P
Keyboard.0014 ---> Key.Q
Keyboard.0015 ---> Key.R
Keyboard.0016 ---> Key.S
Keyboard.0017 ---> Key.T
Keyboard.0018 ---> Key.U
Keyboard.0019 ---> Key.V
Keyboard.001a ---> Key.W
Keyboard.001b ---> Key.X
Keyboard.001c ---> Key.Y
Keyboard.001d ---> Key.Z
Keyboard.001e ---> Key.1
Keyboard.001f ---> Key.2
Keyboard.0020 ---> Key.3
Keyboard.0021 ---> Key.4
Keyboard.0022 ---> Key.5
Keyboard.0023 ---> Key.6
Keyboard.0024 ---> Key.7
Keyboard.0025 ---> Key.8
Keyboard.0026 ---> Key.9
Keyboard.0027 ---> Key.0
Keyboard.0028 ---> Key.Enter
Keyboard.0029 ---> Key.Esc
Keyboard.002a ---> Key.Backspace
Keyboard.002b ---> Key.Tab
Keyboard.002c ---> Key.Space
Keyboard.002d ---> Key.Minus
Keyboard.002e ---> Key.Equal
Keyboard.002f ---> Key.LeftBrace
Keyboard.0030 ---> Key.RightBrace
Keyboard.0031 ---> Key.BackSlash
Keyboard.0032 ---> Key.BackSlash
Keyboard.0033 ---> Key.Semicolon
Keyboard.0034 ---> Key.Apostrophe
Keyboard.0035 ---> Key.Grave
Keyboard.0036 ---> Key.Comma
Keyboard.0037 ---> Key.Dot
Keyboard.0038 ---> Key.Slash
Keyboard.0039 ---> Key.CapsLock
Keyboard.003a ---> Key.F1
Keyboard.003b ---> Key.F2
Keyboard.003c ---> Key.F3
Keyboard.003d ---> Key.F4
Keyboard.003e ---> Key.F5
Keyboard.003f ---> Key.F6
Keyboard.0040 ---> Key.F7
Keyboard.0041 ---> Key.F8
Keyboard.0042 ---> Key.F9
Keyboard.0043 ---> Key.F10
Keyboard.0044 ---> Key.F11
Keyboard.0045 ---> Key.F12
Keyboard.0046 ---> Key.SysRq
Keyboard.0047 ---> Key.ScrollLock
Keyboard.0048 ---> Key.Pause
Keyboard.0049 ---> Key.Insert
Keyboard.004a ---> Key.Home
Keyboard.004b ---> Key.PageUp
Keyboard.004c ---> Key.Delete
Keyboard.004d ---> Key.End
Keyboard.004e ---> Key.PageDown
Keyboard.004f ---> Key.Right
Keyboard.0050 ---> Key.Left
Keyboard.0051 ---> Key.Down
Keyboard.0052 ---> Key.Up
Keyboard.0053 ---> Key.NumLock
Keyboard.0054 ---> Key.KPSlash
Keyboard.0055 ---> Key.KPAsterisk
Keyboard.0056 ---> Key.KPMinus
Keyboard.0057 ---> Key.KPPlus
Keyboard.0058 ---> Key.KPEnter
Keyboard.0059 ---> Key.KP1
Keyboard.005a ---> Key.KP2
Keyboard.005b ---> Key.KP3
Keyboard.005c ---> Key.KP4
Keyboard.005d ---> Key.KP5
Keyboard.005e ---> Key.KP6
Keyboard.005f ---> Key.KP7
Keyboard.0060 ---> Key.KP8
Keyboard.0061 ---> Key.KP9
Keyboard.0062 ---> Key.KP0
Keyboard.0063 ---> Key.KPDot
Keyboard.0064 ---> Key.102nd
Keyboard.0065 ---> Key.Compose
Keyboard.0066 ---> Key.Power
Keyboard.0067 ---> Key.KPEqual
Keyboard.0068 ---> Key.F13
Keyboard.0069 ---> Key.F14
Keyboard.006a ---> Key.F15
Keyboard.006b ---> Key.F16
Keyboard.006c ---> Key.F17
Keyboard.006d ---> Key.F18
Keyboard.006e ---> Key.F19
Keyboard.006f ---> Key.F20
Keyboard.0070 ---> Key.F21
Keyboard.0071 ---> Key.F22
Keyboard.0072 ---> Key.F23
Keyboard.0073 ---> Key.F24
Keyboard.0074 ---> Key.Open
Keyboard.0075 ---> Key.Help
Keyboard.0076 ---> Key.Props
Keyboard.0077 ---> Key.Front
Keyboard.0078 ---> Key.Stop
Keyboard.0079 ---> Key.Again
Keyboard.007a ---> Key.Undo
Keyboard.007b ---> Key.Cut
Keyboard.007c ---> Key.Copy
Keyboard.007d ---> Key.Paste
Keyboard.007e ---> Key.Find
Keyboard.007f ---> Key.Mute
Keyboard.0080 ---> Key.VolumeUp
Keyboard.0081 ---> Key.VolumeDown
Keyboard.0082 ---> Key.Unknown
Keyboard.0083 ---> Key.Unknown
Keyboard.0084 ---> Key.Unknown
Keyboard.0085 ---> Key.KPComma
Keyboard.0086 ---> Key.Unknown
Keyboard.0087 ---> Key.RO
Keyboard.0088 ---> Key.Katakana/Hiragana
Keyboard.0089 ---> Key.Yen
Keyboard.008a ---> Key.Henkan
Keyboard.008b ---> Key.Muhenkan
Keyboard.008c ---> Key.KPJpComma
Keyboard.008d ---> Key.Unknown
Keyboard.008e ---> Key.Unknown
Keyboard.008f ---> Key.Unknown
Keyboard.0090 ---> Key.Hangeul
Keyboard.0091 ---> Key.Hanja
Keyboard.0092 ---> Key.Katakana
Keyboard.0093 ---> Key.HIRAGANA
Keyboard.0094 ---> Key.Zenkaku/Hankaku
Keyboard.0095 ---> Key.Unknown
Keyboard.0096 ---> Key.Unknown
Keyboard.0097 ---> Key.Unknown
Keyboard.0098 ---> Key.Unknown
Keyboard.0099 ---> Key.Unknown
Keyboard.009a ---> Key.Unknown
Keyboard.009b ---> Key.Unknown
Keyboard.009c ---> Key.Delete
Keyboard.009d ---> Key.Unknown
Keyboard.009e ---> Key.Unknown
Keyboard.009f ---> Key.Unknown
Keyboard.00a0 ---> Key.Unknown
Keyboard.00a1 ---> Key.Unknown
Keyboard.00a2 ---> Key.Unknown
Keyboard.00a3 ---> Key.Unknown
Keyboard.00a4 ---> Key.Unknown
LED.NumLock ---> LED.NumLock
LED.CapsLock ---> LED.CapsLock
LED.ScrollLock ---> LED.ScrollLock
LED.Compose ---> LED.Compose
LED.Kana ---> LED.Kana


Regards,

Dmitry
