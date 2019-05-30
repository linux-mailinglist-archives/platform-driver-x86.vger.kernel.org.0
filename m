Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5C70D304AB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2019 00:15:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726540AbfE3WPl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 30 May 2019 18:15:41 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:43378 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726045AbfE3WPl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 May 2019 18:15:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=MJ6oUUTwMAmygw3w2mXgxc7c8GWQv1M7n40QZoJPsXw=; b=UgUa3bY5pFyL+nTGfLND3yU/b
        CJGheMvu79zCSxsIiTaWJqfkt/uN1mNB8wark/SvD9SBoAWqOSxKz5c+2Y4dY5hP+lfK4OoVjy1z+
        +8ALfuW1FjS6vJCCE0keYA2wFfXoRV5WAod4TRxNuvo6QIZXJvYvmKNdA0ALISISJqjqyaiG7Iv4I
        Ad0MmLPZZzXUi/QeEDzwJS+aEXFauaFu3K2dBpp+rG+CxxHWNWxdJeocYbBWbN6wpflzaEOtzGZC+
        De4TKuykr/hu1gDDTgDLA7whOUw/A8j7dR+/FRUAg1Lwf/AQerBD4EL5B6JhwpBxASwN1P2Z+TEc5
        9YWrXg0UQ==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWSvI-00032A-E1; Thu, 30 May 2019 21:49:20 +0000
Subject: Re: [PATCH 3/4] Platform: OLPC: Require CONFIG_POWER_SUPPLY for
 XO-1.75 EC
To:     "[PATCH 0/4]"@zimbra.v3.sk, "Platform:OLPC:A"@zimbra.v3.sk,
        couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
        fixes@zimbra.v3.sk, Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
References: <20190529083405.332762-1-lkundrak@v3.sk>
 <20190529083405.332762-4-lkundrak@v3.sk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <6796719f-43ef-bba3-362d-f3f107493032@infradead.org>
Date:   Thu, 30 May 2019 14:49:18 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529083405.332762-4-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 5/29/19 1:34 AM, Lubomir Rintel wrote:
>   ERROR: "power_supply_put" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
>   ERROR: "power_supply_changed" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
>   ERROR: "power_supply_get_by_name" [drivers/platform/olpc/olpc-xo175-ec.ko] undefined!
> 
> Adding the dependency seems like a more reasonable thing compared to
> ifdef-ing the bits, as if one has an XO-1.75 they almost certainly want
> a baterry and AC adapter support.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/platform/olpc/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfig
> index 1fa676c5e7fa..6f35c01254e5 100644
> --- a/drivers/platform/olpc/Kconfig
> +++ b/drivers/platform/olpc/Kconfig
> @@ -7,6 +7,7 @@ config OLPC_XO175_EC
>  	depends on ARCH_MMP || COMPILE_TEST
>  	depends on SPI_SLAVE
>  	depends on INPUT
> +	depends on POWER_SUPPLY
>  	select OLPC_EC
>  	help
>  	  Include support for the OLPC XO Embedded Controller (EC). The EC
> 


-- 
~Randy
