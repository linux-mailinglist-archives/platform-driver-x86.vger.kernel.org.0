Return-Path: <platform-driver-x86+bounces-9955-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A4A4FE40
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Mar 2025 13:08:03 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 065023A2690
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Mar 2025 12:07:48 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B168C242914;
	Wed,  5 Mar 2025 12:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b="gL6Gnt7j"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail.tuxedocomputers.com (mail.tuxedocomputers.com [157.90.84.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F7EF242915;
	Wed,  5 Mar 2025 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=157.90.84.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741176475; cv=none; b=QAAl8LsKrd7V2oqvjxigqzsGMjnwFkFOM58FXw2y576VEEG89QLvFHnxCqMDnp7Itr18VzhVh0YUUo6oOU2+zh2pkuaj7qylBbl0UUiRV/NCDgmZ3XwkeNScsVgMAXt7pFEznHcfmeE5XzZFD+gUNg8Av+HSoG3rIUGYC9aB3ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741176475; c=relaxed/simple;
	bh=6FEaf7zjzdjWRJ3Jtt3aqFoHPLccOPKr5rPW6vPIKUM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=eRbL8wIYtaTsI+t5QVSzcJMgpUR6k0UPUdoReN6cAEt+lRLIw5dI0oMbJzaY3QDLdUYViVVAh9UPd07HfS7ZrsGVl9QjwskhQ3kBdu7l/eC7TU/bTa3XlKPiqzfor+/FiOXNKBFK+xtY5WDICHCHHGxeQMjfzi4kDS040gR34kQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com; spf=pass smtp.mailfrom=tuxedocomputers.com; dkim=pass (1024-bit key) header.d=tuxedocomputers.com header.i=@tuxedocomputers.com header.b=gL6Gnt7j; arc=none smtp.client-ip=157.90.84.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tuxedocomputers.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tuxedocomputers.com
Received: from [192.168.42.116] (pd9e59f4f.dip0.t-ipconnect.de [217.229.159.79])
	(Authenticated sender: wse@tuxedocomputers.com)
	by mail.tuxedocomputers.com (Postfix) with ESMTPSA id 3F0812FC0048;
	Wed,  5 Mar 2025 13:07:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tuxedocomputers.com;
	s=default; t=1741176470;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gq+81eYaaZA8Pp2R8xe/a2kpnJQKj2KB6KRYNCbrF04=;
	b=gL6Gnt7jzPCTfADBqpoEyp2NwaO8x2iDgLc9wqU8+oshtJgHb3F93k6kxRIQCMILNy83WZ
	RhwwYx/CpQV93qu+XKNqznGmp2Ufp6oHdXf5OEX/VPVeQaQdR8EC4ZX8aT1TtX9vbHGlbn
	YicDnZk4bL7xvcy+7RKdfY2SQp0g5wI=
Authentication-Results: mail.tuxedocomputers.com;
	auth=pass smtp.auth=wse@tuxedocomputers.com smtp.mailfrom=wse@tuxedocomputers.com
Message-ID: <48af1eba-aff1-4052-84f7-6caed69e954b@tuxedocomputers.com>
Date: Wed, 5 Mar 2025 13:07:50 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] Input: atkbd - Fix TUXEDO NB02 notebook keyboards
 FN-keys
To: Armin Wolf <W_Armin@gmx.de>, mario.limonciello@amd.com,
 Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: dmitry.torokhov@gmail.com, linux-kernel@vger.kernel.org,
 platform-driver-x86@vger.kernel.org
References: <20250303190442.551961-1-wse@tuxedocomputers.com>
 <20250303190442.551961-2-wse@tuxedocomputers.com>
 <8b20fef7-d57c-4bd8-9d0e-1dda9a7391f7@gmx.de>
Content-Language: en-US
From: Werner Sembach <wse@tuxedocomputers.com>
In-Reply-To: <8b20fef7-d57c-4bd8-9d0e-1dda9a7391f7@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


Am 05.03.25 um 02:01 schrieb Armin Wolf:
> Am 03.03.25 um 20:04 schrieb Werner Sembach:
>
>> This small driver does 2 things:
>>
>> It remaps the touchpad toggle key from Control + Super + Hangaku/Zenkaku to
>> F21 to conform with established userspace defaults. Note that the
>> Hangaku/Zenkaku scancode used here is usually unused, with real
>> Hangaku/Zenkaku keys using the tilde scancode.
>>
>> It suppresses the reserved scancode produced by pressing the FN-key on its
>> own, which fixes a warning spamming the dmesg log otherwise.
>>
>> Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
>> ---
>>   MAINTAINERS                                 |  6 ++
>>   drivers/platform/x86/Kconfig                |  2 +
>>   drivers/platform/x86/Makefile               |  3 +
>>   drivers/platform/x86/tuxedo/Kbuild          |  6 ++
>>   drivers/platform/x86/tuxedo/Kconfig         |  6 ++
>>   drivers/platform/x86/tuxedo/nb02/Kbuild     |  7 ++
>>   drivers/platform/x86/tuxedo/nb02/Kconfig    | 15 ++++
>>   drivers/platform/x86/tuxedo/nb02/platform.c | 94 +++++++++++++++++++++
>>   8 files changed, 139 insertions(+)
>>   create mode 100644 drivers/platform/x86/tuxedo/Kbuild
>>   create mode 100644 drivers/platform/x86/tuxedo/Kconfig
>>   create mode 100644 drivers/platform/x86/tuxedo/nb02/Kbuild
>>   create mode 100644 drivers/platform/x86/tuxedo/nb02/Kconfig
>>   create mode 100644 drivers/platform/x86/tuxedo/nb02/platform.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4ff26fa94895d..d3fbbcef813b0 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -24178,6 +24178,12 @@ T:    git 
>> git://git.kernel.org/pub/scm/linux/kernel/git/lenb/linux.git turbostat
>>   F:    tools/power/x86/turbostat/
>>   F:    tools/testing/selftests/turbostat/
>>
>> +TUXEDO DRIVERS
>> +M:    Werner Sembach <wse@tuxedocomputers.com>
>> +L:    platform-driver-x86@vger.kernel.org
>> +S:    Supported
>> +F:    drivers/platform/x86/tuxedo/
>> +
>>   TW5864 VIDEO4LINUX DRIVER
>>   M:    Bluecherry Maintainers <maintainers@bluecherrydvr.com>
>>   M:    Andrey Utkin <andrey.utkin@corp.bluecherry.net>
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0258dd879d64b..9b78a1255c08e 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1199,3 +1199,5 @@ config P2SB
>>         The main purpose of this library is to unhide P2SB device in case
>>         firmware kept it hidden on some platforms in order to access devices
>>         behind it.
>> +
>> +source "drivers/platform/x86/tuxedo/Kconfig"
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index e1b1429470674..1562dcd7ad9a5 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -153,3 +153,6 @@ obj-$(CONFIG_WINMATE_FM07_KEYS)        += 
>> winmate-fm07-keys.o
>>
>>   # SEL
>>   obj-$(CONFIG_SEL3350_PLATFORM)        += sel3350-platform.o
>> +
>> +# TUXEDO
>> +obj-y                    += tuxedo/
>> diff --git a/drivers/platform/x86/tuxedo/Kbuild 
>> b/drivers/platform/x86/tuxedo/Kbuild
>> new file mode 100644
>> index 0000000000000..e9c4243d438ba
>> --- /dev/null
>> +++ b/drivers/platform/x86/tuxedo/Kbuild
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0-or-later
>> +#
>> +# TUXEDO X86 Platform Specific Drivers
>> +#
>> +
>> +obj-y    += nb02/
>> diff --git a/drivers/platform/x86/tuxedo/Kconfig 
>> b/drivers/platform/x86/tuxedo/Kconfig
>> new file mode 100644
>> index 0000000000000..e463f92135780
>> --- /dev/null
>> +++ b/drivers/platform/x86/tuxedo/Kconfig
>> @@ -0,0 +1,6 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# TUXEDO X86 Platform Specific Drivers
>> +#
>> +
>> +source "drivers/platform/x86/tuxedo/nb02/Kconfig"
>> diff --git a/drivers/platform/x86/tuxedo/nb02/Kbuild 
>> b/drivers/platform/x86/tuxedo/nb02/Kbuild
>> new file mode 100644
>> index 0000000000000..8624a012cd683
>> --- /dev/null
>> +++ b/drivers/platform/x86/tuxedo/nb02/Kbuild
>> @@ -0,0 +1,7 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# TUXEDO X86 Platform Specific Drivers
>> +#
>> +
>> +tuxedo_nb02_platform-y            := platform.o
>> +obj-$(CONFIG_TUXEDO_NB02_PLATFORM)    += tuxedo_nb02_platform.o
>> diff --git a/drivers/platform/x86/tuxedo/nb02/Kconfig 
>> b/drivers/platform/x86/tuxedo/nb02/Kconfig
>> new file mode 100644
>> index 0000000000000..bed56276b9b36
>> --- /dev/null
>> +++ b/drivers/platform/x86/tuxedo/nb02/Kconfig
>> @@ -0,0 +1,15 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# TUXEDO X86 Platform Specific Drivers
>> +#
>> +
>> +menuconfig TUXEDO_NB02_PLATFORM
>> +    tristate "TUXEDO NB02 Platform Driver"
>> +    help
>> +      This driver implements miscellaneous things found on TUXEDO Notebooks
>> +      with board vendor NB02. For the time being this is only remapping the
>> +      touchpad toggle key to something supported by most Linux distros
>> +      out-of-the-box and suppressing an unsupported scancode from the
>> +      FN-key.
>> +
>> +      When compiled as a module it will be called tuxedo_nb02_platform.
>> diff --git a/drivers/platform/x86/tuxedo/nb02/platform.c 
>> b/drivers/platform/x86/tuxedo/nb02/platform.c
>> new file mode 100644
>> index 0000000000000..68d83b9b4c2f5
>> --- /dev/null
>> +++ b/drivers/platform/x86/tuxedo/nb02/platform.c
>> @@ -0,0 +1,94 @@
>> +// SPDX-License-Identifier: GPL-2.0-or-later
>> +/*
>> + * Copyright (C) 2025 Werner Sembach wse@tuxedocomputers.com
>> + */
>> +
>> +#include <linux/dmi.h>
>> +#include <linux/i8042.h>
>> +#include <linux/kernel.h>
>> +#include <linux/module.h>
>> +#include <linux/serio.h>
>> +
>> +static u8 tux_nb02_touchp_toggle_seq[] = {
>
> Hi,
>
> please make this const.
kk
>
>> +    0xe0, 0x5b, // Super down
>> +    0x1d,       // Control down
>> +    0x76,       // Zenkaku/Hankaku down
>> +    0xf6,       // Zenkaku/Hankaku up
>> +    0x9d,       // Control up
>> +    0xe0, 0xdb  // Super up
>> +};
>> +
>> +static bool tux_nb02_i8042_filter(unsigned char data,
>> +                  unsigned char str,
>> +                  struct serio *port,
>> +                  __always_unused void *context)
>> +{
>> +    static u8 seq_pos;
>> +
>> +    if (unlikely(str & I8042_STR_AUXDATA))
>> +        return false;
>> +
>> +    /* Replace touchpad toggle key sequence with a singular press of the
>> +     * F21-key.
>> +     */
>> +    if (unlikely(data == tux_nb02_touchp_toggle_seq[seq_pos])) {
>> +        ++seq_pos;
>> +        if (seq_pos == ARRAY_SIZE(tux_nb02_touchp_toggle_seq)) {
>> +            seq_pos = 0;
>> +            serio_interrupt(port, 0x6c, 0); // F21 down
>> +            serio_interrupt(port, 0xec, 0); // F21 up
>> +        }
>> +        return true;
>> +    }
>> +
>> +    /* Ignore bogus scancode produced by the FN-key. Reuse seq_pos as first
>> +     * byte of that is just the "extended"-byte.
>> +     */
>> +    if (unlikely(seq_pos == 1 && (data == 0x78 || data == 0xf8))) {
>> +        seq_pos = 0;
>> +        return true;
>> +    }
>> +
>> +    /* Replay skipped sequence bytes if it did not finish and it was not a
>> +     * FN-key press.
>> +     */
>> +    if (unlikely(seq_pos)) {
>> +        for (u8 i; i < seq_pos; ++i)
>> +            serio_interrupt(port, tux_nb02_touchp_toggle_seq[i], 0);
>> +        seq_pos = 0;
>> +    }
>> +
>> +    return false;
>> +}
>> +
>> +static const struct dmi_system_id tux_nb02_dmi_string_match[] __initconst = {
>> +    {
>> +        .matches = {
>> +            DMI_EXACT_MATCH(DMI_SYS_VENDOR, "TUXEDO"),
>> +            DMI_EXACT_MATCH(DMI_BOARD_VENDOR, "NB02"),
>> +        },
>> +    },
>> +    { }
>> +};
>> +
>> +static int __init tux_nb02_plat_init(void)
>> +{
>> +    if (!dmi_check_system(tux_nb02_dmi_string_match))
>> +        return -ENODEV;
>> +
>> +    return i8042_install_filter(tux_nb02_i8042_filter, NULL);
>> +}
>> +
>> +static void __exit tux_nb02_plat_exit(void)
>> +{
>> +    i8042_remove_filter(tux_nb02_i8042_filter);
>> +}
>> +
>> +module_init(tux_nb02_plat_init);
>> +module_exit(tux_nb02_plat_exit);
>> +
>> +MODULE_ALIAS("dmi:*:svnTUXEDO:*:rvnNB02:*");
>
> Please use MODULE_DEVICE_TABLE(dmi, tux_nb02_dmi_string_match) instead.
kk
>
> Otherwise the driver seems to be OK to me.
>
> Thanks,
> Armin Wolf
>
>> +
>> +MODULE_DESCRIPTION("TUXEDO NB02 Platform");
>> +MODULE_AUTHOR("Werner Sembach <wse@tuxedocomputers.com>");
>> +MODULE_LICENSE("GPL");

