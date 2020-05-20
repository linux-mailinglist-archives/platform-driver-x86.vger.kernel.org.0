Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B53041DAA87
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 May 2020 08:19:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726489AbgETGTm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 20 May 2020 02:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726450AbgETGTl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 20 May 2020 02:19:41 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BC96C061A0E
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2020 23:19:40 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t7so916182plr.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 May 2020 23:19:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4s3OgpgD5iw+FQB8YY820tZfgurIkzRgWd6A4SSOU8Y=;
        b=fFJi/IuGX/+yn1rzTYldMdmVCWubECD7Lk2eeMGHQvN0O9pcDTcXsTNE/8lwuzQ+gO
         6Bh9hEESrqP/S8ar7my5VqcK7vFBl12t2KR0omUtvlv1hSf6vMc/c/2ZoKaRQq0tzoLG
         zeWYfNzEvbKufkJgfTPLWzj+3hB39/pe0A1dMD3mNlxE518Cqrwjk4gQVy5UDz0u3qan
         ICm9hboxrYmUPjd7t3L5eazu1QYmjGJwyh3BlSUK3oW/hRkBE1SBfNxAigs24VKNfNk0
         ZD9NqIWsLWl9wiuUhCfotjyJwxwZycRIok1p48U1GvKxC7iyfyjTh5l0iXtDCiAkdPjP
         Egkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4s3OgpgD5iw+FQB8YY820tZfgurIkzRgWd6A4SSOU8Y=;
        b=CP/I6G6UEroDkRI9P4LSAO6JC/9VhSl6OWG5ZI+JtPwBlfcoofzv6nUKG10TWWOOew
         8kjJSjK74Ysf5L/uP/gAU372NZAoQBl5M++dFMzr6XbM/eBKPk7pIA2Pek2M6mbWnWe0
         euf0CSLSu+5/uvNMWzdO7+LHRo8mdGMzPPkKQ2cdM9fhl3zXNMMwlzO0XffE4IWPG1xH
         07YU/hZa36hFv6YWhlj/1xAsqNa6xbSgtMuTTIXi6FtKCNRjvFpgOQBXSKqS/mhy0Qoe
         0BaTEk+dZbkTGAqv6APrXKoVgpVouBRFYtiU5IRaMUe8cnnP1K1d/c5Di8ui5OZlwFt8
         J8Dw==
X-Gm-Message-State: AOAM5320wByS+82hr/x0I+GfPlGAKdqJQWiCJJQz+NqqoF04GoSOkzvX
        dqHgaG/1t1ApI2AASYAgfa1CxI0Or+8=
X-Google-Smtp-Source: ABdhPJxm4+Yj8F1wt5wdh48N5Kk2Yu99pT59tC9y9ukI+CN5d4XBN7N0OVmkcHCWlz8SRamU4YqFdQ==
X-Received: by 2002:a17:90a:7f8a:: with SMTP id m10mr3745919pjl.2.1589955579844;
        Tue, 19 May 2020 23:19:39 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id r69sm1165571pfc.209.2020.05.19.23.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 May 2020 23:19:39 -0700 (PDT)
Date:   Wed, 20 May 2020 15:19:40 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v4 0/2] Two fixes for one sony-laptop reported bug on 5.6
Message-ID: <20200520061940.GA107399@taihen.jp>
References: <20200508001405.71176-1-malattia@linux.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200508001405.71176-1-malattia@linux.it>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, May 08, 2020 at 09:14:03AM +0900, malattia@linux.it wrote:
> From: Mattia Dongili <malattia@linux.it>
> 
> They are both candidates for stable.
> 
> Mattia Dongili (2):
>   platform/x86: sony-laptop: SNC calls should handle BUFFER types
>   platform/x86: sony-laptop: Make resuming thermal profile safer
> 
>  drivers/platform/x86/sony-laptop.c | 60 +++++++++++++++---------------
>  1 file changed, 29 insertions(+), 31 deletions(-)

[resending as the list rejected my earlier attempt]

Andy, Darren,
are you going to pick this set up for 5.7-rc? Else, is it 5.8 material and we
aim for 5.6 and 5.7 stable patches?

Thanks
-- 
mattia
:wq!
