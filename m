Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 28BE81497A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 14:23:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725852AbfEFMXl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 08:23:41 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:38625 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725827AbfEFMXl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 08:23:41 -0400
Received: by mail-pf1-f193.google.com with SMTP id 10so6691448pfo.5;
        Mon, 06 May 2019 05:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qJlbbJUk/umc1r+ihS+Nt/YsegxyHF+juTXFN4glmIU=;
        b=QVCadkqe16PIEow/jPRhbFJA0mFn05X+vsdVJLqrma0xlVK241GySq3hdRx8Wip8JE
         3p8KXEZ5Iizcb5CZTR3On9YNo+5XS1dDJzZmy1xV2BxMTGmUqB5kUq2rCnfKUJHlrtvn
         iwz20GdlGD2wnPHRBNVDIcsruBmEDZyeKC36ZrQPcBGawY9mU3yhxdW+wDyPwh0FdzkH
         tiSqTo7HCv9Ffe3SYgmyo3zX+HZTduY1fLfUFyilScZdPhWGix1AOfT4pNnCWv/jVaMC
         pfUaiMeoH4COlSazbcC9fzeSRSsJaJVDZGa0C653vKeYB/l8AtFVwh2oQxliOnr86pP2
         vvCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qJlbbJUk/umc1r+ihS+Nt/YsegxyHF+juTXFN4glmIU=;
        b=Nkvz7DaxpQXDSAaTibvlHEFj0C8h301YE0Xg6U/5roahkNzsB9XYC3xM+6YVcMqDJ/
         jVlnq2XJFZ1co1XM+cVFonOdlh5/H+k4vmped/NfsUKldDkO6Q5XBd1OIxKBWPk7Py1J
         ZsGQ909KAVO905aXWMRNdUGiYDxACK0DMMwGgt7biC2vCBLqrtCfu/B80jhLmQRxnXNL
         MGBffABmSHVtM8EeOv/fVzfFN3shwGtS+sHQHVn3lHmgkn66ui4TRGOln6az7/MMVd1M
         b6eU8wicsDqvZFfkl86NJ/r5DCGNAl+2ox3sI39RDTSoH7HPVA7oRzE3QugJmwN3IAPf
         VOVg==
X-Gm-Message-State: APjAAAWtgCk9d7y59SUrx2RCw1yPUC2FyCHIAu9ILAWdvgwy+W2ytSBQ
        Lr3xVqK0aEeVTfSf9beJ6LvSAkNtE1unfqm3cCk5QvHqZij+MNH3
X-Google-Smtp-Source: APXvYqxgw7T/k2WnlhwTtfeHP2cADfa7pTdDasyWFNl3Yud4Kq/cNba/YU3KNmRclaZZDv7diT/qJSwVuzern7EBrq0=
X-Received: by 2002:a63:42:: with SMTP id 63mr31668620pga.337.1557145420565;
 Mon, 06 May 2019 05:23:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190424094417.GA15818@mwanda> <1556109784971.72307@Dell.com>
In-Reply-To: <1556109784971.72307@Dell.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 15:23:29 +0300
Message-ID: <CAHp75Vcww6YbHcimpiYWV==9-CQzXjwsbVF+EOA3rKmdU4Wm9A@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: alienware-wmi: printing the wrong error code
To:     Mario Limonciello <Mario.Limonciello@dell.com>
Cc:     Dan Carpenter <dan.carpenter@oracle.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Apr 24, 2019 at 3:43 PM <Mario.Limonciello@dell.com> wrote:
>
> >Fixes: bc2ef884320b ("alienware-wmi: For WMAX HDMI method, introduce a way to query HDMI cable status")
> >Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Pushed to my review and testing queue, thanks!


> >---
> > drivers/platform/x86/alienware-wmi.c | 2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/drivers/platform/x86/alienware-wmi.c b/drivers/platform/x86/alienware-wmi.c
> >index c0d1555735cd..83fd7677af24 100644
> >--- a/drivers/platform/x86/alienware-wmi.c
> >+++ b/drivers/platform/x86/alienware-wmi.c
> >@@ -587,7 +587,7 @@ static ssize_t show_hdmi_source(struct device *dev,
> >                        return scnprintf(buf, PAGE_SIZE,
> >                                         "input [gpu] unknown\n");
> >        }
> >-       pr_err("alienware-wmi: unknown HDMI source status: %d\n", out_data);
> >+       pr_err("alienware-wmi: unknown HDMI source status: %u\n", status);
> >        return scnprintf(buf, PAGE_SIZE, "input gpu [unknown]\n");
> > }
> >
> >--
> >2.18.0
>
> Yes, thanks.
> Reviewed-by: Mario Limonciello <mario.limonciello@dell.com>
>


-- 
With Best Regards,
Andy Shevchenko
