Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 04D513D8A49
	for <lists+platform-driver-x86@lfdr.de>; Wed, 28 Jul 2021 11:08:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231493AbhG1JIH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 28 Jul 2021 05:08:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:47209 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231539AbhG1JIH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 28 Jul 2021 05:08:07 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1627463285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hzpX4Anju1g1uTE/VmLWDxyTDF0xzMb9RwOUSeDvum0=;
        b=Fvd2BuEq/EYcTAQjftZm45bNQmwwtGPfJYafH3Ja15v7QIjDTf66OVEw7VPrdIxvqZ8AMs
        KDe+S/VfkAmsf+Gl74uI66HGcXAYVnL8TurJPdCNlULl2qjoU4PCFXURnF1hrJE+A0+1vT
        QEVIwFNMS1TM0PwVDYwvDnbxwN2fC7s=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-539-oPxotjd7ODuq5us7c5CIAg-1; Wed, 28 Jul 2021 05:08:04 -0400
X-MC-Unique: oPxotjd7ODuq5us7c5CIAg-1
Received: by mail-ed1-f69.google.com with SMTP id p2-20020a50c9420000b02903a12bbba1ebso936729edh.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 28 Jul 2021 02:08:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hzpX4Anju1g1uTE/VmLWDxyTDF0xzMb9RwOUSeDvum0=;
        b=GGZPA5qOvIHL2JGPqtwtEr1d7ufPX3wN7Vzj4mWTNZ+T7rDAa90VD5JAQZaAZ31tiq
         RpuN6uQFPI4ZqZyVUi8En8ww66xdviIDVj1QbRTbImE9d0X90i/UxSXUJ15bSxTV+JUm
         +XAY8qoD0obAOJ1oiCL914uV1JEemGMGw8nChuMeuuQTz9/e/lRGbgBzZIcLctDk1b1C
         uHL5l38QD2YEhGTiTvamzOL6zaGyF8mimZQlzItBos/9uax5wgXCjpqAQDHYqDZJdJDB
         MS+JpdhgL6a5imj9WuDznMPfglKorVYO4NIo4yNhuxtTiaNcfIhvSIcA8JjRv3+ZvcSt
         oyAA==
X-Gm-Message-State: AOAM531OOn3Kz3NqpGAqdk6k+j+83JKjQTlq7mWuln3tij9Ec5aKQ/X8
        OdbXLTQxS53iSNHH4jZrmg7dIIYpBB2vnIY8MitXS61a51COFhubL8g/isy7AihRboDCaSwS2kC
        eA9QNaf4PzB+ORYZagctsx+nHGNEoLquYlhQcvSnEhLAHajF3NkIEFav3WLB80H0MWXEGlVaJ1A
        bCAmjSxepiwg==
X-Received: by 2002:a05:6402:3450:: with SMTP id l16mr32743560edc.358.1627463282739;
        Wed, 28 Jul 2021 02:08:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsUf6D4UqA78keeC1CvqRtWMLxpq2D9fXM93HChpsnw2Tl65AEmHpWTsw0oYo69Bkiv7LKeQ==
X-Received: by 2002:a05:6402:3450:: with SMTP id l16mr32743539edc.358.1627463282599;
        Wed, 28 Jul 2021 02:08:02 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b13sm2326917ede.49.2021.07.28.02.08.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jul 2021 02:08:02 -0700 (PDT)
Subject: Re: [PATCH 1/2] acpi: Add acpi_init_properties to ACPI driver code
To:     Michael Bottini <michael.a.bottini@linux.intel.com>,
        rjw@rjwysocki.net, lenb@kernel.org, irenic.rajneesh@gmail.com,
        david.e.box@linux.intel.com, mgross@linux.intel.com
Cc:     linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20210723202157.2425-1-michael.a.bottini@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d8e4f0f3-7282-50d4-16ac-2f67b210373c@redhat.com>
Date:   Wed, 28 Jul 2021 11:08:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210723202157.2425-1-michael.a.bottini@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/23/21 10:21 PM, Michael Bottini wrote:
> Some products in the field, like Intel Rocket Lake systems, contain
> AML code that can modify _DSD properties after they have been
> evaluated by ACPI init code. Therefore, there is a need for drivers
> to be able to reevaluate _DSDs so that the updated property values can
> be read. Export acpi_init_properties() for this purpose.
> 
> Signed-off-by: Michael Bottini <michael.a.bottini@linux.intel.com>

My first instinct here is this is a firmware bug and we should
go out of our way here to not support this and to instead apply
pressure on the vendor to get the firmware fixed.

Let me explain, the standard use of _DSD is to allow embedding
open-firmware/devicetree style properties inside ACPI nodes.

devicetree files, unlike AML contain static information, which
is parsed once and only once.

Allowing AML code to dynamically change _DSD results pretty
much breaks this entire model.

So I might be shooting from the hip a bit here:
"no, just no". IOW nack.

Regards,

Hans






> ---
>  drivers/acpi/property.c | 1 +
>  include/linux/acpi.h    | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/drivers/acpi/property.c b/drivers/acpi/property.c
> index e312ebaed8db..2c1f8cf1a8f0 100644
> --- a/drivers/acpi/property.c
> +++ b/drivers/acpi/property.c
> @@ -432,6 +432,7 @@ void acpi_init_properties(struct acpi_device *adev)
>  	if (!adev->data.pointer)
>  		acpi_extract_apple_properties(adev);
>  }
> +EXPORT_SYMBOL(acpi_init_properties);
>  
>  static void acpi_destroy_nondev_subnodes(struct list_head *list)
>  {
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index 72e4f7fd268c..57defc3bc9b9 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -716,6 +716,8 @@ static inline u64 acpi_arch_get_root_pointer(void)
>  
>  int acpi_get_local_address(acpi_handle handle, u32 *addr);
>  
> +void acpi_init_properties(struct acpi_device *adev);
> +
>  #else	/* !CONFIG_ACPI */
>  
>  #define acpi_disabled 1
> @@ -976,6 +978,10 @@ static inline int acpi_get_local_address(acpi_handle handle, u32 *addr)
>  	return -ENODEV;
>  }
>  
> +static inline void acpi_init_properties(struct acpi_device *adev)
> +{
> +}
> +
>  #endif	/* !CONFIG_ACPI */
>  
>  #ifdef CONFIG_ACPI_HOTPLUG_IOAPIC
> 

