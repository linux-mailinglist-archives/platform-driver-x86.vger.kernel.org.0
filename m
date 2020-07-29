Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 52A95232575
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Jul 2020 21:32:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726615AbgG2Tck (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Jul 2020 15:32:40 -0400
Received: from mail-40135.protonmail.ch ([185.70.40.135]:63792 "EHLO
        mail-40135.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726588AbgG2Tcj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Jul 2020 15:32:39 -0400
Date:   Wed, 29 Jul 2020 19:32:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1596051157;
        bh=fiCUCFVa8gOfQrjCKuPuCRUqf5tjBFjQgSdjyL7Xkqc=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=u6bYnTJfm6DDG0EmfukiIdJvPzT1/BdN3yi3sa7NUtwRoENoYVlDzChErJcn4KYnk
         gRB/dM6rg725gfgzenrrepWtrTdwvloFQfQ16mn9VTCCLjbLfiD/PTCt2/FiJgcO2H
         wLPXCvDJDHhH5g8zpC6qU1/Qgf60qUQZ1oUYBI6Y=
To:     Daniel Dadap <ddadap@nvidia.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] platform/x86: Add new vga-switcheroo gmux driver for ACPI-driven muxes
Message-ID: <GoKyhrM1luIoUi_fRRWN3J3azOQGamWW7m4iEHqHHdhknqefRiKx3UcPNG2fr4Ff2HT2AYBD1Az8mKscizjLo7dpzsvQZFkTWznSfti5Xy8=@protonmail.com>
In-Reply-To: <20200729171151.18426-1-ddadap@nvidia.com>
References: <78a56eca-f0e3-3520-f3d5-1222b54f6fe9@nvidia.com> <20200729171151.18426-1-ddadap@nvidia.com>
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

2020. j=C3=BAlius 29., szerda 19:11 keltez=C3=A9ssel, Daniel Dadap <ddadap@=
nvidia.com> =C3=ADrta:

> [...]

I think

#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt

(or similar)

should be defined before any includes since you use pr_*().
Otherwise the messages won't be prefixed by the module name.


> +#include <linux/module.h>
> +#include <linux/acpi.h>
> +#include <linux/pci.h>
> +#include <linux/vga_switcheroo.h>
> +#include <linux/delay.h>
> +
> [...]
> +static void set_mux_state(acpi_handle handle, enum mux_state_command com=
mand)
> +{
> +=09acpi_helper(handle, MXDS, command);
> +}
> +

It's really a nitpick and a moot point, but I'd think set_mux_state() takes=
 the state as
one of its arguments, not the command to set that state.


> [...]
> +static int __init mxds_gmux_init(void)
> +{
> +=09int ret =3D 0;
> +=09struct pci_dev *dev =3D NULL;
> +
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

I think I mentioned it last time, I personally dislike magic numbers,
so I'd use PCI_VENDOR_ID_{INTEL,NVIDIA} from <linux/pci_ids.h> here, but
I guess it's personal preference, so I don't want to bother you with that
anymore. If you use magic numbers, then I think comments would be much
appreciated.


> [...]
> +static void __exit mxds_gmux_exit(void)
> +{
> +=09if (vga_switcheroo_registered)
> +=09=09vga_switcheroo_unregister_handler();

The exit method of a module will not be run if it fails to load,
so I think "vga_switcheroo_registered" is not necessary.


> +=09pci_dev_put(ig_dev);
> +=09pci_dev_put(dg_dev);
> +}
> +module_exit(mxds_gmux_exit);
> --
> 2.18.4


Barnab=C3=A1s P=C5=91cze
