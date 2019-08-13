Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 32A4B8B4FA
	for <lists+platform-driver-x86@lfdr.de>; Tue, 13 Aug 2019 12:06:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728736AbfHMKG6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 13 Aug 2019 06:06:58 -0400
Received: from mga01.intel.com ([192.55.52.88]:43054 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728410AbfHMKG6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 13 Aug 2019 06:06:58 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga101.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 03:06:58 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="194163262"
Received: from kuha.fi.intel.com ([10.237.72.189])
  by fmsmga001.fm.intel.com with SMTP; 13 Aug 2019 03:06:56 -0700
Received: by kuha.fi.intel.com (sSMTP sendmail emulation); Tue, 13 Aug 2019 13:06:55 +0300
Date:   Tue, 13 Aug 2019 13:06:55 +0300
From:   Heikki Krogerus <heikki.krogerus@linux.intel.com>
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190813100655.GC4691@kuha.fi.intel.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190808215559.2029-2-jekhor@gmail.com>
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 09, 2019 at 12:55:59AM +0300, Yauhen Kharuzhy wrote:
> Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> hardware has TypeC connector and register related devices described as
> I2C connections in the _CRS resource.
> 
> There at least one hardware (Lenovo Yoga Book YB1-91L/F) with microUSB
> connector exists. It has INT33FE device in the DSDT table but there are
> only two I2C connection described: PMIC and BQ27452 battery fuel gauge.
> 
> Splitting existing INT33FE driver allow to maintain code for microUSB
> variant separately and make it simpler.
> 
> Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> ---
>  drivers/platform/x86/Kconfig                  |  24 +++-
>  drivers/platform/x86/Makefile                 |   5 +-
>  .../platform/x86/intel_cht_int33fe_common.c   |  93 ++++++++++++++++
>  .../platform/x86/intel_cht_int33fe_common.h   |  23 ++++
>  drivers/platform/x86/intel_cht_int33fe_musb.c | 105 ++++++++++++++++++
>  ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  26 +----
>  6 files changed, 249 insertions(+), 27 deletions(-)
>  create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
>  create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
>  create mode 100644 drivers/platform/x86/intel_cht_int33fe_musb.c
>  rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (94%)
> 
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 1b67bb578f9f..a34c5615d6ef 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -920,15 +920,15 @@ config ACPI_CMPC
>  	  keys as input device, backlight device, tablet and accelerometer
>  	  devices.
>  
> -config INTEL_CHT_INT33FE
> -	tristate "Intel Cherry Trail ACPI INT33FE Driver"
> +config INTEL_CHT_INT33FE_TYPEC
> +	tristate "Intel Cherry Trail ACPI INT33FE Driver (typeC connector)"
>  	depends on X86 && ACPI && I2C && REGULATOR
>  	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
>  	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
>  	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
> -	---help---
> +	help
>  	  This driver add support for the INT33FE ACPI device found on
> -	  some Intel Cherry Trail devices.
> +	  some Intel Cherry Trail devices with USB TypeC connector.
>  
>  	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
>  	  resources for 3 devices: Maxim MAX17047 Fuel Gauge Controller,
> @@ -939,6 +939,22 @@ config INTEL_CHT_INT33FE
>  	  If you enable this driver it is advised to also select
>  	  CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m.
>  
> +config INTEL_CHT_INT33FE_MUSB
> +	tristate "Intel Cherry Trail ACPI INT33FE Driver (mUSB connector)"

Please don't use the term MUSB, musb, mUSB or microUSB. A collogue of
mine noticed this thread, and was a bit confused about the use of the
those terms here, and to be honest, so was I. MUSB is USB controller
from Mentor Graphics. This is the driver for it: drivers/usb/musb/

"micro-AB" and "uAB" are much more clear here. For the config option,
how about simply INTEL_CHT_INT33FE_UAB

thanks,

-- 
heikki
