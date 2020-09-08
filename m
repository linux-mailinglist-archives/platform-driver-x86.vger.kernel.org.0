Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E3D4261D0E
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Sep 2020 21:31:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730938AbgIHTbU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Sep 2020 15:31:20 -0400
Received: from hqnvemgate24.nvidia.com ([216.228.121.143]:16210 "EHLO
        hqnvemgate24.nvidia.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730822AbgIHTbN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Sep 2020 15:31:13 -0400
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
        id <B5f57db770000>; Tue, 08 Sep 2020 12:28:55 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
  by hqpgpgate102.nvidia.com (PGP Universal service);
  Tue, 08 Sep 2020 12:31:09 -0700
X-PGP-Universal: processed;
        by hqpgpgate102.nvidia.com on Tue, 08 Sep 2020 12:31:09 -0700
Received: from [172.20.40.84] (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 8 Sep
 2020 19:31:07 +0000
Subject: Re: [PATCH v4] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Lukas Wunner <lukas@wunner.de>,
        =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Peter Wu <peter@lekensteyn.nl>
References: <c7dcb052-0ccf-dae3-49dd-1518f5ab182e@nvidia.com>
 <20200902173851.224368-1-ddadap@nvidia.com>
 <CAHp75Vf9QV0H+ks3ZbKp13r2qmKAMg-3ooN-O=Ct_fu+fTRo=g@mail.gmail.com>
From:   Daniel Dadap <ddadap@nvidia.com>
Message-ID: <a45f077c-ae07-d67e-e35d-179e6d7af5d3@nvidia.com>
Date:   Tue, 8 Sep 2020 14:33:06 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Vf9QV0H+ks3ZbKp13r2qmKAMg-3ooN-O=Ct_fu+fTRo=g@mail.gmail.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
        t=1599593335; bh=2vQfM2Kn2UTYGd3xsJz5VHuOA9v5wGUqX7ef2CT7e38=;
        h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
         User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
         X-ClientProxiedBy:Content-Type:Content-Transfer-Encoding:
         Content-Language;
        b=aGBePNZks7NEg7No4YztaYSFBHsT5xQn+JCVfJ8FoAaD387ZYJPYUG5FPa+QwuAAb
         1WGYm2kfC8yFNw35DNoBT3hT2mdg+Fk4YzZgjQnh0my96RhwI0vQI6TLetYBMdLHuG
         4q0sK38Hry/bKe79a/3tvxoNhXLnpqHm7tGxyp57FHpZDYNh310kdKhWFE83UYys30
         RFas3jDOiENktPv5vutLsn362IF6heLUGA6m5cObWcO8RqYysaAPLQr4H+HK2psWYR
         MJtlU2ZdUB5XVbIP80bUQRUtWK2h7xpQlm4wJ14SN0byAfXkGDg+R55mwwJrhzlwbJ
         T50qP6toQgy4g==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks. I'm retesting with these changes now; I'll also apply analogous=20
changes where applicable to the other x86 platform driver I have out for=20
review.

On 9/2/20 1:37 PM, Andy Shevchenko wrote:
> External email: Use caution opening links or attachments
>
>
> On Wed, Sep 2, 2020 at 8:37 PM Daniel Dadap <ddadap@nvidia.com> wrote:
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
>> This driver currently only supports systems with Intel integrated
>> graphics and NVIDIA discrete graphics. It will need to be updated if
>> designs are developed using the same interfaces which utilize GPUs
>> from other vendors.
> Thanks for an update. My comments below.
>
>> v2,v3: misc. fixes suggested by Barnab=C3=A1s P=C5=91cze <pobrn@protonma=
il.com>
>> v4: misc. changes suggested by Lukas Wunner <lukas@wunner.de>
> This should go after the cutter '---' line below.
>
>> Signed-off-by: Daniel Dadap <ddadap@nvidia.com>
>> ---
>>   MAINTAINERS                      |   6 +
>>   drivers/platform/x86/Kconfig     |   9 ++
>>   drivers/platform/x86/Makefile    |   2 +
>>   drivers/platform/x86/mxds-gmux.c | 265 +++++++++++++++++++++++++++++++
> ...
>
>> +config MXDS_GMUX
>> +       tristate "ACPI MXDS Gmux Driver"
>> +       depends on ACPI_WMI
>> +       depends on ACPI
> Is not this implied by the above?


Yes, it is.


>
>> +       depends on VGA_SWITCHEROO
>> +       help
>> +         This driver provides support for ACPI-driven gmux devices whic=
h are
>> +         present on some notebook designs with hybrid graphics.
> The stuff in Kconfig and Makefile is grouped and sorted by alphabet in
> each group. Please, follow.


Alright, I hadn't seen any apparent ordering to the items in Kconfig, so=20
I just put the new items at the end. However, looking at the Makefile I=20
can see the grouping. I'm not really certain which of the existing=20
groups this would belong to, as many of them seem to be=20
manufacturer-specific, and this driver applies to hardware that will be=20
available on systems from multiple manufacturers, so I've put it in=20
"Platform drivers" for now; please let me know if there's a better place.


> ...
>
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * mxds-gmux: vga_switcheroo mux handler for ACPI MXDS muxes
> Please, remove the file name from the file.
>
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
> Above should be removed since we use SPDX.


Yes, it's already been pointed out that this is redundant. I wanted to=20
keep it in since the usual guidance for GPL-licensed contributions from=20
NVIDIA is to include the boilerplate text, but it does seem that the=20
SPDX metadata supersedes that guidance, so I'll remove it.


>
>> + */
> ...
>
>> +#include <linux/module.h>
>> +#include <linux/acpi.h>
>> +#include <linux/pci.h>
>> +#include <linux/vga_switcheroo.h>
>> +#include <linux/delay.h>
> Sorted is easier to read.
>
> ...
>
>> +MODULE_LICENSE("GPL v2");
>> +MODULE_DESCRIPTION("vga_switcheroo mux handler for ACPI MXDS muxes");
>> +MODULE_AUTHOR("Daniel Dadap <ddadap@nvidia.com>");
> Usually we put this at the end of the file.
>
>> +/*
>> + * The mux doesn't have its own ACPI HID/CID, or WMI wrapper, so key of=
f of
>> + * the WMI wrapper for the related WMAA method for backlight control.
>> + */
>> +MODULE_ALIAS("wmi:603E9613-EF25-4338-A3D0-C46177516DB7");
> But this one depends.
>
> ...
>
>> +static struct pci_dev *ig_dev, *dg_dev;
>> +static acpi_handle internal_mux_handle;
>> +static acpi_handle external_mux_handle;
> Global variables?! Please get rid of them.


Where would you propose stashing these instead? The vga-switcheroo=20
callbacks this driver registers, whose implementations depend on these=20
globals, don't pass in anything that would be useful for referencing=20
this information. I suppose these could be wrapped in functions or the=20
dev private storage of a struct device that we create just for storing=20
things (it doesn't currently have an associated struct device), but then=20
that struct device would have to be global.


>
> ...
>
>> +enum acpi_method {
>> +       MXDM =3D 0,
>> +       MXDS,
>> +       NUM_ACPI_METHODS
>> +};
> Hmm... any real need for this enum?


I suppose we could just pass in the method name string directly instead.


>
> ...
>
>> +enum mux_state_command {
>> +       MUX_STATE_GET =3D 0,
>> +       MUX_STATE_SET_IGPU =3D BIT(0),
>> +       MUX_STATE_SET_DGPU =3D BIT(4) | BIT(0),
>> +};
> #include <linux/bits.h>
>
> ...
>
>> +static acpi_integer acpi_helper(acpi_handle handle, enum acpi_method me=
thod,
>> +                               acpi_integer action)
>> +{
>> +       union acpi_object arg =3D {
>> +               .integer =3D { .type =3D ACPI_TYPE_INTEGER, .value =3D a=
ction }
>> +       };
>> +       struct acpi_object_list in =3D {.count =3D 1, .pointer =3D &arg}=
;
> Be consistent with spaces surrounding the structure content.
>
>> +       acpi_integer ret;
>> +       acpi_status status;
>> +
>> +       status =3D acpi_evaluate_integer(handle, acpi_methods[method], &=
in, &ret);
>> +
> Redundant blank line.
>
>> +       if (ACPI_FAILURE(status)) {
>> +               pr_err("ACPI %s failed: %s\n", acpi_methods[method],
>> +                       acpi_format_exception(status));
> Why not acpi_handle_err() ?


Indeed. That was the only use of the pr_*() macros, so I've also removed=20
the pr_fmt #define.


>> +               return 0;
>> +       }
>> +
>> +       return ret;
>> +}
> ...
>
>> +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
>> +       struct pci_dev *dev)
> One line, please.


Sure. I was just trying to keep under 80 characters, and didn't notice=20
that the code in drivers/platform/x86 doesn't keep to the 80 character=20
limit.


>
> ...
>
>> +static acpi_status find_acpi_methods(
>> +       acpi_handle object, u32 nesting_level, void *context,
>> +       void **return_value)
> Fix indentation here as well.
>
> ...
>
>> +static int __init mxds_gmux_init(void)
>> +{
>> +       int ret =3D 0;
>> +       struct pci_dev *dev =3D NULL;
> Redundant assignment. And keep it in reversed xmas tree order.


Not redundant. It needs to be NULL for the first iteration of the while=20
loop, since pci_get_class() takes it as an argument for the previous=20
result. The other assignment here for ret, however, does become=20
redundant after changing the goto cleanup flow.


>
>> +       /* Currently only supports Intel integrated and NVIDIA discrete =
GPUs */
>> +       while ((dev =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev)))=
 {
> (Mostly as TODO for somebody else)
> arch/alpha/kernel/console.c-47-
> arch/x86/kernel/sysfb_efi.c-117-
> drivers/acpi/acpi_video.c-2139-
> drivers/gpu/drm/amd/amdgpu/amdgpu_atpx_handler.c:616
> drivers/gpu/drm/amd/amdgpu/amdgpu_bios.c:288
> drivers/gpu/drm/i915/display/intel_acpi.c:136
> drivers/gpu/drm/nouveau/nouveau_acpi.c:284
> drivers/gpu/drm/radeon/radeon_bios.c:202
> drivers/vfio/pci/vfio_pci.c:136
> sound/pci/hda/hda_intel.c:1434
>
> (slightly different story) drivers/gpu/drm/qxl/qxl_drv.c-67-static
> drivers/vfio/pci/vfio_pci.c-153-static
>
> So, what  I think is better to do in this case is
>
> #define for_each_pci_vga(dev) ...
>
> in pci.h (at least here for the future use)
>
>> +       /* Require both integrated and discrete GPUs */
>> +       if (!ig_dev || !dg_dev) {
>> +               ret =3D -ENODEV;
>> +               goto done;
>> +       }
>> +
>> +       acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT, ACPI_UIN=
T32_MAX,
>> +               find_acpi_methods, NULL, NULL, NULL);
> It's a bit too much. Can we reduce scope somehow?


Yeah, we can start at the dGPU's ACPI node, since that's where these=20
methods are implemented, and walk with depth 2. If that's still too=20
broad, we can retrieve the _DOD table from the dGPU and then walk each=20
child of the dGPU's ACPI node that occurs in _DOD with depth 1.


>
>> +       /* Require at least one mux */
>> +       if (!internal_mux_handle && !external_mux_handle) {
>> +               ret =3D -ENODEV;
>> +               goto done;
>> +       }
>> +
>> +       ret =3D vga_switcheroo_register_handler(&handler, 0);
>> +
>> +done:
>> +
>> +       if (ret) {
>> +               pci_dev_put(ig_dev);
>> +               pci_dev_put(dg_dev);
>> +       }
>> +
>> +       return ret;
> Can we use usual pattern:
>
>    ret =3D ...
>    if (ret)
>      goto error_put_devices;
> https://wiki.nvidia.com/nvwiki/index.php/SW_IP_Audit_Team/Licenses
>    return 0;
>
> error_put_devices:
>      pci_dev_put(ig_dev);
>      pci_dev_put(dg_dev);
>      return ret;
>
> ?
>
>> +}
>> +module_init(mxds_gmux_init);
>> +
>> +static void __exit mxds_gmux_exit(void)
>> +{
>> +       vga_switcheroo_unregister_handler();
>> +       pci_dev_put(ig_dev);
>> +       pci_dev_put(dg_dev);
>> +}
>> +module_exit(mxds_gmux_exit);
>
> --
> With Best Regards,
> Andy Shevchenko
