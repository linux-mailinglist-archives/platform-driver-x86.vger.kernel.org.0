Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AFE527EF1BC
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Nov 2023 12:31:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230195AbjKQLbr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Nov 2023 06:31:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbjKQLbq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Nov 2023 06:31:46 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B4DF18B
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Nov 2023 03:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1700220700;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=CvtsnLB81XSKdoU+nTsRM4sUaPasK28u2sZ9LUREODc=;
        b=B6Uxb0xMa0H5QmuKsmVZkGMs+HQ+N41xT6EddROkgt1dCID9n7YDt3OqpKRDGeGTd+wK6l
        cRx0Cbm6w1o3pwxgGPMiMgEMvXcx/ekPwd5X4tH+YB21AVeNi1RY2uun9Da4f5VB1V6zny
        NmLnxudoQU9hyYG132s2T14VmsFaAG8=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-2wDqrHCcMamnJXHL-OntMA-1; Fri, 17 Nov 2023 06:31:38 -0500
X-MC-Unique: 2wDqrHCcMamnJXHL-OntMA-1
Received: by mail-ed1-f70.google.com with SMTP id 4fb4d7f45d1cf-5400c8c6392so1366376a12.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Nov 2023 03:31:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700220698; x=1700825498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CvtsnLB81XSKdoU+nTsRM4sUaPasK28u2sZ9LUREODc=;
        b=Vl3RoaXlSCLtMyAdO0Oxd97MGQe0qd+dxylhj0+878cVrvY7EbZcshbP2DU1SVmhRs
         jjAPFBz4qZiKSKpmMsY/5I833h66xk8OCH33W6kMVvE2SlPPh1EKQ8sb3f8tM/wD303z
         5nlyO9OcAkUGLTdscg1RySCdpbprC5wEDsRAdGU4oINM7FXBQzltcVo27BRTD6juZfdJ
         8t6EcV4rQGTX13CANRr7loGmJB2wAlzSLfXpvFwiylmfZ2WZ+9SsLP/gW2l+CR9VdwyW
         hGNebqBG3VqftMdEPExzNJjIr+lANeiSsCCg7MGVepU82SAvW7ZwUJbh++f5aTjSjpAt
         AI4g==
X-Gm-Message-State: AOJu0YxAnbDu1RJ8iDoeukMnWug+W+Xd/kKrbC4dw3tojkhUo1QrGiUy
        TA01TfORsHG1dy/1SgAQ4DW2C9B72y1kBpxRToT7CeS6tTC0c059pHH8ylxrOYr7BII+6rsacHS
        Fym/g/2rIeWQj+nv+m6Oe3rTSLz9do//Z6A==
X-Received: by 2002:a17:906:688d:b0:9e2:c2a6:5c86 with SMTP id n13-20020a170906688d00b009e2c2a65c86mr12952720ejr.35.1700220697613;
        Fri, 17 Nov 2023 03:31:37 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE8wlAgdL/1Yrjo3mRDVzr8d/oRI4MVBhcItGLQQwxOBVfaNPf7b3dN0/95d9CMbZ/L9pjYhA==
X-Received: by 2002:a17:906:688d:b0:9e2:c2a6:5c86 with SMTP id n13-20020a170906688d00b009e2c2a65c86mr12952703ejr.35.1700220697262;
        Fri, 17 Nov 2023 03:31:37 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id v12-20020a1709060b4c00b009b928eb8dd3sm678128ejg.163.2023.11.17.03.31.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Nov 2023 03:31:36 -0800 (PST)
Message-ID: <ebe24400-39d0-44be-8a25-d69f26e64e64@redhat.com>
Date:   Fri, 17 Nov 2023 12:31:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 13/17] platform/x86/amd/pmf: Add PMF-AMDGPU get
 interface
Content-Language: en-US, nl
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com,
        jikos@kernel.org, benjamin.tissoires@redhat.com
