Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 602AD1FCAB2
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Jun 2020 12:22:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725964AbgFQKVl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Jun 2020 06:21:41 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:41820 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725554AbgFQKVh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Jun 2020 06:21:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592389295;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yhc1s7Zw9ueIYMIEo2xTGTrDtdpadVKmkCOObmttCqE=;
        b=DO2+HxJbZv7OFHJxQ1PoYTzMMEq1ffdejuvPWpsGclYdy7MYbNsR5YZOjsUwBwxdnJzoP5
        2crhMR0XOpSkhB8pfVxQBeGMpJJYezQEEDxTRJKw1Y0mReACjToE+THZZYIDdIZCkHKfxM
        9yqhyseNYISldAQy3wnzQHZ/MnLM1NQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-183-z23FZ9BsNM2OlPNtmsOXuQ-1; Wed, 17 Jun 2020 06:21:34 -0400
X-MC-Unique: z23FZ9BsNM2OlPNtmsOXuQ-1
Received: by mail-ed1-f71.google.com with SMTP id m23so633901edq.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Jun 2020 03:21:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Yhc1s7Zw9ueIYMIEo2xTGTrDtdpadVKmkCOObmttCqE=;
        b=B5USt0C6LiIFterOUkGpMbipC8lulL/Nrtyk6LF8ZzjrSFANjvogn1amIp9FNA7wsX
         XLGgI7c7RVxciwa1YjwPu+TRBdrQyQ878pW20NqEKKNbr1QV6bczeHn6V3RoycFmpNk/
         pp0SDWHEwA51XaHvS9XAyQW5wQj44jnegr0IMGQhgJvas0dhoMeQxaLZgmI+hMsZdbO6
         V2mrXqKvOLZ14I+5moYCbsCTjs0K2u9+TLymJB14nAWWEQ68ARED0kygkCOkkEP768Hx
         tc5I2wiPayZHOh3qS1u/Kej+hCPIdPzW4E7wj3F6yJsv7W9dDmImfFUE8aruA0pWuvH4
         OV8Q==
X-Gm-Message-State: AOAM530FXc3A4UQ5eA8hPTMCYlWap20lTLgG5yVP+w/SGnv3sBNRNjav
        9mbpswgDvYvi20YBwYYX4Qa6dQudi0/KY7OpIm379YaOboUBHmXYtBXves7DIFOdA/N86j8K82m
        z4aeCRFQEnOHJeb2tpvQL5PxWxJ4jzK/1HA==
X-Received: by 2002:a17:906:6890:: with SMTP id n16mr6668506ejr.553.1592389293043;
        Wed, 17 Jun 2020 03:21:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz4Vcga1B5df8yMuNCm76AlDwIveU6uNfHx1BCv3dLBndEoal3yutZpn6mAPAdwWw3xnCmDSw==
X-Received: by 2002:a17:906:6890:: with SMTP id n16mr6668468ejr.553.1592389292749;
        Wed, 17 Jun 2020 03:21:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id lw5sm13209081ejb.30.2020.06.17.03.21.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2020 03:21:32 -0700 (PDT)
Subject: Re: [PATCH v2] Input: document inhibiting
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-pm@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-iio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-input@vger.kernel.org,
        linux-tegra@vger.kernel.org, patches@opensource.cirrus.com,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Peter Meerwald-Stadler <pmeerw@pmeerw.net>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Vladimir Zapolskiy <vz@mleia.com>,
        Sylvain Lemieux <slemieux.tyco@gmail.com>,
        Laxman Dewangan <ldewangan@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Barry Song <baohua@kernel.org>,
        Michael Hennerich <michael.hennerich@analog.com>,
        Nick Dyer <nick@shmanahar.org>, Sangwon Jee <jeesw@melfas.com>,
        Peter Hutterer <peter.hutterer@redhat.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        =?UTF-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        kernel@collabora.com
References: <f9007f37-c526-5fa4-3188-a554d2434177@redhat.com>
 <20200617101822.8558-1-andrzej.p@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f0270bea-abac-eb4a-1d95-d4bc41bbd314@redhat.com>
Date:   Wed, 17 Jun 2020 12:21:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <20200617101822.8558-1-andrzej.p@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/17/20 12:18 PM, Andrzej Pietrasiewicz wrote:
> Document inhibiting input devices and its relation to being
> a wakeup source.
> 
> Signed-off-by: Andrzej Pietrasiewicz <andrzej.p@collabora.com>
> ---
> v1..v2:
> 
> - Addressed editorial comments from Randy
> - Added a paragraph by Hans

Thank you.

v2 looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
>   Documentation/input/input-programming.rst | 40 +++++++++++++++++++++++
>   1 file changed, 40 insertions(+)
> 
> diff --git a/Documentation/input/input-programming.rst b/Documentation/input/input-programming.rst
> index 45a4c6e05e39..7432315cc829 100644
> --- a/Documentation/input/input-programming.rst
> +++ b/Documentation/input/input-programming.rst
> @@ -164,6 +164,46 @@ disconnects. Calls to both callbacks are serialized.
>   The open() callback should return a 0 in case of success or any nonzero value
>   in case of failure. The close() callback (which is void) must always succeed.
>   
> +Inhibiting input devices
> +~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Inhibiting a device means ignoring input events from it. As such it is about maintaining
> +relationships with input handlers - either already existing relationships, or relationships
> +to be established while the device is in inhibited state.
> +
> +If a device is inhibited, no input handler will receive events from it.
> +
> +The fact that nobody wants events from the device is exploited further, by calling device's
> +close() (if there are users) and open() (if there are users) on inhibit and uninhibit
> +operations, respectively. Indeed, the meaning of close() is to stop providing events
> +to the input core and that of open() is to start providing events to the input core.
> +
> +Calling the device's close() method on inhibit (if there are users) allows the driver
> +to save power. Either by directly powering down the device or by releasing the
> +runtime-pm reference it got in open() when the driver is using runtime-pm.
> +
> +Inhibiting and uninhibiting are orthogonal to opening and closing the device by input
> +handlers. Userspace might want to inhibit a device in anticipation before any handler is
> +positively matched against it.
> +
> +Inhibiting and uninhibiting are orthogonal to device's being a wakeup source, too. Being a
> +wakeup source plays a role when the system is sleeping, not when the system is operating.
> +How drivers should program their interaction between inhibiting, sleeping and being a wakeup
> +source is driver-specific.
> +
> +Taking the analogy with the network devices - bringing a network interface down doesn't mean
> +that it should be impossible be wake the system up on LAN through this interface. So, there
> +may be input drivers which should be considered wakeup sources even when inhibited. Actually,
> +in many I2C input devices their interrupt is declared a wakeup interrupt and its handling
> +happens in driver's core, which is not aware of input-specific inhibit (nor should it be).
> +Composite devices containing several interfaces can be inhibited on a per-interface basis and
> +e.g. inhibiting one interface shouldn't affect the device's capability of being a wakeup source.
> +
> +If a device is to be considered a wakeup source while inhibited, special care must be taken when
> +programming its suspend(), as it might need to call device's open(). Depending on what close()
> +means for the device in question, not opening() it before going to sleep might make it
> +impossible to provide any wakeup events. The device is going to sleep anyway.
> +
>   Basic event types
>   ~~~~~~~~~~~~~~~~~
>   
> 

