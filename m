Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 692A21C9937
	for <lists+platform-driver-x86@lfdr.de>; Thu,  7 May 2020 20:23:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726515AbgEGSXa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 14:23:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726320AbgEGSXa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 14:23:30 -0400
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com [IPv6:2607:f8b0:4864:20::442])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02164C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 11:23:29 -0700 (PDT)
Received: by mail-pf1-x442.google.com with SMTP id 18so3392185pfx.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 11:23:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fv7KTIAln81dcZXUuNmb3EVvrIl3bDWRWeAmqxGjbag=;
        b=Zey/bfAkymJ/K3Z9eE5guUD3WPE4UnDq8eX+OuezIYhFnCqQS1V1W77k/5VDFBNT81
         WhhIAZseGXis/ndkSux1fF2rHFY5umHXpgapP6S6fG71k1PkWjE+M9G8gXAU+aE1PKs/
         R3gN2XKKUMOCyLse6Jfj7BCC5Cp+4K4dajO/4ESncED/mezqZVN+pHbj8Re/oOUilnye
         O5CBsvmn32Gyvo5z6wY7E495ivXVH4cAKLEcMrrt/66NiqiGTicQKVXITkxuQ+jxQeII
         ZyEjeFDhzhd2yvE5Ir/pv6wOCdE4eN4sA95zHepbrML0TEE7nUK/BWSbKksvdZdYlv/s
         bY5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fv7KTIAln81dcZXUuNmb3EVvrIl3bDWRWeAmqxGjbag=;
        b=rOQ651zdU2/4jd5dtw+/RE+rERRfF38NkJqp8FOspGMAc2KKIDUycurFNHNOa6ICJG
         y7RsVn5Hlk9yNFxiocDoIrtJtdooLYjCFcNzXrTVg3Cxz/0v/X0snZ69ytTj4/wC+Fzk
         SRJFn1k+jnJpitJ7RyMhI4cxVtE98VrTWAqlgx2cdohDr7K+QBfWyxwIY7tQPyE55D0T
         dovCD05RYe9eJgQMcFXwxuHGsWteN0TU7j+fHwEpm3DBYHcV/fkqtCWNBcoCXx3p+3oc
         WSfVV19aDrse6SX1lsAbd+oma9DxIN/ouqqnH/hkOF3MCvKjvl2JswATsQSOAn2UI9ur
         pEvw==
X-Gm-Message-State: AGi0PuYAHCAjxrVh7pU7bl854in923ZQ8JTvm5lkzCGwCot7iVGR6I39
        qr0OiC59JPjsNKE/osEI8/76ep5JoF9QJgr2Hfw=
X-Google-Smtp-Source: APiQypJh9HnKQ95sHeraH2FHYWCfaVQZGxczV6Oz0qqkm6ztH9GJo2XPPriBYeZ+5PoOnTNjpeJN8vqfDnu5IrBXjgw=
X-Received: by 2002:a63:1c1:: with SMTP id 184mr12814458pgb.203.1588875808487;
 Thu, 07 May 2020 11:23:28 -0700 (PDT)
MIME-Version: 1.0
References: <20200506121630.72382-1-malattia@linux.it> <20200506121630.72382-2-malattia@linux.it>
In-Reply-To: <20200506121630.72382-2-malattia@linux.it>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 7 May 2020 21:23:21 +0300
Message-ID: <CAHp75VfHCx6Vt3gTejyCDFSw4U+yCZ5kgTVCpWLzrj02Aoj5Wg@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] [sony-laptop] SNC calls should handle BUFFER types
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

On Wed, May 6, 2020 at 3:16 PM <malattia@linux.it> wrote:
>
> From: Mattia Dongili <malattia@linux.it>
>
> After commit 6d232b29cfce ("ACPICA: Dispatcher: always generate buffer
> objects for ASL create_field() operator") ACPICA creates buffers even
> when new fields are small enough to fit into an integer.
> Many SNC calls counted on the old behaviour.
> Since sony-laptop already handles the INTEGER/BUFFER case in
> sony_nc_buffer_call, switch sony_nc_int_call to use its more generic
> function instead.

Thank you for an update.

...

The patches require prefix, "platform/x86: sony-laptop: ".
I fixed it for now.

...

> +               // do nothing

Use C99 comment style, please.

...

> +static int sony_nc_int_call(acpi_handle handle, char *name, int *value, int
> +               *result)
> +{

> +       if (result)
> +               *result = 0;

I didn't get this part. Does it mean we always have to reset result?
Sounds like a design issue (usual pattern is to ignore output in case
of error by caller and to avoid touching output by callee)

> +       return sony_nc_buffer_call(handle, name, (u64 *)value, result,
> +                       sizeof(*result));

Oh, this way for troubles. You supply pointer to int and force it to
be u64. Not good. See how above function has been implemented in this
sense.

> +}

--
With Best Regards,
Andy Shevchenko
