Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0634E1C6EC7
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 12:55:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727825AbgEFKz3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 06:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44848 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725882AbgEFKz2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 06:55:28 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB0DCC061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 03:55:28 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id ms17so687221pjb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 03:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E+dYRXPOuvw44CuuCZB06hVJQSr4M+8TQtofUy4dFe4=;
        b=Od7ZD7LMmacFnsToDyd6hGAxaa+6KwcsCMWoXQ3UGAEf9TCVfMSzRCOMZjd7mXioZe
         5xHJVLS+rYw6wopxhTdSUFiwbC8JpSoKfg6qo06A+NaE+oRUdO+BdoFx0j7bgYNZ4ZQD
         15VVfsVormn8bdJBk2t30waISqQkWNlp+w7PxKrELShATFPm7IfH8WG+u/LQn8uKwiiR
         CODYBA/b3KE7gYPtro89tJLe144dw+TVlxKrVbHkOTQT3jB82nIOG8hAgQ+uEV6Tmye8
         pxaabBPymw1C8Vtr16s6e1XlQN3L8mChD8vxYNWg9aS2ZVR+6QjKfjn2RTU5j9SauSxo
         kINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E+dYRXPOuvw44CuuCZB06hVJQSr4M+8TQtofUy4dFe4=;
        b=OSRiQKnJhoaGDwtZU9WxsB/NvblZ8dKH/ZNKNXIqfY1ty0Y/PBtgr6B30s9zfHUE3d
         jzST96HclgNu8QcIp3YWAhIMaQkRBSN92J72LoJN9Q8P/RiH7yQYsspyOQkup6TdYAbF
         pSk5BTAhMTStrcCNZ2zhMhWm38dYBYYDbdcXe4p6A9r6nBfHUPlE4y2VlIx4U5EpUOw9
         AcKdY+aQi5QfsiAjYJild7FSCyykGm3e4AjhuqA/46wJm40cEj3cTIZInWxCJTAy0J1L
         nCUWM6jMXbVYmUg1pYb50bB1zd1mEOFF0xiLzJHMRhYJ59pNu2wT508cyV8F+lWIfyWk
         lpoQ==
X-Gm-Message-State: AGi0PuZkmum3gGVk3Alo+NDt9zw2kkLLc2SrsDK2vK9s8G0LBI+HVKhg
        EwNMFmLfV4R7hNdM3gbp10oS7+pMYq89m6z9vB8=
X-Google-Smtp-Source: APiQypIUo8R6xZP87neP6EhdxYYRK2hR/hPXviewbJ9DxDbqhymq7W+AUFGVWDKimGjevUxOtq5KNicXwVTw1vq3nro=
X-Received: by 2002:a17:902:6901:: with SMTP id j1mr7136852plk.255.1588762528273;
 Wed, 06 May 2020 03:55:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200506014843.18467-1-malattia@linux.it> <20200506014843.18467-3-malattia@linux.it>
 <20200506034758.GA18684@taihen.jp>
In-Reply-To: <20200506034758.GA18684@taihen.jp>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 May 2020 13:55:21 +0300
Message-ID: <CAHp75VeNkfJhi0hXz4nQgRg7227Gdvg20uhCpSTb1KqUvEFExg@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] [sony-laptop] Make resuming thermal profile safer
To:     Mattia Dongili <malattia@linux.it>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Dominik Mierzejewski <dominik@greysector.net>,
        William Bader <williambader@hotmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 6, 2020 at 6:48 AM Mattia Dongili <malattia@linux.it> wrote:
>
> On Wed, May 06, 2020 at 10:48:43AM +0900, malattia@linux.it wrote:
> ...
> > Reported-by: William Bader <williambader@hotmail.com>
> > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
>
> William notes that he didn't report NULL pointer dereference and it's
> only in Dominik's report.
>
> Do you want me to send a v3 or can you remove these two lines from the
> commit when applying the patches?

Yes, please.

Also, add Fixes tags to both of them.

-- 
With Best Regards,
Andy Shevchenko
