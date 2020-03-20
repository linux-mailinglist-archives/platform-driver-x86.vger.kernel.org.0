Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 281B418CEFB
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Mar 2020 14:35:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727521AbgCTNfY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Mar 2020 09:35:24 -0400
Received: from mail-wm1-f67.google.com ([209.85.128.67]:51516 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727522AbgCTNfT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Mar 2020 09:35:19 -0400
Received: by mail-wm1-f67.google.com with SMTP id c187so6523632wme.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Mar 2020 06:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=YxuT8VTRArGqn+RIbW+oB8jNX+9BGigb4/P7CTp2s5o=;
        b=d/xQo1zEVHGFHHdCRvK8nW9vYq6E1xfkwHUI4GlFPAkTk2rJ93zWgsa1nut8ctMhGe
         VeA2tmm32Zl+raj+zbklYNwpNwZVrGRl/KL7Jug6kWnfjrmOTegCVdlJn53XoeIEZZjL
         rp/VqZw2cRv64TXa1hlwS4i4Qbh15SIgzxPI34v9T0JPXCLSRLSuqFlDMmpB9n4Nj2Jk
         rbNnT5SJO8v5GqtQY8co5lBXL5VEnixLdYKADGtcRN17BexHmwe93R6tAupYdz26vDsu
         v4IfzIX5KkJTeWJ+ZjXiG/4En9l4N0Far7/+Ha4U5k25Ho/TL+Dn0nGHOsEcIjGxTig0
         O1sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=YxuT8VTRArGqn+RIbW+oB8jNX+9BGigb4/P7CTp2s5o=;
        b=Juwc5NINkGBJwBz7uLCmbOc/UluLUEFyyjDX+KhMjeLI50ETLnBeedPUNZlqDzGhXK
         05aoD2FwpPntgRXVpi3sU3qdU9haLaXP1OA+ew5w4f1J6NkKDYuWfATFv6kcTL9pJHTg
         1v/sO0TZOVZmIFeNDGmQctj3h40hGN7Nf3OpapThhf9KzEQ/Dlo/wbS6tNvkvr5KDimy
         hVsHopAsLEBWNwoxRf6RKxEHSDzzR0Y0k8zPDpvbIdF8jabBKdhBs+3f27m/yqf6Fn4+
         AA3FWa54NHCrtygfvxOFHgs7gjlHjo4s5UjF51Zy3CPMXztq7uBHCDrnKu4lm2PS6uvw
         4W+w==
X-Gm-Message-State: ANhLgQ3HJbxPxjC5v0p8Zc6kerdMx76vth8Om16DFyON+N2zJWeTfsns
        Zm+CxLS22Xv3fM36EQvRHK0tXQ==
X-Google-Smtp-Source: ADFU+vvbxhZ+jhlGwAXeXKHcTIWOulxfuzDlUOLQY4koNixlyTIbyAUF4Hg2xDKlNLPbZ3JGZf0lWg==
X-Received: by 2002:a1c:4c16:: with SMTP id z22mr10692628wmf.50.1584711317396;
        Fri, 20 Mar 2020 06:35:17 -0700 (PDT)
Received: from dell ([2.27.35.213])
        by smtp.gmail.com with ESMTPSA id m17sm8457182wrw.3.2020.03.20.06.35.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Mar 2020 06:35:16 -0700 (PDT)
Date:   Fri, 20 Mar 2020 13:36:02 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 01/19] platform/x86: intel_scu_ipc: Split out SCU IPC
 functionality from the SCU driver
Message-ID: <20200320133602.GE5477@dell>
References: <20200303133649.39819-1-mika.westerberg@linux.intel.com>
 <20200303133649.39819-2-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200303133649.39819-2-mika.westerberg@linux.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 03 Mar 2020, Mika Westerberg wrote:

> The SCU IPC functionality is usable outside of Intel MID devices. For
> example modern Intel CPUs include the same thing but now it is called
> PMC (Power Management Controller) instead of SCU. To make the IPC
> available for those split the driver into core part (intel_scu_ipc.c)
> and the SCU PCI driver part (intel_scu_pcidrv.c) which then calls the
> former before it goes and creates rest of the SCU devices. The SCU IPC
> will also register a new class that gets assigned to the device that is
> created under the parent PCI device.
> 
> We also split the Kconfig symbols so that INTEL_SCU_IPC enables the SCU
> IPC library and INTEL_SCU_PCI the SCU driver and convert the users
> accordingly. While there remove default y from the INTEL_SCU_PCI symbol
> as it is already selected by X86_INTEL_MID.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  arch/x86/Kconfig                        |   2 +-
>  arch/x86/include/asm/intel_scu_ipc.h    |  18 +++

>  drivers/mfd/Kconfig                     |   4 +-

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

>  drivers/platform/x86/Kconfig            |  24 ++--
>  drivers/platform/x86/Makefile           |   1 +
>  drivers/platform/x86/intel_scu_ipc.c    | 172 ++++++++++++++++--------
>  drivers/platform/x86/intel_scu_pcidrv.c |  55 ++++++++
>  7 files changed, 208 insertions(+), 68 deletions(-)
>  create mode 100644 drivers/platform/x86/intel_scu_pcidrv.c

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
