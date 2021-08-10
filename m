Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E890D3E41F1
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Aug 2021 11:00:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234095AbhHIJAm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Aug 2021 05:00:42 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35003 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233926AbhHIJAl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 05:00:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1628499621;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bM9kpP02f9r/g3VdMnj8Zaen8YVGN2Vayf0/HbSkdec=;
        b=RHf4lumHJOJr5ypwBCmTRbJo0ki6fMp0L9tKWvrQSG7yBQ37T/bwXqu2W4EJYu4rVkXPqr
        Gyd1R82SqoUy8IaK6xIaCZDY/O5ZMki9R9n9e2p3hmjgrMpgfcwk6IPolpv6Hf6JhEncQs
        DHxeA9mRsuo9YPHzQaW/+D+fYZsDslg=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-583-vtNwiuwzPrOqGXDenwgWyA-1; Mon, 09 Aug 2021 05:00:19 -0400
X-MC-Unique: vtNwiuwzPrOqGXDenwgWyA-1
Received: by mail-ed1-f71.google.com with SMTP id c16-20020aa7d6100000b02903bc4c2a387bso4080899edr.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Aug 2021 02:00:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bM9kpP02f9r/g3VdMnj8Zaen8YVGN2Vayf0/HbSkdec=;
        b=dINBFCI7KmdLU4n4e1SyjZrVdfvbrrh8AMD8Wz6WY6TsEhUICi1feQEXNZfQjbOV2J
         SuD892CNYIoCRq3abMmslVqxDP8Y6ehVJN3NQhPuAfc1T5bPJuGFH93aQ5yLuE91slwd
         NpNlfNoKbx/hXze96xMoE29H/dcTUWFFQmjIXNz2WsucN3OXP8gte1q1KwdF18A2sRzf
         KQ32TBNBHw63THw/p3xqzDEYMmUG0Cv8enydltBHx4ZSvK0QH16mr/Tyvdyau4w2oaxT
         a8WsP8T1DgpWOrZCU9GQyz/o+A2xzOZmpU8iKQLpSn/X59vXrVln14EW3msKMPT8sT/5
         e+Fw==
X-Gm-Message-State: AOAM530wrfsFvwwYj1ZqwKcHpkVjx7qOhkzQoxNpEMRNxGiLA5k+rft2
        iILGY5MNirgRGaDGO15xm7JnF3WFvN33Od/NFJJCBXQov7rGACeqwXvchcz9c6QVqPjZ/SEsjOH
        xPSM0c0kl0SRXypwy/tfqjaEb9lKMl4VpGg==
X-Received: by 2002:a50:bb43:: with SMTP id y61mr28265779ede.22.1628499618626;
        Mon, 09 Aug 2021 02:00:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxejhDaFK1lU/Mdj22pcgEsWm+7KHeAaq6avCqQ1xtRDNgVuNPgWKj4yk7Zt+RqYFU6xdF8A==
X-Received: by 2002:a50:bb43:: with SMTP id y61mr28265764ede.22.1628499618446;
        Mon, 09 Aug 2021 02:00:18 -0700 (PDT)
Received: from x1.localdomain ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id s3sm5690626ejm.49.2021.08.09.02.00.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Aug 2021 02:00:18 -0700 (PDT)
Subject: Re: [PATCH v1 1/1] platform/x86/intel: int33fe: Use y instead of objs
 in Makefile
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Mark Gross <mgross@linux.intel.com>
References: <20210806154941.4491-1-andriy.shevchenko@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bcd685c8-645e-eeff-6815-1251b28e1945@redhat.com>
Date:   Mon, 9 Aug 2021 11:00:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210806154941.4491-1-andriy.shevchenko@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/6/21 5:49 PM, Andy Shevchenko wrote:
> The 'objs' is for user space tools, for the kernel modules
> we should use 'y'.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
>  drivers/platform/x86/intel/int33fe/Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/int33fe/Makefile b/drivers/platform/x86/intel/int33fe/Makefile
> index cc11183ce179..9456e3b37f6f 100644
> --- a/drivers/platform/x86/intel/int33fe/Makefile
> +++ b/drivers/platform/x86/intel/int33fe/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  obj-$(CONFIG_INTEL_CHT_INT33FE)		+= intel_cht_int33fe.o
> -intel_cht_int33fe-objs			:= intel_cht_int33fe_common.o \
> +intel_cht_int33fe-y			:= intel_cht_int33fe_common.o \
>  					   intel_cht_int33fe_typec.o \
>  					   intel_cht_int33fe_microb.o
> 

