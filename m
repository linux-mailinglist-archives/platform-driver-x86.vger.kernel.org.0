Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3602D62DD7C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Nov 2022 15:03:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240160AbiKQODA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Nov 2022 09:03:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240101AbiKQOC4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Nov 2022 09:02:56 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C337240916
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 06:01:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668693719;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=qVerHlGBTcU6VxEyDbbP9m6atBo8xVhYwqwi4Apy7QY=;
        b=Mwt1dCNL7A4YAwbZAdqcgL0ZZ0aKX8x6gqlTgDRvzdTEnWJqRv81LqPYCJsO4dAR8iq8Ev
        r7xPMhEI/Zgcj6Dr1EXgQHc8JyeHGJTpEPGz0KTsGSVoAm//PDekNVqKveMnpQlYkIj7rb
        puFSMVdvOjo6ZJVTm0+045wfiOqAYCM=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-475-WKdwKcD6OGSicMVmJ8Tnhw-1; Thu, 17 Nov 2022 09:01:57 -0500
X-MC-Unique: WKdwKcD6OGSicMVmJ8Tnhw-1
Received: by mail-ed1-f69.google.com with SMTP id e15-20020a056402190f00b00461b0576620so1276182edz.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 17 Nov 2022 06:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qVerHlGBTcU6VxEyDbbP9m6atBo8xVhYwqwi4Apy7QY=;
        b=zrcQLZWTgNpW4G3uHS9xIpKM+WfRPgPruxK4LfNKiG6hwx19x2R/q5db/qocBCZo4N
         2gXhM1HwciDHVSKWaaZN458+poW1kAKNCW4hI6MyYqOH+vBMD5TMIg2vU00xP52UJsxP
         amY/hK7wpVoY4UXseXgtAhsHBMjekLXLgZCeQI/xE6D0LwOQQ2tNbytWKS10vMhewOke
         eodUgYolKkqbhqFTOgjNxnQSSJM8I/nVGB4/FpHrYToq4SgWX7nVHJBbojFMGC4Y7bov
         N8LQO9rv8WqQ5YdIjhMpCEJIw6gNm0xmjA8Xt0iJCAv4U4hmINUfZn3R8VqTpRDKBmL5
         DCsg==
X-Gm-Message-State: ANoB5pmmiKxyx4SGODwqSgDSjOP40exlVg0tswuhU7Ds/MUtslKam2zl
        5yiXVSHy3jI5FFcfOOKJF48yLwIo66Y3/tqCUIEt8YmCaOl+Fpc1NI+MkrKuQk7MxwuStwIwJOy
        1lPG1fwNGE+SbCe9/nSr9rMVi6sJyyPtNfQ==
X-Received: by 2002:a05:6402:2d6:b0:461:8efb:3f84 with SMTP id b22-20020a05640202d600b004618efb3f84mr2251908edx.210.1668693714637;
        Thu, 17 Nov 2022 06:01:54 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4p4VFzcRuLpjxSxAwfOnJBCndcIjNQLs3EtUaIqkL62sgB7jIdtINShELBOUgcD9IsvR2iXA==
X-Received: by 2002:a05:6402:2d6:b0:461:8efb:3f84 with SMTP id b22-20020a05640202d600b004618efb3f84mr2251841edx.210.1668693713878;
        Thu, 17 Nov 2022 06:01:53 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id f4-20020a17090631c400b00730bfe6adc4sm416785ejf.37.2022.11.17.06.01.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Nov 2022 06:01:53 -0800 (PST)
Message-ID: <267ebc83-04a8-4421-732d-7a329bc0fa9a@redhat.com>
Date:   Thu, 17 Nov 2022 15:01:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH 0/9] Extend Intel On Demand (SDSi) support
Content-Language: en-US, nl
To:     "David E. Box" <david.e.box@linux.intel.com>, markgross@kernel.org,
        andriy.shevchenko@linux.intel.com, srinivas.pandruvada@intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20221101191023.4150315-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20221101191023.4150315-1-david.e.box@linux.intel.com>
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

Hi David,

On 11/1/22 20:10, David E. Box wrote:
> Intel Software Defined Silicon (SDSi) is now known as Intel On Demand. The
> following patches do the following:
> 
> 1. Identify the driver/tools as Intel On Demand. Only text descriptions are
> changed. Kconfig and filenames remain the same.
> 2. Perform some attribute cleanup by preventing the showing of files when
> features are not supported.
> 3. Adds support for a new GUID. GUIDs are used to identify the layout of
> the On Demand registers in sysfs. Layouts are described in the
> documentation on github [1].
> 4. Add support for reading On Demand meter certificates in sysfs.
> 5. The rest of the patches modify the existing tool to support discovery
> and reading of On Demand registers and the meter certificate.
> 
> [1] https://github.com/intel/intel-sdsi/blob/master/os-interface.rst
> 
> David E. Box (9):
>   platform/x86/intel/sdsi: Add Intel On Demand text
>   platform/x86/intel/sdsi: Hide attributes if hardware doesn't support
>   platform/x86/intel/sdsi: Support different GUIDs
>   platform/x86/intel/sdsi: Add meter certificate support
>   tools/arch/x86: intel_sdsi: Add support for reading state certificates
>   tools/arch/x86: intel_sdsi: Add Intel On Demand text
>   tools/arch/x86: intel_sdsi: Read more On Demand registers
>   tools/arch/x86: intel_sdsi: Add support for new GUID
>   tools/arch/x86: intel_sdsi: Add support for reading meter certificates

Thank you, over all this looks good. I have some small remarks
on patches 4, 8 and 9 see my replies to those.

Please prepare a v2 addressing Andy's + my review remarks and get
that v2 to me no later then next week Tuesday, then I can still
merge this in time for 6.2 .

Regards,

Hans


