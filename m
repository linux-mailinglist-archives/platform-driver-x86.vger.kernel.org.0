Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C7E11B8E86
	for <lists+platform-driver-x86@lfdr.de>; Fri, 20 Sep 2019 12:32:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2393561AbfITKcq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 20 Sep 2019 06:32:46 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:25615 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2393530AbfITKcq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 20 Sep 2019 06:32:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1568975565;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fhP+6NrCs/UEtUjZ/ehCLBrFwEaQgimeTuvBc9x1eY0=;
        b=CdIx5nb1nI9AKL2lkkZdwFw7Jol8PZpaaGc2Lf8OBJQ4cviihllo4E9dFCehEvUMbdV5Ky
        eQPYmqwiOTG9ADegbG6qWlNoPebIrKv5HsBFcOskFWfxR0qSZNDbprORu94zu1TA2dBHjE
        XVQCFVw1S7s7svryGHFzND99UEd27OU=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-102-zL6iN9OyPuWQD66I6lPkIw-1; Fri, 20 Sep 2019 06:32:43 -0400
Received: by mail-ed1-f70.google.com with SMTP id l5so757321edr.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 20 Sep 2019 03:32:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=wQFzMMOI9IHEdpQikm6nRpd1SNKkoj0WCobwksclq0Y=;
        b=qETQ4pYZSGbYA5Cr1as5wq7q3QXXpjUareZ+KBOftrbWwP+MFZk2X/NmmHl8Gc3s3s
         y9ZHWmbghJrb4PTJoa4TtQfER69RU4eZWouafNjWmlHnbnDbTbHibNZY/vope8b703Zb
         oc3Bj6XwyZCdwEwH5MOQLVut7leXYxmvPHjxkIhsqf8FSpT0pnQQ6qOHq2MqZrevgQ1J
         9uzxNjzODar8sKq2qYW/LNWdoUGL75PCr+lT4fHbtNRcy2NqRl++mMLqXrXw2Wsms+hP
         ShltGQzkXWhyPjDvrhF/1ihvOK0UFXpipvey6ZAU5Ijigk7VWhU64NXS1gISgU8WiHlB
         ED0Q==
X-Gm-Message-State: APjAAAXTZgDS43zkLGVrapcsriFJgG9a3qnj3LAzmrAEGYhi6N03HUbQ
        KBMEAraV7IZ8bJp9J8JaJexUk/N1cL4QWdUB5A3QtC3jwihrDqCRorUaR+TIvU8TCfwDUPwQ+PK
        SXWWm3Tcu5RUX3kehvOncoexhcEQjNTYIfw==
X-Received: by 2002:a50:91d8:: with SMTP id h24mr8770061eda.61.1568975562286;
        Fri, 20 Sep 2019 03:32:42 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxi9K7NP671bCTXdhkhM1E4ekPEY+uAShqKtKrT4/5Jeyl7RIGoVWiOzAx9m92Wz3CgQabPdQ==
X-Received: by 2002:a50:91d8:: with SMTP id h24mr8770056eda.61.1568975562148;
        Fri, 20 Sep 2019 03:32:42 -0700 (PDT)
Received: from localhost.localdomain ([62.140.137.116])
        by smtp.gmail.com with ESMTPSA id e13sm106370eje.52.2019.09.20.03.32.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Sep 2019 03:32:41 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: i2c-multi-instantiate: Derive the device
 name from parent
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
References: <20190920100233.12829-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cde45562-af19-77e9-b3c9-7b3eb7dcd459@redhat.com>
Date:   Fri, 20 Sep 2019 12:32:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190920100233.12829-1-heikki.krogerus@linux.intel.com>
Content-Language: en-US
X-MC-Unique: zL6iN9OyPuWQD66I6lPkIw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/20/19 12:02 PM, Heikki Krogerus wrote:
> When naming the new devices, instead of using the ACPI ID in
> the name as base, using the parent device's name. That makes
> it possible to support multiple multi-instance i2c devices
> of the same type in the same system.
>=20
> This fixes an issue seen on some Intel Kaby Lake based
> boards:
>=20
> sysfs: cannot create duplicate filename '/devices/pci0000:00/0000:00:15.0=
/i2c_designware.0/i2c-0/i2c-INT3515-tps6598x.0'
>=20
> Fixes: 2336dfadfb1e ("platform/x86: i2c-multi-instantiate: Allow to have =
same slaves")
> Cc: stable@vger.kernel.org
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Patch looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans


> ---
>   drivers/platform/x86/i2c-multi-instantiate.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platf=
orm/x86/i2c-multi-instantiate.c
> index 61fe341a85aa..ea68f6ed66ae 100644
> --- a/drivers/platform/x86/i2c-multi-instantiate.c
> +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> @@ -90,7 +90,7 @@ static int i2c_multi_inst_probe(struct platform_device =
*pdev)
>   =09for (i =3D 0; i < multi->num_clients && inst_data[i].type; i++) {
>   =09=09memset(&board_info, 0, sizeof(board_info));
>   =09=09strlcpy(board_info.type, inst_data[i].type, I2C_NAME_SIZE);
> -=09=09snprintf(name, sizeof(name), "%s-%s.%d", match->id,
> +=09=09snprintf(name, sizeof(name), "%s-%s.%d", dev_name(dev),
>   =09=09=09 inst_data[i].type, i);
>   =09=09board_info.dev_name =3D name;
>   =09=09switch (inst_data[i].flags & IRQ_RESOURCE_TYPE) {
>=20

