Return-Path: <platform-driver-x86+bounces-9495-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id DAD6FA36590
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Feb 2025 19:16:40 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E0703A36F4
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Feb 2025 18:16:31 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0AB082690ED;
	Fri, 14 Feb 2025 18:16:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="Tm1JuBk/"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2B5618A6B8
	for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 18:16:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739556995; cv=none; b=c/Vn6A8h64FUwEWFDIbCesj2hYu7sK3tv9gywxIz8afHimjJxHGMPprQNxuBckdc+mT8aIVSTidwMEFPHi6RKkzNCkXT1Nh7Jty0597RjZNTYMhdTLrH43nPWDUzyRn52inpgPeLaP/qdZAIujl19fFmcSYX0oA0zPSpvzpHFF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739556995; c=relaxed/simple;
	bh=nDKtV9ySw4mozGGWlDjjCWMvxLbaCdy6txFVjPMX6KY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sK46PpVIBrKsd5hSh2wF+EoVL+OjSro1xVp4RxChyYOhK0Wmkyy3lZml3JskGSVVp2ZYbw11vrBqbiUP7rwkNMYFs8jVYkF13v8jfRQHqso0+xasZfLwiYybfSjVG2fhcy1X5WG5ct9tM7lIxPTUEC5Gw4sTOl93JQ8bOQg7Pl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=Tm1JuBk/; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4396a24118dso7884455e9.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Feb 2025 10:16:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739556992; x=1740161792; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpzQbnLdagNuUxuQR/6JxQR5FVOFTqBbuMpnc5Onjr8=;
        b=Tm1JuBk/vh8PRcm7UXbEwZLsNE55/+5jj7Kxme0JUz4YPZ5T5uR+wmr/7hzTNWdQUS
         sQRW2+3XsR2pqXkwp+cp060sIH4VxY81201GN+vmD0sg3EV48bdE6kkfa2tomXbmXtjq
         80srL3oyHO5RG4E5kHHcqa3CE1scr2KpoLg7TKvsNEEnhaYcXq0ZjrT2VSGSK/CWMJCo
         qA8FiU6e9uMA8EHw8fWLMGE6byH4mT7TKgwegVQrImMMaNzTTmjAa9KqZ6xpB+pLY//D
         onQQ0IaFdQx0zOIBraGqtdCfKMXNSVmmCU5XZOUCVP6nFzbziTm8M+mCpCZ9zjzUH7pu
         STsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739556992; x=1740161792;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpzQbnLdagNuUxuQR/6JxQR5FVOFTqBbuMpnc5Onjr8=;
        b=Ra29nS+EBS5OR0tG//lE7pM94RenTyPjlVGFXhOETaJwbuhBoUSbMY25FWWiNJ2NqI
         7JS4cS4tUA1jhpe5EWHJs/Nmew55efTHte3X+tLBM2nBYkIDYSi4jnu90H+aAu54ms08
         AUGswkiVvRw7P/gNXQaZNWmkwFYWohbjIUOuuoh+f0dSOwpcH216fdy1VYLH4ygeMekT
         VnVorT7fq7c1rKkkdP9MP/z7jz+Ce+sEriC+oPI6gGtEZ/YOHRt5XiBtVakgJHZSk6ee
         uLt4ianJa++jVsOjHlBlKywf8P6dY/xNqCASyP1AjGrs3l6hFysTcU5aGvi5usrqHTRl
         JNEQ==
X-Forwarded-Encrypted: i=1; AJvYcCW42VMZwOADVKDkmhsTblR6ZENFNoJiYmNtdmekuT3y2NKBxERxhcBNOfGigWwiIKwpSja4Lw/xSl3tQSk3syQh75FM@vger.kernel.org
X-Gm-Message-State: AOJu0YzmTnX6im+aSQOqzuav2dAbP8CHoatDNaVK0DVg3aKj5pBgfCoF
	NjKJ0WC48LWTAi4yOTQ7ZD5qcnpXQoHa/UF4grvrl2bVt7xPYFWeEHuNCY23ZsU=
X-Gm-Gg: ASbGncu3rZvf/neoCam6mZBuXGN+PqtCvkN56XQ8W8QHkuolNsu/6x+chKvkFWswjFv
	jZ50UdvdFibDKYxOoOIETv+9K8B7Gpzrj92OJp47N+zuM1dd1DNLBWRbqkGC5k2pqRK8OKOKGYO
	N1mixw7GqeTo1KHo7A4FSuWIzUyD3OgQ30CyK0lEr9/Z12O9BgHwLpZppI4iBOfE73Cd2wjlhdK
	n2qN+P5cS0WEwxYsv4WMXz394xUjmJEuL8lgr+W/LGF4ncrF97hLZ84ruj4K2gYWUlaJfrAfLxK
	zy5cXqpaaFVdHw==
