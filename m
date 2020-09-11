Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9A4D826764D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 01:01:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725907AbgIKXBT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 19:01:19 -0400
Received: from mail-40141.protonmail.ch ([185.70.40.141]:21048 "EHLO
        mail-40141.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725924AbgIKXAm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 19:00:42 -0400
Date:   Fri, 11 Sep 2020 23:00:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599865238;
        bh=M+KJBsmTcjnoawsZVOpy3v4G0NS5HCbXhXISZ3C3cJA=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=CHNT/6zv48jog/IDM4TGIRyNmXVwTHZCjvIB/Zwc2cEkOGK1HSSDxVyNCnrGac/C0
         I36jmu8evYnwI8u8gpLHZ9xu9MdmQknSXbnlk9sum82tORoqpMij38+UnhNOxx1CUu
         mfTkI/9qPRbE1+TTFHTeNc0MZqZJ0NsCMAf03KQE=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: intel-vbtn: reports SW_TABLET_MODE=1 even if that's not the case
Message-ID: <GMp06zPfgYjjqpspL-HMXHNK7Ueq2GXKEFrDNbi8Rp8xBBK-JFXFB_70z-ZukFX5N_z2jgWv_lb_KVl3r4cZEpBWLXiHKkVt-ldtSVK8D7g=@protonmail.com>
In-Reply-To: <e14f5acb-7533-19d9-246e-bc7fedbd1283@redhat.com>
References: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com> <e14f5acb-7533-19d9-246e-bc7fedbd1283@redhat.com>
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

Hi,

thanks for the quick response and patch. I compiled a kernel and
the user reported that it no longer reports SW_TABLET_MODE as active,
and the keyboard and touchpad are usable.


> > As a sidenote, another interesting thing is that seemingly no ACPI even=
ts are fired when
> > the device is "folded".
>
> Hmm, that is weird, there is a handler for such an event in the EC event =
handler
> table in the DSDT. How did you monitor this?

acpid + acpi_listen, evtest, and now evemu-record. None of them show any ac=
tivity.


> Can you ask the user to run "sudo evemu-record" and then select the
> "Intel Virtual Button driver" device? That should now report 0 as state
> for SW_TABLET_MODE when booted in normal clamshell mode; and hopefully it
> will change to 1 when the user folds the 2-in-1 into tablet mode.

Reportedly, that does not happen. It stays zero. Interestingly, the keyboar=
d
and touchpad are disabled nonetheless in tablet mode. Here is the evemu-rec=
ord output:


 # EVEMU 1.3
 # Kernel: 5.4.64-1-MANJARO
 # DMI: dmi:bvnInsyde:bvrF.28:bd08/11/2015:svnHewlett-Packard:pnHPPavilion1=
1x360PC:pvr0979110000405F00000310180:rvnHewlett-Packard:rn8050:rvr64.20:cvn=
Hewlett-Packard:ct10:cvrChassisVersion:
 # Input device name: "Intel Virtual Button driver"
 # Input device ID: bus 0x19 vendor 0000 product 0000 version 0000
 # Supported events:
 #   Event type 0 (EV_SYN)
 #     Event code 0 (SYN_REPORT)
 #     Event code 1 (SYN_CONFIG)
 #     Event code 2 (SYN_MT_REPORT)
 #     Event code 3 (SYN_DROPPED)
 #     Event code 4 ((null))
 #     Event code 5 ((null))
 #     Event code 6 ((null))
 #     Event code 7 ((null))
 #     Event code 8 ((null))
 #     Event code 9 ((null))
 #     Event code 10 ((null))
 #     Event code 11 ((null))
 #     Event code 12 ((null))
 #     Event code 13 ((null))
 #     Event code 14 ((null))
 #     Event code 15 (SYN_MAX)
 #   Event type 1 (EV_KEY)
 #     Event code 114 (KEY_VOLUMEDOWN)
 #     Event code 115 (KEY_VOLUMEUP)
 #     Event code 116 (KEY_POWER)
 #     Event code 125 (KEY_LEFTMETA)
 #     Event code 240 (KEY_UNKNOWN)
 #     Event code 561 (KEY_ROTATE_LOCK_TOGGLE)
 #   Event type 4 (EV_MSC)
 #     Event code 4 (MSC_SCAN)
 #   Event type 5 (EV_SW)
 #     Event code 1 (SW_TABLET_MODE)
 #        State 0
 #     Event code 5 (SW_DOCK)
 #        State 0
 # Properties:
 N: Intel Virtual Button driver
 I: 0019 0000 0000 0000
 P: 00 00 00 00 00 00 00 00
 B: 00 0b 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 1c 20
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 01 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 02 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 01 00 00 00 00 00 00 00 00
 B: 02 00 00 00 00 00 00 00 00
 B: 03 00 00 00 00 00 00 00 00
 B: 04 10 00 00 00 00 00 00 00
 B: 05 22 00 00 00 00 00 00 00
 B: 11 00 00 00 00 00 00 00 00
 B: 12 00 00 00 00 00 00 00 00
 B: 14 00 00 00 00 00 00 00 00
 B: 15 00 00 00 00 00 00 00 00
 B: 15 00 00 00 00 00 00 00 00
 ################################
 #      Waiting for events      #
 ################################


I have no idea what might be going on with that laptop, but fortunately,
the patch seems to have solved the most pressing issue.


Regards,
Barnab=C3=A1s P=C5=91cze
