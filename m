Return-Path: <platform-driver-x86+bounces-13144-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 19256AEE884
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jun 2025 22:47:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 1F1E9189E8E0
	for <lists+platform-driver-x86@lfdr.de>; Mon, 30 Jun 2025 20:48:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BB477156678;
	Mon, 30 Jun 2025 20:47:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l0Yr/pB6"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5676149620;
	Mon, 30 Jun 2025 20:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751316460; cv=none; b=EizoBS16SijGzbIfp875rLO/xjDv/xgnrChtZK0Bw2fArAra9qc5Ydv9U0I/HHlobsKOPrxiAy8IQdiSf7ynCize/ZYL4+lL1DoIFvASXJAoFXK+7Dp33n1YbOOtQdEmG5v5ZpsICI34z8ZyJQVoRZxRfdeXOtM7FPzXVPZiCkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751316460; c=relaxed/simple;
	bh=oNquZK1HnRmZjb7ZRYom7qqktMBdhoa1erfLwxtyV5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TT52IvApNxFmbAfOQ5t22/WBcWfMpT5aLZbe4lZj3rZfloz+J35HgsaqW5y9y0zfg7215r4kScBCYFwU/Sy0Qe7V0W027OgZfbYkNU5Y3pHlykg4Tz0hutnon4/j/ezQT02inwwuObLr6VaNQ7pfpSHfazc/AfN6BkoioWsbCWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l0Yr/pB6; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751316458; x=1782852458;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=oNquZK1HnRmZjb7ZRYom7qqktMBdhoa1erfLwxtyV5E=;
  b=l0Yr/pB6Nri6dR11vd7AKuyCZ3fqYzVWi9uHpDZNHkAQ+jBlAwLVa315
   i/dYwz0CBnjV6wF3omWRdZcPfZv7yKPy3NaD7Q2rN7uYQXbcw8Ya5t5w4
   fntO0x9hnkukTBeb0z01hr94qbDYEha+qc2aXIbs0uWik8RIzdshLS3/D
   FO6KFMnY0x2sedjzMQnhUGYWStfwvS1vVPgHCmtEfsHPzWr06lE2kn+/x
   wCgOMn8XywdPojw1MHU7dhUsJzGlap1enAkbh+7yaYNV7SEcN0iRoBi1Z
   ysi+ykC1XUqzdh86X8dqa5KV0QcW0mKZuph+wd30B2lyog/vjihlzWW0w
   g==;
X-CSE-ConnectionGUID: Cx2NvY4hSj6WchcAbVpynw==
X-CSE-MsgGUID: evWWp3FzSfGSBWdiGVQVrg==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="64608840"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="64608840"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:47:36 -0700
X-CSE-ConnectionGUID: V9HLrmyIQV+u4+oKa/dyYw==
X-CSE-MsgGUID: 0i7QkBjtQvKJAz28MhXEMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; 
   d="scan'208";a="152948433"
Received: from ldmartin-desk2.corp.intel.com (HELO localhost) ([10.124.221.227])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jun 2025 13:47:37 -0700
Date: Mon, 30 Jun 2025 13:47:35 -0700
From: David Box <david.e.box@linux.intel.com>
To: Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, srinivas.pandruvada@linux.intel.com, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, tony.luck@intel.com, xi.pardee@linux.intel.com, 
	Hans de Goede <hdegoede@redhat.com>
Subject: Re: [PATCH V2 04/15] platform/x86/intel/vsec: Add device links to
 enforce dependencies
Message-ID: <cz76fcobnr6yxxw7pvhm25x7t54p66etiulhosjdfdx5td6g66@746chufy67uj>
References: <20250617014041.2861032-1-david.e.box@linux.intel.com>
 <20250617014041.2861032-5-david.e.box@linux.intel.com>
 <8ccfd660-791a-6cf1-2982-b4f09ae6d3e1@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8ccfd660-791a-6cf1-2982-b4f09ae6d3e1@linux.intel.com>

