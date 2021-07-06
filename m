Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id F36823BC8F4
	for <lists+platform-driver-x86@lfdr.de>; Tue,  6 Jul 2021 12:02:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231308AbhGFKFG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 6 Jul 2021 06:05:06 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:49593 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231305AbhGFKFF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Jul 2021 06:05:05 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1625565747;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Tq61dl4sHZQdPt6JWd2DPv4vKrUwOjbgB5fyu5NdOC0=;
        b=WkIQZyeAFAfU04IHwUN+rwIUkn0Kv6c1J9EX7gpRdZEAErA3ZupVHQGo6xMh5Ax94p0qIN
        yXd8Z122W9tLtZ4HDxWnT9j1YSBIcG6cniDdIyI3w2R1asRlgcBu0V/629zTlSYExqJX5p
        6h5gNY3oHzhfgiwVaHsEPk2TcONytaQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-VwYqY2agOb6WEXyektWIpQ-1; Tue, 06 Jul 2021 06:02:25 -0400
X-MC-Unique: VwYqY2agOb6WEXyektWIpQ-1
Received: by mail-ed1-f70.google.com with SMTP id p23-20020aa7cc970000b02903948bc39fd5so10519093edt.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 06 Jul 2021 03:02:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Tq61dl4sHZQdPt6JWd2DPv4vKrUwOjbgB5fyu5NdOC0=;
        b=Cce0JAx1ICmuv/9QaEYaTozMZzmkJ3/vOnLYbuEEvwepseDzkEIPq5y8kxKXeWAKah
         V++R+czBDNebDoV/GcrmPKzlM8eoT7OUUY4NdDgFR4suxv3QO/qVSwGenVYhzQm7r+pE
         vnY85SvvTDe+PFzEjldMv4zf2EOw96uz6OlSFEmVW9CddCAVOVuMKNNLAwJ+Jj/urTcI
         5UEgyh5eQ9a9QW4sholskyUcnadJHzeJ2RGpxJ5owGF0K0eTUwVVgeMZAEOwIQ8PNxuB
         /zdNkIDJ22KIwX2bUxe8EhWFwVsB5drH5T9TpmlqhpRF6YnlwpG5c48Jvycd5We3CeYw
         Eyzg==
X-Gm-Message-State: AOAM533kNzrmQ9V9VA/Ll+MqXhIsxw08SPzNpDLrCkursPswcTaZUsDQ
        mVJcC3YIo8FhGlebkkdHP3g6IPeJuWc9qHYUUvkOO0n5YMErhk17w6KjZ384kPighcbEe9hCwfI
        getVPwyj8huf+rQhv1f8dXCZ65OwWVHzA6Q==
X-Received: by 2002:a17:906:7b4f:: with SMTP id n15mr17252023ejo.42.1625565744754;
        Tue, 06 Jul 2021 03:02:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGgDbQBE51ASdMGHyl+NSjzfap/A6giscpryQpM01bi+RfHSmTRLEtjXpn3l+60dc1oi0Ydg==
X-Received: by 2002:a17:906:7b4f:: with SMTP id n15mr17252006ejo.42.1625565744612;
        Tue, 06 Jul 2021 03:02:24 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id j10sm1610737ejv.58.2021.07.06.03.02.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Jul 2021 03:02:24 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: think-lmi: Add pending_reboot support
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     mgross@linux.intel.com, platform-driver-x86@vger.kernel.org,
        mario.limonciello@amd.com
References: <markpearson@lenovo.com>
 <20210628222846.8830-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <5094c4a5-612e-6066-494c-2a587993a7d2@redhat.com>
Date:   Tue, 6 Jul 2021 12:02:23 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210628222846.8830-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/29/21 12:28 AM, Mark Pearson wrote:
> The Think-lmi driver was missing pending_reboot support as it wasn't
> available from the BIOS. Turns out this is really useful to have from
> user space so implementing from a purely SW point of view.
> 
> Thanks to Mario Limonciello for guidance on how fwupd would use this.
> 
> Suggested-by: Mario Limonciello <mario.limonciello@amd.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Changes in v2: 
>   - added in Mario's Suggested-by tag (and will use correct email when
>     submitting patch)

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

I'll merge this once v5.14-rc1 is out and I'll also include this in my
next pdx86-fixes for 5.14 pull-req to Linus.

Regards,

Hans




> 
>  drivers/platform/x86/think-lmi.c | 19 +++++++++++++++++++
>  drivers/platform/x86/think-lmi.h |  1 +
>  2 files changed, 20 insertions(+)
> 
> diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think-lmi.c
> index b57061079..bcc3d6fcd 100644
> --- a/drivers/platform/x86/think-lmi.c
> +++ b/drivers/platform/x86/think-lmi.c
> @@ -566,6 +566,11 @@ static ssize_t current_value_store(struct kobject *kobj,
>  	else
>  		ret = tlmi_save_bios_settings("");
>  
> +	if (!ret && !tlmi_priv.pending_changes) {
> +		tlmi_priv.pending_changes = true;
> +		/* let userland know it may need to check reboot pending again */
> +		kobject_uevent(&tlmi_priv.class_dev->kobj, KOBJ_CHANGE);
> +	}
>  out:
>  	kfree(auth_str);
>  	kfree(set_str);
> @@ -641,6 +646,14 @@ static struct kobj_type tlmi_pwd_setting_ktype = {
>  	.sysfs_ops	= &tlmi_kobj_sysfs_ops,
>  };
>  
> +static ssize_t pending_reboot_show(struct kobject *kobj, struct kobj_attribute *attr,
> +				   char *buf)
> +{
> +	return sprintf(buf, "%d\n", tlmi_priv.pending_changes);
> +}
> +
> +static struct kobj_attribute pending_reboot = __ATTR_RO(pending_reboot);
> +
>  /* ---- Initialisation --------------------------------------------------------- */
>  static void tlmi_release_attr(void)
>  {
> @@ -662,6 +675,7 @@ static void tlmi_release_attr(void)
>  	sysfs_remove_group(&tlmi_priv.pwd_power->kobj, &auth_attr_group);
>  	kobject_put(&tlmi_priv.pwd_power->kobj);
>  	kset_unregister(tlmi_priv.authentication_kset);
> +	sysfs_remove_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
>  }
>  
>  static int tlmi_sysfs_init(void)
> @@ -730,6 +744,11 @@ static int tlmi_sysfs_init(void)
>  	if (ret)
>  		goto fail_create_attr;
>  
> +	/* Create global sysfs files */
> +	ret = sysfs_create_file(&tlmi_priv.class_dev->kobj, &pending_reboot.attr);
> +	if (ret)
> +		goto fail_create_attr;
> +
>  	return ret;
>  
>  fail_create_attr:
> diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think-lmi.h
> index 6fa8da7af..eb5988466 100644
> --- a/drivers/platform/x86/think-lmi.h
> +++ b/drivers/platform/x86/think-lmi.h
> @@ -60,6 +60,7 @@ struct think_lmi {
>  	bool can_get_bios_selections;
>  	bool can_set_bios_password;
>  	bool can_get_password_settings;
> +	bool pending_changes;
>  
>  	struct tlmi_attr_setting *setting[TLMI_SETTINGS_COUNT];
>  	struct device *class_dev;
> 

