Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5C5346C5269
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Mar 2023 18:24:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230191AbjCVRYj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Mar 2023 13:24:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49868 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230323AbjCVRYZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Mar 2023 13:24:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5310D67724
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:22:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1679505744;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=LRXVzF++MrVMIkJs3jZDHeZ/HQCwH6dYetSm4Auni4U=;
        b=MdgAJx3Wd9SrnkY9/IM7cSGxQ3F276RKsOH7mRDI6Rbqd1mhi3LTyUgU0Q0wcoveW31JcC
        vty4Hj8LumanDZge48fWMPT5JRoeyhJK5goq9XX2Sn3bLN0nh75DH3/Odi45/eftv9ZxgK
        UYad/6puT7fKuGb6rZIewZOZ6jgAXio=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-428-zYmJFC26ND-eFdYmvHnDwg-1; Wed, 22 Mar 2023 13:22:22 -0400
X-MC-Unique: zYmJFC26ND-eFdYmvHnDwg-1
Received: by mail-ed1-f70.google.com with SMTP id q13-20020a5085cd000000b004af50de0bcfso28594947edh.15
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 Mar 2023 10:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679505741;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LRXVzF++MrVMIkJs3jZDHeZ/HQCwH6dYetSm4Auni4U=;
        b=NLtmeaDqo82xg62WP0zSCLIk9dJw1eba50zaR1q5IEfVNUQdxsLIuqbfjz4laRecG/
         UY+r9iu1/j7IUlR3izVXZWKEHv98b7PtI/BRpn0odRqT8khisJ0oTGopRgc5+KCgDhdK
         hN+FmL614rrQ3ojkMQM5KfqUMjx3+yH6EaALXtgCREGPEMXaUsO+q2XtlIopTMKZT9fP
         1Nzkc7Tf5iCk8hp4vP5zsaOk0Jor2C5S1ryXevNYKcnRakFSdjdziL0IXysKrUjxOH85
         TUHGJRI52ZIxMHgFgJif4N7Td52iFdC/dROXSeT0VQnTwAaNdRvj2IVYGQClDOPmcedC
         3yMA==
X-Gm-Message-State: AO0yUKWf5k6CXcXQ0ZDLBxxE8qS9WG8QHQfLDaKF0DNfHj24IZvaj0yT
        UxQ3VKk1WkArIt0dsHsj8UEc80HXoKvEg+8734Qt23XIxsav8WiSnirN9ZG4LjezRlM+wjCzjM5
        KByl6kzOmFG14I0e/BLsfgBgTpMXV6+8nNA==
X-Received: by 2002:a17:906:46ce:b0:931:ad32:79ed with SMTP id k14-20020a17090646ce00b00931ad3279edmr8131238ejs.12.1679505741544;
        Wed, 22 Mar 2023 10:22:21 -0700 (PDT)
X-Google-Smtp-Source: AK7set8xtI18BKS9k7p/pa5yo7CxtqKHem/X/Gy85iArc5emZqyws6miH9/u9bwflD3rZSCFexAEoQ==
X-Received: by 2002:a17:906:46ce:b0:931:ad32:79ed with SMTP id k14-20020a17090646ce00b00931ad3279edmr8131213ejs.12.1679505741212;
        Wed, 22 Mar 2023 10:22:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id t21-20020a50d715000000b004af7191fe35sm8042388edi.22.2023.03.22.10.22.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Mar 2023 10:22:20 -0700 (PDT)
Message-ID: <15dfc66b-83f7-4abf-1bc3-3bd9a2666aa1@redhat.com>
Date:   Wed, 22 Mar 2023 18:22:20 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 5/8] leds: tps68470: Refactor tps68470_brightness_get()
Content-Language: en-US, nl
To:     Daniel Scally <dan.scally@ideasonboard.com>,
        linux-leds@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     pavel@ucw.cz, lee@kernel.org, markgross@kernel.org,
        sboyd@kernel.org, hpa@redhat.com
References: <20230322160926.948687-1-dan.scally@ideasonboard.com>
 <20230322160926.948687-6-dan.scally@ideasonboard.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230322160926.948687-6-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-0.2 required=5.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/22/23 17:09, Daniel Scally wrote:
> We want to extend tps68470_brightness_get() to be usable with the
> other LEDs supplied by the IC; refactor it to make that easier.
> 
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
>  drivers/leds/leds-tps68470.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/leds/leds-tps68470.c b/drivers/leds/leds-tps68470.c
> index d2060fe4259d..44df175d25de 100644
> --- a/drivers/leds/leds-tps68470.c
> +++ b/drivers/leds/leds-tps68470.c
> @@ -77,23 +77,24 @@ static enum led_brightness tps68470_brightness_get(struct led_classdev *led_cdev
>  	int ret = 0;
>  	int value = 0;
>  
> -	ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
> -	if (ret)
> -		return dev_err_probe(led_cdev->dev, -EINVAL, "failed on reading register\n");
> -
>  	switch (led->led_id) {
>  	case TPS68470_ILED_A:
> -		value = value & TPS68470_ILEDCTL_ENA;
> -		break;
>  	case TPS68470_ILED_B:
> -		value = value & TPS68470_ILEDCTL_ENB;
> +		ret =  regmap_read(regmap, TPS68470_REG_ILEDCTL, &value);
> +		if (ret)
> +			return dev_err_probe(led_cdev->dev, ret,
> +					     "failed to read LED status\n");

I realize this is a pre-existing problem, but I don't think we should
be using dev_err_probe() in functions which are used outside the probe()
path?

So maybe fix this up while at it and make this:

		if (ret) {
			dev_err(led_cdev->dev, ""failed to read LED status: %d\n", ret);
			return ret;
		}

> +
> +		value &= led->led_id == TPS68470_ILED_A ? TPS68470_ILEDCTL_ENA :
> +					TPS68470_ILEDCTL_ENB;
>  		break;
> +	default:
> +		return dev_err_probe(led_cdev->dev, -EINVAL, "invalid LED ID\n");

idem.

With those fixed:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



>  	}
>  
>  	return value ? LED_ON : LED_OFF;
>  }
>  
> -
>  static int tps68470_ledb_current_init(struct platform_device *pdev,
>  				      struct tps68470_device *tps68470)
>  {

