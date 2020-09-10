Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 82601264AAA
	for <lists+platform-driver-x86@lfdr.de>; Thu, 10 Sep 2020 19:07:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbgIJRHT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 10 Sep 2020 13:07:19 -0400
Received: from mail-40140.protonmail.ch ([185.70.40.140]:61921 "EHLO
        mail-40140.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726922AbgIJRGw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 10 Sep 2020 13:06:52 -0400
Date:   Thu, 10 Sep 2020 17:06:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599757605;
        bh=VJcp7+qz069nagl6L7nTF7GUcmC5MLPx3jflSSft61U=;
        h=Date:To:From:Reply-To:Subject:From;
        b=wygwk980YG/d5YcACo4jtxMeqfdhjJMnh0YgPpK4ynIrdoy3RUIBDGG5lUyh08mIo
         PibjUKEj7hsTW+5DqTOwaOGEqXOl1RG+4MsPA4l346SPpdzT7yQKcuG0+RxAT/cYOX
         zoyXHT/pprV5I1o8snJ11Q+XI/nvSp8Pi/GRmijk=
To:     Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: platform/x86: intel-vbtn: reports SW_TABLET_MODE=1 even if that's not the case
Message-ID: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,


it has been reported[1], the 'intel-vbtn' driver reports SW_TABLET_MODE=3D1
even if that doesn't  accurately represent reality. That renders the
built-in keyboard and touchpad unusable when using libinput.

The device in question is

 DMI: Hewlett-Packard HP Pavilion 11 x360 PC/8050, BIOS F.28 08/11/2015

with chassis type=3D10.


The ACPI[2] device is as follows:

 Device (VGBI)
 {
 =09Name (_HID, "INT33D6" /* Intel Virtual Buttons Device */)  // _HID: Har=
dware ID
 =09Name (VBDS, Zero)
 =09Name (ONTM, One)
 =09Method (_STA, 0, Serialized)  // _STA: Status
 =09{
 =09=09Return (0x0F)
 =09}

 =09Method (VBDL, 0, Serialized)
 =09{
 =09=09P80H =3D 0xD1
 =09=09^^PCI0.LPCB.EC0.IVBD =3D One
 =09}

 =09Method (VGBS, 0, Serialized)
 =09{
 =09=09If ((^^PCI0.LPCB.EC0.ROLS =3D=3D Zero))
 =09=09{
 =09=09=09VBDS =3D 0x10
 =09=09}
 =09=09Else
 =09=09{
 =09=09=09VBDS =3D Zero
 =09=09}

 =09=09Return (VBDS) /* \_SB_.VGBI.VBDS */
 =09}
 }


Seemingly, the 4th bit is set instead of the 6th (that is what the driver e=
xpects)
when not in tablet mode. This causes the driver to always report SW_TABLET_=
MODE=3D1.

This issue has been (most probably) introduced by commit cfae58ed681c5fe018=
5db843013ecc71cd265ebf
("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Lapto=
p" chasis-type").

As a sidenote, another interesting thing is that seemingly no ACPI events a=
re fired when
the device is "folded".

What would be the best course of action?


[1]: https://forum.manjaro.org/t/keyboard-and-touchpad-only-work-on-kernel-=
5-6/22668
[2]: https://filebin.net/e1x29ym3jjo9q5ah (expires in one week)


Regards,
Barnab=C3=A1s P=C5=91cze
