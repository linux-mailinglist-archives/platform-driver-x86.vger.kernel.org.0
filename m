Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 26A997369B5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 20 Jun 2023 12:45:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231334AbjFTKpa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 20 Jun 2023 06:45:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230346AbjFTKpW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 20 Jun 2023 06:45:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E84CE42
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:44:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687257861;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ONCSTWvDzW9P2kSA0X/B/sFo3vDt2b7SS93G2FNlhfs=;
        b=Bo8WJNk4Wv7/8KfeIdyNfPMuLOHGmY61mwQ9bx2hzBjnZnMPXHcS8DVs2BnQoPpx88sx32
        zFMhHz7U/vuYQ0I0lKkQ/qg7lpqcTMR0cvDWx7oAxjHSwvhh2aorBnUI1SJMjXFrsxnw0X
        TRbaQTw7b87h/tDfGPUDn89EBQcG2Go=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-41-HIYYT2jCMdyJPP4UameVcw-1; Tue, 20 Jun 2023 06:44:19 -0400
X-MC-Unique: HIYYT2jCMdyJPP4UameVcw-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51a4a83d597so2121550a12.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 20 Jun 2023 03:44:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687257858; x=1689849858;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ONCSTWvDzW9P2kSA0X/B/sFo3vDt2b7SS93G2FNlhfs=;
        b=GcuMlMLO8PQ3BzCHe7JtM2ah5KRcwSYd8jRjXptEmMwWP9oEczDcFApVJdLhJrkDn6
         v6PRA0KGVrrhAZMAhkF7deu3TC6pGqTXf7rC6CRoRCm17RqpZDfEzZ4mZe08fsYEUZxs
         2qg90syOz2UEBuXBfKrgW6OaP30ul0MElKvsRfxQEjqXoRBZJ+quOFFP7FEF4vrluszq
         zob7DsbFaO/uIze827MERljzqT6Z629lW+USuRIgW6FakiyjBw/Mewjx/iIceSoyeMvE
         h9M0a3h+DcP9oSOCisGyrKd+XLtA0LfIsPjxNh6x/RIkv27GFplSjLlsK55bEKnYT2Sc
         6Kuw==
X-Gm-Message-State: AC+VfDwkWzFPdLD8f1NCgMLFz2Rh9Y9fBSNdP1ofgrJgnOxPM/6vDMNj
        UqB0oJgpi2d1se6xa9kzt1KUPVDm5W6sHmEBCzXq+cASubIQgIEcAngdqs5acz3dRZdH+ghQhiB
        2vI4415+vNhPD/TUdxTZ2Of5F6ET8N8KrQg==
X-Received: by 2002:aa7:d30f:0:b0:51a:4c86:e555 with SMTP id p15-20020aa7d30f000000b0051a4c86e555mr4639102edq.40.1687257858525;
        Tue, 20 Jun 2023 03:44:18 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7T2O5iLbLc+k+4O9CHLPAq+N4ey4Nk6dDxJl+IpzEYcPgnSY9xjTvOdolGV9QrxYE+PIOV+g==
X-Received: by 2002:aa7:d30f:0:b0:51a:4c86:e555 with SMTP id p15-20020aa7d30f000000b0051a4c86e555mr4639094edq.40.1687257858282;
        Tue, 20 Jun 2023 03:44:18 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u24-20020aa7d898000000b0051897e3b5efsm960707edq.42.2023.06.20.03.44.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jun 2023 03:44:17 -0700 (PDT)
Message-ID: <744bb522-a4b2-4bda-3a02-e63795151d84@redhat.com>
Date:   Tue, 20 Jun 2023 12:44:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v2 0/6] platform/x86: int3472: discrete: Various
 improvements
Content-Language: en-US, nl
To:     =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20230616172132.37859-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230616172132.37859-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi all,

On 6/16/23 19:21, Hans de Goede wrote:
> Hi All,
> 
> Here is a v2 of my previous 2 int3472 patch series merged into
> 1 bigger series.
> 
> Changes in v2:
> - Use static_assert() to check that GPIO_REGULATOR_SUPPLY_MAP_COUNT
>   and ARRAY_SIZE(skl_int3472_regulator_map_supplies) match
> 
> and this also collects all the various Tested-by-s + Reviewed-by-s.

I've added this (v2) to my review-hans (soon to be for-next) branch now (again).

Regards,

Hans




> Hans de Goede (6):
>   platform/x86: int3472: discrete: Drop GPIO remapping support
>   platform/x86: int3472: discrete: Remove sensor_config-s
>   platform/x86: int3472: discrete: Add support for 1 GPIO regulator
>     shared between 2 sensors
>   platform/x86: int3472: discrete: Add alternative "AVDD" regulator
>     supply name
>   platform/x86: int3472: discrete: Use FIELD_GET() on the GPIO _DSM
>     return value
>   platform/x86: int3472: discrete: Log a warning if the pin-numbers
>     don't match
> 
>  .../x86/intel/int3472/clk_and_regulator.c     | 72 +++++++++++---
>  drivers/platform/x86/intel/int3472/common.h   | 14 +--
>  drivers/platform/x86/intel/int3472/discrete.c | 94 ++++---------------
>  3 files changed, 79 insertions(+), 101 deletions(-)
> 

