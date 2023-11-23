Return-Path: <platform-driver-x86+bounces-35-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A82967F617B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 15:30:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id D8D5E1C2104F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Nov 2023 14:30:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 61D1632C9E;
	Thu, 23 Nov 2023 14:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WQPdD5jp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 80D62B9;
	Thu, 23 Nov 2023 06:30:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700749830; x=1732285830;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=GOtJ/wPUcjOXSBk7IRQC4DD2WhaZ57quY1cxcixvzmw=;
  b=WQPdD5jpJ5VpeXbj1PeyepxUNSvl33+RIsLezS0Q1xdItJs9n6Ie2sft
   1BPBXErLFbFVWzXX86aNajnZXEPUoP7k7HXjmCj/8iu8ASQqRV6xpKC3g
   SBz5DNAc7BGyrOTpZpWfVZjrWjsP3WUuqFX9MonfA7KVaKpwsgZhlLO2K
   Ucd93Ny54vY+ba7J/1KmoxrYqHbch4vF/xSLQ3eP2sLXjGkiLHZnmn7io
   62caroeYZezXEUH2JcNI7uSvFMfsNzZZ3ngQB6+u4mPH7Fsbh6CZBwO4U
   t79uWOphJLc6j01VjmkvyKZPG7LUpNdbQcAFuYVj3cbKSmRKZNq76B9LH
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="382678115"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="382678115"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:30:30 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="717071779"
X-IronPort-AV: E=Sophos;i="6.04,221,1695711600"; 
   d="scan'208";a="717071779"
Received: from mstrobel-mobl.ger.corp.intel.com ([10.252.40.70])
  by orsmga003-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Nov 2023 06:30:28 -0800
Date: Thu, 23 Nov 2023 16:30:25 +0200 (EET)
From: =?ISO-8859-15?Q?Ilpo_J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: "David E. Box" <david.e.box@linux.intel.com>
cc: LKML <linux-kernel@vger.kernel.org>, platform-driver-x86@vger.kernel.org, 
    rajvi.jingar@linux.intel.com, dave.hansen@linux.intel.com, 
    peterz@infradead.org
Subject: Re: [PATCH V5 12/20] asm-generic/io.h: iounmap/ioport_unmap cleanup.h
 support
In-Reply-To: <20231123040355.82139-13-david.e.box@linux.intel.com>
Message-ID: <f83e4a40-314-d279-75e6-17ad83501982@linux.intel.com>
References: <20231123040355.82139-1-david.e.box@linux.intel.com> <20231123040355.82139-13-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323329-872993958-1700749829=:1676"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323329-872993958-1700749829=:1676
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Wed, 22 Nov 2023, David E. Box wrote:

> Add auto-release cleanups for iounmap() and ioport_unmap().
> 
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> Suggested-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
> ---
> V2 - Move from linux/io.h to asm-generic/io.h. Adds iounmap cleanup if
>      iounmap() is defined. Adds ioport_unmap cleanup if CONFIG_IOPORT_MAP
>      is defined.
> 
>  include/asm-generic/io.h | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/include/asm-generic/io.h b/include/asm-generic/io.h
> index bac63e874c7b..9ef0332490b1 100644
> --- a/include/asm-generic/io.h
> +++ b/include/asm-generic/io.h
> @@ -8,6 +8,7 @@
>  #define __ASM_GENERIC_IO_H
>  
>  #include <asm/page.h> /* I/O is all done through memory accesses */
> +#include <linux/cleanup.h>
>  #include <linux/string.h> /* for memset() and memcpy() */
>  #include <linux/types.h>
>  #include <linux/instruction_pointer.h>
> @@ -1065,6 +1066,10 @@ static inline void __iomem *ioremap(phys_addr_t addr, size_t size)
>  #endif
>  #endif /* !CONFIG_MMU || CONFIG_GENERIC_IOREMAP */
>  
> +#ifdef iounmap
> +DEFINE_FREE(iounmap, void __iomem *, iounmap(_T));
> +#endif
> +
>  #ifndef ioremap_wc
>  #define ioremap_wc ioremap
>  #endif
> @@ -1127,6 +1132,7 @@ static inline void ioport_unmap(void __iomem *p)
>  extern void __iomem *ioport_map(unsigned long port, unsigned int nr);
>  extern void ioport_unmap(void __iomem *p);
>  #endif /* CONFIG_GENERIC_IOMAP */
> +DEFINE_FREE(ioport_unmap, void __iomem *, ioport_unmap(_T));
>  #endif /* CONFIG_HAS_IOPORT_MAP */
>  
>  #ifndef CONFIG_GENERIC_IOMAP

Has this now built successfully with LKP? (I don't think we get success 
notifications from LKP for patch submissions, only failures).

There were some odd errors last time but I think all they were unrelated 
to this change (besides the checkpatch false positive, I mean).

-- 
 i.

--8323329-872993958-1700749829=:1676--

