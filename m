Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7607322097D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jul 2020 12:06:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725900AbgGOKGV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Jul 2020 06:06:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725838AbgGOKGV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jul 2020 06:06:21 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38290C061755
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2020 03:06:21 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id md7so2744832pjb.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 15 Jul 2020 03:06:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5HJsK8ZPfAjwsY6t0ULIJ+idLrWXKovaf2VAE6fs4SI=;
        b=RP5NpvJYjYiJjhJ2zghg+BJuZQ7VY4qaiiZNKiAnQewiuqB/8JRxj87aeckHuuJd/I
         h1SgpIEJ7yGHz9Wf+j7JdnlVKI1KL5FFR8TncJ55A93nYLzRJRyoZRGjvmU39tVFuWm5
         U8xCwQCAAYQGS+GxNwql354AVX5RjBIxOLpWL8jOxhFSbLJ8z8nBM+u5OS2NISYWz6K3
         SBBMfWUzezhPLuRUliyGMyaNbNUCcdi+d8JlN3YF4LZ/Dmio8Dx2J8dWXeAU4QX/L/0+
         tibyu9X9T6afdNpL3Vp1OfLee5KjvZj/xsgdFH2L0ObZlBnuF4PNHcyMwHLEozBQJJo3
         cVOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5HJsK8ZPfAjwsY6t0ULIJ+idLrWXKovaf2VAE6fs4SI=;
        b=nX0qww9VQRxjDtjjnDcaKldawvH4P0QyyXQns18hkdlqpcxi2xT6nGcF0dy/JIs4ma
         ANxwLDAKXsDFhDDiaqH0VvKcu3lsNURiRh1hylbvwPIIX+ZW/AgebW+DjPUYT5ztD+FB
         MTfLbPfd5cysvNvf4kQ5hF9nVy673IBsWTV5NVuX//Wx77Ipbz2o3L8hA4x7Nk129174
         d8X1vA+YxAfovAOrvunpfokRYxaKGGZwu2t2zpGHMecDUTbI21EBW/0c7BhW3mHtduBa
         MmfDl8biadD25PG+osiEQjOZY5dA4Bb4YymIhY8l0eNxBKYYKRHy2aRn2XM7N/fYsJUd
         7qNw==
X-Gm-Message-State: AOAM532/jZlp3F5oAZPjuy8tZ71P5jhhmuHTvwpAXI4Rdo7xbUL76TqP
        e8xqVJu0SP/tZkyu9SVTJhnlM3hCyCEyS2NCuNo=
X-Google-Smtp-Source: ABdhPJysLhWQruc3//MNp6n+HC8r6mIhI6MfKnQVI30TD2+7IiQnx1nfKyOJDHfLza86DCm1sa/3RYN9MRPSchqYJoE=
X-Received: by 2002:a17:902:9a4b:: with SMTP id x11mr998403plv.255.1594807580701;
 Wed, 15 Jul 2020 03:06:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200714104250.87970-1-andriy.shevchenko@linux.intel.com> <6920cff7-ab7c-a4ef-4f8f-83966b7bf498@redhat.com>
In-Reply-To: <6920cff7-ab7c-a4ef-4f8f-83966b7bf498@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 15 Jul 2020 13:06:04 +0300
Message-ID: <CAHp75Ve2LKjjy3o_Bzu4ce-YO_fSQ721L4KknRMtUgt1nhJoBw@mail.gmail.com>
Subject: Re: [PATCH v1] platform/x86: thinkpad_acpi: Limit size when call strndup_user()
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 14, 2020 at 4:30 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 7/14/20 12:42 PM, Andy Shevchenko wrote:

...

> > +     kernbuf = strndup_user(userbuf, min_t(long, count, PAGE_SIZE));

> This is not going to work:

You are right!

> Can we please just go with the revert for now?

Yes, I have reverted it. Sorry for troubles.

-- 
With Best Regards,
Andy Shevchenko
