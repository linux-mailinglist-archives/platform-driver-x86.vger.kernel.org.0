Return-Path: <platform-driver-x86+bounces-7017-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 999FE9C764E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2024 16:22:14 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 5A3C028561A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2024 15:22:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 683962010F4;
	Wed, 13 Nov 2024 15:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="A6V3WGXu"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8248813B29B
	for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 15:19:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731511198; cv=none; b=OS/F2tZxGKjQQf48i1H33r4BwAPjcw9J60Mzw+osHQi72cJ1d+vBreNqOsqdQ2rvljVptddAjEdepTkEqKS9YKge/fdE6GotI/FoFrbisezEpLxGIISs4zdC+PfwAuBbItsIExoOvM5Q8JAC07l+Du08singOCKl6VXlNXEYEfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731511198; c=relaxed/simple;
	bh=nOwVnwYrpicjCfmdQGy2Cdsyn9B6v7ynS9HUG9qeUQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=T7UcUCboXJkI+VGD+Sc8v9k7vdDjnlBndW4ZG+CbHWMNbW+eOYBEa3AKlWQSz+F5urGxjSRdOJKx9iVcBkBPfFM0UXSe1vqajwd0bdbErZ2uHJI2CCxyMCT3UGokpC0MhOD43cYbLNTTFsizsnzYYdSypp3rnj+0oYUSwVB8E5I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=A6V3WGXu; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731511195;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QCLG25hVok1lovn87TXiObw7KoI+wXBF1rK5GdDYyhY=;
	b=A6V3WGXuU6UilWuTKShO15HqRejSG2BbZC1GgxRPQHxycHrJ14kf2mYHAtIF1cHjjvhYTi
	xq99rSCwYyUF1UHFwksdjiPX3nrKK+X+3Pfb5kWtSng03MXGGi4fhC7Ib6jlGmsV8OthtC
	//DwafHQhk9ib4UAnQOojjJB8+ul8hI=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-678-fFmPaJ1nOeaAaNcaCZSVgA-1; Wed, 13 Nov 2024 10:19:52 -0500
X-MC-Unique: fFmPaJ1nOeaAaNcaCZSVgA-1
X-Mimecast-MFC-AGG-ID: fFmPaJ1nOeaAaNcaCZSVgA
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-a9a23eada74so567851166b.3
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2024 07:19:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731511191; x=1732115991;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QCLG25hVok1lovn87TXiObw7KoI+wXBF1rK5GdDYyhY=;
        b=rDLgLosAjTeExokB+iv8mjY//QFyz3fqitG8pWQTnWeF7lvm9ZnLrBNjCdADqn1cO4
         /Q14LR54sqgHTWjqvbyTYPqu2Hgd3Cez10zi3+OHs6052cD3pXO4mYTTx9H+t+Hm6ZLs
         bx41Ef3+nPWkVVYr7PA1buWjq3HvhTvGRuvkT/ddvndB9sCbUrve+1gegqmNC3N2UuPC
         9fWMkUIbBm+4BYkTzYHWvCnSHy1e/M5tvfo/EBa+JWvW2at+r7x2A/yB8E3C21IYo9rQ
         LgU6pGfJhR/eDKORMk3TWpk1z8/hpeimnTswuuiua6fjlF/GHpsNSUYRzlYB56vDpY1m
         LtoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ/QnLzTzrMgZNI7MIRTR1r+f53gQH0e9EynS/fz4SVOwPZkyzYismjLrZS5lHLz/mRoQUmvNTJgpuX3vZN5lNhC0m@vger.kernel.org
X-Gm-Message-State: AOJu0YxKK+U4JoygBoO2c51IWMGC4vyca+RWjB/qsW4w3LobgT2o+U5r
	P9swlAG46epU8M7OBQ6M3XvbqnUXIlLgY8qrTSPpvHGPXH5eDv7DpHCA1gOb9m2+gO+BCjaMWKv
	f3zWkQ5DK8LI1QyO4UtfpkM/WbkI975K2qxwDKFLSFAZil9lZl67T/SjViabmyaPqRVC+1a4=
