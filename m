Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B5F20599804
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Aug 2022 11:06:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1347880AbiHSIvN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Aug 2022 04:51:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37768 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347872AbiHSIvB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Aug 2022 04:51:01 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9FBB7DAA3E
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 01:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1660899059;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vaSY+tNBDRdmPJJk42Xq6cmC4UlTPsxy/Q1PYsGVS90=;
        b=iflmHEb5wm75wibSiHSLXwa4k7QnrOPMaulB/URELfFoeK5LeO1MpgkdUfGs1iXFZ6Br3m
        vKIb8lw2u+LsbTviQ5m0akMS2E6YLe81B0u5sizbfeLcpD9bWKMvZvFwojaf/3z0B2ME+L
        wASw2nohJTE6CBDNPrXzbvxX3GJ6zbk=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-586-cEpS_0a2MvK-J0Xq_sh8Fw-1; Fri, 19 Aug 2022 04:50:56 -0400
X-MC-Unique: cEpS_0a2MvK-J0Xq_sh8Fw-1
Received: by mail-ed1-f71.google.com with SMTP id t13-20020a056402524d00b0043db1fbefdeso2473857edd.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Aug 2022 01:50:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=vaSY+tNBDRdmPJJk42Xq6cmC4UlTPsxy/Q1PYsGVS90=;
        b=ZdoGbHCF7M8Xv/0ekA4z48W5qVLF9+1wlBXDO+W9ugtdLTzie3olObl2k/JlEe6jL2
         BwGOD/BPtPDFSxRqXwNARPq8wYELchx3n1IFIO2bZgnLI2VIQoc/7i7mWqArMWQFxI9H
         1R2m8VnKirVu1X6MWWGFQetLkloIOn3YN3UlLwcXI0tyNkn47sycO6qNRTabyWDOWTM5
         o+mR4NaVMty20ZAZFfBucsqNYZhUxvNyIOT6fLN++f6dlD0ThpHbx/lD/FZ5m96UVYgH
         BZJ4eyvOj47kYvJOtGaHNo0Q9jNMa0wR+P4s7zMf80qBu7JH9X2RDS8Ef0hM9p2RIBo0
         kl5Q==
X-Gm-Message-State: ACgBeo1f/Tg6ZZgSaoTGsbjRACMnCta3RgJp0ulYX9UXA7FOVqPjYiN5
        D86P2pKZ1NkVLiDrPSqFUn4IAyhSuISbNDVbbL2I6o/qGM7KFK0BxWvKXBsp3rug1tMBOo3GwCL
        flE4SOTPBn9lyee5/pcImp4wVJW5s6rt92Q==
X-Received: by 2002:a17:907:2be3:b0:730:6866:a9b1 with SMTP id gv35-20020a1709072be300b007306866a9b1mr4225861ejc.693.1660899055082;
        Fri, 19 Aug 2022 01:50:55 -0700 (PDT)
X-Google-Smtp-Source: AA6agR48FC9IVvstbH2Etz1W95N0KTZoVu5XhQIlRV5gYjBWBm/vAQoJQiOB2bHkSUcrgd8AyFQnxQ==
X-Received: by 2002:a17:907:2be3:b0:730:6866:a9b1 with SMTP id gv35-20020a1709072be300b007306866a9b1mr4225833ejc.693.1660899054740;
        Fri, 19 Aug 2022 01:50:54 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id s18-20020a1709062ed200b00722e50dab2csm1999671eji.109.2022.08.19.01.50.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Aug 2022 01:50:53 -0700 (PDT)
Message-ID: <72f20ebb-f3bc-9b5a-438a-4d7bcd696097@redhat.com>
Date:   Fri, 19 Aug 2022 10:50:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v3 09/31] ACPI: video: Make backlight class device
 registration a separate step (v2)
Content-Language: en-US
To:     Daniel Dadap <ddadap@nvidia.com>, Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        Xinhui <Xinhui.Pan@amd.com>,
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
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
 <20220818184302.10051-10-hdegoede@redhat.com>
 <b177636d-bc68-cd25-4a28-8131ef4625fe@nvidia.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <b177636d-bc68-cd25-4a28-8131ef4625fe@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/18/22 22:07, Daniel Dadap wrote:
