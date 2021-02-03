Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A7EC930E557
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 22:58:46 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbhBCV6U (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 16:58:20 -0500
Received: from mail-40133.protonmail.ch ([185.70.40.133]:63174 "EHLO
        mail-40133.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232249AbhBCV6Q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 16:58:16 -0500
Date:   Wed, 03 Feb 2021 21:57:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1612389454;
        bh=NRdox9uK80FeSyw0JXeDXp+xsYb7sTbF42CRT+GBb38=;
        h=Date:To:From:Reply-To:Subject:From;
        b=FTVLQZt2qrpE22EeTzYbWUZInGVabuGf6Y9yeaa4V4aV9TWSSpMHEwDZG3w8l3CiX
         e4swTUgCCBMdN8Cvh1Yn3+aTJkZT0tFDO8inZmyObhuq7nwcEPtbZY+MLBQmbRlxCi
         VVYoX8WTeNFiMj+EkU/8HKkBeEpfv88tmwEH+4KM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v3 29/29] Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode attribute
Message-ID: <20210203215403.290792-30-pobrn@protonmail.com>
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

Document the conservation_mode attributes provided by the ideapad-laptop mo=
dule.

Fixes: ade50296186a ("platform/x86: ideapad-laptop: Expose conservation mod=
e switch")
Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index 5ec0dee9e707..4989ab266682 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -27,6 +27,15 @@ Description:
 =09=09=09* 1 -> Switched On
 =09=09=09* 0 -> Switched Off
=20
+What:=09=09/sys/bus/platform/devices/VPC2004:*/conservation_mode
+Date:=09=09Aug 2017
+KernelVersion:=094.14
+Contact:=09platform-driver-x86@vger.kernel.org
+Description:
+=09=09Controls whether the conservation mode is enabled or not.
+=09=09This feature limits the maximum battery charge percentage to
+=09=09around 50-60% in order to prolong the lifetime of the battery.
+
 What:=09=09/sys/bus/platform/devices/VPC2004:*/fn_lock
 Date:=09=09May 2018
 KernelVersion:=094.18
--=20
2.30.0


