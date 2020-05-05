Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B60361C5188
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 11:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728602AbgEEJFl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 05:05:41 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:25648 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727931AbgEEJFk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 05:05:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588669538;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1+LmrUrtcqgzqAfGxHD9QsGnOcwbmZustjV1q6uvrdU=;
        b=MQPWDCBgAG8uLTxQBY6dSMR+ugBr14w3h8u3rhV868y/loEiOOQgpcLZ9yfTfvuvr8CgQF
        9YxhB325/nh8BtDkc1iaBuQ/cUq8EUxLOcImncunrLXcw2+SehT0Vi1q0c+BjwJlY4WWCw
        dFDMJKVyiZMca88PcSYwgTqz9y2ObJE=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-213-Yx_ZqCTkMpmzKwrvEZDLug-1; Tue, 05 May 2020 05:05:34 -0400
X-MC-Unique: Yx_ZqCTkMpmzKwrvEZDLug-1
Received: by mail-wr1-f72.google.com with SMTP id x8so890291wrl.16
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 02:05:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1+LmrUrtcqgzqAfGxHD9QsGnOcwbmZustjV1q6uvrdU=;
        b=JJEv9j7CE1h/kmeOxL0laki/K1KRK2xAlWs83Bnv7RRIDcUIF/aENuSBqtd5l9arX6
         L0yDON+yDCsFG09CKmy1UWQtwrnh02nK0pTqSf7U+yZfGA+2SX+9oLIpZUS7qSpaRUyU
         vJXbmc3YdlHraCcK7hKnFYbpssxgkAPoW+qa29zrMh0lmaKLSJ/epMlgSfsEb5f8t+Qj
         dc7XJ7SGwk5rMMcMHu4ec9Zy4N+QQjbldvS8ZjfllBUjSStAIf6el/vmWqVq+yt/WWEw
         pnHbzKOfCmGULVevIx4afCprQeOTpc/Hpi81FKsysCvhroe/gIUFoXaxtlf6fzCrR+i3
         zeCg==
X-Gm-Message-State: AGi0PuaPqQbxXc74nra7zgp3DSMeJ3AFX7FE9OU1WWcB/UpdPgGjNOGm
        eof5HX1eYCyahtc9uY1tZGEei5V+0mTCugb3LMZw5FSUCJzOk4IrFM0Krxfa7Ld5Npr7uxeuK2T
        NrSiq1/5Z0MXUp4e7bNYAxRycbDo/gwtoug==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr2407570wrm.31.1588669533027;
        Tue, 05 May 2020 02:05:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypKtqaQzd19ogkzAgqERbPwpBGWoQ3+Cfgvk9+W2U1ocgZR5wFhnTwBp38CSTb/3ae2ZTv89Bw==
X-Received: by 2002:adf:ea02:: with SMTP id q2mr2407542wrm.31.1588669532831;
        Tue, 05 May 2020 02:05:32 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id n7sm2069667wrm.86.2020.05.05.02.05.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 02:05:32 -0700 (PDT)
Subject: Re: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode
 switch on "Detachable" and "Portable" chassis-types
To:     Mario.Limonciello@dell.com, dvhart@infradead.org,
        andy@infradead.org
Cc:     linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20200502182951.114231-1-hdegoede@redhat.com>
 <20200502182951.114231-5-hdegoede@redhat.com>
 <7c3e5f844a224ff780cd8e3b3f5f7641@AUSX13MPC101.AMER.DELL.COM>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <13a8ec94-1eae-4d95-7238-85c612ebc896@redhat.com>
