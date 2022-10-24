Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 586FC60A235
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Oct 2022 13:39:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231140AbiJXLje (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Oct 2022 07:39:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231250AbiJXLi4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Oct 2022 07:38:56 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17A532668
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:37:52 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id g62so4706257pfb.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Oct 2022 04:37:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=daynix-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=28wDlqMofB1pExK+J7NJqLJ5sSPJ8IDYDWuGoZcg4WU=;
        b=zPrE3Z79yDGzLtfx2QawETgF1lUMugvN0C6qQ0CWIaiD5/kUtQIJww0VDJMrkYc3N9
         elYuVucHc32XKow2YGLm3Vr08Z5vsbFCWlv4vq7Nx1QXhYg0jtjzlw0H9CXWI7Ta2vol
         6FUMEN9tnwiBaSCwpYfKwo7U/Mq0MJA9eOTbkI8+uvO7eXR9gmEds/Sy3ur7LFminYR1
         NVY1BZW0FhIWVkiQMHh5J542GVxkeRWv1QNvckPM+a6g8eqefXzkOAt0+7UqdUmERKZa
         J+mLK9mmXa4DfceGk2cEkxou1QrTtBSQu+UKjsPm36wMjvQrtPcLMKbyQMEJWea/JWpP
         WvvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=28wDlqMofB1pExK+J7NJqLJ5sSPJ8IDYDWuGoZcg4WU=;
        b=1rn8xcvceAnvrz9F5yR91DrRye7NYg9kaJ9KOjvh9ygKvgHVFsjfnR5Pi5rNr0iKMb
         5qkerNL2/D/UzA9zXiq/bMqK8agbtrviyGlHNk4JRvwqpdhzq0XQGYitAW75pWJypNKe
         ZHSdF5KeiIma9ZmZdX08BTLMplRg6xS4oiGb3NYz0q0MjXakbyQTTaSWbZhNizm6ojgo
         W5qKLmImAnt+wKqW5tPKb5sAF6nN6KafKFtb//E5bVqBm2deqbiCnkJ9mlLj4JN+9jze
         UaIBxyp1Pq7FvpuydXySM4YSmR9h65DF+aDjlh6JQ73feomcjjhAv/2nyR75VyB+a3Ak
         DkmQ==
X-Gm-Message-State: ACrzQf2LsoDppW5WtExAVbXPe5aUu+QEZyDvlBsgMrcbPvE65lxai/ty
        e4R9x+s04HGCTF7ZRI1sOvzuzg==
X-Google-Smtp-Source: AMsMyM6SfjrakTfflVuQ8PwvI36ClP4mxWtm2JBvE32zMW6Lo2xtR9eBT667zzx11rUWR7R7KloyFA==
X-Received: by 2002:a63:5702:0:b0:44b:290:f24f with SMTP id l2-20020a635702000000b0044b0290f24fmr27871108pgb.558.1666611399944;
        Mon, 24 Oct 2022 04:36:39 -0700 (PDT)
Received: from fedora.flets-east.jp ([2400:4050:c360:8200:8ae8:3c4:c0da:7419])
        by smtp.gmail.com with ESMTPSA id b8-20020a170903228800b001830ed575c3sm19475075plh.117.2022.10.24.04.36.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:36:39 -0700 (PDT)
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
Subject: [PATCH 07/22] platform/x86: compal-laptop: Use acpi_video_get_backlight_types()
Date:   Mon, 24 Oct 2022 20:34:58 +0900
Message-Id: <20221024113513.5205-8-akihiko.odaki@daynix.com>
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
 drivers/platform/x86/compal-laptop.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/compal-laptop.c b/drivers/platform/x86/compal-laptop.c
index e10d2f64dfad..16ced03fa1b7 100644
--- a/drivers/platform/x86/compal-laptop.c
+++ b/drivers/platform/x86/compal-laptop.c
@@ -1043,7 +1043,7 @@ static int __init compal_init(void)
 		return -ENODEV;
 	}
 
-	if (acpi_video_get_backlight_type() == acpi_backlight_vendor) {
+	if ((acpi_video_get_backlight_types() & ACPI_BACKLIGHT_VENDOR)) {
 		struct backlight_properties props;
 		memset(&props, 0, sizeof(struct backlight_properties));
 		props.type = BACKLIGHT_PLATFORM;
-- 
2.37.3

