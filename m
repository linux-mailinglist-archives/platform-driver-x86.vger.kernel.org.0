Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 211CB69CBA5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Feb 2023 14:10:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230402AbjBTNKt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Feb 2023 08:10:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231548AbjBTNKs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Feb 2023 08:10:48 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.17.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66CC0EFA7;
        Mon, 20 Feb 2023 05:10:46 -0800 (PST)
Received: from [192.168.1.155] ([77.2.78.131]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1MCbR7-1pKR9D3BKt-009jMS; Mon, 20 Feb 2023 14:10:12 +0100
Message-ID: <76b88f76-9b55-bdea-7cd3-139c9345df8c@metux.net>
Date:   Mon, 20 Feb 2023 14:10:11 +0100
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
 <e472eb76-03fe-237f-f73e-6e997c9f9200@metux.net>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <e472eb76-03fe-237f-f73e-6e997c9f9200@metux.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:+DqSGOWVazhckeGTd2soPkFg44ZznR7E8iBXAXHCa8JGTsV6dnA
 C+zrqbJuXdypv922d2y28hHA4d+ZS9JFcQselcn951pI0dylrRx1ZChoRnJ0uLjQvs/QBd6
 NNM2htdjHWSiuboxIioU6qOv6aBiFZShpEXmGjZnqUR8bjVyUD/+htieOdvy6LLFRhtyxoV
 +GqQZ5+TqyczF0nxWbmPA==
UI-OutboundReport: notjunk:1;M01:P0:OOBHbL9xJNw=;abxD05czF3bgufgXU+sF2guMMEL
 iCRQSaaUAhbj4dheLmjZGijmg8jP0yNKhMMVCjoHunVXG1VBMLDkq4fU8u28Wb0wstpxhiWGY
 JdPFIjHpyKBYMog8R76Ur453XsFMPgBODII+zihZLIIhxjVPtR2NPS+YQcy66CuQiMyulJqpD
 VSQwDIWKizhhTygXJdeUSBDtQhXLVytLHIIjpupDdcGBxaQl8GL8rk03v4JK2xXDbm76eXl/I
 OwmKMyW48Gt8ViV8eSV19Eokok03shswrnV68bbiqT6Lh/itjqblcCCmEVDZo0ZUeoukrodi9
 e0my2CHGUgKTGrphXI+roCtrYIfkquDppS+iR1Ao64bBpkD0CfQhwelDd46uPAIdDX3jioHkp
 gnP3RwBwOH8GCgJgKSTTb2jzabM5G0RexbJEMnerKVZ2bnsIsTlFxur/g9hlu5FHBHt8ir/Kh
 f+9yLsUJwzWl8oocGH5eXKavtlIcG6j+qXgHURqpN/i34FldQ4G1+jcVyhHuBxSBeaj53J3u7
 +6PwDaaQh/o+4JIP794b97zRw1LL7R/DG6o2NHuTUSYPQKJrYR/sB8QsYM5BnynAhZ/7Yc/4Y
 bxx24/jmCZ7PcplnwVd8HQ75kw1tR1Ts/p0w3s+PA0h/7M1yMhq2z03Ud/qvKnVqeIvxGDR+1
 i2106iz/DX24iJO79XcrRI03xbiTpZxJRKTW6nSgYw==
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 20.02.23 13:04, Enrico Weigelt, metux IT consult wrote:
> Hi Ed,
> 
>> Sure - but the *wiring* of the RST lines *follows* the modems.
> 
> I think that's entirely correct, or we're talking of different things:

Fixing typo: *not* entirely correct.


by the way, just posted an separate rfc mail about baseband subsys,
please let's continue there - i believe that's what we actually like
to have, and using these raw gpio lines is just a workaround for not
having a baseband subsys.

> The lines belong to the slots - no matter how one actually populates
> them. (and the slots aren't restricted to modems).
> 
> An interesting question is how to count the slots. The most intuitive
> seems their geometric position on the board, so users/operators can
> deduce them from just looking at the board.
> 
> OTOH, if you just wanna reset some specific *modem* (and don't wanna
> find out which slot it's currently in, each time), we should have some
> baseband subsys taking care of that.
> 
> Actually, we have real use cases for that, eg.:
> 
> * power supply of onboard basebands
> * direct audio links between baseband and mic/dsp
> * non standard (not tty-like) interfaces (mailboxes, etc)
> * RF exposure measurement for TX strength regulation
> * controlling external components (antenna switches, boosters, ...)
> ...
> 
> Let's defer this discussion for a while and think about some baseband
> subsys where we can later put this RST lines into, too.
> 
> 
> --mtx
> 

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
