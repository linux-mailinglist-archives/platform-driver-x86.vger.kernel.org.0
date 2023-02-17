Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8BA4C69B209
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 18:49:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbjBQRth (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 12:49:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229659AbjBQRtg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 12:49:36 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E9B66A06C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 09:49:18 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMXYN-1p9cKD0Erv-00JWYH; Fri, 17 Feb 2023 18:48:50 +0100
Message-ID: <840c270f-2164-7d02-694f-5f2ba57a8fee@metux.net>
Date:   Fri, 17 Feb 2023 18:48:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Ed W <lists@wildgooses.com>, Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
 <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
 <5F93DF5F-BEC4-4B2A-A057-A895282A66B2@redfish-solutions.com>
 <3a36b460-9108-5c83-b4f6-42b4718afcf0@redhat.com>
 <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <59ded4b9-04e9-d5d3-98eb-af0d4340a2fa@wildgooses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:F9y7VT2zjBo+eMrvze8MVCta9sUW40wDafFNXFSO0iVmJ+vge97
 5t+hobx2shEDyXEO9aJ7+VUrl/mezQqx5RRH/2Pki1Xv15FQD1f/SIed96q5U9dl410QIZ6
 q5Ej48tq1Sy5GLtna7twkUngk6yhoHQdFkvMZAD24crnlaQ2VfnAEZR+sO9nEfi7TnOt8k2
 gEW3Ybrhr2GDTWvUih0BQ==
UI-OutboundReport: notjunk:1;M01:P0:BT18fvyYqfM=;GweeObN9kRq9/ymMmoMbI7pVkMc
 0Y2FX1o/QQxsAdSTHU9DqAegjZZD7EwvU06ANTE9NonF5iThYpxELmyCEKNP1QD0+VB2mRBeS
 4sZRJx3TIaw4ET5vjJb9d/DloCwiW/Avm2NiNGTuQgu/To/W9DmgLrGT/urh9Nk2Xo/cwHIt1
 96353RLb6uXiLvjWXQgGYaMt9OtuPYG/JBBD8aIbJqrQlhqiW7RfxCSHmXfBQW2TZadfavbe2
 XzBxjMLLurcPK5KKzDrt0gCf+HxS6xuztYEylKdDZtv1ycBVf3bSMy3naJZAgHXcLGWV/ixz0
 Dy/Llc35lWkG5CKEzBfiyP0W68A3BifjLQLdcN2WOxcsSMxPNvdTzJZu7AaRAX3RPlufOOayM
 hRAwdvWDjTR5o9S3KriOjhXtlRV5pLsTSKMJsns5oxCLlkT8vRZlFCKwGk9opvTX4shAK/lgi
 ++5i+tMmntvZm0iVSNB+evJqy5gkqQPenPvgRZsfvHaGq9P9YjUIM213ocfKqvUTuRctilHfd
 3z/3ZudU+6mwpWiVDVk5BeWFtk6MX2eWpe/vFwt5m5iXA9xcSrmYzBkXDXz/Z2e9JhOt4siNk
 Vq7Axic2deX3CVgvUhv/WBJahw69xzRTJJriiatnhpuKm3nJqmuToZzizGBvhJrrycSiQGg/N
 rarj4wi3xISErmnggExdlDslTXLDrTDon2qmaY0dzg==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 13.02.23 15:05, Ed W wrote:

> Minor nitpick.  The APU2 has i210 on the original boards. However, recently the shortage of intel
> chipsets has led to various compromise options and some boards are coming with i211 on. I'm not sure
> if Pascal will standardise on these for the future though?

OMGs, not again ...

No idea whats the actual difference between i210 and i211 from OS pov.
But if they need a different or newer driver, this can cause a hell of
trouble in the industrial field ... very unprofessional.

> So at least with the few firmware's I have tried, the ACPI works ok on APU.

The problem is: we can't rely on frequent firmware updates in the field,
those things require a full field roll.

> The history (without full details) is something like:
> 
> - A long way back in time, we had either a different driver in the kernel, or the ACPI used a
> different name for the LEDs and button. I forget the details without looking back at some notes

Well, we used to have some (very limited) support for APUv2 in the APUv1
driver (v1 and v2 have completely different SoCs). No ACPI support back 
then. This driver used a weird model specific naming, that didn't make
much sense at all (see my other mail). Since it blocked gpio access
(eg. no access to the front key), nobody really uses it (didn't find any
distro that actually enabled it).

People out there did ugly hacks by directly writing to raw registeres 
from userland. Even worse: pcengines advised guileless users to do so.

When implementing the full apuv2/3 support, I specifically chose a 
consistent and future proof naming scheme that does use semantically
matching and not model specific naming.

Some years ago, long after the new driver was mainlined and distro
shipped, pcengines suddenly began adding ACPI LED entries to their
firmware - using yet another, also model specific, naming scheme.
Haven't tried this myself, but got reports various reports, some
couldn't use my drivers anymore while others had dupliated LEDs.
But no support or other gpio lines, eg. the front key. Some releases
later, this been removed again.

> - However, I believe Enrico built the original APU kernel driver and that happened to use the old
> names, and then once the ACPI change happened, he feels/felt strongly that we should maintain the
> current driver, disable the ACPI and ignore the updated naming convention from the ACPI.

Well, we're actually talking about several different naming schemes:

a) the ancient apuv1 driver
b) my driver
c) several firmware versions