X-Received: by 2002:a17:907:3f05:b0:a9a:3ca0:d55a with SMTP id a640c23a62f3a-aa1f813b95emr302625766b.57.1731511190894;
        Wed, 13 Nov 2024 07:19:50 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHCA8xGVsXqnwS+V6c7SWD1KQMyojgkD0HJzAgpjbB89nJ3EyiQD4J33kp9UV7YKU5DWZlJRg==
X-Received: by 2002:a17:907:3f05:b0:a9a:3ca0:d55a with SMTP id a640c23a62f3a-aa1f813b95emr302623466b.57.1731511190506;
        Wed, 13 Nov 2024 07:19:50 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9ee0deebabsm869231066b.153.2024.11.13.07.19.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 Nov 2024 07:19:49 -0800 (PST)
Message-ID: <8c9cedd4-953b-4b5e-8c08-7aab3259d4f4@redhat.com>
Date: Wed, 13 Nov 2024 16:19:48 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/6] media: uvcvideo: Implement the Privacy GPIO as a
 subdevice
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, Yunke Cao <yunkec@chromium.org>,
 Hans Verkuil <hverkuil@xs4all.nl>,
 "platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
References: <20241108-uvc-subdev-v2-0-85d8a051a3d3@chromium.org>
 <a644fed4-aff5-4514-8e35-d6cab642d3dd@redhat.com>
 <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Content-Language: en-US, nl
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CANiDSCtecYwfzSGDOHAtkdSrDb5WjtxAQMikH=tLPqngGXbBkw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Ricardo,

