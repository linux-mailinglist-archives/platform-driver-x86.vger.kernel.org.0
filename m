Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 22B1D64D9C0
	for <lists+platform-driver-x86@lfdr.de>; Thu, 15 Dec 2022 11:51:10 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiLOKvH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 15 Dec 2022 05:51:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229883AbiLOKu7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Dec 2022 05:50:59 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 98A472BB06
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Dec 2022 02:50:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1671101418;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kCZgxpAhiu7fauhgJnZ8AJ3pc86gTWLBdMsMOm0YxIY=;
        b=GVwOv7vzXHoShW95BlmlTCt4RT4EUq2KBiPkBmO+8nDf+u8qXLMmiWErlyRxTGjO1e8yLD
        dBJrvl+AHXkbA4op6frxCLqUOP3XE5lpsMXFp7A71JOotdZzMzj81ehG8v6e3hBeno1EeL
        JtnYptoQjvXwgY5tp2JtSmewgZ7RHwU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-357-rHXUMmBRN1C9xYg9UIzWug-1; Thu, 15 Dec 2022 05:50:16 -0500
X-MC-Unique: rHXUMmBRN1C9xYg9UIzWug-1
Received: by mail-ed1-f72.google.com with SMTP id y10-20020a056402358a00b0046fc5125069so8256692edc.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 15 Dec 2022 02:50:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kCZgxpAhiu7fauhgJnZ8AJ3pc86gTWLBdMsMOm0YxIY=;
        b=T6+dHrKT7xMuOeG7/azaW26FtSy2yIQ2kBJRsJsmIih1WFWCtqCqQ6oYvXa710v4FE
         E+s6o5wTYrV3bjNRqv8YxVmk9bjIXa9nmVGBqgFs4yyZwlXoApCeT1L62rF60rvBAGh+
         DRDkubrmdsVWBidsZWlMQQJRhpIfk31lxuGJ/G2GZSCMBxf3+7m0xMbXjhah6YGRJb6d
         4AKctZgqKRNjCpNvAOlFqnaqrswfY+X529V8MYwo/aVD0bRjkzJQVzR9oZt6FONbTiB1
         BH9EH+9/Lxxzv9VHHyY42OER3fGN+JCh52hB7FJXPO+sGoSpVYBs8hs+og8MTiYUuwR5
         fiHg==
X-Gm-Message-State: ANoB5pnxztLj4UUSeywKRLjr9PmgRf1OAsdfoY6mMQRb1rQ39U+os1bN
        ekAVFk87Xz9aEZA63e0VC04pub0Pegq5er+NYpULfq6aVIz7AG6Wb3kthAlkPWEcHpuJ3M2YNWO
        JVLTCtv0+gXwvA3udnVQuQ4DFLQCMgqLLpA==
X-Received: by 2002:a17:907:c716:b0:7c0:e7a7:50b with SMTP id ty22-20020a170907c71600b007c0e7a7050bmr24501738ejc.48.1671101415686;
        Thu, 15 Dec 2022 02:50:15 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5WTGKfBMJkuXuP0BxBhnZFbECPHzQDA21bLuyNW+0VyN//7egnOdkVKzAiay1JP2Zpdbjn7A==
X-Received: by 2002:a17:907:c716:b0:7c0:e7a7:50b with SMTP id ty22-20020a170907c71600b007c0e7a7050bmr24501726ejc.48.1671101415446;
        Thu, 15 Dec 2022 02:50:15 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id me15-20020a170906aecf00b007c00323cc23sm6899238ejb.27.2022.12.15.02.50.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 Dec 2022 02:50:14 -0800 (PST)
Message-ID: <86820d40-cb99-76c7-c0c9-d1b6e1c8f053@redhat.com>
Date:   Thu, 15 Dec 2022 11:50:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH] ACPI: video: Fix Apple GMUX backlight detection
Content-Language: en-US, nl
To:     Lukas Wunner <lukas@wunner.de>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        linux-acpi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        Aditya Garg <gargaditya08@live.com>
References: <20221215094138.7120-1-hdegoede@redhat.com>
 <20221215102211.GA5147@wunner.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221215102211.GA5147@wunner.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Lukas,

