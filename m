Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id DA1E1D8B37
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Oct 2019 10:40:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389897AbfJPIk2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Oct 2019 04:40:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22056 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2389893AbfJPIk1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Oct 2019 04:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571215226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=myCsujhckN7mGUJHoiC199vTbztTMXRznb7dLdXDuiU=;
        b=ZfXnsT9eBnI5oVP96FMY4E2LszL5AgnLCDssDCGKF8ch6dpzWyzHAeYd8mZ3KNH8esOc3O
        5oEkBgqVzy66Fg4e6fLN0EZMLHE4QSAaBGwb+yZRoEokQU3VsUFW4yRQW2sW9Y/Uxd4lOq
        2PeOwdGmLDJLaNABKhtp7cy8yttGOc0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-173-aJuThK2GMpORQrHfazw73w-1; Wed, 16 Oct 2019 04:40:21 -0400
Received: by mail-wm1-f71.google.com with SMTP id s19so670302wmj.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Oct 2019 01:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ntyadbXs7VDt7FQBmjZ76KNlx690UeZCCELiKGewZ6s=;
        b=LtPHwQfj2+ozJokl2+cZM3EyzUZibkJJMHJ4s/3tHBn8/1h7BPunDJQLVDZBt0bg9Y
         OLaQCVy0DzQ9NnJk+HAwEYmgArApPQcPc4J7JzPV64wYCYkTHu78hYfdxB1LwoGyWPy/
         wuwoQgi/kIf+Sy3pJO+vp5iwh68Tq8IywvSxMcNetLPCkaWVbdzdRGi83CDy+MuhAnXQ
         qqqtRlTDsyk71Rsbe++XfcnQw1DAIumwWdwkoUaxPo1dlUlYxL22Oyl/wWhMZ0emZplW
         Vt+l18Qaj7adBNtyeUrw0I2mTe90Ws/3ZPbu3rSZbiawaMvMzGVasu1/g7Hx2NatgI9O
         1ZBQ==
X-Gm-Message-State: APjAAAWXN7jK6hVqvNL5YUCZHuDK4/PqCDJRL0rxmwkxXEI0kZy4qyak
        1tqxlxN5qm6C7ODlvEwh+7xArlulJKGXW++q65aYYHpcmT93evMcHMXpTK762ymiCFFd8UUPPBu
        0D1u/tUWRJL8iodIn+6Eb0rhfnV0cNxYPzg==
X-Received: by 2002:adf:f101:: with SMTP id r1mr1710313wro.320.1571215219905;
        Wed, 16 Oct 2019 01:40:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyvoIQ4LOf0gV2qLnaowbxKt5t1NDgINZNLM3EjbVpZopbtdc36oYCIcVLMAAnTgcJ1m4QxcA==
X-Received: by 2002:adf:f101:: with SMTP id r1mr1710296wro.320.1571215219673;
        Wed, 16 Oct 2019 01:40:19 -0700 (PDT)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id f8sm1462810wmb.37.2019.10.16.01.40.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 01:40:19 -0700 (PDT)
Subject: Re: [RESEND][PATCH v1] platform/x86: i2c-multi-instantiate: Fail the
 probe if no IRQ provided
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, Ammy Yi <ammy.yi@intel.com>
Cc:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20191014115739.15342-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bf1a28d9-30d6-3730-ea08-c7ae2b3c8e79@redhat.com>
Date:   Wed, 16 Oct 2019 10:40:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191014115739.15342-1-andriy.shevchenko@linux.intel.com>
Content-Language: en-US
X-MC-Unique: aJuThK2GMpORQrHfazw73w-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/14/19 1:57 PM, Andy Shevchenko wrote:
> For APIC case of interrupt we don't fail a ->probe() of the driver,
> which makes kernel to print a lot of warnings from the children.
>=20
> We have two options here:
> - switch to platform_get_irq_optional(), though it won't stop children
>    to be probed and failed
> - fail the ->probe() of i2c-multi-instantiate
>=20
> Since the in reality we never had devices in the wild where IRQ resource
> is optional, the latter solution suits the best.
>=20
> Fixes: 799d3379a672 ("platform/x86: i2c-multi-instantiate: Introduce IOAP=
IC IRQ support")
> Reported-by: Ammy Yi <ammy.yi@intel.com>
> Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> Cc: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

I thought I already replied to this, but the archive disagrees. Patch
looks good to me:

Reviewed-by; Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
> - Cc Ammy
>   drivers/platform/x86/i2c-multi-instantiate.c | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platf=
orm/x86/i2c-multi-instantiate.c
> index ea68f6ed66ae..ffb8d5d1eb5f 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -108,6 +108,7 @@ static int i2c_multi_inst_probe(struct platform_devic=
e *pdev)
>   =09=09=09if (ret < 0) {
>   =09=09=09=09dev_dbg(dev, "Error requesting irq at index %d: %d\n",
>   =09=09=09=09=09inst_data[i].irq_idx, ret);
> +=09=09=09=09goto error;
>   =09=09=09}
>   =09=09=09board_info.irq =3D ret;
>   =09=09=09break;
>=20

