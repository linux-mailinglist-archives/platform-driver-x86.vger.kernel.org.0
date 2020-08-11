Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9EE03241564
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Aug 2020 05:43:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727820AbgHKDnF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 10 Aug 2020 23:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727819AbgHKDnF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 10 Aug 2020 23:43:05 -0400
X-Greylist: delayed 68705 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 10 Aug 2020 20:43:05 PDT
Received: from bmailout3.hostsharing.net (bmailout3.hostsharing.net [IPv6:2a01:4f8:150:2161:1:b009:f23e:0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 33BF3C06174A
        for <platform-driver-x86@vger.kernel.org>; Mon, 10 Aug 2020 20:43:05 -0700 (PDT)
Received: from h08.hostsharing.net (h08.hostsharing.net [IPv6:2a01:37:1000::53df:5f1c:0])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (Client CN "*.hostsharing.net", Issuer "COMODO RSA Domain Validation Secure Server CA" (not verified))
        by bmailout3.hostsharing.net (Postfix) with ESMTPS id 2ADF810059572;
        Tue, 11 Aug 2020 05:43:02 +0200 (CEST)
Received: by h08.hostsharing.net (Postfix, from userid 100393)
        id D90A0FAB51; Tue, 11 Aug 2020 05:43:01 +0200 (CEST)
Date:   Tue, 11 Aug 2020 05:43:01 +0200
From:   Lukas Wunner <lukas@wunner.de>
To:     Daniel Dadap <ddadap@nvidia.com>
Cc:     platform-driver-x86@vger.kernel.org, pobrn@protonmail.com,
        andy@infradead.org, dvhart@infradead.org,
        dri-devel@lists.freedesktop.org, peter@lekensteyn.nl
Subject: Re: [PATCH v3] platform/x86: Add new vga-switcheroo gmux driver for
 ACPI-driven muxes
Message-ID: <20200811034301.nlhue4xgfv4p3utr@wunner.de>
References: <0850ac9a-3d60-053d-1d70-5f20ce621b24@nvidia.com>
 <20200729210557.9195-1-ddadap@nvidia.com>
 <20200810083757.2jbwebbvocqe5rle@wunner.de>
 <c7b1b098-a0ef-6e78-92c1-32da9b4ea3f3@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c7b1b098-a0ef-6e78-92c1-32da9b4ea3f3@nvidia.com>
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Aug 10, 2020 at 01:44:58PM -0500, Daniel Dadap wrote:
> On 8/10/20 3:37 AM, Lukas Wunner wrote:
> > On Wed, Jul 29, 2020 at 04:05:57PM -0500, Daniel Dadap wrote:
> > > + * Call MXDS with bit 0 set to change the current state.
> > > + * When changing state, clear bit 4 for iGPU and set bit 4 for dGPU.
> > [...]
> > > +enum mux_state_command {
> > > +     MUX_STATE_GET = 0,
> > > +     MUX_STATE_SET_IGPU = 0x01,
> > > +     MUX_STATE_SET_DGPU = 0x11,
> > > +};
> > It looks like the code comment is wrong and bit 1 (instead of bit 4) is
> > used to select the GPU.
> 
> The code comment is correct. The enum values are hexadecimal, not binary.

Ugh, missed that, sorry for the noise.

> Would it be clearer to write it out as something like 0 << 4 & 1 << 0 for
> MUX_STATE_SET_IGPU and 1 << 4 & 1 << 0 for MUX_STATE_SET_DGPU?

BIT(4) | BIT(0) might be clearer, but that gives you an unsigned long
and I'm not sure if gcc accepts that as an enum (=int) initializer.

> > > +static enum vga_switcheroo_client_id mxds_gmux_get_client_id(
> > > +     struct pci_dev *dev)
> > > +{
> > > +     if (dev) {
> > > +             if (ig_dev && dev->vendor == ig_dev->vendor)
> > > +                     return VGA_SWITCHEROO_IGD;
> > > +             if (dg_dev && dev->vendor == dg_dev->vendor)
> > > +                     return VGA_SWITCHEROO_DIS;
> > > +     }
> > That's a little odd.  Why not use "ig_dev == dev" and "dg_dev == dev"?
> 
> No reason; that is indeed better. I think originally these comparisons got a
> vendor ID from some other means.

Perhaps it was necessary in case an eGPU is attached, but that shouldn't
be an issue if you filter out Thunderbolt devices with
pci_is_thunderbolt_attached().

> Yes, MXMX and MXDS go back a ways, it seems. I'm not familiar enough with
> the MXMX+MXDS designs to know if MXDS uses the same API in those designs as
> it doesn in the MXDM+MXDS designs. I'm not aware of any already available
> designs with MXDM. MXMX was used for switching DDC lines independently back
> when LVDS panels were the norm. The upcoming MXDM+MXDS designs are eDP-based
> and do not support independent DDC muxing.

Interesting, thank you for the explanation.

Lukas
