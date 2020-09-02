Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B44A525B3D0
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Sep 2020 20:37:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728029AbgIBSha (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 2 Sep 2020 14:37:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726567AbgIBSh3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Sep 2020 14:37:29 -0400
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 14EDFC061244
        for <platform-driver-x86@vger.kernel.org>; Wed,  2 Sep 2020 11:37:27 -0700 (PDT)
Received: by mail-pj1-x1042.google.com with SMTP id s2so213638pjr.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2020 11:37:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=X1Lc1pRbXmO6qNSydYyqGDiHtI8GvtBdoxBfG+iQRUQ=;
        b=n+7kKdpGgh6YEzDcmunBRj24Qq3wzwMWVrorhEIcGqR11p0nVOAc1T/j3zl7w41g2W
         puSznguTCJAuG7+dN3nZy2MblK5zlYUfrn4WxnfN1ZPRlWRXFpFex26JRG6Dts7LTSbQ
         XCgaXc2UCtJmXxrRZZUGW4f5vkbJWN0+JxMfNIpzq8rHKYNb+1Pioi+asHBxhXCoB4Ua
         G8LC3K886a6vA8E+SFxDxFIgu7OIz3ajzaRmXrFIyFXtJjmcUWDiOExDpr4fVJnulbfx
         2YZtsTynkxk4MLVytI7d3uivFvTFe5G4PcDcXs2PRWoUK/a1ShyFWdL7P4k6yROhCixS
         VMww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=X1Lc1pRbXmO6qNSydYyqGDiHtI8GvtBdoxBfG+iQRUQ=;
        b=FtDFQzu+emvzGjLSJN7f7RIup2dE+ZJZFxIstn/j5L9x6lVrP2oF4/T6J8Pg+Z0B10
         tltVDJd9Fxai+A17IBN9FMYC+JX67QzyzrZaUpEMU5mSffIwokOui31CxF+yxboAUbYy
         swor/RCKHSUmairbyMvz34HI8IGxa4kLaS7+Kvv0X7YwkZV7iRYIHzo+w95tXkEEivGb
         kVStAyYiDkXoUA46XybxvfRPept4yXIq8sYj8rsE9GwqGCJ+HB6xKKrBLIB5Kxvidm5G
         fweDW537YLvUQl+FJ+FQa9fBhqb5fu1aZOVps4KRvpDFhqAYB/1AJLt27FAC7gyPmI+E
         PzxA==
X-Gm-Message-State: AOAM533EcUVbm7ityQ6nkCRHd3m121Dkzsty2OyTpdp+qwLN5ft6Nw7W
        eh4i7IHuoMU6wReHLKyGf6x6kNciuQ+GS5zh5h4kLHrPio3JSw==
X-Google-Smtp-Source: ABdhPJy251WFaWnIKKqqGNtgiWqSm2iqmjyBfhgfSjbgiD7zMBB5H95pfV86DZN0QlH04VXh6lc00BOJh6+9eE30wlc=
X-Received: by 2002:a17:90a:2c06:: with SMTP id m6mr3417616pjd.129.1599071846579;
 Wed, 02 Sep 2020 11:37:26 -0700 (PDT)
MIME-Version: 1.0
References: <c7dcb052-0ccf-dae3-49dd-1518f5ab182e@nvidia.com> <20200902173851.224368-1-ddadap@nvidia.com>
In-Reply-To: <20200902173851.224368-1-ddadap@nvidia.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 2 Sep 2020 21:37:09 +0300
Message-ID: <CAHp75Vf9QV0H+ks3ZbKp13r2qmKAMg-3ooN-O=Ct_fu+fTRo=g@mail.gmail.com>
Subject: Re: [PATCH v4] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Lukas Wunner <lukas@wunner.de>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Wu <peter@lekensteyn.nl>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Sep 2, 2020 at 8:37 PM Daniel Dadap <ddadap@nvidia.com> wrote:
>
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
> This driver currently only supports systems with Intel integrated
> graphics and NVIDIA discrete graphics. It will need to be updated if
> designs are developed using the same interfaces which utilize GPUs
> from other vendors.

Thanks for an update. My comments below.

> v2,v3: misc. fixes suggested by Barnab=C3=A1s P=C5=91cze <pobrn@protonmai=
l.com>
> v4: misc. changes suggested by Lukas Wunner <lukas@wunner.de>

This should go after the cutter '---' line below.

> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
> ---
>  MAINTAINERS                      |   6 +
>  drivers/platform/x86/Kconfig     |   9 ++
>  drivers/platform/x86/Makefile    |   2 +
>  drivers/platform/x86/mxds-gmux.c | 265 +++++++++++++++++++++++++++++++

...

> +config MXDS_GMUX
> +       tristate "ACPI MXDS Gmux Driver"
> +       depends on ACPI_WMI

> +       depends on ACPI

Is not this implied by the above?

> +       depends on VGA_SWITCHEROO
> +       help
> +         This driver provides support for ACPI-driven gmux devices which=
 are
> +         present on some notebook designs with hybrid graphics.

The stuff in Kconfig and Makefile is grouped and sorted by alphabet in
each group. Please, follow.

...

> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes

Please, remove the file name from the file.

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

Above should be removed since we use SPDX.

> + */

...

> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/pci.h>
> +#include <linux/vga_switcheroo.h>
> +#include <linux/delay.h>

Sorted is easier to read.

...

> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");

Usually we put this at the end of the file.

> +/*
> + * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key off=
 of
> + * the WMI wrapper for the related WMAA method for backlight control.
> + */
> +MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");

But this one depends.

...

> +static struct pci_dev *ig_dev, *dg_dev;
> +static acpi_handle internal_mux_handle;
> +static acpi_handle external_mux_handle;

Global variables?! Please get rid of them.

...

> +enum acpi_method {
> +       MXDM =3D 0,
> +       MXDS,
> +       NUM_ACPI_METHODS
> +};

Hmm... any real need for this enum?

...

> +enum mux_state_command {
> +       MUX_STATE_GET =3D 0,
> +       MUX_STATE_SET_IGPU =3D BIT(0),
> +       MUX_STATE_SET_DGPU =3D BIT(4) | BIT(0),
> +};

#include <linux/bits.h>

...

> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method met=
hod,
> +                               acpi_integer action)
> +{
> +       union acpi_object arg =3D {
> +               .integer =3D { .type =3D ACPI_TYPE_INTEGER, .value =3D ac=
tion }
> +       };
> +       struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg};

