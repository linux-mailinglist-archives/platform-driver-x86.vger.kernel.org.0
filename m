Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 523A11B65EC
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Apr 2020 23:10:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726963AbgDWVKa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Apr 2020 17:10:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbgDWVK3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Apr 2020 17:10:29 -0400
Received: from mail-pj1-x1044.google.com (mail-pj1-x1044.google.com [IPv6:2607:f8b0:4864:20::1044])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C612C09B042
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2020 14:10:29 -0700 (PDT)
Received: by mail-pj1-x1044.google.com with SMTP id a5so3008373pjh.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Apr 2020 14:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+OIMf7u31X2aNGEXuvKS10sKXMY1vhM7SV4Q6Chk/AU=;
        b=rf7jryEE8xFhXic+859tBYXc9wzsiVl3fjOfifEmN10oCpeGFIQXawvvEqtGTNrgXs
         xFexvPl4aIWg+MeKrvAX6NEDihzDPxvlEffedm1fJDPqzMI1vAef5e6DmmkkqE6P/dwW
         h2l+74+FV+NBhyJZ72thkinimdd6Fcy87ZDYWzGqP9iljGVB4kC2wLRi4o1095zAT48C
         S8RBxsy1QsdedsXkxCi8vy8+qLo3fdv8qQ84TuelKf9/+6M//UIAxQbkQMGJHSO5Bezx
         TCv1WG0BYFL5jxZts35vScFuCJxJNC+zgy81W5WzMYAzkNfKFVX0ODJRRKAnqvDahzjm
         uxpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+OIMf7u31X2aNGEXuvKS10sKXMY1vhM7SV4Q6Chk/AU=;
        b=WCPoJ6ACLKZvF/cv3gEKwfUpwMNXAu7OL/teCOmJPM70sqYcEc0wWrGWug3OYV17Rr
         hFockvWTuUmZhthWb3E9JkKZkPjOwMI/ZfP4Ly33QO0e3khLnntyEzsrBKD3T3L4tGkV
         aGEGx+OR3XAoxEwZP2czJnUrZlVoZGoif86EPqbmgOs7yI9OoN4iGzOi0vjdKXWwNcEg
         ywYCPn+YdnMUuoHOZT13hstN21xlxobO48oS4srAGqLak2kJp6PBjrzfWqb0DViIbG1J
         zMNHg1y3l56YGOenelGwa63EBtCVVW5Hws3lx0Vo+pJfPnoz1YdEXJkyWJ7AVwAGwG9c
         S/tQ==
X-Gm-Message-State: AGi0PuaTjsmAUitpStSl2u8dhFehbaZZAtSwDZA3yJyQlQ5I1cWCXTx9
        0XJqY25hGBhovrY75KLTosCjQKYYoG3+DSt4DHc=
X-Google-Smtp-Source: APiQypL8XEe2SJFTnrpTkGcra76pGTYtdf9nsUjsuoswpbyStK/5r4b9Ko/XGGy4gEh5eAyJxN4/UytGg6S6SchXNZw=
X-Received: by 2002:a17:902:aa09:: with SMTP id be9mr5828683plb.18.1587676228865;
 Thu, 23 Apr 2020 14:10:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200417194344.22597-1-larsh@apache.org> <20200423165238.54109-1-larsh@apache.org>
In-Reply-To: <20200423165238.54109-1-larsh@apache.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Apr 2020 00:10:16 +0300
Message-ID: <CAHp75VdsR=uADmb7h0Bj_n0ALRVX39_gLjEpUfPbfQ=ZygtSxQ@mail.gmail.com>
Subject: Re: [PATCH v3] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Lars <larsh@apache.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        kjslag@gmail.com,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        nanodario@gmail.com, sassmann@kpanic.de,
        Alexander Kappner <agk@godking.net>, arc@osknowledge.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Apr 23, 2020 at 7:56 PM Lars <larsh@apache.org> wrote:
>
> This patch allows controlling multiple fans as if they were a single fan.
>
> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks.
> Both fans are controlled together.
>
> Tested on an X1 Extreme Gen2.
>
> The patch is defensive, it adds only specific supported machines, and falls
> back to the old behavior if both fans cannot be controlled.
>
> Background:
> I tested the BIOS default behavior on my X1E gen2 and both fans are always
> changed together. So rather than adding controls for each fan, this controls
> both fans together as the BIOS would do.
>
> This was inspired by a discussion on dual fan support for the thinkfan tool
> [1]. Thanks to Github users voidworker and civic9.

GitHub

>
> The BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>

I got two mails, which one is correct?
So, please send a new version only one time, thanks.

Some comments below.

> [1]: vmatare/thinkfan#58

Please, use full URL her.

...

> +               if (((level < 0) || (level > 7)))
>                         return -EINVAL;

Maybe you didn't check what I did for previous version...
Here is too many parentheses.

> +       TPACPI_Q_LNV3('N', '1', 'D', TPACPI_FAN_2CTL),  /* P70 */
> +       TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2CTL),  /* P50 */
> +       TPACPI_Q_LNV3('N', '1', 'T', TPACPI_FAN_2CTL),  /* P71 */
> +       TPACPI_Q_LNV3('N', '1', 'U', TPACPI_FAN_2CTL),  /* P51 */
> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2CTL),  /* P52 / P72 */
> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2CTL),  /* X1 Extreme (1st gen) */
> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2CTL),  /* X1 Extreme (2nd gen) */

This has been expanded, but commit message still old, please, update
commit message as well (and perhaps give a credit to people who
suggested / tested other models).

-- 
With Best Regards,
Andy Shevchenko
