Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 38E0A1B1448
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Apr 2020 20:19:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727917AbgDTSTw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Apr 2020 14:19:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57422 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727891AbgDTSTv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Apr 2020 14:19:51 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30E9DC061A0C;
        Mon, 20 Apr 2020 11:19:51 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: andrzej.p)
        with ESMTPSA id 313602A0FEB
Subject: Re: [RFC v3 1/2] thermal: core: Let thermal zone device's mode be
 stored in its struct
From:   Andrzej Pietrasiewicz <andrzej.p@collabora.com>
To:     Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Cc:     linux-pm@vger.kernel.org, Zhang Rui <rui.zhang@intel.com>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>, Jiri Pirko <jiri@mellanox.com>,
        Ido Schimmel <idosch@mellanox.com>,
        "David S . Miller" <davem@davemloft.net>,
        Peter Kaestle <peter@piie.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Support Opensource <support.opensource@diasemi.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amit.kucheria@verdurent.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Allison Randal <allison@lohutok.net>,
        Enrico Weigelt <info@metux.net>,
        Gayatri Kammela <gayatri.kammela@intel.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-acpi@vger.kernel.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@collabora.com
References: <9ac3b37a-8746-b8ee-70e1-9c876830ac83@linaro.org>
 <20200417162020.19980-1-andrzej.p@collabora.com>
 <CGME20200417162037eucas1p11663f116fd9844d38c0b5d4d7ebe9f1c@eucas1p1.samsung.com>
 <20200417162020.19980-2-andrzej.p@collabora.com>
 <4b97e46a-e7ef-ee22-227e-d35ebef458b0@samsung.com>
 <4cda3e11-7bea-8445-cd51-4b25dcafc741@collabora.com>
Message-ID: <920f8285-1b49-d088-64b4-98bce8d23e39@collabora.com>
Date:   Mon, 20 Apr 2020 20:19:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <4cda3e11-7bea-8445-cd51-4b25dcafc741@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

@Daniel

please see below

W dniu 20.04.2020 o 13:03, Andrzej Pietrasiewicz pisze:
> Hi Barlomiej,
> 
> Thanks for looking into the series.
> 
> @Daniel can you see below?
> 
> W dniu 19.04.2020 o 13:38, Bartlomiej Zolnierkiewicz pisze:
>>
>> Hi Andrzej,
>>
>> On 4/17/20 6:20 PM, Andrzej Pietrasiewicz wrote:
>>> Thermal zone devices' mode is stored in individual drivers. This patch
>>> changes it so that mode is stored in struct thermal_zone_device instead.
>>>
>>> As a result all driver-specific variables storing the mode are not needed
>>> and are removed. Consequently, the get_mode() implementations have nothing
>>> to operate on and need to be removed, too.
>>>
>>> Some thermal framework specific functions are introduced:
>>>
>>> thermal_zone_device_get_mode()
>>> thermal_zone_device_set_mode()
>>> thermal_zone_device_enable()
>>> thermal_zone_device_disable()
>>>
>>> thermal_zone_device_get_mode() and its "set" counterpart take tzd's lock
>>> and the "set" calls driver's set_mode() if provided, so the latter must
>>> not take this lock again. At the end of the "set"
>>> thermal_zone_device_update() is called so drivers don't need to repeat this
>>> invocation in their specific set_mode() implementations.
>>>
>>> The scope of the above 4 functions is purposedly limited to the thermal
>>> framework and drivers are not supposed to call them. This encapsulation
>>
>> This should be true only for thermal_zone_device_{get,set}_mode().
>>
>> thermal_zone_device_{en,dis}able() should be available for device drivers:
>>
>> * of/thermal device drivers need to enable thermal device itself
>>    (please refer to my patchset for details)
>>
>> * device drivers need to call them on ->suspend and ->resume operations
>>
> 
> @Daniel:
> 
> How does this compare to
> 
> "Just:
> 
> thermal_zone_device_get_mode()
> thermal_zone_device_set_mode()
> thermal_zone_device_disable()
> thermal_zone_device_enable()
> 
> And all of them in drivers/thermal/thermal_core.h". Did I understand
> you correctly?
> 

I sent a PATCH series (rather than next iteration of RFC) addressing
Bartlomiej's comments. They make sense to me.

Regards,

Andrzej
