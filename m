Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id DB72B5AA9F5
	for <lists+platform-driver-x86@lfdr.de>; Fri,  2 Sep 2022 10:29:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235137AbiIBI31 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 2 Sep 2022 04:29:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbiIBI30 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Sep 2022 04:29:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80E23B72BA
        for <platform-driver-x86@vger.kernel.org>; Fri,  2 Sep 2022 01:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662107364;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4TLo39eROIivl+usHDFfUNSoJf8Z2ud7DhOrgCFPZX8=;
        b=RFz2zG0tV14bsC3/10e8fLMedDQSbzlG5IyiI0rpTZvsWsghbhh5K//fLoaFLHqaO2nFTr
        0WwugBYPR6+FkQVZkZTAMMGMDLSGTBitSZVPBWNAC/xPjuK6K35r8rOeVzK2pSNbCA7bbS
        PwYNJ+kdJoCghLNL7T0TIx1iYhsQbJE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-650-cWmU4f6KOU6ujsmfvOwr0w-1; Fri, 02 Sep 2022 04:29:23 -0400
X-MC-Unique: cWmU4f6KOU6ujsmfvOwr0w-1
Received: by mail-ed1-f69.google.com with SMTP id r11-20020a05640251cb00b004484ec7e3a4so940530edd.8
        for <platform-driver-x86@vger.kernel.org>; Fri, 02 Sep 2022 01:29:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=4TLo39eROIivl+usHDFfUNSoJf8Z2ud7DhOrgCFPZX8=;
        b=J++e0AKEqKfQScioWBuUos3dYqDIHWBkoSEm+1NT4kjN929IIW4MUfUY9odupU4KcQ
         UWccdycxE/4QyMXzo47uHo1XB8j/zlND8+zQqGIIVKkAobXLV7eaaUGagC9jpXeg+NwB
         gonF3JZ/0tbGI4PlXdTk2W5bcfAHDxKZaW3OdB7q7PD+Jnm/iYwdCFzq5RPMTMEZOGmC
         3mK7TezIEhBplxUlBqX0bMXydOBovbE3ko+8v2c6xal1xo27frXWV+4/hyBnlWINE+0d
         7mgECeYYhfWlkSeahHERYkUcKlu5W20X6/9KpBzo++WGvpQLVH/mIICQSpZq5wZS/HT7
         07MQ==
X-Gm-Message-State: ACgBeo0OiOcKT//wt/l6II0YNLn60nCNc0JLZzqTUsOm+mwa9jg50m4E
        JPI/9L2+zj6T9ORe1Kw89M/JtwFszcAcg7WhyyZCYH3IjFbZbi3rdkfhLdDc/GvXpqFQ4qDLSXn
        wL2JJchYP9hoIZvuc4RYgqZ1fmWKiIzxEQw==
X-Received: by 2002:a17:907:160d:b0:741:a253:422f with SMTP id hb13-20020a170907160d00b00741a253422fmr13864109ejc.640.1662107362118;
        Fri, 02 Sep 2022 01:29:22 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7hppGKadO19UzqzKHTHxlU72qiQ30uslYTbMgrYqPw/qvcsv8dl9WlQwUUQkQPTDP3fq0iHw==
X-Received: by 2002:a17:907:160d:b0:741:a253:422f with SMTP id hb13-20020a170907160d00b00741a253422fmr13864097ejc.640.1662107361843;
        Fri, 02 Sep 2022 01:29:21 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id y13-20020a50eb0d000000b00443d657d8a4sm930862edp.61.2022.09.02.01.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Sep 2022 01:29:21 -0700 (PDT)
Message-ID: <891c2cd5-cacc-f19d-0334-0186d37b9bd2@redhat.com>
Date:   Fri, 2 Sep 2022 10:29:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 2/2] platform/x86: toshiba_acpi: Add fan RPM reading
 (hwmon interface)
Content-Language: en-US
To:     Guenter Roeck <linux@roeck-us.net>,
        Arvid Norlander <lkml@vorpal.se>,
        platform-driver-x86@vger.kernel.org
Cc:     Azael Avalos <coproscefalo@gmail.com>, linux-hwmon@vger.kernel.org
References: <20220901215819.1608723-1-lkml@vorpal.se>
 <20220901215819.1608723-3-lkml@vorpal.se>
 <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <0e31840d-aaf3-d2fb-f490-848e30f626a8@roeck-us.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Guenter, Arvid,

