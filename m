Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8E0AE1BA02C
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Apr 2020 11:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726485AbgD0Jkx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 05:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726349AbgD0Jkw (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 05:40:52 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61E5CC0610D5
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 02:40:51 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id 18so8753424pfx.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 02:40:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YWA0qNFt3rYIcMvFiLW+rsoz0KvDJntHBD/VrCHkYWk=;
        b=MwA+LLGgQ23TkF+bJUB8dNFrbE151g/xFXoopucJ1M86+oMXLKWWngvk5QP8lbdKtJ
         2isW2jwKd74e6zUzNsVPvVlhYwLjEfP130My41KYJ3jKVBxNOKKh/TFfQ+MUAhNr2GrC
         f1C625W9XAkvw+/+pSeRTnFNt2oQSgKfvQ1QWNWyOolRtIfgdGUZG5Oic2TM2rtOOR2h
         +56dcizJVd6SBn2sF/taHhtvak7lxPX+ge222GpGnlpIeSHS0J9E720Z6GXayBn7nhmW
         91dUDNx/xfPLUajbsy60XWq1mNW6haiX95iT/BxkoSjn0/VP2CKDpV5BYKlH2xgrOb2S
         yDwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YWA0qNFt3rYIcMvFiLW+rsoz0KvDJntHBD/VrCHkYWk=;
        b=FriFWLaQVLE3DhbvVqMyIQcMuLMRcv45J6ZdI+Sx/CUBfhr2NeuGk2mfn2UgN3e66y
         ZdiXj9xs0iwfn96Qo5xgGXYkKWC0XoPSuZ4JKFrmyuxOkAxykuAzqtoGmdeqlHy8ZbuP
         RYbK1TyOTOTosrWwJd8uO1ooIzfvFkAmzH74ECTMsHbwoHejGIO0wDYmeLsHtEHgHPrM
         +A9QwXWWy7M/XUtysT6KKwaU7KztXNtuC+Vc3H6r67VxGV88D0GOwGI3l5sqBrryH5x9
         gGTkaqyH1ZM5IbXrNAZB+8dd7yFTdFZAhA1G53SPpTYkjGsz/No56c669Ydo45/5a1dp
         lBKQ==
X-Gm-Message-State: AGi0PuZhLzfs9Om/7NmKq9qtURGMlizCTbqIrQpWclVIEXWPmxNz1LQ1
        5Qphm7F4fe79/ys0q5IcKgh3a7iGuvXPKLhaosE7Z3Bz
X-Google-Smtp-Source: APiQypJqGjBukBhCWLZVujDcFqGI9uFRUhwGWv7CTou0N1zLri9MiP4EF6/uImGUh5vPSZfe9Ktqp4gH+TUkaZtMM/s=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr23082683pgb.203.1587980450642;
 Mon, 27 Apr 2020 02:40:50 -0700 (PDT)
MIME-Version: 1.0
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
 <CAHp75VeX2SjX5J-w933FKh_yii=cJ9_tWj3RRNx7Q6vijtt6AQ@mail.gmail.com> <1630425700.517847.1587973463950@mail.yahoo.com>
In-Reply-To: <1630425700.517847.1587973463950@mail.yahoo.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Apr 2020 12:40:44 +0300
Message-ID: <CAHp75VeTp4ACpOxDtr64QX49-YZ8Uk_BM8XcMCDgg0BdqxNTpg@mail.gmail.com>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on
 select models
To:     "larsh@apache.org" <larsh@apache.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Stefan Assmann <sassmann@kpanic.de>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Apr 27, 2020 at 10:44 AM larsh@apache.org <larsh@apache.org> wrote:
>
>
> Hi Andy,
>
> my full name is Lars Hofhansl.
> Should I send a new post?
>
> Just in case, I hereby:
>
> Signed-off-by: Lars Hofhansl <larsh@apache.org>

No need for this one, I will update locally, thanks!

>
> -- Lars
>
> On Friday, April 24, 2020, 4:12:05 AM PDT, Andy Shevchenko <andy.shevchenko@gmail.com> wrote:
>
>
>
>
>
> On Fri, Apr 24, 2020 at 12:57 AM Lars <larsh@apache.org> wrote:
> >
> > This adds dual fan control for the following models:
> > P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> >
> > Both fans are controlled together as if they were a single fan.
> >
> > Tested on an X1 Extreme Gen1, an X1 Extreme Gen2, and a P50.
> >
> > The patch is defensive, it adds only specific supported machines, and falls
> > back to the old behavior if both fans cannot be controlled.
> >
> > Background:
> > I tested the BIOS default behavior on my X1E gen2 and both fans are always
> > changed together. So rather than adding controls for each fan, this controls
> > both fans together as the BIOS would do.
> >
> > This was inspired by a discussion on dual fan support for the thinkfan tool
> > [1].
> > All BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
> >
> > Thanks to GitHub users voidworker and civic9 for the earlier patches and BIOS
> > ids, and to users peter-stoll and sassman for testing the patch on their
> > machines.
> >
> > [1]: https://github.com/vmatare/thinkfan/issues/58
> >
> > Signed-off-by: Lars <larsh@apache.org>
>
> One question though, is Lars your real name here? [1]
>
>
> [1]:
> https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin
>
> --
> With Best Regards,
> Andy Shevchenko
>


-- 
With Best Regards,
Andy Shevchenko
