Return-Path: <platform-driver-x86+bounces-4527-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F5193F383
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2024 13:04:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 78186B22E4E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 29 Jul 2024 11:04:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A30D14535A;
	Mon, 29 Jul 2024 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bx/cyKZB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B2A1448D3
	for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 11:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722251037; cv=none; b=G2JMo5cEM+tRdQUvbMmk7kyzaD9cOAru02g6uEfE6RFnd8bD13EsGQQXG31Q1DaF+8XemSbiMvABqrOOm3lrOir6b1bBb/xaIfXwMEZB+aASy4zaK1/BFZEWJoQqP06fNsdgzJ+0cUIf7wDayuF7JI75DHUlRWA31Iof2xbO3Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722251037; c=relaxed/simple;
	bh=zJqgfzerxCxnJG4FqmGJw2xd1wgRmc3UxOf8LYT91sU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UinxekboxZj1jog9IBkXYFWFtVWLjm+XnxT2lvi4McFpOMai1jccc7Kgy+TdU0zmeVpPtxAByZ9kktxlMDgN+ie8Uq4tGc91CDheIAHcSQ+U2GZysXVarGS4EYCNhGIcMH9UWloLqWO4TnG4J/by5G7oqMzwLSvY+BcpbvTep+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bx/cyKZB; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1722251034;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZVaVQKI8NcPD9cu89SoPrCy8KmYHM7i6u29K02/jUSg=;
	b=bx/cyKZBSqMloXQFM0a8CCR/Owa2A3T8VRj7o1tZJWDx5x01ddFRVxBmEFw6Ti1EbM3I7U
	QQUqeq/FSWRTbBCzBiXkMnyj7hwAvZhLKdoD6568Gq7MxaiDVL75TWpWF05AcpgOWbSZln
	Ce6u6FWwr8Sj9KcO2g6j1+IpEkES+M0=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-686-bI9WDksaM9qQNIUJsomfwA-1; Mon, 29 Jul 2024 07:03:53 -0400
X-MC-Unique: bI9WDksaM9qQNIUJsomfwA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4280c0b3017so18062935e9.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 29 Jul 2024 04:03:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722251032; x=1722855832;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVaVQKI8NcPD9cu89SoPrCy8KmYHM7i6u29K02/jUSg=;
        b=uCHweVe6x4/8rA2Ah94VJgUr6uknTCXXi+p/p+HU27RHeY5KI+GsvbctY9rScucyV4
         hgXOYmcx3RtJztLty7buXLz10RNC6RPwjeK0giCTEvzxe64ySkFjWM97WcfVmjpjuREU
         CaPmVGYe7x5eONZLbynhjvcWUJ6+0OdsDQ8TGEEBTG0hhdikSlmK9dXHHE93+6IPKkE5
         poA8jFY44E0QtfHJwCAMMOnhusBMhjs/kObJBIYikfV5mqoARFl+/G9VbNnTWfqosfeD
         FbLcdQqi6QwnN31SmvfaoYsfY+PVnHbaptN+THhxf0q/JKIlfD2IsQnMoCHXyxMSLoR/
         0lHQ==
X-Forwarded-Encrypted: i=1; AJvYcCV5c9WnCIq2pEji2mWHXiw++iOL8y59XEQRT5htPFh3GAyZ7aXA49tgnaspAmb/czs0CX65wZHxNtIHD4UgWFh4wUmvaAlv8k0Qw8DYWqdVphZLxw==
X-Gm-Message-State: AOJu0YzoJpFMbxZSKcF4zF5vnJkFwDmxf2y4kz15EVXuzJ/YANTKbxDj
	bUzlMpwoF+UU5fDg0KmWuC/lgw3KhQHuXCxolQv6cb1vIWohCL9vyEjNs5gLQuML6AT0MLuqeIL
	+8KJGFPaOqxCR2T8G8MrpbhYy3wLAR/SKHT2XQsJmQcTNToM3RqB32rb3tQvgAUHkFQmDl3Pr3/
	E9sA8=
X-Received: by 2002:a05:600c:4748:b0:428:1799:35e3 with SMTP id 5b1f17b1804b1-4281799370amr36752185e9.21.1722251031194;
        Mon, 29 Jul 2024 04:03:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFOITW6hJJyWfjFT+xRek5d5U5YKsX7IWyrsp+wKXGs6K2eT2UeptRyG0oHzNIm9NtwldRAww==
X-Received: by 2002:a05:600c:4748:b0:428:1799:35e3 with SMTP id 5b1f17b1804b1-4281799370amr36751885e9.21.1722251030534;
        Mon, 29 Jul 2024 04:03:50 -0700 (PDT)
Received: from [172.18.228.53] (ip-185-104-138-47.ptr.icomera.net. [185.104.138.47])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-428057a635csm174058195e9.30.2024.07.29.04.03.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jul 2024 04:03:50 -0700 (PDT)
Message-ID: <568f1cc9-eb79-46a7-8251-46b1d55dbf23@redhat.com>
Date: Mon, 29 Jul 2024 13:03:46 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: intel-vbtn: Support for tablet mode on Dell
 Venue 11 Pro 7140
To: Kostadin Stoilov <kmstoilov@gmail.com>
Cc: En-Wei Wu <en-wei.wu@canonical.com>, acelan.kao@canonical.com,
 ilpo.jarvinen@linux.intel.com, platform-driver-x86@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20240722083658.54518-1-en-wei.wu@canonical.com>
 <7b7b4d84-c4b0-4a37-ab1d-4b1266851b32@redhat.com>
 <CA++f7SgSv9xr9BGP5Y537bkVduKL1pHgYwZ63Cr4MwW_erhQJw@mail.gmail.com>
