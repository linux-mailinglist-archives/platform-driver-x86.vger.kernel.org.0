Return-Path: <platform-driver-x86+bounces-388-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id A3E7780D01F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Dec 2023 16:55:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id C7E911C20F35
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Dec 2023 15:55:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B92CC4BABE;
	Mon, 11 Dec 2023 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RM8qkeMn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD7CCB4
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 07:55:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702310143;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Z44HRi6BoTU+suuvN9Kf4v+c8DNu/swIY6xBfMot3js=;
	b=RM8qkeMnv/b2zdHC+Zw7zhiHokdCZepXdcB2agF10O9skF1iUfdvH0Ar153S6Lj7yLS7xW
	J3wWTb/0I24o0jhy27TidYrDGUkQVsJwZK9fzDD2Kjm+Np8hmwLF8VqF9O0AaOfdKHfRCR
	+8vq6YThIJDKa1Au3Mhuc7M8ERB7Tmk=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-196-BEaXuWo6Ooe1ok-_-R2R8g-1; Mon, 11 Dec 2023 10:55:42 -0500
X-MC-Unique: BEaXuWo6Ooe1ok-_-R2R8g-1
Received: by mail-lf1-f69.google.com with SMTP id 2adb3069b0e04-50bf7c5c732so3800456e87.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 07:55:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702310140; x=1702914940;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z44HRi6BoTU+suuvN9Kf4v+c8DNu/swIY6xBfMot3js=;
        b=PC2uD6fYIgu5N9uDUQMqlfYlTZNOQjUo5byVSbMzdcA9ZfEmOgywZj1xOvP1JfAuvL
         rJ4E0E5MPZzbRJZV1dIHf/gl7agIad5W47zOoTmNpuGZRCsRHtSQ5/ac3QjadluK453Z
         IV8Pm8OIwOxn9zLyC5dUXyysjjLT0DjC/Me8HI02UfRMbN7lTT7IpY9iSRR9lnmAuhyc
         sTe8Uk78GVYxTeyjOWV0GuFKHgpxlAaNPjiB3lXl6TPKvqj3U9vACKwr8E3jx6tfRqOf
         MKEaGKKwe/80+4fGl6Tpq7hRpVuiivF5LNc+dS+gBW3Oar6ynwtIe2in1cBOt+xQRBOP
         KBDg==
X-Gm-Message-State: AOJu0Yyz4IXasGaK1UISVlebYjR87HdyR1umtuNm4YdJfE9A40csejJY
	s37rPyuKqKbBS8ZmRQeXAmuiasVXSsrXb/9oW6bSBuoodIbP8auDME31H3/hehHnoUKDjZZtVGJ
	3nFL1X9nWn447lNIVQC6omP17F/2SUQqLrw==
X-Received: by 2002:a2e:a1ca:0:b0:2cb:2193:e715 with SMTP id c10-20020a2ea1ca000000b002cb2193e715mr810245ljm.139.1702310140689;
        Mon, 11 Dec 2023 07:55:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHu944q7DKM5rc5Z7dlIsOOj+gdHycmrVGLj8VEhNKsY6/13qlJDoK3271gKFMZ3qtNsAxibQ==
X-Received: by 2002:a2e:a1ca:0:b0:2cb:2193:e715 with SMTP id c10-20020a2ea1ca000000b002cb2193e715mr810238ljm.139.1702310140354;
        Mon, 11 Dec 2023 07:55:40 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ub27-20020a170907c81b00b00a1df4387f16sm5063748ejc.95.2023.12.11.07.55.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 07:55:39 -0800 (PST)
Message-ID: <c3a46dec-0f55-4abb-a5c1-39ba467a3108@redhat.com>
Date: Mon, 11 Dec 2023 16:55:38 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 03/15] platform/x86/amd/pmf: Change return type of
 amd_pmf_set_dram_addr()
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-4-Shyam-sundar.S-k@amd.com>
 <bae8cbbb-47d9-4e03-9445-8ca9b50576af@redhat.com>
 <4af63850-0cb5-4deb-8dad-39dbb425916b@amd.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <4af63850-0cb5-4deb-8dad-39dbb425916b@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Shyam,

