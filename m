Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3BA1216F82A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 26 Feb 2020 07:44:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbgBZGol (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 26 Feb 2020 01:44:41 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:46063 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726473AbgBZGol (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 26 Feb 2020 01:44:41 -0500
Received: by mail-wr1-f66.google.com with SMTP id v2so463644wrp.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 25 Feb 2020 22:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=+KPHLK60Od8Tz3at5CtY8IsfsFpWA/aEWA5NAOhb0WU=;
        b=Qj/tpUstLELK5vv6XqennEvqhI9Dn1aambXr8LWCAJ6RuIMxB4e0WMnhKK5YG/SBdd
         hByGxHZcQhTwcMBvErtFpZIRGnXN5cjYHubnkEswYSUXOcwaGjaKJyolTBbvUlUbxybe
         2/mjGV4Oc+ubFZ9mAfVT7rDyiWVJr3Db4gbr64XQc6JXYc9WBJK7L+FiGWITA6ZPIfaz
         KXCLkXdbt2luMqQsf7MjdoZqzFyrxj0RJ60O+aCRx5ACbZ997AYNKLJYFtSWoMyL8hzn
         yP6fjO2FqSLFJVwfqlO22iGfHrdfyfvq6IWt1Z7IVFMwUwStXWHe8flFmc80KUMBWT0C
         cDBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=+KPHLK60Od8Tz3at5CtY8IsfsFpWA/aEWA5NAOhb0WU=;
        b=dm6SScd5OW4TWJGaMlAj4ckYGWkhFz1vutH4htACmsIRCnvk1jEI/Z3zaPDCWRAyOT
         oEfra/Ljz86Zanpvhs0HoGeahwzBQRLGruv79a+b1rQ734ucMXZ64eZzA2881PTvblkC
         naie7CxUwdqqnbI9oYRBbtsR2l/6EQXzoDY4IyR/rg66IORHrrsTd9dbXqSIAkC617S1
         KFsvLVKvNTMBeElGFQKApvwUM5AuGt9AyICZLzDkXbgyS+lg21QPXIPca3u1KHyUVd8v
         K3TeSxF0tleRiVytCaI8WOBxrfUIkP/5la1u1cowzYim1G5coqROWJYlracxUQmXGQRf
         KP3Q==
X-Gm-Message-State: APjAAAVEc7GC/MHwp0H9GXRxgITwFeEh1+ZK2cmbRkXnvnVKyvKZo44n
        dg2rEs0D7wMPiL9pFYS8DpOPOszx/Tc=
X-Google-Smtp-Source: APXvYqzzKWMArtaFbi5nyEZ/y+P8oPK5jIkuzcSZocgxqUWUIHT0bV17ls7m2M7xepaDkZ5R4ou4BQ==
X-Received: by 2002:a5d:56ca:: with SMTP id m10mr3653907wrw.313.1582699479274;
        Tue, 25 Feb 2020 22:44:39 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id g25sm8002307wmh.3.2020.02.25.22.44.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Feb 2020 22:44:38 -0800 (PST)
Date:   Wed, 26 Feb 2020 06:45:10 +0000
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
Subject: Re: [PATCH v6 12/19] mfd: intel_soc_pmic_mrfld: Convert to use new
 SCU IPC API
Message-ID: <20200226064510.GZ3494@dell>
References: <20200217131446.32818-1-mika.westerberg@linux.intel.com>
 <20200217131446.32818-13-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200217131446.32818-13-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 17 Feb 2020, Mika Westerberg wrote:

> This converts the Intel Merrifield PMIC driver over the new SCU IPC API
> where the SCU IPC instance is passed to the functions.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  drivers/mfd/intel_soc_pmic_mrfld.c | 10 ++++++++--
>  1 file changed, 8 insertions(+), 2 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
