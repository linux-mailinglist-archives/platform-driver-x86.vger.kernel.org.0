Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 40D5B1D787A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 May 2020 14:24:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726946AbgERMYM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 18 May 2020 08:24:12 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:58207 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726957AbgERMYM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 18 May 2020 08:24:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1589804650;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aNddrvnjvVAzGmBCFtMQ5iaiY8jsBoqXulJlnAFXCC4=;
        b=hAhm+jG5rGh2nAQ2FNGBPLt0oUriF55/gzk/OJOewa2uJHglxZM8RT4qXSuBTi0e9+dzbg
        FPgYAlp7JljPdx5OhZ1T2+Lk0pJJYJW+PbwwFE3QHNPkFdrU6L2tttWjBCENYkYHRGmEGl
        ZetyaI0wYaKxavw6rXWA5qzD48yQd6U=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-319-zmEEoSXkP-6M_WPtlkSuJg-1; Mon, 18 May 2020 08:24:08 -0400
X-MC-Unique: zmEEoSXkP-6M_WPtlkSuJg-1
Received: by mail-wr1-f70.google.com with SMTP id 30so5584076wrq.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 18 May 2020 05:24:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=aNddrvnjvVAzGmBCFtMQ5iaiY8jsBoqXulJlnAFXCC4=;
        b=bsrVNds1QeEkWwoLFByYvCFhJSxbKcgYq6pvYzCqSoTMUtCg5cHStATwK2yo/POPtS
         /IKt5/jx1c92EM2iYx2BlQ4rJRoFAIynrmjyugeVoSX8u03L68YU7BbOh00xym/IAbUf
         nSEnqLc/pe0dptSup+3w/NnkS9hAbl87eUMhmlBrUAKQ7apml7r6nlYS4fMzNvKSXAEV
         4+WersEMdQZpkY/tAE4Nt3BIxeU/jZ8wfbSI72EgDfvk1vTQ8XluXjMt6C5tSl+NN24j
         HBW9sWnZdupQ6MLggtMdUPc+SBpLAMFjlyMrW9hpJ9nbGSkW8zLrmo+uu31/bkFr9y4o
         bXBw==
X-Gm-Message-State: AOAM533nc9Ipc+iZOMAsiZfOQSgnnZ6mdF7pSOOUNtnMPufE/3Y8QkAe
        RNVnicqoj9XxRAvvbMa1p7YxEUqvRwyjQ83uyh+SMOERw4flkosJGcvaa6IWuCP1JjycFNK8ZkM
        fDCsCHWvSPjP61cSMlBzyk3DsQ0xZrakpfA==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr19377375wrn.268.1589804647159;
        Mon, 18 May 2020 05:24:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLe3p91ExNY6QGf1SRfv5g2doyaKilcFhk73/bWJl/jln6ZVFltTOdpBm/OQccJvw+caL9KA==
X-Received: by 2002:adf:eac8:: with SMTP id o8mr19377325wrn.268.1589804646888;
        Mon, 18 May 2020 05:24:06 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 18sm15993570wmj.19.2020.05.18.05.24.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 18 May 2020 05:24:06 -0700 (PDT)
Subject: Re: [PATCHv2 0/7] Support inhibiting input devices
To:     Andrzej Pietrasiewicz <andrzej.p@collabora.com>,
        linux-input@vger.kernel.org, linux-acpi@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-tegra@vger.kernel.org,
        patches@opensource.cirrus.com,
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
        Nick Dyer <nick@shmanahar.org>,
        Ferruh Yigit <fery@cypress.com>,
        Sangwon Jee <jeesw@melfas.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        kernel@collabora.com, Peter Hutterer <peter.hutterer@redhat.com>,
        Benjamin Tissoires <btissoir@redhat.com>
References: <20200506002746.GB89269@dtor-ws>
 <20200515164943.28480-1-andrzej.p@collabora.com>
 <842b95bb-8391-5806-fe65-be64b02de122@redhat.com>
 <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6d9921fc-5c2f-beda-4dcd-66d6970a22fe@redhat.com>
Date:   Mon, 18 May 2020 14:24:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
In-Reply-To: <e6030957-97dc-5b04-7855-bc14a78164c8@collabora.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/18/20 12:48 PM, Andrzej Pietrasiewicz wrote:
> Hi Hans,
> 
> W dniu 15.05.2020 o 20:19, Hans de Goede pisze:
>> Hi Andrezj,
>>
>> On 5/15/20 6:49 PM, Andrzej Pietrasiewicz wrote:
>>> Userspace might want to implement a policy to temporarily disregard input
>>> from certain devices, including not treating them as wakeup sources.
>>>
>>> An example use case is a laptop, whose keyboard can be folded under the
>>> screen to create tablet-like experience. The user then must hold the laptop
>>> in such a way that it is difficult to avoid pressing the keyboard keys. It
>>> is therefore desirable to temporarily disregard input from the keyboard,
>>> until it is folded back. This obviously is a policy which should be kept
>>> out of the kernel, but the kernel must provide suitable means to implement
>>> such a policy.
>>
>> Actually libinput already binds together (inside libinput) SW_TABLET_MODE
>> generating evdev nodes and e.g. internal keyboards on devices with 360°
>> hinges for this reason. libinput simply closes the /dev/input/event#
>> node when folded and re-opens it when the keyboard should become active
>> again. Thus not only suppresses events but allows e.g. touchpads to
>> enter runtime suspend mode which saves power. Typically closing the
>> /dev/input/event# node will also disable the device as wakeup source.
>>
>> So I wonder what this series actually adds for functionality for
>> userspace which can not already be achieved this way?
>>
>> I also noticed that you keep the device open (do not call the
>> input_device's close callback) when inhibited and just throw away
> 
> I'm not sure if I understand you correctly, it is called:
> 
> +static inline void input_stop(struct input_dev *dev)
> +{
> +    if (dev->poller)
> +        input_dev_poller_stop(dev->poller);
> +    if (dev->close)
> +        dev->close(dev);
>                  ^^^^^^^^^^^^^^^^
> +static int input_inhibit(struct input_dev *dev)
> +{
> +    int ret = 0;
> +
> +    mutex_lock(&dev->mutex);
> +
> +    if (dev->inhibited)
> +        goto out;
> +
> +    if (dev->users) {
> +        if (dev->inhibit) {
> +            ret = dev->inhibit(dev);
> +            if (ret)
> +                goto out;
> +        }
> +        input_stop(dev);
>                  ^^^^^^^^^^^^^^^^
> 
> It will not be called when dev->users is zero, but if it is zero,
> then nobody has opened the device yet so there is nothing to close.

Ah, I missed that.

So if the device implements the inhibit call back then on
inhibit it will get both the inhibit and close callback called?

And what happens if the last user goes away and the device
is not inhibited?

I'm trying to understand here what the difference between the 2
is / what the goal of having a separate inhibit callback ?

IOW is there something which we want to do on close when
the close is being done to inhibit the device, which we do
not want to do on a normal close ?

Regards,

Hans


