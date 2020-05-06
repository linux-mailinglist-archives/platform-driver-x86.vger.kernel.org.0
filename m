Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E16F1C702F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 14:20:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727935AbgEFMUy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 08:20:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725887AbgEFMUx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 08:20:53 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D3E30C061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 05:20:53 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id q24so819523pjd.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 05:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=xf9c5UM9Qh2P8tazQlvnK9zorghSrrBIaOTqM3/brnI=;
        b=FAjp1q174UjxXZCbobTfr8XI9ycvKZuwUazS0flXXhsORUYCWdmA/S5ECFhfq76Zd3
         4OxGL1mj07gG+zba1BRO5Jm5gPvugOhAtD9DwZAoR7e9zUoiu5RfHjyGPapReyrwYNvn
         FFLiCxrovoUAoCz0yN7qLB5BBGEaYdtntvTyr3NsjhLr3ERLMYbTQTKk4bNrC/t/GWCF
         vy5s5Fe5cgwnh4pcTQh9Zpay2MSgvgyBGBMZbmJ1mjETlQ4Fe0K7Qr6C8vbVuQXIu+ml
         9o9OUMIWxzbym3nWEGTLZssrvOsFuTfdHQfK5WE1+bcqmqj8IgVMiaJh8ZK42Iwi9HMg
         okwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=xf9c5UM9Qh2P8tazQlvnK9zorghSrrBIaOTqM3/brnI=;
        b=Ol5WyV2hnq/C/MfUbdNgpAN+rkCC7hSzPh0wDerquWPnySng2pywXcNzYEUuc1llwb
         ZGlmEuKSm6IoY0/fUFGH+hb5YeUHewLl/gzY/2+RuUmkJNXgn2AjJkuSXcNvu90HeRH7
         eOqJD68H4YasKVDwubZ75LxXnLpnOPPGXbeEIG9qaJ35yHoJm7eEId1z6MgyvS1J6ACH
         QxXP8ib6y1DFlj1KfHmt+2NcoVtNdDTDiCWjWVOXj8CvIgNNVEpjLYUjZMMEjtQOcfUr
         V7GLQauEjkL8A1iZyr02i5d+tJ+dHCcc1z14I0AbrudNS4BymYXzzKomFR4BPh+gKNpD
         FT3Q==
X-Gm-Message-State: AGi0PubWWDa9tyIKOINPVk1hZp+S9k7T+ABhqTGuD+8hRa9LqNmJ+/5v
        DmyX/FJYdafWywJNzOpfl+8=
X-Google-Smtp-Source: APiQypIGC4w37ci53RTP50LUq8aq3ZCyVMh2W5vB3QHTGhwrWYy9+2d5hL3DnyWlMMbSLVIl8s4p4g==
X-Received: by 2002:a17:902:bf46:: with SMTP id u6mr7379848pls.318.1588767653315;
        Wed, 06 May 2020 05:20:53 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id x63sm1766614pfc.56.2020.05.06.05.20.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:20:52 -0700 (PDT)
Date:   Wed, 6 May 2020 21:20:49 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH v2 2/2] [sony-laptop] Make resuming thermal profile safer
Message-ID: <20200506122049.GA72497@taihen.jp>
References: <20200506014843.18467-1-malattia@linux.it>
 <20200506014843.18467-3-malattia@linux.it>
 <20200506034758.GA18684@taihen.jp>
 <CAHp75VeNkfJhi0hXz4nQgRg7227Gdvg20uhCpSTb1KqUvEFExg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VeNkfJhi0hXz4nQgRg7227Gdvg20uhCpSTb1KqUvEFExg@mail.gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 06, 2020 at 01:55:21PM +0300, Andy Shevchenko wrote:
> On Wed, May 6, 2020 at 6:48 AM Mattia Dongili <malattia@linux.it> wrote:
> >
> > On Wed, May 06, 2020 at 10:48:43AM +0900, malattia@linux.it wrote:
> > ...
> > > Reported-by: William Bader <williambader@hotmail.com>
> > > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
> >
> > William notes that he didn't report NULL pointer dereference and it's
> > only in Dominik's report.
> >
> > Do you want me to send a v3 or can you remove these two lines from the
> > commit when applying the patches?
> 
> Yes, please.
> 
> Also, add Fixes tags to both of them.

Done, just sent v3 out. Once this hits Linus' tree, would you agree I
should ask for inclusion in stable?

-- 
mattia
:wq!
