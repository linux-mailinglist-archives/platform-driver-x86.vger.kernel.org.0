Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 66E403E4204
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Aug 2021 11:05:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234062AbhHIJGM (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Aug 2021 05:06:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55020 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234061AbhHIJGL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Aug 2021 05:06:11 -0400
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69688C0613D3
        for <platform-driver-x86@vger.kernel.org>; Mon,  9 Aug 2021 02:05:51 -0700 (PDT)
Received: by mail-wm1-x32b.google.com with SMTP id n11so10054612wmd.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Aug 2021 02:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=90uNnlJE5iHK79/8GYVpG/M6EW6OsXMEoHMUbHWYZbc=;
        b=LXg512mauFVdZqBZuUfn8USTSGm4NLLMcdLW88SJ/u0Sa1w8EHb6zM9bt8408x5vxL
         C3Rx4IHDQ4+VnVWPK+VE7kPw5csGgL5L10tgPn3DG0bq/ShCthfbEo2U74eYzYGkpNNd
         qV8dPAdnOcfCHYwupSLouUCjAmxAbmysOkXgx4KgUdDUhkEhTBI05Pe/PrianrKSX4wc
         mzkkVXa7eEm/O8Lwz4SC/vuPGoe++NB4OGOpWGsimEQovWr117juEqVK+n1RNpyDlzEL
         vC0DnLX8ThougFfHAQkPXwVIpGSWzBtCBQ4FNrgrSCz5SOY10Pnw/rbgDVZsr5Pddic5
         sQvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=90uNnlJE5iHK79/8GYVpG/M6EW6OsXMEoHMUbHWYZbc=;
        b=jE6ofCNV6yUQcQ8mP4t3RAVbR+0w+zz2iSMzefqChlgUq07tjoWe5GZHsUKIKyF3Ml
         bVkvZEsBujTQfZKhOl7IhZaYQzVJVg/yZ1Sb/Wpy8fD8OtwxFgrM8Al13K4AWrCb851u
         BGDK7MgikptGnWV42Wj8W/uYUZaUKh/dALJXvfAvTo4aUKJW0055Xv63y5KoP8wwCudK
         FmGxKn6xs7cD1ZyRoQ65KUccgpc6tM+E6l8DKBbrCEU1LERvkTi2KVkJ4dVuoGl8WCxB
         4XZdNREgyFxWP9Jz2GqfRF7lVHt1wrcgTUo/wpeMTYxgz7mpSygCpLuNDJLW+sYZV1++
         FG+Q==
X-Gm-Message-State: AOAM531yhg+JdFA9Xn1ygLdk8nvWMtqFWtpjhz0KI+qAEoYQv4pEj9+k
        xzYHX9lzHg8OM1hJzKsYQsWtsw==
X-Google-Smtp-Source: ABdhPJxYuYeHY8fFHmkbqr9+K9X8cx3jH9r/IAs6cTIqFLHWwpnHcJ1kR7JylqUwlmjs50g6e6+iig==
X-Received: by 2002:a05:600c:154d:: with SMTP id f13mr15817826wmg.0.1628499949941;
        Mon, 09 Aug 2021 02:05:49 -0700 (PDT)
Received: from google.com ([95.146.142.85])
        by smtp.gmail.com with ESMTPSA id q14sm17943641wrs.8.2021.08.09.02.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Aug 2021 02:05:49 -0700 (PDT)
Date:   Mon, 9 Aug 2021 10:05:47 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Chris <chrisrblake93@gmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Christian Lamparter <chunkeey@gmail.com>
Subject: Re: [PATCH v2] platform/x86: add meraki-mx100 platform driver
Message-ID: <YRDv61SWABt8kJjx@google.com>
References: <20210806005755.2295193-1-chrisrblake93@gmail.com>
 <CAHp75VenSw9BanwH58VSCNpw4cNFf7h3uSWTXLb5n0+OPtnDTQ@mail.gmail.com>
 <b5430038-c18c-6037-44d1-a3c0089645a1@redhat.com>
 <CAHp75VeUcrHuBOW9LJ=sPR0atxoEEe19mpD32UfjY1NncD5dLA@mail.gmail.com>
 <CALpBJjosR8WvG=8QB=i12JSpbS3wyPbWLC_N1YM+8FSfVyL1rQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CALpBJjosR8WvG=8QB=i12JSpbS3wyPbWLC_N1YM+8FSfVyL1rQ@mail.gmail.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 06 Aug 2021, Chris wrote:

> On Fri, Aug 6, 2021 at 8:59 AM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
> >
> > On Fri, Aug 6, 2021 at 4:55 PM Hans de Goede <hdegoede@redhat.com> wrote:
> > > On 8/6/21 9:52 AM, Andy Shevchenko wrote:
> > > > On Fri, Aug 6, 2021 at 5:47 AM Chris Blake <chrisrblake93@gmail.com> wrote:
> >
> > ...
> >
> > > >> +#include <linux/gpio/machine.h>
> > > >
> > > > Does this provide a GPIO controller driver? I don't think so.
> > >
> > > Actually GPIO controller drivers use <linux/gpio/driver.h>
> > > <linux/gpio/machine.h> for board files / glue code which
> > > e.g. needs to add lookup-tables, which this code does,
> > > so including this header is correct.
> >
> > Ah, indeed. I stand corrected.
> >
> 
> Hello,
> 
> Thank you both for the feedback, i'll work on getting the fixes
> implemented. The only one I have issues with is finding the git hash
> for the dependency commit in mfd, since I don't see it merged up yet
> to the maintainers staging branch at
> https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git/.

Check again. :)

> @Lee, sorry to tag you in but any chance you have the git hash for the
> PR I did earlier that you accepted for 5.15? It was named: mfd:
> lpc_ich: Enable GPIO driver for DH89xxCC.

ef0eea5b151ae ("mfd: lpc_ich: Enable GPIO driver for DH89xxCC")

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
