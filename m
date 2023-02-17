Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8A74069B2D0
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 20:03:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbjBQTDQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 14:03:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229482AbjBQTDP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 14:03:15 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 53FDB4A1F7
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 11:03:13 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MmDVA-1okzpK2wuu-00iAgr; Fri, 17 Feb 2023 20:02:42 +0100
Message-ID: <ad3c1205-4538-548d-2ee6-fe72ad13e1e9@metux.net>
Date:   Fri, 17 Feb 2023 20:02:41 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        Hans de Goede <hdegoede@redhat.com>
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
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <5F93DF5F-BEC4-4B2A-A057-A895282A66B2@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:8aJP4/4iOb9sU4BHV7r940d6pUHkLv/Vhe5swcZvPnUidEtfLem
 xCmGaaN4xkDFbU7PawwVDurR9Iyc19dG9htOZoG/1c6TsJ1zpZHlJIuqvxj1QLdvBixLK0A
 Kgwj9dsHpPK5O79cyhP24QBamXxzYwezFPAzXEoVh6SGq8936R/ZuJ74SzZHqAnwB8UgLnZ
 nGAm0o2hWK5aakzRblcSg==
UI-OutboundReport: notjunk:1;M01:P0:rKzhk2PSHgY=;D1yeKmEkQ3+EanFWs6+24dEWpXq
 EKZPE9S2Zt5iQ9n6um0WsJlKgIA/dhvTu9EaLs/eTesSAQOGI98nR/6ozwNNCFODB2kg/0cza
 gmiNlHEs2godFaSrJu4RuaL4JCO5yaHq7L1PdnrtTvXZyQozmwmQcNF9PQjCsrUtniyfY6V11
 +5hTCyDKWrj6KV6k8g53RJPxxgNxBMHQ+h9jqGQlKQ0rNPFpNq9TyzUOVYiSjXeGvPw7ZUp6X
 njiBjEZHeuRmj9QnpOYHRilBJEFxuGOrYRuC1qeFYPz3fhoF4xdHsLc0soNC1dgMrlYGk01tw
 hZY5CUEnaEHPCSl23XxRbJTucx0X6iEE3nuOg5p0WwVUZypHq9JkX3StwR8ohcpNAQZfO3UvR
 7VolA2PidUvPvtVDzvyEa+EatkX8Ou6Jdl2FX2owu9u2G9SI4sXyEEbjhZZL2fxcKddkW9pvS
 iSYeX2Kv5kp+dqXPO92PVSb6ztumb7daZE1h/k+lh6rron/J5xTvAcSkv0Uos9hDJSdecBrw2
 4xzGGohD993FvtouafgQgxL11pYSsO7PBNObC+FC1DSJIqVHWjg8s5OzajvIm07IRUoGfflhJ
 6uP439qeTXSiX6mTXBzodhAD1l1413PbxVICNMwzjqC7GfRGBlal8fr10hRv858rWctqANaSx
 s+64qSrT/KCRQwuaRmiOXRv+LsGtB2RxkpaCuOqrvQ==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 09.02.23 07:04, Philip Prindeville wrote:

Hi,


> Yes, eth0 on the APU6 is an i210 w/ SFP cage, and i211 on all of the other ports.

oh, did you already check whether that has any influence for userland ?
(different drivers ? different device naming) ?

> I've asked PC Engines for a definitive list of what GPIO lines are used for what on all of the current revs of the boards.  I'll share that as soon as I get it.

Good luck :)

Last time tried, I got back some quite incomplete spec. (IIRC still
apu2+3). Had to do lots of trial+error. But at least got some
schematics, already better than most of the other x86 vendors.

>> If yes then what is the advantage of using the APU driver over the ACPI exported functionality?
> 
> Other than ACPI being less than reliable in a lot of cases?

ACK. The problem isn't ACPI itself (except the fact that it's
unnecessarily complicated and huge step backwards compared
to DT, which already existed before), but the board/bios vendors,
who rarely manage to do it right. It seems that those folks are
really acting on fire+forget.

> If people wanted to use ACPI instead of the APU driver, why not just build their kernels without the APU driver linked in?

Easier: blacklist the module (those folks are using distro kernels,
which usually use modules for all non-essential drivers).

> I've been thinking about this the last few days, and the APU's are all low-power, headless (no video), SBC's.  They're designed for embedded usage. 
> That is, they don't have generic distros like Ubuntu (et al) installed on them, 

Not quite correct. Semi-embedded, or better lets call it "appliance".
They're officially announced to run with mainline distros, and users
do that. I've built industrial applications running on Debian (actually,
Devuan) with these boxes myself.

NDA forbids telling more clear, but you'll have to climb up large towers
or fly offshore in order to get your hands on them. Yes, environments 
where stability really matters and field rolls or firmware changes are
the last thing you want.

> Changing the kernel and what's visible in user-space typically isn't a problem 
> as long as both happen at the same time.  That's what we've done with OpenWRT, 
> adding the 2 new board models, and the mapping of led triggers to GPIO lines.

For your case (openwrt) that might be okay, but doesn't work for
those using mainline distros.


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
