Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 09E3C21B0E1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 10:00:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbgGJIAf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 04:00:35 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:59883 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725802AbgGJIAe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 04:00:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1594368032;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hqiYYUq7BP3enHF9jO/WbU5G695/oRtUXcB4Tvc4erQ=;
        b=BjMlnAZzzOhEf2EIXBv5yeKbP/yx/dxxJ7yQS3spy0Y31/syT+Q4X3EcNNu765l5axS1iV
        6/btaxv/odMQb3iBXniDie+b7Cb+PHZdiZ6RPKOLaSbSRWSrmC27DDPKaDRcF42P5ksD5F
        FzSAdI1s+Ig+wMmRRzP06jB/E0tkRJw=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-69-F2OosG5TOU2X-fxPnnlyjw-1; Fri, 10 Jul 2020 04:00:31 -0400
X-MC-Unique: F2OosG5TOU2X-fxPnnlyjw-1
Received: by mail-ed1-f71.google.com with SMTP id y4so5777774edv.17
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 01:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hqiYYUq7BP3enHF9jO/WbU5G695/oRtUXcB4Tvc4erQ=;
        b=GbWYVREaWXUFWMafpojY7UsrbMA49xdLJ8E6D+UT9LAWAKp5esT6PvCXPzEC6PmIQC
         no29iln+64hRHhc2BchaRaklbNV8Ry1CqgGPC2eHdhULm3j3ls0XMrokdZP3AZ9Bbozo
         m/QqoiVl/N44YOFvizOKtzutJ+lpj4rV4AucsYPqCvkw3FjhM5p33BOeg5BBsZ68/Cgv
         XsVlxDTeaTDW0kRRdxO6clwxwvIjrG2szMDocfOYv79HIgKzIpMOUDaKxrFloC2IvlwF
         IDu9GqnRneBcXdq7jT8Vrioo96watUVDueKGFvcfyfjVbAYBuSvSfZVc1t0LcBVEscIx
         Bigg==
X-Gm-Message-State: AOAM532zbXPNoliZjbWGWB66nueBoF8/4hq4h/aqf1bwGLdfpd0LLv9l
        9wdfbij7QIEsYEQx5IWq52FkGFGEFU7gON1uGExeXvmp8VIeDck1HlV7PAbl90uvc6NHQy0pKx/
        oMdvAutabqweB4wQ4Sl5hJffPzy8amACtjA==
X-Received: by 2002:a50:f08c:: with SMTP id v12mr74740694edl.119.1594368029798;
        Fri, 10 Jul 2020 01:00:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxZovV2iFyd0AQyELOnqN1obtQIQZ1JIN5rMDAtRHdqbdMSlrzHucR/UWg1fcv4JhLI9aGtvg==
X-Received: by 2002:a50:f08c:: with SMTP id v12mr74740672edl.119.1594368029495;
        Fri, 10 Jul 2020 01:00:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id e8sm3175838eja.101.2020.07.10.01.00.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 01:00:28 -0700 (PDT)
Subject: Re: [PATCH v5] platform/x86: thinkpad_acpi: lap or desk mode
 interface
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Pearson <markpearson@lenovo.com>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
References: <markpearson@lenovo.com>
 <20200703012353.26413-1-markpearson@lenovo.com>
 <CAHp75Vcs15wGCzwW8Pq7AXyqQnvnopNdFP1nDE0nf+ZTz=9zFw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99@redhat.com>
Date:   Fri, 10 Jul 2020 10:00:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vcs15wGCzwW8Pq7AXyqQnvnopNdFP1nDE0nf+ZTz=9zFw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/9/20 8:02 PM, Andy Shevchenko wrote:
> On Fri, Jul 3, 2020 at 4:24 AM Mark Pearson <markpearson@lenovo.com> wrote:
>>
>> Newer Lenovo Thinkpad platforms have support to identify whether the
>> system is on-lap or not using an ACPI DYTC event from the firmware.
>>
>> This patch provides the ability to retrieve the current mode via sysfs
>> entrypoints and will be used by userspace for thermal mode and WWAN
>> functionality
> 
> Hans, do you think it's good to have custom ABI for this? I think you
> may be know better what types of ABI we already have for such thing.

