Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EB175C0009
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Sep 2022 16:37:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbiIUOhj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Sep 2022 10:37:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49800 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229546AbiIUOhi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Sep 2022 10:37:38 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A79893225
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:37:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663771054;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=aNOI31wVK2txuGR07WrqC/nfpxXg5SiEuypTua4UXdo=;
        b=OXyXadOwUX3efHN14mQp/EToTBrNVmBbDMdAuFEAW0X0hs0NPd0urDxTEcSp/OqELGQWCn
        DcQhbDlUt7kesBhjYE/wDhvc9N455506W1KTxP6C5gAfmH8Vghr8BXBiBEeNHk7nbPwiDG
        QAUaecc7kWVn+PQHKghZ8IlstFzutw0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-144-KtgHVEHQOtaGO9UIqW3_BQ-1; Wed, 21 Sep 2022 10:37:32 -0400
X-MC-Unique: KtgHVEHQOtaGO9UIqW3_BQ-1
Received: by mail-ed1-f69.google.com with SMTP id m3-20020a056402430300b004512f6268dbso4631342edc.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Sep 2022 07:37:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=aNOI31wVK2txuGR07WrqC/nfpxXg5SiEuypTua4UXdo=;
        b=JD1AHA+xKzBgBVbEPoIHmWk/6R2ZWhlWXEbylxC4DLMRFA/YTRJl7raHVMHK5OMSrA
         mXNZzTiMmuQPKOGerRKqIU/SHgZO/FLOj66Xo+uBqHxXIZ3x/ZKlUwuCBOblCoHOZvoQ
         InVnlWhcnS62q+gfzfZrSSjaXUaF6Hnj3wpoLajre68xsiS5esfnEb0+Nu8k6SioujN+
         TRjzWCTWABZyRQ7MEzbGGlYCoyBz0TuPDIhz2iqJS376SQgRJOmjCOIppIiKBT2euPOj
         M6/YKXrYQ1B4FV+U4VZWGlgOIBlkKtW9Yv3JOVXDHd1WcOu5e051CIcCvZ2K1qC1HhXo
         zv5Q==
X-Gm-Message-State: ACrzQf1CcbhuYGl96JB0aaWzEXfzvFNJjVklOEZwr0HMMZf8MfgxBkG6
        MyIBcQvVpeyoEWuVAgQOh9B0iFhFQBR8/RrOCvm2MpAyi69xtWQ5Q15PybUVMSOHwRzoDuB934l
        Y71kU2hZ72dke/knl8lB/Ro9F9qedDFSVoQ==
X-Received: by 2002:a05:6402:44c:b0:445:f2f1:4add with SMTP id p12-20020a056402044c00b00445f2f14addmr25568765edw.257.1663771051459;
        Wed, 21 Sep 2022 07:37:31 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6XV+QINLZvg6RPJhEIs2hq99fz+4D4Q6sDmqFVcXoL7yCPIIA0rCMx2koYoHBsYDvUfb8KOQ==
X-Received: by 2002:a05:6402:44c:b0:445:f2f1:4add with SMTP id p12-20020a056402044c00b00445f2f14addmr25568726edw.257.1663771051045;
        Wed, 21 Sep 2022 07:37:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7d583000000b004539604cc9esm1838916edq.96.2022.09.21.07.37.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 07:37:30 -0700 (PDT)
Message-ID: <af3faf6f-1348-d287-cc55-e98b27dc4777@redhat.com>
Date:   Wed, 21 Sep 2022 16:37:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH v3 1/3] platform/x86/amd/pmf: Add support for CnQF
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org,
        mario.limonciello@amd.com
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com,
        bnocera@redhat.com
References: <20220921102455.1792336-1-Shyam-sundar.S-k@amd.com>
 <20220921102455.1792336-2-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220921102455.1792336-2-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-6.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/21/22 12:24, Shyam Sundar S K wrote:
