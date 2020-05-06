Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4E2E61C7047
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 14:30:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727932AbgEFMaY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 08:30:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725985AbgEFMaY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 08:30:24 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 124DBC061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 05:30:24 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id d22so1051172pgk.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 05:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ZOD7jAWkKVj9UkObbDRD1SQjzKZfF1iOaCguiAgkBbs=;
        b=Z+tzzZQqrFWKWj3Y3ha92u37QDRPNRktPaCgyEKm4TaiWXTQBqzLQQff9me73lB9nP
         +IaSXDvkP+qTpZg9dSX8Ul2RU3suOJmbSo1oPn9R7yz4I0zTSpr8J1d+7rKJmI22ELQG
         MpIPruT99i0DKglpmsDZ/qA6gcjzGueHiAMujsdFIgMw7ndBV4V/j0aMwavYFqVpCqwx
         uxD3IoJI0gK1dgEC0l76Exxb3Ei19Fk6bZpEERzNkbpgduTKFbbI+o9PEN5dGr270j8f
         KCgG5/joDVXmc+9fRTthG38qrtVwNLPIof0PsFqczOp9Ichm6Zv7v4TYqDSt5VaggPVr
         WmLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ZOD7jAWkKVj9UkObbDRD1SQjzKZfF1iOaCguiAgkBbs=;
        b=tijYkq3qcbQGvrsN95zoWYecqJiYchVsDsQ/RNLszKiDgTqpu7twmbyHQ8RMWDiy6s
         DZ8PEOm7KGGt+ZEF/2zfs4GjrvNmWHgZaPIvnr4I5sYfOqiM3Ay/2lo3hNXhDzSe+LrM
         GSTGuoORHBxxpMsx9NhOotL+qWa1nSrKcxjn7mhID5VXMMLJH7KmH9b01PQp3sjqtf6T
         fqVYxs7YBBzvPL56/rqjm1LLKWdNxE7byQmoh3lR4MscE1DpQrOpazAi2EaoRAyAA2dD
         c/D6OZITZWVMGOGIsV0pUce6hJafJFs5bDDpJkQxYZSv5w2ZWtJNotOf5KZduedrUEwn
         Q1BA==
X-Gm-Message-State: AGi0PuYHYwf5Jpshix4PITJuORMCpXni3kWEEOI95+CDoBd8llZX/iL5
        bhXQv/uORtqV/DI5TAGNvjPTlMh68NKequQPgWc=
X-Google-Smtp-Source: APiQypKfyK4HoTmY/CSRpTGtbyKlU8WAWezEwP4xxuMuwQnrgy2s5mAE7teqtYOBWDmUuWjH86jtQlfSo1HEPjZcxVM=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr6991535pgb.203.1588768223378;
 Wed, 06 May 2020 05:30:23 -0700 (PDT)
MIME-Version: 1.0
References: <20200506014843.18467-1-malattia@linux.it> <20200506014843.18467-3-malattia@linux.it>
 <20200506034758.GA18684@taihen.jp> <CAHp75VeNkfJhi0hXz4nQgRg7227Gdvg20uhCpSTb1KqUvEFExg@mail.gmail.com>
 <20200506122049.GA72497@taihen.jp>
In-Reply-To: <20200506122049.GA72497@taihen.jp>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 6 May 2020 15:30:16 +0300
Message-ID: <CAHp75VcN0OAksM7t4Fv8HbEUbMLgKdQs9rr_7jap96rUf5etaA@mail.gmail.com>
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

Yes, go for it.

On Wed, May 6, 2020 at 3:20 PM Mattia Dongili <malattia@linux.it> wrote:
>
> On Wed, May 06, 2020 at 01:55:21PM +0300, Andy Shevchenko wrote:
> > On Wed, May 6, 2020 at 6:48 AM Mattia Dongili <malattia@linux.it> wrote:
> > >
> > > On Wed, May 06, 2020 at 10:48:43AM +0900, malattia@linux.it wrote:
> > > ...
> > > > Reported-by: William Bader <williambader@hotmail.com>
> > > > Bugzilla: https://bugzilla.redhat.com/show_bug.cgi?id=1830150
> > >
> > > William notes that he didn't report NULL pointer dereference and it's
> > > only in Dominik's report.
> > >
> > > Do you want me to send a v3 or can you remove these two lines from the
> > > commit when applying the patches?
> >
> > Yes, please.
> >
> > Also, add Fixes tags to both of them.
>
> Done, just sent v3 out. Once this hits Linus' tree, would you agree I
> should ask for inclusion in stable?
>
> --
> mattia
> :wq!



-- 
With Best Regards,
Andy Shevchenko
