Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 738E51A1A4F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Apr 2020 05:36:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726467AbgDHDg1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 7 Apr 2020 23:36:27 -0400
Received: from mga18.intel.com ([134.134.136.126]:60540 "EHLO mga18.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726436AbgDHDg1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 7 Apr 2020 23:36:27 -0400
IronPort-SDR: MLzlwIKvYBYGTJ+HRfIhsxPs5sdIc0IHoorS6SfQyh4mdVpmB53yixXiTUNWm4rR7eFDaQWAZF
 VThy5Tv6xxkg==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2020 20:36:27 -0700
IronPort-SDR: mu3r1Qdx/1QKNgR5l2WsPuQbrRqDoEI21m2hUgVJF1ebu18HOYEAZKkmY40vGUFJJJ/hVFY2rg
 c45sIWL3kQmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,357,1580803200"; 
   d="scan'208";a="269636335"
Received: from aeloviko-mobl1.amr.corp.intel.com ([10.135.15.145])
  by orsmga002.jf.intel.com with ESMTP; 07 Apr 2020 20:36:26 -0700
Message-ID: <94de8f52ebc2148bee3895153602f16af24e87d4.camel@linux.intel.com>
Subject: Re: [PATCH] platform/x86/intel-uncore-freq: make uncore_root_kobj
 static
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Jason Yan <yanaijie@huawei.com>, dvhart@infradead.org,
        andy@infradead.org, platform-driver-x86@vger.kernel.org
Date:   Tue, 07 Apr 2020 20:36:25 -0700
In-Reply-To: <20200408024200.40268-1-yanaijie@huawei.com>
References: <20200408024200.40268-1-yanaijie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 2020-04-08 at 10:42 +0800, Jason Yan wrote:
> Fix the following sparse warning:
> 
> drivers/platform/x86/intel-uncore-frequency.c:56:16: warning: symbol
> 'uncore_root_kobj' was not declared. Should it be static?
> 
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Jason Yan <yanaijie@huawei.com>
Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>

> ---
>  drivers/platform/x86/intel-uncore-frequency.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel-uncore-frequency.c
> b/drivers/platform/x86/intel-uncore-frequency.c
> index b96d172eb2c1..12d5ab7e1f5d 100644
> --- a/drivers/platform/x86/intel-uncore-frequency.c
> +++ b/drivers/platform/x86/intel-uncore-frequency.c
> @@ -53,7 +53,7 @@ static int uncore_max_entries __read_mostly;
>  /* Storage for uncore data for all instances */
>  static struct uncore_data *uncore_instances;
>  /* Root of the all uncore sysfs kobjs */
> -struct kobject *uncore_root_kobj;
> +static struct kobject *uncore_root_kobj;
>  /* Stores the CPU mask of the target CPUs to use during uncore
> read/write */
>  static cpumask_t uncore_cpu_mask;
>  /* CPU online callback register instance */

