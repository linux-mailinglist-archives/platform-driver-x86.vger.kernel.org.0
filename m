Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0FD6159FA66
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Aug 2022 14:49:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236609AbiHXMtx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Aug 2022 08:49:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48960 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232564AbiHXMtw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Aug 2022 08:49:52 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29F062F003
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 05:49:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661345390;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=wC5Z2C/PK6NcUw1f++1+B+zqmXR0UZybCJvVZVgpOUU=;
        b=M4QU1nmc4Vsg74/I4DJa2X18ox0g+0nkttPaUyfQ5s6RNOqTexR1yTM9DoPBH15eeIpRDk
        L3Q4N0iRUYwqPrYZgJFFxWVRwDmNc7J54jxy33ihn3nR7dtDvq2XoHYOHGXIk2E56iwj9n
        zGK5cQB0as95b0eMhjCGewRazkhCKlA=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-327-zrpeUuxAPJ-2NLF0NXzOGA-1; Wed, 24 Aug 2022 08:49:49 -0400
X-MC-Unique: zrpeUuxAPJ-2NLF0NXzOGA-1
Received: by mail-ed1-f72.google.com with SMTP id w14-20020a05640234ce00b00446bb1d7cc3so5901269edc.20
        for <platform-driver-x86@vger.kernel.org>; Wed, 24 Aug 2022 05:49:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=wC5Z2C/PK6NcUw1f++1+B+zqmXR0UZybCJvVZVgpOUU=;
        b=XN8YTsg8Ct+u+l+nrTmEr+8aEpTYoAzB2gVoI7lX9f+kruFTBsxMM0JcJiJS8Irhaw
         OXZzJbCxt6ZHdb5wmwlvU5nBRNYScDXOzuzEjXCr2LsxoZWBaYgGPLxdIpIvrUR2tSl7
         lXerWpbD08maXyLCs01qHmF6lVitiw804g7N0fXMAMmxftdr0Xmv/IlQY1/ni2i36MZD
         U1URuL7eyIzuCWLjxT/Zo+N0HMLfDy5N84CgrU61gEsLCwKDCgEU5LRiQ2zLC/hIKqHU
         KvbW5b/m6Sm9su3c7HX1f2j/U676HecqMMPZUhX1C6inF8kV4TjXeYz4j5Iws4oPdUpG
         tWRg==
X-Gm-Message-State: ACgBeo0bPbAqsMvL5bH9OLE+MT1HNTkwPNIIDql8titkgwX2J8PZQc3V
        R0EqqAjIlT3rV0OQ1tPwBiaIqItUnO2z7FUIbxZuAO2oSB14umeEPSq+ND5oGAd8Lar4FkapGIa
        CdJd18/cut4FjApteCYZ5yS3Z+ZkfcNFHJQ==
X-Received: by 2002:a17:907:8317:b0:731:2189:7f4d with SMTP id mq23-20020a170907831700b0073121897f4dmr2797108ejc.468.1661345388239;
        Wed, 24 Aug 2022 05:49:48 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7LUjqu0rvL8O6CJd+R/NNz3ck80tOf12k72l8wmeciZQsEIJBktllD4PXgxW3LjrTA+ksdIw==
X-Received: by 2002:a17:907:8317:b0:731:2189:7f4d with SMTP id mq23-20020a170907831700b0073121897f4dmr2797084ejc.468.1661345388005;
        Wed, 24 Aug 2022 05:49:48 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id 2-20020a170906328200b0073c9d68ca0dsm1107366ejw.133.2022.08.24.05.49.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Aug 2022 05:49:47 -0700 (PDT)
Message-ID: <7660855c-6307-a321-5250-cc8a51075bda@redhat.com>
Date:   Wed, 24 Aug 2022 14:49:46 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 11/31] drm/i915: Call acpi_video_register_backlight()
 (v2)
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Lukas Wunner <lukas@wunner.de>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220824121523.1291269-1-hdegoede@redhat.com>
 <20220824121523.1291269-12-hdegoede@redhat.com> <87y1vdizau.fsf@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <87y1vdizau.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE,
        URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/22 14:47, Jani Nikula wrote:
