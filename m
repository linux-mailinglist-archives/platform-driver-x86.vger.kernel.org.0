Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F75A26CC24
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Sep 2020 22:39:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728502AbgIPUjh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 16:39:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60043 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726810AbgIPRGQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 13:06:16 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600275971;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=6ZSt2QPWKfLk3Exp3zqts90Wcw7rY5popjgkASrrKJg=;
        b=iEYTbvbu9NX7sCTpOSwN65dBW/rHUgVHltBiECnJSa1t+1MvME5mzPXyQj4uc44bJXkIxE
        DdOuO1StipHfF5vkG2dA5W85fmfYbvkkwqwLqrpMw3z9jmxlCx4jGbwibornZoH/OMrcXs
        aXt/5XV3XDD+lqn2secZYTS2AVQ6APg=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-463-doO-otnZMZKtFEXKjjkUMg-1; Wed, 16 Sep 2020 12:31:28 -0400
X-MC-Unique: doO-otnZMZKtFEXKjjkUMg-1
Received: by mail-ej1-f71.google.com with SMTP id f17so3158853ejq.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Sep 2020 09:31:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6ZSt2QPWKfLk3Exp3zqts90Wcw7rY5popjgkASrrKJg=;
        b=DNO27koyR4xW1bbaG0BCMj8O5im9HqZkQqztVfzuX/Kdkr+SM5/zunzP+9mVEzeX6C
         mgxRZimj08523nSnuXYEvnNn+QKLkKysjMc+GzyZPJ03N3idznukmReIXatxhswmwP4J
         uoqCBWBVKsdouAdu9YOoi4Po3+TxUuL9DeIZY2SksznquQ6anp7abwF8NoB/7umJT7PZ
         hjEUloYckRkE7Ce+DThRYYjdD1oauI0SwL4Nln07ggmCofLLaNR0vVUfajpp95Z5J2lx
         eyygpDGxHkwDkMPXHGG92cKTL2+4Re35EOAMwtfMXvRClYxHA+aZ/HtPiDqDb5vleCLu
         /jzw==
X-Gm-Message-State: AOAM532op/aiavNKbevogRPVzXfLR4vMy1JMeYeTbJIDwb28oxSNlNHf
        OFVg5NRW38u2KQ5+CTzaokZHMSK8G8tRaal/Joy/3Bf/ZrCtycoJgQ7k7CvVQRLXbVgfRoEzoiI
        PKOfc0GMNvhcbsA4J+lOTnRaJ7zMyR6vN2g==
X-Received: by 2002:a17:906:68d2:: with SMTP id y18mr26833054ejr.197.1600273887354;
        Wed, 16 Sep 2020 09:31:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwLksu5n0AdaxMMec/8U0HSKHnNtIl7XSAr9HHu5tBEEtFzrUYloLIaF1RN2qa8CT/hRb++Tg==
X-Received: by 2002:a17:906:68d2:: with SMTP id y18mr26833020ejr.197.1600273887049;
        Wed, 16 Sep 2020 09:31:27 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y9sm12884751ejw.96.2020.09.16.09.31.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Sep 2020 09:31:26 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-wmi: Fix SW_TABLET_MODE always
 reporting 1 on many different models
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>
References: <20200916154703.76643-1-hdegoede@redhat.com>
 <CAHp75VfkS61=3GvhfiBDO=j-YEdsjnSNMD9+6-N-QShZ9QipCw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <28af8abf-d10a-a316-d7d8-3480896514e8@redhat.com>
Date:   Wed, 16 Sep 2020 18:31:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfkS61=3GvhfiBDO=j-YEdsjnSNMD9+6-N-QShZ9QipCw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HI,

On 9/16/20 6:19 PM, Andy Shevchenko wrote:
> On Wed, Sep 16, 2020 at 6:47 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Commit b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for
>> SW_TABLET_MODE") added support for reporting SW_TABLET_MODE using the
>> Asus 0x00120063 WMI-device-id to see if various transformer models were
>> docked into their keyboard-dock (SW_TABLET_MODE=0) or if they were
>> being used as a tablet.
>>
>> The new SW_TABLET_MODE support (naively?) assumed that non Transformer
>> devices would either not support the 0x00120063 WMI-device-id at all,
>> or would NOT set ASUS_WMI_DSTS_PRESENCE_BIT in their reply when querying
>> the device-id.
>>
>> Unfortunately this is not true and we have received many bug reports about
>> this change causing the asus-wmi driver to always report SW_TABLET_MODE=1
>> on non Transformer devices. This causes libinput to think that these are
>> 360 degree hinges style 2-in-1s folded into tablet-mode. Making libinput
>> suppress keyboard and touchpad events from the builtin keyboard and
>> touchpad. So effectively this causes the keyboard and touchpad to not work
>> on many non Transformer Asus models.
>>
>> This commit fixes this by using the existing DMI based quirk mechanism in
>> asus-nb-wmi.c to allow using the 0x00120063 device-id for reporting
>> SW_TABLET_MODE on Transformer models and ignoring it on all other models.
>>
>> Fixes: b0dbd97de1f1 ("platform/x86: asus-wmi: Add support for SW_TABLET_MODE")
>> BugLink: https://bugzilla.kernel.org/show_bug.cgi?id=209011
> 
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1875339
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1875828
>> BugLink: https://bugzilla.redhat.com/show_bug.cgi?id=1876997
> 
> Do we need all three from the same bug tracker? Could they be marked
> as duplicate to some (meta?) bug?

