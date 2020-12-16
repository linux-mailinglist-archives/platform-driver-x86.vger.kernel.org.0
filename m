Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 433642DB890
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:41:53 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725782AbgLPBlv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:41:51 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:19234 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725308AbgLPBlu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:41:50 -0500
Date:   Wed, 16 Dec 2020 01:40:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082868;
        bh=ZDOaGZO1FZvYUEx2WVnib8Vp9DM8TW1tS+rpK8EWb9I=;
        h=Date:To:From:Reply-To:Subject:From;
        b=KCq8EZPCSMfUQbM+D09EdgNsflWniKdi4K9Kt+s6dXWP4+t4aULyXkSR5z8goLHVw
         brBdwyIE1/N8QiRf3R1hfUwv8RP9D/mHK9I0l5ufqekXMQlPwHpBmzm71SxJv8X3bk
         Ejo6aM9qVDB1tBFXElXsWMsRCTRRkHtLXuUUWmoM=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 24/24] Documentation/ABI: sysfs-platform-ideapad-laptop: conservation_mode and usb_charging
Message-ID: <20201216013857.360987-25-pobrn@protonmail.com>
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

Document the conservation_mode and usb_charging attributes provided
by the ideapad-laptop module.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index e024678947c8..c5aad51a8b7c 100644
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
@@ -41,3 +50,12 @@ Description:
=20
 =09=09  # echo "0" >=09\
 =09=09  /sys/bus/pci/devices/0000:00:1f.0/PNP0C09:00/VPC2004:00/fn_lock
+
+What:=09=09/sys/bus/platform/devices/VPC2004:*/usb_charging
+Date:=09=09Dec 2020
+KernelVersion:=095.11
+Contact:=09platform-driver-x86@vger.kernel.org
+Description:
+=09=09Controls whether the "always on USB charging" feature is
+=09=09enabled or not. This features enables charging USB devices
+=09=09even if the computer is not turned on.
--=20
2.29.2


