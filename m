Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3114E4A22
	for <lists+platform-driver-x86@lfdr.de>; Fri, 25 Oct 2019 13:40:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410340AbfJYLkt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 25 Oct 2019 07:40:49 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:42620 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbfJYLkt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 25 Oct 2019 07:40:49 -0400
Received: by mail-wr1-f65.google.com with SMTP id r1so1945229wrs.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 25 Oct 2019 04:40:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=1E+wk7tN6ruu9vGXxSj1MPfDYALqcvFUI2R29nV/OK0=;
        b=aLRz6zK+qwK1To06Ikpf/PxpE5iCftMw05p4pVWa2NF3jct64Siqu5I3IgZUyxiCwk
         BbtzchuXBBA2oT0ihStDXZKFUI1HR/iw8eb3SK9eLp/Un5pf5WXHAeTo3VZyvmJimCRn
         mR76a22qrY7dl2FCxmN+Xx9jG48X5nJDk9d7HWyihzlGehk0St3mcBRlDXKEe/2hoeKO
         a3xDhJ0Yji7ew3mwcz5kZEMwpsNeboB1EBcsMOcslBvIKOG6Vk8frY/66N+AWk+HB/qb
         H5shYLV8R5aIKgOwlY5clt7Gr+kAkc2rEG3Sav/fLc5rZc6eZlx6VU63sHDbT5nmeTvz
         hj0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=1E+wk7tN6ruu9vGXxSj1MPfDYALqcvFUI2R29nV/OK0=;
        b=GAmrYwVpMMHslrEY94ExlpxUipY7njEhZCW/6y9GMFLWAA7QagTT7tJDHDnv6leLIk
         mYS28FJ25mnep65Ur/PZwxBvbyjucF8URTW7Iqt6mNqdMx5S+5YGNpk6Ew6bR7n3f2mp
         KUwgZnP7jl3UIZDE56aRTjYtMeb7qsSq1ZY0+vY4gyFTFDfy1f2ejFSxGHNmWBZyE/F4
         JA7vQ733K/wSnrUvHZk/TmPWWNSAAeKPXQBUPxpPpy84HJdA/V3Q1N5YJqWKwLjIuk1Y
         fsgedPVoqixLrFaNBwfZun2TN6jNiUj/0mNQf4UQj/SrcdV9fH3uQt/roh+JmU+JTnGk
         CXDA==
X-Gm-Message-State: APjAAAVMvUzBAaHnTgqP6nurVtFKg9ToKblDE5ldWqXMQ2mrFMxtjmmm
        Vx2p4VuGTa1OKybDRGDlfVLrN82w
X-Google-Smtp-Source: APXvYqxRhHmrs4rz4Pa11Szlu1P8A6xZdLzLXbNVQQUQfN2YEqkkhr/iPdtzWeg7UqXGd7AgngqIrA==
X-Received: by 2002:adf:e651:: with SMTP id b17mr2068175wrn.191.1572003212775;
        Fri, 25 Oct 2019 04:33:32 -0700 (PDT)
Received: from pali ([2a02:2b88:2:1::5cc6:2f])
        by smtp.gmail.com with ESMTPSA id o25sm2214942wro.21.2019.10.25.04.33.31
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 25 Oct 2019 04:33:31 -0700 (PDT)
Date:   Fri, 25 Oct 2019 13:33:30 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To:     Alexander Schremmer <alex@alexanderweb.de>
Cc:     andy.shevchenko@gmail.com, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
Message-ID: <20191025113330.6wmi5lcm7mzlkl5a@pali>
References: <CAHp75VdMZMxGJpmi6wQMa8FJdzpkPq7nA=kFf4pUSrskrTtFeA@mail.gmail.com>
 <20190822114833.29885-1-alex@alexanderweb.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20190822114833.29885-1-alex@alexanderweb.de>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thursday 22 August 2019 13:48:33 Alexander Schremmer wrote:
> This feature is found optionally in T480s, T490, T490s.
> 
> The feature is called lcdshadow and visible via
> /proc/acpi/ibm/lcdshadow.
> 
> The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
> available in these machines. They get, set, toggle or change the state
> apparently.
> 
> The patch was tested on a 5.0 series kernel on a T480s.
> 
> Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
> ---
>  .../admin-guide/laptops/thinkpad-acpi.rst     |  23 ++++
>  drivers/platform/x86/thinkpad_acpi.c          | 112 ++++++++++++++++++
>  2 files changed, 135 insertions(+)
> 
> diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> index adea0bf2acc5..822907dcc845 100644
> --- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> +++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
> @@ -49,6 +49,7 @@ detailed description):
>  	- Fan control and monitoring: fan speed, fan enable/disable
>  	- WAN enable and disable
>  	- UWB enable and disable
> +	- LCD Shadow (PrivacyGuard) enable and disable
>  
>  A compatibility table by model and feature is maintained on the web
>  site, http://ibm-acpi.sf.net/. I appreciate any success or failure
> @@ -1409,6 +1410,28 @@ Sysfs notes
>  	Documentation/driver-api/rfkill.rst for details.
>  
>  
> +LCD Shadow control
> +------------------
> +
> +procfs: /proc/acpi/ibm/lcdshadow
> +
> +Some newer T480s and T490s ThinkPads provide a feature called
> +PrivacyGuard. By turning this feature on, the usable vertical and
> +horizontal viewing angles of the LCD can be limited (as if some privacy
> +screen was applied manually in front of the display).
> +
> +procfs notes
> +^^^^^^^^^^^^
> +
> +The available commands are::
> +
> +	echo '0' >/proc/acpi/ibm/lcdshadow
> +	echo '1' >/proc/acpi/ibm/lcdshadow
> +
> +The first command ensures the best viewing angle and the latter one turns
> +on the feature, restricting the viewing angles.
> +
> +
>  EXPERIMENTAL: UWB
>  -----------------

Hello! Is not the whole /proc/apci/ibm API for new things obsoleted or deprecated?
And should not rather it use platform driver in /sys/ (class?) namespace?

-- 
Pali Rohár
pali.rohar@gmail.com
