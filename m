Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 277F463CABF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 29 Nov 2022 22:58:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236729AbiK2V53 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 29 Nov 2022 16:57:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237097AbiK2V50 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 29 Nov 2022 16:57:26 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69E046CA0A
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 13:56:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669758993;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0AUk6qR4B5ebSDINamVmjl1eCAYkVyyZCd85+CuwZ6E=;
        b=C7EShfOc1p7hqmWAuQM7GeOPUd3HoStqzr3NuUTZC+DYOYRMR91C1ca/Re+1ikp3czWJl6
        gxNNZSf66Mqxc2dJkblZ6fOblPySAPdL4e5egvPau+FX5NMSLfGEXyFFKO9k/JBtXid4D0
        ZmPAHgK6rXN9An8INZXyb6+J7W3U5g0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-XIG03ggRMjWYdFnwc-slqA-1; Tue, 29 Nov 2022 16:56:32 -0500
X-MC-Unique: XIG03ggRMjWYdFnwc-slqA-1
Received: by mail-ed1-f72.google.com with SMTP id m7-20020a056402430700b0045daff6ee5dso8961605edc.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 29 Nov 2022 13:56:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0AUk6qR4B5ebSDINamVmjl1eCAYkVyyZCd85+CuwZ6E=;
        b=qv8Il70HZjS7F6pOg7jSwRjgzop800Hd9lRa+9GCBNaRQLyVTAagNyj0dPuoNWnotq
         MTBT+xTiXD8wpTOHRN4i6PuWb9Osr08ZAkUmkBjFP4HMW8UaqXyXltPDQOBf8z2vkJql
         sS0xoCvfXpkZoCCTHSTdo1gIa2VOejpoaRB/Vkq5xzMuuQcOFulWJSOdtDiAFYVaYkvC
         7imNFg86rAjjMG/Za3ZVl5+BymFK70BWK1g5Mjs1vOOp6B6Y41lAVX5nQSVrSk3o5+n3
         fAbH0FshEchWYXWG9eHg4ts2faOhlat+E57q4FMQpTIZZn4VRn0eMsyxfy4W6hvifyC6
         Gt2w==
X-Gm-Message-State: ANoB5plb2WrJB1n55qulr1gvAdWytkjSrSouRsls4qK641Xk+l6wmw17
        vaBbkdAZ9UsXgV/wIGJTyFsQNaEBxqEE5btT1of7rcx9uIdWKSscrN6DKXOBYd3rN15GA61eEjL
        nzCKgFi1QuSFzAwJZc1j5oNpJcGcLh9qqsA==
X-Received: by 2002:a17:906:d281:b0:782:7790:f132 with SMTP id ay1-20020a170906d28100b007827790f132mr33754568ejb.649.1669758990823;
        Tue, 29 Nov 2022 13:56:30 -0800 (PST)
X-Google-Smtp-Source: AA0mqf56sOg4TvbyTvw3KXXplTnjusmLirIhT2V04UdQAWz+JG9TesKuBEvmYv9QyqHNkbHpuRtM5A==
X-Received: by 2002:a17:906:d281:b0:782:7790:f132 with SMTP id ay1-20020a170906d28100b007827790f132mr33754561ejb.649.1669758990600;
        Tue, 29 Nov 2022 13:56:30 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id kw11-20020a170907770b00b007add28659b0sm6644596ejc.140.2022.11.29.13.56.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Nov 2022 13:56:30 -0800 (PST)
Message-ID: <9894401b-8d5f-a619-4db7-7834a8f15208@redhat.com>
Date:   Tue, 29 Nov 2022 22:56:29 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH 2/3] platform/x86: int3472/discrete: Get the polarity from
 the _DSM entry
To:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <djrscally@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Kate Hsuan <hpa@redhat.com>, linux-media@vger.kernel.org
References: <20221124200007.390901-1-hdegoede@redhat.com>
 <20221124200007.390901-3-hdegoede@redhat.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221124200007.390901-3-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