On 9/2/22 00:27, Guenter Roeck wrote:
> On 9/1/22 14:58, Arvid Norlander wrote:
>> This expands on the previous commit, exporting the fan RPM via hwmon.
>>
>> This will look something like the following when using the "sensors"
>> command from lm_sensors:
>>
>> toshiba_acpi_sensors-acpi-0
>> Adapter: ACPI interface
>> fan1:           0 RPM
>>
>> Signed-off-by: Arvid Norlander <lkml@vorpal.se>
>> ---
>>   drivers/platform/x86/Kconfig        |  1 +
>>   drivers/platform/x86/toshiba_acpi.c | 72 +++++++++++++++++++++++++++++
>>   2 files changed, 73 insertions(+)
>>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index f2f98e942cf2..4d0d2676939a 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -797,6 +797,7 @@ config ACPI_TOSHIBA
>>       depends on INPUT
>>       depends on SERIO_I8042 || SERIO_I8042 = n
>>       depends on ACPI_VIDEO || ACPI_VIDEO = n
>> +    depends on HWMON || HWMON = n
>>       depends on RFKILL || RFKILL = n
>>       depends on IIO
>>       select INPUT_SPARSEKMAP
>> diff --git a/drivers/platform/x86/toshiba_acpi.c b/drivers/platform/x86/toshiba_acpi.c
>> index 02e3522f4eeb..a976dfb97a5e 100644
>> --- a/drivers/platform/x86/toshiba_acpi.c
>> +++ b/drivers/platform/x86/toshiba_acpi.c
>> @@ -46,6 +46,10 @@
>>   #include <linux/toshiba.h>
>>   #include <acpi/video.h>
>>   +#ifdef CONFIG_HWMON
>> +#include <linux/hwmon.h>
>> +#endif
> 
> ifdef not needed here.

Ack.

> 
>> +
>>   MODULE_AUTHOR("John Belmonte");
>>   MODULE_DESCRIPTION("Toshiba Laptop ACPI Extras Driver");
>>   MODULE_LICENSE("GPL");
>> @@ -171,6 +175,9 @@ struct toshiba_acpi_dev {
>>       struct miscdevice miscdev;
>>       struct rfkill *wwan_rfk;
>>       struct iio_dev *indio_dev;
>> +#ifdef CONFIG_HWMON
>> +    struct device *hwmon_device;
>> +#endif
>>         int force_fan;
>>       int last_key_event;
>> @@ -2941,6 +2948,54 @@ static int toshiba_acpi_setup_backlight(struct toshiba_acpi_dev *dev)
>>       return 0;
>>   }
>>   +/* HWMON support for fan */
>> +#ifdef CONFIG_HWMON
> 
> This should be #if IS_REACHABLE(CONFIG_HWMON)

Actually that should be IS_ENABLED since you suggested that
Arvid should use:

	depends on HWMON || HWMON = n

In the Kconfig bit there is no need for IS_REACHABLE,
note IS_REACHABLE will work too but I generally prefer
to avoid it because cases which actually need it lead
to weirdness where e.g. both HWMON and TOSHIBA_ACPI are
enabled yet TOSHIBA_ACPI will still not have HWMON
support.

Arvid, sorry about the "noise" here, let me try to
explain.

First of all lets explain this bit of magic:

	depends on HWMON || HWMON = n

What this says is that if HWMON is enabled it must
be able to satisfy dependencies on it in toshiba_acpi.c
(or it may also be fully disabled).

This magic is necessary to avoid a case where
toshiba_acpi gets build into the kernel, but the
hwmon code is a module. In that case linking errors
(unresolved hwmon symbols) will happen when building
the main vmlinuz kernel image.

So basically what this does is if HWMON is configured
as a module, it limits the choices for TOSHIBA_ACPI
to either n or m and disallows y.

I hope that so far I'm making sense...

So now to the #ifdef-ery. Since HWMON can be a module
when enabled the #define's from Kconfig will either
contain:

#define CONFIG_HWMON 1   // when builtin, HWMON=y

or:

#define CONFIG_HWMON_MODULE 1   // when a module, HWMON=m

So you would need to write:

#if defined CONFIG_HWMON || defined CONFIG_HWMON_MODULE

as a condition

#if IS_ENABLED(CONFIG_HWMON)

