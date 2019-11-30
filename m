Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 66D9810DD2A
	for <lists+platform-driver-x86@lfdr.de>; Sat, 30 Nov 2019 09:53:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725792AbfK3Ixa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 30 Nov 2019 03:53:30 -0500
Received: from mail-wr1-f54.google.com ([209.85.221.54]:44164 "EHLO
        mail-wr1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbfK3Ixa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 30 Nov 2019 03:53:30 -0500
Received: by mail-wr1-f54.google.com with SMTP id q10so1615588wrm.11
        for <platform-driver-x86@vger.kernel.org>; Sat, 30 Nov 2019 00:53:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:from:date:subject:to;
        bh=TgfKb1LKW36qJ5JdqekhGn4X5BL44Fi4eKLSm7hhsRc=;
        b=1KKluKG/RCq2Aq/2xQbD+YZGjGbDLCgVAtHehlw3KqmfA9R6e7o4cLbFT3CtkMTMu0
         kbrF34AUB93eiL6dlsSNarixJsX72s0rQtZP4ASd8YRGH5K3fj1Q4n9EJf1V1x18ZFve
         QYbaruxCdzU+zoDrU50TsoXPbUf8QcCj84+7upss/RuQ0yoTU39XWYySGNB6nm4hvgbi
         K0H+S8Dh4qqK9lSgvbSZgeXHgtvnqO28RFhFcZ5MGUX+lAS26VmMO5NYEn/DjnFKxuz9
         PvFbe6eX1HDL2t2788afg7Qjzj5eB6HxfQVLrrphvai8koJrgPkW7vaVJP7vBcFsV/5I
         rpww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:date:subject:to;
        bh=TgfKb1LKW36qJ5JdqekhGn4X5BL44Fi4eKLSm7hhsRc=;
        b=XLB58q+JRVXVo2ojfGQXzygVniAYodbgsq+Y20dQhbLWTMGb/OW8DcRfiKW5q0Odaj
         YNnTXu0L8b5koKW6UiKII0DGQMozljM9Dbs9wSDkFjavGh4C8ocFOJiqpMIuGfak5/Yz
         Eu1thrmtO3bJvTHpJ0KpzZDdMvTXJQTqJRf4PSduWk9D5Hk9V15j+0rj2NwgMAEGVi02
         7ZnsqR06yGPIPg4Kie76RVTa6W9F8X62jfLAIw9ynWTs1Ig2aDtLwYVqGeGxM0I+TFac
         FqeC4i5TVey0Dpg11M1YlgH9UH6McM6hUvUt/gBsl+KCDso8G+0sobme6zB0UDv/TcRB
         puGg==
X-Gm-Message-State: APjAAAWd4JIJ/M7KGTtevXPrF3zbpSH5wDjrehYZZv1NavIXgSvLcBj5
        le34ar5y9j8ofulkF8D8Q+pskW3seA==
X-Google-Smtp-Source: APXvYqxT+NQqUpJxMk4byH6B8Yt0NcJlqO09MFclOqA0HGzUC4Zd7BiTKDdhrxy+uJRvztP2moc7Ng==
X-Received: by 2002:adf:db41:: with SMTP id f1mr57491408wrj.351.1575104008083;
        Sat, 30 Nov 2019 00:53:28 -0800 (PST)
Received: from matan ([2a02:ed0:5d47:4801:a552:bfc5:60c3:bcda])
        by smtp.gmail.com with ESMTPSA id c1sm1600244wmk.22.2019.11.30.00.53.26
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sat, 30 Nov 2019 00:53:26 -0800 (PST)
Message-Id: <cover.1575103866.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Sat, 30 Nov 2019 10:51:06 +0200
Subject: [PATCH V2 0/7] *** SUBJECT HERE ***
To:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

*** BLURB HERE ***

Matan Ziv-Av (7):
  platform/x86: lg-laptop.c: Add module version and fix whitespace
  platform/x86: lg-laptop.c: Use a small buffer instead of a full page
    for sysfs
  platform/x86: lg-laptop.c: Fix a bug in writing fan mode value
  platform/x86: lg-laptop.c: Get model name and year from DMI product
    name
  platform/x86: lg-laptop.c: Manage battery limit correctly for 2019
    models
  platform/x86: lg-laptop.c: Expose reader mode as a LED, rather than a
    sysfs file for 2018 and newer models
  platform/x86: lg-laptop.c: Document difference in reader mode handling

 .../admin-guide/laptops/lg-laptop.rst         |  13 ++-
 drivers/platform/x86/lg-laptop.c              | 106 +++++++++++++++---
 2 files changed, 102 insertions(+), 17 deletions(-)

-- 
2.21.0