Actually, Mark asked me the same question before submitting his
patch upstream. I'm never a fan of custom ABI for this. But for now
the solution Lenovo has chosen to deal with thermal management
issues on modern hw is unique to Lenovo and we do not have anything
like this anywhere else.

So for now I believe that a custom ABI is best.

If we see this becoming a common feature on more platforms then we can
design a generic API for it once we have a better idea how this would
look like when implemented by others and then thinkpad_acpi can easily
add support for the new generic interface, while keeping its own
custom interface for backward compatibility.

Regards,

Hans



> 
>> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
>> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
>> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
>> Reviewed-by: Bastien Nocera <bnocera@redhat.com>
>> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
>> ---
>> Changes in v5:
>>   - Updated with review changes from Andy Shevchenko
>>   - Added ABI information to thinkpad-acpi.rst
>>   - improved error handling and parameter passing as recommended
>>   - code cleanup as recommended
>>   - added review tag from bnocera
>> Changes in v4:
>>   - Correct hotkey event comment as we're handling event
>>   - Remove unnecessary check in dytc_lapmode_refresh
>> Changes in v3:
>> - Fixed inaccurate comments
>> - Used BIT macro to check lapmode bit setting as recommended and update
>>    define name
>> - Check for new_state == dytc_lapmode in dytc_lapmode_refresh
>> Changes in v2:
>> - cleaned up initialisation sequence to be cleaner and avoid spamming
>>    platforms that don't have DYTC with warning message. Tested on P52
>> - Adding platform-driver-x86 mailing list for review as requested
>>
>>   .../admin-guide/laptops/thinkpad-acpi.rst     |  15 +++
>>   drivers/platform/x86/thinkpad_acpi.c          | 111 +++++++++++++++++-
>>   2 files changed, 124 insertions(+), 2 deletions(-)
>>
>> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> index 822907dcc845..99066aa8d97b 100644
>> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
>> @@ -50,6 +50,7 @@ detailed description):
>>          - WAN enable and disable
>>          - UWB enable and disable
>>          - LCD Shadow (PrivacyGuard) enable and disable
>> +       - Lap mode sensor
>>
>>   A compatibility table by model and feature is maintained on the web
>>   site, http://ibm-acpi.sf.net/. I appreciate any success or failure
>> @@ -1432,6 +1433,20 @@ The first command ensures the best viewing angle and the latter one turns
>>   on the feature, restricting the viewing angles.
>>
>>
>> +DYTC Lapmode sensor
>> +------------------
>> +
>> +sysfs: dytc_lapmode
>> +
>> +Newer thinkpads and mobile workstations have the ability to determine if
>> +the device is in deskmode or lapmode. This feature is used by user space
>> +to decide if WWAN transmission can be increased to maximum power and is
>> +also useful for understanding the different thermal modes available as
>> +they differ between desk and lap mode.
>> +
>> +The property is read-only. If the platform doesn't have support the sysfs
>> +class is not created.
>> +
>>   EXPERIMENTAL: UWB
>>   -----------------
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index ff7f0a4f2475..037eb77414f9 100644
>> --- a/drivers/platform/x86/thinkpad_acpi.c
>> +++ b/drivers/platform/x86/thinkpad_acpi.c
>> @@ -4022,8 +4022,8 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>>                  return true;
>>          case TP_HKEY_EV_THM_CSM_COMPLETED:
>>                  pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
>> -               /* recommended action: do nothing, we don't have
>> -                * Lenovo ATM information */
>> +               /* Thermal event - pass on to event handler */
>> +               tpacpi_driver_event(hkey);
>>                  return true;
>>          case TP_HKEY_EV_THM_TRANSFM_CHANGED:
>>                  pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
>> @@ -9795,6 +9795,105 @@ static struct ibm_struct lcdshadow_driver_data = {
>>          .write = lcdshadow_write,
>>   };
>>
>> +/*************************************************************************
>> + * DYTC subdriver, for the Lenovo lapmode feature
>> + */
>> +
>> +#define DYTC_CMD_GET          2 /* To get current IC function and mode */
>> +#define DYTC_GET_LAPMODE_BIT 17 /* Set when in lapmode */
>> +
>> +static bool dytc_lapmode;
>> +
>> +static void dytc_lapmode_notify_change(void)
>> +{
>> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL, "dytc_lapmode");
>> +}
>> +
>> +static int dytc_command(int command, int *output)
>> +{
>> +       acpi_handle dytc_handle;
>> +
>> +       if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
>> +               /* Platform doesn't support DYTC */
>> +               return -ENODEV;
>> +       }
>> +       if (!acpi_evalf(dytc_handle, output, NULL, "dd", command))
>> +               return -EIO;
>> +       return 0;
>> +}
>> +
>> +static int dytc_lapmode_get(bool *state)
>> +{
>> +       int output, err;
>> +
>> +       err = dytc_command(DYTC_CMD_GET, &output);
>> +       if (err)
>> +               return err;
>> +       *state = output & BIT(DYTC_GET_LAPMODE_BIT) ? true : false;
>> +       return 0;
>> +}
>> +
>> +static void dytc_lapmode_refresh(void)
>> +{
>> +       bool new_state;
>> +       int err;
>> +
>> +       err = dytc_lapmode_get(&new_state);
>> +       if (err || (new_state == dytc_lapmode))
>> +               return;
>> +
>> +       dytc_lapmode = new_state;
>> +       dytc_lapmode_notify_change();
>> +}
>> +
>> +/* sysfs lapmode entry */
>> +static ssize_t dytc_lapmode_show(struct device *dev,
>> +                                       struct device_attribute *attr,
>> +                                       char *buf)
>> +{
>> +       return snprintf(buf, PAGE_SIZE, "%d\n", dytc_lapmode);
>> +}
>> +
>> +static DEVICE_ATTR_RO(dytc_lapmode);
>> +
>> +static struct attribute *dytc_attributes[] = {
>> +       &dev_attr_dytc_lapmode.attr,
>> +       NULL,
>> +};
>> +
>> +static const struct attribute_group dytc_attr_group = {
>> +       .attrs = dytc_attributes,
>> +};
>> +
>> +static int tpacpi_dytc_init(struct ibm_init_struct *iibm)
>> +{
>> +       int err;
>> +
>> +       err = dytc_lapmode_get(&dytc_lapmode);
>> +       /* If support isn't available (ENODEV) then don't return an error
>> +        * but just don't create the sysfs group
>> +        */
>> +       if (err == -ENODEV)
>> +               return 0;
>> +       /* For all other errors we can flag the failure */
>> +       if (err)
>> +               return err;
>> +
>> +       /* Platform supports this feature - create the group */
>> +       err = sysfs_create_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
>> +       return err;
>> +}
>> +
>> +static void dytc_exit(void)
>> +{
>> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj, &dytc_attr_group);
>> +}
>> +
>> +static struct ibm_struct dytc_driver_data = {
>> +       .name = "dytc",
>> +       .exit = dytc_exit,
>> +};
>> +
>>   /****************************************************************************
>>    ****************************************************************************
>>    *
>> @@ -9842,6 +9941,10 @@ static void tpacpi_driver_event(const unsigned int hkey_event)
>>
>>                  mutex_unlock(&kbdlight_mutex);
>>          }
>> +
>> +       if (hkey_event == TP_HKEY_EV_THM_CSM_COMPLETED)
>> +               dytc_lapmode_refresh();
>> +
>>   }
>>
>>   static void hotkey_driver_event(const unsigned int scancode)
>> @@ -10280,6 +10383,10 @@ static struct ibm_init_struct ibms_init[] __initdata = {
>>                  .init = tpacpi_lcdshadow_init,
>>                  .data = &lcdshadow_driver_data,
>>          },
>> +       {
>> +               .init = tpacpi_dytc_init,
>> +               .data = &dytc_driver_data,
>> +       },
>>   };
>>
>>   static int __init set_ibm_param(const char *val, const struct kernel_param *kp)
>> --
>> 2.26.2
>>
> 
> 

