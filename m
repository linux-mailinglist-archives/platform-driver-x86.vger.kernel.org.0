Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A282C7AA26A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Sep 2023 23:18:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232721AbjIUVRS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 Sep 2023 17:17:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232724AbjIUVQO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Sep 2023 17:16:14 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D556455AB
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 10:08:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695316102;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=+LqyqkbU582imBQ0YOb/llGiFqNCWpU/CGhegbr1gDs=;
        b=gGoykdX0geymciGCXnfnoHG/u+rLJvww+Fco4lRxJ5XHEI1lXiI7Ib53klJOMawTMU99u8
        up7m/HpkIRicHYm3iRPdICuZ90oMPGo8wyWR59zuEPvkjFTwAvesj/hdW9BMD4xtFOZdzU
        B3Oz5Caxm04clNNmJeS8TNUJXbqIQTU=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-392-HpPKQ0O0OVaJFdAzZLU6IQ-1; Thu, 21 Sep 2023 12:29:09 -0400
X-MC-Unique: HpPKQ0O0OVaJFdAzZLU6IQ-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99388334de6so88006766b.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Sep 2023 09:29:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695313748; x=1695918548;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+LqyqkbU582imBQ0YOb/llGiFqNCWpU/CGhegbr1gDs=;
        b=S8zHlrLyTgrYFbShoAtoEw7QbQL53qQ3/xwRl1oW0RfPe+y/T2src0/e4ftrZ4Qe6D
         kbGzNip5Q32VgHs04Rfqbu7iYFEfdl3+s7DVh5gJgQx4xBsykjUpO5DBaUgeAnKHsrhC
         EeuLzK6AzwKcpjyp6bfZQATM+0e3X7lCdVNAT0H5WTkDk2QAua+/e8CTLXh111HU8jxt
         KvAlKJbZwbTpgvk1uI6e0HQ69eJmu+yH5OjHPHUhn20IkOEVOjGhFnCQV5LWdMF5kU/e
         jvMiyVbsjnS2Ws4olkwr0dTD83Yp830R6IaNXKfg4sY8aTgRw7efwx6+p7PEKmxhUCcY
         7NAw==
X-Gm-Message-State: AOJu0YwZBgsxU/TJl/ovYgMjsZMdyIxUTcGAeLCYQlyFarIp2CE6QPx+
        E/lC4xi5WTv5328sHqcTkAEViu9089sXv3PHpF6NmWVOadFLfK77dpLnBp+7x2UFt1LArO3EgmH
        Gm1IsoJZmlYWk+8+fj8KiVWaflaNsRm+KvUVqP4PJlg==
X-Received: by 2002:a17:906:768a:b0:99d:e8da:c20b with SMTP id o10-20020a170906768a00b0099de8dac20bmr5289283ejm.24.1695313748006;
        Thu, 21 Sep 2023 09:29:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBUNaMVMH7Xly5KzL2uuQK9NXJE4nWiO9ac1dUASm2dC1r1coo5EPy0W2tTRBAHPlwypspQA==
X-Received: by 2002:a17:906:768a:b0:99d:e8da:c20b with SMTP id o10-20020a170906768a00b0099de8dac20bmr5289269ejm.24.1695313747658;
        Thu, 21 Sep 2023 09:29:07 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id kt22-20020a170906aad600b0099cf9bf4c98sm1299192ejb.8.2023.09.21.09.29.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Sep 2023 09:29:07 -0700 (PDT)
Message-ID: <981e9537-16f7-0ffa-edad-b4c90d72bb14@redhat.com>
Date:   Thu, 21 Sep 2023 18:29:06 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] MAINTAINERS: Add x86 platform drivers patchwork
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230919123948.1583-1-ilpo.jarvinen@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230919123948.1583-1-ilpo.jarvinen@linux.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Ilpo,

On 9/19/23 14:39, Ilpo Järvinen wrote:
> Add x86 platform drivers patchwork which has been missing from
> MAINTAINERS.
> 
> Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>

Thank you for your patch, I've applied this patch to my fixes
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=fixes

Note it will show up in my fixes branch once I've pushed my
local branch there, which might take a while.

I will include this patch in my next fixes pull-req to Linus
for the current kernel development cycle.

Regards,

Hans



> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index b04cbcec521f..dbf1668dcd84 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -23430,6 +23430,7 @@ M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>  M:	Mark Gross <markgross@kernel.org>
>  L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
> +Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>  F:	drivers/platform/olpc/
>  F:	drivers/platform/x86/