Good point, I've marked the first 2 as duplicates of the last
one since most debugging was done in the 1876997 bug.

Feel free to drop the 2 lower-numbered bugs when you apply this,
or I can send a new version if you want.

Regards,

Hans



> 
>> Reported-by: Samuel Čavoj <samuel@cavoj.net>
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/asus-nb-wmi.c | 32 ++++++++++++++++++++++++++++++
>>   drivers/platform/x86/asus-wmi.c    | 16 ++++++++-------
>>   drivers/platform/x86/asus-wmi.h    |  1 +
>>   3 files changed, 42 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index 680c3640e013..1d9fbabd02fb 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -115,6 +115,10 @@ static struct quirk_entry quirk_asus_vendor_backlight = {
>>          .wmi_backlight_set_devstate = true,
>>   };
>>
>> +static struct quirk_entry quirk_asus_use_kbd_dock_devid = {
>> +       .use_kbd_dock_devid = true,
>> +};
>> +
>>   static int dmi_matched(const struct dmi_system_id *dmi)
>>   {
>>          pr_info("Identified laptop model '%s'\n", dmi->ident);
>> @@ -488,6 +492,34 @@ static const struct dmi_system_id asus_quirks[] = {
>>                  },
>>                  .driver_data = &quirk_asus_vendor_backlight,
>>          },
>> +       {
>> +               .callback = dmi_matched,
>> +               .ident = "Asus Transformer T100TA / T100HA / T100CHI",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                       /* Match *T100* */
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T100"),
>> +               },
>> +               .driver_data = &quirk_asus_use_kbd_dock_devid,
>> +       },
>> +       {
>> +               .callback = dmi_matched,
>> +               .ident = "Asus Transformer T101HA",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T101HA"),
>> +               },
>> +               .driver_data = &quirk_asus_use_kbd_dock_devid,
>> +       },
>> +       {
>> +               .callback = dmi_matched,
>> +               .ident = "Asus Transformer T200TA",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME, "T200TA"),
>> +               },
>> +               .driver_data = &quirk_asus_use_kbd_dock_devid,
>> +       },
>>          {},
>>   };
>>
>> diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
>> index 8f4acdc06b13..ae6289d37faf 100644
>> --- a/drivers/platform/x86/asus-wmi.c
>> +++ b/drivers/platform/x86/asus-wmi.c
>> @@ -365,12 +365,14 @@ static int asus_wmi_input_init(struct asus_wmi *asus)
>>          if (err)
>>                  goto err_free_dev;
>>
>> -       result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>> -       if (result >= 0) {
>> -               input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> -               input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>> -       } else if (result != -ENODEV) {
>> -               pr_err("Error checking for keyboard-dock: %d\n", result);
>> +       if (asus->driver->quirks->use_kbd_dock_devid) {
>> +               result = asus_wmi_get_devstate_simple(asus, ASUS_WMI_DEVID_KBD_DOCK);
>> +               if (result >= 0) {
>> +                       input_set_capability(asus->inputdev, EV_SW, SW_TABLET_MODE);
>> +                       input_report_switch(asus->inputdev, SW_TABLET_MODE, !result);
>> +               } else if (result != -ENODEV) {
>> +                       pr_err("Error checking for keyboard-dock: %d\n", result);
>> +               }
>>          }
>>
>>          err = input_register_device(asus->inputdev);
>> @@ -2114,7 +2116,7 @@ static void asus_wmi_handle_event_code(int code, struct asus_wmi *asus)
>>                  return;
>>          }
>>
>> -       if (code == NOTIFY_KBD_DOCK_CHANGE) {
>> +       if (asus->driver->quirks->use_kbd_dock_devid && code == NOTIFY_KBD_DOCK_CHANGE) {
>>                  result = asus_wmi_get_devstate_simple(asus,
>>                                                        ASUS_WMI_DEVID_KBD_DOCK);
>>                  if (result >= 0) {
>> diff --git a/drivers/platform/x86/asus-wmi.h b/drivers/platform/x86/asus-wmi.h
>> index 4f31b68642a0..1a95c172f94b 100644
>> --- a/drivers/platform/x86/asus-wmi.h
>> +++ b/drivers/platform/x86/asus-wmi.h
>> @@ -33,6 +33,7 @@ struct quirk_entry {
>>          bool wmi_backlight_native;
>>          bool wmi_backlight_set_devstate;
>>          bool wmi_force_als_set;
>> +       bool use_kbd_dock_devid;
>>          int wapf;
>>          /*
>>           * For machines with AMD graphic chips, it will send out WMI event
>> --
>> 2.28.0
>>
> 
> 

