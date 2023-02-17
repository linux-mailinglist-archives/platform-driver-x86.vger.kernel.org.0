Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D0B3669AC0F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 14:04:00 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229640AbjBQNEA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 08:04:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33692 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbjBQND7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 08:03:59 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A0164AFF3
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 05:03:56 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1Mo7Bb-1omSRU1Cu3-00pcXA; Fri, 17 Feb 2023 14:03:31 +0100
Message-ID: <8a96d0bb-4d35-b7b8-f6dc-73e9b86c29b9@metux.net>
Date:   Fri, 17 Feb 2023 14:03:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Philip Prindeville <philipp@redfish-solutions.com>,
        Hans de Goede <hdegoede@redhat.com>
Cc:     platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
 <D31F4C6E-EB3E-43CB-8446-1CC36E9629B3@redfish-solutions.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <D31F4C6E-EB3E-43CB-8446-1CC36E9629B3@redfish-solutions.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:4VsjaKt4Mz2URa3rpyRcyUgTPz1ZPnO7Z6Zend9jK5y4w+ev4P9
 JfdZ5G5geWwI6cofbeiZKKaz7WFJKM+BcFtjGw1KXPjamLr4oCHZ3/YMwfxOE9TFluhdxDk
 Gcs8N/6V7GHqGdsYYYH6j6C+58CXUq+5D3w+sxsoiu6LUYjqjI58ACFpMgzcqGEh87qYPh/
 V4K1clw0gluQiozqmLXxg==
UI-OutboundReport: notjunk:1;M01:P0:Jm/aNH301cE=;Y4JHVo1wRY7clROYd0oqjj8HpZ8
 6jCKKBeYPr+Z7raiVEWO1Mu6D1zhHQpjutjeVKG6kMYAC40yu1AyKabeXdl87DTq7NIaLkmzX
 /diBIMFNDwGS37MwKzz6SusEa2EazTSkeyFdzFdeY99CzP/aSlaTcdCXpW5rnpBj11p4XtbjZ
 /09And4sXfsTeYVEG6hpcC+QVco80HnHYRSJW2Mw1WQyOL9r46JN3aW3wau0aCCsNtfIy1au6
 Lo6pDySCF32tGaykYrn9opQHD816WTsbvUzwI00fKPSVle7/Xl8YaxCnUeWFlXAiDoWA6uq4w
 /SoemNI7kKTcqmd243enUifaQG9LJ01lNGz5zdGKrmJyotb6yK3ADywMNdIA5CBGe3QLpBrlV
 uoTvFv1LyHPFm2j30IJRmzfLUb/EMJFBQymL6+JRdMLKLYB9DqUEbiU5519sLleSEydTbgy11
 ZMqTYW0SwNeoW5dvprHYad5LdnzV7Htztfm1LKeBJjW5uHGKyYolAr3nUbNh7ynh5o4E5kGIZ
 2f+OoHNkTZnXKb3/+pyhdX1svcR4LFYsIDXx8ywqSG1YheufQemr/qQSbyS6cFkcNeowfnTva
 mHV8jNS3ATWv4I+0fAg++okr3X6plj/8TB010nvNlD3lpxpda6OAWzyfDHUT4C26ww2JZkgdI
 nzn33eS9rz0awE1iK/oxPnqfIs/JU2uLMXllM/Gwpw==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 20.01.23 06:34, Philip Prindeville wrote:

Hi,

> I can't speak for Ed, but I've gotten pre-production boards in the past where the pin assignments have changed between the rev 0.1 board that I got to write drivers for and do BSP, and what went to production.

Do we have to care at all for those pre-production boards ?


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