On 11/24/22 21:00, Hans de Goede wrote:
> The out of tree IPU6 driver has moved to also using the in kernel INT3472
> code for doing power-ctrl rather then doing their own thing (good!).
> 
> On IPU6 the polarity is encoded in the _DSM entry rather then being
> hardcoded to GPIO_ACTIVE_LOW.
> 
> Using the _DSM entry for this on IPU3 leads to regressions, so only
> use the _DSM entry for this on non IPU3 devices.

So it turns out that the reason why this does not work on IPU3 is
because looking at this as polarity = (bits 31-24) ? high:low is not
correct.

The correct way of looking at this really is:

	polarity = default-polarity-for-pin;
	if ((bits 31-24) == 0)
		polarity = !polarity;

The: "polarity = (bits 31-24) ? high:low" thing did work with IPU6
because the out of tree bundled drivers set reset and poweroff
to 1 on power-on and to 0 on power-off. IOW they apply the
default active-low-ness of these pins at the sensor driver level
rather then letting the GPIO core handle this. Which is actually
the wrong thing to do...

For the new series replacing this one I'm going to go with the:

	if ((bits 31-24) == 0)
		polarity = !polarity;

Approach which works on both IPU3 and IPU6. I'll also make this
the last patch in the series and I'll probably merge it later
then the rest of the series so that it can get some extra testing.

Regards,

Hans


> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/int3472/discrete.c | 28 +++++++++++++++++--
>  1 file changed, 26 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
> index bc6c62f3f3bf..9159291be28a 100644
> --- a/drivers/platform/x86/intel/int3472/discrete.c
> +++ b/drivers/platform/x86/intel/int3472/discrete.c
> @@ -11,6 +11,7 @@
>  #include <linux/kernel.h>
>  #include <linux/module.h>
>  #include <linux/overflow.h>
> +#include <linux/pci.h>
>  #include <linux/platform_device.h>
>  #include <linux/uuid.h>
>  
> @@ -36,6 +37,19 @@ static const guid_t cio2_sensor_module_guid =
>  	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
>  		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
>  
> +/* IPU3 vs IPU6 needs to be handled differently */
> +#define IPU3_CIO2_PCI_ID				0x9d32
> +
> +static const struct pci_device_id ipu3_cio2_pci_id_table[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_INTEL, IPU3_CIO2_PCI_ID) },
> +	{ }
> +};
> +
> +static int ipu3_present(void)
> +{
> +	return pci_dev_present(ipu3_cio2_pci_id_table);
> +}
> +
>  /*
>   * Here follows platform specific mapping information that we can pass to
>   * the functions mapping resources to the sensors. Where the sensors have
> @@ -242,6 +256,7 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  	union acpi_object *obj;
>  	const char *err_msg;
>  	const char *func;
> +	u32 polarity;
>  	int ret;
>  	u8 type;
>  
> @@ -265,13 +280,22 @@ static int skl_int3472_handle_gpio_resources(struct acpi_resource *ares,
>  
>  	type = obj->integer.value & 0xff;
>  
> +	/* IPU3 always uses active-low, IPU6 polarity is encoded in the _DSM entry. */
> +	if (ipu3_present())
> +		polarity = GPIO_ACTIVE_LOW;
> +	else
> +		polarity = ((obj->integer.value >> 24) & 0xff) ? GPIO_ACTIVE_HIGH : GPIO_ACTIVE_LOW;
> +
>  	func = int3472_dsm_type_to_func(type);
>  
> +	dev_dbg(int3472->dev, "%s %s pin %d active-%s\n", func,
> +		agpio->resource_source.string_ptr, agpio->pin_table[0],
> +		(polarity == GPIO_ACTIVE_HIGH) ? "high" : "low");
> +
>  	switch (type) {
>  	case INT3472_GPIO_TYPE_RESET:
>  	case INT3472_GPIO_TYPE_POWERDOWN:
> -		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func,
> -						     GPIO_ACTIVE_LOW);
> +		ret = skl_int3472_map_gpio_to_sensor(int3472, agpio, func, polarity);
>  		if (ret)
>  			err_msg = "Failed to map GPIO pin to sensor\n";
>  

