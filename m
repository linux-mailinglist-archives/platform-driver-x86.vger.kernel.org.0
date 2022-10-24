Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E3F7C60A371
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Oct 2022 13:55:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232198AbiJXLzs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Oct 2022 07:55:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232620AbiJXLzL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:55:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 672407A501
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:46:18 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id u8-20020a17090a5e4800b002106dcdd4a0so12726538pji.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jd6ACh5yshC3v+wpibDWDf3qgLlWAznCMtTQxn1zcTM=;
        b=BWB1bsRo1D1/5aG2HUlQshwnot5GiQEKVcgQhO+OxWk4Yv6RJGjGc0+BnbVcAU1ilB
         NhLxiTmmJgpEWvIeGzC5nj6mZ2YWuafNwN+o0OYaPM29MksvUZTfQAH1/K+UrZCFM6bR
         i7w9/In5jUCFaBvu+D1VTFv7mFYSrjvbVqaokCOIPR/VUAMFVxjnDdpJCpz7bMR/BSkg
         Jq+u8O9YrnPI/nP0nolD9ycK218e8OEhDyBgyhXa6WYV51n2uaBY0GhjjlonI341V0zm
         ZR6a6kMTVC2I54CmN/XhCqU+xMvNbG8LWMhVeF721NMtiIvmVm8HCmwl7f0mofuKqBvv
         T6qA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jd6ACh5yshC3v+wpibDWDf3qgLlWAznCMtTQxn1zcTM=;
        b=Gyn1QbQmNYw7QlLs2rjDx4okAPdD79J5vjTiqJ1/Y3MNsCsbMsiAnjdZMuSpjo1/zT
         QkP9NuhZxhXaWYgQzB2Qq/AexELIf/q/9CnY+QKqt/fVJb0jA1RzoB09UyKLttnEf/PY
         wBOxobKzxs2X9ut1/PRgncNoPfooMnc4Uyc1NSGZiR9a/ALqVEZrbblamf1km7xhXJSF
         KTSDHjsqUnsVN1IOwIEgaxgrsKMymqq3rbo5vWPz4blWO4J5X+GuktaroC2GjP6rGEbm
         wSHdw3X6Tz9D5/TcoZzinctlcJ7ZP3ZufQkWwys0Z9kgjFbLhvOpqgH45K0cIDrgKLQX
         f3Uw==
X-Gm-Message-State: ACrzQf020+nYGQSDnllZJ4vNEiCoGu6vPECLcGeHtK9RcQI43118mckQ
        YESHUhiFsCtvzkK5/H/MzGacjkYc0Ul5Z2gC
X-Google-Smtp-Source: AMsMyM73/rjifhWGMHa1zueK60XfZjEW5Vq3d/GPCr3Dh4GubkmNIV3imNkhOdeBYtsFWNdeZJSquQ==
X-Received: by 2002:a17:902:da90:b0:185:5537:f388 with SMTP id j16-20020a170902da9000b001855537f388mr34408779plx.113.1666611366225;
        Mon, 24 Oct 2022 04:36:06 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:05 -0700 (PDT)
From:   Akihiko Odaki <akihiko.odaki@daynix.com>
Cc:     David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        "Lee, Chun-Yi" <jlee@suse.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Cezary Jackiewicz <cezary.jackiewicz@gmail.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Jonathan Woithe <jwoithe@just42.net>,
        Ike Panhc <ike.pan@canonical.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Kenneth Chan <kenneth.t.chan@gmail.com>,
        Mattia Dongili <malattia@linux.it>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Azael Avalos <coproscefalo@gmail.com>,
        Lee Jones <lee@kernel.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Jingoo Han <jingoohan1@gmail.com>,
        Helge Deller <deller@gmx.de>,
        Robert Moore <robert.moore@intel.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
        intel-gfx@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org,
        acpi4asus-user@lists.sourceforge.net,
        ibm-acpi-devel@lists.sourceforge.net, linux-fbdev@vger.kernel.org,
        devel@acpica.org, Akihiko Odaki <akihiko.odaki@daynix.com>
Subject: [PATCH 03/22] LoongArch: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:54 +0900
Message-Id: <20221024113513.5205-4-akihiko.odaki@daynix.com>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221024113513.5205-1-akihiko.odaki@daynix.com>
References: <20221024113513.5205-1-akihiko.odaki@daynix.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

acpi_video_get_backlight_type() is now deprecated.

Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
---
 drivers/platform/loongarch/loongson-laptop.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/loongarch/loongson-laptop.c b/drivers/platform/loongarch/loongson-laptop.c
index f0166ad5d2c2..3b54b4cefedb 100644
--- a/drivers/platform/loongarch/loongson-laptop.c
+++ b/drivers/platform/loongarch/loongson-laptop.c
@@ -454,9 +454,9 @@ static int __init event_init(struct generic_sub_driver *sub_driver)
 
 	/*
 	 * This hotkey driver handle backlight event when
-	 * acpi_video_get_backlight_type() gets acpi_backlight_vendor
+	 * acpi_video_get_backlight_types() gets ACPI_BACKLIGHT_VENDOR
 	 */
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor)
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR))
 		hotkey_backlight_set(true);
 	else
 		hotkey_backlight_set(false);
-- 
2.37.3

