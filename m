Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 979AD69B266
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 19:34:54 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229575AbjBQSex (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 13:34:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229445AbjBQSew (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 13:34:52 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 916E262FDB
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 10:34:48 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MekvV-1osNpb3sW5-00amU9; Fri, 17 Feb 2023 19:34:23 +0100
Message-ID: <08e5e155-fa2b-de5d-39bb-b5ef638f56e3@metux.net>
Date:   Fri, 17 Feb 2023 19:34:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     Ed W <lists@wildgooses.com>, platform-driver-x86@vger.kernel.org,
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
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <3a36b460-9108-5c83-b4f6-42b4718afcf0@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:NlHjOcP9b8sTFHoNAQ2j+Xc9JrKNd0kbFa3VP7+iVKn3MSYYaBa
 Qi4CkZydNFNQ0oifBAcLLVUxi1wrx/gjDdM9tdRT7Eh9dbhnNPa+VKl9R8Zmspv4DvIRDiJ
 cs6UzOehFDcWDG5J5GW+jhxef7CzP80RKLpcJp27FXUSIB4J5cm80gr25g2eu60HMQx6hfE
 luyGeUdw9E08VpV8JxbmQ==
UI-OutboundReport: notjunk:1;M01:P0:N8C4jypX8Yo=;+4W1hf8Z4WrueNg7mhrnHu9p9hR
 Vzui8YcNkCvHO3wLqjajpKrHg5HBOkBjM5fu4YAkdMPEKaIDFzXmr2ZJ0YO6Zx3XCBPJkCw5C
 lHNkJ9Hxa+x/7bGrvjGDo6i6b2akx0SHUtWXF52laC5NxGMn9bVPqpgUBrasLGq0lVPFteNMb
 wbmhTzZbbl6K+nnNLdZMNYDAoX8L/G57DXTxoWb4Y2H1LVu6UOuZ2CcQgtALi23A073eOGtyS
 lJ5DgVy+yS7W/Q2YUUlJr7yARt7l0dY3L9xXyZRKuRNxXUyhkY2t8UG5yUtGZJZMG2cR2pI0x
 fd7FNf/dTs9g/8VcJB+2YYDrdikYb/3SX5AneWWf9F79uJKWqcBXgrwmOWQo9gIr35uMRQAQN
 UMuBcaoeQB8YM0LD3YrvNkokfZa+kur8A93kO15jVYuPkwoHv+cMP50kIks+gEYFGp1+/f/FY
 NgSSAlu0NmYO+wWIzTa/nmxTkVOzQgoSDxYmvQ+uZsyjsZBU5OKXK1h7n/OT5Vh+pKODGW/5B
 5LMmzwyBbfG1zqQK1PpEeGYdDcPni14YLfUMXt3COVO2ieKvIzrf5Dg9wbqvITBijBa0FG4aY
 ucCtUeJEgDx/4Io0SacJ5VBM/8sATgC6lP1aS5rC7d/vY1xikcWOhD57j8RhipBJgOOVlzkJQ
 ChhLAxnNOR7pd6uwF3968Pv8YZijsgDHfwJlgWlvGA==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 13.02.23 14:06, Hans de Goede wrote:

> ACPI can sometimes be unreliable, but that is just down to it being badly implemented by
> board vendors.

The problem is: it's hard to find any vendor who does it really right.

And frankly, it's horribly complicated to implement, compared w/ DT.

Actually I wonder why that has been invented in the first place - back
then DT was already field-proven, and already technically superior.

I only know one thing that DT doesn't have (and I'm very thankful for
that): imperative bytecode. This weird idea probably comes from the
ancient realmode/DOS times where BIOS vendors had the funny idea that
the BIOS should be some universal driver blob. This already failed under
DOS (applications brought their own drivers for good reaons) and became
worse w/ protected mode. And w/ EFI a whole new level of weirdness.
Even on coreboot we have to deal with horrible fw blobs.

Maybe our (IT industry) worst mistake was ever allowing silicon or board
vendors to put their hands on software and not publishing full specs.

> If used correctly it is no more or less reliable as any other code, so its reliability is not
> really a good argument not to use it unless the ACPI code on PCEngines devices is known to
> be unreliable ?

It's actually known to be unreliable. And very incomplete.
See my other mails.

Oh, one thing I still forgot to mention: if I read the code correctly, 
the abused AMD0030 device causes the whole FCH register space (at least 
the part that *may* contain gpios) as GPIO lines and making them
accessible from userspace. We already *know* that some of them aren't
gpios, but due to lack of specs (blame to AMD), we have no idea what
they actually, depending on individual SoC models (or even between
production charges). This is really irresponsible - that could possibly
lead to hardware damage.

>> If people wanted to use ACPI instead of the APU driver, why not just build their kernels without the APU driver linked in?
> 
> Most people do no want to / don't have the skills to build their own kernel, so they are
> going to be relying on a distro (including openwrt as a sort of distro) provided kernel.

Distros usually ship them as modules. Blacklisting isn't so hard to
understand. Note that these boards aren't made for the average John Doe.

PC-engines used to advice their users to do much more complicated and
actually dangerous things like writing raw HW registers from userland.

> For the upstream / mainline kernel we have a very clear defined policy of
> never breaking userspace (APIs). Even though these are designed for embedded
> usage, some people might be running normal distro-s on these.

People are actually running normal Distros on these. The driver was
originally written for industrial devices running Debian.

> Yes a boolean module parameter with the default value of the boolean
> configurable through Kconfig, so that e.g. openwrt can just pick
> default values matching what it wants and won't need to specify
> anything on the kernel commandline.

Since Openwrt keeps its own patch queues for dozens of packages anyways,
I wonder why that's an issue at all. And I still wonder why anybody
prefers an new, inconsistent, model specific naming scheme over a
existing consistent one.

> Note this is not just about the mapping though. From what I understand
> about this, using the pcengines-apu driver conflicts with the ACPI way
> of accessing the LEDs and gpios.

Yes, it's better to blacklist the pinctrl-amd driver (which was made for
very different devices) on APU boards. Or even better complain
@pcengines, when they ship devices with broken new firmware.

> So for the new APU models, there should be a module-option to decide
> whether for probe() to continue at all on those models or whether
> it should just return -ENODEV (so the driver won't bind), leaving
> things just as they were before this changes.  The purpose of this
> is to keep the ACPI way of accessing the LEDs, ..., working.

Why should be keep their *new*, *incompatible*, *incomplete* ACPI stuff
working at all ? Who will actually benefit from that ?

Actually, since thats much newer than the already mainlined, field
proven traditional way and doesn't add any new functionality (in fact
castrates functionality), the more appropriate description is "make it
working" and "disable/break existing functionality".


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
