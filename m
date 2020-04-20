Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 03BCD1B10CC
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Apr 2020 17:55:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726983AbgDTPzW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Apr 2020 11:55:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726412AbgDTPzW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Apr 2020 11:55:22 -0400
Received: from mail-pj1-x1041.google.com (mail-pj1-x1041.google.com [IPv6:2607:f8b0:4864:20::1041])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B3E4C061A0C
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2020 08:55:22 -0700 (PDT)
Received: by mail-pj1-x1041.google.com with SMTP id a7so31915pju.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2020 08:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rxaGMveKIYI1dQFuiqL/B8rf5h1B6KRqrXhDAyVFbtA=;
        b=N2+gEDTZ+k2gJAzLpl490cT6gw9B/DhyjWBeceCx7+Gc7EHxN5gZtlQQDiTOkh6D0J
         43Bh6M/58lqm4ThJDOxh7d4gYsUmDOed01mPUEVZMsHfJiWPyPtrMFpimvJ8/iuF+vak
         n8S2+CBq5+NMmQJ4WTuzbZT8/MLCCxB3sVf5uBtdVSBbjRZN7h4FzMCKm8iQgmX5V3uW
         w75Ux4tO6cuewbXWw1G+GMotV7OlPxOPB/a4E2/l+uXmTGoCy/AwLG8MK+GK5Q0A9Yuy
         kiSqXopnIcfjvaIrxia24fnGAjOlOPVWGxnIRg8GT0QofobODnyZPBl0YUbUnKwKSqjG
         JT9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rxaGMveKIYI1dQFuiqL/B8rf5h1B6KRqrXhDAyVFbtA=;
        b=NxFsfijEjKvG7SfTUaLf8J7zv41j8TpCo8v2klbqABcfHivAYRqPam/VGEwXwqSl0H
         Sf7CSul66BlaSGeAE3nV8LSyPLe2df3af/w9PSBPDpW0cltLmqCQOhdbXkCerTK32vTp
         UuiZiZ6cewtkVir9ezLDWqe7AQoNwLGEJdswksuDQJ2D0FQRI0cQz13w38QTxMsp0yRu
         1uP5raaGs2W0BEUb1mVZdmndV8uEPn24k4mPsc2/kCf29Udtf+L8QENj/Pg1rxVgSjDq
         KY6uB9wX5HciVSA+vwMj9GYky0CsOp2ZeGQRNHa5e05VA0Nx+Oj0DapZbou7UPHqTInw
         VljQ==
X-Gm-Message-State: AGi0PuYXGWwwKUf9hB9Huf+1TVtfvfr5yscSgEToeliNVvAGJfYTH6RL
        9qGRaWC6FcfsmRBuBW0I1kta4q2EoMNmzJfo/wqu/Lv6Jxs=
X-Google-Smtp-Source: APiQypKUiXfT/dcgEW6UjJJhuGoGZ6sJC1lydTphUEe+NHltowitPsY2KLBl1N4hvf77u7QdMuEogUuQ37FvwUYRAjU=
X-Received: by 2002:a17:902:854a:: with SMTP id d10mr17212420plo.262.1587398121924;
 Mon, 20 Apr 2020 08:55:21 -0700 (PDT)
MIME-Version: 1.0
References: <20200417201426.24033-1-larsh@apache.org>
In-Reply-To: <20200417201426.24033-1-larsh@apache.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 20 Apr 2020 18:55:15 +0300
Message-ID: <CAHp75VdtwTGks-i3XKkOsUxz69i-W=QX63BxdRazev1A3fTq8w@mail.gmail.com>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Lars <larsh@apache.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
> However, it does attempt single fan control for all previously white-listed Thinkpads.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always changed together.
> So rather than adding controls for each fan, this controls both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool (https://github.com/vmatare/thinkfan/issues/58).
> (Thanks to Github users voidworker, and civic9.)
>
> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is verified on my machine.
>

Thanks for an update. I have pushed it to my review and testing queue, thanks!

JFYI: there are two issues (I have fixed them, no need to resend) with
this. Commit message lines are too long and...

> (In the first version my mail client botched the white-spacing - my apologies, this is my first Kernel patch. Used git send-email and gmail this time.)

...this kind of comments should go after cut line ('---' below).

> Signed-off-by: Lars <larsh@apache.org>
> ---

-- 
With Best Regards,
Andy Shevchenko
