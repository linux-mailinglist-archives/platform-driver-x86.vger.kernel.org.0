Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0156C22FE66
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jul 2020 02:17:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726283AbgG1ARb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 20:17:31 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:15843 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbgG1ARb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 20:17:31 -0400
Date:   Tue, 28 Jul 2020 00:11:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595895095;
        bh=tUeuQjEjlvuMPUDI93dlycN0SDEkP8nAccUNjdSfqn8=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=E23X7DG2I/tC9eaLNa3tUBLIxoj27Uv267PNoJSphKbYldQlvuKopXss3QPxj5HQk
         0aYy4wm2Y6TDn824EsRRKCLnkAsN1nghyT8TBMqnoMwY+40ZZ6/92zetP5aK7KmFWN
         2ZnxDhuPV93EGykssW450Ut0/zgzrYSxBsoLKOzA=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for ACPI-driven muxes
Message-ID: <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com>
In-Reply-To: <20200727205752.28224-1-ddadap@nvidia.com>
References: <20200727205752.28224-1-ddadap@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I am no authority to say if this patch is good or bad, but I hope to help w=
ith my comments.


> Some upcoming notebook designs utilize display muxes driven by a
> pair of ACPI methods, MXDM to query and configure the operational
> mode of the mux (integrated only, discrete only, hybrid non-muxed,
> hybrid with dynamic mux switching), and MXDS to query and set the
> mux state when running in dynamic switch mode.
>
> Add a vga-switcheroo driver to support switching the mux on systems
> with the ACPI MXDM/MXDS interface. The mux mode cannot be changed
> dynamically (calling MXDM to change the mode won't have effect until
> the next boot, and calling MXDM to read the mux mode returns the
> active mode, not the mode that will be enabled on next boot), and
> MXDS only works when the mux mode is set to dynamic switch, so this
> driver will fail to load when MXDM reports any non-dynamic mode.
>
> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/platform/x86/Kconfig     |   9 ++
>  drivers/platform/x86/Makefile    |   2 +
>  drivers/platform/x86/mxds-gmux.c | 268 +++++++++++++++++++++++++++++++
>  4 files changed, 285 insertions(+)
>  create mode 100644 drivers/platform/x86/mxds-gmux.c
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index eeff55560759..636c9259b345 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11510,6 +11510,12 @@ L:=09linux-usb@vger.kernel.org
>  S:=09Maintained
>  F:=09drivers/usb/musb/
>
> +MXDS GMUX DRIVER
> +M:=09Daniel Dadap <ddadap@nvidia.com>
> +L:=09platform-driver-x86@vger.kernel.org
> +S:=09Supported
> +F:=09drivers/platform/x86/mxds-gmux.c
> +
>  MXL301RF MEDIA DRIVER
>  M:=09Akihiro Tsukada <tskd08@gmail.com>
>  L:=09linux-media@vger.kernel.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0ad7ad8cf8e1..f2fef1e8e8d9 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1368,6 +1368,15 @@ config INTEL_TELEMETRY
>  =09  directly via debugfs files. Various tools may use
>  =09  this interface for SoC state monitoring.
>
> +config MXDS_GMUX
> +=09tristate "ACPI MXDS Gmux Driver"
> +=09depends on ACPI_WMI
> +=09depends on ACPI
> +=09depends on VGA_SWITCHEROO
> +=09---help---
> +=09  This driver provides support for ACPI-driven gmux devices which are
> +=09  present on some notebook designs with hybrid graphics.
> +
>  endif # X86_PLATFORM_DEVICES
>
>  config PMC_ATOM
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 53408d965874..bc75b1f42057 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -146,3 +146,5 @@ obj-$(CONFIG_INTEL_TELEMETRY)=09=09+=3D intel_telemet=
ry_core.o  =09=09   intel_telemetry_pltdrv.o  =09=09=09=09=09   intel_telem=
etry_debugfs.o
>  obj-$(CONFIG_PMC_ATOM)=09=09=09+=3D pmc_atom.o
> +
> +obj-$(CONFIG_MXDS_GMUX)                 +=3D mxds-gmux.o
> diff --git a/drivers/platform/x86/mxds-gmux.c b/drivers/platform/x86/mxds=
-gmux.c
> new file mode 100644
> index 000000000000..c6c5973bde80
> --- /dev/null
> +++ b/drivers/platform/x86/mxds-gmux.c
> @@ -0,0 +1,268 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes
> + *
> + * Copyright (C) 2020 NVIDIA Corporation
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms and conditions of the GNU General Public License,
> + * version 2, as published by the Free Software Foundation.
> + *
> + * This program is distributed in the hope that it will be useful, but W=
ITHOUT
> + * ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
> + * FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License=
 for
> + * more details.
> + *
> + * You should have received a copy of the GNU General Public License
> + * along with this program; if not, see <http://www.gnu.org/licenses>.
> + *
> + */
> +
> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/pci.h>
> +#include <linux/vga_switcheroo.h>
> +#include <linux/delay.h>
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> +
> +/*
> + *  The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key of=
f of
      ^
There is an extra space here in contrast to the next line.


> + * the WMI wrapper for the related WMAA method for backlight control.
> + */
> +MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> +
> +static struct pci_dev *ig_dev, *dg_dev;
> +static acpi_handle internal_mux_handle;
> +static acpi_handle external_mux_handle;
> +static int vga_switcheroo_registered;
> +

