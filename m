Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23C51231804
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 05:20:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726319AbgG2DUp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Jul 2020 23:20:45 -0400
Received: from hqnvemgate25.nvidia.com ([216.228.121.64]:3041 "EHLO
        hqnvemgate25.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726047AbgG2DUo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Jul 2020 23:20:44 -0400
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f20e9b20001>; Tue, 28 Jul 2020 20:14:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate101.nvidia.com (PGP Universal service);
  Tue, 28 Jul 2020 20:15:43 -0700
X-PGP-Universal: processed;
        by hqpgpgate101.nvidia.com on Tue, 28 Jul 2020 20:15:43 -0700
Received: from [172.20.40.94] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 29 Jul
 2020 03:15:42 +0000
Subject: Re: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
CC:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
References: <20200727205752.28224-1-ddadap@nvidia.com>
 <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
Date:   Tue, 28 Jul 2020 22:17:19 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1595992498; bh=mGW/FFRdcDdqNs7jzhnRMvYAa/+NMaX0Gd7HcE8G8Hs=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=oWnKIHj3EnWtYMQJjbn6+tD/jnh8xahx3rI0E/U2RvlWmUDdLsS3hOPWzyaIjMJVL
         Kk1dtK0XwsArsefJqd9/JjnnDVf8flWn8KKoAy8L0A0sXmUKxRoxX4tpLcOB/rU/jP
         Rb0IjRNK78xntDOx4gtDKt6gQLHNHpOwIa2dTTXmSr3o1UR/DCaneNngahHOGd1Eqw
         9gPtUqG8KpDXBRO7+EGm/aE5N+uF+F3B7rQI6eH5LyP7zCjM7F26lvwbg8YQFLPmic
         uVRgfyfyCMZC0KBs6NhX8AJuFEy2VurscNIFbzcymGKJv4CcUgsGA3TrFGSxfUjO8a
         ZxNoc6QfMrlEw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks for your comments. A v2 patch will follow after I've had some=20
time to test it more; in the meantime, I've responded to your=20
suggestions inline:

On 7/27/20 7:11 PM, Barnab=C3=A1s P=C5=91cze wrote:
> External email: Use caution opening links or attachments
>
>
> I am no authority to say if this patch is good or bad, but I hope to help=
 with my comments.
>
>
>> Some upcoming notebook designs utilize display muxes driven by a
>> pair of ACPI methods, MXDM to query and configure the operational
>> mode of the mux (integrated only, discrete only, hybrid non-muxed,
>> hybrid with dynamic mux switching), and MXDS to query and set the
>> mux state when running in dynamic switch mode.
>>
>> Add a vga-switcheroo driver to support switching the mux on systems
>> with the ACPI MXDM/MXDS interface. The mux mode cannot be changed
>> dynamically (calling MXDM to change the mode won't have effect until
>> the next boot, and calling MXDM to read the mux mode returns the
>> active mode, not the mode that will be enabled on next boot), and
>> MXDS only works when the mux mode is set to dynamic switch, so this
>> driver will fail to load when MXDM reports any non-dynamic mode.
>>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                      |   6 +
>>   drivers/platform/x86/Kconfig     |   9 ++
>>   drivers/platform/x86/Makefile    |   2 +
>>   drivers/platform/x86/mxds-gmux.c | 268 +++++++++++++++++++++++++++++++
>>   4 files changed, 285 insertions(+)
>>   create mode 100644 drivers/platform/x86/mxds-gmux.c
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index eeff55560759..636c9259b345 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -11510,6 +11510,12 @@ L:   linux-usb@vger.kernel.org
>>   S:   Maintained
>>   F:   drivers/usb/musb/
>>
>> +MXDS GMUX DRIVER
>> +M:   Daniel Dadap <ddadap@nvidia.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Supported
>> +F:   drivers/platform/x86/mxds-gmux.c
>> +
>>   MXL301RF MEDIA DRIVER
>>   M:   Akihiro Tsukada <tskd08@gmail.com>
>>   L:   linux-media@vger.kernel.org
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 0ad7ad8cf8e1..f2fef1e8e8d9 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -1368,6 +1368,15 @@ config INTEL_TELEMETRY
>>          directly via debugfs files. Various tools may use
>>          this interface for SoC state monitoring.
>>
>> +config MXDS_GMUX
>> +     tristate "ACPI MXDS Gmux Driver"
>> +     depends on ACPI_WMI
>> +     depends on ACPI
>> +     depends on VGA_SWITCHEROO
>> +     ---help---
>> +       This driver provides support for ACPI-driven gmux devices which =
are
>> +       present on some notebook designs with hybrid graphics.
>> +
>>   endif # X86_PLATFORM_DEVICES
>>
>>   config PMC_ATOM
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefi=
le
>> index 53408d965874..bc75b1f42057 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)             +=3D intel=
_telemetry_core.o                  intel_telemetry_pltdrv.o                =
                        intel_telemetry_debugfs.o
