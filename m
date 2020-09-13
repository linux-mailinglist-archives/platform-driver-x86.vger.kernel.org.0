Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5B0FC267F53
	for <lists+platform-driver-x86@lfdr.de>; Sun, 13 Sep 2020 13:30:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725928AbgIMLah (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 13 Sep 2020 07:30:37 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:25241 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725925AbgIMLac (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 13 Sep 2020 07:30:32 -0400
Date:   Sun, 13 Sep 2020 11:30:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1599996628;
        bh=/hvV77UW8bk0SQLfivaTogk88b1zriV7+U0Iq1Eyo1A=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=PS2Ge2AHVl81ircX47Hih/Y4ii0/Oi6RyXZoNRuubs5mATixNu2uQu7eVPVH6qG2/
         H1mW7V7q7Lb9YWAepXTVFKI6/dOsGswZq/d6IFeCrKiAioktywohS/1AHeXYqs1zGa
         5cLUQ6QazXVwxeCDK/p1Hv9L6BwcwOWozrJJ5z0c=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: platform/x86: intel-vbtn: reports SW_TABLET_MODE=1 even if that's not the case
Message-ID: <k82rbLZBwxhSYxUPWnqP0G_oJ3yof1ZyFqrjfjqOOcU1mciHkULzR4VkExiLjqoF2yalSyx2OOmlwnLwkFYVJC4SLim1Bf1EU6A2elFEjZk=@protonmail.com>
In-Reply-To: <9f504b07-8c2b-c9d7-a1c0-916bee64239f@redhat.com>
References: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com> <e14f5acb-7533-19d9-246e-bc7fedbd1283@redhat.com> <GMp06zPfgYjjqpspL-HMXHNK7Ueq2GXKEFrDNbi8Rp8xBBK-JFXFB_70z-ZukFX5N_z2jgWv_lb_KVl3r4cZEpBWLXiHKkVt-ldtSVK8D7g=@protonmail.com> <9f504b07-8c2b-c9d7-a1c0-916bee64239f@redhat.com>
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

> Ok, so at least the regression is fixed.

Thank you again for the quick solution.


> > > Can you ask the user to run "sudo evemu-record" and then select the
> > > "Intel Virtual Button driver" device? That should now report 0 as sta=
te
> > > for SW_TABLET_MODE when booted in normal clamshell mode; and hopefull=
y it
> > > will change to 1 when the user folds the 2-in-1 into tablet mode.
> >
> > Reportedly, that does not happen. It stays zero.
>
> Bummer, the DSDT does have this embedded-controller event-handler,
> but I guess that is not getting triggered then:
>

I have seen Q49 as well, so I'm also surprised it doesn't work.


> [...]
> If you feel like digging deeper, you could try to figure out
> why the _Q49 method does not get called. Chances are it has
> something to do with the ACPI embedded-controller (EC) code.
>
> You could ask for a full dmesg and check for:
> a) kernel cmdline parameters which should normally not be there
> b) ACPI EC errors

dmesg has been checked, and the only ACPI errors that appear seem unrelated=
.


> And maybe also see "cat /proc/interrupts" output and check that
> there is an "acpi" interrupt handler (typically IRQ 9).

Since acpid picks up events when the power cord (dis)connected, I'm positiv=
e
there is one.

I think I'm gonna let this be for now since the issue is fixed and I don't
quite have the capacity to spend time on this. Thanks for the help again.


Regards,
Barnab=C3=A1s P=C5=91cze
