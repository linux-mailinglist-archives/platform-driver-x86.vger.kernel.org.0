Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9194E587CAA
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Aug 2022 14:52:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236210AbiHBMwf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Aug 2022 08:52:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232569AbiHBMwe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Aug 2022 08:52:34 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41514DFC5
        for <platform-driver-x86@vger.kernel.org>; Tue,  2 Aug 2022 05:52:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659444752;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lMlHN8yBKc29JULEt2Nonu+OT6SZtAXtk/6epLwrBg8=;
        b=PeZXdZHQocg/0tYJTgq8ogkqkalMHTDwjRd7kSHuqR3LdzcKC8Mx7vPzxfK4dJKWAZPYVz
        Puo4d0D8YQQVanpAc5Zt9inUYouVOziyYmwF++xvFJMyygmNyPBzAoSwHz/8Q6m1epB8++
        ERKgQFQRd0Nb8bq7uRvY3fcK9fF1wgA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-502-dg6oD2n8Ms26ZaC3BfPCug-1; Tue, 02 Aug 2022 08:52:28 -0400
X-MC-Unique: dg6oD2n8Ms26ZaC3BfPCug-1
Received: by mail-ej1-f69.google.com with SMTP id sb15-20020a1709076d8f00b0072b692d938cso4124158ejc.10
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Aug 2022 05:52:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=lMlHN8yBKc29JULEt2Nonu+OT6SZtAXtk/6epLwrBg8=;
        b=7HBR5AGwSsn9ZyfeUEsKCT5dsar+5y1EldGfJCUddA4qUsLmSoWXcyN/XQL/C1uK/x
         FyaTJ54GeuwDzTyYoKYa82rZ3zYN3AdMpks1wcHVO0gXqgkGQiunpzscHjPZS051S1v0
         YB8bC4ixdB09CdgPOb+wuP6HKeoRQOGyRDm9gXMXktxaAy6W6WFkY7HZGd2DkiQO/kms
         yTj8CEmhHjfcQzu0KXrjU862CY2byac6+aChNOgVq/rqRdNqQ985Vcx+dF6uutY+uGaK
         DJKzsz6DRZNKgemvABFZK9FRwTrUyx/1X7z0rDV+ZY0/5oUhdXvQ+gp8oVZOy4xwNncE
         zkTA==
X-Gm-Message-State: AJIora+3+lfnVFr/Qxl/HWVRoukEaMSFbk3pNliC2i5Wi71WS/XE4ubn
        HEKRLLepeSMTcCU1zw3Wj3UXVj09G+9tXpq8kCmUM37Ekf8VNok/LWmryUYTij78oB5hB2M5lBr
        v8NrYd8cxEcw5LsKCkgAUxHGR+KdGYM8/pg==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr16267157ejc.762.1659444746826;
        Tue, 02 Aug 2022 05:52:26 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sJkL9GV2j74fbtvnK8R9QyXf2ZZFr/Qm2ZfdtXunbZiBWkrj9sGTwsP1/hAdcCnUCbsSP+HQ==
X-Received: by 2002:a17:906:9c82:b0:6df:baa2:9f75 with SMTP id fj2-20020a1709069c8200b006dfbaa29f75mr16267142ejc.762.1659444746552;
        Tue, 02 Aug 2022 05:52:26 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id fd9-20020a056402388900b0043d6ece495asm4441462edb.55.2022.08.02.05.52.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Aug 2022 05:52:26 -0700 (PDT)
Message-ID: <4354d5fb-3fd0-7207-9f39-d7678744524c@redhat.com>
Date:   Tue, 2 Aug 2022 14:52:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH v3 05/11] platform/x86/amd/pmf: Add heartbeat signal
 support
Content-Language: en-US
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>, markgross@kernel.org
Cc:     platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
References: <20220802112545.2118632-1-Shyam-sundar.S-k@amd.com>
 <20220802112545.2118632-6-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220802112545.2118632-6-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/2/22 13:25, Shyam Sundar S K wrote:
