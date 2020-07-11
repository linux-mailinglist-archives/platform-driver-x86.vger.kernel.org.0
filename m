Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 065C021C427
	for <lists+platform-driver-x86@lfdr.de>; Sat, 11 Jul 2020 14:21:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728080AbgGKMV0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 11 Jul 2020 08:21:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726480AbgGKMV0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 11 Jul 2020 08:21:26 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89019C08C5DD
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 05:21:26 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id q17so3738555pfu.8
        for <platform-driver-x86@vger.kernel.org>; Sat, 11 Jul 2020 05:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=2yOIJswl0uOs4x9HQi7hahnmxCS+X/luDRE+XATiuYM=;
        b=gVuwZ0oB+LTE9pgwh/6QsqxgORdt74N6Jk7E7BqTf7/2cVo4pafDeHUH3NCYMMvjPm
         3JM7+c0ZYXxtbAtY3umWtyK3x/klSEEJsNukvZ7PzX6LLSppYitPZ+pttoDnAlnYfar2
         eTdRBcAuCt6JhjQmENgtvuyzpKSsK/SIhm7z7pA/sux+WI2NvOpjAAP/2Nwi6CMdnsW5
         7NkvzVhLTdNHy++q9/ByQ1Xo8sgAyM7KXq545L3S79zYS9oHdkAD5XHvvA7AiUMJJFgK
         uUT5a3/0nbvSXGwT8XnW6GYOPVi6p89lR8t7ghISJUX3V9exx2Gr5uwIMxugt1Y4f3YT
         CWFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=2yOIJswl0uOs4x9HQi7hahnmxCS+X/luDRE+XATiuYM=;
        b=AU7c3oi9uwAZlzH39VZOUSrH3yCxwsAFgvY39Zxm7YDsczQRi3+7S7DAAC+dBQO7By
         ysJLelTZNBSfzl6CEiU3lG9iHCi4u0TihDu7aw4g23FvhJo686Tr88WHWxCWJCbF1A4c
         pstF8lYJ+fQ9JkaDeWvzZMv391gzpk9TCfxOBDils4DcHjDFG/F4fP1gNuJIJdgF4NHj
         JNA+BR7Q7KMSbdViJBF0C7cm0SAazsK+y/GRpdFjs5vs1y97l7VR7GZgAE+b5+rorZjF
         5a4xTcvyLoUwn9BRViwREAME98Ht4BNHjnd0JZ2xGtQiE+7L5N1OYR4ivRrujM9VrPkg
         BBbw==
X-Gm-Message-State: AOAM532QSouRT4F6pQKM8h8Rx81S+ZgDLVKSBq2jO3VO9mTpU/9iu10D
        HKxuuyzr+/pMni970cI4T2LXUjNwuaE7zR6pSJV3lnRR
X-Google-Smtp-Source: ABdhPJw/tfq7Pvcd9zl9KlA6Qg8/rtRIrSeb79OKtsPhJxRzRj/iBDVuv8LuE+eTIFSPTRjgVdeWCgiatIzTHDuZRJE=
X-Received: by 2002:a05:6a00:790:: with SMTP id g16mr31573315pfu.36.1594470086052;
 Sat, 11 Jul 2020 05:21:26 -0700 (PDT)
MIME-Version: 1.0
References: <20200711094321.6615-1-zappel@retarded.farm> <CAHp75Veq6Upg2-b0cNWamb9b5hB0zUznVoKcLaS7GLvipC5mGQ@mail.gmail.com>
In-Reply-To: <CAHp75Veq6Upg2-b0cNWamb9b5hB0zUznVoKcLaS7GLvipC5mGQ@mail.gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 11 Jul 2020 15:21:09 +0300
Message-ID: <CAHp75VeN20fyubCYqn68sXPydm-BZ3dXGDg+EPtwyoEnX9F2OA@mail.gmail.com>
Subject: Re: [PATCH v3] Added device support for the new ASUS ROG Zephyrus G14
 (GA401I) and G15 (GA502I) series.
To:     Armas Spann <zappel@retarded.farm>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Jul 11, 2020 at 3:20 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Sat, Jul 11, 2020 at 12:43 PM Armas Spann <zappel@retarded.farm> wrote:
> >
> > This is accomplished by two new quirk_entry structs (one for each series),
> > as well as all current available G401I/G502I DMI_PRODUCT_NAMES to match
> > the corresponding devices.
> >
>
> I'm going to apply this, but for the future...
>
> > Signed-off-by: Armas Spann <zappel@retarded.farm>
> > ---
>
> >  asus-nb-wmi: add support for ASUS ROG Zephyrus G14 (GA401I) and G15 (GA502I)
>
> ...this actually should be a subject of the patch. But here you put
> something like:

(Sorry, slipped click)

v3: fixed commit message, sent using Git tools

-- 
With Best Regards,
Andy Shevchenko
