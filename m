Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 263682579D3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Aug 2020 14:58:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726292AbgHaM6L (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Aug 2020 08:58:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726446AbgHaM6G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Aug 2020 08:58:06 -0400
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com [IPv6:2a00:1450:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73161C061573
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 05:58:04 -0700 (PDT)
Received: by mail-ej1-x642.google.com with SMTP id a26so8402470ejc.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 05:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:subject:message-id:mime-version:content-disposition;
        bh=O1UfGYPjzwb8+zFqPd1QYm2lRuvEOQjeSQUpD3WyhJI=;
        b=qvD/yRnQoRk1XCraF/WjIQJljzx23bL10IVZRrnK92h6DpM0LXWYQUnnlHL32SjAcQ
         K+K+vWaZzZAT2BoDeKKvTzR5gajVDOa4y44WlkRJuz2E+4VZZB5innaJ66Fqvdea7auf
         3D57URUybQy8x9k4KLGSJl+w11kcXQkzZBgo7Y0njrLNm1RDXsC9FSCUxVzaurhIEfQA
         J56EqvsDYdj5seJxN6j6YpjCQB+OrhfiQSn0ZgwuKOMmA0RZjJSi9Q33eyDzMfxQGhuZ
         zGv/6Yt+uPHbJyHqJkmnJUda2tdkUHCFtgN08eiTV60qwRlIbIJ0LNpVT1bBl3ZrF4a4
         2GIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:subject:message-id:mime-version
         :content-disposition;
        bh=O1UfGYPjzwb8+zFqPd1QYm2lRuvEOQjeSQUpD3WyhJI=;
        b=G5uclgsH4Pw5pljWdKVbb46uPQsq/ECAxOKI6liRURudxiX50VyCqfQcixzFFOHfal
         pLOawfECGiRAB+PVTXKOHbdNosklUXhUlAnczhWwbU5UENzXmeXxyHItmsA+hsXluOa1
         AimWGsCvyvTMeq9LL0K6PWC10vGKvdqUAnckbOAzCnUIMPKtanacu/D5eXVq5uKecp/L
         qwb1LsYfKsDgZ0bXEhBnD1nobftUAlQPAkeZjRDO6oyg2sM0BI1PJ2VBRFd73TejMEUM
         v47+AQ2hiI02RcIdOz4ZSntVcfYNRwNunSyIuq7Tp6tgeDp/vhsi2q/z+zVzLu3JytW8
         Xo0g==
X-Gm-Message-State: AOAM530ZpAMIQqgRTgRH9es5lRV6n+LCTCbqjygRPX9MZmXiXLUVicWt
        W7E4z5YoaGx1ySVi66JHlB0=
X-Google-Smtp-Source: ABdhPJwe/5jOzsDod86m6KIe6fnjcBDSK9hf9xxyWkxqelgtCI1GdBIQpO4jYp+EeK4rM/BQs+jQbQ==
X-Received: by 2002:a17:906:28c4:: with SMTP id p4mr1010003ejd.345.1598878683130;
        Mon, 31 Aug 2020 05:58:03 -0700 (PDT)
Received: from archer ([82.77.79.3])
        by smtp.gmail.com with ESMTPSA id ch29sm1904977edb.74.2020.08.31.05.58.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Aug 2020 05:58:02 -0700 (PDT)
Date:   Mon, 31 Aug 2020 15:58:01 +0300
From:   Marius Iacob <themariusus@gmail.com>
To:     corentin.chary@gmail.com, acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] asus-wmi: Added BATC battery name to asus-wmi
Message-ID: <20200831125801.ieh2bgmyftpos4cy@archer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Intel Atom Cherry Trail platform reports a new battery
name (BATC). Tested on Asus Transformer Mini T103HAF.

Signed-off-by: Marius Iacob <themariusus@gmail.com>
---
 drivers/platform/x86/asus-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 8f4acdc06b13..fa39ff030bd7 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -442,6 +442,7 @@ static int asus_wmi_battery_add(struct power_supply *battery)
 	 */
 	if (strcmp(battery->desc->name, "BAT0") != 0 &&
 	    strcmp(battery->desc->name, "BAT1") != 0 &&
+	    strcmp(battery->desc->name, "BATC") != 0 &&
 	    strcmp(battery->desc->name, "BATT") != 0)
 		return -ENODEV;
 
-- 
2.28.0

