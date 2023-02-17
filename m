Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1A58069B340
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 20:43:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229822AbjBQTnT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 14:43:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229775AbjBQTnS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 14:43:18 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 309265BD9D
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 11:43:16 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MQ67s-1pFoxv1Lrk-00M5Ux; Fri, 17 Feb 2023 20:42:43 +0100
Message-ID: <a71e5878-905b-db3e-53d7-c6680098a76a@metux.net>
Date:   Fri, 17 Feb 2023 20:42:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>, Ed W <lists@wildgooses.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <cb93fd68-5195-0d5e-cd40-5eba61df4c38@wildgooses.com>
 <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <3fffc76d-4e1b-4eef-3d9f-6d61cecacb46@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:Yq8KznrPmr5R6JJ5fTlnUWybZx7r0kggiZnpoOJ4T7D+QZyU2W4
 mJTlYoWtQ7NGichh5ZxPN3HXTmjBMkZgCiYRgruQJuDGoOK0NnB50TfXqzcI3tbisRZzofJ
 BiC3Yei1GbpDiAKYPYPt6o7ogVqWKaVixMIeA1VrU74pYwlgId0d04XKpZNwMrWS8gzxb9f
 egxTyI71UtpBeCKK6Vs5w==
UI-OutboundReport: notjunk:1;M01:P0:ls7gMlVjil0=;MYHDpy1gwAKi0GRnbt6QrMNw3xa
 S2EmfbwYBapqt+bdEj1beaO14RW7vbeZetShIWsIfcHbJ6R5Csuu1WPv5s+iQszFJlSLWA/2v
 xSKtFAzcpffjKfBryaKCmFslSUT3aO0uMqzYgd/fsNmC9e8d3fjJfmuXzq1RdLwI5DJPB4BNh
 u0LGvyib+qCr/79VsegkFFsCqtzQC1WUKStBPSrzaMN3eyGrczuMVHs+C1SAQ4rZ9z3cKZVhD
 rcba5uyidsYQrNrYXELnysQHqp5l3UoRprCM1p9LZjbM9xVfYGsORtbzRPqDvpTMVl52CB5ZH
 pSDd8tobGR6BDHc94i1aKd3UgloWM3nvl4ekSQEyTP4DSMhU/Ch50xhnYJe5QgL+hhxEaZWoj
 fQnkCWzh+pMw3ypQ+uuaSP+/oD6QgH53cxgWQB+6AiM+9IHlI2E0T7h4MxC6IP/is4w1SlS/w
 1qNIB4lrMtKdHHyCylFpDitN2c6LkJlbCaik43qaWPIMP8E8Fv+YO8BrW1mgxF7zEJuEZZyeR
 09xyX6Sc5+36nydmoGcGV/fERD+xtq77Sw6yn5joXh3cb3F5XcAHXzP0p98GSER4d8sfD6i+0
 QV6Vwg7EkpZPTRSoJ9tSVzAfjvt6L7zphsNeVMgIZ5RU6T7mYKoLHjX/fBzmwnh3sXK+9tNv5
 gPnqTfa7rbDA/HyE+j1yfXrnmXMnzLdbD6uRQspmTw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 02.02.23 12:14, Hans de Goede wrote:

Hi,

>> Overall, if one could start again, the unifying feature would be label slots logically, ie modem1,
>> modem2, wifi1, wifi2, rather than numbering them based on how they are wired on a specific board rev.

The naming should tell what they actually are, not what somebody might
use them for. there're dozens of ways to populate these slots.

