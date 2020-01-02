Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8C1AA12E44A
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jan 2020 10:16:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727884AbgABJQP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Jan 2020 04:16:15 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37101 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727880AbgABJQP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jan 2020 04:16:15 -0500
Received: by mail-wr1-f68.google.com with SMTP id w15so25961074wru.4
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Jan 2020 01:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=6a8Lf8iEQGPGso4QNX6qUnH52YiLw9fw+hSHtKVe5Q8=;
        b=D/BhNFU6bkcHXvEEINUxmv5FYMGVJ1xnqDnkjQKk7Psk38x8ZeFVyul9+U+jpd1eSP
         DxvMkMuhFGPsr2bguS5sbWEVvTagxv2BVzUbBhBbrrdyWk9xlc8tg3D3q2X7UFR+mwKN
         GcAsYJtTgJU65WZgNmIIt1F79AXFFpX9hW814XSMl9le+PMU5d60T6mviFe/KlEv9DLc
         vGkMkDKBZGJPQGsq68gzWbOkhr1331JdL4w9uJLRmChkAHHnw41iy/k6wKJ4iKH6tAQ/
         OeoTPcgC7qslPI4dGafciOxDND6ibxP83RDR6OWnZvq/XfZfKyzIMb6TpoOakUdfYbIt
         Yg1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=6a8Lf8iEQGPGso4QNX6qUnH52YiLw9fw+hSHtKVe5Q8=;
        b=f/INxm1ElZQX/Xroq0mjWiP+ME3GpUunCQj6Zxw+nQ6Kqp/E+YfxfOD0wW0fM+oa2n
         jDmMQeySc8ACZnI7uLbe1ybu2kRGVDDoEDNgIOzHW9hdhzuhl9A12p01zn36vPaKGrTn
         HtFdAUcFHIHc52jk2CfiP4wwPgNFqnJlRrPMJ0nRKDxxp+LMXRUpJHOvc28lSOOI6zID
         /AQhLZwW8G8uaXP9gAhfOqnJ9xRaeOLzbP7sRkJEjq8sVyKHtKvtV9yy+yJuNQkVVUYV
         MozNehFnkur7Y4sr83NOr+9EKbXKSEGwJ1xQfLWfjJWHA/pAKXES5+9W54IGFXycT16d
         zQsQ==
X-Gm-Message-State: APjAAAUmbcivDoAtRV7DLPlASHQpueHHdYxpe7S2uyJQ/6/6PpXCEaGR
        c+3PVreZfEPr8C8RCQB/fBvi/pewWIA=
X-Google-Smtp-Source: APXvYqybG2Qh4sWG7qTZyUUPWfXvX/S5vD0yRLklxHqM3YdDWd5j3iodlFA6Zg/JlnxNGZ3VMUXiHQ==
X-Received: by 2002:adf:ea8a:: with SMTP id s10mr79641067wrm.278.1577956573505;
        Thu, 02 Jan 2020 01:16:13 -0800 (PST)
Received: from dell ([2.27.35.135])
        by smtp.gmail.com with ESMTPSA id 60sm58034828wrn.86.2020.01.02.01.16.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2020 01:16:12 -0800 (PST)
Date:   Thu, 2 Jan 2020 09:16:25 +0000
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
Subject: Re: [PATCH 27/37] mfd: intel_soc_pmic_bxtwc: Convert to use new SCU
 IPC API
Message-ID: <20200102091625.GE22390@dell>
References: <20191223141716.13727-1-mika.westerberg@linux.intel.com>
 <20191223141716.13727-28-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20191223141716.13727-28-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 23 Dec 2019, Mika Westerberg wrote:

> Convert the Intel Broxton Whiskey Cover PMIC driver to use the new SCU
> IPC API. This allows us to get rid of the PMC IPC implementation which
> is now covered in SCU IPC driver.
> 
> Also move PMIC specific IPC message constants to the PMIC driver from
> the intel_pmc_ipc.h header.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> ---
>  arch/x86/include/asm/intel_pmc_ipc.h |  3 ---
>  drivers/mfd/intel_soc_pmic_bxtwc.c   | 22 +++++++++++++++-------
>  2 files changed, 15 insertions(+), 10 deletions(-)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
