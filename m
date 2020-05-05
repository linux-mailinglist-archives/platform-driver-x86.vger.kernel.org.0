Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0F5E11C590D
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 16:21:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbgEEOVm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 10:21:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729774AbgEEOPQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 10:15:16 -0400
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com [IPv6:2607:f8b0:4864:20::541])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC25FC061A10
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 07:15:15 -0700 (PDT)
Received: by mail-pg1-x541.google.com with SMTP id l25so1083522pgc.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 07:15:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=4T/1THeMK30Pjwc7YstLkMILBhwbRY6HvN67uy7RCXM=;
        b=uDYwSDlDaeX3aBxb5h+lUVhEuXE0hBvfKj3hLtI4N80qRG60IVz295bJwqFxeeEvp2
         t2LY9Nrglp8plAEUuKyef5sA0rl+OvEFlrI+/rHFcIa7RVcsf6qUgEtR7EsOhMoJnUF1
         hM1/vJTalKAVzC9ui6sc8V25RrDxw2dfyn4BJgS7ffXQR/GbFnDrrBQfrGwcpLc8b+tS
         k7Lg3QxwzlYvVkUaIKin0k+cbDqEmQA37KgPDclXMHQrROv+2ZEb2qoJTgQA8+b0z6v1
         +vuz5zGvvN/tSiJmJviR66jg54/KgrRjvJare/tifno4AzW+Vdtuq4Zw3fPoPK7kDTQj
         ADfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=4T/1THeMK30Pjwc7YstLkMILBhwbRY6HvN67uy7RCXM=;
        b=jnrv+BUkQI46iYZ8oz5fecdkhn2ezPnDzzReL3xO95YEu8lRXX+V74jpHhbbYMHUfC
         LbGaGFKDFfbODvrGzi5XXbdPwjX6MqtvrzC0H+BMOpY9xNYUy6RPgeL+kiMsw+cchA8/
         s91nWnSUlELsDRE3K9gJhff2hR7aDdw22H5QCggewMmQMqhesKRtbw4LoAUh4qpoqrNb
         jtbwNsmivUNV3PbmGH4bkvtI3Y7cBaz3Nm47h0uF+Odvgpru21MJjItBy30KCzv8g5mp
         XYnlX1CoqdrtenYcO4nLpdwSpR3ufvrFbpDUFPj7UF51+FdQzvwaHU6pw/f2L+GQIox3
         Ffjg==
X-Gm-Message-State: AGi0PuYy+7cQ7PQG9AEUvV6fj0sOdnyR7h98JnOYW2dFX4b7WJOFLqIg
        iIGOFm+GS2OZHDjZPqggtTY=
X-Google-Smtp-Source: APiQypKPnGouryoU03cgpptH4xaa+pC5Bn1rqr6ifyDtL9nwcdi0kVho9+qSBzHiewTfjt5LT9eHtw==
X-Received: by 2002:a62:3812:: with SMTP id f18mr3267489pfa.173.1588688115259;
        Tue, 05 May 2020 07:15:15 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id g14sm2141269pfh.49.2020.05.05.07.15.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 07:15:14 -0700 (PDT)
Date:   Wed, 6 May 2020 00:17:31 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
Message-ID: <20200505151731.GB119615@taihen.jp>
References: <20200505111810.65586-1-malattia@linux.it>
 <20200505111810.65586-3-malattia@linux.it>
 <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
 <20200505141948.GA119615@taihen.jp>
 <CAHp75VdGemLeyujDZZ+fPZn-0hhTVcQjNkjU0MNEGJ+WS+ouSw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdGemLeyujDZZ+fPZn-0hhTVcQjNkjU0MNEGJ+WS+ouSw@mail.gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 05, 2020 at 04:26:18PM +0300, Andy Shevchenko wrote:
> On Tue, May 5, 2020 at 4:17 PM Mattia Dongili <malattia@linux.it> wrote:
> > On Tue, May 05, 2020 at 03:38:15PM +0300, Andy Shevchenko wrote:
> > > On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> > > >
> > > > From: Mattia Dongili <malattia@linux.it>
> > > >
> > > > The thermal handle object may fail initialization when the module is
> > > > loaded the first time.
> > > >
> > >
> > > But isn't it a papering over the real issue that it fails first time?
> > > AFAIU user needs to try first time and if it fails to try again. Can
> > > we rather understand the root cause first?
> >
> > I think this is a bug regardless of what ACPICA does.
> 
> I didn't speak about ACPICA.

Oh wait. Are you talking about my wording "when the module is loaded the
first time"?
Maybe I should have written "when the module is loaded in the first
place", I suppose that's clearer in English.
Initializing the thermal handle should fail consistently (unless
the system is low on memory and magically recovers just after failing
acquiring some memory in sony_nc_thermal_setup).

> > If the driver fails completing whatever initialization, should it not
> > avoid dereferencing a NULL pointer on resume?
> 
> Yes, but *why* it fails?

In the case that was reported in the linked bugzilla, ACPICA behaviour
changed and the driver wasn't quite ready to deal with it (which is I
assumed you were talking about ACPICA).
Instead of quietly performing the functions it could, sony-laptop caused
a NULL pointer deref on resume. sony_nc_thermal_setup failed at some
point and th_handle was then set to NULL on the way out of that
function.

The sony-laptop driver is entirely reverse engineered from DSDT and
corresponding behaviours in Windows. There's probably a few reasons why
loading thermal profiles could fail, but the most common is probably
because of newer Vaio models using the same SNC function codes but
having a different interface (look at sony_nc_backlight_setup for an
example).

Arguably, a better fix could be to fail loading the module if any of the
SNC functions fails initialization. The downside then is that those new
Vaio models that are only partially (in)compatible would remain without
*any* SNC function until some kind soul comes along and reverses
engineer the new behaviour.

Another (possibly better) fix is to keep a list of which functions
successfully initialized and only attempt to resume those instead of
blindly going through all the known ones.
I'm not against this last one but it's quite more invasive.

-- 
mattia
:wq!
