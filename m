Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 45EB023FF01
	for <lists+platform-driver-x86@lfdr.de>; Sun,  9 Aug 2020 17:21:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgHIPV5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 9 Aug 2020 11:21:57 -0400
Received: from bmailout2.hostsharing.net ([83.223.78.240]:41683 "EHLO
        bmailout2.hostsharing.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726175AbgHIPV5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Aug 2020 11:21:57 -0400
Received: from h08.hostsharing.net (h08.hostsharing.net [83.223.95.28])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout2.hostsharing.net (Postfix) with ESMTPS id E25CB28007E15;
        Sun,  9 Aug 2020 17:21:34 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id AE84A9EA; Sun,  9 Aug 2020 17:21:34 +0200 (CEST)
Date:   Sun, 9 Aug 2020 17:21:34 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     =?iso-8859-1?Q?Barnab=E1s?= P??cze <pobrn@protonmail.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
Subject: Re: [PATCH] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
Message-ID: <20200809152134.fovcomvvqlb2pso4@wunner.de>
References: <20200727205752.28224-1-ddadap@nvidia.com>
 <OZ6ZQHG1FUrYVeq4WcEmCVJICyUzTAglUv2n5kB0QV1Fd2jodRhmB3jI9F2tPgPDcFbbdPNU9DnJaeousfdWl46UqgKIvb_aIM_hg-fyb8k=@protonmail.com>
 <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1a760896-171f-e2d3-241f-e7b5fec51929@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 28, 2020 at 10:17:19PM -0500, Daniel Dadap wrote:
> On 7/27/20 7:11 PM, Barnabás P??cze wrote:
> > > +     while ((dev = pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, dev))) {
> > > +             switch (dev->vendor) {
> > > +             case 0x8086:
> > > +                     pci_dev_put(ig_dev);
> > > +                     ig_dev = pci_dev_get(dev);
> > > +                     break;
> > > +             case 0x10de:
> > > +                     pci_dev_put(dg_dev);
> > > +                     dg_dev = pci_dev_get(dev);
> > > +                     break;
> > > +             default:
> > > +                     break;
> > > +             }
> > > +     }
> > > +
> > 
> > Regardless of how improbable, I am wondering what happens if an
> > external GPU is connected to a dual-GPU laptop? Cannot that
> > interfere with this device lookup logic?
> 
> I don't think it'll be a problem, since an external GPU won't have an
> implementation of the MXDM/MXDS methods in its associated ACPI node, so even
> if the eGPU is plugged in at the time this module loads, it should fail to
> initialize unless there is also an internal discrete GPU which does support
> MXDM/MXDS.

Still, dg_dev may point to the wrong device.  You can avoid it by
adding the following at the top of the while loop:

		if (pci_is_thunderbolt_attached(dev))
			continue;

Thanks,

Lukas
