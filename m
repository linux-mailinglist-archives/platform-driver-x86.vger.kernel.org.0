Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AA63369CA75
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Feb 2023 13:05:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjBTMFN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Feb 2023 07:05:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbjBTMFN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 07:05:13 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F107DBE8;
        Mon, 20 Feb 2023 04:05:11 -0800 (PST)
Received: from [192.168.1.155] ([77.4.6.61]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1N8G6I-1oQ8K10FVo-014A0E; Mon, 20 Feb 2023 13:04:41 +0100
Message-ID: <e472eb76-03fe-237f-f73e-6e997c9f9200@metux.net>
Date:   Mon, 20 Feb 2023 13:04:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 0/2] Expand APU2 driver to 3/4/5/6 models
Content-Language: tl
To:     Ed W <lists@wildgooses.com>, Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org, linux-x86_64@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436943-1-philipp@redfish-solutions.com>
 <44e0ef20-d6d3-4c87-1828-f88dbc08e942@redhat.com>
 <7f5644a8-2e6f-b4c6-4db8-2419d1a7f005@metux.net>
 <48beb1c5-5136-a287-1a74-bdc558bffe3e@wildgooses.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <48beb1c5-5136-a287-1a74-bdc558bffe3e@wildgooses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:mLuXI9mYW+KSEP24xQKX460V19r2mxc8CdzAYpbF0f54dN03PjZ
 NSKnBW/LnPgDaMQFsET0nQ7K3ufyujMcxPOogb0PO8kEf0cIjW5vucWp7tTBU7PmzD1syOg
 D4G5eaNL/LCCvZEF40ly4MljfjD11zAymTVsa8onipdgKTep1XBhwd1QDJU+GlxWAmaqmrI
 s+0xBZeVm1SF6opyaGNZw==
UI-OutboundReport: notjunk:1;M01:P0:kLVq1f13wDk=;r5w1CPT7Opa+hUB1g0ORzCF2G/O
 CFe+QN/fD7FP1XOEalysm0/Obn3esKfpQjOIlM1eINyPjTleQIyWLYGaD8hlqJnHicoEb0CGv
 KfdKNkGQdMYbl5Rd2YqRadXC6MER4uulfDgxxoSKrw1hBg0cz7D/Lg7xB9PpUbfAFcdBZXB6E
 5sf/P6diJQWXTuLXc6f5tDMmbgiNtqL2CCTXnBga2ljpXVF4Knj88t3/z4Q2F44D1NzvlmeP0
 Yojg/PTntBKRgtWEaZ0ZpdnVq6bBpCvCWNAIGINPs0W75/Jpctqb5A5TISdZ4dGTZhDH3oI1o
 x51o+jf4JNBzFjCfXRpQRTp59K3zP38A1x9rG7o0TW8X7GgKUn50HPyy8rJw3jkpG8x8TBeNW
 kP6FwzZMX+HwIeMnH2GkadFR8dA4rrXaZJG+WEdc4HDx47/2pkpVVO6d7CKC9EsP6MJBZZykr
 iJb5deMiy5e3qZS+5lZ7PyjJezemRu6QsDN/gjz3RTEw38fBf1ek8HxxauUx14eAEH9TqlMs6
 NHKjFecAKIQhmzI4ZwEVLYyQB0LiUpwuDxge0kFTQpZu6PpzkiHa4MCluighVpmK93fwAVdMr
 tNsbRHI9v+50ci9RGZFoWj6k2DNz5ponEFw2qfNN9hil5vGkjK6cvIEmiHdVBrdxmDuWgD95X
 shPWB3dEEubhmhKQN3uED8waR0j7kzONXnHM3CSR+g==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ed,

> Sure - but the *wiring* of the RST lines *follows* the modems.

I think that's entirely correct, or we're talking of different things:
The lines belong to the slots - no matter how one actually populates
them. (and the slots aren't restricted to modems).

An interesting question is how to count the slots. The most intuitive
seems their geometric position on the board, so users/operators can
deduce them from just looking at the board.

OTOH, if you just wanna reset some specific *modem* (and don't wanna
find out which slot it's currently in, each time), we should have some
baseband subsys taking care of that.

Actually, we have real use cases for that, eg.:

* power supply of onboard basebands
* direct audio links between baseband and mic/dsp
* non standard (not tty-like) interfaces (mailboxes, etc)
* RF exposure measurement for TX strength regulation
* controlling external components (antenna switches, boosters, ...)
...

Let's defer this discussion for a while and think about some baseband
subsys where we can later put this RST lines into, too.


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
