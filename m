Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B3694222B2A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jul 2020 20:43:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728374AbgGPSnP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Jul 2020 14:43:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58722 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728163AbgGPSnP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Jul 2020 14:43:15 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 698EDC061755
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2020 11:43:15 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id b92so5093100pjc.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2020 11:43:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AmFvLOhEFWQNK5E8qvoilcQl3UMS/pVhGY/G9fYEn2E=;
        b=uQeaZ9bSuxi5FGW65EQo3krFBnKGa/pd/VyG3m1bzRkrwowbZ7Xyruhzv8l3fcTyqD
         TRIXBmUcn8smB3R0VYNUTVv8wNYX9l/QDukRIuWvwXhp/iI3nIcnehmqhtyelvkJEiDo
         bIq568i03UawEbtnP3Z3wP1TaaIjSMrCYitwE+v9sk/QlqQ2YfqiHNWnqef20Dh3PDFB
         EuOe6x2OLqrnzlbnx1IhGv72MOM35BA1KzfS3tNdQOmrTTwUy+jBVAO0Qd3few34csDB
         E2bK0gKH3R0mEdiCdqKZ2TLpKe0szR+Xx2qE2RPRCSv3obhYhvEBWo0+nuX5MRL400Rb
         AVHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AmFvLOhEFWQNK5E8qvoilcQl3UMS/pVhGY/G9fYEn2E=;
        b=kkyOMn6FEBdAFz6dMfzSvu2eX4w+FBFFGFhl6Vp6/DURrXuXyPMcBrxLlwgQ390YbU
         hSvCM4Pcs6ImJb3PAcwvxSpXAulTlhHKyHbouG4L9Jlmunzxo+S2geWVOGZfwsZtYjbx
         OEwLIdaBcuLbm4egoGyltySpud51RGwCZKVGQ22feJg8j5+KaiQdx+NjaSA2HsVZ5B8S
         i3wKnLZolMG4ZFspP6nmbkZ4daDI9iQxQQy6qruFvQL8Ss0KJ6EKTvz2oNqXQlEWFTdk
         NRwGJATUZhvKA7PvUDw4sRV7JMkakBr+DUVC8BuveF//MZ/AeSm4g1bVauask11SAgEU
         8mqw==
X-Gm-Message-State: AOAM532YpfLtPkJpHf7DldEtGJP9/V6Hte0HLAPThG/M2H4hLtIiP7oi
        OtLgput/wxMngcObCKwnMAQo+UHeKKTNsgyGyGY=
X-Google-Smtp-Source: ABdhPJyUFDKn7xSlywXZlR1zFqFZVIkFZar2wTutPEfLmobAyl07t/pVNxfPY2zX/+NW/ARWIRTilyhrBdmJ4d6YDdo=
X-Received: by 2002:a17:90b:3547:: with SMTP id lt7mr6193637pjb.181.1594924994847;
 Thu, 16 Jul 2020 11:43:14 -0700 (PDT)
MIME-Version: 1.0
References: <c5ba130fdaac43bd812e2c3e0b3daa6486e18395.camel@intel.com>
In-Reply-To: <c5ba130fdaac43bd812e2c3e0b3daa6486e18395.camel@intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 16 Jul 2020 21:42:57 +0300
Message-ID: <CAHp75VcMmDQ1=wMSWhUFqqiLkCUu=ibinoUQRbumDpQ+6ztzgg@mail.gmail.com>
Subject: Re: [GIT PULL]: tools/power/x86/intel-speed-select second pull
 request for 5.9-rc1
To:     "Pandruvada, Srinivas" <srinivas.pandruvada@intel.com>
Cc:     "andy@infradead.org" <andy@infradead.org>,
        "prarit@redhat.com" <prarit@redhat.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Jul 16, 2020 at 9:13 PM Pandruvada, Srinivas
<srinivas.pandruvada@intel.com> wrote:
>
> The following is on top of
> http://git.infradead.org/linux-platform-drivers-x86.git/shortlog/refs/heads/for-next
>
>
> The following changes since commit
> f9e1104367c57f2e03a6b5e6e9637fa2b9ff5627:
>
>   platform/x86: mlx-platform: Extend FAN platform data description
> (2020-07-15 12:45:07 +0300)
>
> are available in the Git repository at:
>
>   https://github.com/spandruvada/linux-kernel.git for-next
>
> for you to fetch changes up to
> f65e1311e9c6c69bb886bd3333577f85d9eeddbc:
>
>   tools/power/x86/intel-speed-select: Update version for v5.9 (2020-07-
> 16 10:18:06 -0700)
>
> ----------------------------------------------------------------
> Srinivas Pandruvada (5):
>       tools/power/x86/intel-speed-select: Change path for caching
> topology info
>       tools/power/x86/intel-speed-select: Ignore -o option processing
> on error
>       tools/power/x86/intel-speed-select: Add option to delay mbox
> commands
>       tools/power/x86/intel-speed-select: Add retries for mail box
> commands
>       tools/power/x86/intel-speed-select: Update version for v5.9
>
>  tools/power/x86/intel-speed-select/isst-config.c | 81
> +++++++++++++++++++++++++++++++++++++++++++---------------
>  1 file changed, 61 insertions(+), 20 deletions(-)

Pulled and pushed, thanks!

-- 
With Best Regards,
Andy Shevchenko
