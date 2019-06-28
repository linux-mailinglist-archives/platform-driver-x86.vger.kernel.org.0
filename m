Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 513C55920B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Jun 2019 05:38:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726565AbfF1DiN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 27 Jun 2019 23:38:13 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:37933 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727143AbfF1DiN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Jun 2019 23:38:13 -0400
Received: by mail-lf1-f65.google.com with SMTP id b11so2988417lfa.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Jun 2019 20:38:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PFAR1VyfRz8u+8JtXBWHxsN9qbzCO9vgXJys4jNPevE=;
        b=DnAq9wWeUF4/tJ3xd3/E9iDEp59E1DKVpfYYqcNoRE5ld6ONQQVSXKRfVv8MwTIztr
         pPKNz/8t16wutRg1tu9CGKqaTYhkfLeZbJQ3bd79Z32xN8k+MblNR37mKCk4OutG7fRr
         23GdKdtowzQcjVaKAHLqU3KZ2UrpmnLSAtCH7ubUagYI1/yuOcw6IjNQAjb+ksr1tMrT
         SmvrYAemTbPAKMKM3x3S9NFI//CpXPF6AnmQybzEoLJmFdOEyKR1K9kQepsLBUNc/DJN
         weCD9AuNxwE9DoKFa9ZVOt/s8+oeDOdkMlQjZAdy6nkwsSf7EEvSQFbkCQb1XaOOmhEb
         Sdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PFAR1VyfRz8u+8JtXBWHxsN9qbzCO9vgXJys4jNPevE=;
        b=B32DmuRSO2paB+jhJE/ZOOX34TPP+c1PMct4e+IW3ZepqggM/jWlsbjw47QmK1tFwC
         YYkXQCtoSjWRenccXm4uxuGl2lblAT+Vl0sQELHswflZni8PJ2CXehVnLwyPoaQwV6re
         y4UnetZZmbXmU/4XUPdBs+j6VY8ROGwSgfxWHQkMxOIsedK3XDFPpYWDvrN4CQioLWu0
         NSoYjwnqmIFiWUAjO5bbyRwZwmgvyCm0I1FTytzsR1tDvOQ455NzI5PCZfwZAjoHJ+0i
         tP0eKPUTtHLWTuh84a/mT4EEzWzy3NOvtfNLGMm6b3+19HBWBMndH9JvM440v9G/oViX
         GFWA==
X-Gm-Message-State: APjAAAX6bmRhQ019Y6eloF3sj18nrGLHMBRa365dUkSOub8jDEiWtxDz
        FDeQQPJIl9TlG2sbgoStCLZfQweFKHJYNGOSIoEqRg==
X-Google-Smtp-Source: APXvYqzx4zeAdw9gJozkJfqZ8idmtP4uO628k0/UGSICcNueyN6ahlH9h046vJEG/h4JYKM/NJ/Oulviun3B640f9P0=
X-Received: by 2002:a19:ed07:: with SMTP id y7mr3996030lfy.56.1561693089958;
 Thu, 27 Jun 2019 20:38:09 -0700 (PDT)
MIME-Version: 1.0
References: <20190508173403.6088d0db@canb.auug.org.au> <fa0e68b2-b839-b187-150c-13391c197b99@infradead.org>
 <CAHp75Veq2=XA124rG8urt3eVE3pcaUm0VdsV7Mxr9zjMpa7mjg@mail.gmail.com>
 <CACK8Z6F2v8nyUYcnOrkp81WfK2D2NEmK=pcWybn1annrtqRwew@mail.gmail.com> <CAHp75Ver=TNKxh8rdJs1xQYSLNsRLfEoFtcGG6hViug=cF6s_g@mail.gmail.com>
In-Reply-To: <CAHp75Ver=TNKxh8rdJs1xQYSLNsRLfEoFtcGG6hViug=cF6s_g@mail.gmail.com>
From:   Rajat Jain <rajatja@google.com>
Date:   Thu, 27 Jun 2019 20:37:33 -0700
Message-ID: <CACK8Z6FN62e041-dwri6S+-34wSOxSsTAPjRmSw44uVJhtRz-A@mail.gmail.com>
Subject: Re: linux-next: Tree for May 8 (drivers/platform/x86/intel_pmc_core_plat_drv.c)
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Stephen Rothwell <sfr@canb.auug.org.au>,
        Linux Next Mailing List <linux-next@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@intel.com>,
        Vishwanath Somayaji <vishwanath.somayaji@intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andy,

On Tue, Jun 11, 2019 at 12:06 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, May 9, 2019 at 2:15 AM Rajat Jain <rajatja@google.com> wrote:
>
> > OK, NP. Just to be sure I understand,
> >
> > 1) Please let me know if I should send in a fix (it would be
> > #include/linux/module.h and also add MODULE_LICENSE() I believe)?
> > 2) Would this be lined up for next version though?
>
> Resend a complete series based on the latest stuff we have in our
> for-next branch.

My apologies for the delay in resending. I just sent a v7 of the patch
that was dropped:
https://lkml.org/lkml/2019/6/27/1264

Only 2 changes from the v6:

#include <linux/module.h>

and

MODULE_LICENSE()

Thanks & Best Regards,

Rajat

>
> --
> With Best Regards,
> Andy Shevchenko
