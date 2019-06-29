Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 12ED05ABBC
	for <lists+platform-driver-x86@lfdr.de>; Sat, 29 Jun 2019 16:19:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726801AbfF2OTq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 29 Jun 2019 10:19:46 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:46166 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726770AbfF2OTq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 29 Jun 2019 10:19:46 -0400
Received: by mail-pf1-f195.google.com with SMTP id 81so4360921pfy.13
        for <platform-driver-x86@vger.kernel.org>; Sat, 29 Jun 2019 07:19:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=UgA/uf/sXIrIV0KRsDZAIKU8xKrdYv//bvWdwxCrxXc=;
        b=bYhtDHjCOrqN/AT2HB6eU6HSs60zG0QTtssT4zLN6P3AT7VkFKER9p7f6iHIbe21TI
         5bbrQRwqw9onBK9cJUqbgWfKGTOTJe+MWbjngDTW9ghCSu8Wei6V1ZV/o7rThggKewOU
         YV54k0gulzcIFzOdb4tB76+7OtOFYUk5MIfUfLaGKn/jixMnQIokGUZzENbkEB3S3zWT
         8IGTQFWOD/T4FwacmhP+1II6S3fDxAqE5QPV2uQ8Yy5ZMSjwz4bEsnPmS9vc+uFAloNy
         s7CWatq8J1gHUTFP4KX+Afg8AVlmw3JHtWpl+yZsjZovtgi99ZHd22DH9eFFJM+2P5wV
         wL/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=UgA/uf/sXIrIV0KRsDZAIKU8xKrdYv//bvWdwxCrxXc=;
        b=flQM1uQXapfTt3/PaI9+NsLVw7RoLxNhSCh8wEFM85bitqlQ08fuW/rwAZDY5XJZdA
         YrPwqF4vvyF9URhL5D5FLpkhvmIXfHokKOpbAmaeJGTzTwC451mlJayCiwyEeydO/EZK
         6SCE6w66DLoWjpi9/5vc1NrqyjdCnyMjTLABPCxow0HLxj9WLQKS92G7tuMMEH9HSZCS
         /mFsDGBaOIdhAUVGU/dmWRMBZsB02vlML2QFm+QQDZKu5UKOsUrajfQTrxqDgsbg28FV
         0Uf29U0APAObTdI05kExO3Y7KE1GbfFArB0MzfWXNAE3ZV9FHR8JWKvu99V3M8qw+YUR
         dvKg==
X-Gm-Message-State: APjAAAXL9ZL7iFGkzjbrzeDbq4+B+lXX3E2n0fMFBamesOT3gfBEFyuI
        RU69GaSBTo41YpaRMJzU6jucvG3rvS/q9w3/WlY=
X-Google-Smtp-Source: APXvYqxXj4o4MF7Q9ZcKKdf4zyxUsBWC1UV61o0Jmc4G5i9LUYFAh5IiJjBJL9Pm//Fdt0JkgtVqzeUxjgKlayD4yVw=
X-Received: by 2002:a63:f346:: with SMTP id t6mr15332227pgj.203.1561817985470;
 Sat, 29 Jun 2019 07:19:45 -0700 (PDT)
MIME-Version: 1.0
References: <20190623121630.17945-1-vadimp@mellanox.com> <20190623121630.17945-8-vadimp@mellanox.com>
In-Reply-To: <20190623121630.17945-8-vadimp@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sat, 29 Jun 2019 17:19:34 +0300
Message-ID: <CAHp75VfM59NHvKZyqKRzMwmKtM4EU4Ppv-A+UPBWybHH5OpVdg@mail.gmail.com>
Subject: Re: [PATCH v1 platform-next 7/7] Documentation/ABI: Fix duplicated
 attribute for mlxreg-io sysfs interfaces
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jun 23, 2019 at 3:16 PM Vadim Pasternak <vadimp@mellanox.com> wrote=
:
>
> Remove duplicated attribute =E2=80=98jtag_en=E2=80=99, add instead missed=
 attribute
> =E2=80=98cpld3_version=E2=80=99.
>

This one doesn't apply.

> Fixes: 52675da1d087f ("Documentation/ABI: Add new attribute for mlxreg-io=
 sysfs interfaces")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  Documentation/ABI/stable/sysfs-driver-mlxreg-io | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/ABI/stable/sysfs-driver-mlxreg-io b/Documentat=
ion/ABI/stable/sysfs-driver-mlxreg-io
> index 8ca498447aeb..54202975ac3b 100644
> --- a/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> +++ b/Documentation/ABI/stable/sysfs-driver-mlxreg-io
> @@ -29,7 +29,7 @@ Description:  This file shows the system fans direction=
:
>
>                 The files are read only.
>
> -What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/jtag=
_enable
> +What:          /sys/devices/platform/mlxplat/mlxreg-io/hwmon/hwmon*/cpld=
3_version
>
>  Date:          November 2018
>  KernelVersion: 5.0
> --
> 2.11.0
>


--=20
With Best Regards,
Andy Shevchenko
