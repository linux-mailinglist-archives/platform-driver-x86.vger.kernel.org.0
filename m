Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7F044220467
	for <lists+platform-driver-x86@lfdr.de>; Wed, 15 Jul 2020 07:34:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728495AbgGOFeG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 15 Jul 2020 01:34:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728398AbgGOFeG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 15 Jul 2020 01:34:06 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD8B6C061755
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2020 22:34:05 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id s26so1572474pfm.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Jul 2020 22:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wtEWBLs/skI7CKarpzS4KPh9/jjxXbEOJvF8GG6KgQw=;
        b=CxRhWMkiNNfaxYssU8HfQckIsHzHW/HP+bDgqD/PHPJyL5iGl5qQ2qWuxN6OITGYEW
         sTF2XwWn7/A+1LRkxUATyoIrBiMamBvqDM2KfYriGxfs63G2P5RxDfS1TYJGNDhA7iwz
         IPZy81fz9dHE+tSSXDyrZeRUKtJxye09gpL5rMOZ+Fjeg7XDHGyksraEvaJvCUFbiidQ
         uzQSfgatVx1oU+hRyl1seGt8cp9S27kFkXYTVufrj/NY53F8JAopcK/RQPYNk3lLzgIL
         D/YV7tPzieXSL3AG5qlTlaAyyFh6+hre94SZFw5gQbPVFA2l2qFIvrhrvzR7UbPKVPiU
         opIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wtEWBLs/skI7CKarpzS4KPh9/jjxXbEOJvF8GG6KgQw=;
        b=IdY7wPWiyZrE22kXwdDrl1U81to2e/PT4fuK1xT08lfpHSSU023mGNIbBbA7kgPkA5
         +G7rPqzyNC4FFcvbIEI/UCo2rCQixuEaKKiJ7z6ICQ7+y55ZiQCZj6y7z+DNFEW/hXei
         bEzctcSFre6UrP/EKiHR8lNESV+OnrqN+W7jGZC2abkyMBVlVcURJrsRc9wcUxJno6W4
         EmBX185ryTEABLND7peROg4n5+otBOzsdSQMAekf8IuOvx56RIYDFFi/QoVw4zDJKQAW
         ugJW7bPtoGwoHsuASI7RpIHzIY3zSVPzTkGYJcMz3EVOGwlYGpm4Jmp1R5AGOJbAhyPF
         3F7A==
X-Gm-Message-State: AOAM530lV4pEyMqw5wjHc6z4xpCCiktQtwgqN1VqJzdq3efDWpVc9MNC
        SBDjDZ+SpIBx77oQvOEolhWKBFLbVVGRHXav4jETDDtOsrE=
X-Google-Smtp-Source: ABdhPJz8vucC+cyJZP8hS2IhpFUcQUoYw/ajQjONDWWzpi2kAS8UASDLNPZalGg7Y3GUUa94Q+cccB/aFBHjzcvCvPA=
X-Received: by 2002:aa7:8bcb:: with SMTP id s11mr7156896pfd.170.1594791245328;
 Tue, 14 Jul 2020 22:34:05 -0700 (PDT)
MIME-Version: 1.0
References: <CALLB5ZuOCTftvp32TG9y=peMqJn1w_FSNKWmVYU6pJ-imWO4Ug@mail.gmail.com>
In-Reply-To: <CALLB5ZuOCTftvp32TG9y=peMqJn1w_FSNKWmVYU6pJ-imWO4Ug@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 15 Jul 2020 08:33:49 +0300
Message-ID: <CAHp75Vc0G5nN64+5RtFwgV5V9GZGvwYEg+-yLOTUwEuJZDkyLw@mail.gmail.com>
Subject: Re: A problem regarding asus-wmi and charging thresholds
To:     Mark Enriquez <bugmenot.oss@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Kristian Klausen <kristian@klausen.dk>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: PDx86 mailing list

On Wed, Jul 15, 2020 at 5:40 AM Mark Enriquez <bugmenot.oss@gmail.com> wrote:
>
> TL;DR; On some "newer" asus laptops, the first battery is listed as BAT1 as if using the 1-index of counting, rather than "BATT", which prevents having a "charge_control_end_threshold" file present.

I believe we have a fix for this
http://git.infradead.org/linux-platform-drivers-x86.git/commit/a6146ab8a57b6a84e3643398605ec6f897a69365

>
> Good day,
> From this commit
> /6b3586d45bba14f6912f37488090c37a3710e7b4 "platform/x86: asus-wmi: Support laptops where the first battery is named BATT"
>
> I also have seen that on a "newer" asus laptop (vivobook x571gt) the first battery is "BAT1" rather than "BATT".
>
> Yet, the "charge_control_end_threshold" file does also work on the system ... well, after recompiling the kernel with this additional case in.
>
> Writing to this file does limit the RSOC of the battery and stops charging at the set threshold, albeit with the status "Unknown" instead of "Not Charging" but that's for another case.
>
> The corresponding bugzilla report is in https://bugzilla.kernel.org/show_bug.cgi?id=208385.
>
> Thank you.



-- 
With Best Regards,
Andy Shevchenko
