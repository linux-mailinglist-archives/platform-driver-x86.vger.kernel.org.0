Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A59A24BE5AE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 21 Feb 2022 19:01:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233128AbiBUK3d (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 21 Feb 2022 05:29:33 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:37840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354688AbiBUK3O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 21 Feb 2022 05:29:14 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 2566B66AFA
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 01:51:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1645437010;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=88houUaciP/d6/AWIIRoKq1UYLz/KQk9XhKaIcWCOT0=;
        b=A5Hdw80Kgbz9gbwQD/mqrOSz46AM1OCLEy8Bzt3ctZa4HiL7KLbl/tF3gfRDfnJyuHARdX
        yKDwz3PACKfseGfkjl7SzK9IQ3UCw3QYzgPa1TX858r+MplWPg63aEaYJU7UQODB+3Tgat
        uBKsazzqYZSEu4n1pAfhCDr6jVojlaU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-642-CwKEcar2PtGpbcxnfnsAGA-1; Mon, 21 Feb 2022 04:50:06 -0500
X-MC-Unique: CwKEcar2PtGpbcxnfnsAGA-1
Received: by mail-ej1-f70.google.com with SMTP id d7-20020a1709061f4700b006bbf73a7becso4431505ejk.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 21 Feb 2022 01:50:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=88houUaciP/d6/AWIIRoKq1UYLz/KQk9XhKaIcWCOT0=;
        b=hVgfPNXlHQOkmExhkXPbDu9fsqTatKUpAeX74EFzQFFGqWVqqho71FClVmkNaqOorC
         xs3apwZXVWHDMtStTzpoLjKgw4mYsrPhCCaTQIb/2y+tYCdqyGgqWowVqka3j3GkapHi
         c75Kkxm+Ua/RcUWiUYXyYaROn7Tv2Pda6uRM3987HXgqwG/BySwayOmcZlaNmbMswHTP
         sc98x1LIyATomJ87gBqcz7mbY8777yGjH8iDZnqOlCoVQ5nw2Hfk6GvkSt9ra390RWbF
         BEAkEbeccxAf7bwUIJ8fCuOTS337ABKMvFaiEc0hDF5B46JwGF4J8Y97cR5eMrutBE+r
         bMzw==
X-Gm-Message-State: AOAM533FCvyAwGjLXE5in1bTMoiW/tEevwMTOfEPp53TMx9TwDpaqEWM
        gipBGMDLuwI6SALeh8ZHOArFdjVMCZRv/GF2hKejtYbjCuEMtylnP+A10Iuhk1Fl0wljDoy+ZFp
        X809yT3p+dJ29biGnPRM6XYdTNZEMBERseA==
X-Received: by 2002:aa7:cf06:0:b0:405:e0c8:8b5d with SMTP id a6-20020aa7cf06000000b00405e0c88b5dmr19881058edy.367.1645437005552;
        Mon, 21 Feb 2022 01:50:05 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwe/A3CAZ8w7GD28jop57j6yBU2x42zArQ2Z28XOB6P9Y6fTKfcqvM4HoYMzXlLYWmQ9dQzxg==
X-Received: by 2002:aa7:cf06:0:b0:405:e0c8:8b5d with SMTP id a6-20020aa7cf06000000b00405e0c88b5dmr19881029edy.367.1645437005271;
        Mon, 21 Feb 2022 01:50:05 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id x14sm8510811edd.63.2022.02.21.01.50.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 21 Feb 2022 01:50:04 -0800 (PST)
Message-ID: <74f89182-1699-f4a7-85e0-66976021913d@redhat.com>
Date:   Mon, 21 Feb 2022 10:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.0
Subject: Re: [PATCH 1/6] ACPI: scan: Add acpi_dev_get_next_consumer_dev()
Content-Language: en-US
To:     Daniel Scally <djrscally@gmail.com>, linux-acpi@vger.kernel.org,
        linux-clk@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     rafael@kernel.org, lenb@kernel.org, mturquette@baylibre.com,
        sboyd@kernel.org, markgross@kernel.org, robert.moore@intel.com
References: <20220216225304.53911-1-djrscally@gmail.com>
 <20220216225304.53911-2-djrscally@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220216225304.53911-2-djrscally@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/16/22 23:52, Daniel Scally wrote:
> In commit b83e2b306736 ("ACPI: scan: Add function to fetch dependent of ACPI
> device") we added a means of fetching the first device to declare itself
> dependent on another ACPI device in the _DEP method. One assumption
> in that patch was that there would only be a single consuming device,
> but this has not held.
> 
> Extend the functionality by adding a new function that fetches the
> next consumer of a supplier device. We can then simplify the original
> function by simply calling the new one.
> 
> Signed-off-by: Daniel Scally <djrscally@gmail.com>
> ---
>  drivers/acpi/scan.c     | 47 ++++++++++++++++++++++++++++++++++-------
>  include/acpi/acpi_bus.h |  2 ++
>  2 files changed, 41 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 4463c2eda61e..b3ed664ee1cb 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -2256,9 +2256,21 @@ static void acpi_bus_attach(struct acpi_device *device, bool first_pass)
>  		device->handler->hotplug.notify_online(device);
>  }
>  
> -static int acpi_dev_get_first_consumer_dev_cb(struct acpi_dep_data *dep, void *data)
> +static int acpi_dev_get_next_consumer_dev_cb(struct acpi_dep_data *dep, void *data)
>  {
> -	struct acpi_device *adev;
> +	struct acpi_device *adev = *(struct acpi_device **)data;
> +
> +	/*
> +	 * If we're passed a 'previous' consumer device then we need to skip
> +	 * any consumers until we meet the previous one, and then NULL @data
> +	 * so the next one can be returned.
> +	 */
> +	if (adev) {
> +		if (dep->consumer == adev->handle)
> +			*(struct acpi_device **)data = NULL;
> +
> +		return 0;
> +	}
>  
>  	adev = acpi_bus_get_acpi_device(dep->consumer);
>  	if (adev) {
> @@ -2389,23 +2401,42 @@ bool acpi_dev_ready_for_enumeration(const struct acpi_device *device)
>  EXPORT_SYMBOL_GPL(acpi_dev_ready_for_enumeration);
>  
>  /**
> - * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
> + * acpi_dev_get_next_consumer_dev - Return the next adev dependent on @supplier
>   * @supplier: Pointer to the dependee device
> + * @start: Pointer to the current dependent device
>   *
> - * Returns the first &struct acpi_device which declares itself dependent on
> + * Returns the next &struct acpi_device which declares itself dependent on
>   * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
>   *
>   * The caller is responsible for putting the reference to adev when it is no
>   * longer needed.

This bit of the help text seems to not be entirely correct, since the reference to
start gets consumed by this, so the caller only needs to put the device when it
does NOT pass it as start to another acpi_dev_get_next_consumer_dev call.



>   */
> -struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier)
> +struct acpi_device *acpi_dev_get_next_consumer_dev(struct acpi_device *supplier,
> +						   struct acpi_device *start)
>  {
> -	struct acpi_device *adev = NULL;
> +	struct acpi_device *adev = start;
>  
>  	acpi_walk_dep_device_list(supplier->handle,
> -				  acpi_dev_get_first_consumer_dev_cb, &adev);
> +				  acpi_dev_get_next_consumer_dev_cb, &adev);
>  
> -	return adev;
> +	acpi_dev_put(start);
> +	return adev == start ? NULL : adev;
> +}
> +EXPORT_SYMBOL_GPL(acpi_dev_get_next_consumer_dev);
> +
> +/**
> + * acpi_dev_get_first_consumer_dev - Return ACPI device dependent on @supplier
> + * @supplier: Pointer to the dependee device
> + *
> + * Returns the first &struct acpi_device which declares itself dependent on
> + * @supplier via the _DEP buffer, parsed from the acpi_dep_list.
> + *
> + * The caller is responsible for putting the reference to adev when it is no
> + * longer needed.
> + */
> +struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier)
> +{
> +	return acpi_dev_get_next_consumer_dev(supplier, NULL);
>  }
>  EXPORT_SYMBOL_GPL(acpi_dev_get_first_consumer_dev);

