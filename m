Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1E81B5776CC
	for <lists+platform-driver-x86@lfdr.de>; Sun, 17 Jul 2022 16:50:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232898AbiGQOuu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 17 Jul 2022 10:50:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232848AbiGQOut (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 Jul 2022 10:50:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id BC2E4C8
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jul 2022 07:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658069447;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hkZ/kwPcmy7MO8oN1ITciGcELFqkzl55uZkPhtRqCIk=;
        b=NvBLdzBsWvlciwyiclHnjxu1ehkQF0Wr4Ighkik2sllUx8iZHXqfV8HpnFRCtKpNHj5lII
        U35M71pkBmVRQmBD+Cmee1AqFIqKSici6YMaElpWvHJRn2LLNPF9+SGcGOuYb3RVtLDM/2
        H7glcfbMuwwTzmZeZHOOaRN0TNnHXs0=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-laUPLEnvO22izUF90lYI6g-1; Sun, 17 Jul 2022 10:50:44 -0400
X-MC-Unique: laUPLEnvO22izUF90lYI6g-1
Received: by mail-ed1-f69.google.com with SMTP id w13-20020a05640234cd00b0043a991fb3f3so6414454edc.3
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Jul 2022 07:50:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hkZ/kwPcmy7MO8oN1ITciGcELFqkzl55uZkPhtRqCIk=;
        b=S3ULNQ2uGRnuu9DXDnbP3bBw1cWhNXK6sz59kF04UjQp3XMNnGTLBvYaRDstPqfk+x
         oCmAW1X15PL4xFx0a0DPBH8c1PCQQJ7DxuFcVbG/zt7FM0Y2yM2CTu5fviMwB37Z2vtp
         gjDBQh1mLBdTrieM8RdcK2kwDJ9ENVB2eG4tw83o7ip3KuUVvB2RFVBc5peg5lTxO1pa
         pPUytO14rHth3JTHd/yyK8JrVBPqoXeFlNhOIHHh3iDRb/kyWt3zXDuMmhL4YLnanl9P
         ZWW4R3UXVY0nz0bgrp9AEdkoOXxco6UIQxI343ytthAHuxtEULwi9ZYzXI9dyLX8FFix
         6rKA==
X-Gm-Message-State: AJIora9iiG7imJ/cJKtBJ/xv/oqq3wi+HdUNbGhg9dCbrhDXSKIIMjkr
        HdEVk9RNxUfu7ufwQ3pf0N9T4b06dELbexV8MaRYKtmlJs2KmpUzXWxovttavSNGvP+7feoQYwG
        +hGmZDFCeZH1ogDKBb7MrC2cIrvI7gZaOqA==
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id cs4-20020a0564020c4400b0043152ccf933mr31731720edb.41.1658069442837;
        Sun, 17 Jul 2022 07:50:42 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1t68Dj5m2zJTHbj18uYrkPS87PtDkKTD2pdvO8clhSLlNtqLUuh6ZBXO80+BgNQwuv416VITw==
X-Received: by 2002:a05:6402:c44:b0:431:52cc:f933 with SMTP id cs4-20020a0564020c4400b0043152ccf933mr31731701edb.41.1658069442625;
        Sun, 17 Jul 2022 07:50:42 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id l10-20020a1709060cca00b007262b9f7120sm4419676ejh.167.2022.07.17.07.50.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 17 Jul 2022 07:50:42 -0700 (PDT)
Message-ID: <28928879-9543-e423-89af-d53c19b7b164@redhat.com>
Date:   Sun, 17 Jul 2022 16:50:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH] platform/surface: tabletsw: Fix __le32 integer access
Content-Language: en-US
To:     Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        kernel test robot <lkp@intel.com>
References: <20220717120735.2052160-1-luzmaximilian@gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220717120735.2052160-1-luzmaximilian@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/17/22 14:07, Maximilian Luz wrote:
> The sources.count field is a __le32 inside a packed struct. So use the
> proper functions to access it.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: 9f794056db5b ("platform/surface: Add KIP/POS tablet-mode switch driver")
> Signed-off-by: Maximilian Luz <luzmaximilian@gmail.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans


> ---
>  drivers/platform/surface/surface_aggregator_tabletsw.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/surface/surface_aggregator_tabletsw.c b/drivers/platform/surface/surface_aggregator_tabletsw.c
> index 596ca6c80681..27d95a6a7851 100644
> --- a/drivers/platform/surface/surface_aggregator_tabletsw.c
> +++ b/drivers/platform/surface/surface_aggregator_tabletsw.c
> @@ -410,7 +410,7 @@ static int ssam_pos_get_source(struct ssam_tablet_sw *sw, u32 *source_id)
>  	if (status)
>  		return status;
>  
> -	if (sources.count == 0) {
> +	if (get_unaligned_le32(&sources.count) == 0) {
>  		dev_err(&sw->sdev->dev, "no posture sources found\n");
>  		return -ENODEV;
>  	}
> @@ -422,7 +422,7 @@ static int ssam_pos_get_source(struct ssam_tablet_sw *sw, u32 *source_id)
>  	 * is a device that provides multiple sources, at which point we can
>  	 * then try to figure out how to handle them.
>  	 */
> -	WARN_ON(sources.count > 1);
> +	WARN_ON(get_unaligned_le32(&sources.count) > 1);
>  
>  	*source_id = get_unaligned_le32(&sources.id[0]);
>  	return 0;