> CnQF (a.k.a Cool and Quiet Framework) extends the static slider concept.
> PMF dynamically manages system power limits and fan policy based on system
> power trends which is representative of workload trend.
> 
> Static slider and CnQF controls are mutually exclusive for system power
> budget adjustments. CnQF supports configurable number of modes which can
> be unique for AC and DC. Every mode is representative of a system state
> characterized by unique steady state and boost behavior.
> 
> OEMs can configure the different modes/system states and how the
> transition to a mode happens. Whether to have CnQF manage system power
> budget dynamically in AC or DC or both is also configurable. Mode changes
> due to CnQF don't result in slider position change.
> 
> The default OEM values are obtained after evaluating the PMF ACPI function
> idx 11 & 12 for AC and DC respectively. Whether to turn ON/OFF by default
> is guided by a "flag" passed by the OEM BIOS.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/Makefile |   2 +-
>  drivers/platform/x86/amd/pmf/acpi.c   |  10 +
>  drivers/platform/x86/amd/pmf/cnqf.c   | 331 ++++++++++++++++++++++++++
>  drivers/platform/x86/amd/pmf/core.c   |  19 +-
>  drivers/platform/x86/amd/pmf/pmf.h    |  99 ++++++++
>  5 files changed, 459 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/platform/x86/amd/pmf/cnqf.c
> 
> diff --git a/drivers/platform/x86/amd/pmf/Makefile b/drivers/platform/x86/amd/pmf/Makefile
> index ef2b08c9174d..fdededf54392 100644
> --- a/drivers/platform/x86/amd/pmf/Makefile
> +++ b/drivers/platform/x86/amd/pmf/Makefile
> @@ -6,4 +6,4 @@
>  
>  obj-$(CONFIG_AMD_PMF) += amd-pmf.o
>  amd-pmf-objs := core.o acpi.o sps.o \
> -		auto-mode.o
> +		auto-mode.o cnqf.o
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index cb46a7252414..05a2b8a056fc 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -233,6 +233,16 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>  	return 0;
>  }
>  
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_AC, data, sizeof(*data));
> +}
> +
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data)
> +{
> +	return apmf_if_call_store_buffer(pdev, APMF_FUNC_DYN_SLIDER_DC, data, sizeof(*data));
> +}
> +
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
>  {
>  	acpi_handle ahandle = ACPI_HANDLE(pmf_dev->dev);
> diff --git a/drivers/platform/x86/amd/pmf/cnqf.c b/drivers/platform/x86/amd/pmf/cnqf.c
> new file mode 100644
> index 000000000000..fa994800692a
> --- /dev/null
> +++ b/drivers/platform/x86/amd/pmf/cnqf.c
> @@ -0,0 +1,331 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD Platform Management Framework Driver
> + *
> + * Copyright (c) 2022, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#include <linux/workqueue.h>
> +#include "pmf.h"
> +
> +static struct cnqf_config config_store;
> +
> +static int amd_pmf_set_cnqf(struct amd_pmf_dev *dev, int src, int idx,
> +			    struct cnqf_config *table)
> +{
> +	struct power_table_control *pc;
> +
> +	pc = &config_store.mode_set[src][idx].power_control;
> +
> +	amd_pmf_send_cmd(dev, SET_SPL, false, pc->spl, NULL);
> +	amd_pmf_send_cmd(dev, SET_FPPT, false, pc->fppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT, false, pc->sppt, NULL);
> +	amd_pmf_send_cmd(dev, SET_SPPT_APU_ONLY, false, pc->sppt_apu_only, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_MIN_LIMIT, false, pc->stt_min, NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_APU, false, pc->stt_skin_temp[STT_TEMP_APU],
> +			 NULL);
> +	amd_pmf_send_cmd(dev, SET_STT_LIMIT_HS2, false, pc->stt_skin_temp[STT_TEMP_HS2],
> +			 NULL);
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_SET_FAN_IDX))
> +		apmf_update_fan_idx(dev,
> +				    config_store.mode_set[src][idx].fan_control.manual,
> +				    config_store.mode_set[src][idx].fan_control.fan_id);
> +
> +	return 0;
> +}
> +
> +static void amd_pmf_update_power_threshold(void)
> +{
> +	struct cnqf_mode_settings *ts;
> +	struct cnqf_tran_params *tp;
> +	int i;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_QUIET];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_TO_TURBO];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_BALANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_PERFORMANCE];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_QUIET];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +
> +		tp = &config_store.trans_param[i][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +		ts = &config_store.mode_set[i][CNQF_MODE_TURBO];
> +		tp->power_threshold = ts->power_floor - tp->power_delta;
> +	}
> +}
> +
> +static const char *state_as_str(unsigned int state)
> +{
> +	switch (state) {
> +	case CNQF_MODE_QUIET:
> +		return "QUIET";
> +	case CNQF_MODE_BALANCE:
> +		return "BALANCED";
> +	case CNQF_MODE_TURBO:
> +		return "TURBO";
> +	case CNQF_MODE_PERFORMANCE:
> +		return "PERFORMANCE";
> +	default:
> +		return "Unknown CnQF mode";
> +	}
> +}
> +
> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms)
> +{
> +	struct cnqf_tran_params *tp;
> +	int src, i, j;
> +	u32 avg_power = 0;
> +
> +	src = amd_pmf_get_power_source();
> +
> +	if (dev->current_profile == PLATFORM_PROFILE_BALANCED) {
> +		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
> +	} else {
> +		/*
> +		 * Return from here if the platform_profile is not balanced
> +		 * so that preference is given to user mode selection, rather
> +		 * than enforcing CnQF to run all the time (if enabled)
> +		 */
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < CNQF_TRANSITION_MAX; i++) {
> +		config_store.trans_param[src][i].timer += time_lapsed_ms;
> +		config_store.trans_param[src][i].total_power += socket_power;
> +		config_store.trans_param[src][i].count++;
> +
> +		tp = &config_store.trans_param[src][i];
> +		if (tp->timer >= tp->time_constant && tp->count) {
> +			avg_power = tp->total_power / tp->count;
> +
> +			/* Reset the indices */
> +			tp->timer = 0;
> +			tp->total_power = 0;
> +			tp->count = 0;
> +
> +			if ((tp->shifting_up && avg_power >= tp->power_threshold) ||
> +			    (!tp->shifting_up && avg_power <= tp->power_threshold)) {
> +				tp->priority = true;
> +			} else {
> +				tp->priority = false;
> +			}
> +		}
> +	}
> +
> +	dev_dbg(dev->dev, "[CNQF] Avg power: %u mW socket power: %u mW mode:%s\n",
> +		avg_power, socket_power, state_as_str(config_store.current_mode));
> +
> +	for (j = 0; j < CNQF_TRANSITION_MAX; j++) {
> +		/* apply the highest priority */
> +		if (config_store.trans_param[src][j].priority) {
> +			if (config_store.current_mode !=
> +			    config_store.trans_param[src][j].target_mode) {
> +				config_store.current_mode =
> +						config_store.trans_param[src][j].target_mode;
> +				dev_dbg(dev->dev, "Moving to Mode :%s\n",
> +					state_as_str(config_store.current_mode));
> +				amd_pmf_set_cnqf(dev, src,
> +						 config_store.current_mode, NULL);
> +			}
> +			break;
> +		}
> +	}
> +	return 0;
> +}
> +
> +static void amd_pmf_update_trans_data(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_tran_params *tp;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_QUIET];
> +	tp->time_constant = out.t_balanced_to_quiet;
> +	tp->target_mode = CNQF_MODE_QUIET;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE];
> +	tp->time_constant = out.t_balanced_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_QUIET_TO_BALANCE];
> +	tp->time_constant = out.t_quiet_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = true;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE];
> +	tp->time_constant = out.t_perf_to_balanced;
> +	tp->target_mode = CNQF_MODE_BALANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE];
> +	tp->time_constant = out.t_turbo_to_perf;
> +	tp->target_mode = CNQF_MODE_PERFORMANCE;
> +	tp->shifting_up = false;
> +
> +	tp = &config_store.trans_param[idx][CNQF_TRANSITION_TO_TURBO];
> +	tp->time_constant = out.t_perf_to_turbo;
> +	tp->target_mode = CNQF_MODE_TURBO;
> +	tp->shifting_up = true;
> +}
> +
> +static void amd_pmf_update_mode_set(int idx, struct apmf_dyn_slider_output out)
> +{
> +	struct cnqf_mode_settings *ms;
> +
> +	/* Quiet Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_QUIET];
> +	ms->power_floor = out.ps[APMF_CNQF_QUIET].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_QUIET].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_QUIET].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_QUIET].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_QUIET].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_QUIET].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_QUIET].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_QUIET].fan_id;
> +
> +	/* Balance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_BALANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_BALANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_BALANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_BALANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_BALANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_BALANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_BALANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_BALANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_BALANCE].fan_id;
> +
> +	/* Performance Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_PERFORMANCE];
> +	ms->power_floor = out.ps[APMF_CNQF_PERFORMANCE].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_PERFORMANCE].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_PERFORMANCE].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_PERFORMANCE].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_PERFORMANCE].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_PERFORMANCE].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_PERFORMANCE].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_PERFORMANCE].fan_id;
> +
> +	/* Turbo Mode */
> +	ms = &config_store.mode_set[idx][CNQF_MODE_TURBO];
> +	ms->power_floor = out.ps[APMF_CNQF_TURBO].pfloor;
> +	ms->power_control.fppt = out.ps[APMF_CNQF_TURBO].fppt;
> +	ms->power_control.sppt = out.ps[APMF_CNQF_TURBO].sppt;
> +	ms->power_control.sppt_apu_only = out.ps[APMF_CNQF_TURBO].sppt_apu_only;
> +	ms->power_control.spl = out.ps[APMF_CNQF_TURBO].spl;
> +	ms->power_control.stt_min = out.ps[APMF_CNQF_TURBO].stt_min_limit;
> +	ms->power_control.stt_skin_temp[STT_TEMP_APU] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_APU];
> +	ms->power_control.stt_skin_temp[STT_TEMP_HS2] =
> +		out.ps[APMF_CNQF_TURBO].stt_skintemp[STT_TEMP_HS2];
> +	ms->fan_control.fan_id = out.ps[APMF_CNQF_TURBO].fan_id;
> +}
> +
> +static int amd_pmf_check_flags(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out = {};
> +
> +	if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC))
> +		apmf_get_dyn_slider_def_ac(dev, &out);
> +	else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC))
> +		apmf_get_dyn_slider_def_dc(dev, &out);
> +
> +	return out.flags;
> +}
> +
> +static int amd_pmf_load_defaults_cnqf(struct amd_pmf_dev *dev)
> +{
> +	struct apmf_dyn_slider_output out;
> +	int i, j, ret;
> +
> +	for (i = 0; i < POWER_SOURCE_MAX; i++) {
> +		if (i == POWER_SOURCE_AC && is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC)) {
> +			ret = apmf_get_dyn_slider_def_ac(dev, &out);
> +			if (ret) {
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_ac failed :%d\n", ret);
> +				return -EIO;
> +			}
> +		} else if (i == POWER_SOURCE_DC &&
> +				is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +			ret = apmf_get_dyn_slider_def_dc(dev, &out);
> +			if (ret) {
> +				dev_err(dev->dev,
> +					"APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
> +				return -EIO;
> +			}
> +		}
> +
> +		amd_pmf_update_mode_set(i, out);
> +		amd_pmf_update_trans_data(i, out);

So above you are checking is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC or _DC)
but here you unconditionally use the local "out" variable which may not have been
filled at all.

As I also mention below in more detail all of cnqf.c seems to be full of the assumption
that both APMF_FUNC_DYN_SLIDER_AC and APMF_FUNC_DYN_SLIDER_DC are supported. So lets
just enforce that by checking that both are enabled at init/probe() time and then drop
the is_apmf_func_supported() checks here. Also on errors you should propagate the error,
rather then hardcoding -EIO.

After dropping these checks this can be simplified to:

	for (i = 0; i < POWER_SOURCE_MAX; i++) {
		if (i == POWER_SOURCE_AC)
			ret = apmf_get_dyn_slider_def_ac(dev, &out);
		else
			ret = apmf_get_dyn_slider_def_dc(dev, &out);
		if (ret) {
			dev_err(dev->dev, "APMF apmf_get_dyn_slider_def_dc failed :%d\n", ret);
			return ret;
		}

		amd_pmf_update_mode_set(i, out);
		amd_pmf_update_trans_data(i, out);

Note I have also fixed the error propagation here.

> +		for (j = 0; j < CNQF_MODE_MAX; j++) {
> +			if (config_store.mode_set[i][j].fan_control.fan_id == FAN_INDEX_AUTO)
> +				config_store.mode_set[i][j].fan_control.manual = false;
> +			else
> +				config_store.mode_set[i][j].fan_control.manual = true;
> +		}
> +	}
> +	amd_pmf_update_power_threshold();
> +	/* set to initial default values */
> +	config_store.current_mode = CNQF_MODE_BALANCE;
> +
> +	return 0;
> +}
> +
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev)
> +{
> +	cancel_delayed_work_sync(&dev->work_buffer);
> +}
> +
> +int amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
> +{
> +	int ret, src;
> +
> +	ret = amd_pmf_check_flags(dev);
> +	if (!ret) {
> +		dev_dbg(dev->dev, "CnQF bios default_enable flag not set\n");
> +		return ret;
> +	}
> +
> +	ret = amd_pmf_load_defaults_cnqf(dev);
> +	if (ret < 0)
> +		return ret;
> +
> +	amd_pmf_init_metrics_table(dev);
> +	dev->cnqf_supported = true;
> +
> +	/* update the thermal for CnQF */
> +	if (dev->cnqf_supported && dev->current_profile == PLATFORM_PROFILE_BALANCED) {
> +		src = amd_pmf_get_power_source();
> +		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
> +		dev->cnqf_enabled = true;
> +	}
> +
> +	return 0;
> +}