Later in the code "true" is used, so why not use bool for the type of vga_s=
witcheroo_registered?


> +enum acpi_method {
> +=09MXDM,
> +=09MXDS,
> +};
> +

These constants are later used to index an array, and in such cases, - I do=
n't know about everybody, but - I prefer if they are explicitly given a val=
ue, at least the first one.


> +static char *acpi_methods[] =3D {
> +=09[MXDM] =3D "MXDM",
> +=09[MXDS] =3D "MXDS",
> +};
> +
> +enum mux_mode {
> +=09MUX_MODE_GET =3D 0,
> +=09MUX_MODE_DGPU_ONLY =3D 1,
> +=09MUX_MODE_IGPU_ONLY =3D 2,
> +=09MUX_MODE_MSHYBRID =3D 3,
> +=09MUX_MODE_DYNAMIC =3D 4,
> +};
> +

I think this could be improved by separating the commands and returned valu=
es into their respective enums.


> +/*
> + * Call MXDS with argument value 0 to read the current state.
> + * When reading, a return value of 1 means iGPU and 2 means dGPU.
> + * Call MXDS with bit 0 set to change the current state.
> + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
> + */
> +
> +enum mux_state {
> +=09MUX_STATE_GET =3D 0,
> +=09MUX_STATE_SET_IGPU =3D 0x01,
> +=09MUX_STATE_IGPU =3D 1,
> +=09MUX_STATE_DGPU =3D 2,
> +=09MUX_STATE_SET_DGPU =3D 0x11,
> +};
> +

Same here, I think commands and returned values should be separated.


> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method met=
hod,
> +=09=09=09=09acpi_integer action)
> +{
> +=09union acpi_object arg;
> +=09struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg};
> +=09struct acpi_buffer buf =3D {
> +=09=09.length =3D ACPI_ALLOCATE_BUFFER,
> +=09=09.pointer =3D NULL,
> +=09};
> +=09acpi_integer ret =3D 0;
> +
> +=09arg.integer.type =3D ACPI_TYPE_INTEGER;
> +=09arg.integer.value =3D action;
> +
> +=09if (!ACPI_FAILURE(acpi_evaluate_object(handle, acpi_methods[method],
> +=09=09=09  &in, &buf))) {
> +=09=09union acpi_object *obj =3D buf.pointer;
> +
> +=09=09if (obj && obj->type =3D=3D ACPI_TYPE_INTEGER)
> +=09=09=09ret =3D obj->integer.value;
> +=09}
> +
> +=09return ret;
> +}
> +

The allocated buffer is not freed. Furthermore, wouldn't acpi_evalute_integ=
er() be a better fit?