Date:   Tue, 5 May 2020 11:05:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <7c3e5f844a224ff780cd8e3b3f5f7641@AUSX13MPC101.AMER.DELL.COM>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/4/20 5:37 PM, Mario.Limonciello@dell.com wrote:
> 
> 
>> -----Original Message-----
>> From: Hans de Goede <hdegoede@redhat.com>
>> Sent: Saturday, May 2, 2020 1:30 PM
>> To: Darren Hart; Andy Shevchenko; Limonciello, Mario
>> Cc: Hans de Goede; linux-acpi@vger.kernel.org; platform-driver-
>> x86@vger.kernel.org; linux-kernel@vger.kernel.org
>> Subject: [PATCH 4/5] platform/x86: intel-vbtn: Also handle tablet-mode switch
>> on "Detachable" and "Portable" chassis-types
>>
>>
>> [EXTERNAL EMAIL]
>>
>> Commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
>> switch on 2-in-1's") added a DMI chassis-type check to avoid accidentally
>> reporting SW_TABLET_MODE = 1 to userspace on laptops.
>>
>> Some devices with a detachable keyboard and using the intel-vbnt (INT33D6)
>> interface to report if they are in tablet mode (keyboard detached) or not,
>> report 32 / "Detachable" as chassis-type, e.g. the HP Pavilion X2 series.
>>
>> Other devices with a detachable keyboard and using the intel-vbnt (INT33D6)
>> interface to report SW_TABLET_MODE, report 8 / "Portable" as chassis-type.
>> The Dell Venue 11 Pro 7130 is an example of this.
>>
>> Extend the DMI chassis-type check to also accept Portables and Detachables
>> so that the intel-vbtn driver will report SW_TABLET_MODE on these devices.
>>
>> Note the chassis-type check was originally added to avoid a false-positive
>> tablet-mode report on the Dell XPS 9360 laptop. To the best of my knowledge
>> that laptop is using a chassis-type of 9 / "Laptop", so after this commit
>> we still ignore the tablet-switch for that chassis-type.
> 
> Yes that's correct.
> 
>>
>> Fixes: de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet mode
>> switch on 2-in-1's")
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>> Looking at the Microsoft Windows documentation for tablet-mode reporting:
>> https://docs.microsoft.com/en-us/windows-hardware/drivers/gpiobtn/button-
>> implementation
>>
>> Then the presence of a tablet-mode switch is indicated by the presence
>> of a PNP0C60 compatible ACPI devices. There are 2 ways in which this device
>> can report the tablet-mode. 1. Directly providing a GpioInt resource inside
>> the PNP0C60 device, 2. Through injecting events from a Windows driver.
>>
>> It seems that the intel-vbtn / the INT33D6 ACPI device is the ACPI side
>> of Intel's generic solution for the case where the tablet-mode comes from
>> the embedded-controller and needs to be "injected".
>>
>> This all suggests that it might be better to replace the chassis-type
>> check with a acpi_dev_present("PNP0C60", NULL, -1) check.
>>
>> Mario, can you provide an acpidump and alsa-info.sh output for the
>> Dell XPS 9360, so that I can check if that might help with the issue
>> there, and thus is a potential candidate to replace the chassis-type
>> check?
> 
> Unfortunately with WFH right now, I don't have access to a XPS 9630 to
> double check the patch series.
> 
> However I do agree this should be a good approach.

Ok, so lets stick with the chassis-type check (as amended by this patch)
for now then. Then once you are able to go to your office again, we
can examine the acpi_dev_present("PNP0C60", NULL, -1) alternative.

> Reviewed-by: Mario Limonciello <Mario.limonciello@dell.com>

Thank you.

Regards,

Hans




>> ---
>>   drivers/platform/x86/intel-vbtn.c | 12 +++++++++++-
>>   1 file changed, 11 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-
>> vbtn.c
>> index 500fae82e12c..4921fc15dc6c 100644
>> --- a/drivers/platform/x86/intel-vbtn.c
>> +++ b/drivers/platform/x86/intel-vbtn.c
>> @@ -158,12 +158,22 @@ static void detect_tablet_mode(struct platform_device
>> *device)
>>   static bool intel_vbtn_has_switches(acpi_handle handle)
>>   {
>>   	const char *chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
>> +	unsigned long chassis_type_int;
>>   	unsigned long long vgbs;
>>   	acpi_status status;
>>
>> -	if (!(chassis_type && strcmp(chassis_type, "31") == 0))
>> +	if (kstrtoul(chassis_type, 10, &chassis_type_int))
>>   		return false;
>>
>> +	switch (chassis_type_int) {
>> +	case  8: /* Portable */
>> +	case 31: /* Convertible */
>> +	case 32: /* Detachable */
>> +		break;
>> +	default:
>> +		return false;
>> +	}
>> +
>>   	status = acpi_evaluate_integer(handle, "VGBS", NULL, &vgbs);
>>   	return ACPI_SUCCESS(status);
>>   }
>> --
>> 2.26.0
> 

