Return-Path: <platform-driver-x86+bounces-9900-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1B587A4DF97
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Mar 2025 14:46:58 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 3BC4C177D4F
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Mar 2025 13:46:57 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E09D9202F96;
	Tue,  4 Mar 2025 13:46:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bV1GYd5B"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E8C1E505
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 13:46:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741096013; cv=none; b=mkVp5epOsBVqBxyZrH6dudLK+OAL97YJm9l3ny+/2zUDNsZ7uyQ3beOxxENHn0qHodfLOkl91eS2aVR9HJrFJr8hcg+FS8HAtmp42RjkhM8i3ECXqfqXQBh0MJWyTngYW/yB/LTrs/YDawAGCdZybLspnAgebxlNUjvDvI+SyG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741096013; c=relaxed/simple;
	bh=TUEfAmonuQrsreF8kz8ghlc7pe2Oh3NI4HsHS8O+j4s=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=t9caKYlA8U/U5eg2bv7D0B6T7vc2JPY6184MeZBdQx2klfguJ1avz4IPA4Xo1fAwuvhQcPpEO+Q6PhJEStff8nP+U3USXphm8Qjz9CNHuCb6JE3MxTteSjKYClsL6GoN14PxbxgOiYBxhYwBYhwGAbvSN7XmfHBH0YhsyHqI5qk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bV1GYd5B; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741096012; x=1772632012;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=TUEfAmonuQrsreF8kz8ghlc7pe2Oh3NI4HsHS8O+j4s=;
  b=bV1GYd5B6qGjX2UrsyQ0gj9FnWpu7jHw2v8lzzYhBU/wT4drZZ7cyDhZ
   mNUb0O0nmPNMjiywqOet6vnCu1PhFWPy9VdcgplSnW1ifWqtvadDYBvcd
   LFpYSMfOMuuVH/7cUNYqvaDPN0mBxK7bUhsC+qb/LyPQKm3A2OJqBN0JN
   oEtY8OxdPK5D/+KpgGblON/tD0IptWfvJaJVrViAwupoiP6y9R3sfruMV
   Hnlwq6zf/4VzJa7ofLbufB8MQBtse6wsFLADONUgcGREgD0C8/3Ei/frJ
   SwUW34CImMliDyeXhbyaMJhlODkoOR/dBWUOYOFuc1KrJdSv8d5ZsPnHs
   g==;
X-CSE-ConnectionGUID: k91r0JJ+RG6D3BblJCRB8g==
X-CSE-MsgGUID: eS1G+1DjTmiHrixgSSScqg==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="52657642"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="52657642"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:46:51 -0800
X-CSE-ConnectionGUID: ZHibUOz3TBax518dxYfaMw==
X-CSE-MsgGUID: wjZHecEVQEewYuEj+lQNww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118528001"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 05:46:49 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 15:46:46 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
In-Reply-To: <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
Message-ID: <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com>
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com> <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 18 Feb 2025, Shyam Sundar S K wrote:

> The PMF driver allocates a shared memory buffer using
> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
> 
> The latest PMF-TA version introduces new structures with OEM debug
> information and additional policy input conditions for evaluating the
> policy binary. Consequently, the shared memory size must be increased to
> ensure compatibility between the PMF driver and the updated PMF-TA.
> 
> To do so, introduce the new PMF-TA UUID and update the PMF shared memory
> configuration to ensure compatibility with the latest PMF-TA version.
> Additionally, export the TA UUID.
> 
> These updates will result in modifications to the prototypes of
> amd_pmf_tee_init() and amd_pmf_ta_open_session().
> 
> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e@linux.intel.com/
> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
>  drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++--------
>  2 files changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 41b2b91b8fdc..e6bdee68ccf3 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -106,9 +106,12 @@ struct cookie_header {
>  #define PMF_TA_IF_VERSION_MAJOR				1
>  #define TA_PMF_ACTION_MAX					32
>  #define TA_PMF_UNDO_MAX						8
> -#define TA_OUTPUT_RESERVED_MEM				906
> +#define TA_OUTPUT_RESERVED_MEM				922
>  #define MAX_OPERATION_PARAMS					4
>  
> +#define TA_ERROR_CRYPTO_INVALID_PARAM				0x20002
> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE				0x2000d
> +
>  #define PMF_IF_V1		1
>  #define PMF_IF_V2		2
>  
> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/x86/amd/pmf/tee-if.c
> index b404764550c4..a81c661abd7e 100644
> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
>  MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy failures");
>  #endif
>  
> -static const uuid_t amd_pmf_ta_uuid = UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d,
> -						0xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> +static const uuid_t amd_pmf_ta_uuid[] = { UUID_INIT(0xd9b39bf2, 0x66bd, 0x4154, 0xaf, 0xb8, 0x8a,
> +						    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
> +					  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0xc5,
> +						    0x29, 0xb1, 0x3d, 0x85, 0x43),
> +					};
>  
>  static const char *amd_pmf_uevent_as_str(unsigned int state)
>  {
> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_pmf_dev *dev)
>  		 */
>  		schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_actions_ms * 3));
>  	} else {
> -		dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> +		dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
>  		dev->smart_pc_enabled = false;
>  		return res;
>  	}
> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_ioctl_version_data *ver, const voi
>  	return ver->impl_id == TEE_IMPL_ID_AMDTEE;
>  }
>  
> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, int index)
>  {
>  	struct tee_ioctl_open_session_arg sess_arg = {};
>  	int rc;
>  
> -	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> +	export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
>  	sess_arg.clnt_login = TEE_IOCTL_LOGIN_PUBLIC;
>  	sess_arg.num_params = 0;
>  
> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
>  {
>  	u32 size;
>  	int ret;
> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
>  		return PTR_ERR(dev->tee_ctx);
>  	}
>  
> -	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> +	ret = amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, index);
>  	if (ret) {
>  		dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
>  		ret = -EINVAL;
> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev *dev)
>  
>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  {
> -	int ret;
> +	bool status;
> +	int ret, i;
>  
>  	ret = apmf_check_smart_pc(dev);
>  	if (ret) {
> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		return -ENODEV;
>  	}
>  
> -	ret = amd_pmf_tee_init(dev);
> -	if (ret)
> -		return ret;
> -
>  	INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
>  
>  	ret = amd_pmf_set_dram_addr(dev, true);
> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
>  		goto error;
>  	}
>  
> -	ret = amd_pmf_start_policy_engine(dev);
> -	if (ret)
> +	for (i = 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> +		ret = amd_pmf_tee_init(dev, i);

Any reason why you just pass the uuid pointer as it seems more obvious as 
a parameter than something as vague as "index"?

I assume this change in general is to unbreak the case "3." from the link?

> +		if (ret)
> +			return ret;
> +
> +		ret = amd_pmf_start_policy_engine(dev);
> +		switch (ret) {
> +		case TA_PMF_TYPE_SUCCESS:
> +			status = true;
> +			break;
> +		case TA_ERROR_CRYPTO_INVALID_PARAM:
> +		case TA_ERROR_CRYPTO_BIN_TOO_LARGE:
> +			amd_pmf_tee_deinit(dev);
> +			status = false;
> +			break;
> +		default:
> +			goto error;
> +		}
> +
> +		if (status)
> +			break;
> +	}
> +
> +	if (!status && !pb_side_load)
>  		goto error;
>  
>  	if (pb_side_load)
> 

-- 
 i.


