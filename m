Return-Path: <platform-driver-x86+bounces-193-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 704ED7FF38B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 16:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0FF5AB20A96
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Nov 2023 15:25:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6BEE851C53;
	Thu, 30 Nov 2023 15:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hViqtfpP"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A97710D5;
	Thu, 30 Nov 2023 07:25:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701357943; x=1732893943;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version:content-id;
  bh=4NUcRApeHAyahOhS8cxwsZnnTdjEBwRcaIXLlPqZAjY=;
  b=hViqtfpPQPuQS20LgyMMQa8syK3gxW6obW/fOZDM07jTTc3JxTkcBItv
   6UK6Zoz435WOZ0isXdglWR7eUeeKiaPy7a9PhCYwLrfUxOyDiuvHlQ6X/
   GEOgm8VZHrDYHEMW9VNLqnUxcWzBVXRNmp03mQjgMXpA/fF9KcdELAtpn
   /yV2PgDbQmgIbsA4ALj7jZ6o7FxKcJXVV3mu9udb688WhsJ2jE92Za2D/
   CRnLLmBAYR77MDH6w5RYlE9XCG3yf7rs7OfD9H3KW0NidVJ+ADiVkfv9o
   XBQTjUJQza8FUklnkvH7EO3qxVmL8b9ojXkunsGr9FCCDdU1wfYIIqHQC
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="383735190"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="383735190"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:25:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="769341983"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="769341983"
Received: from bergler-mobl.ger.corp.intel.com ([10.249.33.30])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 07:25:40 -0800
Date: Thu, 30 Nov 2023 17:25:34 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: Kunwu Chan <chentao@kylinos.cn>, vadimp@nvidia.com
cc: Hans de Goede <hdegoede@redhat.com>, jiri@resnulli.us, 
    shravankr@nvidia.com, kunwu.chan@hotmail.com, 
    platform-driver-x86@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] platform/mellanox: Add a null pointer check in
 mlxbf_pmc_create_groups
In-Reply-To: <bf29c39f-8d9f-465a-bbc2-45bdb77711b8@kylinos.cn>
Message-ID: <55c5987b-c991-aa8-a226-c5b1638b474@linux.intel.com>
References: <20231127063433.1549064-1-chentao@kylinos.cn> <1701224213463629.329.seg@mailgw> <bf29c39f-8d9f-465a-bbc2-45bdb77711b8@kylinos.cn>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; BOUNDARY="8323329-2122611288-1701354616=:1808"
Content-ID: <4c35a37-a862-6055-355-8f5ef74463db@linux.intel.com>

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-2122611288-1701354616=:1808
Content-Type: text/plain; CHARSET=UTF-8
Content-Transfer-Encoding: 8BIT
Content-ID: <93e0c718-4167-6586-d19-4f43d4bf7421@linux.intel.com>

Hi Vadim,

Could you please take a look at this and give advice to Kunwu so we can 
get all of them squashed in one go.

On Thu, 30 Nov 2023, Kunwu Chan wrote:

> Thanks for your reply.
> 
> Cause i don't know how to deal with in some scenario，such as in
> 'mlxbf_pmc_init_perftype_counter', when 'attr->dev_attr.attr.name' is null,
> should return '-ENOMEM' or 'continue' the loop?

I'd have thought returning -ENOMEM would be safe because it just ends up 
failing probe()? ...And it's not that likely to occur in the first place.

-- 
 i.

> 
> So I'm going to solve it one by one.
> 
> Thanks again,
> Kunwu
> 
> On 2023/11/28 17:51, Ilpo Järvinen wrote:
> > On Mon, 27 Nov 2023, Kunwu Chan wrote:
> > 
> > > devm_kasprintf() returns a pointer to dynamically allocated memory
> > > which can be NULL upon failure.
> > > 
> > > Fixes: 1a218d312e65 ("platform/mellanox: mlxbf-pmc: Add Mellanox BlueField
> > > PMC driver")
> > > Signed-off-by: Kunwu Chan <chentao@kylinos.cn>
> > > ---
> > >   drivers/platform/mellanox/mlxbf-pmc.c | 2 ++
> > >   1 file changed, 2 insertions(+)
> > > 
> > > diff --git a/drivers/platform/mellanox/mlxbf-pmc.c
> > > b/drivers/platform/mellanox/mlxbf-pmc.c
> > > index 0b427fc24a96..59bbe5e13f6b 100644
> > > --- a/drivers/platform/mellanox/mlxbf-pmc.c
> > > +++ b/drivers/platform/mellanox/mlxbf-pmc.c
> > > @@ -1882,6 +1882,8 @@ static int mlxbf_pmc_create_groups(struct device
> > > *dev, int blk_num)
> > >   	pmc->block[blk_num].block_attr_grp.attrs =
> > > pmc->block[blk_num].block_attr;
> > >   	pmc->block[blk_num].block_attr_grp.name = devm_kasprintf(
> > >   		dev, GFP_KERNEL, pmc->block_name[blk_num]);
> > > +	if (!pmc->block[blk_num].block_attr_grp.name)
> > > +		return -ENOMEM;
> > >   	pmc->groups[pmc->group_num] = &pmc->block[blk_num].block_attr_grp;
> > >   	pmc->group_num++;
> > 
> > I'm totally lost, why did you fix only one devm_kasprintf() location?
> > Don't all of them need this check?
> > 
> 
--8323329-2122611288-1701354616=:1808--

