Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6F82ED0DF1
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Oct 2019 13:48:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729566AbfJILsf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Oct 2019 07:48:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41162 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfJILsf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Oct 2019 07:48:35 -0400
Received: by mail-pg1-f195.google.com with SMTP id t3so1245059pga.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 09 Oct 2019 04:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=z6HVe28LVjSoydPXeuLMHw5NzfsuuRF7D+qGQEgzmGY=;
        b=RQDZQ7B0dWaFQ/AlsFMu5PtOb10hfvc+xZQrQvbqWcIHVoYJcG+h2utypgecKigpkZ
         dF2xtE8LODe3W+7dHnOfhNDze9PZCXIF0+sMIYr4I+c5c3pJpJnIkCztMnc5MZeXyTsq
         vOC7APaQgswCYCL1oxbqJIvOa7qQb4cbdsezx1jU2k3Jrb92E+c92YYalMdc3sRvTD4T
         pT2sQBl/UHjDkugBLBJQE/5FmshHlSfmnzTx4rYC5OCLPFBNhEe26zfLXZFtjzc+J3/q
         SQmFctvizxAQOwT7GY0CazSs+NC3iqSgPp8h2OCSkmHBvZ1FbZR93Owvht9PMmMnBWnw
         8ftA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=z6HVe28LVjSoydPXeuLMHw5NzfsuuRF7D+qGQEgzmGY=;
        b=Okb5tg5xpeTEkzBovJa1EQe8cISATMik1Iho30dY75N8JZYJZ6X1tTTgO7Vd5RNEwQ
         mBEq08lP4gB/GtEuwaJowdvNgMNvJdEiXPuI35+8oSD5CkXfZ9ZZg6U2jsPhnbRzIMlV
         /FGIZH74rYy0Q5YhJV3Q4tqnTZORCuf0GBjhzaBt1xpCJtSl/7jDA8VIKOLgdoXpI2H3
         nEAJR3wYxs+Hy4RjSf9BVPYCxNINjDBvX+AVMSw/aBV34IWT8XvIyX6zyxsCKFT3uQPM
         8keVDgO3XizO8i+pqDog/bB2iqK8sRWWpPQSxZovHyhU1z9ios13/Skw49ZZx2Ul80Vo
         JrCQ==
X-Gm-Message-State: APjAAAVOLOiNHFd/YBxp109cJXdOFPac96y6H48I7oUykT3RbjiI6Fn3
        HicSez7k4Oo3yY5XiB5q2BZVHfx+ihHP1/DRQY46VWjC/Wg=
X-Google-Smtp-Source: APXvYqwehiRls5p3knVDqZDNAdQ+jA2/KpuN/s8atpxVyWlK+SVtgOtH7ovckV9FipnwCmJNOpv28r2Y5AxFAOpwZnI=
X-Received: by 2002:a65:5bca:: with SMTP id o10mr3760661pgr.74.1570621714817;
 Wed, 09 Oct 2019 04:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <957bc038-c2d7-4ffb-a209-a4b8dfe95454@www.fastmail.com> <0dda9d66-3d7a-4f59-83ee-772e7d2f445e@www.fastmail.com>
In-Reply-To: <0dda9d66-3d7a-4f59-83ee-772e7d2f445e@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 9 Oct 2019 14:48:24 +0300
Message-ID: <CAHp75Vd5=W-X+B9nQFt9RQ66fPVZe3O8cjb94U+ga4T0SxPzhw@mail.gmail.com>
Subject: Re: platform/x86: system76_acpi: Add System76 ACPI driver
To:     Jeremy Soller <jeremy@system76.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        productdev@system76.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Oct 8, 2019 at 10:23 PM Jeremy Soller <jeremy@system76.com> wrote:
>
> Resent this as https://patchwork.kernel.org/patch/11180033/
>
> On Thu, Sep 26, 2019, at 11:47 AM, Jeremy Soller wrote:
> > Add System76 ACPI driver, which allows for control of keyboard
> > backlight and airplane mode LED on System76 machines running open
> > firmware.

First of all, no need to resend if there was no issues / comments to address.
But if do it, please, will increase a version number.

Now I'm dropping all these from my queue and wait for v2.

-- 
With Best Regards,
Andy Shevchenko
