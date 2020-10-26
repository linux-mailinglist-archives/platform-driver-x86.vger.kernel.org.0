Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C28E29904E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Oct 2020 15:58:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782630AbgJZO6B (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 26 Oct 2020 10:58:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:55539 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1782611AbgJZO6B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 26 Oct 2020 10:58:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603724279;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ggR7nXs6vIGQ0hf64bcClqY2uGlUYrgDILb/HS3RbR0=;
        b=RLyGcFOA6mDep9CFgv3QMILe2ff7ifzRtlgkw4or6vQtJyoftmQ4PyCxmzsVoj9bKCMjT8
        9IPQGWMjfG1eva6ykRq1jiWLI8KlkZ4L5k9HXo8yga2j8jF2k0+Dj0PKY/wwGekS3VHrkR
        YXRJeicnY9jM63VhG1joCbgi0zePepI=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-446-1aMsS9aDMFGrk-hCn-gFQw-1; Mon, 26 Oct 2020 10:57:57 -0400
X-MC-Unique: 1aMsS9aDMFGrk-hCn-gFQw-1
Received: by mail-ej1-f71.google.com with SMTP id b17so5154199ejb.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Oct 2020 07:57:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ggR7nXs6vIGQ0hf64bcClqY2uGlUYrgDILb/HS3RbR0=;
        b=nyYLfaweXS+Ewlw7m8hFR/o93NuryaDUCkAfgjxD9sgluM2tW/48XSqCuFPEjgau6O
         28gslZBg7InfjjC45szpL6l4NrNgKMbtYIF7WDPkkXqNdkuALlmfJo6LVhFw68v1L7uR
         qHN6UicDlGcvBZ+e4HDoNYq+SQ9XGxfeMw5CdINMGHBnzu1vG6pxom5VDYUG0N6vX7R0
         EWW5uxHmQwWCQnKQrSRtQ6FGNzRSR9x3jlONMoQQFB0Kb+c9g8lXEpVtbsWKu0idDmUY
         Ldzu2ViLuGjHfQfhWopOHa7ti+53MDy0Q6eUOiOsuu2Hmz0Sgmi9Bb2cUS3fzqCmbhZC
         UlOQ==
X-Gm-Message-State: AOAM530VAQhEwSSXsF/TvhwlHN9ATTKB1Wm9aKEYugLNHbyyjfZ6sEnT
        V5GjTKiwOykj9yju8//6ECkrZfu5/bQkBUKCwubk32rBxrgHKygEYbGdd+Z49f8kwvh7wwReboM
        NXB9MEBkSPOJ9oMypLzNM/Ss6L5Yda3Um3A==
X-Received: by 2002:a17:906:4d03:: with SMTP id r3mr15004454eju.364.1603724275290;
        Mon, 26 Oct 2020 07:57:55 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzODTXxY3/e+mQFlcVuOFI/H1Wxzk4Yk6iRiXII2XR3P5YMcpD2IUndHpp4JWdlTFYkUBDv9g==
X-Received: by 2002:a17:906:4d03:: with SMTP id r3mr15004435eju.364.1603724275057;
        Mon, 26 Oct 2020 07:57:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id v21sm5296124edt.80.2020.10.26.07.57.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:57:54 -0700 (PDT)
Subject: Re: [PATCH v3 1/3] Input: add event codes for lap and palmreset
 proximity switches
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     dmitry.torokhov@gmail.com, platform-driver-x86@vger.kernel.org,
        linux-input@vger.kernel.org, jeff@labundy.com,
        anthony.wong@canonical.com, hadess@hadess.net,
        Nitin Joshi <njoshi1@lenovo.com>
References: <markpearson@lenovo.com>
 <20201026144512.621479-1-markpearson@lenovo.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bc1f2cde-c50e-8704-2fa7-bb7f1b5d6405@redhat.com>
Date:   Mon, 26 Oct 2020 15:57:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201026144512.621479-1-markpearson@lenovo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/26/20 3:45 PM, Mark Pearson wrote:
> Add infrastructure needed to support lap and palmrest proximity sensors.
> 
> These sensors are used for identifying thermal mode changes and modifying
> WWAN transmitter power.
> 
> Reviewed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>

The entire series looks good to me and is:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Dmitry: FYI I have take over drivers/platform/x86
maintainership from Andy.

Dmitry, since the first patch adds new evdev switch event-codes,
it is probably best if you merge this entire series through
the input tree. You hereby have my ack (as the new pdx86 maintainer)
for doing this.

Regards,

Hans



> ---
> Changes in v2:
>  - Update Input message
> Changes in v3:
>  - Added missing patch history notes
> 
>  include/linux/mod_devicetable.h        | 2 +-
>  include/uapi/linux/input-event-codes.h | 4 +++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/mod_devicetable.h b/include/linux/mod_devicetable.h
> index 5b08a473cdba..897f5a3e7721 100644
> --- a/include/linux/mod_devicetable.h
> +++ b/include/linux/mod_devicetable.h
> @@ -320,7 +320,7 @@ struct pcmcia_device_id {
>  #define INPUT_DEVICE_ID_LED_MAX		0x0f
>  #define INPUT_DEVICE_ID_SND_MAX		0x07
>  #define INPUT_DEVICE_ID_FF_MAX		0x7f
> -#define INPUT_DEVICE_ID_SW_MAX		0x10
> +#define INPUT_DEVICE_ID_SW_MAX		0x12
>  #define INPUT_DEVICE_ID_PROP_MAX	0x1f
>  
>  #define INPUT_DEVICE_ID_MATCH_BUS	1
> diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
> index 0c2e27d28e0a..26f71a9a6936 100644
> --- a/include/uapi/linux/input-event-codes.h
> +++ b/include/uapi/linux/input-event-codes.h
> @@ -889,7 +889,9 @@
>  #define SW_MUTE_DEVICE		0x0e  /* set = device disabled */
>  #define SW_PEN_INSERTED		0x0f  /* set = pen inserted */
>  #define SW_MACHINE_COVER	0x10  /* set = cover closed */
> -#define SW_MAX			0x10
> +#define SW_LAP_PROXIMITY        0x11  /* set = lap proximity sensor active */
> +#define SW_PALMREST_PROXIMITY   0x12  /* set = palmrest proximity sensor active */
> +#define SW_MAX			0x12
>  #define SW_CNT			(SW_MAX+1)
>  
>  /*
> 

