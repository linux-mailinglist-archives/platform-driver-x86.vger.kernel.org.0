Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEC3F6F2AB9
	for <lists+platform-driver-x86@lfdr.de>; Sun, 30 Apr 2023 22:42:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231229AbjD3UmT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 30 Apr 2023 16:42:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232048AbjD3UmR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 30 Apr 2023 16:42:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78FAEE66
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Apr 2023 13:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1682887285;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jm9wm20c4+vg4eeBRzLsjBHPVILbi462q10zNdjRsHg=;
        b=QrZ9PUykm6wWSeFZSXNR0Fb48SZLD2vybrNA110Uv52aIFpyh9gOnTQOw+zXhvfdqqy5uy
        E07G4EuA32+W7eE5GrtvjT8thw6TeNd9htDnHSHwdaB/+SETQXxcNGouJdZD25JSm5JnVB
        eEBIj60/hyGbuOM4z4XvSg9dmu8nkWM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-CgMRHWMXPO29xeNTE_26Xw-1; Sun, 30 Apr 2023 16:41:19 -0400
X-MC-Unique: CgMRHWMXPO29xeNTE_26Xw-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50512c6e3e5so2156404a12.2
        for <platform-driver-x86@vger.kernel.org>; Sun, 30 Apr 2023 13:41:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682887278; x=1685479278;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jm9wm20c4+vg4eeBRzLsjBHPVILbi462q10zNdjRsHg=;
        b=jIdD985KBKLRv+X5eZiCJFEQ514mBxbIXXta7sfnKZXHN7o2Ma+6GAGAvG7CVuh6Td
         RnerehzwiBhGnTCaKt7R8VY/8rSe56li0ItH61SS9D3MocZXIWkKvBPBuJpYZwufnb5O
         Wiw2lQh2QR/N9lOQ+LZhWqW1bCh661L3UVJs71W6XrGt06xj2AaujtOTL2rPTuNGnuDY
         KQKewU/kx6cb+JXLFpCXp4bXqbZqsF9Kp8KXx99yCFl+QLFlCcBFlfoKEKWgt6FzVtlT
         Y1SOddAgCb/HNyXzUSxt+vu/pNhqttZXIlGdhSLbaI5cBqTwR56J42LLg7ISenqltsVL
         F7ug==
X-Gm-Message-State: AC+VfDwwiMDw8Xt5L9oIy4bVImTJLjU3y0BZHmXHxS+mVLX/uTrHCfy8
        od0HdK3X+kEAuFF9U2Hn4iQ9jRBvtg1U176mjoCuQC4FbGPRb7cZHiwPzF1I8KuI/Pv6hdBhQ7h
        PnZ7TmWi3EP1kBusgTt2A4FwYhu1lxU6vkw==
X-Received: by 2002:aa7:d807:0:b0:506:bcd6:b125 with SMTP id v7-20020aa7d807000000b00506bcd6b125mr4105119edq.40.1682887277996;
        Sun, 30 Apr 2023 13:41:17 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6HdEo0cBgvKHBFX+OMxAOGTk6ZGG5j9urckzcCVEYFpWtbXokDKvZImQUR1URICYmrqnrcIg==
X-Received: by 2002:aa7:d807:0:b0:506:bcd6:b125 with SMTP id v7-20020aa7d807000000b00506bcd6b125mr4105113edq.40.1682887277738;
        Sun, 30 Apr 2023 13:41:17 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id bc28-20020a056402205c00b00506c3c0d393sm11642877edb.78.2023.04.30.13.41.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 30 Apr 2023 13:41:16 -0700 (PDT)
Message-ID: <756215f5-d99c-b172-13f6-1a15e026bf65@redhat.com>
Date:   Sun, 30 Apr 2023 22:41:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH 1/2] platform/x86: wmi: Allow retrieving the number of WMI
 object instances
To:     Armin Wolf <W_Armin@gmx.de>, markgross@kernel.org
Cc:     Mario.Limonciello@amd.com, prasanth.ksr@dell.com,
        jorgealtxwork@gmail.com, james@equiv.tech,
        Dell.Client.Kernel@dell.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20230430203153.5587-1-W_Armin@gmx.de>
 <20230430203153.5587-2-W_Armin@gmx.de>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230430203153.5587-2-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

