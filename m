Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C3BE6629745
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Nov 2022 12:21:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232852AbiKOLVN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Nov 2022 06:21:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232708AbiKOLVB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Nov 2022 06:21:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C207E328
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:20:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668511202;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6dcTdsvLy1TuIGfBjZqdH4n2CKx/QLw0klOIVTn8wu0=;
        b=TUtoNMV4H4hs4UZLpa10gfXYxYp56KnypszXE/O5NCmgfRqKvAiLeNDswSjU+JmzqQjQEu
        pJCW3h4eT3tc96QME60n3Le7ixREqAJCkpavRGdJtUuSSWrx8DNP5Y7dbg91QR1HgKlaNl
        LAU+EPyiIvD7md8iIKu6pKbOmydFCv8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-424-IiFOhLTUOyi57XGQKM39Xg-1; Tue, 15 Nov 2022 06:20:01 -0500
X-MC-Unique: IiFOhLTUOyi57XGQKM39Xg-1
Received: by mail-ej1-f70.google.com with SMTP id hq18-20020a1709073f1200b007ade8dd3494so7020186ejc.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Nov 2022 03:20:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6dcTdsvLy1TuIGfBjZqdH4n2CKx/QLw0klOIVTn8wu0=;
        b=HyRV7xGRItzgNR/vNP4hcW/sPpBJt/DVpv2yFOmAe/jWVJ5LUgHn4ExiXrdY9l3VZ7
         mzw2AOtN7cSIdosYBsesug7lAqVVZAID6tVSx5kqkKp2ucox4N3D7wqeLa2dxFySyCFr
         txAaqb2eJ4azgaYScqrb71sC86st1gveHZerdteC809sDZTuyUcgAMjQY2CMsBhaRxkf
         OpOxEDYm0bK/s+1PcysotEu9uHFLZlwgwojRBAYW0EZyaZpW96b4kIOAbzo1es94IHlu
         82sXhUekOmzPHZ0TkuBMt8J4hIO9Fy22VvbAgJnT05l8T+Gc1y7aIEQIED6EgZwuAZ3y
         i1XA==
X-Gm-Message-State: ANoB5pkd+0m4kDgQINWtb4cf2VAhKwrTLqx4Egn75ko9dcfE1026IUuu
        HTZ+Vddz5FTd62y1Djd5iKir0Gz9m1pz1sFK/pDd/CP4g5xLguKErhrGXvVmAN075N0/1J4x7DK
        KN75Np31xL02xu8ZFBz8odA0F15E1vPTl0w==
X-Received: by 2002:a17:906:c182:b0:781:f37a:f50e with SMTP id g2-20020a170906c18200b00781f37af50emr13414817ejz.468.1668511200088;
        Tue, 15 Nov 2022 03:20:00 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5BMCH1QsskyosSzbaFLWYZX2LzxO6qDGJS7QemQigd2aJasxFRJ4xqXvIDUOt9z393dOsq8w==
X-Received: by 2002:a17:906:c182:b0:781:f37a:f50e with SMTP id g2-20020a170906c18200b00781f37af50emr13414802ejz.468.1668511199701;
        Tue, 15 Nov 2022 03:19:59 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fd4-20020a1709072a0400b0078d3a075525sm5386491ejc.56.2022.11.15.03.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Nov 2022 03:19:59 -0800 (PST)
Message-ID: <e59fa079-1d72-2bb6-6ffc-dddc0095dd27@redhat.com>
Date:   Tue, 15 Nov 2022 12:19:58 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.1
Subject: Re: [PATCH v3] platform/x86: ideapad-laptop: support for more special
 keys in WMI
Content-Language: en-US, nl
To:     Armin Wolf <W_Armin@gmx.de>, Philipp Jungkamp <p.jungkamp@gmx.net>,
        Mark Gross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org
References: <6794a6cc-6049-66bf-cee8-a35105669fcb@gmx.de>
 <20221114144140.5054-1-p.jungkamp@gmx.net>
 <7e263715-e759-9293-ec53-27033a79a2bc@redhat.com>
 <5e4de9fa-e23a-417d-fef2-9fa225cbd008@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <5e4de9fa-e23a-417d-fef2-9fa225cbd008@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Armin,

