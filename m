Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 05C742F51E8
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Jan 2021 19:25:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728252AbhAMSXk (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Jan 2021 13:23:40 -0500
Received: from mail1.protonmail.ch ([185.70.40.18]:54928 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727984AbhAMSXk (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Jan 2021 13:23:40 -0500
Date:   Wed, 13 Jan 2021 18:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610562177;
        bh=iqAwI1IuE13sRI/q34P1JwdMO/H3mkdvkrVBPMh6n3k=;
        h=Date:To:From:Reply-To:Subject:From;
        b=ZNJXQHYKAW6K45YLe5SeFs8nVIOAztmfAML2rrV3ZoBP5tdsNmcO3A6vJI8IZYFfW
         mZepqzc7h3se1I4k8d6dS1qoNBVXC60ooDdXBMjMA70HAc4xKfc+yT6jrYm1gUhGlK
         XtWGIydH9eAyok00sVkSCMlQWg7Bh2Ip1w1cxA2Q=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH v2 23/24] Documentation/ABI: sysfs-platform-ideapad-laptop: update device attribute paths
Message-ID: <20210113182016.166049-24-pobrn@protonmail.com>
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

The documentation referred to non-existent device attributes under a non-ex=
istent
platform device. Update it with the current location of the attributes.

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>

diff --git a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop b/Docu=
mentation/ABI/testing/sysfs-platform-ideapad-laptop
index fd2ac02bc5bd..e024678947c8 100644
--- a/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
+++ b/Documentation/ABI/testing/sysfs-platform-ideapad-laptop
@@ -1,11 +1,11 @@
-What:=09=09/sys/devices/platform/ideapad/camera_power
+What:=09=09/sys/bus/platform/devices/VPC2004:*/camera_power
 Date:=09=09Dec 2010
 KernelVersion:=092.6.37
 Contact:=09"Ike Panhc <ike.pan@canonical.com>"
 Description:
 =09=09Control the power of camera module. 1 means on, 0 means off.
=20
-What:=09=09/sys/devices/platform/ideapad/fan_mode
+What:=09=09/sys/bus/platform/devices/VPC2004:*/fan_mode
 Date:=09=09June 2012
 KernelVersion:=093.6
 Contact:=09"Maxim Mikityanskiy <maxtram95@gmail.com>"
@@ -18,7 +18,7 @@ Description:
 =09=09=09* 2 -> Dust Cleaning
 =09=09=09* 4 -> Efficient Thermal Dissipation Mode
=20
-What:=09=09/sys/devices/platform/ideapad/touchpad
+What:=09=09/sys/bus/platform/devices/VPC2004:*/touchpad
 Date:=09=09May 2017
 KernelVersion:=094.13
 Contact:=09"Ritesh Raj Sarraf <rrs@debian.org>"
@@ -27,7 +27,7 @@ Description:
 =09=09=09* 1 -> Switched On
 =09=09=09* 0 -> Switched Off
=20
-What:=09=09/sys/bus/pci/devices/<bdf>/<device>/VPC2004:00/fn_lock
+What:=09=09/sys/bus/platform/devices/VPC2004:*/fn_lock
 Date:=09=09May 2018
 KernelVersion:=094.18
 Contact:=09"Oleg Keri <ezhi99@gmail.com>"
--=20
2.30.0