>>   obj-$(CONFIG_PMC_ATOM)                       +=3D pmc_atom.o
>> +
>> +obj-$(CONFIG_MXDS_GMUX)                 +=3D mxds-gmux.o
>> diff --git a/drivers/platform/x86/mxds-gmux.c b/drivers/platform/x86/mxd=
s-gmux.c
>> new file mode 100644
>> index 000000000000..c6c5973bde80
>> --- /dev/null
>> +++ b/drivers/platform/x86/mxds-gmux.c
>> @@ -0,0 +1,268 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes
>> + *
>> + * Copyright (C) 2020 NVIDIA Corporation
>> + *
>> + * This program is free software; you can redistribute it and/or modify=
 it
>> + * under the terms and conditions of the GNU General Public License,
>> + * version 2, as published by the Free Software Foundation.
>> + *
>> + * This program is distributed in the hope that it will be useful, but =
WITHOUT
>> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY o=
r
>> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public Licens=
e for
>> + * more details.
>> + *
>> + * You should have received a copy of the GNU General Public License
>> + * along with this program; if not, see <http://www.gnu.org/licenses>.
>> + *
>> + */
>> +
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/pci.h>
>> +#include <linux/vga_switcheroo.h>
>> +#include <linux/delay.h>
>> +
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
>> +
>> +/*
>> + *  The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key o=
ff of
>        ^
> There is an extra space here in contrast to the next line.
>
>
>> + * the WMI wrapper for the related WMAA method for backlight control.
>> + */
>> +MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
>> +
>> +static struct pci_dev *ig_dev, *dg_dev;
>> +static acpi_handle internal_mux_handle;
>> +static acpi_handle external_mux_handle;
>> +static int vga_switcheroo_registered;
>> +
> Later in the code "true" is used, so why not use bool for the type of vga=
_switcheroo_registered?
>
>
>> +enum acpi_method {
>> +     MXDM,
>> +     MXDS,
>> +};
>> +
> These constants are later used to index an array, and in such cases, - I =
don't know about everybody, but - I prefer if they are explicitly given a v=
alue, at least the first one.
>
>
>> +static char *acpi_methods[] =3D {
>> +     [MXDM] =3D "MXDM",
>> +     [MXDS] =3D "MXDS",
>> +};
>> +
>> +enum mux_mode {
>> +     MUX_MODE_GET =3D 0,
>> +     MUX_MODE_DGPU_ONLY =3D 1,
>> +     MUX_MODE_IGPU_ONLY =3D 2,
>> +     MUX_MODE_MSHYBRID =3D 3,
>> +     MUX_MODE_DYNAMIC =3D 4,
>> +};
>> +
> I think this could be improved by separating the commands and returned va=
lues into their respective enums.
>
>
>> +/*
>> + * Call MXDS with argument value 0 to read the current state.
>> + * When reading, a return value of 1 means iGPU and 2 means dGPU.
>> + * Call MXDS with bit 0 set to change the current state.
>> + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
>> + */
>> +
>> +enum mux_state {
>> +     MUX_STATE_GET =3D 0,
>> +     MUX_STATE_SET_IGPU =3D 0x01,
>> +     MUX_STATE_IGPU =3D 1,
>> +     MUX_STATE_DGPU =3D 2,
>> +     MUX_STATE_SET_DGPU =3D 0x11,
>> +};
>> +
> Same here, I think commands and returned values should be separated.
>

Good suggestions; thanks.


>> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method me=
thod,
>> +                             acpi_integer action)
>> +{
>> +     union acpi_object arg;
>> +     struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg};
>> +     struct acpi_buffer buf =3D {
>> +             .length =3D ACPI_ALLOCATE_BUFFER,
>> +             .pointer =3D NULL,
>> +     };
>> +     acpi_integer ret =3D 0;
>> +
>> +     arg.integer.type =3D ACPI_TYPE_INTEGER;
>> +     arg.integer.value =3D action;
>> +
>> +     if (!ACPI_FAILURE(acpi_evaluate_object(handle, acpi_methods[method=
],
>> +                       &in, &buf))) {
>> +             union acpi_object *obj =3D buf.pointer;
>> +
>> +             if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
>> +                     ret =3D obj->integer.value;
>> +     }
>> +
>> +     return ret;
>> +}
>> +
> The allocated buffer is not freed. Furthermore, wouldn't acpi_evalute_int=
eger() be a better fit?


It would.


>
>> +static acpi_integer get_mux_mode(acpi_handle handle)
>> +{
>> +     return acpi_helper(handle, MXDM, MUX_MODE_GET);
>> +}
>> +
>> +static acpi_integer get_mux_state(acpi_handle handle)
>> +{
>> +     return acpi_helper(handle, MXDS, MUX_STATE_GET);
>> +}
>> +
>> +static void set_mux_state(acpi_handle handle, enum mux_state state)
>> +{
>> +     switch (state) {
>> +     case MUX_STATE_IGPU:
>> +             state =3D MUX_STATE_SET_IGPU;
>> +             break;
>> +     case MUX_STATE_DGPU:
>> +     case MUX_STATE_SET_DGPU:
>> +             state =3D MUX_STATE_SET_DGPU;
>> +             break;
> What's the reason for this inconsistency? MUX_STATE_SET_DGPU is handled, =
but MUX_STATE_SET_IGPU is not.


Thanks for catching this. It's an artifact of an earlier version of this=20
driver, which had an additional interface separate from vga-switcheroo,=20
and which accepted the _SET variant. I've simplified the implementation=20
of set_mux_state() now that this no longer needs to be supported.


>
>
>> +     default:
>> +             state =3D MUX_STATE_GET;
>> +             break;
>> +     }
>> +
>> +     acpi_helper(handle, MXDS, state);
>> +}
>> +
>> +static int mxds_gmux_switchto(enum vga_switcheroo_client_id id)
>> +{
>> +     enum mux_state state_set_cmd, target_state;
>> +
>> +     if (!internal_mux_handle && !external_mux_handle)
>> +             return -ENOTSUPP;
>> +
> This condition cannot be true, no? mxds_gmux_init() returns -ENODEV if th=
is condition is true, so the module is not even loaded in that situation; a=
nd I don't see anything that could modify these handles after the module is=
 loaded. Am I missing something?


You're right. This check is unnecessary. In an earlier version of this=20
driver it was possible to load the module in the absence of the mux handles=
.


>
>> +     switch (id) {
>> +     case VGA_SWITCHEROO_IGD:
>> +             state_set_cmd =3D MUX_STATE_SET_IGPU;
>> +             target_state =3D MUX_STATE_IGPU;
>> +             break;
>> +     case VGA_SWITCHEROO_DIS:
>> +             state_set_cmd =3D MUX_STATE_SET_DGPU;
>> +             target_state =3D MUX_STATE_DGPU;
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     if (internal_mux_handle) {
>> +             set_mux_state(internal_mux_handle, state_set_cmd);
>> +             if (get_mux_state(internal_mux_handle) !=3D target_state)
>> +                     return -EAGAIN;
>> +     }
>> +
>> +     if (external_mux_handle) {
>> +             set_mux_state(external_mux_handle, state_set_cmd);
>> +             if (get_mux_state(external_mux_handle) !=3D target_state)
>> +                     return -EAGAIN;
>> +     }
>> +
>> +     /* DP AUX can take up to 100ms to settle after mux switch */
>> +     mdelay(100);
>> +
>> +     return 0;
>> +}
>> +
>> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
>> +     struct pci_dev *dev)
>> +{
>> +     if (dev) {
>> +             if (ig_dev && dev->vendor =3D=3D ig_dev->vendor)
>> +                     return VGA_SWITCHEROO_IGD;
>> +             if (dg_dev && dev->vendor =3D=3D dg_dev->vendor)
>> +                     return VGA_SWITCHEROO_DIS;
>> +     }
>> +
>> +     return VGA_SWITCHEROO_UNKNOWN_ID;
>> +}
>> +
>> +static acpi_status find_acpi_methods(
>> +     acpi_handle object, u32 nesting_level, void *context,
>> +     void **return_value)
>> +{
>> +     acpi_handle search;
>> +
>> +     /* If either MXDM or MXDS is missing, we can't use this object */
>> +     if (acpi_get_handle(object, "MXDM", &search))
>> +             return 0;
>> +     if (acpi_get_handle(object, "MXDS", &search))
>> +             return 0;
>> +
>> +     /* MXDS only works when MXDM indicates dynamic mode */
>> +     if (get_mux_mode(object) !=3D MUX_MODE_DYNAMIC)
>> +             return 0;
>> +
>> +     /* Internal display has _BCL; external does not */
>> +     if (acpi_get_handle(object, "_BCL", &search))
>> +             external_mux_handle =3D object;
>> +     else
>> +             internal_mux_handle =3D object;
>> +
>> +     return 0;
>> +}
>> +
>> +static int mxds_gmux_init(void)
>> +{
>> +     int ret =3D 0;
>> +     struct pci_dev *dev =3D NULL;
>> +     static struct vga_switcheroo_handler handler =3D {
>> +             .switchto =3D mxds_gmux_switchto,
>> +             .get_client_id =3D mxds_gmux_get_client_id,
>> +     };
>> +
> Any reason why "handler" is inside the function and not const?
>

You're right, it can be const. I have it in the function (with static=20
storage) because we don't need to reference it anywhere else. I'd think=20
the static storage would allow the pointer to the struct to stay alive=20
even after the init function exits, but if you think it would be better=20
to have it out of the function's scope I can move it.


