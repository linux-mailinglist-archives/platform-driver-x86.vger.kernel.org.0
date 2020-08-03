Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37A3F23A3A5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 13:56:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726118AbgHCL4A (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 07:56:00 -0400
Received: from mail.bin-co.de ([173.212.200.19]:36574 "EHLO mail.bin-co.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726041AbgHCLz7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 07:55:59 -0400
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 320F94444667;
        Mon,  3 Aug 2020 13:55:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596455756;
        bh=m/gAY3ouHFTozG+q+aNCeSKy7pZPBTHGPx/Wnr4CD+Q=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=hYFo8eYcrfwvP7VjAE5YS0NmRajp2mA1j7pAtC65POgVV4xU8McoS1Dg9aofDK8wP
         FhSgr/V+JBdmwZTNqezLRkO2vrwHKrWcfoiqb/3BBqiInIBWCYOPfQHxdH/T6GVIbO
         bIJ8ohvgL45cN+JGQ4wfohmjY4ow5Y0dz034JCisABWbRfo6RhlUOTqYq6LbKl0L/C
         hrtl2j5PgVwRvkcVHI1ZisJMTPAyAPqlJEo8B6D9Mwvx2Ltw0YTFzX/+RFiUd43L5z
         Tb1PZuruUCE0V3eJG8fK0tNFcJ0mIeXEBqyX+1/G5astsB388KRja0owK1NixXXPFC
         LVKlOi43/kfpQ==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id vnIFGGdkW4fW; Mon,  3 Aug 2020 13:55:48 +0200 (CEST)
Received: from [192.168.0.23] (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 5B0F54444665;
        Mon,  3 Aug 2020 13:55:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1596455748;
        bh=m/gAY3ouHFTozG+q+aNCeSKy7pZPBTHGPx/Wnr4CD+Q=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=N+DqP6mn9zHZrzflxn616tMS9KtssVysE+sG1MyiU0sHJ+EKuAvYDuCmqQTC5I1fA
         98tGjiKgV9IiiXFGu375P2275p9ZMGYKM4XjQRuwwPuM9yigi8wfn6voViONkdqb4W
         qTGRq25ZiuVkyZ/ahySJq9Ww4BpEyU+9I1BVa7/YZyDjnWInIyomTBLjxaDPgx9kH/
         gcuhFPD1yEVYW0+4lrj3O+SmCPPZhlm+7n35NK+m9umJ4c5c4nIWgbdDkTMkmuSyri
         MPXM4DCp6U3qS0Hj4SpqetjQoWbZ62CicZFbtuNNfz7kGoYn/G6mbnQ5pR+E62KUz3
         3ppW/MZGxTDnA==
Message-ID: <ba68ddc0216ee23c772b4e73c84de0a25f9fe53a.camel@retarded.farm>
Subject: Re: [PATCH v5] asus-nb-wmi: add support for ASUS ROG Zephyrus G14
 (GA401) and G15 (GA502)
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Date:   Mon, 03 Aug 2020 13:55:47 +0200
In-Reply-To: <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
References: <20200802041705.79870-1-zappel@retarded.farm>
         <CAHp75Vf9BwaU2y3smc0pMpohLcAbbQt_RDS1kzzgOsbqN2ZaEA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Yeah sorry.. 

just recognized that I totally messed it up. (first issue, I was on the wrong
branch/repo, second you're totally right with the two structs, one is way better
 - like it's implemented now.)

I just recognized that it is fixed in the "for-next" branch with slightly
adjusted fixes you applied. Many thanks. 

So, please just ignore the last requests from me. I'll take care the next time
when doing a submit, to crosscheck everything more then once. (I've now a
checklist for that purpose ^^)


Best regards,
Armas


Am Sonntag, den 02.08.2020, 13:59 +0300 schrieb Andy Shevchenko:
> On Sun, Aug 2, 2020 at 7:17 AM Armas Spann <
> zappel@retarded.farm
> > wrote:
> > 
> 
> Drop extra blank line(s) here.
> 
> > This patch adds the ASUS ROG Zephyrus G14/15 notebook series detection to
> 
> Read the Submitting Patches section about "This patch" and fix text
> accordingly.
> 
> > asus-nb-wmi. The detection itself is accomplished by adding two new
> > quirk_entry
> > structs (one for each series), as well as all current available G401/G502
> > DMI_PRODUCT_NAMES to match the corresponding devices.
> > patch-changelog:
> > v1: initial G401 patches
> > v2: --
> > v3: re-initial GA401 and GA502 and setting description
> > v4: corrected typo(s) added GA502DU series
> > v5: corrected signed-off position in patch - sorry
> 
> This must go after the cutter '---' line below.
> 
> > Signed-off-by: Armas Spann <
> > zappel@retarded.farm
> > >
> > ---
> 
> ...
> 
> > +static struct quirk_entry quirk_asus_ga401 = {
> > +       .wmi_backlight_power = true,
> > +       .wmi_backlight_set_devstate = true,
> > +};
> > +
> > +static struct quirk_entry quirk_asus_ga502 = {
> > +       .wmi_backlight_power = true,
> > +       .wmi_backlight_set_devstate = true,
> > +};
> 
> These are identical. What is the point?
> 
> 
> P.S. Have you based your stuff on our for-next branch [1]?
> 
> [1]: 
> http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next
> 
> 
> 


