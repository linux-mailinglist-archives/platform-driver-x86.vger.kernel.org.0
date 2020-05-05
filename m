Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 13BF81C550A
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 14:06:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728608AbgEEMGd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 08:06:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56766 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727090AbgEEMGd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 08:06:33 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7388AC061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 05:06:33 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id f15so747355plr.3
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 05:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mc4uUQyFpxdVqjuaKiYXBtTxTa9XkmJhSD+Te8QtkFE=;
        b=USNQl77jEdJLcAlQ4RRHo+FS4FDaREJ30gcDAbMxYQDb2aTjYWy/xFZyuLBOp7DwD7
         8lgVx1JQNZyb30XKCEPCCcOlNjl7SXjsjXSILJ0pXobC1cgsNW0UHAF8JG8SiYlKP3OL
         iSFGtQsfFDkaj9nZinLwPxEzyNDBfWda1ms67LnBOO2zUGl2bYH9FkmkCl/vSxoWm0C8
         5BjaiejM2ltjnI0IbeO89+goFiIX/XI9Fzg/ASiU9scP0jZUqRolqkZ3X5JCni39m4sT
         gj+Y0DMkF86Ypkf/UyE35CD4nF4r9O6F8mJFTa6g58b4NJId2pPG6PqhqPB/zCBwfRFf
         uJAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mc4uUQyFpxdVqjuaKiYXBtTxTa9XkmJhSD+Te8QtkFE=;
        b=fGYM3H2OL9ontFtBATkgp0k7IZIeUDHSf7YQU2PO4eS/ONq36aXOjxMqHPyPvXCfKv
         yDpZDs7n+cvFvHNglDrRQcB6UCVdN8gwbRQsxjIfLmfi7BWAwC+APUNjB3Eh8T/u0FjJ
         9TAS06Y9hHahYwyd24ddWFp2KM/LxbqZj4ei/KLl7Mqtl6rzKp4Utn6YzQPz9XrBic8K
         x24kXhMhjpud0nq3r6wBVKfXVz6dMO7NjISJdUvElJLTSYfTPLeecWvBu/L44GVqhazt
         ufNa7hsbJPFhmo7iDkOTJW8xC5mZMKPdEv4z2/Hh4DtRjCigTXW6ne/WSDOfwP36Suj0
         a2bQ==
X-Gm-Message-State: AGi0PuYLZZ4wgyv65gaeDjIeYZsVIinZjtUI9fhmAmJcFnXUzBACk83G
        YquRIB/dGxrkHEywYS37Qz5V9/iIr3A7kup0cg8=
X-Google-Smtp-Source: APiQypKLzYhkRCzo6bmlCdglKmaFiERxYvLQSZ5Z1xRqgZ50CQwIeKP94yQ0Mku3XtaAXqQUqiAeuSuAG/CdvmZCsj4=
X-Received: by 2002:a17:90a:fa81:: with SMTP id cu1mr2667776pjb.25.1588680392980;
 Tue, 05 May 2020 05:06:32 -0700 (PDT)
MIME-Version: 1.0
References: <CAHp75Vf3vTu+jR05WcN-SKFaS5Z+T7dq-WLqARDH_pM8U4rSjQ@mail.gmail.com>
 <838fe120-435b-4b7a-bd66-277373b4ea82@email.android.com>
In-Reply-To: <838fe120-435b-4b7a-bd66-277373b4ea82@email.android.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Tue, 5 May 2020 15:06:26 +0300
Message-ID: <CAHp75VcRPbuen6+psGLsCBfPi2AfZYhLvjvhLuG63AS43qkyAA@mail.gmail.com>
Subject: Re: [PATCH] Add support for Vinga Twizzle J116 Silead touchscreen
To:     a@dun.ai
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 5, 2020 at 2:42 PM <a@dun.ai> wrote:

> > - versioning (run `git format-patch -v<n> ... `, where `<n>` is a
> version number.
>
> Do I just make up a version like v1?

By the fact, this one is v2. So, next one will be v3.

> > - Cc to PDx86 maintainers (Hans is the driver maintainer, and not the
> subsystem one)
>
> Is it platform-driver-x86@vger.kernel.org? I believe I had it in Cc.

Maintainers for the PDx86 are listed in the MAINTAINERS as follows

X86 PLATFORM DRIVERS
M:      Darren Hart <dvhart@infradead.org>
M:      Andy Shevchenko <andy@infradead.org>
L:      platform-driver-x86@vger.kernel.org


> > - commit message
> Should it be added right after the subject via multiline Git commit message?

It should go like this

platform/x86: touchscreen_dmi: ...
(blank line)
...commit message is here...
(blank line)
SoB: Author Name <email@com>
...other tags if collected...

Also remember:
- not top post
- remove unneeded lines in your reply(ies)

-- 
With Best Regards,
Andy Shevchenko
