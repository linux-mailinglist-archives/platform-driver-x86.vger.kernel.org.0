Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5512A4AF163
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Feb 2022 13:23:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231364AbiBIMXL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Feb 2022 07:23:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231229AbiBIMXK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Feb 2022 07:23:10 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id D5479C05CB97
        for <platform-driver-x86@vger.kernel.org>; Wed,  9 Feb 2022 04:23:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1644409393;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=K+6PWsGdUf8zUOs8GBfqgo0vxHAQpf/usivbTTkeWH4=;
        b=Bod22PA0lr4/o+NAUx0mNvT3BMbAlQtDACPlaRdScsFQw6dnSAeAGd2vOTpjFXfMJuQEjo
        W5VlmLxwdpBJox3cWhiMgbAKUvHOnnYnclkmFGQaUQJYOOBhPLMKGfRgX4qq5r3b2Dfka0
        16k1lE8hiQirSiS6SEetidqSGCT4u3s=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-606-d9ZYg6M8PxK5zcunuG04PQ-1; Wed, 09 Feb 2022 07:23:11 -0500
X-MC-Unique: d9ZYg6M8PxK5zcunuG04PQ-1
Received: by mail-ed1-f71.google.com with SMTP id en7-20020a056402528700b00404aba0a6ffso1272654edb.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Feb 2022 04:23:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=K+6PWsGdUf8zUOs8GBfqgo0vxHAQpf/usivbTTkeWH4=;
        b=JJ1P3FQWnpADwsi5YLhzA+VNWdrHFb11PkCuI+r7T8HmLTZey3V1AaMwkVQCHm1Mcf
         RyG6ZxgzdhtI3kxLJI3FdGEDZX2nG+XbcWVSKss5iXyjYk5QPUa/AXwLK+zIFvyN4fIu
         p6tPANUp3hwHBsWR/h2tD5inn4iWrtH5NYQ5JkGGWQP5cbBInq0GbDrpMPb24A/XTSOb
         MeexSDIQ5NFpxLzSBkFyejItUVKiNlPudUCOv+wTa3jC0L7+xNvowqvl3UAu0Uhd2foX
         C3GLw9et/2QcIgjIhOwtuCj5FrUO3lUWM8iDVYwlzDVr0UaaN4uOyou/Cr7J2JZUBjiM
         uuOA==
X-Gm-Message-State: AOAM530AXkeQTJOpYxc8wZPruAonyEU+TQyc1jKJmUxK4etIW0eGVMHP
        J6Y2x8fIWAsD3uKpmEYLGLAWiXLJPWRyVF3RU/O2wjajyCJe4g51YVRgxMg9nh+JeOvaJfRq9Ap
        TfB/93jdhOyZM0/yaGNZ3TeaI32I94wRq7A==
X-Received: by 2002:a05:6402:3511:: with SMTP id b17mr2149874edd.244.1644409390708;
        Wed, 09 Feb 2022 04:23:10 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ/hfZU/BxlpmKWPkXSArvzhAgBWjPCtIAUeEH6X8cdLOH821uUrxlHcA8MMYrtsH8t+7qBA==
X-Received: by 2002:a05:6402:3511:: with SMTP id b17mr2149856edd.244.1644409390512;
        Wed, 09 Feb 2022 04:23:10 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id s6sm2312550ejc.206.2022.02.09.04.23.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Feb 2022 04:23:10 -0800 (PST)
Message-ID: <4732c476-f380-196f-6f37-a5c3c749dd4e@redhat.com>
Date:   Wed, 9 Feb 2022 13:23:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH V6 0/3] Intel Software Defined Silicon
Content-Language: en-US
To:     "David E. Box" <david.e.box@linux.intel.com>,
        gregkh@linuxfoundation.org, andriy.shevchenko@linux.intel.com,
        srinivas.pandruvada@intel.com, mgross@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20220208005444.487209-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220208005444.487209-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

On 2/8/22 01:54, David E. Box wrote:
> This series adds support for Intel Software Defined Silicon. These
> patches are the same as patches 4-6 from this series [1]. Patches 1-3 
> of that series were pulled in during the 5.17 merge window.
> 
> [1] https://lore.kernel.org/lkml/20211216023146.2361174-1-david.e.box@linux.intel.com/T/

Thank you for taking all the feedback from others into account
and doing new versions.

I was planning on doing an in-depth / foll review of this
today, but unfortunately a kernel regression somewhere else
has popped up and that is going to soak up all me work/$dayjob
time this week, sorry.

Assuming no major issues are found, the plan definitely is
to get this in before the 5.18 merge window. I've made a note
in my calendar to get a full review done no later then
February 17th.

Regards,

Hans



> 
> David E. Box (3):
>   platform/x86: Add Intel Software Defined Silicon driver
>   tools arch x86: Add Intel SDSi provisiong tool
>   selftests: sdsi: test sysfs setup
> 
>  .../ABI/testing/sysfs-driver-intel_sdsi       |  77 +++
>  MAINTAINERS                                   |   7 +
>  drivers/platform/x86/intel/Kconfig            |  12 +
>  drivers/platform/x86/intel/Makefile           |   2 +
>  drivers/platform/x86/intel/sdsi.c             | 574 ++++++++++++++++++
>  drivers/platform/x86/intel/vsec.c             |  12 +-
>  tools/arch/x86/intel_sdsi/Makefile            |   9 +
>  tools/arch/x86/intel_sdsi/sdsi.c              | 540 ++++++++++++++++
>  tools/testing/selftests/drivers/sdsi/sdsi.sh  |  18 +
>  .../selftests/drivers/sdsi/sdsi_test.py       | 226 +++++++
>  10 files changed, 1476 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/ABI/testing/sysfs-driver-intel_sdsi
>  create mode 100644 drivers/platform/x86/intel/sdsi.c
>  create mode 100644 tools/arch/x86/intel_sdsi/Makefile
>  create mode 100644 tools/arch/x86/intel_sdsi/sdsi.c
>  create mode 100755 tools/testing/selftests/drivers/sdsi/sdsi.sh
>  create mode 100644 tools/testing/selftests/drivers/sdsi/sdsi_test.py
> 