Just checked their recent coreboot branch:

They actually reinintroced their weird model specific naming again and 
also breaking other stuff like front key, rst lines, etc.

Now spent some to time to write them an detailed mail (yet again) and
also informed them how they damaged their own business in the industrial
field this way.

> - In any case, using only ACPI doesn't setup the GPIOs for things like the SIM swap chip and reset
> lines, etc. So I think a platform driver of some sort is the correct way forward

ACK. And they even highjacked the HID of a totally different device that
just happen to be similar enough that these few things happen to work
somehow by mere accident.

This is deeply embedded stuff, some of the lines are used internally in
SoC-specific ways. Playing around with the undocumented lines can lead
to very weird effects ... I have no idea whether some could even lead to
electronical defects (maybe internal LDOs or CLKs), broken microcode,
PSP lockout, ... IOW: bricking the Soc. We'd have to reverse engineer
aegesa blob to get a better understanding. (AMD as usual is very
secretive about this).

That's the reason why I didn't dare to give direct access to the whole
register bank - some regs seem to be totally different things, not
actual gpios.

historical note: the far ancestor of this, from the dark ages, was some
IP with several things like gpio, i2c, clk, which AMD bought in and
integrated into various SoC families. Since then these evolved in
separate ways, just happen to still share some similarities. It seems
even recent Ryzen still have some pieces of it.

> - I think my patch from a year or so back attempted to swap the kernel names to match ACPI (need to
> double check that?). This was not unreasonably resisted because it would break userspace relying on
> the names used by the LED driver.

I recall something like that. And even more: this would make userland
API model specific. Exactly the kind of things we don't like in the
kernel.

> - All boards, except APU5 have the same basic shape and 3x mpcie connectors.
> - However, although the connectors are the same, they don;t all have the same things wired to them
> - You actually have 2x USB (with up to 2x SIM), 2x pcie, 1x msata

I also recall something about missing wire'ings on certain charges.

> - So based on studying APU1 and APU2, which had a separate msata and the other 2 ports wired up
> consistently for wifi/LTE, people named the GPIOs to match the mPCIe port numbers, ie LTE Modem 1
> was on mPCIe port 1, so name the gpio something like mpcie1_reset

Yes, these lines were originally meant as a generic slot reset. Actually
the naming isn't 100% correct, since it's not a pcie channel reset, but
a per-slot line, not per pcie-link.

> - Then came APU3-7... These boards flipped around where modem2 was. So you now have a situation
> where userspace needs to know that they should toggle pmcie2_reset on APU3 and mpcie3_reset on APU4,
> or whatever it really is.

Unfortunately yes. To get rid of this problem, we'd need some "baseband
subsystem" capable of resetting those devices - here we could link the
baseband's RST signal with the corresponding board specific pcie rst.

> - So my previous attempt to sneak in a change was to rename the GPIOs to be something more like
> "modem1_reset" and "modem2_reset" etc. This way the GPIO names stay identical across ALL boards,
> even though the slots might jump around board to board. 

But that mixes up semantics and only makes sense when these slots are
really populated this way. This now goes out of scope of this platform
driver, since it doesn't really know what's inside the invidual slots - 
would need another layer of probing.

Since the gpio driver doesn't provide anything on its own, but wants to
be configured by a platform driver, we - technically - could assign
multiple gpio lines to the same hw register. This would give us some
kind of aliasing. But before doing so we really have to check back w/
gpio subsys maintainers whether this could lead to some ugly side
effects.

 > Technically, we could assign
> This is clearly a better solution if we were
> starting fresh, but it has consequences for a (very?) small number of users 