The only caller of this is skl_int3472_get_sensor_adev_and_name() IMHO it would
be better to just move that over to acpi_dev_get_next_consumer_dev(..., NULL);
in this same patch and just drop acpi_dev_get_first_consumer_dev() all together.

I expect this entire series to get merged through the pdx86 tree, so from
that pov doing this should be fine..

Regards,

Hans



>  
> diff --git a/include/acpi/acpi_bus.h b/include/acpi/acpi_bus.h
> index ca88c4706f2b..8b06fef04722 100644
> --- a/include/acpi/acpi_bus.h
> +++ b/include/acpi/acpi_bus.h
> @@ -720,6 +720,8 @@ bool acpi_dev_hid_uid_match(struct acpi_device *adev, const char *hid2, const ch
>  
>  void acpi_dev_clear_dependencies(struct acpi_device *supplier);
>  bool acpi_dev_ready_for_enumeration(const struct acpi_device *device);
> +struct acpi_device *acpi_dev_get_next_consumer_dev(struct acpi_device *supplier,
> +						   struct acpi_device *start);
>  struct acpi_device *acpi_dev_get_first_consumer_dev(struct acpi_device *supplier);
>  struct acpi_device *
>  acpi_dev_get_next_match_dev(struct acpi_device *adev, const char *hid, const char *uid, s64 hrv);