Unless I am missing something here the logic here is all wrong:

1. dev->cnqf_supported does not get set if the "CnQF bios default_enable flag not set"
while it should be set if both APMF_FUNC_DYN_SLIDER_AC and APMF_FUNC_DYN_SLIDER_DC are
supported independent of the CnQF bios default_enable flag.

2. amd_pmf_load_defaults_cnqf() and amd_pmf_init_metrics_table() do not get called
when the CnQF bios default_enable flag is false, causing later changes to cnqf_enabled
to dereference an uninitialized config_store.

3. dev->cnqf_enabled does not get set if dev->current_profile != PLATFORM_PROFILE_BALANCED
causing amd_pmf_trans_cnqf() to never get called even if the CnQF bios default_enable flag
is true and dev->current_profile later changes to PLATFORM_PROFILE_BALANCED.


I believe that this function should look like this:

int amd_pmf_init_cnqf(struct amd_pmf_dev *dev)
{
	int ret, src;

	/*
	 * Note the caller of this function has already checked that both
	 * APMF_FUNC_DYN_SLIDER_AC and APMF_FUNC_DYN_SLIDER_DC are supported.
	 */

	ret = amd_pmf_load_defaults_cnqf(dev);
	if (ret < 0)
		return ret;

	amd_pmf_init_metrics_table(dev);

	dev->cnqf_supported = true;
	dev->cnqf_enabled = amd_pmf_check_flags(dev);

	/* update the thermal for CnQF */
	if (dev->cnqf_enabled && dev->current_profile == PLATFORM_PROFILE_BALANCED) {
		src = amd_pmf_get_power_source();
		amd_pmf_set_cnqf(dev, src, config_store.current_mode, NULL);
		dev->cnqf_enabled = true;
	}

	return 0;
}