Define "users". In some twisted ways, power supply of whole cities could
depend on it (sorry for being so mythical, but I'm still under NDA :().

If we do some change here, it should be clear that this may only affect
newer devices, that - at least to my knowledge - aren't used for any
critical applications.

Note that the "never break userland" philosophy is one of the main
success factors of the Linux kernel :p

> Well, also you don't fix the problem long term. There is this jump in naming if you pick one over
> the other. 

And the pcengine/3mdeb's ACPI naming is again model specific :(

Is there anybody out here who really enjoys keeping model specific
quirks, that won't be necessary if we (kernel folks) just take care
of some consistent naming ?

> Plus ACPI doesn't setup the sim swap line (and it may not setup the switch as people want
> it? Can't recall if this is a problem?)

Or the pci RST lines (which turned out to be critical in the field).

<snip>
>      However, note that the APU5 has 3x SIM swaps, one for each modem (each modem has 2x SIMs). APU4
> on the other hand only has a single one, it just inverts how the 2x SIMs connect to the 2x modems

Canonicalizing this stuff really needs another layer of abstraction
that's capable of understanding the actual semantics (basedband subsys)

Anybody here willing to get his hands dirty on that project ? ;-)

> Important Note: Realise that at this point this discussion is heavily theoretical because many
> boards don't have the reset wires setup correctly, 

Yes, we had the same problem. Returned them as broken, didn't match the 
spec. (not sure whether I still have one of those lying around)

> or their functionality might vary board release
> to board release. eg I paid PCEngines to have mine re-enabled, because they ship them disabled by
> default. 

Any idea what they actually did there ? Actual soldering or just some
configuration issue ?

> Also in my testing they don't operate as expected. So it's highly unlikely there is a
> single user in the world actually using functionality other than "Leds", "mode switch", and "sim
> swap" (and even sim swap GPIO is likely to be restricted number of users).

One of my clients (who also sponsored me for the driver) actually uses 
the RST lines when modem is bitchy for too long. Haven't heared back
from them for quite some time, so they probably didn't have major
trouble (yet).

> So we don't lose sight of the big picture, I think the remaining detail we are debating is something
> like:
> 
> - kernel driver names the LEDs something like:
> 
> /sys/class/leds/apu4:green:led1
> /sys/class/leds/apu4:green:led2
> /sys/class/leds/apu4:green:led3
> 
> - However, ACPI gives different names (I forget the details)

Latest firmware uses apu[2-7]:led[1-2], depending on which model the was
compiled for (assuming the corresponding define is set correctly - I'm
not entirely sure about that, considering their hackish ways of working
;-)).

> - Additionally, we already broke this in the (distant) past because there was a previous APU driver
> which used different names still...

Very different situation: we really broke a small handful of people. I
couldn't find a single one. The people I talked with, who did use these
gpios followed the dangerous suggestion from pcengines website, directly
writing to registers from userspace.

> So I think my rejected change tried to simplify the LED names and drop the apuN bit. However, I'm
> really not passionate about any changes here. I have a simple wrapper script for the old Alix and
> newer APUs which just lets me set any LEDs by number. OpenWRT is welcome to use this?
> 
>      https://github.com/nippynetworks/gpio-utils

Well, that might be okay for you. But I really don't want all people
out there - especially industrial applications - to puzzle around, with
each new board model. That's not my standard of quality.

We all know that firmware developers tend to have much lower quality
(oh, I really don't wanna start talking about what I had to see in
even more rigid fields like medical industry - a case where unthoughtful
overregulation leads to very poor quality), but we can - and should -
do better. The Linux kernel's success largely comes from its high
quality standards.

> 1) Have we all agreed and signed off on the GPIO changes to naming, caveat we maintain the current
> numbering? If so then lets tick that off

I don't recall signing-off that. And still NAK on any userland api
changes.

> 2) There is a debate about whether to change the LED userspace naming. I don't really want to push
> this up the hill though? Proposal is to either sync with ACPI and offer a back compatible flag, or
> we could just keep the naming as is and allow it to continue to deviate from the ACPI naming? I'm
> cool with either? (although I don't like the current naming...)

Option b) unregister the brokenly designed acpi stuff and keep things as
they are. Pcengines/3mdeb broke the kernel, and they we're aware of the
problem for years now. Maybe their actual problem is not writing useful
commit messages ... but the guy who dropped the original code back then
was the same who reverted his own commit recently - seems he's got a bad
memory :p

Frankly, I'm beginning to become really upset about these firmware
folks, especially in the acpi area. Rarely seen so much poor work like
there. We're used to that from big corps in the consumer field, but for
a company like pcengines, this is very very disappointing.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
