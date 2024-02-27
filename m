Return-Path: <platform-driver-x86+bounces-1670-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 90B8686A2D4
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Feb 2024 23:53:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2FFFD1F2193C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Feb 2024 22:53:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id CC92155C08;
	Tue, 27 Feb 2024 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VLEw6F33"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E36E54664;
	Tue, 27 Feb 2024 22:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709074425; cv=none; b=QtmWq/gxvn/aBeCR3WWfRJgaWJxpFO078k40a6AnvuLuCa7+MG9w6gGW1+WVq0pHBAkUFenDMuwCNhS6ttu99vNaLASGrc+tj2dK1K77tcfaRNR0qqkMVXZKHoZDAcCntijLIZnLscym96zyMPTSeMtlaGA1MOBlitfLoVTK1go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709074425; c=relaxed/simple;
	bh=DMuZf3Z6sY7althpV6SNiCdHASJoLRAjXzLLI/6q/fM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CKvbE8n6wJ+SbhOY1ijNlV5NWQx1gl3JOQT9ArfbIOfSqRDgM60XpUaaWAaJ2s39e4zdp9re2nBy6Bm4laLb0iaIsDf3uoLTlpgTR0etvFrE3EouhSJgrRz0Q6erD6X1mzL0RDw2H1xg6WrVADDTTaYmYxj4G/B8deG7t3q3uWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VLEw6F33; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45F7C433C7;
	Tue, 27 Feb 2024 22:53:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709074425;
	bh=DMuZf3Z6sY7althpV6SNiCdHASJoLRAjXzLLI/6q/fM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VLEw6F33f9GFY5tJQj0wLbTyuKmJD1JQR3+cudCePUHGmbyouQLc2+hS3TvJPGzRc
	 tBAuRn7yvpKuGAYQQKxYJZm/0t+I+JUNtEvhNUxOS6TYVAa+UdmM3FDuW40bRyqE2k
	 tobjy+38ER3l3JltXp1x8NkNm3TvO8T5wOhJ2K9qMzusH5gpMTR4ytsYP8QwL5jUaW
	 J53p0cUWP+xZZwEfNOT93X/9qgWQOJERrJ3HPDqrEJs8E60Mlx4p1g1UBYFYm0l3IQ
	 FAgwGZ2vvFU/2xd6llo1nZ5LyY7qOxto2AV4cpKEnEincnxGOKGSaFLSvy9plNjylL
	 4aDTnSaSFt1BA==
Received: by pali.im (Postfix)
	id 1E156828; Tue, 27 Feb 2024 23:53:42 +0100 (CET)
Date: Tue, 27 Feb 2024 23:53:41 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: jithu.joseph@intel.com, linux@weissschuh.net, hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com, Dell.Client.Kernel@dell.com,
	jdelvare@suse.com, linux@roeck-us.net,
	platform-driver-x86@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] platform/x86: wmi: Do not instantiate older WMI
 drivers multiple times
Message-ID: <20240227225341.jqhkq7xmwprtgj7x@pali>
References: <20240226193557.2888-1-W_Armin@gmx.de>
 <20240226193557.2888-2-W_Armin@gmx.de>
 <20240227203058.eun4ylvhk4t7uogk@pali>
 <a8602a4a-39e1-46c3-9fe9-b6896c75fa73@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a8602a4a-39e1-46c3-9fe9-b6896c75fa73@gmx.de>
User-Agent: NeoMutt/20180716

On Tuesday 27 February 2024 23:47:11 Armin Wolf wrote:
> Am 27.02.24 um 21:30 schrieb Pali Rohár:
> 
> > On Monday 26 February 2024 20:35:56 Armin Wolf wrote:
> > > Many older WMI drivers cannot be instantiated multiple times for
> > > two reasons:
> > > 
> > > - they are using the legacy GUID-based WMI API
> > > - they are singletons (with global state)
> > > 
> > > Prevent such WMI drivers from binding to WMI devices with a duplicated
> > > GUID, as this would mean that the WMI driver will be instantiated at
> > > least two times (one for the original GUID and one for the duplicated
> > > GUID).
> > > WMI drivers which can be instantiated multiple times can signal this
> > > by setting a flag inside struct wmi_driver.
> > What do you think about opposite direction? Adding ".singleton = true"
> > into every driver which is not compatible with duplicated initialization
> > and having the default value that drivers are not singletons.
> > 
> > But if the direction it to not accept new "legacy" drivers and start get
> > rid of all "legacy" drivers by rewriting them, then it does not matter
> > if "no_singleton" or "is_singleton" is used...
> 
> Hi,
> 
> i want to make sure that i wont forget any legacy WMI drivers. This way, the
> older legacy WMI drivers automatically initialize no_singleton with false.
> 
> Also i intent to not accept new legacy WMI drivers.

Ok. In this case it does not matter.

