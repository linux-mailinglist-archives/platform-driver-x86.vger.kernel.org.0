Return-Path: <platform-driver-x86+bounces-356-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id A220F80C3F1
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Dec 2023 10:07:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0A88BB20981
	for <lists+platform-driver-x86@lfdr.de>; Mon, 11 Dec 2023 09:07:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70978210ED;
	Mon, 11 Dec 2023 09:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvVQ9/cD"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF1E1DF
	for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 01:07:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1702285648;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Sdhh+H57EuWxmwrtXXnOPJ4tSTblN96Y3Vn1hP17A1k=;
	b=DvVQ9/cDu2aOjwUPW3KtLYHoo7NfSQM3Lfvy7YVNiYPRgV6bEtSRCOWV2DCkUxhhGfV510
	8MmM9O6lf+bqngFRGeQ+fP/iskOXyVM6TUwEw8z6bZQCUJPtFx/kcLUfd3HAWmilVFpbPi
	7GJe945lctoqMxoQVnPCktSl6AooriE=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-347-2q5Bt2yFMM6WYU5I2AjzTA-1; Mon, 11 Dec 2023 04:07:25 -0500
X-MC-Unique: 2q5Bt2yFMM6WYU5I2AjzTA-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-a1fa0ed205fso53630166b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Dec 2023 01:07:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702285644; x=1702890444;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Sdhh+H57EuWxmwrtXXnOPJ4tSTblN96Y3Vn1hP17A1k=;
        b=OppI5UyRenpLuTVtlMMD0bEwhcYUbec7DpT15CCCA0sP7H9ZTMDFmhaqhq2ENXT6wQ
         0ijFGMLz94JEazl7L8I7eQaQFcJj857QGhEGRkpPJHQxSINE0O+MzkEoLa1jNLwslPqC
         dIQxbNyxZ8rJUBblCaSool0NcADNHO5Pw4zleB5FEjUchn3O0xx5AY4pM/2/A25V8awh
         ++MDcUWLlKbz4HB+X/jELBJC+MSGSPzzar1U20ZAs09jlgD0Dcy3V6sGDnh0AmS3kmTP
         TsqkTMb01LAViw8F92nsDRELgB6fMv49o9GKx/+A0qoApnnlsVGHO0Px/i8lUusd37+e
         XJBg==
X-Gm-Message-State: AOJu0YwwaCsddeGdO88QFuiIV51Y6dHO+IBHDx1LoR9xQeKwbRVx51sI
	tfJvuU+TF0MvKK1XWxMuLenotn9+cWvpSBwKx6bcbRos+Wi9fMDK12FMWFPPUFIwcB2XHrGQqoZ
	skljletmja7pWfo2Vk5HHOgRkbrHr1Zt9kQ==
X-Received: by 2002:a17:907:9408:b0:a1d:4f7c:4428 with SMTP id dk8-20020a170907940800b00a1d4f7c4428mr2923098ejc.63.1702285644767;
        Mon, 11 Dec 2023 01:07:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBNTFWlv5tzRsgFKCNru0Uuj66wjIfQiL4S8ycXnBWMh3Uctdmpr3QqLThntgX3w5uFOcbcA==
X-Received: by 2002:a17:907:9408:b0:a1d:4f7c:4428 with SMTP id dk8-20020a170907940800b00a1d4f7c4428mr2923082ejc.63.1702285644423;
        Mon, 11 Dec 2023 01:07:24 -0800 (PST)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id rd12-20020a170907a28c00b00a11b2677acbsm4451386ejc.163.2023.12.11.01.07.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Dec 2023 01:07:24 -0800 (PST)
Message-ID: <f4c8a150-1504-4fa9-86bf-7400b8fea884@redhat.com>
Date: Mon, 11 Dec 2023 10:07:23 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 14/15] platform/x86/amd/pmf: Add PMF-AMDSFH interface
 for HPD
Content-Language: en-US, nl
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
 ilpo.jarvinen@linux.intel.com, basavaraj.natikar@amd.com, jikos@kernel.org,
 benjamin.tissoires@redhat.com
Cc: Patil.Reddy@amd.com, mario.limonciello@amd.com,
 platform-driver-x86@vger.kernel.org, linux-input@vger.kernel.org
References: <20231204101548.1458499-1-Shyam-sundar.S-k@amd.com>
 <20231204101548.1458499-15-Shyam-sundar.S-k@amd.com>
From: Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20231204101548.1458499-15-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

