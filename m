Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C69A932D126
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Mar 2021 11:51:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239009AbhCDKuI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Mar 2021 05:50:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:27131 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238975AbhCDKtk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Mar 2021 05:49:40 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1614854894;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=B6YFP//f31XUXAGCyHNqBaMtd+sV6DZlf3TfC1scYTw=;
        b=g2swZLP2ofOmPTy8REy6vfb1dBKGFnVavkhA9R7NpPdMaKbNIwplh7tb7MVU47Gt9A8ioZ
        t05KwiU1SP2Gq+7BXfTHybxYj/gDv4YKl2geRmGsMrbVEYWQPaRMDz5aZttWZfXWVrz6Ow
        S+7727ZjMKp+XLyLvTIQkFdSpl/CJQ4=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-551-tCTFbx85MiiEhJ_VimvO8g-1; Thu, 04 Mar 2021 05:48:13 -0500
X-MC-Unique: tCTFbx85MiiEhJ_VimvO8g-1
Received: by mail-ed1-f71.google.com with SMTP id q1so13861785edv.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Mar 2021 02:48:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=B6YFP//f31XUXAGCyHNqBaMtd+sV6DZlf3TfC1scYTw=;
        b=TlkUZS4GLx/ezRoMJtUN9LoGPYMREVwSk/bdoChwh7U+xZwm/hfGqX1cLHxrbcEl6Y
         IaUpuG+I2Mq9SvQX4fMFY+Zi0vkOVXLs6q1X0R80Ij9CVrJ4TdQtsKxhOiYYIe16S4aZ
         o9kEjqbf/hS+gz3Ig70bRRAZd/X0FKJNSnnmmWWisKtSVLMt9CnXJZ9+4mxlv6owikKZ
         j0gKHnz2q7OVBG51AJKYa+Xa6DBwN0b2ZvBIWRV4z4lrFYyQV53gb9dlvRMBvwAfEunG
         kvKzM+nuZ0K+S0mdK0lT/ED63sIx1fZoU7ZVG1jId7jB9hRJqQVg/rObLE22iQ3awZwe
         ZJAw==
X-Gm-Message-State: AOAM531TBgRhuYqytdgnArH3hI5yDt4i0rnkWWY9ZsFEaQv7NC4taPD6
        pC0JzWRPNcGYc+mem9WevL4iYXWi8G5dp1osF1ikZy2bR7ThLVyuLEUWT0xFENdJmFarN44g8x5
        K2yVbtEjGhZ2KAPBjanUT2PLZpBv88NOuPA==
X-Received: by 2002:aa7:c496:: with SMTP id m22mr3598053edq.292.1614854891745;
        Thu, 04 Mar 2021 02:48:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxezb7pB5XlHZ6CyZYnrbToOO/ypyhlmgjbesVSBixK6tnwAXaBxvxFLnpit3OsWHLD8OipDg==
X-Received: by 2002:aa7:c496:: with SMTP id m22mr3598028edq.292.1614854891509;
        Thu, 04 Mar 2021 02:48:11 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id gq25sm9050653ejb.85.2021.03.04.02.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Mar 2021 02:48:10 -0800 (PST)
Subject: Flipping firmware write-protection bits from within the kernel (was
 Re: [PATCH RFC platform-next 8/8] Documentation/ABI: Add new line card
 attributes for mlxreg-io sysfs interfaces)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Vadim Pasternak <vadimp@nvidia.com>,
        Kees Cook <keescook@chromium.org>
Cc:     platform-driver-x86@vger.kernel.org,
        linux-security-module@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>
References: <20210203173622.5845-1-vadimp@nvidia.com>
 <20210203173622.5845-9-vadimp@nvidia.com>
 <009a1a80-62ca-35ce-5f02-b43b25e5ebd1@redhat.com>
Message-ID: <96f705e0-2d34-3c8e-3f13-8585dbbb74bf@redhat.com>
Date:   Thu, 4 Mar 2021 11:48:10 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <009a1a80-62ca-35ce-5f02-b43b25e5ebd1@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Kees, et al.,

Kees, you were the first person who came to mind to ask about this, feel free to
point me to someone else.

