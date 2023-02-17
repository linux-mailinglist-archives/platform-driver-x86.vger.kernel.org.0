Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C457E69AD47
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 15:03:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229663AbjBQODg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 09:03:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229673AbjBQODf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 09:03:35 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32CEA65698
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 06:03:33 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMGAg-1p9pa41UzG-00JIKG; Fri, 17 Feb 2023 14:50:14 +0100
Message-ID: <60af6134-3b0b-f8ec-1375-a9819a181911@metux.net>
Date:   Fri, 17 Feb 2023 14:50:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>, Ed W <lists@wildgooses.com>,
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
 <b402d146-5110-970a-3f5b-8c4c4859ede1@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <b402d146-5110-970a-3f5b-8c4c4859ede1@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:7EytO4h5xooRzFcD6bFqNZIK7hZKPCzOlhWRG5/syu3WyHxujdF
 nQ9YIHgakSZF8xk0oZRnbpx18KxUnHSqTkCRGkttW72m9ge0GSIy3STFNI+e//q7l3Q9PrP
 +yePHzm7Y5i/uCExlB5t6tWCtsS0E5Wpic+GueBoQb+JXVCJewMJvVD2iGe3GzFfBpRNO3f
 sLDVXtjjcf9QYhzXFAcXQ==
UI-OutboundReport: notjunk:1;M01:P0:C6CfPDH45DE=;oCBwvb+N9THfKqQ3M23VhMPzjRW
 CU+rO0tO1nqrY1z7jtog8GJk+331MRc+kXR7VsIVTcbmO9KU0OMu6I/Of9kjugiDQm+efmFsX
 YAUbxF0dOfLs0JaEy9GW16t/eEElI2vn8Xal2qOhIpD6SJNnhnZkcPuDbX3lzWGsuZQ+ECXmX
 /DLdR8HflWTftk88IAXiI81deym0L5AoPKuLL04uT97Rq2tHhsa8Q1BTCXZWg4iSNV1S773MR
 +eKuAgttz+mu82zs0rwP7+dGihHKX4LbBByswA9dxQt+GmR/ISIR7y8U4Eb3VdnQ1sz8FIaAx
 z6ijUzrnAYxYycUCnw5bfLtyE0qO6zS2DdKZ/ehZjuROxGWnxZtBZNuF9aXgEQCA3v9vm7/Gj
 IYrqUO9bAXgjztlO2PN/ZQRf72nCVEIVf5J9ePHqUI+lk5KoaVkMQylhKR+ZxXJTnXxq+jAsC
 tivGRb2VOEqiCKmusvjfGEGIwx56g7PNwGPRKBoTfo2mhowtrSzkdyQ1e7ZmEbo/ETmjigN3v
 Du3vUMjOzAUzExQhqXckVn7o8SWC1WtTL9xfmLIMUPbRLavYr0Udj+kAWjJbhYD7AEc2tIU3T
 PSjOHJ1CG/fzEWPFWNjxk8B+kKDZ1SqTG7Ar7nYbXyqh/exdTH4yhlJdoOJ8YUHBCu6o6bLp/
 SOl6vS4G/7p+Hh4LKPFDLMhb1GbVp2FKgQrPEYgxYQ==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 13.02.23 15:25, Hans de Goede wrote:

> It would be good to know the ACPI names. Also what happens with the ACPI
> registered LED devices when the pcengines-apu driver loads, does it
> somehow unregister those ?

It doesn't (hasn't any code for that). But the even more interesting
question is: does the acpi driver lock the IO space so my gpio driver,
and so the apu driver itself, can't initialize at all ? Or are we in a
situation where two different drivers meddle with the same chip ?

> If the ACPI LEDs are not unregistered and keep working, then I guess there is no userspace
> API breakage when using pcengines-apu on newer APU models, "just" duplicate LED devices ?

Supporting both LED name schemes on the newer boards is an interesting
thought. Do we have some way for aliasing LED names ?

OTOH, I wonder whether we need the model specific LED naming at all.
In the old apuv1 driver, there used to be some (unsupported) LED-only
support for apuv2, which used model-specific naming. When adding full
apuv2/v3 support, I specifically chose not to do this, since I don't 
want userland having to care about the specific model version. And the
naming is a bit more clear on the actual meaning of these LEDs.

>> - Additionally, we already broke this in the (distant) past because there was a previous APU driver
>> which used different names still...
> 
> Just because we have gotten away with it once, does not mean we should do it again :)

Back then the situation was different. Haven't even found anybody who's
was actually using this in the field. This ancient driver (actually made
for acpuv1, which is totally different HW) was only serving the three
front LEDs, nothing else, and blocked using the other GPIOs (eg. button)
Some people out there did weird hacks by directly writing registers from
userland (obviously w/o loading the ancient driver) - and even worse:
pcengines publically adviced to so.

> For the new models I'm fine with whatever LED naming is preferred.

NAK. The problem here is: userland now has to differenciate between
various models again. Applications suddenly need to be rewritten in
order to work with the next higher model, or it fails. That might be not
a problem for home users, but in the industrial field it is a huge
problem: you suddenly end up with two product configurations or need
extra SW complexity to cope with several models at runtime - and this
even grows with the next one.

Exactly what I wanted to prevent once and for all.

Since the meaning of these LEDs doesn't change, there's just no need to
change their naming.

> For the new models my main worry is what happens to users of the ACPI exposed LED devices
> (under /sys/class/leds/)  once the pcengines-apu driver starts binding/loading on the new models ?

The more interesting question is whether the gpio driver can get the
iospace of the gpio devices. Haven't got one of the new boards, so
couldn't yet check what actually happens there.

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
