Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 577B93D3D3
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jun 2019 19:19:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2405718AbfFKRTp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jun 2019 13:19:45 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:53894 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2405263AbfFKRTp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jun 2019 13:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=3ugAXEUnWkSCcu7vqOynKmPJ/a6J7aG3wWkjv+SM2x8=; b=mHcHHQq42uC7Hl3/68IfTsUcW
        6qCWAe9D8O8WZf+BxHYtFZqol1sgZsWq/NDL2v5VWJ3JxQw5Q23LPTAMnb5LkWa0v37xvZSuvyPX9
        ry1ITMc8KhkZmzA+FynQOOUDQQpps41K3s0bO5VVJdHRsq00xYZQQnJEHTKlYwtIp9bBw8ATlC6WI
        WK7UYjNZaUd/v9xvxR9Tac4UDLKnVmQEeQ/P0dvQ2Rx6K6NgdVyISR79rnuCQCNMpos2lLKQikvyO
        Y9JOkmL7IkrB4I95/rETtMzZuA8kYvVfKwVav4ILUZFgb22GeoZsMlllJvpUEq6AQXEe9GZwiw6Yk
        ksB2MyLWg==;
Received: from static-50-53-52-16.bvtn.or.frontiernet.net ([50.53.52.16] helo=midway.dunlab)
        by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
        id 1hakQw-0001xi-WC; Tue, 11 Jun 2019 17:19:43 +0000
Subject: Re: platform/olpc
To:     "[PATCH 0/4]"@zimbra.v3.sk, "Platform:OLPC:A"@zimbra.v3.sk,
        couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
        fixes@zimbra.v3.sk, Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org
References: <20190529083405.332762-1-lkundrak@v3.sk>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <c532c24c-3486-c331-a2a5-da6fbdf9dad3@infradead.org>
Date:   Tue, 11 Jun 2019 10:19:42 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190529083405.332762-1-lkundrak@v3.sk>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 5/29/19 1:34 AM, Lubomir Rintel wrote:
> Hi,
> 
> This set contains fixes for problems discovered with randconfig and 0-day
> robot running agaist linux-next and one rather embarassing problem
> introduced in the last OLPC EC patch set version.
> 
> They apply on top of for-next branch of
> git://git.infradead.org/linux-platform-drivers-x86.git with two
> patches from YueHaibing's set [1].
> 
>   Platform: OLPC: Add INPUT dependencies [2]
>   Platform: OLPC: Fix build error without CONFIG_SPI [3]
> 
> [1] https://lore.kernel.org/lkml/20190528092806.20080-1-yuehaibing@huawei.com/
> [2] https://lore.kernel.org/lkml/20190528092806.20080-2-yuehaibing@huawei.com/
> [3] https://lore.kernel.org/lkml/20190528092806.20080-3-yuehaibing@huawei.com/

Hello.
Would some platform maintainer be able to merge the 2 patches from Yue and
the 4 patches from Lubomir, please?  They would fix lots of build errors.

-- 
~Randy
