Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84BE6E2030
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Oct 2019 18:09:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2406981AbfJWQJ1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Oct 2019 12:09:27 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:24152 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2404418AbfJWQJ1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Oct 2019 12:09:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571846966;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=j5F+WwyDO2ZtmwG6p6q1K0/ZlxsBaPFm9NQHC5+lRFs=;
        b=YSRBUng5thCDgIjC/8qGaesSpID+OKDOO/IsaE49YZ7lBXe+0WSh4dxVniFGjxoJ44misl
        vCRrkvSR/AhSeOQYI257o65aULO19splbPMyEqshXKKjo1VG7zEOc08S66AK24i/OySqBQ
        f9545HRRzL006FU/fuzWdc9HTluPgAA=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-42-jhqHtyk0P8KfkBVAooF9JA-1; Wed, 23 Oct 2019 12:09:24 -0400
Received: by mail-wm1-f70.google.com with SMTP id c188so7529259wmd.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2019 09:09:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=xr8vxRZiOlLM4EoAX9LWK4R5e1B8TFG0+exomtADaEs=;
        b=njYC5fsHTfb6tDUtZuWKpFI2Nk2kqGB7T5uHwfSfqrZXibkX0ODr47c71Jy+El5nYr
         A46oGUdDo+w86vcC2MuBOgFiaOwlLjHtQ2PjY9eZcijzKXs13lVjLWblUPm1FcaNN/ZT
         HNFOg/jwOA++MTBYg+WoCHIJXYlwY/Ux/EmSbZLoiJylwP8POmTkBDemHqv8pG/v8Kn+
         TNBfPPIsO7f+uv0GICaN57iCm5wHkdzYImTpyDV0PHsWBlwMb6kAyXGeXpt+9JdQv4BK
         mAgbNvkyv/wax/hwCnq/bHXYJczaV6qnjnuFcKIxdvMmKo1eAbTlSXAO8/onktNH1Tww
         jB5Q==
X-Gm-Message-State: APjAAAUb5Uxr+d1awR3oldS78ERLgKgHqWPRJiW1najvDlWO6yyyBW7j
        j30jFBwkQElkshww23WmrNL1f8ce5ABHaGoH+1u4HOBV4Zf14m5YcsbNftL1wiaT97XkB1XtHEd
        wUpupin+zhp+rZJcdgL0Q5qeXEsEkAaHONQ==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr9117880wrr.98.1571846903369;
        Wed, 23 Oct 2019 09:08:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzyZNLo1G0I7rZ9aMH3XIzpFN6PoUIDdAVVRNGs3wm8HtHhAEjWh2Wad0+prs1sUts2jhXGbA==
X-Received: by 2002:adf:ff81:: with SMTP id j1mr9117859wrr.98.1571846903140;
        Wed, 23 Oct 2019 09:08:23 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id o70sm29138427wme.29.2019.10.23.09.08.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2019 09:08:22 -0700 (PDT)
Subject: Re: [PATCH] Add touchscreen platform data for the Schneider SCT101CTM
 tablet
To:     Daniel Gorbea Ainz <danielgorbea@hotmail.com>
Cc:     "dvhart@infradead.org" <dvhart@infradead.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
Date:   Wed, 23 Oct 2019 18:08:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
Content-Language: en-US
X-MC-Unique: jhqHtyk0P8KfkBVAooF9JA-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 23-10-2019 17:23, Daniel Gorbea Ainz wrote:
> Add touchscreen platform data for the Schneider SCT101CTM tablet
>=20
> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Daniel, I received your patch just fine, shall I resend
it to the list for you ?

Regards,

Hans




> ---
>   drivers/platform/x86/touchscreen_dmi.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
>=20
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x8=
6/touchscreen_dmi.c
> index 1c7d8324f..8baaf0dfa 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -498,6 +498,24 @@ static const struct ts_dmi_data pov_mobii_wintab_p10=
06w_v10_data =3D {
>   =09.properties=09=3D pov_mobii_wintab_p1006w_v10_props,
>   };
>  =20
> +static const struct property_entry schneider_sct101ctm_props[] =3D {
> +=09PROPERTY_ENTRY_U32("touchscreen-size-x", 1715),
> +=09PROPERTY_ENTRY_U32("touchscreen-size-y", 1140),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-x"),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +=09PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
> +=09PROPERTY_ENTRY_STRING("firmware-name",
> +=09=09=09      "gsl1680-schneider-sct101ctm.fw"),
> +=09PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +=09PROPERTY_ENTRY_BOOL("silead,home-button"),
> +=09{ }
> +};
> +
> +static const struct ts_dmi_data schneider_sct101ctm_data =3D {
> +=09.acpi_name=09=3D "MSSL1680:00",
> +=09.properties=09=3D schneider_sct101ctm_props,
> +};
> +
>   static const struct property_entry teclast_x3_plus_props[] =3D {
>   =09PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>   =09PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -908,6 +926,14 @@ static const struct dmi_system_id touchscreen_dmi_ta=
ble[] =3D {
>   =09=09=09DMI_EXACT_MATCH(DMI_BOARD_NAME, "0E57"),
>   =09=09},
>   =09},
> +=09{
> +=09=09/* Schneider SCT101CTM */
> +=09=09.driver_data =3D (void *)&schneider_sct101ctm_data,
> +=09=09.matches =3D {
> +=09=09=09DMI_MATCH(DMI_SYS_VENDOR, "Default string"),
> +=09=09=09DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
> +=09=09},
> +=09},
>   =09{
>   =09=09/* Teclast X3 Plus */
>   =09=09.driver_data =3D (void *)&teclast_x3_plus_data,
>=20

