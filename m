Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5867567E331
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 Jan 2023 12:26:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229873AbjA0L0z (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 27 Jan 2023 06:26:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230201AbjA0L0T (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Jan 2023 06:26:19 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DC4E80018
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 03:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1674818609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8GYD9dewhKbkLBPMt9Sg1bsscDuKNxNoUkAJ2rK2GhQ=;
        b=i0ZaBhPJmkapK8ElUZVO4nS3LFwqULI37Zq4IOyYjVb7c20ZTB+O9ywCrbIu6AXWVxM3bh
        imav/4jUDqjTa/0nctD1UBfnmrDOOaSwmSkkZ2EotOBCTa6CpgvTZyHJLMlMCcX1rnQvgs
        YSIC7OnSCS1ebyLjqh303qM4z3oDT5Q=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-561-w_3af1yBN-SR3gaGNV75mQ-1; Fri, 27 Jan 2023 06:23:20 -0500
X-MC-Unique: w_3af1yBN-SR3gaGNV75mQ-1
Received: by mail-ed1-f72.google.com with SMTP id m12-20020a056402430c00b0049e4ac58509so3384278edc.16
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Jan 2023 03:23:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8GYD9dewhKbkLBPMt9Sg1bsscDuKNxNoUkAJ2rK2GhQ=;
        b=s3F1t72biyz2CMi134hpgcjBBhO77sVx2t+wvonVSFk/7ngZ4U8BswWnRKcRBxTosN
         bQSSlrRDmrqkPEzFet7OwTwHIptxipWLwt2cLoN1aC0HhfcvycMEHZJnrOasKXAT768L
         /cTo/BCfoe8KIS0QdFnn6NA7e6RsZjArW1FAKn2GpR5pFE34TBXNmYXZG6eFVTUIVXoH
         7Vt3L+TTudKJcIcdD7pdb2/wgp8BJlq7E7okSPh8K9HhxF1aqLZbDBqNKHifstRZl84h
         ltwUr67DezgKaVeQEnkjKuemhaRLsjDFtVogd1OfzyNhF5xbRLWezaYA8CmNT0wXouFy
         7BXQ==
X-Gm-Message-State: AFqh2krqChd118y4levY+f6r5qVdy5lt+agRHdt7DpgdWcXAwF6bocF4
        7fR6+/LkQddYex3CehgbwSSJyqn6YnTSOi9atwu57/1+0f2Ci8RrFRykQBo8EIhlOcUOwlnm3Vy
        E4pCvh7BTSU18DI7lYnvJD42N2ErD9l0OiQ==
X-Received: by 2002:aa7:c619:0:b0:49e:6e34:c363 with SMTP id h25-20020aa7c619000000b0049e6e34c363mr32785752edq.35.1674818599105;
        Fri, 27 Jan 2023 03:23:19 -0800 (PST)
X-Google-Smtp-Source: AMrXdXsWnMtgBeEO7GOyUN7lFSPJGex2RLSPMjdl0f/6wOqIkv1rjbufuoCmG4Ys76U9H6/PODMqKw==
X-Received: by 2002:aa7:c619:0:b0:49e:6e34:c363 with SMTP id h25-20020aa7c619000000b0049e6e34c363mr32785732edq.35.1674818598888;
        Fri, 27 Jan 2023 03:23:18 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id ca18-20020aa7cd72000000b00495f4535a33sm2166956edb.74.2023.01.27.03.23.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 03:23:18 -0800 (PST)
Message-ID: <01f168b6-4801-f654-7e1b-7d8df525b867@redhat.com>
Date:   Fri, 27 Jan 2023 12:23:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v5 00/11] leds: lookup-table support + int3472/media
 privacy LED support
Content-Language: en-US, nl
To:     Lee Jones <lee@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>, Pavel Machek <pavel@ucw.cz>,
        Linus Walleij <linus.walleij@linaro.org>,
        Daniel Scally <djrscally@gmail.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        linux-gpio@vger.kernel.org, Kate Hsuan <hpa@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Andy Yeh <andy.yeh@intel.com>, Hao Yao <hao.yao@intel.com>,
        linux-media@vger.kernel.org
References: <20230120114524.408368-1-hdegoede@redhat.com>
 <Y9Owocyg9eJaJ9Zv@google.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <Y9Owocyg9eJaJ9Zv@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/27/23 12:08, Lee Jones wrote:
> On Fri, 20 Jan 2023, Hans de Goede wrote:
> 
>> Hi All,
>>
>> Here is version 5 of my series to adjust the INT3472 code's handling of
>> the privacy LED on x86 laptops with MIPI camera(s) so that it will also
>> work on devices which have a privacy-LED GPIO but not a clk-enable GPIO
>> (so that we cannot just tie the LED state to the clk-enable state).
>>
>> Changes in v5:
>> - Rename lookup-table names to match those from the gpio and reset lookups:
>>   s/led_name/provider/
>>   s/consumer_dev_name/dev_id/
>>   s/consumer_function/con_id/
>> - Add static inline wrappers for the v4l2_async debugfs init/exit funcs,
>>   to fix build errors when CONFIG_V4L2_ASYNC is not enabled
>>
>> Changes in v4:
>> - Rename new __led_get() helper to led_module_get()
>> - Drop of/devicetree support from "led-class: Add generic [devm_]led_get()"
>> - Add RFC patch to re-add of/devicetree support to show that the new
>>   led_get() can easily be extended with dt support when the need for this
>>   arises (proof-of-concept dt code, not intended for merging)
>> - New patch to built async and fwnode code into videodev.ko,
>>   to avoid issues with some of the new LED code getting builtin vs
>>   other parts possibly being in a module
>> - Move the led_get() call to v4l2_async_register_subdev_sensor()
>> - Move the led_disable_sysfs() call to be done at led_get() time
>> - Address some other minor review comments
>>
>> Changes in v3:
>> - Due to popular request by multiple people this new version now models
>>   the privacy LED as a LED class device. This requires being able to
>>   "tie" the LED class device to a specific camera sensor (some devices
>>   have multiple sensors + privacy-LEDs).
>>
>> Patches 1-5 are LED subsystem patches for this. 1 is a bug fix, 2-4 add
>> the new [devm_]led_get() functions. Patch 5 is the RFC patch adding dt
>> support to led_get() and is not intended for merging.
>>
>> Patch 6 + 7 add generic privacy-LED support to the v4l2-core/v4l2-subdev.c
>> code automatically enabling the privacy-LED when s_stream(subdev, 1)
>> is called. So that we don't need to add privacy-LED code to all the
>> camera sensor drivers separately (as requested by Sakari).
>>
>> Patches 8-11 are patches to the platform specific INT3472 code to register
>> privacy-LED class devices + lookup table entries for privacy-LEDs described
>> in the special INT3472 ACPI nodes found on x86 devices with MIPI cameras.
>>
>> Assuming at least the LED maintainers are happy with the approach suggested
>> here, the first step to merging this would be to merge patches 1-4 and then
>> provide an immutable branch with those to merge for the other subsystems
>> since the other changes depend on these.
> 
> LEDs pull request to follow.

Great, thank you!

Regards,

Hans



