Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A74292617F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 May 2019 12:12:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728827AbfEVKMv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 May 2019 06:12:51 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:33418 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728584AbfEVKMu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 May 2019 06:12:50 -0400
Received: by mail-ed1-f68.google.com with SMTP id n17so3081367edb.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 22 May 2019 03:12:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=UOism6/WliJKlizbO03ANyTQDbU6zepiLVCCA7yr4no=;
        b=s7uyhH/eyS23lvtRH4TiJ8ZnrUcWHZ6gs5l2XhHpZjnGpdAA9KtPdiX39+JjTTRJyf
         ewPHaCFHBRn3stcoIaFj6aFBl1gd+qtLam7pPoXO6GqwEim0zVMBqKoVV99jKMmMNr57
         zhGa5/AQTyfhtIXyLiu8ZGKO7bDTwhylt1PBugRIK9FT+UjMVBRJzlFtfuQTspDx2Hev
         047B3Wt/PUjJnZPsmMOj6dC/JE/bJjNd5Nbaa93087kqHeDYjstb5F1HrPMCq95WZI8I
         9IGAnnZ1Hb1VbSXIJoBJL3JeNR4tgNv4yKXCUNcgudij3H68MrL+L+amgzhAISSksUCm
         uPNA==
X-Gm-Message-State: APjAAAVIwPKaMTxhNSQ3/aoJE7HFQlG4TGuZPYUo50j8hiRis+gjlwYM
        1BXY3v7pe/hP54Lsdz76BINgRg==
X-Google-Smtp-Source: APXvYqzNhVaVxR8CohHDUn6M+ULJOxCah+OGJx2vJUGm8rsFFDe+YEXiuua+IT83U0iTKfsg0KunhA==
X-Received: by 2002:a17:906:6c1:: with SMTP id v1mr13388705ejb.266.1558519969205;
        Wed, 22 May 2019 03:12:49 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id u1sm2617873ejz.92.2019.05.22.03.12.48
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 May 2019 03:12:48 -0700 (PDT)
Subject: Re: [PATCH] input: silead: Add MSSL0017 to acpi_device_id.
To:     Danct12 <danct12@disroot.org>
Cc:     Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        linux-input@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20190522045455.15769-1-danct12@disroot.org>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6c18472f-bedd-6e6d-121c-8a311495c3c3@redhat.com>
Date:   Wed, 22 May 2019 12:12:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522045455.15769-1-danct12@disroot.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 22-05-19 06:54, Danct12 wrote:
> On Chuwi Hi10 Plus, the Silead device id is MSSL0017.
> 
> Signed-off-by: Danct12 <danct12@disroot.org>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/input/touchscreen/silead.c | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/input/touchscreen/silead.c b/drivers/input/touchscreen/silead.c
> index 09241d4cdebc..06f0eb04a8fd 100644
> --- a/drivers/input/touchscreen/silead.c
> +++ b/drivers/input/touchscreen/silead.c
> @@ -617,6 +617,7 @@ static const struct acpi_device_id silead_ts_acpi_match[] = {
>   	{ "MSSL1680", 0 },
>   	{ "MSSL0001", 0 },
>   	{ "MSSL0002", 0 },
> +	{ "MSSL0017", 0 },
>   	{ }
>   };
>   MODULE_DEVICE_TABLE(acpi, silead_ts_acpi_match);
> 
