Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B785C69AB73
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 13:26:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229672AbjBQM04 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 07:26:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjBQM0z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 07:26:55 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE79866058;
        Fri, 17 Feb 2023 04:26:53 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MMXDj-1p9PLf2opr-00JbBn; Fri, 17 Feb 2023 13:21:00 +0100
Message-ID: <670ac95d-cf00-d589-5779-ae754fffd921@metux.net>
Date:   Fri, 17 Feb 2023 13:20:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v3 1/1] x86: Support APU5 in PCEngines platform driver
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        Enrico Weigelt <info@metux.net>,
        Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230102065447.3447284-1-philipp@redfish-solutions.com>
 <01dbd065-693b-e5fe-5aaf-d74971d6fe7d@redhat.com>
 <AA8BB3C5-8101-4DE2-8FE2-87EBF5329BA3@redfish-solutions.com>
Content-Language: tl
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <AA8BB3C5-8101-4DE2-8FE2-87EBF5329BA3@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mv97YonzSSrWC1JhP4jQZhg2ruI0afw7S3Q4zBO7z5KY98hfsxJ
 5xvMyWd3JSmy9pRkWuiRwxqWnQL2GFBHt1uulivDIW819RXgzXkRH8FPc/SDX190sOCpOH4
 yL5ExMp0VFfv/fAxojFz2D8+Y5OFWqAwUzlCoGJwnyzZfO1wIPclkj4gcLs56aup+eGFHK0
 z31XI+eskxRRtt44dKiRA==
UI-OutboundReport: notjunk:1;M01:P0:hI3deeWxGxg=;3f36t4VyFfyotZ5iDrQHWIXDXQ0
 0R4NbTrOmfksMdfR3EI0TruWsyO3IrV905MOcc/dFbvHDjyfxtONHM+1t1m+VoTtfiOQiGama
 nEG/hOdt2RrNGym+Kh0Tzrvfj3b9WsHwRW2AljXz5cl9p6Ou7g1xEggYo5MAsPa+bnRlCjmyF
 J8Dq72kk3r6ley2lzyrTRSxTFMHhL9Yo/hdWXom/KCI1BKyQN9AaFPjROuRXGvHecYfx95D9z
 lWJ9SDzpuLqsjGXzKVtrmzIL6rs3XwCUVwv+zwYhSr20bVcbBXfXHWkzEKLFxvcED08HtwrQ7
 2hO+peBUbMIOpc1WFWE3IlafQ1TPMVcGZdqBhYWi98p1VhFwjg3BPurSHHpOuvsiPTB5FkBNd
 wkaJM+K84/d7zhlV4sLUR1oIQkWdjpO6YleNqommWvsJNaEDVG732fHW6lxsod2MxMpNrTqVk
 zFbk9rLPqxtKju0bDJBD9PwkA/sz5nDB+u2w3o/cwctxvlK7aJULP0U6XJ4f++ENjdZ9aWPr2
 g40E2kSQfWUyllEE9xkEFoDoM0yfxbuAxPxmlkWxPEMQLt4tTFvRkBv9yuQ9a1fuKhSzTfMuF
 NNJLeO6t6KXrXWHACJo6d1IBIw6sMuh5rSWAp1m7l/PVvdpQE1VAZSIyob1MknHrTT30ELV57
 B3OzEVhuT+upsTkhQcHKZ2DPphAFYwi4X9IM2hHcIw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 14.01.23 00:04, Philip Prindeville wrote:

Hello friends,

sorry for being so late, busy with totally different things ...

> My read of Enrico's comments were that using ACPI information to map
> the GPIO lines would break backward compatibility.  This part of the
> effort was dropped.
Yes, the big problem is inconsistent support in different firmware 
versions in the field. Older version generally don't have any acpi
entries at all, later added it (but inconsitent and incomplete) and was
dropped again later (haven't checked whether they reintroduced it
again).

Obviously, we can't expect users in the field to upgrade firmware and
kernel in lockstep. So, we can only rely on this data for those boards
where we can be sure that all shipped firmware versions have proper
support (that really does it right). The problem also goes a bit deeper:
just adding the GPIOs isn't really enough, they need proper (and
consistent) names as well as mapping to the correct drivers (eg. LEDs).

Oh, BTW, don't arbitrarily change gpio line names (at least for the
already mainline-supported boards) - they're are used in the field.
(well, I'm not actually satisfied with direct gpio access or things
like modem reset lines, but haven't seen an actually fitting subsys
for those).


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