On 4/30/23 22:31, Armin Wolf wrote:
> Currently, the WMI driver core knows how many instances of a given
> WMI object exist, but WMI drivers cannot access this information.
> At the same time, some current and upcoming WMI drivers want to
> have access to this information. Add wmi_instance_count() and
> wmidev_instance_count() to allow WMI drivers to get the number of
> WMI object instances.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>

Thank you for your work on this.

> ---
>  drivers/platform/x86/wmi.c | 41 ++++++++++++++++++++++++++++++++++++++
>  include/linux/acpi.h       |  2 ++
>  include/linux/wmi.h        |  2 ++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c226dd4163a1..5b95d7aa5c2f 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -263,6 +263,47 @@ int set_required_buffer_size(struct wmi_device *wdev, u64 length)
>  }
>  EXPORT_SYMBOL_GPL(set_required_buffer_size);
> 
> +/**
> + * wmi_instance_count - Get number of WMI object instances
> + * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> + *
> + * Get the number of WMI object instances.
> + *
> + * Returns: Number of WMI object instances or negative error code.
> + */
> +int wmi_instance_count(const char *guid_string)
> +{
> +	struct wmi_block *wblock;
> +	acpi_status status;
> +
> +	status = find_guid(guid_string, &wblock);
> +	if (ACPI_FAILURE(status)) {
> +		if (status == AE_BAD_PARAMETER)
> +			return -EINVAL;
> +
> +		return -ENODEV;

Maybe just return 0 here ?

The GUID not existing at all does not seem like
an error to me, but rather a case of there
being 0 instances.

This will also allow patch 2/2 to completely
drop the get_instance_count() function and
replace its callers with direct calls to
wmi_instance_count() as the code is known
to always pass a valid GUID, so it won't hit
the -EINVAL path.

Regards,

Hans



> +	}
> +
> +	return wmidev_instance_count(&wblock->dev);
> +}
> +EXPORT_SYMBOL_GPL(wmi_instance_count);
> +
> +/**
> + * wmidev_instance_count - Get number of WMI object instances
> + * @wdev: A wmi bus device from a driver
> + *
> + * Get the number of WMI object instances.
> + *
> + * Returns: Number of WMI object instances.
> + */
> +u8 wmidev_instance_count(struct wmi_device *wdev)
> +{
> +	struct wmi_block *wblock = container_of(wdev, struct wmi_block, dev);
> +
> +	return wblock->gblock.instance_count;
> +}
> +EXPORT_SYMBOL_GPL(wmidev_instance_count);
> +
>  /**
>   * wmi_evaluate_method - Evaluate a WMI method (deprecated)
>   * @guid_string: 36 char string of the form fa50ff2b-f2e8-45de-83fa-65417f2f49ba
> diff --git a/include/linux/acpi.h b/include/linux/acpi.h
> index efff750f326d..e52bf2742eaf 100644
> --- a/include/linux/acpi.h
> +++ b/include/linux/acpi.h
> @@ -412,6 +412,8 @@ extern bool acpi_is_pnp_device(struct acpi_device *);
> 
>  typedef void (*wmi_notify_handler) (u32 value, void *context);
> 
> +int wmi_instance_count(const char *guid);
> +
>  extern acpi_status wmi_evaluate_method(const char *guid, u8 instance,
>  					u32 method_id,
>  					const struct acpi_buffer *in,
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index c1a3bd4e4838..763bd382cf2d 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -35,6 +35,8 @@ extern acpi_status wmidev_evaluate_method(struct wmi_device *wdev,
>  extern union acpi_object *wmidev_block_query(struct wmi_device *wdev,
>  					     u8 instance);
> 
> +u8 wmidev_instance_count(struct wmi_device *wdev);
> +
>  extern int set_required_buffer_size(struct wmi_device *wdev, u64 length);
> 
>  /**
> --
> 2.30.2
> 

