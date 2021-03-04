Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3391132DAD6
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Mar 2021 21:08:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231969AbhCDUHP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Mar 2021 15:07:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51464 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231529AbhCDUHM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 15:07:12 -0500
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com [IPv6:2607:f8b0:4864:20::1029])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2EBF7C061574
        for <platform-driver-x86@vger.kernel.org>; Thu,  4 Mar 2021 12:06:32 -0800 (PST)
Received: by mail-pj1-x1029.google.com with SMTP id h13so1355702pjt.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 12:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=lnJjHLK9ZFNv1LfwcSxXM5rm17wtY4Bt/ImB5tn9sNA=;
        b=aS4Br3QxJPduwCSP0G16n1nsbN0FRnu22xdxKkv1cSH5NA92NnwfdbKDMF5IbhT0TU
         K02WJ3RrNk5vJXbC5kcu7u5ccTtJl+9ez7DVTfj1WqjC0ZiI5FeFP7UJ2Re1ROE41kQP
         tJbdd9Cblairk3TMEaJO0YirXtRZ8c0p3AsdE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=lnJjHLK9ZFNv1LfwcSxXM5rm17wtY4Bt/ImB5tn9sNA=;
        b=IXrCd2gRLp+a/1jzYu3B9q/ZPRcYNDLiv9H15TlDcm/zok19yvtlUMGw3ZIOKDLOVe
         XrCQjZBXjsGwRE7sB0dQjsivjc8lvkrNKh7bbTlWgbJvL4sBVrH+jexobuxqhR8P7ZPQ
         Q2gDwBWwVyyava8+9OREB/YESb7eQ5UIzGxn9E1v4f9Viai1J/vl5Wtsk9yaum3ZCfVH
         f8EEFoyIb/+tjlhgHBogd7lURL9gPlF15sduxxSn2sRCVVg6jpssKdI0ygHqB1MwK+SL
         fCcDkT4jGwSFIZVcTLh2YNxjkmrtpdId7Wi68ZeY69VcJ4GPO5rWIwfjQhqqnBKTVuNn
         3mng==
X-Gm-Message-State: AOAM532DSB0JUnWU6VyrO+/hxzQkBmmBJM33nB+mzcXlJH865XBfUTHT
        upejBoNwMJDmigM6+HHCF43ZSw==
X-Google-Smtp-Source: ABdhPJyF2fNxbvWj5AWkAFxyulMHQvPSvmvbNBivEVEqAGckfXq+s6pB6gv45igmOgG0WhRvHJ1yKQ==
X-Received: by 2002:a17:90a:fb47:: with SMTP id iq7mr6463323pjb.159.1614888391652;
        Thu, 04 Mar 2021 12:06:31 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k4sm214009pfg.102.2021.03.04.12.06.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Mar 2021 12:06:31 -0800 (PST)
Date:   Thu, 4 Mar 2021 12:06:30 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Vadim Pasternak <vadimp@nvidia.com>,
        platform-driver-x86@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        linux-hardening@vger.kernel.org,
        Matthew Garrett <mjg59@srcf.ucam.org>
Subject: Re: Flipping firmware write-protection bits from within the kernel
 (was Re: [PATCH RFC platform-next 8/8] Documentation/ABI: Add new line card
 attributes for mlxreg-io sysfs interfaces)
Message-ID: <202103041202.08F8D8533@keescook>
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <20210203173622.5845-9-vadimp@nvidia.com>
 <009a1a80-62ca-35ce-5f02-b43b25e5ebd1@redhat.com>
 <96f705e0-2d34-3c8e-3f13-8585dbbb74bf@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96f705e0-2d34-3c8e-3f13-8585dbbb74bf@redhat.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Mar 04, 2021 at 11:48:10AM +0100, Hans de Goede wrote:
