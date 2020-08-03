Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9132323AAA4
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 18:39:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726457AbgHCQjw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 12:39:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53212 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725945AbgHCQjw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 12:39:52 -0400
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B1C1C06174A
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2020 09:39:52 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id EF8894444667;
        Mon,  3 Aug 2020 18:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596472787;
        bh=tRRXZIiV1Nv1NToOMHxnmKT7VaGU6n91azE5GwghZmE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=oAbfvwV8+MJyExWcc0dyShiZXbufFnuq7Ailrshr7B67xR7kxbtCnhxEhnRc8uYCC
         uO1vZRROhayoHeiiGLNXHMmLo9bYO99jtMDqvXfi9VbRZFKNsw/3YsjE9IPmu231gd
         R6HlfoMQ8OrujzJM+2Jri6Ff8TKgTcAh2rwfOAOHr6PxCxjJnYlDp6Skue7VhApH/H
         7It1ANodTgSjP+rgNiH3cW+DN6EjqUviXkbwgT9I0ddgEeCWnZrRWkbrGgEvXoHtvg
         QIBxBbQtEm/nCgFtoqkXeforr8Km5dPeo7RaYeZ4ONjVuhi34EIMCseoduHroUKpUZ
         sOXDkA1MYB48Q==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id YV085ylDEauI; Mon,  3 Aug 2020 18:39:47 +0200 (CEST)
Received: from [192.168.0.23] (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 2B2874444665;
        Mon,  3 Aug 2020 18:39:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596472787;
        bh=tRRXZIiV1Nv1NToOMHxnmKT7VaGU6n91azE5GwghZmE=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=oAbfvwV8+MJyExWcc0dyShiZXbufFnuq7Ailrshr7B67xR7kxbtCnhxEhnRc8uYCC
         uO1vZRROhayoHeiiGLNXHMmLo9bYO99jtMDqvXfi9VbRZFKNsw/3YsjE9IPmu231gd
         R6HlfoMQ8OrujzJM+2Jri6Ff8TKgTcAh2rwfOAOHr6PxCxjJnYlDp6Skue7VhApH/H
         7It1ANodTgSjP+rgNiH3cW+DN6EjqUviXkbwgT9I0ddgEeCWnZrRWkbrGgEvXoHtvg
         QIBxBbQtEm/nCgFtoqkXeforr8Km5dPeo7RaYeZ4ONjVuhi34EIMCseoduHroUKpUZ
         sOXDkA1MYB48Q==
Message-ID: <df518901cb2c5a1a4bd96f403f82451f2637e7cb.camel@retarded.farm>
Subject: Re: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14
 (GA401) and G15 (GA502)
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Date:   Mon, 03 Aug 2020 18:39:45 +0200
In-Reply-To: <CAHp75Vdwa2DWKYzHFKbK5UB_htuws5sX2Hi64PN0YEOBdFKbZg@mail.gmail.com>
References: <20200802041705.79870-1-zappel@retarded.farm>
         <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
         <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
         <CAHp75Vdwa2DWKYzHFKbK5UB_htuws5sX2Hi64PN0YEOBdFKbZg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I think I missed that checklist.. But what I was looking for was some kind of a
"quick"-list, like that one you send me some weeks ago. (howto use git to send
those emails, for example)

For a newcomer like me in this process, it's hard to sort out the right
information and where to put description/changelog/etc. in the (git)patch
itself. It might be helpful to have an example for a full git-driven patch
(IMHO) - Yes of course I looked in to other submitted patches to get a clou.
Because after reading all the kernel howtos to submit and participate, I felt
more lost then before due to the informational overflow.

And of course, that I screwed up the branch/repo in my last patches was totally
my fault because I did not recognized that I need to checkout another repo and
branch to get ontop of my/your previously applied patch in this case.


Im very thankful for all the support you gave me, but I think I should have
asked first, before submitting patches. ;)



Best regards and thanks for your feedback,
Armas

Am Montag, den 03.08.2020, 16:00 +0300 schrieb Andy Shevchenko:
> On Mon, Aug 3, 2020 at 2:55 PM Armas Spann <
> zappel@retarded.farm
> > wrote:
> > Yeah sorry..
> 
> NP.
> 
> > just recognized that I totally messed it up. (first issue, I was on the
> > wrong
> > branch/repo, second you're totally right with the two structs, one is way
> > better
> >  - like it's implemented now.)
> > 
> > I just recognized that it is fixed in the "for-next" branch with slightly
> > adjusted fixes you applied. Many thanks.
> > 
> > So, please just ignore the last requests from me. I'll take care the next
> > time
> > when doing a submit, to crosscheck everything more then once. (I've now a
> > checklist for that purpose ^^)
> 
> Do you think we need to expand / update checklist [1] in kernel documentation?
> 
> [1]: 
> https://www.kernel.org/doc/html/latest/process/submit-checklist.html
> 
> 
> 


