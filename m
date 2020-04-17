Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2550E1ADE9D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Apr 2020 15:42:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730688AbgDQNl1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Apr 2020 09:41:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55934 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1730656AbgDQNl0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Apr 2020 09:41:26 -0400
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8450C061A0C
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:41:26 -0700 (PDT)
Received: by mail-pg1-x543.google.com with SMTP id g6so1118999pgs.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Apr 2020 06:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zLfzTMcEEPMwJ36vHy5FxyZpY/A9BC4zr5eXkniVFnU=;
        b=lwVMsXgPWqe/k/ujLTGksGcAWFLga1SzGXVDA2vqL7XQRgG2PXFTqZemrgeKTaVCs5
         YoAZ+xndTscvet/K0nUGV4EUUyEnDxYLwVjFBLnlxX73MhTXf2AGBjajQVsl5O6Q37AJ
         dusmy68VRgZb2jiRxBwhBKOBOhOWyN1vJd2HTgM8aZcNDZ7O1J6Jn6YQS+79Zr0HrSi+
         FBxUubIPzKd3SUsaeki1PRsdnJ7Rm+ljqywOzbslS2KeE1nsTO/PkSM5CriwAHqsFU/F
         S/8gdzY+Ve2qwbb8MJ+MH1yLkMcBvLmdCzDQr75lwmowfFhPYQuxSpbrlKCLi1xKT07w
         XlVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zLfzTMcEEPMwJ36vHy5FxyZpY/A9BC4zr5eXkniVFnU=;
        b=bia8My8StqRzCkhp7zXcQQ92qSpI/levfLXHnbTaV9Cv8u2MNOoH2a7pl/OUXBNrgP
         ToQL9cmMrLgHvjU/fD7RE0m5VA8Bp+7NgCiYXOcoH5GbjYCiykTATcufaopU8zSmQrdm
         CtftuYcIQxgLMZ02NJy98kUwZbBcpOaF23sQDpvnLAM1afAdmaYexC32mP2vQnJesLZZ
         rOPPtL+kaG5UD1dYo+tJQ4czfxijpj7JkFlQxL6BxwKlDT/gxTs1SzynW0XjHe8C8hYq
         YOYoj6sZJvH1Q3WL8GQVgjMwunf6s2800U+/7FFyjbMpkRS0wth5vVqF+FeTPAyD2iDJ
         l/gA==
X-Gm-Message-State: AGi0PuaFvMc9DwFkK5/XXehROKMj0jEZkSvPPsM//5THAc0epIRwXCw9
        LQD8uko0wWIRL9i9z99+dBDpZCS6PE982DLGcQTbyGQTb7tRO8oN
X-Google-Smtp-Source: APiQypLPQ/FIlhC7YVc6coplU1QuQ67kQesrbChZCFCW8ZtbTu0B/1Fz9SGa9OXUnfyn/TT4EDj8EINDgI48WKYcOpg=
X-Received: by 2002:a63:1d4:: with SMTP id 203mr3000897pgb.74.1587130886247;
 Fri, 17 Apr 2020 06:41:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200408024200.40268-1-yanaijie@huawei.com> <94de8f52ebc2148bee3895153602f16af24e87d4.camel@linux.intel.com>
In-Reply-To: <94de8f52ebc2148bee3895153602f16af24e87d4.camel@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 17 Apr 2020 16:41:19 +0300
Message-ID: <CAHp75VcFeX7qoQZZYF1VQjpvYG=fhjBjyxfaJS_R6ffZvOCFYw@mail.gmail.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: make uncore_root_kobj static
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Jason Yan <yanaijie@huawei.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Apr 8, 2020 at 6:36 AM Srinivas Pandruvada
<srinivas.pandruvada@linux.intel.com> wrote:
>
> On Wed, 2020-04-08 at 10:42 +0800, Jason Yan wrote:
> > Fix the following sparse warning:
> >
> > drivers/platform/x86/intel-uncore-frequency.c:56:16: warning: symbol
> > 'uncore_root_kobj' was not declared. Should it be static?
> >
> > Reported-by: Hulk Robot <hulkci@huawei.com>
> > Signed-off-by: Jason Yan <yanaijie@huawei.com>
> Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>

Pushed to my review and testing queue, thanks!

> > ---
> >  drivers/platform/x86/intel-uncore-frequency.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/intel-uncore-frequency.c
> > b/drivers/platform/x86/intel-uncore-frequency.c
> > index b96d172eb2c1..12d5ab7e1f5d 100644
> > --- a/drivers/platform/x86/intel-uncore-frequency.c
> > +++ b/drivers/platform/x86/intel-uncore-frequency.c
> > @@ -53,7 +53,7 @@ static int uncore_max_entries __read_mostly;
> >  /* Storage for uncore data for all instances */
> >  static struct uncore_data *uncore_instances;
> >  /* Root of the all uncore sysfs kobjs */
> > -struct kobject *uncore_root_kobj;
> > +static struct kobject *uncore_root_kobj;
> >  /* Stores the CPU mask of the target CPUs to use during uncore
> > read/write */
> >  static cpumask_t uncore_cpu_mask;
> >  /* CPU online callback register instance */
>


-- 
With Best Regards,
Andy Shevchenko