Content-Language: en-US
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CA++f7SgSv9xr9BGP5Y537bkVduKL1pHgYwZ63Cr4MwW_erhQJw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Kostadin,

On 7/25/24 8:26 PM, Kostadin Stoilov wrote:
> Hi Hans,
> 
> I tested a kernel built by En-Wei with your patch and I can confirm that it resolves the issue. I tried several connect/disconnect suspend/resume cycles.
> 
> The kernel bug messages are not observed and the system suspend/resumes/powers off successfully.
> 
> The dmesg log from the test run can be found here:
> https://launchpadlibrarian.net/740661223/6.10-maintainer-dmesg.txt <https://launchpadlibrarian.net/740661223/6.10-maintainer-dmesg.txt>

Thank you for testing. I've now done an official submission of this patch upstream:

https://lore.kernel.org/platform-driver-x86/20240729110030.8016-1-hdegoede@redhat.com/

This should be included in a fixes pull-req for 6.11 soon-ish and then get backported to various
stable kernel series.

Regards.

Hans


> On Mon, 22 Jul 2024 at 12:45, Hans de Goede <hdegoede@redhat.com <mailto:hdegoede@redhat.com>> wrote:
> 
>     Hi En-Wei,
> 
>     On 7/22/24 10:36 AM, En-Wei Wu wrote:
>     > On a Dell Venue 7140 tablet with the keyboard/touchpad/battery dock, when
>     > disconnecting the dock there is a kernel bug:
>     >
>     > BUG: kernel NULL pointer dereference, address: 0000000000000018
>     >
>     > And this causes the following things not to work:
>     > 1. Suspend to idle - the system simply hangs
>     > 2. Poweroff normally (the only way is forcing it via long press the power button)
>     > 3. USB ports: both the USB port on the tablet and also plugging in the keyboard again
>     >
>     > The error message above (plus some crash dump) isn't so useful for debugging, but we
>     > have noticed that there is a debug message shown before the crash dump:
>     >
>     > intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving
>     > a switch event
>     >
>     > The messages above is shown right after the dock is disconnected, and the message implies:
>     >
>     > We failed to set the priv->has_switches to true in the probe function since the
>     > Dell Venue 11 Pro 7140 is not shown in the dmi_switches_allow_list, and this causes a problem
>     > that no input_register_device() on the switch device is called. Afterward, When a user
>     > disconnects the dock, intel-vbtn receives the ACPI event and finally find that there is a
>     > switch out there. So intel-vbtn starts to register the switch device, which may be a dangerous
>     > behavior since there might be some device-related objects/structs that has been freed (due to
>     > the disconnection of the dock).
>     >
>     > To solve this problem from the root cause, simply add the Dell Venue 11 pro 7140 to the
>     > dmi_switches_allow_list.
>     > (The Dell Venue 11 Pro 7140 is a 2-in-1 model that has chassis-type "Portable".)
>     >
>     > BugLink: https://bugs.launchpad.net/bugs/2073001 <https://bugs.launchpad.net/bugs/2073001>
>     >
>     > Fixes: 8169bd3e6e19 ("platform/x86: intel-vbtn: Switch to an allow-list
>     > for SW_TABLET_MODE reporting")
>     > Reported-by: Kostadin Stoilov <kmstoilov@gmail.com <mailto:kmstoilov@gmail.com>>
>     > Tested-by: Kostadin Stoilov <kmstoilov@gmail.com <mailto:kmstoilov@gmail.com>>
>     > Signed-off-by: En-Wei Wu <en-wei.wu@canonical.com <mailto:en-wei.wu@canonical.com>>
> 
>     Thank you for your patch. Looking at the logs from the launchpad bug I noticed that
> 
>     intel-vbtn INT33D6:00: Registering Intel Virtual Switches input-dev after receiving a switch event
> 
>     is reported in the logs twice. Which strongly suggests that the intel-vbtn notify_handler()
>     function is racing with itself.
> 
>     In the past ACPI notify handlers could never run more then once (at the same time)
>     but since commit e2ffcda16290 ("ACPI: OSL: Allow Notify () handlers to run on
>     all CPUs") ACPI notify handlers like the intel-vbtn notify_handler() may
>     run on multiple CPU cores racing with themselves.
> 
>     I believe that this is the real problem here. I have attached a patch which should
>     fix this. Can you build a test-kernel with this patch instead of your patch and
>     ask the reported of: https://bugs.launchpad.net/bugs/2073001 <https://bugs.launchpad.net/bugs/2073001>
> 
>     To test a kernel with the attached patch (and without your patch) to confirm
>     that this fixes it in a more generic manner ?
> 
>     Regards,
> 
>     Hans
> 
> 
> 
> 
> 
>     > ---
>     >  drivers/platform/x86/intel/vbtn.c | 6 ++++++
>     >  1 file changed, 6 insertions(+)
>     >
>     > diff --git a/drivers/platform/x86/intel/vbtn.c b/drivers/platform/x86/intel/vbtn.c
>     > index 9b7ce03ba085..46d07d3cd34b 100644
>     > --- a/drivers/platform/x86/intel/vbtn.c
>     > +++ b/drivers/platform/x86/intel/vbtn.c
>     > @@ -235,6 +235,12 @@ static const struct dmi_system_id dmi_switches_allow_list[] = {
>     >                       DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7130"),
>     >               },
>     >       },
>     > +     {
>     > +             .matches = {
>     > +                     DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
>     > +                     DMI_MATCH(DMI_PRODUCT_NAME, "Venue 11 Pro 7140"),
>     > +             },
>     > +     },
>     >       {
>     >               .matches = {
>     >                       DMI_MATCH(DMI_SYS_VENDOR, "Hewlett-Packard"),
> 


