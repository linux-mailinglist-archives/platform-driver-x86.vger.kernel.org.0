Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A867836C42
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 Jun 2019 08:30:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725766AbfFFGaO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 6 Jun 2019 02:30:14 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44981 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725267AbfFFGaO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 Jun 2019 02:30:14 -0400
Received: by mail-pg1-f195.google.com with SMTP id n2so742564pgp.11
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Jun 2019 23:30:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=yiBXwVM6e4F5pOs820Noo6QM9Ce7Ua13EkzwV4k431s=;
        b=pOtp80Uh7+xp/gGhgkqtWX9VTINPiKiRB4aPZEeYW4+aG4Jo+7/f7UKaWrrNd5zBoz
         GSDsMxSzjsMUtSy/abD9WsgcLd9H5HuQndRM4xk10Ci2sotV4nazsG2dUB0Xvc4nmVjZ
         XyBLuWI/ktT1MVGtT2WsUmM35xhB6GHRMrkj8SkFivQnSI9kDwPOWpp3Tr1mPDw9PBcJ
         IV8TAVDfc08xtaVTbxoK4fzhTEQm5cT4oE1v4tPAHnpYmm+KYpiIuN2RscmPkutnfgWh
         OmaaFHFAWhrKX0mNLLMCfY5sFCXiqCTRgg34vpiE0UBcntLkNCv0tUW7kTzGFLvdFixF
         A3oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=yiBXwVM6e4F5pOs820Noo6QM9Ce7Ua13EkzwV4k431s=;
        b=gTtvMS36kiTvVSpbbpagtF2yjOzjwvIm507CgywbQ444jfzzFAZZEEOZWa7ZSBFWY6
         7Tj+k+rRiVXAGFeOJVsggnFWoi9TDfzGw6kvpRZee4C0/2CHQWEVniBzn6lWDW2iFxbx
         YJ0fa6Np58WCJ3YlhE/43epO5gg2D2ykuP8r2qkZiAeq37CvZYG1sqsWeX61HwtYe2dM
         8n7d4BsXVIRYBASlm+Y9pPpxCmuq6jb1kpC6XWzXmG9gTJpalPSVcXjD3qky22/lcrI4
         0jBQb1zYY8uX28O2cfckB105xeOvLnMMTackCh0j1rM4vvvhuxYEVLPs4KLB3uRYGJ6b
         wlEg==
X-Gm-Message-State: APjAAAWO0xdKuSp6QglBU6kt9Fya0ZxzN5Z8CVDS2KARnW3PT3ykmAjG
        aA8RHblV1he00mAgn6RMN14M8M5SHfYEP6kPrKvPjTUP
X-Google-Smtp-Source: APXvYqx5TWlZ/+H7HoRDTGVBv/9/bOhAMd+6vXiTU4SB87+aZ99QbImpKG7I7N5PUHuGiHbiQ5qM9eVKgvTqqkldkVw=
X-Received: by 2002:aa7:9342:: with SMTP id 2mr43162911pfn.241.1559802613652;
 Wed, 05 Jun 2019 23:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20190605232204.24679-1-otero.o.daniel@gmail.com>
In-Reply-To: <20190605232204.24679-1-otero.o.daniel@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 6 Jun 2019 09:30:02 +0300
Message-ID: <CAHp75Vduhw0Jd2dUDfFJ-NC6bw2oq_mgJ4u3ad81UAw-=WHeAQ@mail.gmail.com>
Subject: Fwd: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi Hi10
 Pro' touchscreen
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

---------- Forwarded message ---------
From: Daniel Otero <otero.o.daniel@gmail.com>
Date: Thu, Jun 6, 2019 at 2:22 AM
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for 'Chuwi
Hi10 Pro' touchscreen
To: Andy Shevchenko <andy@infradead.org>
Cc: Hans de Goede <hdegoede@redhat.com>, Darren Hart
<dvhart@infradead.org>, <linux-input@vger.kernel.org>, Daniel Otero
<otero.o.daniel@gmail.com>


Add touchscreen platform data for the 'Chuwi Hi10 Pro' tablet touchscreen.

Signed-off-by: Daniel Otero <otero.o.daniel@gmail.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c
b/drivers/platform/x86/touchscreen_dmi.c
index b662cb2d7cd5..d942082c5b7b 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -87,6 +87,23 @@ static const struct ts_dmi_data chuwi_hi10_air_data = {
        .properties     = chuwi_hi10_air_props,
 };

+static const struct property_entry chuwi_hi10_pro_props[] = {
+       PROPERTY_ENTRY_U32("touchscreen-size-x", 1911),
+       PROPERTY_ENTRY_U32("touchscreen-size-y", 1276),
+       PROPERTY_ENTRY_U32("touchscreen-min-x", 9),
+       PROPERTY_ENTRY_U32("touchscreen-min-y", 9),
+       PROPERTY_ENTRY_BOOL("touchscreen-swapped-x-y"),
+       PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-chuwi-hi10-pro.fw"),
+       PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+       PROPERTY_ENTRY_BOOL("silead,home-button"),
+       { }
+};
+
+static const struct ts_dmi_data chuwi_hi10_pro_data = {
+       .acpi_name      = "MSSL1680:00",
+       .properties     = chuwi_hi10_pro_props,
+};
+
 static const struct property_entry chuwi_vi8_props[] = {
        PROPERTY_ENTRY_U32("touchscreen-min-x", 4),
        PROPERTY_ENTRY_U32("touchscreen-min-y", 6),
@@ -601,6 +618,14 @@ static const struct dmi_system_id
touchscreen_dmi_table[] = {
                        DMI_MATCH(DMI_PRODUCT_SKU, "P1W6_C109D_B"),
                },
        },
+       {
+               /* Chuwi Hi10 Pro (CWI529) */
+               .driver_data = (void *)&chuwi_hi10_pro_data,
+               .matches = {
+                       DMI_MATCH(DMI_BOARD_VENDOR, "Hampoo"),
+                       DMI_MATCH(DMI_PRODUCT_NAME, "Hi10 pro tablet"),
+               },
+       },
        {
                /* Chuwi Vi8 (CWI506) */
                .driver_data = (void *)&chuwi_vi8_data,
--
2.21.0



-- 
With Best Regards,
Andy Shevchenko
