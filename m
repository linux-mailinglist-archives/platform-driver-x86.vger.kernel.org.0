Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC65521A793
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Jul 2020 21:10:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726196AbgGITKu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Jul 2020 15:10:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726163AbgGITKu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Jul 2020 15:10:50 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50FC5C08C5CE
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Jul 2020 12:10:50 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id f16so1534039pjt.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Jul 2020 12:10:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ChrSgIkNpJkKvnj3uRG690E8qvQYl9tznomNf79QgO4=;
        b=TztWvoMzxCZCxTKOHxpzmKKQA1HBf9H/JUs1Rz5nPc0ktzsvegNgjfHg+8jTdJZkI/
         NXcozPWDr22E1aMFc95P7qR4W0Rc+c6g7G8vc5xvgHN9JiCrkD6kTlLuJ+CSNcoEZ7SK
         remvk0cUSAmI+mTZkd0WYD6R7SB0cjtUuOS4WeiFQ3YPZDM9LnepzZrDk+r1ikalM0AV
         vZnTk6DqigEdGhbaWae6HeuPrO6KebfL0N4H7Yjyz5uUpPnlxJZFGtgHQLJoaa1WVsA5
         0BVBsCKx1AxdBJxgxrn9zZdbNcWMKoRVamI0bjuUo1LGvCyOdJszJrovRFW7t+IVY+ox
         PIHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ChrSgIkNpJkKvnj3uRG690E8qvQYl9tznomNf79QgO4=;
        b=NMDkzMLqUOLlqu8CyVvqcg+9UGUdfYD+q+pSs8jUV06hPPci4wCJzkKu9nqdZOJKan
         +LvmtP6AVweZwiJUwDW0rW8lRbzq5AsiBWThx/O26wvexJiL+lrCM6W9Sj9v5Ktx7cPe
         PHGYRDCCMwK3TRrr3oPDLn17aMnYmJ+u1noxY8V2uOtWfs4RHFgN8EeD6h+XtE9s0mXQ
         mSeYtvXifI4ENoLi/z3PiHBIjvmvfjSr2kSI/EJRitHIYj2xTw6sezrhVO84VBtUqA5G
         VJAXFj4hMVYeRjq/IuIVGszwasXrQaJ0YE3shPymaFxawmy/BxaitPgwukhthPh8npUI
         E0yw==
X-Gm-Message-State: AOAM532EQbNq61EY4kmVDwO6b2crGjarDRt5rSu2uy2kbCriLotOyn5q
        MLXNm5fV4t7rfjk7Qs6pDo1FZyXzBwpwI59jm7Q=
X-Google-Smtp-Source: ABdhPJz5GVLJDyVB1OYITysuSBkRmuy+x+y5RsE3RF/eMkzTGReBUqXmfD8N0sYDjXixPmt6YwEeIFN5W6hPpH3/h8g=
X-Received: by 2002:a17:902:7288:: with SMTP id d8mr56922945pll.18.1594321849900;
 Thu, 09 Jul 2020 12:10:49 -0700 (PDT)
MIME-Version: 1.0
References: <CADjEuPvqjF+Z7ExHj-kKkzU07EbB62686aOgcUh=qYiSZwQvvg@mail.gmail.com>
 <CAHp75VfgW8ypdXs+Lyqe+F69gnQGoxCpiGQ8OPOTL16AD=7R2w@mail.gmail.com>
 <b979419a-f944-448f-b276-e9f609d721bf@www.fastmail.com> <1947c101-bac1-45cd-825c-35633bcf0ae4@www.fastmail.com>
In-Reply-To: <1947c101-bac1-45cd-825c-35633bcf0ae4@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 9 Jul 2020 22:10:33 +0300
Message-ID: <CAHp75VcC9ty=4AfNCkmrCc57M1e7C49kjHUYAZ8aai=fT4WTDQ@mail.gmail.com>
Subject: Re: [RESEND PATCH] system76-acpi: Fix brightness_set schedule while atomic
To:     Jeremy Soller <jeremy@system76.com>
Cc:     Aaron Honeycutt <aaron@system76.com>, Nick Shipp <git@segbrk.com>,
        =?UTF-8?Q?Bj=C3=B6rn_Lindfors?= <productdev@system76.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 9, 2020 at 10:07 PM Jeremy Soller <jeremy@system76.com> wrote:
>
> Aaron, this patch is for our DKMS driver. It also needs to be applied upstream.

Ah, Jeremy, that's what I thought. Thanks for clarifying!

-- 
With Best Regards,
Andy Shevchenko
