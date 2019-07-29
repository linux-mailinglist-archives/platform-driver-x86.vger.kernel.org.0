Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A6A4E78FE1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2019 17:53:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387578AbfG2Pxy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Jul 2019 11:53:54 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41590 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387467AbfG2Pxy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Jul 2019 11:53:54 -0400
Received: by mail-wr1-f67.google.com with SMTP id c2so59213463wrm.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2019 08:53:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iKTs5dyOZB3pPL6d1Et0cSPpdo4RaD4RlnUZJ53Gk3c=;
        b=QG9pA7tRjnLyp7CAEkoRcSki8FPjPc2GgnXK3HpOkPPXP3+CR0izLxoyeKLJO2xbnt
         9aZrwdJlVvozvTU97viDmI+bBNOy7DqQ5sESIA58u905pqyRFkNg/Z2st2jr07vLl+jL
         4EDrXu4LHtuBQUXwW0Ti82GbPTUpLT+fvKEIFOaHwd1PmAHHEM9XtWB3V9x7oezE65pR
         32NX0xQ/gKkIh4pocITiyo4ZT/WywkGm1NFQAX54EFsBxNhM3yYWWHY+R1+hb4sn7dpT
         vQG9Q7nphL4i4tKpuj6lywKZal9A1I+fUTeQWg8g+TxD1U52oQiShPZDvR6iI6F2fX/D
         Z/lg==
X-Gm-Message-State: APjAAAXy95E7fyLGrX0oeJeU2QoTIidfzKrumG776QTQu03Md/ntLQx5
        gM+P/voHTtl8JWKhF1CoydnWFw==
X-Google-Smtp-Source: APXvYqxXXF+K3kP02KwVNBCC7Ta0PHcwplAPnB2Y/KwJXT59YA38wPkdCPwKA9EVY0K++B35XRbhWg==
X-Received: by 2002:adf:8364:: with SMTP id 91mr120442869wrd.13.1564415632696;
        Mon, 29 Jul 2019 08:53:52 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id s10sm71145019wmf.8.2019.07.29.08.53.51
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Jul 2019 08:53:52 -0700 (PDT)
Subject: Re: [PATCH v1] platform/x86: i2c-multi-instantiate: Use struct_size()
 helper
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20190725190550.63184-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5f1ee0af-1ebb-a0fd-fcc0-9099f9f746dd@redhat.com>
Date:   Mon, 29 Jul 2019 17:53:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190725190550.63184-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 25-07-19 21:05, Andy Shevchenko wrote:
> One of the more common cases of allocation size calculations is finding
> the size of a structure that has a zero-sized array at the end, along
> with memory for some number of elements for that array.
> 
> Make use of the struct_size() helper instead of an open-coded version
> in order to avoid any potential type mistakes.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>


> ---
>   drivers/platform/x86/i2c-multi-instantiate.c | 4 +---
>   1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> index 197d8a192721..61fe341a85aa 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -81,9 +81,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
>   	if (ret < 0)
>   		return ret;
>   
> -	multi = devm_kmalloc(dev,
> -			offsetof(struct i2c_multi_inst_data, clients[ret]),
> -			GFP_KERNEL);
> +	multi = devm_kmalloc(dev, struct_size(multi, clients, ret), GFP_KERNEL);
>   	if (!multi)
>   		return -ENOMEM;
>   
> 