Now on systems where APMF_FUNC_DYN_SLIDER_AC and APMF_FUNC_DYN_SLIDER_DC are both
supported, we will always call amd_pmf_load_defaults_cnqf() and
amd_pmf_init_metrics_table() and if those succeed we will properly set cnqf_supported
independed of the CnQF bios default_enable flag.

And we will always initialize cnqf_enabled to the CnQF bios default_enable flag,
independent of dev->current_profile.




> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index a675ca969331..99be1e6d57d3 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -123,6 +123,11 @@ static void amd_pmf_get_metrics(struct work_struct *work)
>  		amd_pmf_trans_automode(dev, socket_power, time_elapsed_ms);
>  	}
>  
> +	if (dev->cnqf_enabled) {
> +		/* Apply the CnQF transition */
> +		amd_pmf_trans_cnqf(dev, socket_power, time_elapsed_ms);
> +	}
> +
>  	dev->start_time = ktime_to_ms(ktime_get());
>  	schedule_delayed_work(&dev->work_buffer, msecs_to_jiffies(metrics_table_loop_ms));
>  	mutex_unlock(&dev->update_mutex);
> @@ -252,6 +257,8 @@ int amd_pmf_init_metrics_table(struct amd_pmf_dev *dev)
>  
>  static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  {
> +	int ret;
> +
>  	/* Enable Static Slider */
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR)) {
>  		amd_pmf_init_sps(dev);
> @@ -262,6 +269,12 @@ static void amd_pmf_init_features(struct amd_pmf_dev *dev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_init_auto_mode(dev);
>  		dev_dbg(dev->dev, "Auto Mode Init done\n");
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {

You are doing an || here, but in e.g. amd_pmf_trans_cnqf() you are
unconditionally (i) dereferencing: config_store.trans_param[src]
where src can be either 0 or 1. Basically almost all of the code in the
new cnqf.c file assumes that e.g. both config_store.trans_param[0]
and config_store.trans_param[1] are valid and likewise also that
both config_store.mode_set[0] and config_store.mode_set[1] are
valid.

I assume that for the firmware you are testing with both
is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) and
is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC) return true.

If that is the case and if that is in general expected to be the case
on firmwares which support CnQF then I suggest changing the
|| here to && :

	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) &&
			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {


Note if I have this wrong and it is possible for e.g. only
APMF_FUNC_DYN_SLIDER_AC to be supported, then you should:

1. Create an amd_pmf_cnqf_get_power_source() wrapper around
amd_pmf_get_power_source() which checks the APMF_FUNC_DYN_SLIDER_AC /
APMF_FUNC_DYN_SLIDER_DC flags and which then only returns POWER_SOURCE_AC / _DC
if the FUNC flags indicated these are supported.

2. Replace all amd_pmf_get_power_source() calls in cnqf.c with the new
amd_pmf_cnqf_get_power_source() wrapper so that unset / uninitialized
parts of the config_store can never get used.





i) Without checking is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) /
   is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)