Cc:     Patil.Reddy@amd.com, mario.limonciello@amd.com,
        platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org,
        "Koenig, Christian" <Christian.Koenig@amd.com>,
        "Deucher, Alexander" <Alexander.Deucher@amd.com>
References: <20231117080747.3643990-1-Shyam-sundar.S-k@amd.com>
 <20231117080747.3643990-14-Shyam-sundar.S-k@amd.com>
 <80b8c5fe-e81b-4e05-bf21-19351c51d767@redhat.com>
 <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <e4811bf6-2387-42a1-ae8e-7af172d6a97c@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/17/23 12:08, Shyam Sundar S K wrote:
> Adding AMDGPU folks (Alex and Christian) - I had to drop them as the
> changes from amdgpu were moved to PMF driver.
> 
> Hi Hans,
> 
> 
> On 11/17/2023 4:18 PM, Hans de Goede wrote:
>> Hi Shyam,
>>
>> On 11/17/23 09:07, Shyam Sundar S K wrote:
>>> In order to provide GPU inputs to TA for the Smart PC solution to work, we
>>> need to have interface between the PMF driver and the AMDGPU driver.
>>>
>>> Add the initial code path for get interface from AMDGPU.
>>>
>>> Co-developed-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
>>> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

<snip>

>>> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
>>> index 81b1bd356e83..82ee2b1c627f 100644
>>> --- a/drivers/platform/x86/amd/pmf/tee-if.c
>>> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
>>> @@ -10,6 +10,7 @@
>>>  
>>>  #include <linux/debugfs.h>
>>>  #include <linux/tee_drv.h>
>>> +#include <linux/thermal.h>
>>>  #include <linux/uuid.h>
>>>  #include "pmf.h"
>>>  
>>> @@ -422,6 +423,60 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>>>  	tee_client_close_context(dev->tee_ctx);
>>>  }
>>>  
>>> +static int amd_pmf_gpu_get_cur_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	*state = backlight_get_brightness(bd);
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static int amd_pmf_gpu_get_max_state(struct thermal_cooling_device *cooling_dev,
>>> +				     unsigned long *state)
>>> +{
>>> +	struct backlight_device *bd;
>>> +
>>> +	if (acpi_video_get_backlight_type() != acpi_backlight_native)
>>> +		return -ENODEV;
>>> +
>>> +	bd = backlight_device_get_by_type(BACKLIGHT_RAW);
>>> +	if (!bd)
>>> +		return -ENODEV;
>>> +
>>> +	if (backlight_is_blank(bd))
>>> +		*state = 0;
>>> +	else
>>> +		*state = bd->props.max_brightness;
>>> +
>>> +	return 0;
>>> +}
>>> +
>>> +static const struct thermal_cooling_device_ops bd_cooling_ops = {
>>> +	.get_max_state = amd_pmf_gpu_get_max_state,
>>> +	.get_cur_state = amd_pmf_gpu_get_cur_state,
>>> +};
>>
>> This is still the wrong thing to do. The new PMF code MUST only
>> be a *consumer* of the thermal_cooling_device API.
>>
>> The thermal-cooling device for the backlight itself MUST be
>> registered by the amdgpu driver.
>>
>> I believe that the correct fix for this is to add a new flag to
>> the backlight_properties struct;
>> And then make backlight_device_register() register
>> a thermal_cooling_device for the backlight when this new flag is set.
>>
>> This way we get a nice generic way to use backlight class devices
>> as thermal cooling devices and you can make the amdgpu driver
>> register the thermal cooling device by simply adding the new flag
>> to the backlight_properties struct used in the amdgpu driver.
> 
> Agreed. I am also of the same opinion.

So the change to the AMDGPU driver here would just be setting
this one new flag in the backlight_properties struct.

Alex, Christian, would that be acceptable to you ?


