Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A59BB19D9B2
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Apr 2020 17:03:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2403795AbgDCPD1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Apr 2020 11:03:27 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:34345 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404079AbgDCPD0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Apr 2020 11:03:26 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585926205;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AyMiQZBYNObrGTC5/0a1f5GECR6R9fTBrBZGyOFzxdk=;
        b=aFf3iYfoyWtcnt7Xh+2dPNARdsTmwjnaRv0ADnPe9wheGcttst3RFI50rMvomCkSgdgsMK
        3gQlNMiC9DcxWfd9w2DWu8xibWVQFQezh2j1CH0+vR4OLYX2LXjFYMp4sAPMp0zhXgGtA7
        Do40TVlHWAxAgz1vd9qQx+bU0SFuMOE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-236-NOd3kNsjMWaBzgybVi1Qfg-1; Fri, 03 Apr 2020 11:03:21 -0400
X-MC-Unique: NOd3kNsjMWaBzgybVi1Qfg-1
Received: by mail-wr1-f69.google.com with SMTP id t25so3200166wrb.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Apr 2020 08:03:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=AyMiQZBYNObrGTC5/0a1f5GECR6R9fTBrBZGyOFzxdk=;
        b=bg89aUTkRKwGPSi7z8o3aLlqmVZ7VTla/NPW01bY2Iv3AVIKWkI+lSNwPFqp0cmEjg
         jymrHqNyDo74MMpI232/SQflwvGwU0/aM4KePRfT7uNRZOA1FUHHkBH5HYSpEeG1rnmA
         ZcxSt55jGAkrOkJRNuKTn/ik4G030E1HdThBNlSDxUdHLdY7sOIl/GBifjBuLSumi5/j
         c603BNPuF+D4BXBc0KCfC43o7vMmYh7TrP87o7AjUqP1hL1Rq2UaFb/aX3s0Al9+SslN
         Tg2wD909VLaVY/wcqKa+qIPuTpuuHTaYxEhd6/cVJQZoy6kBQtWx7U1MGmZpRQk/YW+d
         RDFQ==
X-Gm-Message-State: AGi0PuYX7MrlufGQcpmlZE4z+QIxTKSlxy41Xxt3hoBJJsGuYcact4EB
        BjATB8U5mO0H5dPONuNjMCpRMxsd2buLPRCpe1PeVICXs5LztdFNQskQ/8QCV9V0OCT0NGcHnZ0
        Q8OY+G1op0wb8XHX67wTZmQadGM+lQdn+Vg==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr10004954wrs.132.1585926200165;
        Fri, 03 Apr 2020 08:03:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKRAL+3/jSICo54b+5w03Rl9FI4HrOdsnmfDTGRCDp1bwdcrlu1b5fzPMA6R6d27iYl+ZX8Qw==
X-Received: by 2002:adf:fcc8:: with SMTP id f8mr10004919wrs.132.1585926199965;
        Fri, 03 Apr 2020 08:03:19 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id 189sm12149137wme.31.2020.04.03.08.03.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2020 08:03:19 -0700 (PDT)
Subject: Re: [PATCH v2 2/2] platform/x86: intel_int0002_vgpio: Use
 acpi_register_wakeup_handler()
To:     "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Len Brown <lenb@kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "5 . 4+" <stable@vger.kernel.org>
References: <20200403105235.105187-1-hdegoede@redhat.com>
 <20200403105235.105187-2-hdegoede@redhat.com>
 <CAJZ5v0gcRgTTRfCKHS00y599NBhWPgAYQF0RfFo6-vDegYA6Eg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <873c0209-c335-a9fe-d17b-b8e089bdcc04@redhat.com>
Date:   Fri, 3 Apr 2020 17:03:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0gcRgTTRfCKHS00y599NBhWPgAYQF0RfFo6-vDegYA6Eg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/3/20 3:25 PM, Rafael J. Wysocki wrote:
> On Fri, Apr 3, 2020 at 12:52 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> The Power Management Events (PMEs) the INT0002 driver listens for get
>> signalled by the Power Management Controller (PMC) using the same IRQ
>> as used for the ACPI SCI.
>>
>> Since commit fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from
>> waking up the system") the SCI triggering, without there being a wakeup
>> cause recognized by the ACPI sleep code, will no longer wakeup the system.
>>
>> This breaks PMEs / wakeups signalled to the INT0002 driver, the system
>> never leaves the s2idle_loop() now.
>>
>> Use acpi_register_wakeup_handler() to register a function which checks
>> the GPE0a_STS register for a PME and trigger a wakeup when a PME has
>> been signalled.
>>
>> With this new mechanism the pm_wakeup_hard_event() call is no longer
>> necessary, so remove it and also remove the matching device_init_wakeup()
>> calls.
>>
>> Fixes: fdde0ff8590b ("ACPI: PM: s2idle: Prevent spurious SCIs from waking up the system")
>> Cc: 5.4+ <stable@vger.kernel.org> # 5.4+
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Changes in v2:
>> - Adjust for the wakeup-handler registration function being renamed to
>>    acpi_register_wakeup_handler()
>> ---
>>   drivers/platform/x86/intel_int0002_vgpio.c | 14 ++++++++++----
>>   1 file changed, 10 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/platform/x86/intel_int0002_vgpio.c b/drivers/platform/x86/intel_int0002_vgpio.c
>> index f14e2c5f9da5..9da19168b4f6 100644
>> --- a/drivers/platform/x86/intel_int0002_vgpio.c
>> +++ b/drivers/platform/x86/intel_int0002_vgpio.c
>> @@ -122,11 +122,17 @@ static irqreturn_t int0002_irq(int irq, void *data)
>>          generic_handle_irq(irq_find_mapping(chip->irq.domain,
>>                                              GPE0A_PME_B0_VIRT_GPIO_PIN));
>>
>> -       pm_wakeup_hard_event(chip->parent);
>> -
> 
> If the event occurs before the "noirq" phase of suspending devices, it
> can be missed with this change AFAICS.
> 
>>          return IRQ_HANDLED;
>>   }
>>
>> +static bool int0002_check_wake(void *data)
>> +{
>> +       u32 gpe_sts_reg;
>> +
>> +       gpe_sts_reg = inl(GPE0A_STS_PORT);
>> +       return (gpe_sts_reg & GPE0A_PME_B0_STS_BIT);
>> +}
>> +
>>   static struct irq_chip int0002_byt_irqchip = {
>>          .name                   = DRV_NAME,
>>          .irq_ack                = int0002_irq_ack,
>> @@ -220,13 +226,13 @@ static int int0002_probe(struct platform_device *pdev)
>>                  return ret;
>>          }
>>
>> -       device_init_wakeup(dev, true);
>> +       acpi_register_wakeup_handler(irq, int0002_check_wake, NULL);
> 
> So I would just add the wakeup handler registration here.

Ok, will fix for the upcoming v3 of the series.

Regards,

Hans



> 
>>          return 0;
>>   }
>>
>>   static int int0002_remove(struct platform_device *pdev)
>>   {
>> -       device_init_wakeup(&pdev->dev, false);
>> +       acpi_unregister_wakeup_handler(int0002_check_wake, NULL);
>>          return 0;
>>   }
>>
>> --
> 

