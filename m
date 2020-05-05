Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 272B91C52D4
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 May 2020 12:15:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728689AbgEEKPy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 06:15:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727931AbgEEKPx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 06:15:53 -0400
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6A32C061A0F
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 03:15:53 -0700 (PDT)
Received: by mail-pg1-x531.google.com with SMTP id r4so836827pgg.4
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 03:15:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=bjZMdeuzx2PIBz1vbaZLBMeL/Vkx+BXnnteiIcL5/b4=;
        b=OyAu0JU5e2nK3K/fBokg5QomWvJqdkkdyQwNNzM1bZ9p0ZSCqTXn1H7zh0E6Uf/C2d
         5pscQQC0BRrQQulDE/ZYR2K3pQ2SYVHDt2K2lGTsp6jIp3DijY0bUWNpRiuHft7wdGHt
         DNNKtUQrJ+OyayIp/ZOF/zFD+ZBzHVstFVP9osMHndxZ60TMsBryExGaQ2bMHektPGK3
         2LCXUOl3RPs/+HwdJkEXFzcszWkO88mGE1YTYVYSlzz2chAdcTo5RJDoaGZ8G6J3j3DQ
         mFM2RefhP6lM0f2jC/oYFlc0Pe9ADAoPa+bHN7F8kWR5sm9hbUBvvP1Ggax5yyBNwwIF
         8DGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=bjZMdeuzx2PIBz1vbaZLBMeL/Vkx+BXnnteiIcL5/b4=;
        b=B55EPbvVWgIEHcYwXdIHwcWqH5WomPUgbSS9kanujCIZ6PDP27lzLSg69oT9Wvf7ku
         OTy/tG8V4vNddwG8DmBxo2+bBikSIUiXAGvX/I7UdCQ69jU537F075ChDs08ar3Pxlg5
         EpzqNudHoAqSSmQ15ZK6onrX8QHTButjo1PXGrIwfHewJMoi1i3oK96Od2VVnu2cun0D
         OfkDkRf7DLZgWe88vPrASlTxGAsyEtiE3PQjvi0KBGyoLvwmbgAhD6Vspwd8hd37xWic
         fLLtIoxT2yFMnyOfnczczh+kNXoTvhGqPKae52iC1xQdv3ttLsiofA6vfx4RnUuGhhIy
         cjQw==
X-Gm-Message-State: AGi0PuZVCqN21Pcq+T+y7qLxLkdaGxb6yiXitj58j82mcCubvPsVSkqE
        u0jj3HoyMbrJL+/Nr9YebcvD4V1OePTDYQ==
X-Google-Smtp-Source: APiQypKjuANwEfr0ZpugwswQHngqyscFYuvtdImVaTVWQDcPwxToX5b1KvcctHxdU+n/gAPm2nMG0Q==
X-Received: by 2002:a62:7d8c:: with SMTP id y134mr2587127pfc.231.1588673752625;
        Tue, 05 May 2020 03:15:52 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id u188sm1624701pfu.33.2020.05.05.03.15.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 03:15:52 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 77D7F240ADA; Tue,  5 May 2020 20:18:11 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>
Subject: [PATCH 0/2] Two fixes for one sony-laptop reported bug on 5.6
Date:   Tue,  5 May 2020 20:18:08 +0900
Message-Id: <20200505111810.65586-1-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

They are both candidates for stable.

Mattia Dongili (2):
  [sony-laptop] SNC calls should handle BUFFER types
  [sony-laptop] Don't use thermal handle if NULL

 drivers/platform/x86/sony-laptop.c | 45 ++++++++++--------------------
 1 file changed, 14 insertions(+), 31 deletions(-)

-- 
2.25.1

