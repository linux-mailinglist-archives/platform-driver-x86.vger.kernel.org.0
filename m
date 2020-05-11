Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1F45A1CD659
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 May 2020 12:19:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729319AbgEKKTo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 May 2020 06:19:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729255AbgEKKTo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 May 2020 06:19:44 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16BF5C061A0C
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2020 03:19:44 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id t16so3743837plo.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 May 2020 03:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nNWXY1iAGZfunwN0T/YEF8Cr0WxhbEU1d6skf6q0od0=;
        b=tdXSXYQd2UBb4jpcNDzXDQJxfcaX3YBpsYuq9k0mT+76ix6m8cRBScduchgtMcVa2T
         D41FGXZVGG+GnPBYuLRivwpFnLAGpqjfXLEB+shS4QGzS6Ctwq87oGrctzT1HMmCQ3Xc
         p/Y8D02s2RK7mxymzt+27+l+LL14s/+5Sh9eAe/DWjrPm/yTIFD+RCPyKJDHCa+ofhtU
         8688VHRDt1g8CUQRlOcJkJyTm5mAiZnratx6obdOuQ4gBY6x+j+fKJRbsP/UFgJ8jdge
         R60116mXJAWZcmIDbkf2wjm+h4595nCimA2uOXUt9ggX39DSScUgqvXbLIOzCFAW3MC3
         fPUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nNWXY1iAGZfunwN0T/YEF8Cr0WxhbEU1d6skf6q0od0=;
        b=DJXzJ9Lb7AujmAxx3TcV5ZO1giiJ12KUwaL5O1pY2HZt74daZjnufRzZYYppVdhiLJ
         DwL5fUQxypStxtsCYRUwgtTi+1Mp4HrAQqo5TUNBsnuf/qdGQCmQnSO/+Oj1ZJVpb8ma
         BB9kbTs7Z+KO73Llap4JcWK/RYgZlWl+XLVkiFOdlLgwEaVOD1bZn8Rvdq84i/SeynJW
         iR0pQaVfYePcHZ82rYeHjIVGJMm4D+tvK3xrQImm+RhYwdC5JBcRacvYyM+tiVM0Jfag
         I/0BYu7MvhH/yGLHc5vV1XFtI9NRXgvA4j8nbu3jXH+HVqhBzeg+VNEti0NswdL1tQFQ
         FHKQ==
X-Gm-Message-State: AGi0PuZRWd/gtX6ld81QFDGJk6FdVcW798xR3FW/dtjt7TwdYPvH5jYY
        WEcY/5D8uMp8np4W2hyh4H8DFi4s50yipFAfj2U=
X-Google-Smtp-Source: APiQypIq6poAjZpQR00NWxotZgkPQ1yhlUgHUS3bloyT0gf4fThLn6vIwhESETD/y/fd+M/rAwS50FvSya60TPA5AhQ=
X-Received: by 2002:a17:90b:3717:: with SMTP id mg23mr22320913pjb.129.1589192383495;
 Mon, 11 May 2020 03:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <5adc631c1016d5d35171713a3d7c15ad34041c9b.camel@intel.com>
In-Reply-To: <5adc631c1016d5d35171713a3d7c15ad34041c9b.camel@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 11 May 2020 13:19:37 +0300
Message-ID: <CAHp75Vd0MQZH3QPEMs-u-2Quh5262cU33iRX6jUc0SMJ17O6TQ@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select for 5.8-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "Shevchenko, Andriy" <andriy.shevchenko@intel.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, May 9, 2020 at 8:12 PM Pandruvada, Srinivas
<srinivas.pandruvada@intel.com> wrote:
>
> On top of
> git://git.infradead.org/linux-platform-drivers-x86.git review-andy
>
>
> The following changes since commit
> c528f3341c140f16dc91f8731142be580764f63d:
>
>   platform/x86: sony-laptop: Make resuming thermal profile safer (2020-
> 05-07 21:16:02 +0300)
>

It has wrong base.
Please, be always sure you use latest and greatest snapshot of
for-next when sending PR.
Thanks!

> are available in the Git repository at:
>
>   https://github.com/spandruvada/linux-kernel.git sst-pull-req
>
> for you to fetch changes up to
> 66047f4445e1f93cceaa8d2c6d9fc80d7d67c05c:
>
>   tools/power/x86/intel-speed-select: Update version (2020-05-08
> 11:47:08 -0700)
>
> ----------------------------------------------------------------
> Prarit Bhargava (2):
>       tools/power/x86/intel-speed-select: Fix CLX-N package information
> output
>       tools/power/x86/intel-speed-select: Fix speed-select-base-freq-
> properties output on CLX-N
>
> Srinivas Pandruvada (4):
>       tools/power/x86/intel-speed-select: Change debug to error
>       tools/power/x86/intel-speed-select: Check support status before
> enable
>       tools/power/x86/intel-speed-select: Enable clos for turbo-freq
> enable
>       tools/power/x86/intel-speed-select: Update version
>
>  tools/power/x86/intel-speed-select/isst-config.c  | 45
> +++++++++++++++++++++++++++++++++++++++++++--
>  tools/power/x86/intel-speed-select/isst-core.c    |  6 +++---
>  tools/power/x86/intel-speed-select/isst-display.c |  2 +-
>  3 files changed, 47 insertions(+), 6 deletions(-)



-- 
With Best Regards,
Andy Shevchenko