> Hi Kees, et al.,
> 
> Kees, you were the first person who came to mind to ask about this, feel free to
> point me to someone else.
> 
> While reviewing a patch-set for hw-enablement of some upcoming Melanox platforms,
> the addition of some sysfs files which flip write-protect bits for various firmwares
> found on the platform on/off stood out to me.

Eeek :(

> As I mention in me reply to the below patch adding the docs for this at a minimum
> this must (IMHO) tie into the new lockdown framework and disallow enabling
> fw-updates this way depending on the lockdown mode.

I would agree: lockdown (integrity mode) should, IMO, block these kinds
of firmware writes if there isn't some kind of cryptographic attestation
happening.

(Probably there are many of these holes already in the kernel, but we
should avoid adding more.)

> 
> Are there any other security checks which the code should/could do here ?
> 
> Maybe tie into the audit code somehow ?

I'll leave that to the audit folks to answer. :)

-Kees

> 
> Regards,
> 
> Hans
> 
> 
> 
> 
> On 3/4/21 11:39 AM, Hans de Goede wrote:
> > Hi,
> > 
> > On 2/3/21 6:36 PM, Vadim Pasternak wrote:
> >> Add documentation for the new attributes for line cards:
> >> - CPLDs versioning.
> >> - Write protection control for 'nvram' devices.
> >> - Line card reset reasons.
> >> - Enabling burning of FPGA and CPLDs.
> >> - Enabling burning of FPGA and gearbox SPI flashes,
> >> - Enabling power of whole line card.
> >> - Enabling power of QSFP ports equipped on line card.
> >> - The maximum powered required for line card feeding.
> >> - Line card configuration Id.
> >>
> >> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
> >> ---
> >>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 92 +++++++++++++++++++++++++
> >>  1 file changed, 92 insertions(+)
> >>
> >> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> >> index 1d1a8ee59534..a22e9d6c0904 100644
> >> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> >> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> >> @@ -326,3 +326,95 @@ Description:	This file unlocks system after hardware or firmware thermal
> >>  		locking.
> >>  
> >>  		The file is read/write.
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files show with which CPLD major and minor versions
> >> +		and part number has been burned CPLD device on line card.
> >> +
> >> +		The files are read only.
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files show with which FPGA major and minor versions
> >> +		and part number has been burned FPGA device on line card.
> >> +
> >> +		The files are read only.
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/ini_wp
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files allow to overwrite line card VPD and firmware blob
> >> +		hardware write protection mode. When attribute is set 1 - write
> >> +		protection is disabled, when 0 - enabled. By default both are
> >> +		write protected.
> >> +
> >> +		The files are read/write.
> > 
> > This seems to have some serious security implications. IMHO this should be tie into the
> > kernel's new(ish) lockdown system, so that if the system is in locked-down mode writing
> > these will not be allowed.
> > 
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files show the line reset cause, as following: power
> >> +		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
> >> +		failed, line card reset failed, power off from chassis.
> >> +		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
> >> +		the above causes could be 1 at the same time, representing only last
> >> +		reset cause.
> >> +
> >> +		The files are read only.
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
> >> +		is enabled, 0 - otherwise.
> >> +
> >> +		The files are read/write.
> > 
> > Same remark as above.
> > 
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files allow to power on/off all QSFP ports and whole line card.
> >> +		The attributes are set 1 for power on, 0 - for power off.
> >> +
> >> +		The files are read/write.
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files allow gearboxes and FPGA SPI flash burning.
> >> +		The attributes are set 1 to enable burning, 0 - to disable.
> >> +
> >> +		The file is read/write.
> > 
> > Same remark as above.
> > 
> >> +
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
> >> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
> >> +Date:		March 2021
> >> +KernelVersion:	5.12
> >> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
> >> +Description:	These files provide the maximum powered required for line card
> >> +		feeding and line card configuration Id.
> >> +
> >> +		The files are read only.
> >>
> > 
> > Regards,
> > 
> > Hans
> > 
> 

-- 
Kees Cook
