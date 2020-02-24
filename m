Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7A8E616AA18
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Feb 2020 16:29:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727859AbgBXP3i (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Feb 2020 10:29:38 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:39068 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727581AbgBXP3i (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Feb 2020 10:29:38 -0500
Received: by mail-wm1-f67.google.com with SMTP id c84so9866815wme.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Feb 2020 07:29:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=AXpFOJp0zSaTFAP+me7G07Iilsucf3whVGy3CIL9cVI=;
        b=aqlsWUNPbsW9l28BYG/n5HyXAUrCXzZQydP4nPSMTpgPgE7D9QXgxjLMGZtexm0jFa
         Lm0qzuluSGBlNKpNchaYfMS7nS4loKI4RVOfhX/JnJHzd1YsDB7DZQ2fLXN+WfCRCCwY
         WG1Ya2gJH4sFiQA0nkfGCminkhxH73nrSrsG248xK8Vsxv4+9/G4unhB5wOMtmOdLg3z
         T++jB+yd5dzHPinJnxW7PyAGeyfKhUA87XxmdT+hlSywoCt3/R27XGzCwFqCxruLTIvf
         MhPbb1KfkobcJenuHhtKE2Zp0Z6UKs74Y9KPa8uejUm6zAnbQ0OgJ4JOrxktbnc9zJnP
         Tsvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=AXpFOJp0zSaTFAP+me7G07Iilsucf3whVGy3CIL9cVI=;
        b=tQ2xwmRRE4a7FNG2IXmlcCktNABSw8wnQ4aUaMOyzGVv1a3cHVX+UqF0YQYE5jH+t7
         SVNFzVJiz0ZKB27UYcShUILO69jfUUwC1NdfDbTqmLDJT5Q5m7xlbjwwAFL6S4x1z13l
         RIZxOCY9CC8kbBZ5jVfS8oWncg3taf4K63GIEmZeziLAkDMrvq9U+4zHgxNEop+sx9b9
         p64+kgf0PsU/ud0VQH+3EDXWjI6GrLsdD7+6nQ4dZ50/sy5TB5LY2BorMxmQ7fbgKv+n
         ltK4CVmPuBoEA4zgAJARdXEg4wzbWka+f1W8Baoz6GVyiGSeyFSJNVH+p1S2SHKSaxjJ
         7iKA==
X-Gm-Message-State: APjAAAWrDaaEqBePSCAvuBOqwjFxzw5wRtn5HJrdQwE1+jdi0X5gMq9d
        vn7p6Xo7SdMbdX4wYQ3HW7a5sA==
X-Google-Smtp-Source: APXvYqyW7u01kII2K7pYNHauJqRc75jIktUIXQaMXO5DBluLiHAFSlxuEEylaK9W/agE16CWGXMiNQ==
X-Received: by 2002:a7b:c14e:: with SMTP id z14mr22226152wmi.58.1582558176258;
        Mon, 24 Feb 2020 07:29:36 -0800 (PST)
Received: from dell ([2.31.163.122])
        by smtp.gmail.com with ESMTPSA id f8sm18200741wru.12.2020.02.24.07.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2020 07:29:35 -0800 (PST)
Date:   Mon, 24 Feb 2020 15:30:06 +0000
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
Subject: Re: [PATCH v6 10/19] mfd: intel_soc_pmic: Add SCU IPC member to
 struct intel_soc_pmic
Message-ID: <20200224153006.GV3494@dell>
References: <20200217131446.32818-1-mika.westerberg@linux.intel.com>
 <20200217131446.32818-11-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200217131446.32818-11-mika.westerberg@linux.intel.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 17 Feb 2020, Mika Westerberg wrote:

> Both PMIC drivers (intel_soc_pmic_mrfld and intel_soc_pmic_bxtwc) will
> be using this field going forward to access the SCU IPC instance.
> 
> While there add kernel-doc for the intel_soc_pmic structure.
> 
> Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
> Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  include/linux/mfd/intel_soc_pmic.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)

For my own reference:
  Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>

-- 
Lee Jones [李琼斯]
Linaro Services Technical Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
