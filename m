Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EC7B769478
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Jul 2023 13:17:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230260AbjGaLRK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Jul 2023 07:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229885AbjGaLRI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jul 2023 07:17:08 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 81825E5D
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 04:16:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690802186;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Iesuv/alu/yhHFlO74LesnxnK+Ku4OmkfHIgDPJa8WI=;
        b=Dfh31RCFsbAgdX6iE6PbCX1Il4evlh40bORObUncvt1lW1XoR+Dfeflo4a+vFn7HsyIIb+
        Y9VJ3LicwBQ8PtcKU5/sYpKoUbQxQ7ocwI/UhBoe5DBdZShULfNIjejUVJctiK+BlbNgbT
        VkCaJQthEQPWUTcJsihTdp7oSvsSusc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-83-mY6Q8U40NEK_Vz7q0UDTQQ-1; Mon, 31 Jul 2023 07:16:25 -0400
X-MC-Unique: mY6Q8U40NEK_Vz7q0UDTQQ-1
Received: by mail-ed1-f69.google.com with SMTP id 4fb4d7f45d1cf-51bef8bb689so7518714a12.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jul 2023 04:16:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690802184; x=1691406984;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Iesuv/alu/yhHFlO74LesnxnK+Ku4OmkfHIgDPJa8WI=;
        b=SxtQwcoxrvbS2UVbFe1LTzlO2ikKWYHfxpiClk9Y8w04boqoUAf15p76K38buZxv6k
         KLvoN0Psl8Bzrnv8hE4te5yTuaSMBxNPQpINp3WUicedHR9ONBNqQVFJ3y9XQK48DBAU
         fPpojYLPIFrGjcw+XrBGEGq+6v/OjQCNkKX078JoRtWk93o/QTvUeIFKHPdtso7MYX4V
         fmQDDcaNvBK7Pgo+NU489Qjl8zaj4ldffmfgwCp3c3qEZZNwlNurxVoxsTbyCDQF9vGK
         SYHyhHMpiAOU0ZavHUvTk7u2F3dtcP7bZTmj230IVjat90ffK5YOlLGX8/OGicGbrMgd
         fJ4g==
X-Gm-Message-State: ABy/qLbruchg9tsMZHCqjFQXKK+LtTUUjxW2y7U3x9YEz+SyxuKvYm67
        q9fkzBksvQNxHMqbsppO54nuqpifzC0xUpdQrCpKu/S4QhfhFmHi6hTyREKTpurcvHRis+vKrlM
        1FYXUK7I2j2p45ud97AoLQRNaH3nSFVAymg==
X-Received: by 2002:aa7:c84b:0:b0:51d:95ac:22ed with SMTP id g11-20020aa7c84b000000b0051d95ac22edmr10141497edt.1.1690802184109;
        Mon, 31 Jul 2023 04:16:24 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEaQ8uSTplaUg9zUrIYn2JkgaCUP4D2ruyovEwdIr8VO+izKR+EyE4dRAL6S7ihieDTXK2msA==
X-Received: by 2002:aa7:c84b:0:b0:51d:95ac:22ed with SMTP id g11-20020aa7c84b000000b0051d95ac22edmr10141480edt.1.1690802183798;
        Mon, 31 Jul 2023 04:16:23 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id y19-20020aa7ccd3000000b0051d9ee1c9d3sm5286910edt.84.2023.07.31.04.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 04:16:23 -0700 (PDT)
Message-ID: <cc7c9433-234f-a93f-e63c-cf13bdf01b85@redhat.com>
Date:   Mon, 31 Jul 2023 13:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/2] platform/x86/siemens: Kconfig: adjust help text
Content-Language: en-US
To:     Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Tobias Schaffner <tobias.schaffner@siemens.com>
References: <20230725093113.9739-1-henning.schild@siemens.com>
 <20230725093113.9739-3-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230725093113.9739-3-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/25/23 11:31, Henning Schild wrote:
> There was a copy and paste mistake where the module name was not
> correct.
> 
> Fixes: 917f54340794 ("platform/x86: simatic-ipc: add CMOS battery monitoring")
> Signed-off-by: Henning Schild <henning.schild@siemens.com>

Thank you, I have merged this entire series into
the platform-drivers-x86-simatic-ipc branch now:

https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=platform-drivers-x86-simatic-ipc

Note it will show up there once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
merged into the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans



> ---
>  drivers/platform/x86/siemens/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/siemens/Kconfig b/drivers/platform/x86/siemens/Kconfig
> index 8e78dc609a38..9c227a19432f 100644
> --- a/drivers/platform/x86/siemens/Kconfig
> +++ b/drivers/platform/x86/siemens/Kconfig
> @@ -60,4 +60,4 @@ config SIEMENS_SIMATIC_IPC_BATT_F7188X
>  	  from Siemens based on Nuvoton GPIO.
>  
>  	  To compile this driver as a module, choose M here: the module
> -	  will be called simatic-ipc-batt-elkhartlake.
> +	  will be called simatic-ipc-batt-f7188x.

