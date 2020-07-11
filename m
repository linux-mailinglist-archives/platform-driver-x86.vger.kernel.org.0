Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4477021C473
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jul 2020 15:44:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727004AbgGKNoc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jul 2020 09:44:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726342AbgGKNob (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jul 2020 09:44:31 -0400
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2EA2C08C5DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 06:44:31 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 71E394443EAC;
        Sat, 11 Jul 2020 15:44:29 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594475069;
        bh=O4fr1qRgpTVHDaNnCnetbWv1lVZ0hhRuTysOAPn+N9I=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=lJGJadYENncT7S8AdSX//QaliDmUjg4HrdgSxgltx2olSJa7U4l2LcMcChlKNPuVS
         JW9MoUpQGAWlyjHQk444vpAjMDKp2yVX4MiDPBl/2KXtgV4vv02m4b+DaSAsv1Qvoa
         8fcvsSg3gUWxDTMRvmNl6EM8d7e6ATJY3mqpYnU5/eI4LAtepGwafiUXQSwYkesAsX
         HbNrXgh3HhurPfYsZOZxuLFtXgyIFjrvL0sZJu83q9/08fGEwjL090z23JXzL/SAWJ
         KgXjAZd14QKgL/DgYbhiq49r0B7Sfr4M5maldX3p6tnJH0rvOnvX3t7EDXfZasa1mD
         Eqrka5Ls6XcXg==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id diql8XUOvBfv; Sat, 11 Jul 2020 15:44:28 +0200 (CEST)
Received: from deepblue.zlan.intra (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 7EF7A4443DAB;
        Sat, 11 Jul 2020 15:44:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594475068;
        bh=O4fr1qRgpTVHDaNnCnetbWv1lVZ0hhRuTysOAPn+N9I=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=OkHgRRIwtq0kdcb88w71htL1IHcRB9mgGLnbsAclNZpo8qGX+Ik79tgWafeD1O2PQ
         C3989N+axnbwh+cAr0hQcq0FqnRvzOYCztWhq+UM7mwOfjBAFAkHy96RiOylTCa6Te
         ovoo3kI3UK8HO7AgX+do+iZ/apRMWlQeaQDbdm8Fz6jUjO3jnEE5Zes2JQJo8p82yV
         80s57qoUQL2S3GkH18dUi8AsVB/MTHJcKevR0PYpGtF5rY1M/+Cc9TIf/6ruzKUbPR
         pWqKmq0Q5qYLrvXjWZ7OuOfg7vFCF0ZcPNpELwz2NDvycS9o+7GTE/B9mkIQfYRq2D
         pqdHrNNCm6sog==
Message-ID: <221e54918b7b156c33243714bbb8f9fb99cb571d.camel@retarded.farm>
Subject: Re: [PATCH v3] Added device support for the new ASUS ROG Zephyrus
 G14 (GA401I) and G15 (GA502I) series.
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Date:   Sat, 11 Jul 2020 15:44:27 +0200
In-Reply-To: <CAHp75VeN20fyubCYqn68sXPydm-BZ3dXGDg+EPtwyoEnX9F2OA@mail.gmail.com>
References: <20200711094321.6615-1-zappel@retarded.farm>
         <CAHp75Veq6Upg2-b0cNWamb9b5hB0zUznVoKcLaS7GLvipC5mGQ@mail.gmail.com>
         <CAHp75VeN20fyubCYqn68sXPydm-BZ3dXGDg+EPtwyoEnX9F2OA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Samstag, den 11.07.2020, 15:21 +0300 schrieb Andy Shevchenko:
> On Sat, Jul 11, 2020 at 3:20 PM Andy Shevchenko
> <
> andy.shevchenko@gmail.com
> > wrote:
> > On Sat, Jul 11, 2020 at 12:43 PM Armas Spann <
> > zappel@retarded.farm
> > > wrote:
> > > This is accomplished by two new quirk_entry structs (one for each series),
> > > as well as all current available G401I/G502I DMI_PRODUCT_NAMES to match
> > > the corresponding devices.
> > > 
> > 
> > I'm going to apply this, but for the future...
> > 
> > > Signed-off-by: Armas Spann <
> > > zappel@retarded.farm
> > > >
> > > ---
> > >  asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401I) and G15
> > > (GA502I)
> > 
> > ...this actually should be a subject of the patch. But here you put
> > something like:
> 
> (Sorry, slipped click)
> 
> v3: fixed commit message, sent using Git tools
> 
> 

Hi, 

many thanks for accepting it even with not well formatted description. I promise
I'll respect all of your hints and tips for the next time I submit a patch.

I'm very thankful for all your kind support and tips you gave me.


Best Regards,
Armas Spann