> +static acpi_integer get_mux_mode(acpi_handle handle)
> +{
> +=09return acpi_helper(handle, MXDM, MUX_MODE_GET);
> +}
> +
> +static acpi_integer get_mux_state(acpi_handle handle)
> +{
> +=09return acpi_helper(handle, MXDS, MUX_STATE_GET);
> +}
> +
> +static void set_mux_state(acpi_handle handle, enum mux_state state)
> +{
> +=09switch (state) {
> +=09case MUX_STATE_IGPU:
> +=09=09state =3D MUX_STATE_SET_IGPU;
> +=09=09break;
> +=09case MUX_STATE_DGPU:
> +=09case MUX_STATE_SET_DGPU:
> +=09=09state =3D MUX_STATE_SET_DGPU;
> +=09=09break;

What's the reason for this inconsistency? MUX_STATE_SET_DGPU is handled, bu=
t MUX_STATE_SET_IGPU is not.


> +=09default:
> +=09=09state =3D MUX_STATE_GET;
> +=09=09break;
> +=09}
> +
> +=09acpi_helper(handle, MXDS, state);
> +}
> +
> +static int mxds_gmux_switchto(enum vga_switcheroo_client_id id)
> +{
> +=09enum mux_state state_set_cmd, target_state;
> +
> +=09if (!internal_mux_handle && !external_mux_handle)
> +=09=09return -ENOTSUPP;
> +

This condition cannot be true, no? mxds_gmux_init() returns -ENODEV if this=
 condition is true, so the module is not even loaded in that situation; and=
 I don't see anything that could modify these handles after the module is l=
oaded. Am I missing something?


> +=09switch (id) {
> +=09case VGA_SWITCHEROO_IGD:
> +=09=09state_set_cmd =3D MUX_STATE_SET_IGPU;
> +=09=09target_state =3D MUX_STATE_IGPU;
> +=09=09break;
> +=09case VGA_SWITCHEROO_DIS:
> +=09=09state_set_cmd =3D MUX_STATE_SET_DGPU;
> +=09=09target_state =3D MUX_STATE_DGPU;
> +=09=09break;
> +=09default:
> +=09=09return -EINVAL;
> +=09}
> +
> +=09if (internal_mux_handle) {
> +=09=09set_mux_state(internal_mux_handle, state_set_cmd);
> +=09=09if (get_mux_state(internal_mux_handle) !=3D target_state)
> +=09=09=09return -EAGAIN;
> +=09}
> +
> +=09if (external_mux_handle) {
> +=09=09set_mux_state(external_mux_handle, state_set_cmd);
> +=09=09if (get_mux_state(external_mux_handle) !=3D target_state)
> +=09=09=09return -EAGAIN;
> +=09}
> +
> +=09/* DP AUX can take up to 100ms to settle after mux switch */
> +=09mdelay(100);
> +
> +=09return 0;
> +}
> +
> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
> +=09struct pci_dev *dev)
> +{
> +=09if (dev) {
> +=09=09if (ig_dev && dev->vendor =3D=3D ig_dev->vendor)
> +=09=09=09return VGA_SWITCHEROO_IGD;
> +=09=09if (dg_dev && dev->vendor =3D=3D dg_dev->vendor)
> +=09=09=09return VGA_SWITCHEROO_DIS;
> +=09}
> +
> +=09return VGA_SWITCHEROO_UNKNOWN_ID;
> +}
> +
> +static acpi_status find_acpi_methods(
> +=09acpi_handle object, u32 nesting_level, void *context,
> +=09void **return_value)
> +{
> +=09acpi_handle search;
> +
> +=09/* If either MXDM or MXDS is missing, we can't use this object */
> +=09if (acpi_get_handle(object, "MXDM", &search))
> +=09=09return 0;
> +=09if (acpi_get_handle(object, "MXDS", &search))
> +=09=09return 0;
> +
> +=09/* MXDS only works when MXDM indicates dynamic mode */
> +=09if (get_mux_mode(object) !=3D MUX_MODE_DYNAMIC)
> +=09=09return 0;
> +
> +=09/* Internal display has _BCL; external does not */
> +=09if (acpi_get_handle(object, "_BCL", &search))
> +=09=09external_mux_handle =3D object;
> +=09else
> +=09=09internal_mux_handle =3D object;
> +
> +=09return 0;
> +}
> +
> +static int mxds_gmux_init(void)
> +{
> +=09int ret =3D 0;
> +=09struct pci_dev *dev =3D NULL;
> +=09static struct vga_switcheroo_handler handler =3D {
> +=09=09.switchto =3D mxds_gmux_switchto,
> +=09=09.get_client_id =3D mxds_gmux_get_client_id,
> +=09};
> +

Any reason why "handler" is inside the function and not const?


> +=09while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
> +=09=09switch (dev->vendor) {
> +=09=09case 0x8086:
> +=09=09=09pci_dev_put(ig_dev);
> +=09=09=09ig_dev =3D pci_dev_get(dev);
> +=09=09=09break;
> +=09=09case 0x10de:
> +=09=09=09pci_dev_put(dg_dev);
> +=09=09=09dg_dev =3D pci_dev_get(dev);
> +=09=09=09break;
> +=09=09default:
> +=09=09=09break;
> +=09=09}
> +=09}
> +

I think it should be mentioned somewhere that it only works with nvidia and=
 intel GPUs (as far as I can see). Furthermore, maybe the PCI_VENDOR_ID_INT=
EL and PCI_VENDOR_ID_NVIDIA defines from include/linux/pci_ids.h could be u=
sed here.

Regardless of how improbable, I am wondering what happens if an external GP=
U is connected to a dual-GPU laptop? Cannot that interfere with this device=
 lookup logic?


> +=09/* Require both integrated and discrete GPUs */
> +=09if (!ig_dev || !dg_dev) {
> +=09=09ret =3D -ENODEV;
> +=09=09goto done;
> +=09}
> +
> +=09acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT32_M=
AX,
> +=09=09find_acpi_methods, NULL, NULL, NULL);
> +
> +=09/* Require at least one mux */
> +=09if (!internal_mux_handle && !external_mux_handle) {
> +=09=09ret =3D -ENODEV;
> +=09=09goto done;
> +=09}
> +
> +=09ret =3D vga_switcheroo_register_handler(&handler, 0);
> +
> +=09if (ret)
> +=09=09goto done;
> +
> +=09vga_switcheroo_registered =3D true;
> +
> +done:
> +
> +=09if (ret) {
> +=09=09pci_dev_put(ig_dev);
> +=09=09pci_dev_put(dg_dev);
> +=09}
> +
> +=09return ret;
> +}
> +module_init(mxds_gmux_init);
> +
> +static void mxds_gmux_fini(void)
> +{
> +=09if (vga_switcheroo_registered)
> +=09=09vga_switcheroo_unregister_handler();
> +=09pci_dev_put(ig_dev);
> +=09pci_dev_put(dg_dev);
> +}
> +module_exit(mxds_gmux_fini);
> --
> 2.18.4


Subsystem maintainers CCd.


Barnab=C3=A1s P=C5=91cze