> +		/* Enable Cool n Quiet Framework (CnQF) */
> +		ret = amd_pmf_init_cnqf(dev);
> +		if (ret)
> +			dev_warn(dev->dev, "CnQF Init failed\n");
>  	}
>  }
>  
> @@ -270,8 +283,12 @@ static void amd_pmf_deinit_features(struct amd_pmf_dev *dev)
>  	if (is_apmf_func_supported(dev, APMF_FUNC_STATIC_SLIDER_GRANULAR))
>  		amd_pmf_deinit_sps(dev);
>  
> -	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE))
> +	if (is_apmf_func_supported(dev, APMF_FUNC_AUTO_MODE)) {
>  		amd_pmf_deinit_auto_mode(dev);
> +	} else if (is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_AC) ||
> +			  is_apmf_func_supported(dev, APMF_FUNC_DYN_SLIDER_DC)) {
> +		amd_pmf_deinit_cnqf(dev);
> +	}
>  }
>  
>  static const struct acpi_device_id amd_pmf_acpi_ids[] = {
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index 0a72a395c2ef..24dd6fbff24c 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -22,6 +22,8 @@
>  #define APMF_FUNC_AUTO_MODE					5
>  #define APMF_FUNC_SET_FAN_IDX				7
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
> +#define APMF_FUNC_DYN_SLIDER_AC				11
> +#define APMF_FUNC_DYN_SLIDER_DC				12
>  
>  /* Message Definitions */
>  #define SET_SPL				0x03 /* SPL: Sustained Power Limit */
> @@ -165,6 +167,8 @@ struct amd_pmf_dev {
>  	int socket_power_history_idx;
>  	bool amt_enabled;
>  	struct mutex update_mutex; /* protects race between ACPI handler and metrics thread */
> +	bool cnqf_enabled;
> +	bool cnqf_supported;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -294,6 +298,93 @@ struct apmf_auto_mode {
>  	u32 fan_id_quiet;
>  } __packed;
>  
> +/* CnQF Layer */
> +enum cnqf_trans_priority {
> +	CNQF_TRANSITION_TO_TURBO, /* Any other mode to Turbo Mode */
> +	CNQF_TRANSITION_FROM_BALANCE_TO_PERFORMANCE, /* quiet/balance to Performance Mode */
> +	CNQF_TRANSITION_FROM_QUIET_TO_BALANCE, /* Quiet Mode to Balance Mode */
> +	CNQF_TRANSITION_TO_QUIET, /* Any other mode to Quiet Mode */
> +	CNQF_TRANSITION_FROM_PERFORMANCE_TO_BALANCE, /* Performance/Turbo to Balance Mode */
> +	CNQF_TRANSITION_FROM_TURBO_TO_PERFORMANCE, /* Turbo mode to Performance Mode */
> +	CNQF_TRANSITION_MAX,
> +};
> +
> +enum cnqf_mode {
> +	CNQF_MODE_QUIET,
> +	CNQF_MODE_BALANCE,
> +	CNQF_MODE_PERFORMANCE,
> +	CNQF_MODE_TURBO,
> +	CNQF_MODE_MAX,
> +};
> +
> +enum apmf_cnqf_pos {
> +	APMF_CNQF_TURBO,
> +	APMF_CNQF_PERFORMANCE,
> +	APMF_CNQF_BALANCE,
> +	APMF_CNQF_QUIET,
> +	APMF_CNQF_MAX,
> +};
> +
> +struct cnqf_mode_settings {
> +	struct power_table_control power_control;
> +	struct fan_table_control fan_control;
> +	u32 power_floor;
> +};
> +
> +struct cnqf_tran_params {
> +	u32 time_constant; /* minimum time required to switch to next mode */
> +	u32 power_delta; /* minimum power required to switch to next mode */
> +	u32 power_threshold;
> +	u32 timer; /* elapsed time. if timer > timethreshold, it will move to next mode */
> +	u32 total_power;
> +	u32 count;
> +	bool priority;
> +	bool shifting_up;
> +	enum cnqf_mode target_mode;
> +};
> +
> +struct cnqf_power_delta {
> +	u32 to_turbo;
> +	u32 balance_to_perf;
> +	u32 quiet_to_balance;
> +	u32 to_quiet;
> +	u32 perf_to_balance;
> +	u32 turbo_to_perf;
> +};
> +
> +struct cnqf_config {
> +	struct cnqf_tran_params trans_param[POWER_SOURCE_MAX][CNQF_TRANSITION_MAX];
> +	struct cnqf_mode_settings mode_set[POWER_SOURCE_MAX][CNQF_MODE_MAX];
> +	struct power_table_control defaults;
> +	enum cnqf_mode current_mode;
> +	struct cnqf_power_delta power_delta[POWER_SOURCE_MAX];
> +	u32 power_src;
> +	u32 avg_power;
> +};
> +
> +struct apmf_cnqf_power_set {
> +	u32 pfloor;
> +	u32 fppt;
> +	u32 sppt;
> +	u32 sppt_apu_only;
> +	u32 spl;
> +	u32 stt_min_limit;
> +	u8 stt_skintemp[STT_TEMP_COUNT];
> +	u32 fan_id;
> +} __packed;
> +
> +struct apmf_dyn_slider_output {
> +	u16 size;
> +	u16 flags;
> +	u32 t_perf_to_turbo;
> +	u32 t_balanced_to_perf;
> +	u32 t_quiet_to_balanced;
> +	u32 t_balanced_to_quiet;
> +	u32 t_perf_to_balanced;
> +	u32 t_turbo_to_perf;
> +	struct apmf_cnqf_power_set ps[APMF_CNQF_MAX];
> +} __packed;
> +
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
>  void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
> @@ -324,4 +415,12 @@ int apmf_get_sbios_requests(struct amd_pmf_dev *pdev, struct apmf_sbios_req *req
>  void amd_pmf_update_2_cql(struct amd_pmf_dev *dev, bool is_cql_event);
>  int amd_pmf_reset_amt(struct amd_pmf_dev *dev);
>  void amd_pmf_handle_amt(struct amd_pmf_dev *dev);
> +
> +/* CnQF Layer */
> +int apmf_get_dyn_slider_def_ac(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +int apmf_get_dyn_slider_def_dc(struct amd_pmf_dev *pdev, struct apmf_dyn_slider_output *data);
> +int amd_pmf_init_cnqf(struct amd_pmf_dev *dev);
> +void amd_pmf_deinit_cnqf(struct amd_pmf_dev *dev);
> +int amd_pmf_trans_cnqf(struct amd_pmf_dev *dev, int socket_power, ktime_t time_lapsed_ms);
> +
>  #endif /* PMF_H */


Regards,

Hans