> 
> On 8/18/22 1:42 PM, Hans de Goede wrote:
>> On x86/ACPI boards the acpi_video driver will usually initialize before
>> the kms driver (except i915). This causes /sys/class/backlight/acpi_video0
>> to show up and then the kms driver registers its own native backlight
>> device after which the drivers/acpi/video_detect.c code unregisters
>> the acpi_video0 device (when acpi_video_get_backlight_type()==native).
>>
>> This means that userspace briefly sees 2 devices and the disappearing of
>> acpi_video0 after a brief time confuses the systemd backlight level
>> save/restore code, see e.g.:
>> https://bbs.archlinux.org/viewtopic.php?id=269920
>>
>> To fix this make backlight class device registration a separate step
>> done by a new acpi_video_register_backlight() function. The intend is for
>> this to be called by the drm/kms driver *after* it is done setting up its
>> own native backlight device. So that acpi_video_get_backlight_type() knows
>> if a native backlight will be available or not at acpi_video backlight
>> registration time, avoiding the add + remove dance.
>>
>> Note the new acpi_video_register_backlight() function is also called from
>> a delayed work to ensure that the acpi_video backlight devices does get
>> registered if necessary even if there is no drm/kms driver or when it is
>> disabled.
>>
>> Changes in v2:
>> - Make register_backlight_delay a module parameter, mainly so that it can
>>    be disabled by Nvidia binary driver users
>>
>> Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/acpi/acpi_video.c | 50 ++++++++++++++++++++++++++++++++++++---
>>   include/acpi/video.h      |  2 ++
>>   2 files changed, 49 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/acpi_video.c b/drivers/acpi/acpi_video.c
>> index 8545bf94866f..09dd86f86cf3 100644
>> --- a/drivers/acpi/acpi_video.c
>> +++ b/drivers/acpi/acpi_video.c
>> @@ -73,6 +73,16 @@ module_param(device_id_scheme, bool, 0444);
>>   static int only_lcd = -1;
>>   module_param(only_lcd, int, 0444);
>>   +/*
>> + * Display probing is known to take up to 5 seconds, so delay the fallback
>> + * backlight registration by 5 seconds + 3 seconds for some extra margin.
>> + */
>> +static int register_backlight_delay = 8;
>> +module_param(register_backlight_delay, int, 0444);
> 
> 
> Would it make sense to make this parameter writable from userspace, e.g. so that it can be set by a udev rule rather than relying on a riskier kernel command line edit? Then again, that probably makes things more complicated, since you'd have to check the parameter again when the worker fires, and changing the parameter to a non-zero value from either zero or a different non-zero value would be too weird. And making a separate writable parameter to allow userspace to turn the worker into a noop despite it being enabled when the kernel was initially loaded seems wrong, too.

Right, you have pretty much described yourself why making this parameter
runtime configurable is not really feasible :)

Regards,

Hans



