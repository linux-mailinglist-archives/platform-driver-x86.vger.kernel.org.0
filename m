Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CE5011B72C5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Apr 2020 13:12:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbgDXLMA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Apr 2020 07:12:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39816 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgDXLMA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Apr 2020 07:12:00 -0400
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2BFCC09B045
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2020 04:11:58 -0700 (PDT)
Received: by mail-pl1-x643.google.com with SMTP id z6so3608459plk.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Apr 2020 04:11:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgwy/aInUxShEijCyGCLJTya0cIe/jECHsCJDcokQcg=;
        b=DZOzDVK1fbNC098qDg4nQCc6AAxOj2SV6NCUFhs7tYKtUnqdUQV5oSq/ZJ5uXDODhg
         FveDQE5RkVx1jwGwFpZXAjMv1+XBaRqiK2QtuEEdwNOyY2XrDzJheiYXFj6GRciSbx5j
         SAJMxpILWxYZQa+vHZPxK+wK7wUsWcqcIGVhuOG6J1R2b4VlfX5tR0eaY7/lfSkycpSp
         aND32n69njruFE4X4YiqemDmL6tV38tT/rHDhBnd9vhfG5L4lO5xpbgUwpAgky0Dkcy6
         t/us2kHCgOgdclm1+yHqzhKOVgGRLEz/q8/ASW8TgXAGQkkdsJtSrugcKvslY64D0RFG
         /ooA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgwy/aInUxShEijCyGCLJTya0cIe/jECHsCJDcokQcg=;
        b=A+/SfPLFDyuCb57hXA9A7Ay/Z5eQbtO3aH8AFuxju/c15Cz5WOAkD8flEvPab1oI0I
         OIED6JnZ2Snpr8t+BQBZL+ZCC1IjF+GjR9J1sdhVHmvDs9neUVzgU/g/oOtn9NA7r3d0
         uisrTosvEyt9IXiqAik0oJ8EuF96FFN+PXdkBrjJdVvn0lMR5NyEkCES37MXO+pxi+Ml
         TFH0eEQ81LOfF4qwE3jsPRND+dg/HDG6HMz8ZVkbkYytCClodcHebOMGM1xXkerORYBg
         K66DwsgIC2BGlQT9qXBm1p/f4mu6GQqBkcAcQbH/MS9H22Hnmv2ux7+TI4xBJVoirW/9
         6hfQ==
X-Gm-Message-State: AGi0PuZYeLRZw6O0UdIpc5QPEe/DCTZEn5tmvZOF++8FeHEc2PDzbxfI
        4S0a9/9i1JrA73g37656or/gTx+WHKf/n6RK23ooIFVw9K5LcQ==
X-Google-Smtp-Source: APiQypJM1qLh9pmSxbC7pbQSVRXxExvGrjmXvoWrOkXH1zpgwOSU/+3hLToDFIgrRZpaR5uog7CmhMF/FDShjc3bEmU=
X-Received: by 2002:a17:90a:224b:: with SMTP id c69mr5748551pje.8.1587726718040;
 Fri, 24 Apr 2020 04:11:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
In-Reply-To: <20200423215709.72993-1-larsh@apache.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 Apr 2020 14:11:51 +0300
Message-ID: <CAHp75VeX2SjX5J-w933FKh_yii=cJ9_tWj3RRNx7Q6vijtt6AQ@mail.gmail.com>
Subject: Re: [PATCH v4] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Lars <larsh@apache.org>
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

On Fri, Apr 24, 2020 at 12:57 AM Lars <larsh@apache.org> wrote:
>
> This adds dual fan control for the following models:
> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
>
> Both fans are controlled together as if they were a single fan.
>
> Tested on an X1 Extreme Gen1, an X1 Extreme Gen2, and a P50.
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
> [1].
> All BIOS ids are taken from there. The X1E gen2 id is verified on my machine.
>
> Thanks to GitHub users voidworker and civic9 for the earlier patches and BIOS
> ids, and to users peter-stoll and sassman for testing the patch on their
> machines.
>
> [1]: https://github.com/vmatare/thinkfan/issues/58
>
> Signed-off-by: Lars <larsh@apache.org>

One question though, is Lars your real name here? [1]

[1]: https://www.kernel.org/doc/html/latest/process/submitting-patches.html#sign-your-work-the-developer-s-certificate-of-origin

-- 
With Best Regards,
Andy Shevchenko
