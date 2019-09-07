Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 69ED8AC877
	for <lists+platform-driver-x86@lfdr.de>; Sat,  7 Sep 2019 19:49:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389321AbfIGRtj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 7 Sep 2019 13:49:39 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42866 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389229AbfIGRtj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 7 Sep 2019 13:49:39 -0400
Received: by mail-pl1-f195.google.com with SMTP id y1so4637787plp.9
        for <platform-driver-x86@vger.kernel.org>; Sat, 07 Sep 2019 10:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=319M5hVLNZ0/VHdQS6av+mgVlarjdZDv599pR29v/XI=;
        b=QsMzLe6LEAB235zmK4odlA4p+txQ0YMDG61hVSDo8liCZHaHp8ijyQzbw7h+fWT9fz
         OGOaFwyKIj2mAthvnUZEghulz9eMBEOkGNv5XuXRcE6lbuyRm8x1kNCVutHQ8qTUaqnf
         tkAtaKT9rkoF8XBVsJr21ed4Sf+iiklSoFBQp+JWc2N5BUxCTatH/Q3SMuMfi3b5An6l
         /+yqQQ4NmXbPWF0L75sGCC6kY1Ehe2pnAk5UDqjQbzkXwaG1gv2dnBUk9+7JW/uXmNbr
         hFXHpxwNfBjvMDCHzt38cHFrP7mm1rfVRZVlBrHHeuzYECW2kVv//IwXrMmktKdFVm0A
         XCuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=319M5hVLNZ0/VHdQS6av+mgVlarjdZDv599pR29v/XI=;
        b=ikekpzd+wGHPXpajFknPHe9yzfDbywlxX6lRtut1V6JUMPN4UPOz0jcW5/pFgFLK4B
         Tov9zUAVmu1cKfHCCoOA2ymG+60U7e2Ajxj+WnLaLhBR0XaggJFC1eUdu9qymD7hTFlw
         mWUmLrTKjilkJT5P0Jp/v7fyzBn8dIukbknIBRePA4SO4moGkJLhwREqN6mcZIjxpsVf
         /tCbtCXKe1sVW0jgEUYzjhJzKJFonVI+RCVcsL8IzX8LeoKIKEZ4C7baYvb2M2kcEEYc
         Q57CnaaMKsVc+/vYtqcHw4YtnbnQqYJTS4+NBslapp6g/5K3azdJ7XVLriw+Ck5k+vnJ
         4CIw==
X-Gm-Message-State: APjAAAWZ6J8g2WMMG5eCihLH7iI9hxfTUVWAeuHktW5FQlpi5gskEXt9
        GSMGhHHC5hzVSJ/9HrCQHwfEbtlurpwWuuxllXU=
X-Google-Smtp-Source: APXvYqwjVGVWOKEcdY68lJLTIBk0YV+c8o3IQgtx5T7fkgc+jNAWRdGB0iF9F5UaflpISJpLDdEceN/tAJidTjESt2o=
X-Received: by 2002:a17:902:9348:: with SMTP id g8mr15981455plp.18.1567878578859;
 Sat, 07 Sep 2019 10:49:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190813003023.6748-1-kristian@klausen.dk> <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
 <a5f6bd92-076b-57be-75d8-7509b86b5fea@klausen.dk>
In-Reply-To: <a5f6bd92-076b-57be-75d8-7509b86b5fea@klausen.dk>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 7 Sep 2019 20:49:27 +0300
Message-ID: <CAHp75Vek0Ti1jB8J+M09w2LxKpfq9SH8KZkzPwrtXzZr5Krr3w@mail.gmail.com>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Daniel Drake <drake@endlessm.com>,
        =?UTF-8?Q?Ognjen_Gali=C4=87?= <smclt30p@gmail.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 26, 2019 at 10:09 PM Kristian Klausen <kristian@klausen.dk> wrote:
>
> On 15.08.2019 05.28, Daniel Drake wrote:
> > On Tue, Aug 13, 2019 at 8:30 AM Kristian Klausen <kristian@klausen.dk> wrote:
> >> Most newer ASUS laptops supports settings a maximum charging percentage,
> >> which help prolonging the battery life.

> >> I can't pass the asus struct to asus_wmi_battery_{add,remove}, so I use a
> >> global variable. Is there any better way to do it?
> >> I think the implementation of asus_wmi_battery_{init,exit} could be
> >> improved, any ideas?
> > Added Ognjen and Rafael.
> > Is there a better way to have the sysfs file handlers of files added
> > via the battery hooking API reach back to the device that hooked in,
> > in order to access it's private data?
> > I see that thinkpad_acpi also uses global variables for this :(
> For now I think it is the only option.
>
> I did notice that V1 of this patch has been merged into the for-next
> branch by Andy[1].
> Was that a mistake Andy? and how do you want me to proceed? Should I
> create a refactoring patch? V1 really isn't the proper way to do this.

Oh, I see. Can it be fixed quickly? Then refactoring patch on top of
the branch is preferred.
Otherwise I will remove the original from the tree. Just tell me which
one is more solid.

> [1]
> http://git.infradead.org/linux-platform-drivers-x86.git/commit/d507a54f5865d8dcbdd16c66a1a2da15640878ca

-- 
With Best Regards,
Andy Shevchenko
