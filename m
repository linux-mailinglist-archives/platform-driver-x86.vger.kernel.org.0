Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1280869ABE2
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 13:52:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229564AbjBQMwm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 07:52:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229575AbjBQMwm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 07:52:42 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3EE3211E9B
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 04:52:41 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MjBNV-1owxGR3G5t-00fDC0; Fri, 17 Feb 2023 13:52:18 +0100
Message-ID: <521b2c12-6f98-bb80-3eaf-e231268d7403@metux.net>
Date:   Fri, 17 Feb 2023 13:52:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 2/2] x86: Further PCEngines APU4/5/6 cleanup
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231140.437040-1-philipp@redfish-solutions.com>
 <c5bcbfe0-2e23-c1d4-11de-9cc0f331e797@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <c5bcbfe0-2e23-c1d4-11de-9cc0f331e797@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:blMAU0DMs9hnt/HvLAnP7PLwAmDEHLbjUsRdAzB2PO0rMVOxjh1
 nIGgd4zDbSYKQnPbToPemJc7etByQko/2zCwryMkFFumTNfnghkBue5mDIGsTau9HmLqGX5
 spGuY/RmahnEEY+XGxAGDipXT4Fb6VqoI9VXg+N2OYxl1EZ8UZ6BFzcwFJrrg7dmFsgRvIX
 I8NQXozU6c8InXSiimv0g==
UI-OutboundReport: notjunk:1;M01:P0:wTq4oueaS94=;VW02wydR95YZ/KigZDQWkMKv+o2
 Ly7ARExX2/X7/8XsWFCYcyiejX343dRL40yDZCCM5ZQDgwMcc0RkR7zWUpxb7m7aWSLQNGiuo
 DwAWINx0PsnRYLaRmAXmHVBo2l/YtYWXMTDZnA4zCNsGTPPN97kOJtUNo+tfedWbP4FTbk7P7
 o9cCUYsruSoJBvvYlCxwvklmXfcWU3A4wRDTeSaHVVqROmBe+GcKMfugOWo/G0bcgRxkAGgTQ
 e3N3gCPgRg/sDaGeaNIHGwN1oA1i4HSyFlKkgPOGWlCgU9oAZp2O4OufQ4z4+zKENfwO9GGRr
 wKgKYdjScKj+VxDZRTBj4Q7hw49aF6jxJG/BtJLbYmqkgED4BcTFJa9I1fHUd2Fc0aCNXNXLM
 XWUQ6c1mWybRv4Lwww+7S4qqp0cDZcqWDltNXAL/aaz9utvWCu84Lqf3M5zYP9wi1iKwLpfy/
 a5xSxzjOse9WkcG5vMEBbs7eJ1EeCQ6Jxav1KL7Fbp7nCoL/Gbbrgnz1gLyAZATlu4fKeF7/o
 VByNi8htD9QaFwAgINLuDG4Ya3/sHN+Mn63UIc84Yb0WBWlYnc+GSlXbQAdORYUok0slAqRn2
 5W370AaPMCrKsLn5fLYf6c2+6wlO3b8gvulWC1V0ADBvEAXj57q+4gzOyKwYJ8clJNXLNDmjx
 IuPDaHMIHpV+DVJYUFqDpNv7r+og0V5eWbHpudgEnQ==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 19.01.23 11:28, Hans de Goede wrote:

Hi,

> The driver auto-loads based on the DMI modaliases and this platform
> modalias is not necessary and broken:
> 
> 1. not necessary since the driver itself creates the platform_device,
>     so it is already loaded when the modalias might be used
> 2. From a quick scan of the code it does not create any platform-devices
>     called "platform:pcengines-apuv2"

Seems you're right. Probably an forgotten fallout of some early versions
that actually did create an extra pdev for the board itself (which
turned out to be not needed at all).

So ACK on dropping them.


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
