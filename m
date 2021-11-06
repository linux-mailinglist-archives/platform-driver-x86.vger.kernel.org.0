Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 974F2446B78
	for <lists+platform-driver-x86@lfdr.de>; Sat,  6 Nov 2021 01:02:49 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhKFAF2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Nov 2021 20:05:28 -0400
Received: from mga05.intel.com ([192.55.52.43]:54939 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229894AbhKFAF2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Nov 2021 20:05:28 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10159"; a="318202705"
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="318202705"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 17:02:46 -0700
X-IronPort-AV: E=Sophos;i="5.87,212,1631602800"; 
   d="scan'208";a="490508136"
Received: from luhan1-mobl2.amr.corp.intel.com (HELO [10.212.219.183]) ([10.212.219.183])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Nov 2021 17:02:45 -0700
Subject: Re: [PATCH 4/5] Mark e820_entries as crypto capable from EFI memmap
To:     Martin Fernandez <martin.fernandez@eclypsium.com>,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        peterz@infradead.org, ardb@kernel.org, dvhart@infradead.org,
        andy@infradead.org, gregkh@linuxfoundation.org, rafael@kernel.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alison.schofield@intel.com, alex@eclypsium.com
References: <20211105212724.2640-1-martin.fernandez@eclypsium.com>
 <20211105212724.2640-5-martin.fernandez@eclypsium.com>
From:   Dave Hansen <dave.hansen@intel.com>
Autocrypt: addr=dave.hansen@intel.com; keydata=
 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
 z5cecg==
Message-ID: <1ba3f33b-05ef-60f1-d6dd-375b2d84e597@intel.com>
Date:   Fri, 5 Nov 2021 17:02:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20211105212724.2640-5-martin.fernandez@eclypsium.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 11/5/21 2:27 PM, Martin Fernandez wrote:
> Iterate over the EFI memmap finding the contiguous regions that are
> able to do hardware encryption (ie, those who have the
> EFI_MEMORY_CPU_CRYPTO enabled) and mark those in the e820_table.

It would also be nice to remind the reader about the connection between
EFI memory maps and the e820.

...
> +/*
> + * This assumes that there'll be no overlaps in the memory map
> + * (otherwise we'd have a deeper problem going on). It also assumes
> + * that the system DRAM regions are already sorted; in EDK2 based UEFI
> + * firmware the entries covering system DRAM are usually sorted, with
> + * additional MMIO entries appearing unordered. This is because the
> + * UEFI memory map is constructed from the GCD memory map, which is
> + * seeded with the DRAM regions at boot, and allocations are created
> + * by splitting them up.
> + */
> +static void __init efi_mark_e820_regions_as_crypto_capable(void)
> +{
> +	efi_memory_desc_t *md;
> +	struct contiguous_region prev_region;
> +
> +	cr_init(&prev_region);

A little theory of operation for this would be nice.  What's collected
in here?  What does this region mean?  Is the *entire* region in here
crypto-capable system RAM?

> +	for_each_efi_memory_desc(md) {
> +		if (md->attribute & EFI_MEMORY_CPU_CRYPTO) {
> +			struct contiguous_region cur_region;
> +
> +			efi_md_to_cr(md, &cur_region);

FWIW, I think that helper obfuscates more than it helps.  I say, just
open-code it.

> +			if (!cr_merge_regions(&prev_region, &cur_region)) {
> +				cr_mark_e820_as_crypto_capable(&prev_region);
> +				prev_region = cur_region;
> +			} /* else: Merge succeeded, don't mark yet */

That's really unusual CodingStyle.  Could you try to move those to a
more normal place: below or above the if() entirely.

> +		} else if (!cr_is_empty(&prev_region)) {
> +			cr_mark_e820_as_crypto_capable(&prev_region);
> +			cr_init(&prev_region);
> +		} /* else: All previous regions are already marked */

There are much nicer ways to write this.  For instance, I'd much prefer:

		/* Bail on empty regions: */
		if (cr_is_empty(&prev_region))
			continue;

		/* Mark the region: */
		cr_mark_e820_as_crypto_capable(&prev_region);
		cr_init(&prev_region);
	
That makes the flow much more understandable.  In general, you want to
keep the "main" flow if your code at the lowest indent and the exception
handling as indented.

> +	}
> +
> +	/* Mark last region (if any) */
> +	if (!cr_is_empty(&prev_region))
> +		cr_mark_e820_as_crypto_capable(&prev_region);
> +}
> +
>  void __init efi_init(void)
>  {
>  	if (IS_ENABLED(CONFIG_X86_32) &&
> @@ -494,6 +601,8 @@ void __init efi_init(void)
>  	set_bit(EFI_RUNTIME_SERVICES, &efi.flags);
>  	efi_clean_memmap();
>  
> +	efi_mark_e820_regions_as_crypto_capable();
> +
>  	if (efi_enabled(EFI_DBG))
>  		efi_print_memmap();
>  }
> 

