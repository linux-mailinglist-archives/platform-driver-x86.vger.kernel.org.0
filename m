Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 83AAA5A4AE6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Aug 2022 14:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229714AbiH2MCu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 29 Aug 2022 08:02:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229723AbiH2MCe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 29 Aug 2022 08:02:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C2996A4BD
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 04:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661773512;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/+ol45wcaykEdTNetUJWIBi1LCbfsk01RK0NNg2LzGI=;
        b=MITaWDNOlKDyXq46BIo20QIes2EJjRw5XaAW0L/UzYY6JOvJV/sb4+T4vq1Ekha1S8n6W6
        PNkixgGw+OYIsk+DWMMz1k6RMJw0hlK2g/AZnwZpSjqBvVL26cQZxtPvSDkOrPPqe/YIEx
        Je71Eerd0kBAXoIlxYVTXuSF6BnkqDI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-385-wPL6qd3_PGiWuTMSoEKgAQ-1; Mon, 29 Aug 2022 07:45:11 -0400
X-MC-Unique: wPL6qd3_PGiWuTMSoEKgAQ-1
Received: by mail-ej1-f72.google.com with SMTP id xc12-20020a170907074c00b007416699ea14so1048525ejb.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Aug 2022 04:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=/+ol45wcaykEdTNetUJWIBi1LCbfsk01RK0NNg2LzGI=;
        b=Aw3td75Qu9NY6e1KPTIC1MCSQkCxJlzrxJR9mMwNPIQ/QGUYKJULmQTBqzSSRDBQB9
         clHOH57mwQgwrZDh0xgzvilHbLBvkZDxcc8GC2dIVTocWFvNSw+0ZN65gwfDIfCuht4H
         eqWmz78TnktBPDxQxkPQYAAeIYFK75Oajrvy0ijT1jK8RbBF2JPZjGSiInQOfYFwB7qf
         VevNVkPLde4K7g8t0LoAr56K2g/u+CrqlvmiiZHzeWwSP3nhIut66dN+cqXW1lphevkX
         uEG5t3RH238rqdtMb4jaTpOhF1uCBwI0PGF3vufaFxQpDZ6ZdHxzLTe3sp4zylqCxfe5
         hDOw==
X-Gm-Message-State: ACgBeo0a4Y0NqhnetKL+xeoPkZJufxHJe5IOEuuBvh5ZWQ1APUBu6X42
        QkPCJbiKc0EUBOuRqivGuVzooFVh0f2xMI+KWql2IiCPT4kN9Mb/QuRGiD2atu/W5pLzwU9cxO3
        STgso1hO4zconzcRntU3X3X3v48Q1D+FOaA==
X-Received: by 2002:aa7:cb06:0:b0:446:7668:2969 with SMTP id s6-20020aa7cb06000000b0044676682969mr16077828edt.206.1661773509847;
        Mon, 29 Aug 2022 04:45:09 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5XXFYyq+Wc/2lY2uJUxzelUZ0ulUoBxQrTUQ0Y3wQ5QIKfuYa30lKSflrHf9tyAuMTb45U8A==
X-Received: by 2002:aa7:cb06:0:b0:446:7668:2969 with SMTP id s6-20020aa7cb06000000b0044676682969mr16077817edt.206.1661773509660;
        Mon, 29 Aug 2022 04:45:09 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id z14-20020a1709060ace00b0073d6d6e698bsm4345840ejf.187.2022.08.29.04.45.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Aug 2022 04:45:08 -0700 (PDT)
Message-ID: <a547f88a-7ab2-e665-aa6d-d80ef74f4fd4@redhat.com>
Date:   Mon, 29 Aug 2022 13:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH] platform/x86: wmi: Lower verbosity of some duplicate GUID
 messages
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220826170053.2124-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220826170053.2124-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Mario,

On 8/26/22 19:00, Mario Limonciello wrote:
> The WMI subsystem in the kernel currently tracks WMI devices by
> a GUID string not by ACPI device.  The GUID used by the `wmi-bmof`
> module however is available from many devices on nearly every machine.
> 
> This originally was though to be a bug, but as it happens on most
> machines it is a design mistake.  As there isn't an active need to
> get the binary from each of the `wmi-bmof` device, special case it
> and lower the message to debugging.  This will help to identify if
> there are other duplicate GUIDs in the wild.
> 
> If there are and the information contained in them is desirable it
> may be worth considering a design change to the WMI subsystem to
> access those.
> 
> Link: https://lkml.org/lkml/2017/12/8/913
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>

I am a bit surprised by this patch. I though that there was
consensus that the right thing to do here is actually create
wmi-bus devices for the duplicate WMI-ids adding a numbered
postfix to the extra devices (lets not add the postfix
to the first device for each WMI GUID as some userspace
code / scripts may depend on the sysfs paths not changing).

IMHO registering wmi-bus devices for all the WMI devices
in the ACPI table would be the right thing to do ?

Regards,

Hans




> ---
>  drivers/platform/x86/wmi-bmof.c |  2 --
>  drivers/platform/x86/wmi.c      | 10 ++++++++--
>  include/linux/wmi.h             |  2 ++
>  3 files changed, 10 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index 80137afb9753..af46e9e03376 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -18,8 +18,6 @@
>  #include <linux/types.h>
>  #include <linux/wmi.h>
>  
> -#define WMI_BMOF_GUID "05901221-D566-11D1-B2F0-00A0C9062910"
> -
>  struct bmof_priv {
>  	union acpi_object *bmofdata;
>  	struct bin_attribute bmof_bin_attr;
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index aed293b5af81..d7a1f4bf443b 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -1157,6 +1157,9 @@ static void wmi_free_devices(struct acpi_device *device)
>  static bool guid_already_parsed(struct acpi_device *device, const guid_t *guid)
>  {
>  	struct wmi_block *wblock;
> +	guid_t guid_wmi_bmof;
> +
> +	guid_parse(WMI_BMOF_GUID, &guid_wmi_bmof);
>  
>  	list_for_each_entry(wblock, &wmi_block_list, list) {
>  		if (guid_equal(&wblock->gblock.guid, guid)) {
> @@ -1166,8 +1169,11 @@ static bool guid_already_parsed(struct acpi_device *device, const guid_t *guid)
>  			 * we need to suppress GUIDs that are unique on a
>  			 * given node but duplicated across nodes.
>  			 */
> -			dev_warn(&device->dev, "duplicate WMI GUID %pUL (first instance was on %s)\n",
> -				 guid, dev_name(&wblock->acpi_device->dev));
> +			if (guid_equal(guid, &guid_wmi_bmof))
> +				dev_dbg(&device->dev, "duplicate WMI-BMOF GUID found\n");
> +			else
> +				dev_warn(&device->dev, "duplicate WMI GUID %pUL (first instance was on %s)\n",
> +					 guid, dev_name(&wblock->acpi_device->dev));
>  			return true;
>  		}
>  	}
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index b88d7b58e61e..59acdceb4411 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -13,6 +13,8 @@
>  #include <linux/mod_devicetable.h>
>  #include <uapi/linux/wmi.h>
>  
> +#define WMI_BMOF_GUID "05901221-D566-11D1-B2F0-00A0C9062910"
> +
>  struct wmi_device {
>  	struct device dev;
>  