X-Google-Smtp-Source: AGHT+IFBN3j/Zjv2CLSxpQNFmRLH07Um+mn6wIlqNWgyJFTqmPU8STnXQY2KZybJYPY9YWV6H4qloQ==
X-Received: by 2002:a05:6000:154c:b0:38f:2025:9c2b with SMTP id ffacd0b85a97d-38f20259e49mr13952599f8f.33.1739556991710;
        Fri, 14 Feb 2025 10:16:31 -0800 (PST)
Received: from localhost ([2a01:e0a:3c5:5fb1:7018:8c7:bdd4:3436])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-38f258cccd3sm5221627f8f.23.2025.02.14.10.16.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 10:16:31 -0800 (PST)
From: Jerome Brunet <jbrunet@baylibre.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Dave Ertman <david.m.ertman@intel.com>,  Ira Weiny
 <ira.weiny@intel.com>,  "Rafael J. Wysocki" <rafael@kernel.org>,  Stephen
 Boyd <sboyd@kernel.org>,  Arnd Bergmann <arnd@arndb.de>,  Danilo Krummrich
 <dakr@kernel.org>,  Conor Dooley <conor.dooley@microchip.com>,  Daire
 McNamara <daire.mcnamara@microchip.com>,  Philipp Zabel
 <p.zabel@pengutronix.de>,  Douglas Anderson <dianders@chromium.org>,
  Andrzej Hajda <andrzej.hajda@intel.com>,  Neil Armstrong
 <neil.armstrong@linaro.org>,  Robert Foss <rfoss@kernel.org>,  Laurent
 Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
 <jonas@kwiboo.se>,  Jernej Skrabec <jernej.skrabec@gmail.com>,  Maarten
 Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
 <mripard@kernel.org>,  Thomas Zimmermann <tzimmermann@suse.de>,  David
 Airlie <airlied@gmail.com>,  Simona Vetter <simona@ffwll.ch>,  Hans de
 Goede <hdegoede@redhat.com>,  Ilpo =?utf-8?Q?J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,  Bryan O'Donoghue
 <bryan.odonoghue@linaro.org>,  Vladimir Kondratiev
 <vladimir.kondratiev@mobileye.com>,  Gregory CLEMENT
 <gregory.clement@bootlin.com>,  =?utf-8?Q?Th=C3=A9o?= Lebrun
 <theo.lebrun@bootlin.com>,
  Michael Turquette <mturquette@baylibre.com>,  Abel Vesa
 <abelvesa@kernel.org>,  Peng Fan <peng.fan@nxp.com>,  Shawn Guo
 <shawnguo@kernel.org>,  Sascha Hauer <s.hauer@pengutronix.de>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Fabio Estevam
 <festevam@gmail.com>,  Kevin Hilman <khilman@baylibre.com>,  Martin
 Blumenstingl <martin.blumenstingl@googlemail.com>,
  linux-kernel@vger.kernel.org,  linux-riscv@lists.infradead.org,
  dri-devel@lists.freedesktop.org,  platform-driver-x86@vger.kernel.org,
  linux-mips@vger.kernel.org,  linux-clk@vger.kernel.org,
  imx@lists.linux.dev,  linux-arm-kernel@lists.infradead.org,
  linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/7] driver core: auxiliary bus: add device creation
 helpers
In-Reply-To: <2025021437-washout-stonewall-d13e@gregkh> (Greg Kroah-Hartman's
	message of "Fri, 14 Feb 2025 17:33:35 +0100")
References: <20250211-aux-device-create-helper-v3-0-7edb50524909@baylibre.com>
	<20250211-aux-device-create-helper-v3-1-7edb50524909@baylibre.com>
	<2025021437-washout-stonewall-d13e@gregkh>
User-Agent: mu4e 1.12.8; emacs 29.4
Date: Fri, 14 Feb 2025 19:16:30 +0100
Message-ID: <1jwmdsxugx.fsf@starbuckisacylon.baylibre.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Fri 14 Feb 2025 at 17:33, Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> On Tue, Feb 11, 2025 at 06:27:58PM +0100, Jerome Brunet wrote:
>> Add helper functions to create a device on the auxiliary bus.
>> 
>> This is meant for fairly simple usage of the auxiliary bus, to avoid having
>> the same code repeated in the different drivers.
>> 
>> Suggested-by: Stephen Boyd <sboyd@kernel.org>
>> Cc: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
>> ---
>>  drivers/base/auxiliary.c      | 88 +++++++++++++++++++++++++++++++++++++++++++
>>  include/linux/auxiliary_bus.h | 10 +++++
>>  2 files changed, 98 insertions(+)
>
> I like the idea, see much the same of what I recently did for the "faux"
> bus here:
> 	https://lore.kernel.org/all/2025021023-sandstorm-precise-9f5d@gregkh/

Reading this, I'm getting the feeling that some (most?) simple auxiliary
driver might be better off migrating to "faux", instead of what I'm
proposing here ? Is this what you are suggesting ?

Few Q:
Is there some sort of 'platform_data' (sorry for the lack of a better
term, no provocation intended ;) ) ... it there a
simple way to pass an arbitrary struct to the created device with 'faux' ?

