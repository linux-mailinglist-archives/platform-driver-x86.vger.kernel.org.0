Return-Path: <platform-driver-x86+bounces-610-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 5853781D659
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Dec 2023 20:42:59 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 4A9A91C20F34
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Dec 2023 19:42:58 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 885061401A;
	Sat, 23 Dec 2023 19:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="LACP3wOM"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A573B171A8;
	Sat, 23 Dec 2023 19:42:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=a7IFwYC8DqiDgZNutNqU8AX8yHR5usJVmIl7qhvUK08=; b=LACP3wOMKTkVAP6RFOhIi1A8s8
	3RnE1lWYJM1+G2Ko/vs0OEGnDjSi8U8XKqWZwJmolOI9xa5fMCv3KIXBdFmPIDntqq1l3iX7Rf9d+
	ExAzW8tkaC+rY2rFZ8L1F4R2ii6ucxBHwflrzLnhhv+YeX6Ud6M0QRDYutgV7AVKc+fOoLCnvgMaS
	5iwblhPQdzX4h+/xgSTcjmS0+qpun+g+ayqSI69ACPWHDTCyo9P017Z+qqrudxmjJtCGdAcmnf9QC
	w+pt9jmoEDdjOs1Ft0MROU2fRW0vNtmk33Z4BNI8XDw+MLMilDmLtTHo22Fm1p7sNB05V1qAXt2Aq
	hdeDJXEA==;
Received: from [50.53.46.231] (helo=[192.168.254.15])
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rH7tb-008Oqr-1S;
	Sat, 23 Dec 2023 19:42:51 +0000
Message-ID: <24e63b37-0adb-4930-ada0-bfeeb35a7ea5@infradead.org>
Date: Sat, 23 Dec 2023 11:42:51 -0800
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] platform/x86: wmi: linux/wmi.h: fix Excess kernel-doc
 description warning
Content-Language: en-US
To: Armin Wolf <W_Armin@gmx.de>, linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <20231223050656.14068-1-rdunlap@infradead.org>
 <1dd56bfa-ce60-4037-bb1e-0d1676d4e8ce@gmx.de>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <1dd56bfa-ce60-4037-bb1e-0d1676d4e8ce@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Armin,

On 12/22/23 22:48, Armin Wolf wrote:
> Am 23.12.23 um 06:06 schrieb Randy Dunlap:
> 
>> Remove the "private:" comment to prevent the kernel-doc warning:
>>
>> include/linux/wmi.h:27: warning: Excess struct member 'setable' description in 'wmi_device'
>>
>> Either a struct member is documented (via kernel-doc) or it's private,
>> but not both.
> 
> Hi,
> 
> i am not encountering this kernel doc warning, but your argument is still valid. I also seem to
> have missed the fact that WMI drivers may want to know whether their WMI data block is setable
> during runtime when i added those kernel-doc comments.

The warning comes from 2 new patches in linux-next.

> Please add a Fixes: b4cc979588ee ("platform/x86: wmi: Add kernel doc comments") tag so that
> this patch can reach the stable kernels. With that addressed, you may also add:
> 
> Reviewed-by: Armin Wolf <W_Armin@gmx.de>

Thanks. patch v2 is on the way.

> Thanks,
> Armin Wolf
> 
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Armin Wolf <W_Armin@gmx.de>
>> Cc: Hans de Goede <hdegoede@redhat.com>
>> Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> ---
>>   include/linux/wmi.h |    2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff -- a/include/linux/wmi.h b/include/linux/wmi.h
>> --- a/include/linux/wmi.h
>> +++ b/include/linux/wmi.h
>> @@ -21,8 +21,6 @@
>>    */
>>   struct wmi_device {
>>       struct device dev;
>> -
>> -    /* private: used by the WMI driver core */
>>       bool setable;
>>   };
>>

-- 
#Randy
https://people.kernel.org/tglx/notes-about-netiquette
https://subspace.kernel.org/etiquette.html