On 11/15/22 03:27, Armin Wolf wrote:
> Am 14.11.22 um 17:41 schrieb Hans de Goede:
> 
>> Hi,
>>
>> On 11/14/22 15:41, Philipp Jungkamp wrote:
>>> The event data of the WMI event 0xD0, which is assumed to be the
>>> fn_lock, is used to indicate several special keys on newer Yoga 7/9
>>> laptops.
>>>
>>> The notify_id 0xD0 is non-unique in the DSDT of the Yoga 9 14IAP7, this
>>> causes wmi_get_event_data() to report wrong values.
>>> Port the ideapad-laptop WMI code to the wmi bus infrastructure which
>>> does not suffer from the shortcomings of wmi_get_event_data().
>>>
>>> Signed-off-by: Philipp Jungkamp <p.jungkamp@gmx.net>
>>> ---
>>> Hello,
>>>
>>> is this about right? It works for me.
>>>
>>> What I don't really like here is the dev_set_drvdata() which takes a non-const
>>> void * and I pass it a const pointer. I do cast the value of dev_get_drvdata()
>>> back to a const pointer, but this seems rather ugly.
>>> I preferred it over allocating a single int for the device or casting an enum
>>> to a void *. This additionally removes the need for a remove funtion.
>> I decided just take quick peek and I think the cleanest solution here would
>> be to add a driver-data struct with the lookup result of:
>>
>>     struct ideapad_private *priv = container_of(wdrv,
>>                             struct ideapad_private,
>>                             wmi_drv);
>>
>> Stored in there + the enum value and then alloc it with devm_kzalloc
>> to avoid the need for a remove callback.
>>
>> I'm also wondering if we could then maybe not move some other variables
>> only used in the wmi_notify callback to that driver-data struct ?
>> (I did not check if there are any candidates).
>>
>> Also this is going to need a big fat warning (comment) that the cute trick
>> with registering a wmi_driver struct embedded inside the platform_driver
>> data struct very much relies on there being only one platform_device
>> instance to which the platform_driver will bind ever, otherwise
>> we will get multiple wmi_driver's registered for the same WMI GUIDs
>> and then the container-off will likely return the driver-data of the
>> first platform device ...
> 
> Hello,
> 
> i think this is not going to be the case. For each platform device instance,
> a separate ideapad_private struct is allocated and initialized. This means
> that for each platform device instance, a separate WMI driver is registered,
> so each WMI driver will access the private data of its platform device when
> using container_of(), not just the private data of the first one.
> 
> AFAIK, WMI drivers cannot bind to an already bound WMI device, otherwise the
> WMI bus would need to create multiple devices for a single GUID instance, which
> is, as far as i know, not the case.

Right that is true, this will only be a problem if a WMI device with
a matching GUID shows up after the driver has been registered, which
could happen if the driver is builtin and thus probed during enumaration
which means the platform device(s) get enumerated before the WMI devices.

This is all quite unlikely, but the whole trick of embedding a driver
structure inside a device-data struct and then using container_of
on it just goes against the whole Linux driver model and gives me
what I can only describe as "an uncomfortable feeling".

I see that you've already posted a v4 using the global shared pointer
approach. This very much is not pretty (either), but at least it is easy
to reason about / easy to follow what is going on without having to
worry about various lifetimes, etc. Much appreciated!

I'll try to review v4 soonish but as mentioned before chances are
I will not get around to this until next week.

Regards,

Hans