> PMF driver can send periodic heartbeat signals to OEM BIOS. When BIOS does
> not receive the signal after a period of time, it can infer that AMDPMF
> has hung or failed to load.
> 
> In this situation, BIOS can fallback to legacy operations. OEM can modify
> the time interval of the signal or completely disable signals through
> ACPI Method.
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> ---
>  drivers/platform/x86/amd/pmf/acpi.c | 37 +++++++++++++++++++++++++++--
>  drivers/platform/x86/amd/pmf/core.c |  1 +
>  drivers/platform/x86/amd/pmf/pmf.h  |  5 ++++
>  3 files changed, 41 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/amd/pmf/acpi.c b/drivers/platform/x86/amd/pmf/acpi.c
> index 717ee81a5f73..c3f87265eeae 100644
> --- a/drivers/platform/x86/amd/pmf/acpi.c
> +++ b/drivers/platform/x86/amd/pmf/acpi.c
> @@ -105,6 +105,25 @@ int apmf_get_static_slider_granular(struct amd_pmf_dev *pdev,
>  									 data, sizeof(*data));
>  }
>  
> +static void apmf_sbios_heartbeat_notify(struct work_struct *work)
> +{
> +	struct amd_pmf_dev *dev = container_of(work, struct amd_pmf_dev, heart_beat.work);
> +	union acpi_object *info;
> +	int err = 0;
> +
> +	dev_dbg(dev->dev, "Sending heartbeat to SBIOS\n");
> +	info = apmf_if_call(dev, APMF_FUNC_SBIOS_HEARTBEAT, NULL);
> +	if (!info) {
> +		err = -EIO;

I did not notice this before, but err gets set here and then never used.

Maybe instead log an error when the call fails ?

Also the work is not re-queued on an error here, I assume this is on
purpose ?

Regards,

Hans


> +		goto out;
> +	}
> +
> +	schedule_delayed_work(&dev->heart_beat, msecs_to_jiffies(dev->hb_interval * 1000));
> +
> +out:
> +	kfree(info);
> +}
> +
>  static int apmf_if_verify_interface(struct amd_pmf_dev *pdev)
>  {
>  	struct apmf_verify_interface output;
> @@ -133,15 +152,23 @@ static int apmf_get_system_params(struct amd_pmf_dev *dev)
>  	if (err)
>  		return err;
>  
> -	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x\n",
> +	dev_dbg(dev->dev, "system params mask:0x%x flags:0x%x cmd_code:0x%x heartbeat:%d\n",
>  		params.valid_mask,
>  		params.flags,
> -		params.command_code);
> +		params.command_code,
> +		params.heartbeat_int);
>  	params.flags = params.flags & params.valid_mask;
> +	dev->hb_interval = params.heartbeat_int;
>  
>  	return 0;
>  }
>  
> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev)
> +{
> +	if (pmf_dev->hb_interval)
> +		cancel_delayed_work_sync(&pmf_dev->heart_beat);
> +}
> +
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  {
>  	int ret;
> @@ -158,6 +185,12 @@ int apmf_acpi_init(struct amd_pmf_dev *pmf_dev)
>  		goto out;
>  	}
>  
> +	if (pmf_dev->hb_interval) {
> +		/* send heartbeats only if the interval is not zero */
> +		INIT_DELAYED_WORK(&pmf_dev->heart_beat, apmf_sbios_heartbeat_notify);
> +		schedule_delayed_work(&pmf_dev->heart_beat, 0);
> +	}
> +
>  out:
>  	return ret;
>  }
> diff --git a/drivers/platform/x86/amd/pmf/core.c b/drivers/platform/x86/amd/pmf/core.c
> index 032d9dc5e09f..87a1f9b27d2c 100644
> --- a/drivers/platform/x86/amd/pmf/core.c
> +++ b/drivers/platform/x86/amd/pmf/core.c
> @@ -279,6 +279,7 @@ static int amd_pmf_remove(struct platform_device *pdev)
>  
>  	mutex_destroy(&dev->lock);
>  	amd_pmf_deinit_features(dev);
> +	apmf_acpi_deinit(dev);
>  	amd_pmf_dbgfs_unregister(dev);
>  	kfree(dev->buf);
>  	return 0;
> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86/amd/pmf/pmf.h
> index e13542359403..5b85a7fe0f38 100644
> --- a/drivers/platform/x86/amd/pmf/pmf.h
> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> @@ -17,6 +17,7 @@
>  /* APMF Functions */
>  #define APMF_FUNC_VERIFY_INTERFACE			0
>  #define APMF_FUNC_GET_SYS_PARAMS			1
> +#define APMF_FUNC_SBIOS_HEARTBEAT			4
>  #define APMF_FUNC_STATIC_SLIDER_GRANULAR       9
>  
>  /* Message Definitions */
> @@ -53,6 +54,7 @@ struct apmf_system_params {
>  	u32 valid_mask;
>  	u32 flags;
>  	u8 command_code;
> +	u32 heartbeat_int;
>  } __packed;
>  
>  enum amd_stt_skin_temp {
> @@ -91,6 +93,8 @@ struct amd_pmf_dev {
>  	enum platform_profile_option current_profile;
>  	struct platform_profile_handler pprof;
>  	struct dentry *dbgfs_dir;
> +	int hb_interval; /* SBIOS heartbeat interval */
> +	struct delayed_work heart_beat;
>  };
>  
>  struct apmf_sps_prop_granular {
> @@ -116,6 +120,7 @@ struct amd_pmf_static_slider_granular {
>  
>  /* Core Layer */
>  int apmf_acpi_init(struct amd_pmf_dev *pmf_dev);
> +void apmf_acpi_deinit(struct amd_pmf_dev *pmf_dev);
>  int is_apmf_func_supported(struct amd_pmf_dev *pdev, unsigned long index);
>  int amd_pmf_send_cmd(struct amd_pmf_dev *dev, u8 message, bool get, u32 arg, u32 *data);
>  int amd_pmf_get_power_source(void);

