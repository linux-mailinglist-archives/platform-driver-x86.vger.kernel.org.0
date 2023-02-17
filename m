Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BEC869AC4B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 14:20:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229684AbjBQNUl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 08:20:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjBQNUl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 08:20:41 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DD3776240F
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 05:20:26 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1M2gt5-1pOs3L2UuN-004C7g; Fri, 17 Feb 2023 14:19:52 +0100
Message-ID: <4ee1329a-3da1-d46f-69ee-3a32e9279327@metux.net>
Date:   Fri, 17 Feb 2023 14:19:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <D31F4C6E-EB3E-43CB-8446-1CC36E9629B3@redfish-solutions.com>
 <f5bc50fb-c3ca-bcd3-2ce0-640002e4a2e7@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <f5bc50fb-c3ca-bcd3-2ce0-640002e4a2e7@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:gWguZxfcXqILIFsGcN6FEfHEjcB9sHy+lZIvrBYnSxxdlzFZJIh
 xCNYc4dGm33NeHgZHzXj1OrfnLSYKK36z/X6RGF64HLDLR6ZlRxwQk+Oj+ZB+IqX7fvlFos
 BuwF6RxhGJQ1ODWD8e2fMWb+P717u7TsHwVZL/uVeGV0u2PlHucYMCMgTYbBB2zOyLT+og1
 KDmoJZXu6K0GhfZRZDv0g==
UI-OutboundReport: notjunk:1;M01:P0:EttEN8w326M=;c7enxWrNSKX3U7ep1FbGEbAVLH+
 06ypTXAYBKad2t0peLLAlXJYUsFnrrcA4ugiIBcA/MxibpKlFrGNNVY6u0FFqglWxmxEaWgYE
 yYrWDiLvUv0MQdNQhMZoEVkaIyMIO0+4MYlHfDXDvOAjTDuKx41NoBXVCIzXOZF8Tg6+KpWSs
 H8piWV5VRnYGK8ety44VwTvSpqXrTUkhmdvu66KqVlNykRauU9yicviRcdnd6bDRvasOkLh/0
 KdwRJMMM46QR3Xnu0d0JPF6ikKa3Q6Ob8IftAdIueNsATlbeyalPN2w4dWkmz4MMM07JdSI9v
 nFdIAeAyDN6EUDjg9Ea1mIMULraoBIQbqqk8zAakNUBtEL+5gZijv/sypP6fZIq/n7hKCcg5f
 BLveTujJLPIS2ckICAp7ojccko2rS7iThqTPKmrpbT8mKPmmH6Sq7zC7mi89pRA4bdXXJjcub
 bi0lR9noeKYmt5T+2dVdrFukNOt7JfdGCxriOPGTu57rPUapcE8Wuzh9ETEASS7TkecTNa1JG
 oWtuCvOAFhtz2rb48GV4NP/M+Okz2hpBWLaoSz5+HPwEiPG+/6ZW+jidoMgxkTzfmM13DSLjS
 BwzMJokGa29zOWhqGZc8nlun2DEnIxMdGncLcchIAb+Lr5TQcwk6AWzoPY3rwSXT/RkzC77s1
 VK7lYBjpQF8fVb6sRK1knhcc760WZmAhNn0TuC9oaw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20.01.23 10:51, Hans de Goede wrote:

> But in this case AFAICT the only API userspace has for the
> simswap and modem-reset signals is "raw" GPIO access in
> which case the ordering very much matters.

Yes, that's actually the biggest part where I'm still unhappy with.

Does anyone have an idea what subsys could be used for that ?


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