On 12/15/22 11:22, Lukas Wunner wrote:
> On Thu, Dec 15, 2022 at 10:41:38AM +0100, Hans de Goede wrote:
>> The apple-gmux driver only binds to old GMUX devices which have an
>> IORESOURCE_IO resource (using inb()/outb()) rather then memory-mapped
>> IO (IORESOURCE_MEM).
>>
>> T2 MacBooks use the new style GMUX devices (with IORESOURCE_MEM access),
>> so these are not supported by the apple-gmux driver. This is not a problem
>> since they have working ACPI video backlight support.
> 
> Interesting.
> 
> 
>> +static bool apple_gmux_backlight_present(void)
>> +{
>> +	struct acpi_device *adev;
>> +	struct device *dev;
>> +
>> +	adev = acpi_dev_get_first_match_dev(GMUX_ACPI_HID, NULL, -1);
>> +	if (!adev)
>> +		return false;
>> +
>> +	dev = acpi_get_first_physical_node(adev);
>> +	if (!dev)
>> +		return false;
>> +
>> +	/*
>> +	 * drivers/platform/x86/apple-gmux.c only supports old style
>> +	 * Apple GMUX with an IO-resource.
>> +	 */
>> +	return pnp_get_resource(to_pnp_dev(dev), IORESOURCE_IO, 0) != NULL;
>> +}
> 
> The T2 is represented by a PCI device with ID 106B:1802.
> 
> Instead of the above, how about amending apple_gmux_present()
> with a simple check like this:
> 
> 	/* T2 Macs drive GMUX via MMIO, which is unsupported for now */
> 	if (pci_dev_present({{PCI_DEVICE(PCI_VENDOR_ID_APPLE, 0x1802)}, {}}))
> 		return false;

Where ever possible I prefer to have the same checks in video_detect.c
as the actual backlight driver uses and:

drivers/platform/x86/apple-gmux.c

refuses to bind because the pnp_get_resource(to_pnp_dev(dev), IORESOURCE_IO, 0)
call fails. So IMHO it is better to do the same thing in video_detect.c .

Specifically likely more then 1 model of MacBook is affected and doing
the same check as apple-gmux.c does will catch them all, while an
(PCI) id based approach often turns into a game of whack-a-mole.

Also changing apple_gmux_present() itself impacts more callers then
just the drivers/acpi_video_detect.c code.

Specifically drivers/gpu/drm/nouveau/nouveau_backlight.c and
drivers/gpu/vga/vga_switcheroo.c also call this function.

And at least in the nouveau case where the check looks like this:

        if (apple_gmux_present()) {
                NV_INFO_ONCE(drm, "Apple GMUX detected: not registering Nouveau backlight interface\n");
                return 0;
        }

Not registering the GPU/native backlight device is the right thing to
do on the models with the new GMUX too, since native backlight control
won't work there either.

And I don't know about the check in vga_switcheroo.c. The goal of this
patch is to fix the 6.1 regression introduced by adding
a apple_gmux_present() to video_acpi.c and in its current form it
fixes that regression without introducing any behavioral changes
elsewhere, which seems best for a regressions fix which is intended
to be backported to 6.1 .

Regards,

Hans


p.s.

The nouveau driver not registering its native backlight is actually something
which the amdgpu driver gets wrong, it registers a non working amdgpu_bl0 on
the laptop Aditya ran their tests on. Starting with 6.2 however amdgpu will
honor the return value of acpi_video_get_backlight_type()
(on x86/ACPI platforms).

So the non working amdgpu_bl0 should disappear with 6.2, as long as we get
acpi_video_get_backlight_type() to return the right type, which it does after
this patch (it returns acpi_backlight_video after this patch).

