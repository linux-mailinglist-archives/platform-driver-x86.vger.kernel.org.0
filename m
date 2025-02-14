Return-Path: <platform-driver-x86+bounces-9488-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id F3C9CA3632F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Feb 2025 17:34:25 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 4E9FD7A6EBE
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Feb 2025 16:32:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A9CAD264A81;
	Fri, 14 Feb 2025 16:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="tT6SgSHn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE4026738A;
	Fri, 14 Feb 2025 16:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739550819; cv=none; b=DVJZgrjnsk3AU8tWSYOyEkbZuw2JrECY7NcLQQMqx0DzNJeD8gg9IxGP8BbNcd+7j//bMpWpWUsdgIn0XTWksHZ1pMLpt5chF8KB77LJEd2YFAVC9TCspxSTylr0BTmtKeKhtXw/cB6h3857ib3h+nvWzEgIDFbFmNdK/SwPAVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739550819; c=relaxed/simple;
	bh=CqVOqHb3hkAOpfkdQ0WY8NjkmJA6LRQqJbjC+25kotw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fDisVMnqvZFUny+5jJcu15084ANjZ3NlWDPaf0LUH0ZizvZY1qxbe5Q8sC8QuUhLK5tpbXD+Y7QMESQnFgLZ85zkvz2GKihJooVFBTMyxfgBk52rSl8z9O6kOiB3xPEdd6Et4Yz+3ZtQEc4cUalXcgCe62kFFWFgnYhQ2fDKWHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=tT6SgSHn; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 437E2C4CED1;
	Fri, 14 Feb 2025 16:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739550818;
	bh=CqVOqHb3hkAOpfkdQ0WY8NjkmJA6LRQqJbjC+25kotw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tT6SgSHnecSbLt2hHIvRD2w8P7Qen0E4uemod9P4Uzf/Rf5MujWLyRERt+PlyeEkj
	 NFpQcVDgRI6COuLtv5omgBbkMykWng24oFznZCXdmpZhbuPh+fcv6yxx0/C/tXRtSA
	 LgXjhckBG761hA8IWNDwD4WIQgMYa1b67sdvhg5E=
Date: Fri, 14 Feb 2025 17:33:35 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Douglas Anderson <dianders@chromium.org>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	=?iso-8859-1?Q?Th=E9o?= Lebrun <theo.lebrun@bootlin.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	platform-driver-x86@vger.kernel.org, linux-mips@vger.kernel.org,
	linux-clk@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
Message-ID: <2025021437-washout-stonewall-d13e@gregkh>
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
 <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>

On Tue, Feb 11, 2025 at 06:27:58PM +0100, Jerome Brunet wrote:
> Add helper functions to create a device on the auxiliary bus.
> 
> This is meant for fairly simple usage of the auxiliary bus, to avoid having
> the same code repeated in the different drivers.
> 
> Suggested-by: Stephen Boyd <sboyd@kernel.org>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
> ---
>  drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
>  include/linux/auxiliary_bus.h | 10 +++++
>  2 files changed, 98 insertions(+)

I like the idea, see much the same of what I recently did for the "faux"
bus here:
	https://lore.kernel.org/all/2025021023-sandstorm-precise-9f5d@gregkh/

Some review comments:

> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
> --- a/drivers/base/auxiliary.c
> +++ b/drivers/base/auxiliary.c
> @@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>  }
>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>  
> +static void auxiliary_device_release(struct device *dev)
> +{
> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
> +
> +	kfree(auxdev);
> +}
> +
> +static struct auxiliary_device *auxiliary_device_create(struct device *dev,
> +							const char *modname,
> +							const char *devname,
> +							void *platform_data,

Can you have the caller set the platform_data if they need/want it after
the device is created?  Or do you need that in the probe callback?

And can't this be a global function too for those that don't want to
deal with devm stuff?

> +							int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
> +	if (!auxdev)
> +		return ERR_PTR(-ENOMEM);

Ick, who cares what the error value really is?  Why not just do NULL or
a valid pointer?  That makes the caller much simpler to handle, right?

> +
> +	auxdev->id = id;
> +	auxdev->name = devname;
> +	auxdev->dev.parent = dev;
> +	auxdev->dev.platform_data = platform_data;
> +	auxdev->dev.release = auxiliary_device_release;
> +	device_set_of_node_from_dev(&auxdev->dev, dev);
> +
> +	ret = auxiliary_device_init(auxdev);

Only way this will fail is if you forgot to set parent or a valid name.
So why not check for devname being non-NULL above this?

> +	if (ret) {
> +		kfree(auxdev);
> +		return ERR_PTR(ret);
> +	}
> +
> +	ret = __auxiliary_device_add(auxdev, modname);
> +	if (ret) {
> +		/*
> +		 * NOTE: It may look odd but auxdev should not be freed
> +		 * here. auxiliary_device_uninit() calls device_put()
> +		 * which call the device release function, freeing auxdev.
> +		 */
> +		auxiliary_device_uninit(auxdev);

Yes it is odd, are you SURE you should be calling device_del() on the
device if this fails?  auxiliary_device_uninit(), makes sense so why not
just call that here?

> +		return ERR_PTR(ret);
> +	}
> +
> +	return auxdev;
> +}
> +
> +static void auxiliary_device_destroy(void *_auxdev)
> +{
> +	struct auxiliary_device *auxdev = _auxdev;
> +
> +	auxiliary_device_delete(auxdev);
> +	auxiliary_device_uninit(auxdev);
> +}
> +
> +/**
> + * __devm_auxiliary_device_create - create a device on the auxiliary bus
> + * @dev: parent device
> + * @modname: module name used to create the auxiliary driver name.
> + * @devname: auxiliary bus device name
> + * @platform_data: auxiliary bus device platform data
> + * @id: auxiliary bus device id
> + *
> + * Device managed helper to create an auxiliary bus device.
> + * The device create matches driver 'modname.devname' on the auxiliary bus.
> + */
> +struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
> +							const char *modname,
> +							const char *devname,
> +							void *platform_data,
> +							int id)
> +{
> +	struct auxiliary_device *auxdev;
> +	int ret;
> +
> +	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
> +	if (IS_ERR(auxdev))
> +		return auxdev;
> +
> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
> +				       auxdev);

Oh this is going to be messy, but I trust that callers know what they
are doing here.  Good luck!  :)

thanks,

greg k-h

