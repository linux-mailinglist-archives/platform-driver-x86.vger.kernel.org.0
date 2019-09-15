Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9EA94B320A
	for <lists+platform-driver-x86@lfdr.de>; Sun, 15 Sep 2019 22:32:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728139AbfIOUca (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 15 Sep 2019 16:32:30 -0400
Received: from mail-lf1-f67.google.com ([209.85.167.67]:36553 "EHLO
        mail-lf1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728137AbfIOUca (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 15 Sep 2019 16:32:30 -0400
Received: by mail-lf1-f67.google.com with SMTP id x80so25850940lff.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 15 Sep 2019 13:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=SHETzPmBnVF4elph5n10Op5SnRjqGLQBj0knCA9mLDM=;
        b=D9aUc51i2H6djul3IrIHihHJniTIWRnEGqRCTAmjZCHPvEpSAlRq8raXD9N6Nbrs3k
         Du8vqqbAKMqcTj79IAeVZAqIWOx1QYeNRi3H9RHFvk1mBtDqE+PWtBL4J5OQytg1Ok6A
         7/SYAB79VBsbpf8FKZF1mkWiIMwq5Wst3Es8vKH/Ygv7QUcTM/JGhgdMX6Z/MMFTGWXY
         i1QziFluwOLzWOSPzSSV9OMtdTLNg5fcuo+XXrO3pmIwfpFF9IkMslkyEQqNZqgL5Yc5
         lz/lAYCo0Us1o1apKgw74nJV7F0K+wsdiA/7ZSwALGSFErgB50/H2p+MiVDbJ6W6ozZT
         xuOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=SHETzPmBnVF4elph5n10Op5SnRjqGLQBj0knCA9mLDM=;
        b=b+KteeH/1izUxx9uAXycxJUPvFwuElai5rWMR4hg8hUtsexx/UDIPW98LBmBNDHh3r
         g0swWrQhi5FXghsHrdnTfhmkYk+MLOMqFjr5BzSyazG7WXb50BPXFGvUP+0j+ZZetzEf
         Ppk6LeKTusXqH4geA1+yUUaIvxeVbUGksBSvDVV9bSlR2QUxolcdn9nzgVynL8SuuYN7
         hPvTW6Xh/54TbMBEzKRge5QwrGj9+I7Uijd9r27NFmgXOjtWyGtRt0AOFgHgZp7U7bom
         B0aWp9Irrx8Y7M7zP0aazwJl3XOlDdRbmjkgBiR9TQWmIpfvd7zcv9YrjLScQynP2bFb
         zt+g==
X-Gm-Message-State: APjAAAWR106ZSvnOnop40QjcCbEhUyuaEnIbUJ/XrgRr4Yr4bH/95An8
        iLefUw9cwK9tNV/PZrzwnzA=
X-Google-Smtp-Source: APXvYqy2+961VvyrNzzC/P6/HHJtiOnSEOfKjpwdM//ZOGeZ4PfPw5a6ha1GhdT0v3dpr3T2PcchOg==
X-Received: by 2002:a19:ae0b:: with SMTP id f11mr38303429lfc.28.1568579547788;
        Sun, 15 Sep 2019 13:32:27 -0700 (PDT)
Received: from localhost.localdomain ([46.216.138.44])
        by smtp.gmail.com with ESMTPSA id v4sm7809677lji.103.2019.09.15.13.32.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Sep 2019 13:32:26 -0700 (PDT)
Received: from [127.0.0.1] (helo=jeknote.loshitsa1.net)
        by localhost.localdomain with esmtp (Exim 4.92.1)
        (envelope-from <jekhor@gmail.com>)
        id 1i9bBy-0003zm-46; Sun, 15 Sep 2019 23:32:18 +0300
Date:   Sun, 15 Sep 2019 23:32:18 +0300
From:   Yauhen Kharuzhy <jekhor@gmail.com>
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to
 microUSB and TypeC variants
Message-ID: <20190915203218.GC14558@jeknote.loshitsa1.net>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <20190813100655.GC4691@kuha.fi.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190813100655.GC4691@kuha.fi.intel.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Aug 13, 2019 at 01:06:55PM +0300, Heikki Krogerus wrote:
> On Fri, Aug 09, 2019 at 12:55:59AM +0300, Yauhen Kharuzhy wrote:
> > Existing intel_cht_int33fe ACPI pseudo-device driver assumes that
> > hardware has TypeC connector and register related devices described as
> > I2C connections in the _CRS resource.
> > 
> > There at least one hardware (Lenovo Yoga Book YB1-91L/F) with microUSB
> > connector exists. It has INT33FE device in the DSDT table but there are
> > only two I2C connection described: PMIC and BQ27452 battery fuel gauge.
> > 
> > Splitting existing INT33FE driver allow to maintain code for microUSB
> > variant separately and make it simpler.
> > 
> > Signed-off-by: Yauhen Kharuzhy <jekhor@gmail.com>
> > ---
> >  drivers/platform/x86/Kconfig                  |  24 +++-
> >  drivers/platform/x86/Makefile                 |   5 +-
> >  .../platform/x86/intel_cht_int33fe_common.c   |  93 ++++++++++++++++
> >  .../platform/x86/intel_cht_int33fe_common.h   |  23 ++++
> >  drivers/platform/x86/intel_cht_int33fe_musb.c | 105 ++++++++++++++++++
> >  ...ht_int33fe.c => intel_cht_int33fe_typec.c} |  26 +----
> >  6 files changed, 249 insertions(+), 27 deletions(-)
> >  create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.c
> >  create mode 100644 drivers/platform/x86/intel_cht_int33fe_common.h
> >  create mode 100644 drivers/platform/x86/intel_cht_int33fe_musb.c
> >  rename drivers/platform/x86/{intel_cht_int33fe.c => intel_cht_int33fe_typec.c} (94%)
> > 
> > diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> > index 1b67bb578f9f..a34c5615d6ef 100644
> > --- a/drivers/platform/x86/Kconfig
> > +++ b/drivers/platform/x86/Kconfig
> > @@ -920,15 +920,15 @@ config ACPI_CMPC
> >  	  keys as input device, backlight device, tablet and accelerometer
> >  	  devices.
> >  
> > -config INTEL_CHT_INT33FE
> > -	tristate "Intel Cherry Trail ACPI INT33FE Driver"
> > +config INTEL_CHT_INT33FE_TYPEC
> > +	tristate "Intel Cherry Trail ACPI INT33FE Driver (typeC connector)"
> >  	depends on X86 && ACPI && I2C && REGULATOR
> >  	depends on CHARGER_BQ24190=y || (CHARGER_BQ24190=m && m)
> >  	depends on USB_ROLES_INTEL_XHCI=y || (USB_ROLES_INTEL_XHCI=m && m)
> >  	depends on TYPEC_MUX_PI3USB30532=y || (TYPEC_MUX_PI3USB30532=m && m)
> > -	---help---
> > +	help
> >  	  This driver add support for the INT33FE ACPI device found on
> > -	  some Intel Cherry Trail devices.
> > +	  some Intel Cherry Trail devices with USB TypeC connector.
> >  
> >  	  The INT33FE ACPI device has a CRS table with I2cSerialBusV2
> >  	  resources for 3 devices: Maxim MAX17047 Fuel Gauge Controller,
> > @@ -939,6 +939,22 @@ config INTEL_CHT_INT33FE
> >  	  If you enable this driver it is advised to also select
> >  	  CONFIG_TYPEC_FUSB302=m and CONFIG_BATTERY_MAX17042=m.
> >  
> > +config INTEL_CHT_INT33FE_MUSB
> > +	tristate "Intel Cherry Trail ACPI INT33FE Driver (mUSB connector)"
> 
> Please don't use the term MUSB, musb, mUSB or microUSB. A collogue of
> mine noticed this thread, and was a bit confused about the use of the
> those terms here, and to be honest, so was I. MUSB is USB controller
> from Mentor Graphics. This is the driver for it: drivers/usb/musb/
> 
> "micro-AB" and "uAB" are much more clear here. For the config option,
> how about simply INTEL_CHT_INT33FE_UAB
> 
> thanks,

Thanks for this point, you are right.

Actually the device handled by this driver may has mini- or micro- USB B or AB
connector. I have hardware with micro USB B, for instance. So, who can
propose better name? INTEL_CHT_INT33FE_SIMPLE? INTEL_CHT_INT33FE_TYPEB?
INTEL_CHT_INT33FE_AB? INTEL_CHT_INT33FE_NONTYPEC?

I like TYPEB.

-- 
Yauhen Kharuzhy