As mentioned earlier, if we wan't some more high level view, eg. this
one is RST for baseband1, we should wire that into the corresponding
subsys, depending on how the slots are actually populated. For wifi
this would mean netdev (does that even have some interface for that ?),
for basebands ... no idea :(

>> Additionally, users who didn't load the APU driver, likely had ACPI named devices and these all have
>> different (and to my eye, more logical names). So whatever we decide to do here will cause some
>> breakage and inconsistency...
> 
> Hmm, can you elaborate a bit on this?  Does ACPI somehow expose the LEDs / GPIO to userspace
> already and will adding APU5 / APU6 support make those ACPI exposed devices go away ?

For older APUs, users who didn't load the driver are those using either 
a self-baked kernel or using a pretty or distro, or some that chose to
disable this driver completely. For the new boards, this can only be
those new enough to get the very recent firmware (one of the latest
releases) that added the (incomplete) ACPI stuff.

Oh, and those really should not try to play with arbitrary gpios, w/o
carefully looking at schematics and the pinctrl-amd.c driver - otherwise
something unpleasant might happen. No idea whether accidentially
overclocking dram or overpowering something might brick the board.

> Sorry for being a bit pedantic about this patch, but as a maintainer it is my responsibility
> to ensure that we don't break existing userspace, e.g. existing use-cases using the exposed
> ACPI devices.

And the compatibility with existing mainlined drivers. And not risking
hw damage.

>> Note that I submitted this previous patch "years ago", and I've somewhat given up on ever getting
>> the APU driver up to date.. I think in 2020, Enrico shot me down because he was working on some
>> grand unification for modem GPIO handling? (Enrico, please correct me on the details?) Hans, I think
>> if you search back to 2020 on "APU", you will see that you arbitrated in that thread?
> 
> Yes I vaguely remember back then I was hoping / expecting you and Enrico to sort things
> out, but that seems to have not happened. 

Well, IIRC we didn't come to an satisfying solution yet, and it didn't
seem to be important enough for mainlining back then, so the issue 
somehow faded away. One of the problems, IIRC, was yet more 
inconsistencies on various HW charges, but I don't recall exactly.

> I agree that we need to find a way forward here. I would like to get this resolved
> and to get something merged into the mainline kernel for this.

Since we already know that OpenWRT (and similar projects) has no trouble
w/ having kernel+userland in lockstep, thus doesn't need much concern 
here. Leaves just the mainline distro users.

Leaves two major parties of concern:

a) long term users that have existing applications on standard distros,
    and want to replace existing products with newer ones (eg. hw
    availability, more cpu power, ...)
b) New users that just happen to get a new machine with recent enough
    firmware to have ever seen the new ACPI stuff and actually uses it.

The party a) clearly doesn't want any breaking changes, also not when
switching to new model, which doesn't cause much other disrupting 
changes. (those tiny changes can easily become very expensive here)

OTOH, the party b) doesn't seem so huge, and most of them (at least what
I could find in the net) either don't realy on these features or are
hobbyists building their stuff with them - likely capable of fixing
their boxes on their own.

Another aspect: relying on the existence of one naming scheme doesn't
necessarily mean relying on the absence of the other one. (can we
somehow create aliases for leds ?)

> I also agree that if there is breakage it would be best to just break things only once.

Problem: the firmware vendor already showed being unreliable here.
And they're even changing the names with each board model w/o any
practical reason.

Does anybody really want to put his eggs in that basket ?

> Keeping the simswap signal as GPIO/pin number 4 instead of moving it
> to the end.

Note that the driver's pin numbers have nothing to do with the
registers. In contrast to 3mbdeb's hack, it doesn't expose the whole
largely undocumented register space as hypothetical gpios, but only
those known to be actual gpios. Their numbering is based on the order
of their introduction in the driver, and existing ones should never
change, in order not to break userland.

> And also instead of making changes to apu2_gpio_names[] (1)
> introduce a new apu5_gpio_names[] / apu6_gpio_names[] so that
> the labels don't change on the existing supported models.

Unfortunately only solving part of the problem: still breaks backwards
compatibility with existing applications.

> I'm less worried about the label change then about the index
> change, because typical GPIO use from userspace will use
> indexes not labels. So if having different labels on
> different APU versions is a big problem you might be able to
> convince me to change the labels on the old models too.

Yes it is. There are applications in the field looking for the labels.


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