Be consistent with spaces surrounding the structure content.

> +       acpi_integer ret;
> +       acpi_status status;
> +
> +       status =3D acpi_evaluate_integer(handle, acpi_methods[method], &i=
n, &ret);

> +

Redundant blank line.

> +       if (ACPI_FAILURE(status)) {

> +               pr_err("ACPI %s failed: %s\n", acpi_methods[method],
> +                       acpi_format_exception(status));

Why not acpi_handle_err() ?

> +               return 0;
> +       }
> +
> +       return ret;
> +}

...

> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
> +       struct pci_dev *dev)

One line, please.

...

> +static acpi_status find_acpi_methods(
> +       acpi_handle object, u32 nesting_level, void *context,
> +       void **return_value)

Fix indentation here as well.

...

> +static int __init mxds_gmux_init(void)
> +{
> +       int ret =3D 0;

> +       struct pci_dev *dev =3D NULL;

Redundant assignment. And keep it in reversed xmas tree order.

> +       /* Currently only supports Intel integrated and NVIDIA discrete G=
PUs */

> +       while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) =
{

(Mostly as TODO for somebody else)
arch/alpha/kernel/console.c-47-
arch/x86/kernel/sysfb_efi.c-117-
drivers/acpi/acpi_video.c-2139-
drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c:616
drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c:288
drivers/gpu/drm/i915/display/intel_acpi.c:136
drivers/gpu/drm/nouveau/nouveau_acpi.c:284
drivers/gpu/drm/radeon/radeon_bios.c:202
drivers/vfio/pci/vfio_pci.c:136
sound/pci/hda/hda_intel.c:1434

(slightly different story) drivers/gpu/drm/qxl/qxl_drv.c-67-static
drivers/vfio/pci/vfio_pci.c-153-static

So, what  I think is better to do in this case is

#define for_each_pci_vga(dev) ...

in pci.h (at least here for the future use)

> +       /* Require both integrated and discrete GPUs */
> +       if (!ig_dev || !dg_dev) {
> +               ret =3D -ENODEV;
> +               goto done;
> +       }
> +
> +       acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UINT=
32_MAX,
> +               find_acpi_methods, NULL, NULL, NULL);

It's a bit too much. Can we reduce scope somehow?

> +       /* Require at least one mux */
> +       if (!internal_mux_handle && !external_mux_handle) {
> +               ret =3D -ENODEV;
> +               goto done;
> +       }
> +
> +       ret =3D vga_switcheroo_register_handler(&handler, 0);
> +
> +done:
> +
> +       if (ret) {
> +               pci_dev_put(ig_dev);
> +               pci_dev_put(dg_dev);
> +       }
> +
> +       return ret;

Can we use usual pattern:

  ret =3D ...
  if (ret)
    goto error_put_devices;

  return 0;

error_put_devices:
    pci_dev_put(ig_dev);
    pci_dev_put(dg_dev);
    return ret;

?

> +}
> +module_init(mxds_gmux_init);
> +
> +static void __exit mxds_gmux_exit(void)
> +{
> +       vga_switcheroo_unregister_handler();
> +       pci_dev_put(ig_dev);
> +       pci_dev_put(dg_dev);
> +}
> +module_exit(mxds_gmux_exit);


--=20
With Best Regards,
Andy Shevchenko