On 12-Nov-24 6:31 PM, Ricardo Ribalda wrote:
> Hi Hans
> 
> On Mon, 11 Nov 2024 at 13:59, Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi Ricardo, Et al.,
>>
>> On 8-Nov-24 9:25 PM, Ricardo Ribalda wrote:
>>> Some notebooks have a button to disable the camera (not to be mistaken
>>> with the mechanical cover). This is a standard GPIO linked to the
>>> camera via the ACPI table.
>>>
>>> 4 years ago we added support for this button in UVC via the Privacy control.
>>> This has two issues:
>>> - If the camera has its own privacy control, it will be masked
>>> - We need to power-up the camera to read the privacy control gpio.
>>
>> Thinking more about this I think we need to start with looking at the userspace
>> API for privacy controls, define how we want that to look and then go from
>> there.
>>
>> The reason I'm writing this is because due to my work in drivers/platform/x86
>> (pdx86) on EC / ACPI / WMI drivers for non chromebooks I am aware of at least
>> 4 different methods camera on/off (aka privacy) toggles are being reported
>> to userspace at the moment. Adding a v4l2-ctrl on a subdev instead of directly
>> on /dev/video# would be adding a 5th method which seems highly undesirable.
>>
>> Instead I would like to first focus on fixing these userspace API
>> inconsistencies agreeing on a single API we want to use everywhere
>> going forward. We don't need to fix all drivers at once, but IMHO we
>> should agree on what the API should look like and document that and
>> any future drivers implementing camera privacy control related code
>> then must use the new API.
>>
>> Lets start with the 3 APIs I'm currently aware of:
>>
>> 1. uvcvideo driver exporting V4L2_CID_PRIVACY on /dev/video#
>> uvcvideo seems to be the only user of this CID (i)
>>
>> 2. pdx86 drivers exporting an input evdev with EV_SW,
>> SW_CAMERA_LENS_COVER. This is somewhat of a special case
>> for some Dell laptops with an electro-mechanical shutter
>> operated by the EC. But this is not also used by
>> hp-wmi.c where it does not necessarily indicate the
>> status of a mechanical cover, but also possibly simply
>> disconnecting the camera from the USB bus.
>>
>> 3. pdx86 drivers exporting an input evdev with EV_KEY,
>> KEY_CAMERA_ACCESS_ENABLE, KEY_CAMERA_ACCESS_DISABLE
>> These KEY codes are based on offical the HUTRR72 HID/HUT
>> extension and as such may also be send by USB/I2C/BT HID
>> devices.
>>
>> The only user outside of hid-input.c is the recently added
>> drivers/platform/x86/lenovo-wmi-camera.c driver and I'm
>> wondering if that should not use SW_CAMERA_LENS_COVER
>> instead. I'll ask the driver author about how this
>>
>> 4. pdx86 drivers exporting an input evdev with EV_KEY,
>> KEY_CAMERA. Note this 4th method lacks information on if
>> the camera was enabled or disabled. In many cases this
>> is send to indicate that the EC has either dropped
>> a UVC camera of the bus, or added it to the bus.
>> Ideally we would have some helper checking for internal
>> UVC camera presence and turn this into 2 or 3.
>>
>> TL;DR: it a mess.
>>
>> Circling back to this patch-set, note how 3 of the 4
>> currently in use variants today use in input evdev.
>>
>> I think that using an input evdev (shared with the
>> snapshot button if present) will give us a nice out for
>> the power-management issue with the V4L2_CID_PRIVACY,
>> while at the same time giving a nice opportunity to
>> standardize on a single userspace API.
>>
>> My proposal would be to standardize on SW_CAMERA_LENS_COVER
>> I realize that the GPIO does not always indicate a lens
>> cover, but the resulting black frames are the same result
>> as if there were a lens cover and looking at:
>>
>> https://support.hp.com/ie-en/document/ish_3960099-3335046-16
>>
>> and then the second picture when expanding "Locate and use
>> the webcam privacy switch" that does look like it may be
>> an actual cover which reports back its state through a GPIO.
>>
>> The reason why I'm not in favor of using
>> KEY_CAMERA_ACCESS_ENABLE + KEY_CAMERA_ACCESS_DISABLE is that
>> looking at the HUTRR72 it talks about:
>> "Enables programmatic access to camera device"
>> which suggests that it is a request to the OS / desktop-
>> environment to block camera access at the software level,
>> rather then reporting back that a hw-level block is in place.
>>
>> And since these may be used by any HID device we are not of
>> control in how these will be used.
>>
>> Ricardo, what do you think of instead of using a v4l-subdev,
>> using an input evdev (shared with the existing one) reporting
>> SW_CAMERA_LENS_COVER ?  The v4l-subdev approach will need
>> userspace changes anyways and if we are going to make userspace
>> changes we might as well use the best API available.
> 
> I just sent a patchset using SW_CAMERA_LENS_COVER

I'm glad that you like my proposal and thank you for immediately
implementing it and sending out a v3.

I was expecting us to first have a bit more discussion about
what the userspace API should look like and what we should do
wrt keeping / deprecating V4L2_CID_PRIVACY.

But I'm glad that you like the evdev SW_CAMERA_LENS_COVER idea,
at least I assume you like it since you went for it for v3 :)

I'll reply to your v3 cover-letter to discuss what we should do
wrt keeping / deprecating V4L2_CID_PRIVACY.

IMHO it would be good to hold of on sending out a v4 until we
have hashed out how we want this all to look userspace API wise,
otherwise you'll just spend a lot of time doing revisions
pursuing a moving target.

> I guess the internal uvc privacy (UVC_CT_PRIVACY_CONTROL) shall NOT be
> converted to evdev:
> - If we do so, we cannot differentiate external gpio and internal, for
> devices that have both
> - There is no warranty that we will get a uvc_event when the control
> changes, so we would have to constantly poll the device

These are good questions, lets also discuss this in a thread
with the v3 cover-letter as start to keep all discussion in one place.

Regards,

Hans