> On Wed, 24 Aug 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> On machins without an i915 opregion the acpi_video driver immediately
>> probes the ACPI video bus and used to also immediately register
>> acpi_video# backlight devices when supported.
>>
>> Once the drm/kms driver then loaded later and possibly registered
>> a native backlight device then the drivers/acpi/video_detect.c code
>> unregistered the acpi_video0 device to avoid there being 2 backlight
>> devices (when acpi_video_get_backlight_type()==native).
>>
>> This means that userspace used to briefly see 2 devices and the
>> disappearing of acpi_video0 after a brief time confuses the systemd
>> backlight level save/restore code, see e.g.:
>> https://bbs.archlinux.org/viewtopic.php?id=269920
>>
>> To fix this the ACPI video code has been modified to make backlight class
>> device registration a separate step, relying on the drm/kms driver to
>> ask for the acpi_video backlight registration after it is done setting up
>> its native backlight device.
>>
>> Add a call to the new acpi_video_register_backlight() after the i915 calls
>> acpi_video_register() (after setting up the i915 opregion) so that the
>> acpi_video backlight devices get registered on systems where the i915
>> native backlight device is not registered.
>>
>> Changes in v2:
>> -Only call acpi_video_register_backlight() when a panel is detected
>>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>  drivers/gpu/drm/i915/display/intel_display.c | 8 ++++++++
>>  drivers/gpu/drm/i915/display/intel_panel.c   | 3 +++
>>  drivers/gpu/drm/i915/i915_drv.h              | 2 ++
>>  3 files changed, 13 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>> index 6103b02c081f..2bb53efdb149 100644
>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>> @@ -9088,6 +9088,14 @@ void intel_display_driver_register(struct drm_i915_private *i915)
>>  	/* Must be done after probing outputs */
>>  	intel_opregion_register(i915);
>>  	acpi_video_register();
>> +	/*
>> +	 * Only call this if i915 is driving the internal panel. If the internal
>> +	 * panel is not driven by i915 then another GPU driver may still register
>> +	 * a native backlight driver later and this should only be called after
>> +	 * any native backlights have been registered.
>> +	 */
>> +	if (i915->have_panel)
>> +		acpi_video_register_backlight();
> 
> Apologies for procrastinating the review.
> 
> Please let's not add new flags like have_panel to i915; we're trying to
> clean it up instead.
> 
> The code here needs to iterate over the connectors to decide. Maybe
> better abstracted a function.

So something like add a i915_have_panel() helper which iterates over all
the connectors and then of 1 of them is of the LVDS / eDP / DSI type
return true ?

Regards,

Hans



>>  	intel_audio_init(i915);
>>  
>> diff --git a/drivers/gpu/drm/i915/display/intel_panel.c b/drivers/gpu/drm/i915/display/intel_panel.c
>> index 237a40623dd7..4536c527f50c 100644
>> --- a/drivers/gpu/drm/i915/display/intel_panel.c
>> +++ b/drivers/gpu/drm/i915/display/intel_panel.c
>> @@ -646,8 +646,11 @@ intel_panel_mode_valid(struct intel_connector *connector,
>>  
>>  int intel_panel_init(struct intel_connector *connector)
>>  {
>> +	struct drm_i915_private *dev_priv = to_i915(connector->base.dev);
>>  	struct intel_panel *panel = &connector->panel;
>>  
>> +	dev_priv->have_panel = true;
>> +
>>  	intel_backlight_init_funcs(panel);
>>  
>>  	drm_dbg_kms(connector->base.dev,
>> diff --git a/drivers/gpu/drm/i915/i915_drv.h b/drivers/gpu/drm/i915/i915_drv.h
>> index 69ce6db6a7c1..14b0dcaf25c2 100644
>> --- a/drivers/gpu/drm/i915/i915_drv.h
>> +++ b/drivers/gpu/drm/i915/i915_drv.h
>> @@ -756,6 +756,8 @@ struct drm_i915_private {
>>  
>>  	bool ipc_enabled;
>>  
>> +	bool have_panel;
>> +
>>  	struct intel_audio_private audio;
>>  
>>  	struct i915_pmu pmu;
> 

