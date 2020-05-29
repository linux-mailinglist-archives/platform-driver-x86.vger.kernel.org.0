Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E918B1E796C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 29 May 2020 11:27:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725775AbgE2J1w (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 29 May 2020 05:27:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50114 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725306AbgE2J1v (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 29 May 2020 05:27:51 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D026C03E969
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 May 2020 02:27:50 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id s1so1790501ljo.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 29 May 2020 02:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=EV6kbOPfdyDY6s5ypMfeTxhPeGGhy2lO3zYOqX3ZizA=;
        b=QsVQ07OPn5pTEg7m/Fdjoi3vDOq2sLAM/7PcH5TZ3a9jI7EyFYHG1YcncnKuBw9OwA
         OP6BmkH7nJ3xPl6C7Ui+PRbirG/YPewYmqEleGkm8pRlYlKuabZ2am56kAfpX6o0Kv6t
         DGfKhUFb/gSDDtVCYxKpJzknP8wQw+i2l4lpQU7/f+3H9Ej4ST5yAWZQt5kIhRG/loXj
         8y8pOFMiiPIxeMuVNt1unEs+Vh+y9v10JE0jFGUk9sFFNrZrXTmdkd070NhT4RYupNz0
         KmjVliz0YxuW5rulktqlEr/qiga/Zti3YTJZO20nLBjCC5gh4GJQTqCRjpWmDARMHqZL
         QkMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=EV6kbOPfdyDY6s5ypMfeTxhPeGGhy2lO3zYOqX3ZizA=;
        b=f6g2ZOrHU2LUEEL08B2IStmVUWu+mlh8X3IrXdx487uggR4fJyzk+spBM/C4T9d00s
         BqsODm9CPgkwmFhmlzaOCpKEG/8lC0twXZ5CPt5FHAJucdnjCQZ9N7/g2fkD81RBAo3Y
         eC6s9CeZwkXj/qoncOlxhogIht9UX4MbaZbQcSk2gmyfFkQi7A5sziklaAKn9vIhjBsX
         3dIrt9MBKaR+KKXvaCEJq1UtG8VO3bHu/3ZYeXLT3BnbKQbPkGg2jLWCtXv8TGq/VYGz
         COvAbjVr4ZkOpdrogEt4A4fWu5jnMjiE8P6zCibbYw888z+XzxL48IcmaaDzwB67GQfz
         nNig==
X-Gm-Message-State: AOAM531P9qhvhWNjUl0gpID7IN8PwDpMWzd8XqWScOmW2pVkKrQ1WdON
        LNeUJ9P6ICO4N77gylr61ai8c8nHzu0=
X-Google-Smtp-Source: ABdhPJwzeyhgf3E2tGMIW4jdPTW81xCIwT9n1FpJBzw9MlbxyeH60MS2l6+Am9lJAzfH5RiYfg1RtQ==
X-Received: by 2002:a2e:9d5:: with SMTP id 204mr3513688ljj.168.1590744468279;
        Fri, 29 May 2020 02:27:48 -0700 (PDT)
Received: from [192.168.1.16] (95-31-124-98.broadband.corbina.ru. [95.31.124.98])
        by smtp.gmail.com with ESMTPSA id a6sm1911295lji.29.2020.05.29.02.27.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 29 May 2020 02:27:47 -0700 (PDT)
To:     alex.hung@canonical.com, platform-driver-x86@vger.kernel.org
From:   Nickolai Kozachenko <daemongloom@gmail.com>
Subject: [PATCH] intel-hid: expand DMI quirk to support HP Spectre X2 (2015)
Message-ID: <fce37b1c-40d7-6f80-1eb4-78a4446b35e9@gmail.com>
Date:   Fri, 29 May 2020 14:27:46 +0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: ru
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

HEBC method reports capabilities of 5 button array but HP Spectre X2 
(2015) does not have this control method (the same was for Wacom 
MobileStudio Pro). Previous DMI quirk  by Alex Hung was expanded to also 
enable 5 button array for this system.

Signed-off-by: Nickolai Kozachenko <daemongloom@gmail.com>
---
Tested on my own device.  Thanks to Alex Hung for creating quirk for 
Wacom MobileStudio devices that can be reused for HP Spectre X2 (2015).

--- drivers/platform/x86/intel-hid.c.orig    2020-05-29 
13:13:43.768032597 +0500
+++ drivers/platform/x86/intel-hid.c    2020-05-29 13:19:30.089899469 +0500
@@ -79,6 +79,13 @@ static const struct dmi_system_id button
              DMI_MATCH(DMI_PRODUCT_NAME, "Wacom MobileStudio Pro 16"),
          },
      },
+    {
+        .ident = "HP Spectre x2 (2015)",
+        .matches = {
+            DMI_MATCH(DMI_SYS_VENDOR, "HP"),
+            DMI_MATCH(DMI_PRODUCT_NAME, "HP Spectre x2 Detachable"),
+        },
+    },
      { }
  };