On 12/11/23 16:15, Shyam Sundar S K wrote:
> Hi Hans,
> 
> On 12/11/2023 2:10 PM, Hans de Goede wrote:
>> Hi,
>>
>> On 12/4/23 11:15, Shyam Sundar S K wrote:
>>> In the current code, the metrics table information was required only
>>> for auto-mode or CnQF at a given time. Hence keeping the return type
>>> of amd_pmf_set_dram_addr() as static made sense.
>>>
>>> But with the addition of Smart PC builder feature, the metrics table
>>> information has to be shared by the Smart PC also and this feature
>>> resides outside of core.c.
>>>
>>> To make amd_pmf_set_dram_addr() visible outside of core.c make it
>>> as a non-static function and move the allocation of memory for
>>> metrics table from amd_pmf_init_metrics_table() to amd_pmf_set_dram_addr()
>>> as amd_pmf_set_dram_addr() is the common function to set the DRAM
>>> address.
>>>
>>> Add a suspend handler that can free up the allocated memory for getting
>>> the metrics table information.
>>>
>>> Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
>>> ---
>>>  drivers/platform/x86/amd/pmf/core.c | 42 ++++++++++++++++++++++-------
>>>  drivers/platform/x86/amd/pmf/pmf.h  |  1 +
>>>  2 files changed, 34 insertions(+), 9 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
>>> index ec92d1cc0dac..f50b7ec9a625 100644
>>> --- a/drivers/platform/x86/amd/pmf/core.c
>>> +++ b/drivers/platform/x86/amd/pmf/core.c
>>> @@ -251,29 +251,35 @@ static const struct pci_device_id pmf_pci_ids[] = {
>>>  	{ }
>>>  };
>>>  
>>> -static void amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>>> +int amd_pmf_set_dram_addr(struct amd_pmf_dev *dev)
>>>  {
>>>  	u64 phys_addr;
>>>  	u32 hi, low;
>>>  
>>> +	/* Get Metrics Table Address */
>>> +	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>>> +	if (!dev->buf)
>>> +		return -ENOMEM;
>>> +
>>>  	phys_addr = virt_to_phys(dev->buf);
>>>  	hi = phys_addr >> 32;
>>>  	low = phys_addr & GENMASK(31, 0);
>>>  
>>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_HIGH, 0, hi, NULL);
>>>  	amd_pmf_send_cmd(dev, SET_DRAM_ADDR_LOW, 0, low, NULL);
>>> +
>>> +	return 0;
>>>  }
>>>  
>>>  int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>>  {
>>> -	/* Get Metrics Table Address */
>>> -	dev->buf = kzalloc(sizeof(dev->m_table), GFP_KERNEL);
>>> -	if (!dev->buf)
>>> -		return -ENOMEM;
>>> +	int ret;
>>>  
>>>  	INIT_DELAYED_WORK(&dev->work_buffer, amd_pmf_get_metrics);
>>>  
>>> -	amd_pmf_set_dram_addr(dev);
>>> +	ret = amd_pmf_set_dram_addr(dev);
>>> +	if (ret)
>>> +		return ret;
>>>  
>>>  	/*
>>>  	 * Start collecting the metrics data after a small delay
>>> @@ -284,17 +290,35 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>>>  	return 0;
>>>  }
>>>  
>>> +static int amd_pmf_suspend_handler(struct device *dev)
>>> +{
>>> +	struct amd_pmf_dev *pdev = dev_get_drvdata(dev);
>>> +
>>> +	/*
>>> +	 * Free the buffer allocated for storing the metrics table
>>> +	 * information, as will have to allocate it freshly after
>>> +	 * resume.
>>> +	 */
>>> +	kfree(pdev->buf);
>>
>> This seems quite risky. You are freeing the memory here,
>> but the SET_DRAM_ADDR_HIGH and SET_DRAM_ADDR_LO registers
>> still point to it, so the hw may still access it.
>>
>> IMHO it would be better to add a "bool alloc_buffer"
>> parameter to amd_pmf_set_dram_addr() and set that
>> to true on init and false on resume.
>>
> 
> Ok. I have made this change.
> 
>> Also I guess that this DRAM buffer is used by the new
>> smartpc mode and specifically by the command send by
>> amd_pmf_invoke_cmd() work. In that case you really
>> need to make sure to cancel the work before
>> freeing the buffer and then re-submit the work
>> on resume.
> 
> With some sanity tests, I don't think so this is required. pdev->buf
> is only used to get the metrics table info. So, I am keeping only the
> freeing part + alloc_buffer thing and not cancel/resubmit in the
> suspend/resume.
> 
> If there are issues in the future because of not including
> cancel/resubmit thing, can we work that as a bug fix later? Would that
> be OK for you?

If you are sure that it is safe to keep the work running
after your suspend-handler has run and on resume to
have it running before your resume handler has run
then yes that is ok.

This seems unwise though, adding a sync kill of the
work + requeue is only a couple of lines of code.

And what about accessing other subsystems like the
AMD HID sensors, I guess the work item may do that
too? That esp. seems unwise to do after your
suspend-handler has run.

Even if you stop the work from your suspend handler
you may need to add some dev-links to ensure
that the PMF linux-device is suspended before
e.g. the AMD HID sensors. That can be done in
a follow up patch though.

Regards,

Hans