>> +     while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
>> +             switch (dev->vendor) {
>> +             case 0x8086:
>> +                     pci_dev_put(ig_dev);
>> +                     ig_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             case 0x10de:
>> +                     pci_dev_put(dg_dev);
>> +                     dg_dev =3D pci_dev_get(dev);
>> +                     break;
>> +             default:
>> +                     break;
>> +             }
>> +     }
>> +
> I think it should be mentioned somewhere that it only works with nvidia a=
nd intel GPUs (as far as I can see). Furthermore, maybe the PCI_VENDOR_ID_I=
NTEL and PCI_VENDOR_ID_NVIDIA defines from include/linux/pci_ids.h could be=
 used here.
>
> Regardless of how improbable, I am wondering what happens if an external =
GPU is connected to a dual-GPU laptop? Cannot that interfere with this devi=
ce lookup logic?


I don't think it'll be a problem, since an external GPU won't have an=20
implementation of the MXDM/MXDS methods in its associated ACPI node, so=20
even if the eGPU is plugged in at the time this module loads, it should=20
fail to initialize unless there is also an internal discrete GPU which=20
does support MXDM/MXDS.


>
>
>> +     /* Require both integrated and discrete GPUs */
>> +     if (!ig_dev || !dg_dev) {
>> +             ret =3D -ENODEV;
>> +             goto done;
>> +     }
>> +
>> +     acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT3=
2_MAX,
>> +             find_acpi_methods, NULL, NULL, NULL);
>> +
>> +     /* Require at least one mux */
>> +     if (!internal_mux_handle && !external_mux_handle) {
>> +             ret =3D -ENODEV;
>> +             goto done;
>> +     }
>> +
>> +     ret =3D vga_switcheroo_register_handler(&handler, 0);
>> +
>> +     if (ret)
>> +             goto done;
>> +
>> +     vga_switcheroo_registered =3D true;
>> +
>> +done:
>> +
>> +     if (ret) {
>> +             pci_dev_put(ig_dev);
>> +             pci_dev_put(dg_dev);
>> +     }
>> +
>> +     return ret;
>> +}
>> +module_init(mxds_gmux_init);
>> +
>> +static void mxds_gmux_fini(void)
>> +{
>> +     if (vga_switcheroo_registered)
>> +             vga_switcheroo_unregister_handler();
>> +     pci_dev_put(ig_dev);
>> +     pci_dev_put(dg_dev);
>> +}
>> +module_exit(mxds_gmux_fini);
>> --
>> 2.18.4
>
> Subsystem maintainers CCd.
>
>
> Barnab=C3=A1s P=C5=91cze