On Mon, Jun 30, 2025 at 03:06:38PM +0300, Ilpo Järvinen wrote:
> On Mon, 16 Jun 2025, David E. Box wrote:
> 
> > New Intel VSEC features will have dependencies on other features, requiring
> > certain supplier drivers to be probed before their consumers. To enforce
> > this dependency ordering, introduce device links using device_link_add(),
> > ensuring that suppliers are fully registered before consumers are probed.
> > 
> > - Add device link tracking by storing supplier devices and tracking their
> >   state.
> > - Implement intel_vsec_link_devices() to establish links between suppliers
> >   and consumers based on feature dependencies.
> > - Add get_consumer_dependencies() to retrieve supplier-consumer
> >   relationships.
> > - Modify feature registration logic:
> >   * Consumers now check that all required suppliers are registered before
> >     being initialized.
> >   * suppliers_ready() verifies that all required supplier devices are
> >     available.
> > - Prevent potential null consumer name issue in sysfs:
> >   - Use dev_set_name() when creating auxiliary devices to ensure a
> >     unique, non-null consumer name.
> > - Update intel_vsec_pci_probe() to loop up to the number of possible
> >   features or when all devices are registered, whichever comes first.
> > - Introduce VSEC_CAP_UNUSED to prevent sub-features (registered via
> >   exported APIs) from being mistakenly linked.
> > 
> > Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> > ---
> > 
> > Changes in v2:
> >   - Simply dependency search in get_consumer_dependencies() per comments
> >     from Ilpo.
> >   - Add rollback for auxiliary_device_uninit() in intel_vsec_add_aux().
> >   - In suppliers_ready() clarify that for_each_set_bit() is searching for
> >     all *ready* suppliers, not all suppliers. If any is not ready and not
> >     ignored, it immediately returns.
> >   - In suppliers_ready() check device_link_add() return status.
> >   - In intel_vsec_probe() uses info->caps consistently.
> >   - Fix spelling errors and remove unrelated changes.
> > 
> >  drivers/platform/x86/intel/vsec.c | 219 ++++++++++++++++++++++++++++--
> >  include/linux/intel_vsec.h        |  28 +++-
> >  2 files changed, 232 insertions(+), 15 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/vsec.c b/drivers/platform/x86/intel/vsec.c
> > index f01651f498ca..e497b570f814 100644
> > --- a/drivers/platform/x86/intel/vsec.c
> > +++ b/drivers/platform/x86/intel/vsec.c
> > @@ -15,9 +15,11 @@
> >  
> >  #include <linux/auxiliary_bus.h>
> >  #include <linux/bits.h>
> > +#include <linux/bitops.h>
> >  #include <linux/cleanup.h>
> >  #include <linux/delay.h>
> >  #include <linux/idr.h>
> > +#include <linux/log2.h>
> >  #include <linux/intel_vsec.h>
> >  #include <linux/kernel.h>
> >  #include <linux/module.h>
> > @@ -32,8 +34,17 @@ static DEFINE_IDA(intel_vsec_ida);
> >  static DEFINE_IDA(intel_vsec_sdsi_ida);
> >  static DEFINE_XARRAY_ALLOC(auxdev_array);
> >  
> > +enum vsec_device_state {
> > +	STATE_NOT_FOUND,
> > +	STATE_REGISTERED,
> > +	STATE_SKIP,
> > +};
> > +
> >  struct vsec_priv {
> >  	struct intel_vsec_platform_info *info;
> > +	struct device *suppliers[VSEC_FEATURE_COUNT];
> > +	enum vsec_device_state state[VSEC_FEATURE_COUNT];
> > +	unsigned long found_caps;
> >  };
> >  
> >  static const char *intel_vsec_name(enum intel_vsec_id id)
> > @@ -95,6 +106,74 @@ static void intel_vsec_dev_release(struct device *dev)
> >  	kfree(intel_vsec_dev);
> >  }
> >  
> > +static const struct vsec_feature_dependency *
> > +get_consumer_dependencies(struct vsec_priv *priv, int cap_id)
> > +{
> > +	const struct vsec_feature_dependency *deps = priv->info->deps;
> > +	int consumer_id = priv->info->num_deps;
> > +
> > +	if (!deps)
> > +		return NULL;
> > +
> > +	while (consumer_id--)
> > +		if (deps[consumer_id].feature == BIT(cap_id))
> > +			return &deps[consumer_id];
> > +
> > +	return NULL;
> > +}
> > +
> > +/*
> > + * Although pci_device_id table is available in the pdev, this prototype is
> > + * necessary because the code using it can be called by an exported API that
> > + * might pass a different pdev.
> > + */
> > +static const struct pci_device_id intel_vsec_pci_ids[];
> > +
> > +static int intel_vsec_link_devices(struct pci_dev *pdev, struct device *dev,
> > +				   int consumer_id)
> > +{
> > +	const struct vsec_feature_dependency *deps;
> > +	enum vsec_device_state *state;
> > +	struct device **suppliers;
> > +	struct vsec_priv *priv;
> > +	int supplier_id;
> > +
> > +	if (!consumer_id)
> > +		return 0;
> > +
> > +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> > +		return 0;
> > +
> > +	priv = pci_get_drvdata(pdev);
> > +	state = priv->state;
> > +	suppliers = priv->suppliers;
> > +
> > +	priv->suppliers[consumer_id] = dev;
> > +
> > +	deps = get_consumer_dependencies(priv, consumer_id);
> > +	if (!deps)
> > +		return 0;
> > +
> > +	for_each_set_bit(supplier_id, &deps->supplier_bitmap, VSEC_FEATURE_COUNT) {
> > +		struct device_link *link;
> > +
> > +		if (state[supplier_id] != STATE_REGISTERED)
> > +			continue;
> > +
> > +		if (!suppliers[supplier_id]) {
> > +			dev_err(dev, "Bad supplier list\n");
> > +			return -EINVAL;
> > +		}
> > +
> > +		link = device_link_add(dev, suppliers[supplier_id],
> > +				       DL_FLAG_AUTOPROBE_CONSUMER);
> > +		if (!link)
> > +			return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> >  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> >  		       struct intel_vsec_device *intel_vsec_dev,
> >  		       const char *name)
> > @@ -132,19 +211,37 @@ int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> >  		return ret;
> >  	}
> >  
> > +	/*
> > +	 * Assign a name now to ensure that the device link doesn't contain
> > +	 * a null string for the consumer name. This is a problem when a supplier
> > +	 * supplies more than one consumer and can lead to a duplicate name error
> > +	 * when the link is created in sysfs.
> > +	 */
> > +	ret = dev_set_name(&auxdev->dev, "%s.%s.%d", KBUILD_MODNAME, auxdev->name,
> > +			   auxdev->id);
> > +	if (ret)
> > +		goto cleanup_aux;
> > +
> > +	ret = intel_vsec_link_devices(pdev, &auxdev->dev, intel_vsec_dev->cap_id);
> > +	if (ret)
> > +		goto cleanup_aux;
> > +
> >  	ret = auxiliary_device_add(auxdev);
> > -	if (ret < 0) {
> > -		auxiliary_device_uninit(auxdev);
> > -		return ret;
> > -	}
> > +	if (ret)
> > +		goto cleanup_aux;
> >  
> >  	return devm_add_action_or_reset(parent, intel_vsec_remove_aux,
> >  				       auxdev);
> > +
> > +cleanup_aux:
> > +	auxiliary_device_uninit(auxdev);
> > +	return ret;
> >  }
> >  EXPORT_SYMBOL_NS_GPL(intel_vsec_add_aux, "INTEL_VSEC");
> >  
> >  static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *header,
> > -			      struct intel_vsec_platform_info *info)
> > +			      struct intel_vsec_platform_info *info,
> > +			      unsigned long cap_id)
> >  {
> >  	struct intel_vsec_device __free(kfree) *intel_vsec_dev = NULL;
> >  	struct resource __free(kfree) *res = NULL;
> > @@ -211,6 +308,7 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
> >  	intel_vsec_dev->quirks = info->quirks;
> >  	intel_vsec_dev->base_addr = info->base_addr;
> >  	intel_vsec_dev->priv_data = info->priv_data;
> > +	intel_vsec_dev->cap_id = cap_id;
> >  
> >  	if (header->id == VSEC_ID_SDSI)
> >  		intel_vsec_dev->ida = &intel_vsec_sdsi_ida;
> > @@ -225,6 +323,101 @@ static int intel_vsec_add_dev(struct pci_dev *pdev, struct intel_vsec_header *he
> >  				  intel_vsec_name(header->id));
> >  }
> >  
> > +static bool suppliers_ready(struct vsec_priv *priv,
> > +			    const struct vsec_feature_dependency *consumer_deps,
> > +			    int cap_id)
> > +{
> > +	enum vsec_device_state *state = priv->state;
> > +	int supplier_id;
> > +
> > +	if (consumer_deps->feature != BIT(cap_id))
> > +		return false; /* Should not happen */
> 
> I don't recall if I asked this already, but does the comment imply this is 
> an error on the caller side warranting using WARN_ON_ONCE()?
>

Yeah, it would. This would indicate a bug in the driver itself.
get_consumer_dependencies() already filters by cap_id, so if suppliers_ready()
sees a mismatch here, something went wrong earlier in the chain.

David

> -- 
>  i.
> 
> > +
> > +	/*
> > +	 * Verify that all required suppliers have been found. Return false
> > +	 * immediately if any are still missing.
> > +	 */
> > +	for_each_set_bit(supplier_id, &consumer_deps->supplier_bitmap, VSEC_FEATURE_COUNT) {
> > +		if (state[supplier_id] == STATE_SKIP)
> > +			continue;
> > +
> > +		if (state[supplier_id] == STATE_NOT_FOUND)
> > +			return false;
> > +	}
> > +
> > +	/*
> > +	 * All suppliers have been found and the consumer is ready to be
> > +	 * registered.
> > +	 */
> > +	return true;
> > +}
> > +
> > +static int get_cap_id(u32 header_id, unsigned long *cap_id)
> > +{
> > +	switch (header_id) {
> > +	case VSEC_ID_TELEMETRY:
> > +		*cap_id = ilog2(VSEC_CAP_TELEMETRY);
> > +		break;
> > +	case VSEC_ID_WATCHER:
> > +		*cap_id = ilog2(VSEC_CAP_WATCHER);
> > +		break;
> > +	case VSEC_ID_CRASHLOG:
> > +		*cap_id = ilog2(VSEC_CAP_CRASHLOG);
> > +		break;
> > +	case VSEC_ID_SDSI:
> > +		*cap_id = ilog2(VSEC_CAP_SDSI);
> > +		break;
> > +	case VSEC_ID_TPMI:
> > +		*cap_id = ilog2(VSEC_CAP_TPMI);
> > +		break;
> > +	default:
> > +		return -EINVAL;
> > +	}
> > +
> > +	return 0;
> > +}
> > +
> > +static int intel_vsec_register_device(struct pci_dev *pdev,
> > +				      struct intel_vsec_header *header,
> > +				      struct intel_vsec_platform_info *info)
> > +{
> > +	const struct vsec_feature_dependency *consumer_deps;
> > +	struct vsec_priv *priv;
> > +	unsigned long cap_id;
> > +	int ret;
> > +
> > +	ret = get_cap_id(header->id, &cap_id);
> > +	if (ret)
> > +		return ret;
> > +
> > +	/*
> > +	 * Only track dependencies for devices probed by the VSEC driver.
> > +	 * For others using the exported APIs, add the device directly.
> > +	 */
> > +	if (!pci_match_id(intel_vsec_pci_ids, pdev))
> > +		return intel_vsec_add_dev(pdev, header, info, cap_id);
> > +
> > +	priv = pci_get_drvdata(pdev);
> > +	if (priv->state[cap_id] == STATE_REGISTERED ||
> > +	    priv->state[cap_id] == STATE_SKIP)
> > +		return -EEXIST;
> > +
> > +	priv->found_caps |= BIT(cap_id);
> > +
> > +	consumer_deps = get_consumer_dependencies(priv, cap_id);
> > +	if (!consumer_deps || suppliers_ready(priv, consumer_deps, cap_id)) {
> > +		ret = intel_vsec_add_dev(pdev, header, info, cap_id);
> > +		if (ret)
> > +			priv->state[cap_id] = STATE_SKIP;
> > +		else
> > +			priv->state[cap_id] = STATE_REGISTERED;
> > +
> > +		return ret;
> > +	}
> > +
> > +	return -EAGAIN;
> > +}
> > +
> >  static bool intel_vsec_walk_header(struct pci_dev *pdev,
> >  				   struct intel_vsec_platform_info *info)
> >  {
> > @@ -233,7 +426,7 @@ static bool intel_vsec_walk_header(struct pci_dev *pdev,
> >  	int ret;
> >  
> >  	for ( ; *header; header++) {
> > -		ret = intel_vsec_add_dev(pdev, *header, info);
> > +		ret = intel_vsec_register_device(pdev, *header, info);
> >  		if (!ret)
> >  			have_devices = true;
> >  	}
> > @@ -281,7 +474,7 @@ static bool intel_vsec_walk_dvsec(struct pci_dev *pdev,
> >  		pci_read_config_dword(pdev, pos + PCI_DVSEC_HEADER2, &hdr);
> >  		header.id = PCI_DVSEC_HEADER2_ID(hdr);
> >  
> > -		ret = intel_vsec_add_dev(pdev, &header, info);
> > +		ret = intel_vsec_register_device(pdev, &header, info);
> >  		if (ret)
> >  			continue;
> >  
> > @@ -326,7 +519,7 @@ static bool intel_vsec_walk_vsec(struct pci_dev *pdev,
> >  		header.tbir = INTEL_DVSEC_TABLE_BAR(table);
> >  		header.offset = INTEL_DVSEC_TABLE_OFFSET(table);
> >  
> > -		ret = intel_vsec_add_dev(pdev, &header, info);
> > +		ret = intel_vsec_register_device(pdev, &header, info);
> >  		if (ret)
> >  			continue;
> >  
> > @@ -375,7 +568,7 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  	struct intel_vsec_platform_info *info;
> >  	struct vsec_priv *priv;
> >  	bool have_devices = false;
> > -	int ret;
> > +	int num_caps, ret;
> >  
> >  	ret = pcim_enable_device(pdev);
> >  	if (ret)
> > @@ -393,7 +586,13 @@ static int intel_vsec_pci_probe(struct pci_dev *pdev, const struct pci_device_id
> >  	priv->info = info;
> >  	pci_set_drvdata(pdev, priv);
> >  
> > -	intel_vsec_feature_walk(pdev, &have_devices, info);
> > +	num_caps = hweight_long(info->caps);
> > +	while (num_caps--) {
> > +		intel_vsec_feature_walk(pdev, &have_devices, info);
> > +
> > +		if (priv->found_caps == info->caps)
> > +			break;
> > +	}
> >  
> >  	if (!have_devices)
> >  		return -ENODEV;
> > diff --git a/include/linux/intel_vsec.h b/include/linux/intel_vsec.h
> > index bc95821f1bfb..71067afaca99 100644
> > --- a/include/linux/intel_vsec.h
> > +++ b/include/linux/intel_vsec.h
> > @@ -5,11 +5,18 @@
> >  #include <linux/auxiliary_bus.h>
> >  #include <linux/bits.h>
> >  
> > -#define VSEC_CAP_TELEMETRY	BIT(0)
> > -#define VSEC_CAP_WATCHER	BIT(1)
> > -#define VSEC_CAP_CRASHLOG	BIT(2)
> > -#define VSEC_CAP_SDSI		BIT(3)
> > -#define VSEC_CAP_TPMI		BIT(4)
> > +/*
> > + * VSEC_CAP_UNUSED is reserved. It exists to prevent zero initialized
> > + * intel_vsec devices from being automatically set to a known
> > + * capability with ID 0
> > + */
> > +#define VSEC_CAP_UNUSED		BIT(0)
> > +#define VSEC_CAP_TELEMETRY	BIT(1)
> > +#define VSEC_CAP_WATCHER	BIT(2)
> > +#define VSEC_CAP_CRASHLOG	BIT(3)
> > +#define VSEC_CAP_SDSI		BIT(4)
> > +#define VSEC_CAP_TPMI		BIT(5)
> > +#define VSEC_FEATURE_COUNT	6
> >  
> >  /* Intel DVSEC offsets */
> >  #define INTEL_DVSEC_ENTRIES		0xA
> > @@ -81,22 +88,31 @@ struct pmt_callbacks {
> >  	int (*read_telem)(struct pci_dev *pdev, u32 guid, u64 *data, loff_t off, u32 count);
> >  };
> >  
> > +struct vsec_feature_dependency {
> > +	unsigned long feature;
> > +	unsigned long supplier_bitmap;
> > +};
> > +
> >  /**
> >   * struct intel_vsec_platform_info - Platform specific data
> >   * @parent:    parent device in the auxbus chain
> >   * @headers:   list of headers to define the PMT client devices to create
> > + * @deps:      array of feature dependencies
> >   * @priv_data: private data, usable by parent devices, currently a callback
> >   * @caps:      bitmask of PMT capabilities for the given headers
> >   * @quirks:    bitmask of VSEC device quirks
> >   * @base_addr: allow a base address to be specified (rather than derived)
> > + * @num_deps:  Count feature dependencies
> >   */
> >  struct intel_vsec_platform_info {
> >  	struct device *parent;
> >  	struct intel_vsec_header **headers;
> > +	const struct vsec_feature_dependency *deps;
> >  	void *priv_data;
> >  	unsigned long caps;
> >  	unsigned long quirks;
> >  	u64 base_addr;
> > +	int num_deps;
> >  };
> >  
> >  /**
> > @@ -110,6 +126,7 @@ struct intel_vsec_platform_info {
> >   * @priv_data:     any private data needed
> >   * @quirks:        specified quirks
> >   * @base_addr:     base address of entries (if specified)
> > + * @cap_id:        the enumerated id of the vsec feature
> >   */
> >  struct intel_vsec_device {
> >  	struct auxiliary_device auxdev;
> > @@ -122,6 +139,7 @@ struct intel_vsec_device {
> >  	size_t priv_data_size;
> >  	unsigned long quirks;
> >  	u64 base_addr;
> > +	unsigned long cap_id;
> >  };
> >  
> >  int intel_vsec_add_aux(struct pci_dev *pdev, struct device *parent,
> > 

