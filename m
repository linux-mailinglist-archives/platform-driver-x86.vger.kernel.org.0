Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 65DC7750B3E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jul 2023 16:44:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233008AbjGLOoj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jul 2023 10:44:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41348 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231816AbjGLOoh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jul 2023 10:44:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F241991
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:43:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689173034;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C34WsFlKYjYWkTFb9HgsWdoRE76RVrfdGiTYT+vpVqI=;
        b=Ipm2wPWzc4VwzA+Kn+zGjIOG2FUCUiWnzgSr7dnxGKnMKCZSLuEltedlG3dyrxry7fHcb2
        ZRS9WgsMBQWzsZ54alUkFObN7e9dedV/zaTP/JUZ5sA44KAy4T3D1KybTcVZmq3tRu4WOp
        YUkVNqYjWtJtCG3OGnK2icKif2P1SXk=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-527-96NcsXtiMTOGkVPLA_epWA-1; Wed, 12 Jul 2023 10:43:53 -0400
X-MC-Unique: 96NcsXtiMTOGkVPLA_epWA-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so1131144a12.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 12 Jul 2023 07:43:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689173032; x=1691765032;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=C34WsFlKYjYWkTFb9HgsWdoRE76RVrfdGiTYT+vpVqI=;
        b=QETJOT6ME/pevO1gp4lCvwu1VfgimsGLWeP8Ie3+1a2LUGw/HqH0jnVbTW9CDKUsYm
         +DXrflgo5y0Bwg3CC5WVk48GylD6JHCVChkOwOQgwUpEnuFXYuTPAhOhAIlNaUBNTkff
         SUms6wNBA0sPpGCwJYZEzW5m0a//1zY9W57dm1d58foikLkXSaAuvzXzcaH0dAUXZdDE
         VL8RdW/actByw61OSHo79mVPHTVJW/+xojx3H7pVAHnV8FgY7AXJYWf9M3NJ1G60zOre
         cQZU0t4GxnBWhjxanGTCNpBnSgBWgUzyttaxGeXuRk4/S7cldb83jsWAvcEswhbNyNic
         Gjyg==
X-Gm-Message-State: ABy/qLaOlUqYTZRIQNi2LMIjunSNqw8Tgj6XEs57yMVSNhWhN6KuAhry
        ffJjQ3SFIfIYaorlZleDBrDSOVXOVDcgwwIvv6kpKFewNZWVfhT9ALLgKxvUbnThjY8WnHC1bMJ
        Pb2o3/G1GwfK7x248IOR7V39xwj+BpPGEiQ==
X-Received: by 2002:a05:6402:5245:b0:51f:c6a1:4355 with SMTP id t5-20020a056402524500b0051fc6a14355mr3025301edd.4.1689173032284;
        Wed, 12 Jul 2023 07:43:52 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEa35eKJ9IGbLw5gzEbWDSaeBN07RQx+T2XC+mOrnyClSMdlCkLN6eYHK5OBBuZ4tkrEJMU7Q==
X-Received: by 2002:a05:6402:5245:b0:51f:c6a1:4355 with SMTP id t5-20020a056402524500b0051fc6a14355mr3025281edd.4.1689173032056;
        Wed, 12 Jul 2023 07:43:52 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u7-20020aa7d0c7000000b0051a2d2f82fdsm2877251edo.6.2023.07.12.07.43.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Jul 2023 07:43:51 -0700 (PDT)
Message-ID: <0f50cb97-0507-bcbb-03c6-e3394690ae80@redhat.com>
Date:   Wed, 12 Jul 2023 16:43:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 5/8] platform/x86: asus-wmi: don't allow eGPU switching
 if eGPU not connected
Content-Language: en-US, nl
To:     "Luke D. Jones" <luke@ljones.dev>
Cc:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-hwmon@vger.kernel.org, markgross@kernel.org,
        jdelvare@suse.com, linux@roeck-us.net
References: <20230630053552.976579-1-luke@ljones.dev>
 <20230630053552.976579-6-luke@ljones.dev>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230630053552.976579-6-luke@ljones.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 6/30/23 07:35, Luke D. Jones wrote:
> Check the ASUS_WMI_DEVID_EGPU_CONNECTED method for eGPU connection
> before allowing the ASUS_WMI_DEVID_EGPU method to run.
> 
> Signed-off-by: Luke D. Jones <luke@ljones.dev>

Thanks, patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans

> ---
>  drivers/platform/x86/asus-wmi.c | 9 +++++++++
>  1 file changed, 9 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
> index 0c8a4a46b121..821addb284d7 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -693,6 +693,15 @@ static ssize_t egpu_enable_store(struct device *dev,
>  	if (enable > 1)
>  		return -EINVAL;
>  
> +	err = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_EGPU_CONNECTED);
> +	if (err < 0)
> +		return err;
> +	if (err < 1) {
> +		err = -ENODEV;
> +		pr_warn("Failed to set egpu disable: %d\n", err);
> +		return err;
> +	}
> +
>  	err = asus_wmi_set_devstate(ASUS_WMI_DEVID_EGPU, enable, &result);
>  	if (err) {
>  		pr_warn("Failed to set egpu disable: %d\n", err);