> Thanks,
> Armin Wolf
> 
> > > Tested on a ASUS Prime B650-Plus.
> > > 
> > > Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> > > ---
> > >   drivers/hwmon/dell-smm-hwmon.c                 |  1 +
> > >   drivers/platform/x86/dell/dell-wmi-ddv.c       |  1 +
> > >   drivers/platform/x86/intel/wmi/sbl-fw-update.c |  1 +
> > >   drivers/platform/x86/intel/wmi/thunderbolt.c   |  1 +
> > >   drivers/platform/x86/wmi-bmof.c                |  1 +
> > >   drivers/platform/x86/wmi.c                     | 12 ++++++++++++
> > >   include/linux/wmi.h                            |  2 ++
> > >   7 files changed, 19 insertions(+)
> > > 
> > > diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> > > index 6d8c0f328b7b..168d669c4eca 100644
> > > --- a/drivers/hwmon/dell-smm-hwmon.c
> > > +++ b/drivers/hwmon/dell-smm-hwmon.c
> > > @@ -1587,6 +1587,7 @@ static struct wmi_driver dell_smm_wmi_driver = {
> > >   	},
> > >   	.id_table = dell_smm_wmi_id_table,
> > >   	.probe = dell_smm_wmi_probe,
> > > +	.no_singleton = true,
> > >   };
> > > 
> > >   /*
> > > diff --git a/drivers/platform/x86/dell/dell-wmi-ddv.c b/drivers/platform/x86/dell/dell-wmi-ddv.c
> > > index db1e9240dd02..0b2299f7a2de 100644
> > > --- a/drivers/platform/x86/dell/dell-wmi-ddv.c
> > > +++ b/drivers/platform/x86/dell/dell-wmi-ddv.c
> > > @@ -882,6 +882,7 @@ static struct wmi_driver dell_wmi_ddv_driver = {
> > >   	},
> > >   	.id_table = dell_wmi_ddv_id_table,
> > >   	.probe = dell_wmi_ddv_probe,
> > > +	.no_singleton = true,
> > >   };
> > >   module_wmi_driver(dell_wmi_ddv_driver);
> > > 
> > > diff --git a/drivers/platform/x86/intel/wmi/sbl-fw-update.c b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> > > index 040153ad67c1..75c82c08117f 100644
> > > --- a/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> > > +++ b/drivers/platform/x86/intel/wmi/sbl-fw-update.c
> > > @@ -131,6 +131,7 @@ static struct wmi_driver intel_wmi_sbl_fw_update_driver = {
> > >   	.probe = intel_wmi_sbl_fw_update_probe,
> > >   	.remove = intel_wmi_sbl_fw_update_remove,
> > >   	.id_table = intel_wmi_sbl_id_table,
> > > +	.no_singleton = true,
> > >   };
> > >   module_wmi_driver(intel_wmi_sbl_fw_update_driver);
> > > 
> > > diff --git a/drivers/platform/x86/intel/wmi/thunderbolt.c b/drivers/platform/x86/intel/wmi/thunderbolt.c
> > > index e2ad3f46f356..08df560a2c7a 100644
> > > --- a/drivers/platform/x86/intel/wmi/thunderbolt.c
> > > +++ b/drivers/platform/x86/intel/wmi/thunderbolt.c
> > > @@ -63,6 +63,7 @@ static struct wmi_driver intel_wmi_thunderbolt_driver = {
> > >   		.dev_groups = tbt_groups,
> > >   	},
> > >   	.id_table = intel_wmi_thunderbolt_id_table,
> > > +	.no_singleton = true,
> > >   };
> > > 
> > >   module_wmi_driver(intel_wmi_thunderbolt_driver);
> > > diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> > > index 644d2fd889c0..df6f0ae6e6c7 100644
> > > --- a/drivers/platform/x86/wmi-bmof.c
> > > +++ b/drivers/platform/x86/wmi-bmof.c
> > > @@ -94,6 +94,7 @@ static struct wmi_driver wmi_bmof_driver = {
> > >   	.probe = wmi_bmof_probe,
> > >   	.remove = wmi_bmof_remove,
> > >   	.id_table = wmi_bmof_id_table,
> > > +	.no_singleton = true,
> > >   };
> > > 
> > >   module_wmi_driver(wmi_bmof_driver);
> > > diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> > > index 29dfe52eb802..349deced87e8 100644
> > > --- a/drivers/platform/x86/wmi.c
> > > +++ b/drivers/platform/x86/wmi.c
> > > @@ -883,6 +883,18 @@ static int wmi_dev_probe(struct device *dev)
> > >   	struct wmi_driver *wdriver = drv_to_wdrv(dev->driver);
> > >   	int ret = 0;
> > > 
> > > +	/* Some older WMI drivers will break if instantiated multiple times,
> > > +	 * so they are blocked from probing WMI devices with a duplicated GUID.
> > > +	 *
> > > +	 * New WMI drivers should support being instantiated multiple times.
> > > +	 */
> > > +	if (test_bit(WMI_GUID_DUPLICATED, &wblock->flags) && !wdriver->no_singleton) {
> > > +		dev_warn(dev, "Legacy driver %s cannot be instantiated multiple times\n",
> > > +			 dev->driver->name);
> > > +
> > > +		return -ENODEV;
> > > +	}
> > > +
> > >   	if (wdriver->notify) {
> > >   		if (test_bit(WMI_NO_EVENT_DATA, &wblock->flags) && !wdriver->no_notify_data)
> > >   			return -ENODEV;
> > > diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> > > index 781958310bfb..63cca3b58d6d 100644
> > > --- a/include/linux/wmi.h
> > > +++ b/include/linux/wmi.h
> > > @@ -49,6 +49,7 @@ u8 wmidev_instance_count(struct wmi_device *wdev);
> > >    * @driver: Driver model structure
> > >    * @id_table: List of WMI GUIDs supported by this driver
> > >    * @no_notify_data: Driver supports WMI events which provide no event data
> > > + * @no_singleton: Driver can be instantiated multiple times
> > >    * @probe: Callback for device binding
> > >    * @remove: Callback for device unbinding
> > >    * @notify: Callback for receiving WMI events
> > > @@ -59,6 +60,7 @@ struct wmi_driver {
> > >   	struct device_driver driver;
> > >   	const struct wmi_device_id *id_table;
> > >   	bool no_notify_data;
> > > +	bool no_singleton;
> > > 
> > >   	int (*probe)(struct wmi_device *wdev, const void *context);
> > >   	void (*remove)(struct wmi_device *wdev);
> > > --
> > > 2.39.2
> > > 

