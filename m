Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A9BE7686A6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 11:52:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729642AbfGOJwA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 05:52:00 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:46321 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729257AbfGOJwA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 05:52:00 -0400
Received: by mail-pf1-f194.google.com with SMTP id c73so7160427pfb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2019 02:52:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=/RQUdtI0MHqh1rKNCQYs9kq1o+eaMayEHh0BqdVzIKk=;
        b=mwuSjqs9M8b9t2Jzpeu6RfhjywCOUSYjJKsRrWgbH2OBssLa6o07OAd9LYWSWvXjlO
         H7hQ/Y2lIgJCgt2uW0mQ+C4DzS0e+JdgahUeWFeQw5vgmgKXn1SI5hzmE1oMHCa3BBX5
         ZVpcbztFXlrPMgJFNT/dQbPnwOrYQI9QXE+D6C7KnohwG8wgzpaHDgqu0+CaiooEgYC6
         ABKU0UtF6O8xF8zyDlCx4dZqMeqGXwEd4XBc3rngm2H1PKP2fvQFI5+DDsM9uWhs82hu
         ivlLK5cYSl5BWs/rASTz1Vosr1vsPz3cY8OrJnUdGkptaDNPn0wS5eOzVrXewulC4XWr
         bZCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/RQUdtI0MHqh1rKNCQYs9kq1o+eaMayEHh0BqdVzIKk=;
        b=QfioxK7yChHfNBJDr6sJ6rv/uE3nIuw61C7yVRwTVG6j5YxgdEGLuJHZJYOWEZgIqu
         P3UswyCToOwjO0mt2P3jqxxFRJcBAZXnHmhFm+x5H+9WyiMCh8PdV6BbHeUJ3qxCuhk4
         Q9h/wfkjZr2aiHZoNTdvl0EnFDU5e4kZhZ/+PruXERtqUU6ZhQEDsy3ugS6hrsAZyBqr
         KbNGpw36mXSY57dwf3Iftx3VVdEL1w3ADYSVwvNux1PDfTIiSwYiVBAxwAwEghHrBXAz
         iIWly5cX0myBVxNpHEQadFPdSapEln6AfIEc3kkkhCZHcsbZTF7Qwz9hOU0Qopo/2Bqb
         sgEA==
X-Gm-Message-State: APjAAAU7sjBV2lFM85AK7akmuDPkY+sDBxMQPZCq6+ahFZGbCjudFk/Q
        NPOhDlXYk2iQSIvY6K6OwXij2QePLSrFFgSZ/Dg=
X-Google-Smtp-Source: APXvYqwxUHKnz/BsHgUeCgQfBlaz2ZoGhQySsSQxJJlSlFPuifRquFeEQF29OKxwZHVzO8ljYFnXPDvSGnPhWjxSllU=
X-Received: by 2002:a17:90b:8d2:: with SMTP id ds18mr28851377pjb.132.1563184319745;
 Mon, 15 Jul 2019 02:51:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190629114136.45e90292@endymion> <CAHp75VcOSWVFCHX+gxRzVsjdLLt+3wOrt5mWjmYrM_GfBGN2yw@mail.gmail.com>
 <20190701095815.3157a1da@endymion>
In-Reply-To: <20190701095815.3157a1da@endymion>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 15 Jul 2019 12:51:48 +0300
Message-ID: <CAHp75VcvApPFQDA=t=pE-bqOFd6E6QE5-SO0sD0rwb6dP9WJnw@mail.gmail.com>
Subject: Re: [PATCH] x86: apuv2: Fix softdep statement
To:     Jean Delvare <jdelvare@suse.de>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        "Enrico Weigelt, metux IT consult" <info@metux.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Lucas De Marchi <lucas.de.marchi@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 1, 2019 at 10:58 AM Jean Delvare <jdelvare@suse.de> wrote:
> On Sat, 29 Jun 2019 14:13:02 +0300, Andy Shevchenko wrote:
> > On Sat, Jun 29, 2019 at 12:41 PM Jean Delvare <jdelvare@suse.de> wrote:
> > >
> > > Only one MODULE_SOFTDEP statement is allowed per module. Multiple
> > > dependencies must be expressed in a single statement.
> >
> > Some module init utils even do not support softdep.
>
> And?

And either change will not have an effect on those environments.

> > Nevertheless, the message is somewhat misleading. It's not "only one
> > allowed" =E2=80=94 this is not true, it's "only first will be served".
> > This is how I read kmod sources.
>
> What practical difference does it make?

The precision in the description of the root cause. Misleading
messages may give a wrong picture on what's going on.

> > And perhaps better to fix them?
>
> It's not considered a bug, as it is already possible to have multiple
> dependencies listed, you only have to put them in the same statement.
> There are several other MODULE_* macros which also can be used only
> once per module (MODULE_LICENSE, MODULE_DESCRIPTION) so I see nothing
> fundamentally wrong with MODULE_SOFTDEP following the same model. The
> example provided clearly illustrates how multiple dependencies should
> be declared. One possible improvement would be to add a comment
> explicitly stating that this macro can only be used once per module.
>
> > At least I would rather support somelike
> > MODULE_SOFTDEP("pre: ...");
> > MODULE_SOFTDEP("post: ...");
>
> Feel free to implement this on your copious spare time if you think
> there is any actual value in this change. Personally I'm not sure and I
> just want to get the (driver) bug fixed. Fixing the driver is more
> simple and easier to backport if needed.

Yes, I agree, and your code looks good to me. Thank you for doing this.
I would prefer to see a clear commit message.

--=20
With Best Regards,
Andy Shevchenko
