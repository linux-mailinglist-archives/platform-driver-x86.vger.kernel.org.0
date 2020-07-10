Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D7C0021BF5B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 23:45:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726261AbgGJVpk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 17:45:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726245AbgGJVpj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 17:45:39 -0400
X-Greylist: delayed 12041 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 10 Jul 2020 14:45:39 PDT
Received: from mail.bin-co.de (mail.bin-co.de [IPv6:2a02:c207:3002:169::2])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 435CAC08C5DC
        for <platform-driver-x86@vger.kernel.org>; Fri, 10 Jul 2020 14:45:39 -0700 (PDT)
Received: from localhost (localhost [127.0.0.1])
        by mail.bin-co.de (Postfix) with ESMTP id 9F5444443E9D;
        Fri, 10 Jul 2020 23:45:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594417537;
        bh=LOTO4psNoUgry4fHY/aAdNK4HXkRzBKmyn4b6Ryyvos=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=Txtoh4ZeTnzy+8OxdLkXnK3xPGUO9VJushYcN5gIpSjIn0faIrqwqsGhQh7OKZGZK
         VeIDK+hdq66I8F+hyIeS83JS68p6EXeezWblNAVqB5HfAqFf8wwUA5w89xCkOr4RyA
         iGjlhHb/Jbq+8T39uDl5BSVNZkatBpr2Yu8PK0sYZN1VVTtXTv7tm2HZgPV5O3aT7o
         bU6j4RXNM54rtH8gqLxuqlz8GO+TDDm9JIN8C20+xBxBn15PIl1aliWR8UWgOcNeFQ
         mw53Lqki75ltPywRaN2S6ibe1+YX0lkFl8IUV3a1xvYfjYzC5J/o4AQXaqkZVmTMmo
         Bq3iJd2eX1TRA==
X-Virus-Scanned: amavisd-new at bin-co.de
Received: from mail.bin-co.de ([127.0.0.1])
        by localhost (mail.bin-co.de [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id B0hjqw7BZbcI; Fri, 10 Jul 2020 23:45:36 +0200 (CEST)
Received: from [192.168.0.23] (unknown [90.187.13.225])
        (Authenticated sender: zappel@retarded.farm)
        by mail.bin-co.de (Postfix) with ESMTPSA id 4B6B54443E95;
        Fri, 10 Jul 2020 23:45:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=retarded.farm;
        s=201801; t=1594417536;
        bh=LOTO4psNoUgry4fHY/aAdNK4HXkRzBKmyn4b6Ryyvos=;
        h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
        b=V3OlT0c+Z10IXJPI7IhG6mc1vZriuObwSQKQv4H0OxiesFoffa9RiB8S7hYYreUwn
         otax7cH7l8xsBeDtGSGvMyNtPJdYZJsI8l+cCLwRrC3RQucjrQ1ibDk8iEiNWCOwHj
         0isA/G9kHYlVJWHt3P+wWL40+WDJZE6okEN8vtUCb3pIafk9p+iIKZrda7hDOkDz+U
         QxkCXSbWVe4zTFq7ARu+LijbtdGzx8V1kKnvJMtfdP13PAB40MIk1ZyhXRhHR9PPpg
         3i8QISwD9Rr1TZuo/1rG8Od3Wamft9LGyGWboGFzCpt+7kgkgAhDWETYNNU/f24sgU
         5SZSOxPW1+IlA==
Message-ID: <e33ea8612143bbdfc32e3d397b2adf6d75bffa73.camel@retarded.farm>
Subject: Re: [PATCH] support for ASUS ROG G14/G15 (G401I/G502I) series
 asus-nb-wmi.c
From:   Armas Spann <zappel@retarded.farm>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Date:   Fri, 10 Jul 2020 23:45:35 +0200
In-Reply-To: <CAHp75Vc7eY9DXez5ZYtdGjEz2-EcyV5cY_puM08izbrr=UHbEw@mail.gmail.com>
References: <4033154a9e166a37acb5c0491fa0b85f8b0fc032.camel@retarded.farm>
         <CAHp75VeubEjv_2WPeHK5twWYhK58xJ2L6Pcu3ibVEO-C24AsWQ@mail.gmail.com>
         <CAHp75Vd6PO3zfMH60BJETJCfQzAVbHvD=zAfHgjnu2NbAeukfw@mail.gmail.com>
         <6b72df991cb25743906188aa054d3fe69c57248e.camel@retarded.farm>
         <CAHp75Vc7eY9DXez5ZYtdGjEz2-EcyV5cY_puM08izbrr=UHbEw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Am Freitag, den 10.07.2020, 23:46 +0300 schrieb Andy Shevchenko:
> On Fri, Jul 10, 2020 at 9:24 PM Armas Spann <
> zappel@retarded.farm
> > wrote:
> > Am Donnerstag, den 09.07.2020, 22:19 +0300 schrieb Andy Shevchenko:
> > > On Thu, Jul 9, 2020 at 10:18 PM Andy Shevchenko
> > > <
> > > andy.shevchenko@gmail.com
> > > 
> > > > wrote:
> > > > On Wed, Jun 17, 2020 at 3:02 PM Armas Spann <
> > > > zappel@retarded.farm
> > > > 
> > > > > wrote:
> > > > > Support for the currently unsupported ASUS G14 Notebooks (GA401I
> > > > > series)
> > > > > to the asus(-nb)-wmi.c sources.
> > > > > First change is the on the input buffer, the new devices are sending 5
> > > > > DWORD instead of 3 as it was definded before. (might be already
> > > > > submitted
> > > > > upstream)
> > > > > 
> > > > > The second part of the patch adds the correct device dmi
> > > > > identificator.
> > > > 
> > > > I can't take patch w/o Signed-off-by. See [1] for the details.
> > > > 
> > > > On top of that it doesn't apply. And it clashes with already applied
> > > > 7b91f1565fbf ("platform/x86: asus_wmi: Reserve more space for struct
> > > > bias_args")
> > > 
> > > [1]:
> > > https://www.kernel.org/doc/html/latest/process/submitting-patches.html
> > > 
> > > 
> > > 
> > > 
> > > 
> > 
> > Many thanks for your feedback.
> > I must excuse myself for not beeing guideline conform.
> > 
> > Now, I removed the already fixed input_buffer and added the ASUS Zephyrus
> > ROG
> > G502I Series as well.
> > 
> > Corrected patch:
> 
> Good. Now you need to do it so:
> - it has proper and clear commit message (and being committed locally)
> - you commit change with `git commit -a -s` which adds correctly the
> Signed-off-by tag
> - with help of `git format-patch -v<N> -1 HEAD~0` you create a file
> with patch, where `<N>` corresponds to the version of it, now I guess
> it's something like 3 or 4
> - you open that file in editor and add a changelog after cutter '---'
> line, save it
> - with help of `git send-email 0001-*` you can send that patch to the
> mailing lists (don't forget to Cc maintainers as well)
> 
> 

Many thanks for this brief explanation. I hope that I did it now correct, so I'm
not wasting more of your time. (the email was just sent via git)


Best Regards,Armas Spann