The difference between aux and faux I'm seeing it that aux seems to
decouple things a bit more. The only thing aux needs is a module name to
pop something up, while faux needs a reference to the ops instead.

I can see the appeal to use aux for maintainers trying to decouple
different subsystems.

>
> Some review comments:
>
>> diff --git a/drivers/base/auxiliary.c b/drivers/base/auxiliary.c
>> index afa4df4c5a3f371b91d8dd8c4325495d32ad1291..0f697c9c243dc9a50498a52362806db594345faf 100644
>> --- a/drivers/base/auxiliary.c
>> +++ b/drivers/base/auxiliary.c
>> @@ -385,6 +385,94 @@ void auxiliary_driver_unregister(struct auxiliary_driver *auxdrv)
>>  }
>>  EXPORT_SYMBOL_GPL(auxiliary_driver_unregister);
>>  
>> +static void auxiliary_device_release(struct device *dev)
>> +{
>> +	struct auxiliary_device *auxdev = to_auxiliary_dev(dev);
>> +
>> +	kfree(auxdev);
>> +}
>> +
>> +static struct auxiliary_device *auxiliary_device_create(struct device *dev,
>> +							const char *modname,
>> +							const char *devname,
>> +							void *platform_data,
>
> Can you have the caller set the platform_data if they need/want it after
> the device is created?  Or do you need that in the probe callback?

My assumption was that it is needed in probe, but I guess that entirely
depends on the driver. If that was ever needed, it could be added later
I think.

>
> And can't this be a global function too for those that don't want to
> deal with devm stuff?

There was a note about that in the cover-letter of the v1 but I did not
repeat it after.

It can be exported but I had no use for it so I thought It was better not
export it until it was actually needed. I really do not have a strong
preference over this.

>
>> +							int id)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = kzalloc(sizeof(*auxdev), GFP_KERNEL);
>> +	if (!auxdev)
>> +		return ERR_PTR(-ENOMEM);
>
> Ick, who cares what the error value really is?  Why not just do NULL or
> a valid pointer?  That makes the caller much simpler to handle, right?
>

Sure why not

>> +
>> +	auxdev->id = id;
>> +	auxdev->name = devname;
>> +	auxdev->dev.parent = dev;
>> +	auxdev->dev.platform_data = platform_data;
>> +	auxdev->dev.release = auxiliary_device_release;
>> +	device_set_of_node_from_dev(&auxdev->dev, dev);
>> +
>> +	ret = auxiliary_device_init(auxdev);
>
> Only way this will fail is if you forgot to set parent or a valid name.
> So why not check for devname being non-NULL above this?

If auxiliary_device_init() ever changes it would be easy to forget to
update that and lead to something nasty to debug, don't you think ?

If you are OK with this, I could update in this direction.

>
>> +	if (ret) {
>> +		kfree(auxdev);
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	ret = __auxiliary_device_add(auxdev, modname);
>> +	if (ret) {
>> +		/*
>> +		 * NOTE: It may look odd but auxdev should not be freed
>> +		 * here. auxiliary_device_uninit() calls device_put()
>> +		 * which call the device release function, freeing auxdev.
>> +		 */
>> +		auxiliary_device_uninit(auxdev);
>
> Yes it is odd, are you SURE you should be calling device_del() on the
> device if this fails?  auxiliary_device_uninit(), makes sense so why not
> just call that here?

I'm confused ... I am call auxiliary_device_uninit() here. What do you
mean ? 

>
>> +		return ERR_PTR(ret);
>> +	}
>> +
>> +	return auxdev;
>> +}
>> +
>> +static void auxiliary_device_destroy(void *_auxdev)
>> +{
>> +	struct auxiliary_device *auxdev = _auxdev;
>> +
>> +	auxiliary_device_delete(auxdev);
>> +	auxiliary_device_uninit(auxdev);
>> +}
>> +
>> +/**
>> + * __devm_auxiliary_device_create - create a device on the auxiliary bus
>> + * @dev: parent device
>> + * @modname: module name used to create the auxiliary driver name.
>> + * @devname: auxiliary bus device name
>> + * @platform_data: auxiliary bus device platform data
>> + * @id: auxiliary bus device id
>> + *
>> + * Device managed helper to create an auxiliary bus device.
>> + * The device create matches driver 'modname.devname' on the auxiliary bus.
>> + */
>> +struct auxiliary_device *__devm_auxiliary_device_create(struct device *dev,
>> +							const char *modname,
>> +							const char *devname,
>> +							void *platform_data,
>> +							int id)
>> +{
>> +	struct auxiliary_device *auxdev;
>> +	int ret;
>> +
>> +	auxdev = auxiliary_device_create(dev, modname, devname, platform_data, id);
>> +	if (IS_ERR(auxdev))
>> +		return auxdev;
>> +
>> +	ret = devm_add_action_or_reset(dev, auxiliary_device_destroy,
>> +				       auxdev);
>
> Oh this is going to be messy, but I trust that callers know what they
> are doing here.  Good luck!  :)
>
> thanks,
>
> greg k-h

-- 
Jerome

