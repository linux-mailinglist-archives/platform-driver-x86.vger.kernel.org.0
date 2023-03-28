Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0A186CC0C6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Mar 2023 15:29:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbjC1N3P (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Mar 2023 09:29:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232642AbjC1N3O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Mar 2023 09:29:14 -0400
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD4D5AD03;
        Tue, 28 Mar 2023 06:29:12 -0700 (PDT)
Received: from [192.168.1.155] ([92.225.143.37]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MekKJ-1qHadm3seL-00ajiZ; Tue, 28 Mar 2023 15:23:28 +0200
Message-ID: <a6a68ddd-7b70-8aaf-1497-010b65eee87b@metux.net>
Date:   Tue, 28 Mar 2023 15:23:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Redesigning APU platform driver: combined mpcie/msata port
 representation [WAS: [PATCH v3 1/1] x86: Support APU5 in PCEngines platform
 driver]
Content-Language: tl
To:     Ed W <lists@wildgooses.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        Enrico Weigelt <info@metux.net>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230102065447.3447284-1-philipp@redfish-solutions.com>
 <01dbd065-693b-e5fe-5aaf-d74971d6fe7d@redhat.com>
 <AA8BB3C5-8101-4DE2-8FE2-87EBF5329BA3@redfish-solutions.com>
 <670ac95d-cf00-d589-5779-ae754fffd921@metux.net>
 <64B23D00-A81F-4CCA-80A3-9AC58A12E09E@redfish-solutions.com>
 <b1b18104-897f-d428-931e-12d2d61252b9@wildgooses.com>
From:   "Enrico Weigelt, metux IT consult" <info@metux.net>
In-Reply-To: <b1b18104-897f-d428-931e-12d2d61252b9@wildgooses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:K/eMYWIR6Zkdqo6FROySI+IZBOSpQOgvnXf0b3mrJVr5F+BkyJ+
 pA167F23ZzeASonAQGIiJWvvkP10+kFlP/6/fuD7zSjnvqif0NLfwRH3bq2I63knfgtxLBE
 HSX/vwXYmCu7yZ6RAR2O7shoTi7pgACXWz1+W8NJsJscXBYHwBEo+ZfRHEjb9r1jLyLQeZL
 DP1PdSZdH1Dj5lKUsFdpA==
UI-OutboundReport: notjunk:1;M01:P0:SdD2hCcK/+w=;vFWYieZPQtz/HnCutcDPXhPoP8n
 gdO3DpxGrR8fftN2MQO6HJ3hxazFnoMwfJHDgo8ZL02eojjcGnEY0LSEp0CVaQmXc2dgyitl/
 pgEeIkGCYE5B9GhSx/aPLttyK6Xuok/SPkHp5AAqO1d+rf80vrygr/uNQEjuaYbYoLSZvWDhO
 YaJZnjorJ7taSek83IENUgtcgmgm7bLZA9NFyIjWh6GbvjHl3yZpEGcHAoEJFyyqcUNbSzR7b
 6Cx5DPb9y1ISX3mypnPgEhrAoesOMpHJA5Ohem8WljSxvGahtG+f+GI4DHew0tZAXPm2n+E/O
 NUvw9xZ1oxjZNgO2Mr7HMIR3tOO7RW5nllXmzWM+hbDvxedUWUWEBOVxEKPSp79WAW+0LAOl9
 FJ8lx9L9zTPkCSS9dfZUmx/mdSCeNBeCbErRMVDyi3ZP46JKdW/ewSaUXXFYyLSPI/Z1IxvGm
 scMSHw2pFaQurWNr5a+zX6Yq9Gdjuwej0wHHGk/j3jiJixUMmJ4Abr0HXFwwbsTdlnfiq8VJ1
 +1ODEPP3HPJ58Hr5OAWrdkNdFR+cTBBKCPaLsbzi2GCgBBVRSEnSRnVOuxRDTewAjkDzbCc7Q
 it/L68kyilZHClBjdeWZUOD9Ivpgcz3imf4ZpJht2R07B+/F+dn7vKeAzNMej0R+JLmqZQShe
 tA40+RNhNMGvzdDy05NvWGJWSjrBqcV/VTVMrxh/Qw==
X-Spam-Status: No, score=0.0 required=5.0 tests=RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 27.02.23 14:48, Ed W wrote:

Hello friends,

sorry for the delay: currently busy w/ finishing some other, completely
unrelated projects (ugly osgi stuff) and need to care about family
matters ... so please give me some more time to get my head around :o

In the meantime checked that my most concerning applications in the
field are using sysfs interface (and only apu2/3), so we can live w/
adding syminks (maybe by udev) to remain compatible.

So, I'm open to changes, but please let's think this through very very
careful, so we don't need to change that ever again - and hopefully
something more generic than just the apu boards.

> I think this supports the proposal on the table already, that we should prefer naming to be "modem
> orientated", rather than "pcie slot" orientated.

Why not port oriented ?

Of course we'd need some kind of (maybe just informal/conventional)
abstraction of ports, representing the physical slot (instead of pci
or usb ports).

Does anybody here have an formal specification of these physical ports ?
Is there some reliable standard that describes the pins and their
actual meaning or do HW vendors just happen to have some informal
aggreement ?

> For example, on APU2, the PE3/4_RST lines are wired to PCIe slots 1 & 2 (which are the two with USB)
> But on APU4, the PE3_RST reset, USB and SIM lines move from slot 1 to slot 3.

Saying "the pci slots, which also have usb" shows some confusion about
what we're actually coping with.

Looking at an APU2 or 3, we have

* mPCIE1
* mPCIE2
* mpCIE3 / mSATA

Now it's getting interesting: mpcie vs msata are electrically
incompatible. There could be some way for auto detection, since some
lines are reseved in either one while reserved (left floating) in the
other one. Yet have to clear more carefully which the overlapping lines
actually are - maybe sata vs usb ?

I think we actually have at least two different types of ports here,
while some might even miss some features:

a) standard mpcie (with usual pcie+USB)
b) mpci/msata: msata instead of usb

The RST lines are goint to certain *connector* as a whole, not just
either pci or usb.

Thus, we really should have some representation of the port as a whole
(each has it's own name and may or may not have an RST line, may or
may not have USB or SATA lines).

Another interesting aspect to consider:

I haven't found any precise definition of how long the RST lines must
be pulled. Probably there's some minimum time, but not an hard maximum.
In the long run, we should have some reset functionality that handles
that, instead of having userland playing around directly w/ raw gpios.

And yet another one: the mpie port has some more interesting things,
eg. transceiver power (->rfkill) and activity signal. Yet have to check
which ones are actually connected on which boards.

Bottom line: we really should invent some kind of subsys for those
things, so userland doesn't need any board- (or even just family-)
specfic logic.

In a few weeks, I've hopefully got some more spare time - then I'll
look closer into it.

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
