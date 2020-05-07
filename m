Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 92B6C1C9F3F
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 May 2020 01:41:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726514AbgEGXlJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 19:41:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50524 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726464AbgEGXlJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 19:41:09 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EEEA3C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 16:41:07 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id m7so2742601plt.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 16:41:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SU+RdSW+lyTIyroivBlHdDo6QuKxyXAD2woWZBj/TO0=;
        b=OO2XohfHHHwgaF2DGUDzSRScplaHFSlbe3vIJKfWVTH4OKMwUjgMnTK8GwOfbJ/N+m
         PTO3smyyeK6m4aKsRwwoAPQnFrAgGFx4SW0UaxoqcF1vex2pl6qKO6wsRU2Wc2rrFO3y
         c/yJs7WuROHhJyiSwlMCLoJF9fnddS594Tx3jTjc/EHXKTAIdZsAEe8cc8rK12arbuL1
         Ly78FvNmM+YxTc1NMsl8J1DcM9+yPQ05oux74Xttlkm+jyg4kr+0lDfuVY4nTEeFP1Po
         dP/T2DWZybWHqrfM63+Nzhpe5CtW5xzMjIQl9hPNCygKfIN9Qo5SuusBbLVPuAkgqO2m
         pCKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=SU+RdSW+lyTIyroivBlHdDo6QuKxyXAD2woWZBj/TO0=;
        b=sMfbH9GOP1CEjVTHhc0PNFyr1ZwIRSrdXNvib3B9t4FmB4faImmq3B4kEIYVCGfN4B
         tgNFikpxiJg6bXigWBSU6i1Cv5XS1jHIFOXGPfaCt3bYx7QbpmXSqgHVDwMPE7A6Gl9h
         3+ocpE7+k71Xjw1xRYZhus80YANm2ISMAunT+pJWyw26oUNCnUO2rLM6GBWGvlbjOGPJ
         6pQvwsvQdACnTWoaCj2e9e36DJlKOPtqif4KWSzD/busBImVVzHMnaH23yNl3UBCBPkW
         7VwFknimHVqqpZE6RhzSXU+m9XqGs/M2EMDpEwPiDqidoTHXQUhdbmggivaHKVi7zyBd
         IESw==
X-Gm-Message-State: AGi0PuaBEUukcov/TbklRbumMhyToW6g8MJNI7Hn9gHkWV+/oRpsH9GW
        XcrBWn8PJbl0YwVRmPdQOMU=
X-Google-Smtp-Source: APiQypIPK02yaiv+4U8zA9V+VEGmkU3ZpXSbq01klLIs/3y0FfldD+VNXOfZdf4KxGCMIwrnVS7ykA==
X-Received: by 2002:a17:90a:6488:: with SMTP id h8mr2846960pjj.51.1588894867336;
        Thu, 07 May 2020 16:41:07 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id bo19sm821362pjb.26.2020.05.07.16.41.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 16:41:06 -0700 (PDT)
Date:   Fri, 8 May 2020 08:41:00 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH v3 1/2] [sony-laptop] SNC calls should handle BUFFER types
Message-ID: <20200507234100.GA17187@taihen.jp>
References: <20200506121630.72382-1-malattia@linux.it>
 <20200506121630.72382-2-malattia@linux.it>
 <CAHp75VfHCx6Vt3gTejyCDFSw4U+yCZ5kgTVCpWLzrj02Aoj5Wg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VfHCx6Vt3gTejyCDFSw4U+yCZ5kgTVCpWLzrj02Aoj5Wg@mail.gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, May 07, 2020 at 09:23:21PM +0300, Andy Shevchenko wrote:
> On Wed, May 6, 2020 at 3:16 PM <malattia@linux.it> wrote:
> >
> > From: Mattia Dongili <malattia@linux.it>
> >
> > After commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
> > objects for ASL create_field() operator") ACPICA creates buffers even
> > when new fields are small enough to fit into an integer.
> > Many SNC calls counted on the old behaviour.
> > Since sony-laptop already handles the INTEGER/BUFFER case in
> > sony_nc_buffer_call, switch sony_nc_int_call to use its more generic
> > function instead.
> 
> Thank you for an update.
> 
> ...
> 
> The patches require prefix, "platform/x86: sony-laptop: ".
> I fixed it for now.
> 
> ...
> 
> > +               // do nothing
> 
> Use C99 comment style, please.

Maybe you mean *don't* use C99 comments?

> ...
> 
> > +static int sony_nc_int_call(acpi_handle handle, char *name, int *value, int
> > +               *result)
> > +{
> 
> > +       if (result)
> > +               *result = 0;
> 
> I didn't get this part. Does it mean we always have to reset result?
> Sounds like a design issue (usual pattern is to ignore output in case
> of error by caller and to avoid touching output by callee)

The sony_nc_buffer_call copies data into *result using memcopy, if there
is less data than sizeof(*result), it may leave some bytes uninitialzed.
I agree that resetting results here smells.
The reset is still necessary, but I'm turning to use memset inside
sony_nc_buffer_call if there's a result to copy.
That should respect the pattern you described.

> > +       return sony_nc_buffer_call(handle, name, (u64 *)value, result,
> > +                       sizeof(*result));
> 
> Oh, this way for troubles. You supply pointer to int and force it to
> be u64. Not good. See how above function has been implemented in this
> sense.

That's right, thanks for pointing it out.

v4 incoming.
-- 
mattia
:wq!
