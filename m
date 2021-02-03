Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CF8C130E552
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:58:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232459AbhBCV5j (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:57:39 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:61227 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232228AbhBCV5f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:57:35 -0500
Date:   Wed, 03 Feb 2021 21:56:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389413;
        bh=5FxRRrkFmar4Ehcc8jR90bfyXi3La/APIkJIK7zVWvY=;
        h=Date:To:From:Reply-To:Subject:From;
        b=w3XlScM2zBiWhg45ZS+nCeSrGjm6HHDUeSjTyDNeN/VviSunJNxxOH79BCUEN/t83
         Hlbh2fX8bjkHZToahgn+SnpPhTL/4qoTqiuJgg5mzzfIaEHatEQl/pph0TDyMZDKtz
         IdhfpgvymL6Up92R2BqcDAsILGIIZglW/bXTTLbs=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 23/29] Revert "platform/x86: ideapad-laptop: Switch touchpad attribute to be RO"
Message-ID: <20210203215403.290792-24-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The touchpad can be enabled/disabled via this attribute on a Lenovo
Yoga 520-14IKB. Allow writing as it provides legitimate functionality.

This reverts commit 7f363145992cebf4ea760447f1cfdf6f81459683.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index 0a5ca91cfe9e..4fd9670100cb 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -465,10 +465,9 @@ static ssize_t touchpad_show(struct device *dev,
 =09return sysfs_emit(buf, "%d\n", !!result);
 }
=20
-/* Switch to RO for now: It might be revisited in the future */
-static ssize_t __maybe_unused touchpad_store(struct device *dev,
-=09=09=09=09=09     struct device_attribute *attr,
-=09=09=09=09=09     const char *buf, size_t count)
+static ssize_t touchpad_store(struct device *dev,
+=09=09=09      struct device_attribute *attr,
+=09=09=09      const char *buf, size_t count)
 {
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
 =09bool state;
@@ -484,7 +483,7 @@ static ssize_t __maybe_unused touchpad_store(struct dev=
ice *dev,
 =09return count;
 }
=20
-static DEVICE_ATTR_RO(touchpad);
+static DEVICE_ATTR_RW(touchpad);
=20
 static ssize_t conservation_mode_show(struct device *dev,
 =09=09=09=09struct device_attribute *attr,
--=20
2.30.0