>>> +static int amd_pmf_get_gpu_handle(struct pci_dev *pdev, void *data)
>>> +{
>>> +	struct amd_pmf_dev *dev = data;
>>> +
>>> +	if (pdev->vendor == PCI_VENDOR_ID_ATI && pdev->devfn == 0) {
>>> +		dev->gfx_data.gpu_dev = pdev;
>>> +		return 1; /* Stop walking */
>>> +	}
>>> +
>>> +	return 0; /* Continue walking */
>>> +}
>>> +
>>>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>  {
>>>  	int ret;
>>> @@ -433,10 +488,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>>>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>>>  	amd_pmf_set_dram_addr(dev);
>>>  	amd_pmf_get_bios_buffer(dev);
>>> +
>>>  	dev->prev_data = kzalloc(sizeof(*dev->prev_data), GFP_KERNEL);
>>>  	if (!dev->prev_data)
>>>  		return -ENOMEM;
>>>  
>>> +	pci_walk_bus(dev->root->bus, amd_pmf_get_gpu_handle, dev);
>>> +	if (dev->gfx_data.gpu_dev) {
>>> +		dev->drm_dev = pci_get_drvdata(dev->gfx_data.gpu_dev);
>>> +		if (!dev->drm_dev)
>>> +			return -EINVAL;
>>
>> You cannot just call pci_get_drvdata() on a device for which you
>> are not the driver. You have no idea of the lifetime of this device,
>> the driver may unbind and release the memory pci_get_drvdata()
>> points to, leaving this code with a dangling pointer which will
>> crash the kernel the first time you try to use it.
>>
>> Also since you are not the owner you MUST not assume any specific
>> type for this memory, you cannot be sure this actually is of
>> the type drm_device. Basically you MUST not touch another
>> driver's drvdata *at all*.
>>
>> The proper way to fix this would be to add some API to the DRM
>> subsystem to query the information you are looking for form
>> the DRM subsystem.
>>
>> Poking directly inside other driver's internals is NOT acceptable,
>> NACK for this patch.
>>
> 
> I am inline with your remarks, but I could find a way where the
> thermal driver registration, handling the backlight without having the
> changes in the amdgpu driver very tricky.

As mentioned above I think there should be generic thermal cooling
device support added to drivers/video/backlight/backlight.c, then
the amdgpu code just needs to pass a flag when registering
the backlight to enable this.

> Like you said, I am also of the same opinion that PMF driver should
> call the DRM/GPU subsystem APIs (like it does with other subsystems).
> 
> But Christian had concerns on adding all of these into the GPU driver.
> So I had to roll back these into the PMF driver, and hence you see a
> pci_get_drvdata() call.

Ok, so I can see how this AMD PMF code is all kinda special
and how the DRM folks don't want to have to add APIs just for
that. But IMHO calling pci_get_drvdata() on an unowned
device is completely unacceptable.

At a minimum we need life-cycle management for the drm_device
which the PMF code is using, something like:

struct drm_device *drm_device_find(const void *data,
   int (*match)(struct drm_device *dev, const void *data));

which works similar to class_find_device() and returns
a reference to the drm_device for which match has returned 0
(which also stops it from looping over devices).

Combined with a:

void drm_device_put(struct drm_device *dev);

for when the PMF code is done with the device.

This way the PMF code can safely get a reference to drm_device
and release it when it is done. Rather then just getting
some random pointer which may or not actually be a drm_device
and the lifetime of which is not guaranteed in anyway.

E.g. if the PMF driver loads before amdgpu then
pci_get_drvdata() will just return NULL.

And as mentioned if the amdgpu driver gets unbound after
the PMF code has called  pci_get_drvdata() the PMF driver
now has a dangling pointer.

So IMHO adding: drm_device_find() + drm_device_put()
to the DRM core are minimum which is necessary here.

If the PMF code then ends up doing things like
drm_for_each_connector_iter() on the gotten drm_device
referemce so be it. But we must make sure we have
a properly lifecycle managed reference first and
pci_get_drvdata() does not give us that.

> For the sake of simplicity, I can drop patches 13/17 and 14/17 from
> the series and send them separately later.

Yes I think that dropping the GPU related patches for
now would be best.

Regards,

Hans