>> Which makes me wonder if it would not be cleaner to just use a global
>> pointer for this ?   Note this is an honest open question.
>>
>> Actually since the platform_device gets instantiated by the ACPI
>> core there is no guarantee there will be only 1. So I think that
>> the container_of on the wmi-driver trick needs to go, instead
>> introduce:
>>
>> 1. A global ideapad_private_data_mutex mutex
>> 2. A global ideapad_private_data pointer
>>
>> And:
>>
>> 1. In ideapad_acpi_add:
>> lock the mutex
>> check that ideapad_private_data is not already set and if it is bail with an error
>> set ideapad_private_data
>> unlock the mutex
>>
>> 2. in ideapad_acpi_remove:
>> lock the mutex
>> clear the golbal pointer
>> unlock the mutex
>>
>> 3. In the wmi-driver's notify method:
>> lock the mutex
>> check ideapad_private_data is not NULL
>> process event
>> unlock the mutex
>>
>> 4. replace module_platform_driver with normal module init + exit
>> functions which register both drivers / unregister both drivers.
>>
>> I believe that this will be a more clean approach then the embedded
>> wmi_driver struct cuteness.
>>
>> Regards,
>>
>> Hans
>>
>>
>>
>>
>>> Regards,
>>> Philipp
>>>
>>>   drivers/platform/x86/ideapad-laptop.c | 109 +++++++++++++++++++-------
>>>   1 file changed, 80 insertions(+), 29 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/ideapad-laptop.c
>>> index 33b3dfdd1b08..6d35a9e961cf 100644
>>> --- a/drivers/platform/x86/ideapad-laptop.c
>>> +++ b/drivers/platform/x86/ideapad-laptop.c
>>> @@ -30,6 +30,7 @@
>>>   #include <linux/seq_file.h>
>>>   #include <linux/sysfs.h>
>>>   #include <linux/types.h>
>>> +#include <linux/wmi.h>
>>>
>>>   #include <acpi/video.h>
>>>
>>> @@ -38,10 +39,19 @@
>>>   #define IDEAPAD_RFKILL_DEV_NUM    3
>>>
>>>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>>> -static const char *const ideapad_wmi_fnesc_events[] = {
>>> -    "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", /* Yoga 3 */
>>> -    "56322276-8493-4CE8-A783-98C991274F5E", /* Yoga 700 */
>>> -    "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", /* Legion 5 */
>>> +enum ideapad_wmi_event_type {
>>> +    IDEAPAD_WMI_EVENT_ESC,
>>> +    IDEAPAD_WMI_EVENT_FN_KEYS,
>>> +};
>>> +
>>> +enum ideapad_wmi_event_type ideapad_wmi_esc = IDEAPAD_WMI_EVENT_ESC,
>>> +enum ideapad_wmi_event_type ideapad_wmi_fn_keys = IDEAPAD_WMI_EVENT_FN_KEYS;
>>> +
>>> +static const struct wmi_device_id ideapad_wmi_id_table[] = {
>>> +    { "26CAB2E5-5CF1-46AE-AAC3-4A12B6BA50E6", &ideapad_wmi_esc }, /* Yoga 3 */
>>> +    { "56322276-8493-4CE8-A783-98C991274F5E", &ideapad_wmi_esc }, /* Yoga 700 */
>>> +    { "8FC0DE0C-B4E4-43FD-B0F3-8871711C1294", &ideapad_wmi_fn_keys }, /* Legion 5 */
>>> +    {}
>>>   };
>>>   #endif
>>>
>>> @@ -130,7 +140,7 @@ struct ideapad_private {
>>>       struct ideapad_dytc_priv *dytc;
>>>       struct dentry *debug;
>>>       unsigned long cfg;
>>> -    const char *fnesc_guid;
>>> +    struct wmi_driver wmi_drv;
>>>       struct {
>>>           bool conservation_mode    : 1;
>>>           bool dytc                 : 1;
>>> @@ -1074,6 +1084,7 @@ static void ideapad_sysfs_exit(struct ideapad_private *priv)
>>>   /*
>>>    * input device
>>>    */
>>> +#define IDEAPAD_WMI_KEY 0x100
>>>   static const struct key_entry ideapad_keymap[] = {
>>>       { KE_KEY,   6, { KEY_SWITCHVIDEOMODE } },
>>>       { KE_KEY,   7, { KEY_CAMERA } },
>>> @@ -1087,6 +1098,26 @@ static const struct key_entry ideapad_keymap[] = {
>>>       { KE_KEY,  66, { KEY_TOUCHPAD_OFF } },
>>>       { KE_KEY,  67, { KEY_TOUCHPAD_ON } },
>>>       { KE_KEY, 128, { KEY_ESC } },
>>> +
>>> +    /*
>>> +     * WMI keys
>>> +     */
>>> +
>>> +    /* FnLock (handled by the firmware) */
>>> +    { KE_IGNORE,    0x02 | IDEAPAD_WMI_KEY },
>>> +    /* Customizable Lenovo Hotkey ("star" with 'S' inside) */
>>> +    { KE_KEY,    0x01 | IDEAPAD_WMI_KEY, { KEY_FAVORITES } },
>>> +    /* Dark mode toggle */
>>> +    { KE_KEY,    0x13 | IDEAPAD_WMI_KEY, { KEY_PROG1 } },
>>> +    /* Sound profile switch */
>>> +    { KE_KEY,    0x12 | IDEAPAD_WMI_KEY, { KEY_PROG2 } },
>>> +    /* Lenovo Virtual Background application */
>>> +    { KE_KEY,    0x28 | IDEAPAD_WMI_KEY, { KEY_PROG3 } },
>>> +    /* Lenovo Support */
>>> +    { KE_KEY,    0x27 | IDEAPAD_WMI_KEY, { KEY_HELP } },
>>> +    /* Refresh Rate Toggle */
>>> +    { KE_KEY,    0x0a | IDEAPAD_WMI_KEY, { KEY_DISPLAYTOGGLE } },
>>> +
>>>       { KE_END },
>>>   };
>>>
>>> @@ -1491,25 +1522,47 @@ static void ideapad_acpi_notify(acpi_handle handle, u32 event, void *data)
>>>   }
>>>
>>>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>>> -static void ideapad_wmi_notify(u32 value, void *context)
>>> +static int ideapad_wmi_probe(struct wmi_device *wdev, const void *context)
>>>   {
>>> -    struct ideapad_private *priv = context;
>>> +    dev_set_drvdata(&wdev->dev, (void *) context);
>>> +    return 0;
>>> +}
>>> +
>>> +static void ideapad_wmi_notify(struct wmi_device *wdev, union acpi_object *data)
>>> +{
>>> +    struct wmi_driver *wdrv = container_of(wdev->dev.driver,
>>> +                           struct wmi_driver,
>>> +                           driver);
>>> +    struct ideapad_private *priv = container_of(wdrv,
>>> +                            struct ideapad_private,
>>> +                            wmi_drv);
>>> +    const enum ideapad_wmi_event_type *event = dev_get_drvdata(&wdev->dev);
>>>       unsigned long result;
>>>
>>> -    switch (value) {
>>> -    case 128:
>>> -        ideapad_input_report(priv, value);
>>> +    switch (*event) {
>>> +    case IDEAPAD_WMI_EVENT_ESC:
>>> +        ideapad_input_report(priv, 128);
>>>           break;
>>> -    case 208:
>>> +    case IDEAPAD_WMI_EVENT_FN_KEYS:
>>>           if (!eval_hals(priv->adev->handle, &result)) {
>>>               bool state = test_bit(HALS_FNLOCK_STATE_BIT, &result);
>>>
>>>               exec_sals(priv->adev->handle, state ? SALS_FNLOCK_ON : SALS_FNLOCK_OFF);
>>>           }
>>> +
>>> +        if (data->type != ACPI_TYPE_INTEGER) {
>>> +            dev_warn(&wdev->dev,
>>> +                 "WMI event data is not an integer\n");
>>> +            break;
>>> +        }
>>> +
>>> +        dev_dbg(&wdev->dev, "WMI fn-key event: 0x%llx\n",
>>> +            data->integer.value);
>>> +
>>> +        ideapad_input_report(priv,
>>> +                     data->integer.value | IDEAPAD_WMI_KEY);
>>> +
>>>           break;
>>> -    default:
>>> -        dev_info(&priv->platform_device->dev,
>>> -             "Unknown WMI event: %u\n", value);
>>>       }
>>>   }
>>>   #endif
>>> @@ -1671,25 +1724,24 @@ static int ideapad_acpi_add(struct platform_device *pdev)
>>>       }
>>>
>>>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>>> -    for (i = 0; i < ARRAY_SIZE(ideapad_wmi_fnesc_events); i++) {
>>> -        status = wmi_install_notify_handler(ideapad_wmi_fnesc_events[i],
>>> -                            ideapad_wmi_notify, priv);
>>> -        if (ACPI_SUCCESS(status)) {
>>> -            priv->fnesc_guid = ideapad_wmi_fnesc_events[i];
>>> -            break;
>>> -        }
>>> -    }
>>> +    priv->wmi_drv = (struct wmi_driver) {
>>> +        .driver = {
>>> +            .name = "ideapad-wmi-fn-keys",
>>> +        },
>>> +        .id_table = ideapad_wmi_id_table,
>>> +        .probe = ideapad_wmi_probe,
>>> +        .notify = ideapad_wmi_notify,
>>> +    };
>>>
>>> -    if (ACPI_FAILURE(status) && status != AE_NOT_EXIST) {
>>> -        err = -EIO;
>>> -        goto notification_failed_wmi;
>>> -    }
>>> +    err = wmi_driver_register(&priv->wmi_drv);
>>> +    if (err)
>>> +        goto register_failed_wmi;
>>>   #endif
>>>
>>>       return 0;
>>>
>>>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>>> -notification_failed_wmi:
>>> +register_failed_wmi:
>>>       acpi_remove_notify_handler(priv->adev->handle,
>>>                      ACPI_DEVICE_NOTIFY,
>>>                      ideapad_acpi_notify);
>>> @@ -1720,8 +1772,7 @@ static int ideapad_acpi_remove(struct platform_device *pdev)
>>>       int i;
>>>
>>>   #if IS_ENABLED(CONFIG_ACPI_WMI)
>>> -    if (priv->fnesc_guid)
>>> -        wmi_remove_notify_handler(priv->fnesc_guid);
>>> +    wmi_driver_unregister(&priv->wmi_drv);
>>>   #endif
>>>
>>>       acpi_remove_notify_handler(priv->adev->handle,
>>> -- 
>>> 2.38.1
>>>
> 

