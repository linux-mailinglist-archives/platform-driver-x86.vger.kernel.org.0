Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0AB23AB53
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 19:03:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726942AbgHCRDl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 13:03:41 -0400
Received: from mail.bin-co.de ([173.212.200.19]:37276 "EHLO mail.bin-co.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726878AbgHCRDk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 13:03:40 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id EB9324444667;
        Mon,  3 Aug 2020 19:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596474217;
        bh=pJYfSP3UzGfDbB0o3fR4/nlx4US3oRF0Q8pUyZ3Ku3w=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=BBOpvnyS1NTOju/VAh03lwUkou0mmFlGi1ljnJFzalkvl/SpOnd7oPxveLaSXlCV1
         0H4a7zEFOg4CH2yVBGIbIfgy68PhVWR2+TywFMK4xfNyeQHaDX3hHfomR57JipJJrE
         OZy9ECBwvOqeJ3OVXJJXtbz0ibx6+ygc2DfV/T9M73PMhOCZLrkLEUTaQDgFx9ToRn
         Mbjz6+/xL/zIwYIJ9Hm3XiiU0spgK14osraSSyiYRPz3aaiUyj19jTvovMQz8Jq33P
         kilqwwwx8hoyJvqq/kxD3k2rADF/RL/nZ+C7P2rlpqk0FlwyHdqaDEs6oYuDhVDDzP
         RahnaJk0v8rcw==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id 8W8VMq58P4RX; Mon,  3 Aug 2020 19:03:37 +0200 (CEST)
Received: from [192.168.0.23] (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 2DEF94444665;
        Mon,  3 Aug 2020 19:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596474217;
        bh=pJYfSP3UzGfDbB0o3fR4/nlx4US3oRF0Q8pUyZ3Ku3w=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=BBOpvnyS1NTOju/VAh03lwUkou0mmFlGi1ljnJFzalkvl/SpOnd7oPxveLaSXlCV1
         0H4a7zEFOg4CH2yVBGIbIfgy68PhVWR2+TywFMK4xfNyeQHaDX3hHfomR57JipJJrE
         OZy9ECBwvOqeJ3OVXJJXtbz0ibx6+ygc2DfV/T9M73PMhOCZLrkLEUTaQDgFx9ToRn
         Mbjz6+/xL/zIwYIJ9Hm3XiiU0spgK14osraSSyiYRPz3aaiUyj19jTvovMQz8Jq33P
         kilqwwwx8hoyJvqq/kxD3k2rADF/RL/nZ+C7P2rlpqk0FlwyHdqaDEs6oYuDhVDDzP
         RahnaJk0v8rcw==
Message-ID: <2d9a375a0af0ccda2680938dbee1cf3edc6f1c11.camel@retarded.farm>
Subject: Re: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14
 (GA401) and G15 (GA502)
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Date:   Mon, 03 Aug 2020 19:03:36 +0200
In-Reply-To: <CAHp75VcmsTnZ+AfBCPmxX6GpfM=PRGAd3Y51zaj2WHmcY8XPYQ@mail.gmail.com>
References: <20200802041705.79870-1-zappel@retarded.farm>
         <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
         <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
         <CAHp75Vdwa2DWKYzHFKbK5UB_htuws5sX2Hi64PN0YEOBdFKbZg@mail.gmail.com>
         <df518901cb2c5a1a4bd96f403f82451f2637e7cb.camel@retarded.farm>
         <CAHp75VcmsTnZ+AfBCPmxX6GpfM=PRGAd3Y51zaj2WHmcY8XPYQ@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Montag, den 03.08.2020, 19:47 +0300 schrieb Andy Shevchenko:
> +Cc: Jonathan.
> (newbie's adventures below)
> 
> On Mon, Aug 3, 2020 at 7:39 PM Armas Spann <
> zappel@retarded.farm
> > wrote:
> 
> > I think I missed that checklist.. But what I was looking for was some kind
> > of a
> > "quick"-list, like that one you send me some weeks ago. (howto use git to
> > send
> > those emails, for example)
> > 
> > For a newcomer like me in this process, it's hard to sort out the right
> > information and where to put description/changelog/etc. in the (git)patch
> > itself. It might be helpful to have an example for a full git-driven patch
> > (IMHO) - Yes of course I looked in to other submitted patches to get a clou.
> > Because after reading all the kernel howtos to submit and participate, I
> > felt
> > more lost then before due to the informational overflow.
> > 
> > And of course, that I screwed up the branch/repo in my last patches was
> > totally
> > my fault because I did not recognized that I need to checkout another repo
> > and
> > branch to get ontop of my/your previously applied patch in this case.
> > 
> > 
> > Im very thankful for all the support you gave me, but I think I should have
> > asked first, before submitting patches. ;)
> 
> But your evaluation of [1] will be quite helpful exactly b/c you are a newbie!
> Maybe you can read it again and propose changes that will help people
> like you now (I believe you will learn things fast) to be not lost on
> the first steps?
> 
> > Best regards and thanks for your feedback,
> > Armas
> 
> Please, avoid top postings in the future. It's not welcome by the community.
> 
> ...
> 
> > > Do you think we need to expand / update checklist [1] in kernel
> > > documentation?
> > > 
> > > [1]:
> > > https://www.kernel.org/doc/html/latest/process/submit-checklist.html
> > > 
> 
> 

Got it. 
(Today I'm learning howto write an email - really feeling like a noob now) 
- just changed my mailer settings to answer below.

To answer your question about [1]:
That checklist is pretty streight forward and understandable, my problem was
more the linked 
https://www.kernel.org/doc/html/latest/process/submitting-patches.html#submittingpatches
 documentation. Which especially confuses me reading the "changlog" sections.
It's not clear (to me at least) where to put which changelog. I know the default
changelog is what a patch changes and that should go directly under the subject.
But the internal (patch related) changelog was totally unclear. As well as this
documentation is missing the git send-email thingy you pointed me to (its only
mentioned once within '#explicit-in-reply-to-headers').


Best regards,
Armas