While reviewing a patch-set for hw-enablement of some upcoming Melanox platforms,
the addition of some sysfs files which flip write-protect bits for various firmwares
found on the platform on/off stood out to me.

As I mention in me reply to the below patch adding the docs for this at a minimum
this must (IMHO) tie into the new lockdown framework and disallow enabling
fw-updates this way depending on the lockdown mode.

Are there any other security checks which the code should/could do here ?

Maybe tie into the audit code somehow ?

Regards,

Hans




On 3/4/21 11:39 AM, Hans de Goede wrote:
> Hi,
> 
> On 2/3/21 6:36 PM, Vadim Pasternak wrote:
>> Add documentation for the new attributes for line cards:
>> - CPLDs versioning.
>> - Write protection control for 'nvram' devices.
>> - Line card reset reasons.
>> - Enabling burning of FPGA and CPLDs.
>> - Enabling burning of FPGA and gearbox SPI flashes,
>> - Enabling power of whole line card.
>> - Enabling power of QSFP ports equipped on line card.
>> - The maximum powered required for line card feeding.
>> - Line card configuration Id.
>>
>> Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
>> ---
>>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 92 +++++++++++++++++++++++++
>>  1 file changed, 92 insertions(+)
>>
>> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> index 1d1a8ee59534..a22e9d6c0904 100644
>> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
>> @@ -326,3 +326,95 @@ Description:	This file unlocks system after hardware or firmware thermal
>>  		locking.
>>  
>>  		The file is read/write.
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_pn
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld1_version_min
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files show with which CPLD major and minor versions
>> +		and part number has been burned CPLD device on line card.
>> +
>> +		The files are read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_pn
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga1_version_min
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files show with which FPGA major and minor versions
>> +		and part number has been burned FPGA device on line card.
>> +
>> +		The files are read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/ini_wp
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/vpd_wp
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files allow to overwrite line card VPD and firmware blob
>> +		hardware write protection mode. When attribute is set 1 - write
>> +		protection is disabled, when 0 - enabled. By default both are
>> +		write protected.
>> +
>> +		The files are read/write.
> 
> This seems to have some serious security implications. IMHO this should be tie into the
> kernel's new(ish) lockdown system, so that if the system is in locked-down mode writing
> these will not be allowed.
> 
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_aux_pwr_or_ref
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_dc_dc_pwr_fail
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_fpga_not_done
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_from_chassis
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_line_card
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/reset_pwr_off_from_chassis
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files show the line reset cause, as following: power
>> +		auxiliary outage or power refresh, DC-to-DC power failure, FPGA reset
>> +		failed, line card reset failed, power off from chassis.
>> +		Value 1 in file means this is reset cause, 0 - otherwise. Only one of
>> +		the above causes could be 1 at the same time, representing only last
>> +		reset cause.
>> +
>> +		The files are read only.
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/cpld_upgrade_en
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_upgrade_en
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files allow CPLD and FPGA burning. Value 1 in file means burning
>> +		is enabled, 0 - otherwise.
>> +
>> +		The files are read/write.
> 
> Same remark as above.
> 
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/qsfp_pwr_en
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/pwr_en
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files allow to power on/off all QSFP ports and whole line card.
>> +		The attributes are set 1 for power on, 0 - for power off.
>> +
>> +		The files are read/write.
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/agb_spi_burn_en
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/fpga_spi_burn_en
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files allow gearboxes and FPGA SPI flash burning.
>> +		The attributes are set 1 to enable burning, 0 - to disable.
>> +
>> +		The file is read/write.
> 
> Same remark as above.
> 
>> +
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/max_power
>> +What:		/sys/devices/platform/mlxplat/i2c_mlxcpld.*/i2c-*/i2c-*/i2c-*/*-0032/mlxreg-io.*/hwmon/hwmon*/config
>> +Date:		March 2021
>> +KernelVersion:	5.12
>> +Contact:	Vadim Pasternak <vadimp@nvidia.com>
>> +Description:	These files provide the maximum powered required for line card
>> +		feeding and line card configuration Id.
>> +
>> +		The files are read only.
>>
> 
> Regards,
> 
> Hans
> 

