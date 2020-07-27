Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E4E122F8A9
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 21:05:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726897AbgG0TFF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 15:05:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53206 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbgG0TFF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 15:05:05 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 91EA6C061794
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 12:05:05 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id j20so9595845pfe.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 12:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=EfOmVIJcXLSTR4Sxrdb7Xo3L8UUuJ89AMax3Ty1zBfY=;
        b=uwsNEni7RPpFlRNFT+FDROefc9AOME0qnXjwsObwdYlujUtG3W+M+DCwee24l+8fTf
         fVJ0Lds6MRA9seNyRVrwEPHrRCfLXrWkjNpe0sFfd3gTSJvR3tcoN8mgWj2G/lvqdyIc
         5MBXuX3OLZUfMtkstYN4l0NEFff4Wv/bgbkw3zRJva2VOU5SL45Bni9rZlYL67XbHenj
         Crh5EXULlWFKR1sYCP3O90qFPJSu16zgDzi51R5oo4ii2A6kYrYha55l3AU1FT/Q/kj/
         v5qRfMyDjUOGdQ0shNDeoq7KKuyCZRdl6dvVvtJzQEO1iDWoltHSu4JAMWSJAkrHkZF/
         QtzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=EfOmVIJcXLSTR4Sxrdb7Xo3L8UUuJ89AMax3Ty1zBfY=;
        b=GKERPekUd1Cx/zJizbacFzzMqOpAGtydnT8TrCe9lKTuKlltHsb0qEybWRvK3FTQUZ
         Ot95Lpzny87njFR1cnnecejZgXIuhvUl3cEuyMX8nc1IRJOU5gAECnpAnVij5H2jgJhX
         Q3G/nuk/5Hp71Bynxf+H5vSRIjmsB+wTxPahTYgB64jDZwH39UKe5+tQaIp7usc/FfoZ
         ml52kI1hHm+c1eEhganMaow8TUqSlN4NCPNODxpisu1v0OfYJkkFp/J1ZD4dfidqVq6h
         s+Z6QVNKFMDVzT75nOJzUCL/Gm/MHzsSYUvCaJFhRNNI8bYQxyK7h07321N5Mg6LM6yu
         foXA==
X-Gm-Message-State: AOAM533N6LqL0Lk5v0PJmFMeFedX5vzwU71GcR58lKJrF5llQeDiKBi4
        /nxz+I7KGXPnUonChfpSBfabRKFYbfm8tVXkJpuv0UZU
X-Google-Smtp-Source: ABdhPJzrwYD0f5D+Np9TOL7PnoFOFh5nwsbQdn1KUEyTO4zOynUpbuBcIiz4yv0BIrw9kSZeILmNGbYL2cErfJFUlkk=
X-Received: by 2002:a62:758f:: with SMTP id q137mr2953451pfc.170.1595876705101;
 Mon, 27 Jul 2020 12:05:05 -0700 (PDT)
MIME-Version: 1.0
References: <Gl7L5UPD3AkLt73nhH5L6xDn_6cvzWt-O2zsa5q9XRIEonNjzwNbES8BaEbqr7YGo7odtCDCMFSuWPmXpKWThFHn6sdNPzSJU2Ki24aIibU=@protonmail.com>
In-Reply-To: <Gl7L5UPD3AkLt73nhH5L6xDn_6cvzWt-O2zsa5q9XRIEonNjzwNbES8BaEbqr7YGo7odtCDCMFSuWPmXpKWThFHn6sdNPzSJU2Ki24aIibU=@protonmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 27 Jul 2020 22:04:48 +0300
Message-ID: <CAHp75VcVgJnxgh-kRmFgjJHa+2AUN-P-9vGWtBs4-4o3iYfDvg@mail.gmail.com>
Subject: Re: [PATCH] Documentation/admin-guide/laptops/thinkpad-acpi: add
 section for battery charge control
To:     =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 27, 2020 at 7:30 PM Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.=
com> wrote:

Thanks!
The content looks good, though please add a commit message for v2.

> Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

--=20
With Best Regards,
Andy Shevchenko