> 
> 
>> +MODULE_PARM_DESC(register_backlight_delay,
>> +    "Delay in seconds before doing fallback (non GPU driver triggered) "
>> +    "backlight registration, set to 0 to disable.");
>> +
>>   static bool may_report_brightness_keys;
>>   static int register_count;
>>   static DEFINE_MUTEX(register_count_mutex);
>> @@ -81,6 +91,9 @@ static LIST_HEAD(video_bus_head);
>>   static int acpi_video_bus_add(struct acpi_device *device);
>>   static int acpi_video_bus_remove(struct acpi_device *device);
>>   static void acpi_video_bus_notify(struct acpi_device *device, u32 event);
>> +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored);
>> +static DECLARE_DELAYED_WORK(video_bus_register_backlight_work,
>> +                acpi_video_bus_register_backlight_work);
>>   void acpi_video_detect_exit(void);
>>     /*
>> @@ -1859,8 +1872,6 @@ static int acpi_video_bus_register_backlight(struct acpi_video_bus *video)
>>       if (video->backlight_registered)
>>           return 0;
>>   -    acpi_video_run_bcl_for_osi(video);
>> -
>>       if (acpi_video_get_backlight_type() != acpi_backlight_video)
>>           return 0;
>>   @@ -2086,7 +2097,11 @@ static int acpi_video_bus_add(struct acpi_device *device)
>>       list_add_tail(&video->entry, &video_bus_head);
>>       mutex_unlock(&video_list_lock);
>>   -    acpi_video_bus_register_backlight(video);
>> +    /*
>> +     * The userspace visible backlight_device gets registered separately
>> +     * from acpi_video_register_backlight().
>> +     */
>> +    acpi_video_run_bcl_for_osi(video);
>>       acpi_video_bus_add_notify_handler(video);
>>         return 0;
>> @@ -2125,6 +2140,11 @@ static int acpi_video_bus_remove(struct acpi_device *device)
>>       return 0;
>>   }
>>   +static void acpi_video_bus_register_backlight_work(struct work_struct *ignored)
>> +{
>> +    acpi_video_register_backlight();
>> +}
>> +
>>   static int __init is_i740(struct pci_dev *dev)
>>   {
>>       if (dev->device == 0x00D1)
>> @@ -2235,6 +2255,18 @@ int acpi_video_register(void)
>>        */
>>       register_count = 1;
>>   +    /*
>> +     * acpi_video_bus_add() skips registering the userspace visible
>> +     * backlight_device. The intend is for this to be registered by the
>> +     * drm/kms driver calling acpi_video_register_backlight() *after* it is
>> +     * done setting up its own native backlight device. The delayed work
>> +     * ensures that acpi_video_register_backlight() always gets called
>> +     * eventually, in case there is no drm/kms driver or it is disabled.
>> +     */
>> +    if (register_backlight_delay)
>> +        schedule_delayed_work(&video_bus_register_backlight_work,
>> +                      register_backlight_delay * HZ);
>> +
>>   leave:
>>       mutex_unlock(&register_count_mutex);
>>       return ret;
>> @@ -2245,6 +2277,7 @@ void acpi_video_unregister(void)
>>   {
>>       mutex_lock(&register_count_mutex);
>>       if (register_count) {
>> +        cancel_delayed_work_sync(&video_bus_register_backlight_work);
>>           acpi_bus_unregister_driver(&acpi_video_bus);
>>           register_count = 0;
>>           may_report_brightness_keys = false;
>> @@ -2253,6 +2286,17 @@ void acpi_video_unregister(void)
>>   }
>>   EXPORT_SYMBOL(acpi_video_unregister);
>>   +void acpi_video_register_backlight(void)
>> +{
>> +    struct acpi_video_bus *video;
>> +
>> +    mutex_lock(&video_list_lock);
>> +    list_for_each_entry(video, &video_bus_head, entry)
>> +        acpi_video_bus_register_backlight(video);
>> +    mutex_unlock(&video_list_lock);
>> +}
>> +EXPORT_SYMBOL(acpi_video_register_backlight);
>> +
>>   void acpi_video_unregister_backlight(void)
>>   {
>>       struct acpi_video_bus *video;
>> diff --git a/include/acpi/video.h b/include/acpi/video.h
>> index 4705e339c252..0625806d3bbd 100644
>> --- a/include/acpi/video.h
>> +++ b/include/acpi/video.h
>> @@ -53,6 +53,7 @@ enum acpi_backlight_type {
>>   #if IS_ENABLED(CONFIG_ACPI_VIDEO)
>>   extern int acpi_video_register(void);
>>   extern void acpi_video_unregister(void);
>> +extern void acpi_video_register_backlight(void);
>>   extern int acpi_video_get_edid(struct acpi_device *device, int type,
>>                      int device_id, void **edid);
>>   extern enum acpi_backlight_type acpi_video_get_backlight_type(void);
>> @@ -69,6 +70,7 @@ extern int acpi_video_get_levels(struct acpi_device *device,
>>   #else
>>   static inline int acpi_video_register(void) { return -ENODEV; }
>>   static inline void acpi_video_unregister(void) { return; }
>> +static inline void acpi_video_register_backlight(void) { return; }
>>   static inline int acpi_video_get_edid(struct acpi_device *device, int type,
>>                         int device_id, void **edid)
>>   {
> 

