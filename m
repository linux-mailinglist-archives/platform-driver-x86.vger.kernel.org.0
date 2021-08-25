Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D36273F76B0
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Aug 2021 15:59:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239601AbhHYOAg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Aug 2021 10:00:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232058AbhHYOAg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Aug 2021 10:00:36 -0400
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [IPv6:2001:4b98:dc2:55:216:3eff:fef7:d647])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 558AEC061757;
        Wed, 25 Aug 2021 06:59:50 -0700 (PDT)
Received: from pendragon.ideasonboard.com (62-78-145-57.bb.dnainternet.fi [62.78.145.57])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 6440C24F;
        Wed, 25 Aug 2021 15:59:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1629899987;
        bh=lAmUs2tEJMT77bx/hltss4KbUysanylpuQF7pGqzjI8=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=W/KpBlPGtnBk7vh4xNcqJn+SPcuecSu9D8RHULsAnQOfc7Byhh2czJeuH1ioEeBSi
         XvGveC5Arnp8bgsmcMIQyHs3xmjKNF9NH/YvI6SPSJ3aviDmCkh7mSer25sEjE0Old
         9lejdGCJD4QLhkuKtKwqRql2hDb3sRICevYNpW0M=
Date:   Wed, 25 Aug 2021 16:59:35 +0300
From:   Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To:     Mark Brown <broonie@kernel.org>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Scally <djrscally@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Kieran Bingham <kieran.bingham@ideasonboard.com>,
        sailues@pendragon.ideasonboard.com
Subject: Re: [RFC PATCH v2 1/3] regulator: core: Add regulator_lookup_list
Message-ID: <YSZMxxJ76vF316Pi@pendragon.ideasonboard.com>
References: <20210824230620.1003828-1-djrscally@gmail.com>
 <20210824230620.1003828-2-djrscally@gmail.com>
 <20210825103301.GC5186@sirena.org.uk>
 <CAHp75VdHpjbjz4biTP11TKT6J+7WQi-a1Ru3VLuSxM5tSLCB3Q@mail.gmail.com>
 <20210825113013.GD5186@sirena.org.uk>
 <CAHp75VfKJgux8k_mPauYB3MHcEOcnnzhSpoUDi4mVFDgtmNXeg@mail.gmail.com>
 <20210825131139.GG5186@sirena.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210825131139.GG5186@sirena.org.uk>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

CC'ing Sakari.

On Wed, Aug 25, 2021 at 02:11:39PM +0100, Mark Brown wrote:
> On Wed, Aug 25, 2021 at 03:26:37PM +0300, Andy Shevchenko wrote:
> > On Wed, Aug 25, 2021 at 2:30 PM Mark Brown <broonie@kernel.org> wrote:
> 
> > > No, what was proposed for regulator was to duplicate all the the DT
> > > binding code in the regulator framework so it parses fwnodes then have
> > > an API for encoding fwnodes from C data structures at runtime.  The bit
> > > where the data gets joined up with the devices isn't the problem, it's
> > > the duplication and fragility introduced by encoding everything into
> > > an intermediate representation that has no purpose and passing that
> > > around which is the problem.
> 
> > The whole exercise with swnode is to minimize the driver intrusion and
> > evolving a unified way for (some) of the device properties. V4L2 won't
> 
> The practical implementation for regulators was to duplicate a
> substantial amount of code in the core in order to give us a less type
> safe and more indirect way of passing data from onen C file in the
> kernel to another.  This proposal is a lot better in that it uses the
> existing init_data and avoids the huge amounts of duplication, it's just
> not clear from the changelog why it's doing this in a regulator specific
> manner.
> 
> *Please* stop trying to force swnodes in everywhere, take on board the
> feedback about why the swnode implementation is completely inappropriate
> for regulators.  I don't understand why you continue to push this so
> hard.  swnodes and fwnodes are a solution to a specific problem, they're
> not the answer to every problem out there and having to rehash this
> continually is getting in the way of actually discussing practical
> workarounds for these poorly implemented ACPI platforms.
> 
> > like what you are suggesting exactly because they don't like the idea
> > of spreading the board code over the drivers. In some cases it might
> > even be not so straightforward and easy.
> 
> > Laurent, do I understand correctly the v4l2 expectations?
> 
> There will be some cases where swnodes make sense, for example where the
> data is going to be read through the fwnode API since the binding is
> firmware neutral which I think is the v4l case.  On the other hand
> having a direct C representation is a very common way of implementing
> DMI quirk tables, and we have things like the regulator API where
> there's off the shelf platform data support and we actively don't want
> to support fwnode.

From a camera sensor point of view, we want to avoid code duplication.
Having to look for regulators using OF lookups *and* platform data in
every single sensor driver is not a good solution. This means that, from
a camera sensor driver point of view, we want to call regulator_get()
(or the devm_ version) with a name, without caring about who establishes
the mapping and how the lookup is performed. I don't care much
personally if this would be implemented through swnode or a different
mechanism, as long as the implementation can be centralized.

-- 
Regards,

Laurent Pinchart
