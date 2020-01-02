Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5707E12E41B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jan 2020 09:58:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727896AbgABI6T (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Jan 2020 03:58:19 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:34819 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727843AbgABI6S (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jan 2020 03:58:18 -0500
Received: by mail-wm1-f67.google.com with SMTP id p17so5027178wmb.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jan 2020 00:58:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=rF2GOyv1qKGyelgCdXaDqFp0t9OEft8RgfjG8RbwO0g=;
        b=WdYBfOGlojX9ZqStJz1WXUnBMUzLjdK/UCEb6Ud+cEJP3dGhy5l6Keo36jtRwRolDI
         7zCbowej+lKkQ9Zmii6ybxQmoDVpRw+nPCHKdEUpVAuFgvZu4aQxYOigJUFR1UngqOCW
         fYp3Wed5OBfOfmpnsIrlyQF2PZ+M+OdXqylyroPTY6o/HJJu92n+LeCGezfhCHd8t85F
         UmmRR6QaHd5FwebIpksnyQiqZ3rSS0FiPgpMZH24bGh2YbdvOOlGojZSLjpzORg/XVda
         GAoXFcNvtwawh+MRfiaQ0PJI3mwoQz0vyl59HJINE/DuHGX133t2R4qt/X9nV8mCBbs8
         +vfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=rF2GOyv1qKGyelgCdXaDqFp0t9OEft8RgfjG8RbwO0g=;
        b=d97dkCyHRf6Fl+A7PRjF0Tqf2J2auG4R4fVH1CAGmbuS9pwfsH7Q8kA4xG9cx78hvL
         z7IUj8LCtaSbfMQairI1gfJ7znnD2sIPBTdngFI9Qfg5pqNUu2UUNHRhSJoEG8Z5hkwI
         U2FFkLk0gDUvjHWVx2tS3zil2Kx5D3gG/akU0AYPiM6WEn0VsjIUNRxhcsin+wjrtTw9
         Y6/MO6MDqwTcA5Opqun4YLzky3EvjjVMc8yTUHGqkxFij+aB7YItnAsnZVd4PuAmjHrC
         O/U/v/AmloRJKUXusmXiQgPNW1j0B2h+1SBmr0HEULn/3QghonEbWp+fglLBSontMda8
         H9bA==
X-Gm-Message-State: APjAAAWDBYWzfQlgT+XjhvcyfgCS1/iwbSD33rZ5QzFOCYrxGBYu5Uv0
        xuvDhw/9ovRDPkyLGfo8jXyiEIDdOes=
X-Google-Smtp-Source: APXvYqzESLZ8jsgLl2vRzwsDxjMT2dpWZawd9oCfmtbFbTfYjQgGcWbkV5MaIcusnw57GoneJeOMnQ==
X-Received: by 2002:a05:600c:230d:: with SMTP id 13mr13680648wmo.13.1577955497057;
        Thu, 02 Jan 2020 00:58:17 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id t125sm8025145wmf.17.2020.01.02.00.58.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 00:58:16 -0800 (PST)
Date:   Thu, 2 Jan 2020 08:58:28 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 12/37] platform/x86: intel_scu_ipc: Split out SCU IPC
 functionality from the SCU driver
Message-ID: <20200102085828.GC22390@dell>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-13-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141716.13727-13-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 23 Dec 2019, Mika Westerberg wrote:

> The SCU IPC functionality is usable outside of Intel MID devices. For
> example modern Intel CPUs include the same thing but now it is called
> PMC (Power Management Controller) instead of SCU. To make the IPC
> available for those split the driver into library part (intel_scu_ipc.c)
> and the SCU PCI driver part (intel_scu_pcidrv.c) which then calls the
> former before it goes and creates rest of the SCU devices.
> 
> We also split the Kconfig symbols so that INTEL_SCU_IPC enables the SCU
> IPC library and INTEL_SCU_PCI the SCU driver and convert the users
> accordingly. While there remove default y from the INTEL_SCU_PCI symbol
> as it is already selected by X86_INTEL_MID.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/Kconfig                        |  2 +-
>  arch/x86/include/asm/intel_scu_ipc.h    | 15 +++++

>  drivers/mfd/Kconfig                     |  4 +-

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

>  drivers/platform/x86/Kconfig            | 26 ++++++---
>  drivers/platform/x86/Makefile           |  1 +
>  drivers/platform/x86/intel_scu_ipc.c    | 77 +++++++++----------------
>  drivers/platform/x86/intel_scu_pcidrv.c | 61 ++++++++++++++++++++
>  7 files changed, 125 insertions(+), 61 deletions(-)
>  create mode 100644 drivers/platform/x86/intel_scu_pcidrv.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
