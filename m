Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B43141C5691
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 15:17:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728933AbgEENRd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 09:17:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728927AbgEENRc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 09:17:32 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BE3E9C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 06:17:32 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a32so1092152pje.5
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 06:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=yxJC2ZLScdF3KW3kUgydrQlkIkxdLZTRd1z6AdnQm4o=;
        b=tq9bYMShYwGbzsCGyAKAGqz6uCn5h8SLd38g1LIZroMsBKanCfAtHFregg/Wf0M8Oo
         AmB2zmFDlpsTadj14+qk1YIDkMuGWVwoBmSQIjf5CBVTagnLhfc5dxuLg1szF83hg8qF
         wq/Zuyz5yG5rPo/MSi6Ou7mIg9yR9BerYYGpqwS5jkPfRfM+J92yqx6LJkq0JG6JNWiC
         UE0ZIK+BmhVLICMlJtp9fnT4gREyUpSXSv2bWNXxeb/EYQ0FuewKVj4O31RLUJ+20Dgc
         ScskImt3jFfiYus3ZM8R3xkCVGviChDCfHNLv59Dyjap0/noO/OXczGMD4I7AFwGqgMz
         6G8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to;
        bh=yxJC2ZLScdF3KW3kUgydrQlkIkxdLZTRd1z6AdnQm4o=;
        b=Y0FSezoxa1M1ha35z8EBZiytZaseEZOd1coQIpBCemDyA5wwexXvMHbGg6v86eEb2m
         KdiFKgW2oB5STBbe36kWFB2QHGTDSjb/QhU2S3wbnXFvZk11czgg1zkJ+g5NtDkJuSlJ
         WYsHLFYexNtAYtwKmbgNSNzs6GPThG3f12c3Ev2PfA/RWQ10fxV6OT/hyH4tP2V7NSDR
         Q3g1zhDFm2OktkLQhiSMKJiOuMppix70/ehdbaulgrxwIz9eYl4BvZgQa4ppDSphYsMK
         S4g0JSph6HMA6fEHoBlsUu6/ULdqPw8zi2gBXxOIhTiyjhFkagKmtM3kzYKJ5yKGRDmZ
         ZGCw==
X-Gm-Message-State: AGi0PuaQkMzZYLgpEmiV/lTZzMTp6rm9L/xsEi2yOtMHLzbIChM4uTFc
        IB8pIOUA2btqV+f/brK8OMw=
X-Google-Smtp-Source: APiQypJRhmmWO2JvxqsQz3SWewE2KikbET4bp+qCrAERrOuV7RRYC22mdVvxQitooAfGt64y3hKs6g==
X-Received: by 2002:a17:90a:c702:: with SMTP id o2mr2986144pjt.196.1588684651621;
        Tue, 05 May 2020 06:17:31 -0700 (PDT)
Received: from taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id h193sm2087121pfe.30.2020.05.05.06.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 06:17:30 -0700 (PDT)
Date:   Tue, 5 May 2020 23:19:48 +0900
From:   Mattia Dongili <malattia@linux.it>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Subject: Re: [PATCH 2/2] [sony-laptop] Don't use thermal handle if NULL
Message-ID: <20200505141948.GA119615@taihen.jp>
References: <20200505111810.65586-1-malattia@linux.it>
 <20200505111810.65586-3-malattia@linux.it>
 <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75VdCsscavP5sGrMjk5dWFZDYjevW94_RNRw50nAaM3jQpA@mail.gmail.com>
X-Message-Flag: Cranky? Try Free Software instead!
X-Operating-System: Linux 5.7.0-rc4+ x86_64
X-Editor: Vim http://www.vim.org/
X-Disclaimer: Buh!
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 05, 2020 at 03:38:15PM +0300, Andy Shevchenko wrote:
> On Tue, May 5, 2020 at 1:16 PM <malattia@linux.it> wrote:
> >
> > From: Mattia Dongili <malattia@linux.it>
> >
> > The thermal handle object may fail initialization when the module is
> > loaded the first time.
> >
> 
> But isn't it a papering over the real issue that it fails first time?
> AFAIU user needs to try first time and if it fails to try again. Can
> we rather understand the root cause first?

I think this is a bug regardless of what ACPICA does.
If the driver fails completing whatever initialization, should it not
avoid dereferencing a NULL pointer on resume?

-- 
mattia
:wq!
