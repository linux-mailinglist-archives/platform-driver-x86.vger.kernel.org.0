Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C57869ABA3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 13:37:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjBQMhk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 07:37:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41958 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbjBQMhk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 07:37:40 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 722A14BE8E;
        Fri, 17 Feb 2023 04:37:37 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MOAJt-1pDFFJ0aiX-00OZTr; Fri, 17 Feb 2023 13:32:00 +0100
Message-ID: <7f5644a8-2e6f-b4c6-4db8-2419d1a7f005@metux.net>
Date:   Fri, 17 Feb 2023 13:31:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
 <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:CSsB2DlnJrE/UouMjEZeE+WEbLHoe3JnDsmKybrLFXRFxE4oAFJ
 avb6t55CEFuuja/Xila0q/hKQ2Ei0xwfuPe/Lqinwix8YNM8n3BOruDfR6ycdY8+ne7F9qz
 1v+tXqB41uqmpcl+E3K0K3VHC/SNvRBbyfbEzB8Fpgm+6I+GB60iGCzL+FcZD/H8PBCgMWe
 bQJrYRaGyda0VFcY+cfvA==
UI-OutboundReport: notjunk:1;M01:P0:JSnVOEbY8ls=;kqoyVR/9ZVMozlEnQQ47lHP+htu
 smZOSN6UVz4q7B07mF6ahP9z4z9V//PSoQE44Qhny21z3UMPSnmkYdrxkpG9NTyD5zp75h9hE
 NDEGirSaICBHoD596+Ki+/VFNi63HwaYEsX1utYKXLO0IKxQlAW2ZQKbjL/vPK8ilivpnkDLE
 RLASa8406bxOHFW2l+qVaqiazve4V6n32FjzycnZsDIxA46nN1YL09ZD3dmuqJwp+kRWOnV54
 /YZO3SNN3kPRiDRkd0pYJWHG46mz4URMulUH1glWcNstBwQTrwfIHbnq/uQechENrIlzSB44s
 M0PQUxiE/fMSKYYnxp1dH20olO12h9SYYNmxym7lePr73KqVdVNIg77n2sMrcTeqoOGt2gOgv
 N+U3hsJkH2YY8LHJ0+Id5SaahiGOaEmBqLH+SuzAecEvVcQNKblC7/QFWecFFRYdHWWOfEoWs
 RKjW6X2QsGDqkqLvzssh1izEUfNl36Hl0thDX8NKxveROG/i1WpdGyVYkrTeIauI5wBttRQ0d
 3GzSjt64UqPrwiU8NbNx5Z35b3O9qwN1RHoC5L4ziVWI9S0axFCQCpcXq51No5imHjR9JW+Gs
 FxDWjnS9sVRpX60XWuUPQnlC6B7Ow2w1DkadsR9jR62OTBvrhL3rtlNKBBIqk8TzbK4EGK3wE
 zM0+YJHn8rzqzsaWU6Zf1I1/v07GiVryekfSaz/Vxw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 17.01.23 11:25, Hans de Goede wrote:

> Enrico, can you take a look at this series please? You can find
> the 2 actual patches here:
> 
> https://lore.kernel.org/platform-driver-x86/20230113231139.436956-1-philipp@redfish-solutions.com/
> https://lore.kernel.org/platform-driver-x86/20230113231140.437040-1-philipp@redfish-solutions.com/

NAK on renaming the RST lines (at least for the older boards), this will
break existing applications in the field (I know for sure certain ones I
wrote myself - and they're used in remote places!)

These lines (at least for the older boards) are supposed to be generic
RST lines on the mpcie ports - not strictly limited to modems - that's
why I've chosen this naming.


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
