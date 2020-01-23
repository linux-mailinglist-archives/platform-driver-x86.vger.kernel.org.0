Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4E280146809
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jan 2020 13:32:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726260AbgAWMcH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jan 2020 07:32:07 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:33477 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726204AbgAWMcH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jan 2020 07:32:07 -0500
Received: by mail-pf1-f193.google.com with SMTP id z16so1491000pfk.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jan 2020 04:32:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qIrakNM8z64JoTRpb+V7GpMXb/NJKAb6VsLJ6QYEPbU=;
        b=DoBmWAd2jwZGs8caI+N+ERtubzcQdiIr8q+jEX1KYf4n5HouAaRN/9idhWDVLG712A
         ATRNSVB1BPUrAOPGxVpYHD7WLvzj+EPRAO4gxFdDVwvgG3ixE4S8tnHPYB2bFf08nm8Q
         LKkKM7ALFsafs7NSBActs0vTLSWvjvI3BsGPWQ/7oiBJYR0FX9avzbFWqgNI+JDjju75
         2gsSpu64wupl6yAg0Np+7wqwyh2HRXVthBWAKgRLMsdDbH4Owrl67J5Inr2ZRrhtq9X4
         JyxAiH1cE/OwCDj44FCUjlUbsK9TUhW5JHsWG7bhbr9E7LlLKZ443vmol7lPI3vVRmaD
         YemA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qIrakNM8z64JoTRpb+V7GpMXb/NJKAb6VsLJ6QYEPbU=;
        b=gbnngC+9afMqogthHrYF75sfa7o1x09so/cTkiSH++68Z/x3OjaxjkjKgqKEnkde6f
         z6csxOw7mSKtx8T+6mkI1eueEHor38epbtRq+OJ36i9yuWC/rSMelmyki31cpwSs9bCy
         l6iI+GtDgRtdp5I+oAzAHXUgL6TJTAppaPbGQKOp6MZOn1USmdXuaHZoqG2QUKsSqlii
         lY26WweMUgRLtKMaQHkOuG71m0J+NF1VA/l1JIImpoqKcB4R84aRHjCvOndNnbdf9f2U
         wpJwPkdfJRNDAo/Dm7PLEMSaH6w78e9yynb20vTpX9PB4cos8prP3zOkk/PIurUafS8s
         XClg==
X-Gm-Message-State: APjAAAVw80HDXq7goRM9Sm3iaeacUkrQmvYF+rAnGlY2u9pJ/hKB07Dw
        StJMqxV/QJwLQxdyoYm4KT4tje5rxZJQ0G952cTpibkcu+M0rg==
X-Google-Smtp-Source: APXvYqwkPewOg9FGfvhmb7YbQwJvEjLc5Qw7ribrbVAVmkG2a+6kIuv7uAhUprPT5BRlyXxzshcw1VuRZbZoGZqv2X0=
X-Received: by 2002:aa7:9474:: with SMTP id t20mr7040024pfq.241.1579782726772;
 Thu, 23 Jan 2020 04:32:06 -0800 (PST)
MIME-Version: 1.0
References: <20200122161843.68296-1-mika.westerberg@linux.intel.com>
In-Reply-To: <20200122161843.68296-1-mika.westerberg@linux.intel.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 23 Jan 2020 14:31:58 +0200
Message-ID: <CAHp75VcE_s69T5ap0iA05kYwvipk+e7i2hSwK6_utUkYbP=Kjg@mail.gmail.com>
Subject: Re: [PATCH] platform/x86: intel_scu_ipcutil: Remove default y from Kconfig
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 22, 2020 at 6:18 PM Mika Westerberg
<mika.westerberg@linux.intel.com> wrote:
>
> This driver is by no means essential for system to boot up so remove
> default y from it.

Pushed to my review and testing queue, thanks!

> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
> This was part of a bigger series [1] but since this is an independent
> change, I'll send it separately.
>
> [1] https://lkml.org/lkml/2020/1/21/678
>
>  drivers/platform/x86/Kconfig | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 27d5b40fb717..dd4326736d11 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -997,7 +997,6 @@ config INTEL_SCU_IPC
>  config INTEL_SCU_IPC_UTIL
>         tristate "Intel SCU IPC utility driver"
>         depends on INTEL_SCU_IPC
> -       default y
>         ---help---
>           The IPC Util driver provides an interface with the SCU enabling
>           low level access for debug work and updating the firmware. Say
> --
> 2.24.1
>


-- 
With Best Regards,
Andy Shevchenko