is a shorthand (macro) for this.

###

Now back to:

#if IS_REACHABLE(CONFIG_HWMON)

This is a special macro for when your Kconfig bit would just be:

	depends on HWMON

in that case TOSHIBA_ACPI might be set to builtin (y)
while the HWMON core/class code is a module. As mentioned
above that would lead to undefined hwmon symbols when
using "#if IS_ENABLED(CONFIG_HWMON)" as test. IS_REACHABLE
is special in that it will disable (evaluate to false)
in the case where the code being build is builtin and
the dependency is a module.

But that cannot happen here because your Kconfig bit is:

	depends on HWMON || HWMON = n

So "#if IS_ENABLED(CONFIG_HWMON)" is sufficient.

TL;DR: please use "#if IS_ENABLED(CONFIG_HWMON)" to test
if the hwmon code should be build.

Regards,

Hans











> 
>> +umode_t toshiba_acpi_hwmon_is_visible(const void *drvdata,
>> +                      enum hwmon_sensor_types type,
>> +                      u32 attr, int channel)
>> +{
>> +    return 0444;
>> +}
>> +
>> +int toshiba_acpi_hwmon_read(struct device *dev, enum hwmon_sensor_types type,
>> +                u32 attr, int channel, long *val)
>> +{
>> +    /*
>> +     * There is only a single channel and single attribute (for the
>> +     * fan) at this point.
>> +     * This can be replaced with more advanced logic in the future,
>> +     * should the need arise.
>> +     */
>> +    if (type == hwmon_fan && channel == 0 && attr == hwmon_fan_input) {
>> +        u32 value;
>> +        int ret;
>> +
>> +        ret = get_fan_rpm(toshiba_acpi, &value);
>> +        if (ret)
>> +            return ret;
>> +
>> +        *val = value;
>> +        return 0;
>> +    }
>> +    return -EOPNOTSUPP;
>> +}
>> +
>> +static const struct hwmon_channel_info *toshiba_acpi_hwmon_info[] = {
>> +    HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT),
>> +    NULL
>> +};
>> +
>> +static const struct hwmon_ops toshiba_acpi_hwmon_ops = {
>> +    .is_visible = toshiba_acpi_hwmon_is_visible,
>> +    .read = toshiba_acpi_hwmon_read,
>> +};
>> +
>> +static const struct hwmon_chip_info toshiba_acpi_hwmon_chip_info = {
>> +    .ops = &toshiba_acpi_hwmon_ops,
>> +    .info = toshiba_acpi_hwmon_info,
>> +};
>> +#endif
>> +
>>   static void print_supported_features(struct toshiba_acpi_dev *dev)
>>   {
>>       pr_info("Supported laptop features:");
>> @@ -2995,6 +3050,11 @@ static int toshiba_acpi_remove(struct acpi_device *acpi_dev)
>>         remove_toshiba_proc_entries(dev);
>>   +#ifdef CONFIG_HWMON
> 
> #if IS_REACHABLE()
> 
>> +    if (dev->hwmon_device)
>> +        hwmon_device_unregister(dev->hwmon_device);
>> +#endif
>> +
>>       if (dev->accelerometer_supported && dev->indio_dev) {
>>           iio_device_unregister(dev->indio_dev);
>>           iio_device_free(dev->indio_dev);
>> @@ -3187,6 +3247,18 @@ static int toshiba_acpi_add(struct acpi_device *acpi_dev)
>>       ret = get_fan_rpm(dev, &dummy);
>>       dev->fan_rpm_supported = !ret;
>>   +#ifdef CONFIG_HWMON
> 
> 
> ... and again.
> 
>> +    if (dev->fan_rpm_supported) {
>> +        dev->hwmon_device = hwmon_device_register_with_info(
>> +            &dev->acpi_dev->dev, "toshiba_acpi_sensors", NULL,
>> +            &toshiba_acpi_hwmon_chip_info, NULL);
>> +        if (IS_ERR(dev->hwmon_device)) {
>> +            dev->hwmon_device = NULL;
>> +            pr_warn("unable to register hwmon device, skipping\n");
>> +        }
>> +    }
>> +#endif
>> +
>>       toshiba_wwan_available(dev);
>>       if (dev->wwan_supported)
>>           toshiba_acpi_setup_wwan_rfkill(dev);
> 

