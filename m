Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1C1265EF621
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Sep 2022 15:12:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234999AbiI2NMp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 29 Sep 2022 09:12:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235055AbiI2NMn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 29 Sep 2022 09:12:43 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04D58D5746
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 06:12:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664457162;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sGV7gRgiiPI1k1Jo3uPIhv9Soar3LJZC+jfEve4dDB4=;
        b=fOQoF9MUoRGLwx3SbCgOCqeOHEmiILMYlI1YESK8xAA++hcHoFfFDfhh73F7tP/fCJkURW
        Xzyjb1SfyjqCPeLMOPhQ0r5N4ilDreIsdCqZ5eSU+03RM6Yfo/kDoJJVdb2CR4tPWxnlTW
        jBF4TujEYQGS9MjSnTfxWiVw2jKUPdE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-617-YY2VzKIaPqmocOpt3WNoyA-1; Thu, 29 Sep 2022 09:12:41 -0400
X-MC-Unique: YY2VzKIaPqmocOpt3WNoyA-1
Received: by mail-ed1-f69.google.com with SMTP id f18-20020a056402355200b0045115517911so1253158edd.14
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Sep 2022 06:12:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=sGV7gRgiiPI1k1Jo3uPIhv9Soar3LJZC+jfEve4dDB4=;
        b=OCtyWt87Z91vIK4c3cFHu/IpHAop0rWPK7Ur4GlpAnBUyRkHJZGHnGiQaz0MD7HioJ
         yeohdztGp7HCUoIvcQgHdYl2X1GDAgZhlx93dXMCzbUzW+WcqUuTPrAMp6oo/5p8I3yE
         /FScEbZSo9jyqr+L36uMSIzjgCCaP5H4jkWcxY7i12zkKe6Euh1fPHyRck8sAJCd82n3
         Iyh5PA6IAujdS2UE+CCgR8r+jXMWLCHbbYwVgSWZXYnhly/6IGOaumIlnowOR0UMSFRT
         PnBAiiAQpAwPHQ0MkoNDmoReJUQ5U3gSZ5b8uHpUszgjsDW5SyqjqtE1wqDwTHyJLKjr
         6dmQ==
X-Gm-Message-State: ACrzQf2LGifqkk3OH8gselv+gV4HsGWMzQnJWssKsfhWvQNaI5tgognK
        d2n2WAr/bXm+H4srpSwtzVHAFyFnktY8GrvtWko6lpHp0h32HTxA0W4pWMAZXwFK2EG9JoFp0Wy
        NbUV+AxP24LPu9X3YsmvtjuIKSE1yL9Il9A==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr3489024edb.142.1664457158894;
        Thu, 29 Sep 2022 06:12:38 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4i8Bd1r6kPqSNUiT6wX+4QVZC5MQ19zMfiNEaHT3xYTG+5e3c2Nvv8nvOcg1gUgYoS7xPpSg==
X-Received: by 2002:a05:6402:d05:b0:425:b7ab:776e with SMTP id eb5-20020a0564020d0500b00425b7ab776emr3488995edb.142.1664457158636;
        Thu, 29 Sep 2022 06:12:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id s10-20020aa7c54a000000b0045723aa48ccsm5439046edr.93.2022.09.29.06.12.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Sep 2022 06:12:38 -0700 (PDT)
Message-ID: <bf84f13d-f76a-c0ac-8a1f-f4e1b55e6f51@redhat.com>
Date:   Thu, 29 Sep 2022 15:12:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v2 2/2] platform/x86: dell: Add new dell-wmi-ddv driver
To:     Andy Shevchenko <andriy.shevchenko@intel.com>,
        Armin Wolf <W_Armin@gmx.de>
Cc:     markgross@kernel.org, rafael@kernel.org, lenb@kernel.org,
        hmh@hmh.eng.br, matan@svgalib.org, corentin.chary@gmail.com,
        jeremy@system76.com, productdev@system76.com,
        mario.limonciello@amd.com, pobrn@protonmail.com,
        coproscefalo@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220927204521.601887-1-W_Armin@gmx.de>
 <20220927204521.601887-3-W_Armin@gmx.de>
 <YzQmQw0hEwzXV/iz@smile.fi.intel.com>
 <34774c9d-1210-0015-f78e-97fdf717480c@gmx.de>
 <YzVqbSBHm3OrjIaQ@smile.fi.intel.com>
Content-Language: en-US, nl
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <YzVqbSBHm3OrjIaQ@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-7.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/29/22 11:50, Andy Shevchenko wrote:
> On Wed, Sep 28, 2022 at 10:57:16PM +0200, Armin Wolf wrote:
>> Am 28.09.22 um 12:47 schrieb Andy Shevchenko:
>>> On Tue, Sep 27, 2022 at 10:45:21PM +0200, Armin Wolf wrote:
> 
> ...
> 
>>>> +static void dell_wmi_ddv_debugfs_init(struct wmi_device *wdev)
>>> Strictly speaking this should return int (see below).
>>>
>>>> +{
>>>> +	struct dentry *entry;
>>>> +	char name[64];
>>>> +
>>>> +	scnprintf(name, ARRAY_SIZE(name), "%s-%s", DRIVER_NAME, dev_name(&wdev->dev));
>>>> +	entry = debugfs_create_dir(name, NULL);
>>>> +
>>>> +	debugfs_create_devm_seqfile(&wdev->dev, "fan_sensor_information", entry,
>>>> +				    dell_wmi_ddv_fan_read);
>>>> +	debugfs_create_devm_seqfile(&wdev->dev, "thermal_sensor_information", entry,
>>>> +				    dell_wmi_ddv_temp_read);
>>>> +
>>>> +	devm_add_action_or_reset(&wdev->dev, dell_wmi_ddv_debugfs_remove, entry);
>>> return devm...
>>>
>>> This is not related to debugfs and there is no rule to avoid checking error
>>> codes from devm_add_action_or_reset().
>>>
>> According to the documentation of debugfs_create_dir(), drivers should work fine if debugfs
>> initialization fails. Thus the the return value of dell_wmi_ddv_debugfs_init() would be ignored
>> when called, which means that returning an error would serve no purpose.
>> Additionally, devm_add_action_or_reset() automatically executes the cleanup function if devres
>> registration fails, so we do not have to care about that.
> 
> The problem with your code that if devm_ call fails and you ain't stop probing
> the remove-insert module (or unbind-bind) cycle will fail, because of existing
> (leaked) debugfs dentries.

No it won't if the devm_ call fails then it will directly call
the passed in handler so in this case we can simply continue
without debugfs entries (which will have been removed by the
handler). The directly calling of the action handler on
failure is the whole difference between devm_add_action()
and devm_add_action_or_reset()
 
So using it this way in the case of a debugfs init function
is fine.

>>>> +		.name = DRIVER_NAME,
>>> I would use explicit literal since this is a (semi-) ABI, and having it as
>>> a define feels not fully right.
>>
>> The driver name is used in two places (init and debugfs), so having a define for it
>> avoids problems in case someone forgets to change both.
> 
> Which is exactly what we must prevent developer to do. If changing debugfs it
> mustn't change the driver name, because the latter is ABI, while the former is
> not.

Arguably both are not really ABI. Drivers have been renamed in the past
without issues for userspace.

Regards,

Hans

