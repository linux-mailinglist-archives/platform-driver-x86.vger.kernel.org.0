Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B2A7A2562B3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Aug 2020 23:56:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726338AbgH1V4p (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Aug 2020 17:56:45 -0400
Received: from forward101o.mail.yandex.net ([37.140.190.181]:44517 "EHLO
        forward101o.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726033AbgH1V4o (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Aug 2020 17:56:44 -0400
X-Greylist: delayed 425 seconds by postgrey-1.27 at vger.kernel.org; Fri, 28 Aug 2020 17:56:43 EDT
Received: from mxback19o.mail.yandex.net (mxback19o.mail.yandex.net [IPv6:2a02:6b8:0:1a2d::70])
        by forward101o.mail.yandex.net (Yandex) with ESMTP id A883C3C00A37;
        Sat, 29 Aug 2020 00:49:34 +0300 (MSK)
Received: from iva7-f62245f79210.qloud-c.yandex.net (iva7-f62245f79210.qloud-c.yandex.net [2a02:6b8:c0c:2e83:0:640:f622:45f7])
        by mxback19o.mail.yandex.net (mxback/Yandex) with ESMTP id fQ1ldI2G8g-nYwGvIrq;
        Sat, 29 Aug 2020 00:49:34 +0300
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail; t=1598651374;
        bh=s5An47eODjHT+o4j3kagWob/K2b3iyeOoCxhaXrqLiU=;
        h=Subject:To:From:Message-Id:Cc:Date;
        b=do5+Fbd82r+xYLC2V5MmHOJ4htFrWtLOeSgpD0LneaJRalgh6wL7WZg1swDSDNJkn
         VCvHzlIXb5ekf59vhZxB7aHqxzokj0JCrrftD5X2PcE7fmPmvw+FPnP7athKMlAr/d
         wgXBi0WHbUjcH7XI4Oea8qMhDw2rO7CwmqhfPMbs=
Authentication-Results: mxback19o.mail.yandex.net; dkim=pass header.i=@yandex.ru
Received: by iva7-f62245f79210.qloud-c.yandex.net (smtp/Yandex) with ESMTPSA id wtE0T54V7Y-nXHWCx58;
        Sat, 29 Aug 2020 00:49:33 +0300
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (Client certificate not present)
From:   Vasiliy Kupriakov <rublag-ns@yandex.ru>
To:     Corentin Chary <corentin.chary@gmail.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Vasiliy Kupriakov <rublag-ns@yandex.ru>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/3] platform/x86: asus-wmi: Improve TUF laptops support
Date:   Sat, 29 Aug 2020 00:49:29 +0300
Message-Id: <20200828214932.20866-1-rublag-ns@yandex.ru>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These three patches improve ASUS TUF laptops support: allow sysfs
polling for thermal throttle policy (or fan boost mode) change, add
another (ugly) method for fan detection and implement gpu fan reading.

NOTES
1. First patch
Similar sysfs_notify call usage can be found in thinkpad-acpi driver.
Also, is it reasonable to implement a upower event?

2. Second patch
On my laptop firmware just returns the fan speed. Currently code checks
for ASUS_WMI_PRESENCE_BIT. So this check fails. But otherwise all the
fan speed reading code is the same. So I wrote function which compares
SPEC and SFUN values to those found on my machine (they are same in all
TUF DSDTs I've found), then tries to read fan speed and checks if it
lies in sane range (0-10000 RPM).

3. Third patch
GPU fan interface is the same as CPU fan, so I just used my fan detect
function if CPU fan is of type FAN_TYPE_SPEC83.
Also, maybe it is reasonable to use same strategy as for CPU fan: try to
check for the ASUS_WMI_PRESENCE_BIT and if it is failed, fall back to
ad hoc detection?

Vasiliy Kupriakov (3):
  platform/x86: asus-wmi: Add userspace notification for performance
    mode change
  platform/x86: asus-wmi: Add new fan type check
  platform/x86 asus-wmi: Add GPU fan reading support

 drivers/platform/x86/asus-wmi.c            | 85 ++++++++++++++++++++++
 include/linux/platform_data/x86/asus-wmi.h |  1 +
 2 files changed, 86 insertions(+)

-- 
2.28.0

