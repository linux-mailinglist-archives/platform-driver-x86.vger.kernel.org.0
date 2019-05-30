Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E6EC5304AA
	for <lists+platform-driver-x86@lfdr.de>; Fri, 31 May 2019 00:15:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726386AbfE3WPl (ORCPT
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
         bh=he97HJL5paFdR0WJVQBDcfrptLIoS9MZUdS2Wuhwl5c=; b=jmDDTERurkWzyEAXTzFCg5cRE
        LOGwJssAeiDwwnQ+pgGKtDQXL8NolTgDeBt9nol1WHPm/hOUNJAx8kjDtZ2gry9oR/SXl+W9e9Vn/
        /kGBSBxnyywBYM+D0f0NACG+t9/ecZEyuEGN6nDDxE4YraLW2IGkXbcHgI5GWN2xHcduaDkHDFcj3
        SbPWaw0IFIJDXH2pvAcLkeHn74m8BXMJWX8p343hDHT+hDWy3Q+EQHY0KPukTywMmlXwqlMQaB6a1
        fdWyuB/Yb7wR4KXj1zXIJy7pw/ZMLPIWRuzXCoBeD5zHPo/yJ68kbIau6tkcOxcMUpURpOo6cs4Vw
        zxM7044tw==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hWSvE-00031q-H0; Thu, 30 May 2019 21:49:16 +0000
Subject: Re: [PATCH 4/4] Platform: OLPC: Add a config menu category for XO
 1.75
To:     "[PATCH 0/4]"@zimbra.v3.sk, "Platform:OLPC:A"@zimbra.v3.sk,
        couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
        fixes@zimbra.v3.sk, Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org,
        Lubomir Rintel <lkundrak@v3.sk>
References: <20190529083405.332762-1-lkundrak@v3.sk>
 <20190529083405.332762-5-lkundrak@v3.sk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3bde60f4-e318-e675-7ea1-764e3fc1738e@infradead.org>
Date:   Thu, 30 May 2019 14:49:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529083405.332762-5-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 5/29/19 1:34 AM, Lubomir Rintel wrote:
> Randy Dunlap says:
> 
>   drivers/platform/olpc/Kconfig needs to use "menuconfig" like all of the
>   other Kconfig files in drivers/platform/ so that its menu is listed in
>   the correct place in *config interfaces.
> 
> Otherwise he's sad.
> 
> Reported-by: Randy Dunlap <rdunlap@infradead.org>
> Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  drivers/platform/olpc/Kconfig | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/olpc/Kconfig b/drivers/platform/olpc/Kconfig
> index 6f35c01254e5..919b489e24e8 100644
> --- a/drivers/platform/olpc/Kconfig
> +++ b/drivers/platform/olpc/Kconfig
> @@ -2,9 +2,19 @@ config OLPC_EC
>  	select REGULATOR
>  	bool
>  
> +menuconfig OLPC_XO175
> +	bool "Platform support for OLPC XO 1.75 hardware"
> +	depends on ARCH_MMP || COMPILE_TEST
> +	help
> +	  Say Y here to get to see options for the ARM-based OLPC platform.
> +	  This option alone does not add any kernel code.
> +
> +	  Unless you have an OLPC XO laptop, you will want to say N.
> +
> +if OLPC_XO175
> +
>  config OLPC_XO175_EC
>  	tristate "OLPC XO 1.75 Embedded Controller"
> -	depends on ARCH_MMP || COMPILE_TEST
>  	depends on SPI_SLAVE
>  	depends on INPUT
>  	depends on POWER_SUPPLY
> @@ -15,3 +25,5 @@ config OLPC_XO175_EC
>  	  button, restart, shutdown and battery charging status.
>  
>  	  Unless you have an OLPC XO laptop, you will want to say N.
> +
> +endif # OLPC_XO175
> 


-- 
~Randy