On 12/4/23 11:15, Shyam Sundar S K wrote:
> From: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> 
> AMDSFH has information about the User presence information via the Human
> Presence Detection (HPD) sensor which is part of the AMD sensor fusion hub.
> Add PMF and AMDSFH interface to get this information.
> 
> Co-developed-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> Signed-off-by: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
> ---
>  drivers/hid/amd-sfh-hid/amd_sfh_common.h      |  5 ++
>  drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_init.c | 14 ++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.c    | 33 +++++++++++++
>  .../amd-sfh-hid/sfh1_1/amd_sfh_interface.h    |  1 +
>  drivers/platform/x86/amd/pmf/Kconfig          |  1 +
>  drivers/platform/x86/amd/pmf/spc.c            | 22 +++++++++
>  include/linux/amd-pmf-io.h                    | 46 +++++++++++++++++++
>  7 files changed, 122 insertions(+)
>  create mode 100644 include/linux/amd-pmf-io.h

<snip>


> diff --git a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> index 4f81ef2d4f56..f8758fb70b1a 100644
> --- a/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> +++ b/drivers/hid/amd-sfh-hid/sfh1_1/amd_sfh_interface.c
> @@ -7,11 +7,14 @@
>   *
>   * Author: Basavaraj Natikar <Basavaraj.Natikar@amd.com>
>   */
> +#include <linux/amd-pmf-io.h>
>  #include <linux/io-64-nonatomic-lo-hi.h>
>  #include <linux/iopoll.h>
>  
>  #include "amd_sfh_interface.h"
>  
> +static struct amd_mp2_dev *emp2;
> +
>  static int amd_sfh_wait_response(struct amd_mp2_dev *mp2, u8 sid, u32 cmd_id)
>  {
>  	struct sfh_cmd_response cmd_resp;
> @@ -73,7 +76,37 @@ static struct amd_mp2_ops amd_sfh_ops = {
>  	.response = amd_sfh_wait_response,
>  };
>  
> +void sfh_deinit_emp2(void)
> +{
> +	emp2 = NULL;
> +}
> +
>  void sfh_interface_init(struct amd_mp2_dev *mp2)
>  {
>  	mp2->mp2_ops = &amd_sfh_ops;
> +	emp2 = mp2;
> +}
> +
> +static int amd_sfh_hpd_info(u8 *user_present)
> +{
> +	struct hpd_status hpdstatus;
> +
> +	if (!emp2 || !emp2->dev_en.is_hpd_present)
> +		return -ENODEV;
> +
> +	hpdstatus.val = readl(emp2->mmio + AMD_C2P_MSG(4));
> +	*user_present = hpdstatus.shpd.presence;
> +	return 0;
> +}
> +
> +int amd_get_sfh_info(struct amd_sfh_info *sfh_info, enum sfh_message_type op)
> +{
> +	if (sfh_info) {
> +		switch (op) {
> +		case MT_HPD:
> +			return amd_sfh_hpd_info(&sfh_info->user_present);
> +		}
> +	}
> +	return -EINVAL;
>  }
> +EXPORT_SYMBOL_GPL(amd_get_sfh_info);

This whole amd_get_sfh_info() interface seems over engineered
why not just export amd_sfh_hpd_info() itself and directly
use that in the pmf code ?  That seems a whole lot simpler to me.

Also this patch MUST be split into 2 separate patches
for the HID and the PMF changes.

<snip>


> diff --git a/drivers/platform/x86/amd/pmf/spc.c b/drivers/platform/x86/amd/pmf/spc.c
> index a0423942f771..5e769dcb075a 100644
> --- a/drivers/platform/x86/amd/pmf/spc.c
> +++ b/drivers/platform/x86/amd/pmf/spc.c
> @@ -10,6 +10,7 @@
>   */
>  
>  #include <acpi/button.h>
> +#include <linux/amd-pmf-io.h>
>  #include <linux/power_supply.h>
>  #include <linux/units.h>
>  #include "pmf.h"
> @@ -44,6 +45,7 @@ void amd_pmf_dump_ta_inputs(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *
>  	dev_dbg(dev->dev, "Max C0 Residency: %u\n", in->ev_info.max_c0residency);
>  	dev_dbg(dev->dev, "GFX Busy: %u\n", in->ev_info.gfx_busy);
>  	dev_dbg(dev->dev, "LID State: %s\n", in->ev_info.lid_state ? "close" : "open");
> +	dev_dbg(dev->dev, "User Presence: %s\n", in->ev_info.user_present ? "Present" : "Away");
>  	dev_dbg(dev->dev, "==== TA inputs END ====\n");
>  }
>  #else
> @@ -147,6 +149,25 @@ static int amd_pmf_get_slider_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_
>  	return 0;
>  }
>  
> +static void amd_pmf_get_sensor_info(struct amd_pmf_dev *dev, struct ta_pmf_enact_table *in)
> +{
> +	struct amd_sfh_info sfh_info;
> +
> +	/* get HPD data */
> +	amd_get_sfh_info(&sfh_info, MT_HPD);

As Mario also pointed out, this needs to be error checked.

Regards,

Hans



