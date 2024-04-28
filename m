Return-Path: <platform-driver-x86+bounces-3110-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 74F458B4DA0
	for <lists+platform-driver-x86@lfdr.de>; Sun, 28 Apr 2024 21:26:55 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C2AAB2815BE
	for <lists+platform-driver-x86@lfdr.de>; Sun, 28 Apr 2024 19:26:53 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 75FE473533;
	Sun, 28 Apr 2024 19:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b="W00eijjg"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48B7B79EA
	for <platform-driver-x86@vger.kernel.org>; Sun, 28 Apr 2024 19:26:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.40.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714332410; cv=none; b=fu1zMRQTVvAy/L6iWBI7XlCz/WPnU4fWBLxZFCOCXYI3Zc7OqZWMPDfVN3rJQ/6/GFDPApZ2GguE4fI2Jgwi5kOMRFdT5Si5ruor8jjVo4UxQ7fLMH32LrvSPZP8bPX5JUmhAWRCSV7eOcqCq0xFUltd910PpWpNMgd++SZy0sE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714332410; c=relaxed/simple;
	bh=7SeU37LkQUjBnW0vKM/OHdQSjwL1fMqh2Dr0tLsHXyE=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MWsx2LYpW6YN5pqrp7KM4h+t1FMT1trOxpn377sfc6DB4zWREMyC4n4ZRSYvPNoHYsBix65rN8w15ecnNxziYLLowP+an60q7YnPKnSK6cE5kqrddkhimh0DGlgM7A96Vt8FWENHWwiixK90tY1jQha9LCTr0/jpHj+gawgxDEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art; spf=pass smtp.mailfrom=bluemarch.art; dkim=pass (2048-bit key) header.d=bluemarch.art header.i=@bluemarch.art header.b=W00eijjg; arc=none smtp.client-ip=185.70.40.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bluemarch.art
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bluemarch.art
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bluemarch.art;
	s=protonmail2; t=1714332400; x=1714591600;
	bh=7SeU37LkQUjBnW0vKM/OHdQSjwL1fMqh2Dr0tLsHXyE=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=W00eijjgfJQAt30WGglrJnav/ZykdRkD2O3Uy34DsavAvLMSnYqhVnDjMcvHex67U
	 hihmxA85t8dwNUIpJHX/+/LoHBOtmtvtAxMRN6hylxYGy/FYtTDpkPcvJx1+CV5jiU
	 ifIbYNC0eyFewVrB7THZNOH5QW4uwAgslcK2orVPnLYUEpgoyp6aLu5kmK6rzh4Flw
	 hfoQFYNnv0cVZg6WyQM+28i2DteWtQKJhASRU1stQPdfkNBs86nbdBE7V/lceHBKmP
	 di6hSovs+8YKAQ+TmAzOcZL5ieeG7TCjM7f68ZDDOFp2ncYS/JCVd0rR6Sfmjxcvvs
	 RNkngUjEKoChw==
Date: Sun, 28 Apr 2024 19:26:33 +0000
To: linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org, jwoithe@just42.net, hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com
From: Szilard Fabian <szfabian@bluemarch.art>
Cc: Szilard Fabian <szfabian@bluemarch.art>
Subject: [PATCH] platform/x86/fujitsu-laptop: Replace sprintf() with sysfs_emit()
Message-ID: <20240428192548.113261-1-szfabian@bluemarch.art>
Feedback-ID: 87830438:user:proton
X-Pm-Message-ID: 91986108e2b793fc817e8c7a9acf033c4c9c77e6
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

As suggested by Documentation/filesystems/sysfs.rst sysfs_emit() should be
used when formatting the value to be returned to user space.

Signed-off-by: Szilard Fabian <szfabian@bluemarch.art>
---
 drivers/platform/x86/fujitsu-laptop.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/fujitsu-laptop.c b/drivers/platform/x86/f=
ujitsu-laptop.c
index 94480af49467..968fc91bd5e4 100644
--- a/drivers/platform/x86/fujitsu-laptop.c
+++ b/drivers/platform/x86/fujitsu-laptop.c
@@ -386,11 +386,11 @@ static ssize_t lid_show(struct device *dev, struct de=
vice_attribute *attr,
 =09struct fujitsu_laptop *priv =3D dev_get_drvdata(dev);
=20
 =09if (!(priv->flags_supported & FLAG_LID))
-=09=09return sprintf(buf, "unknown\n");
+=09=09return sysfs_emit(buf, "unknown\n");
 =09if (priv->flags_state & FLAG_LID)
-=09=09return sprintf(buf, "open\n");
+=09=09return sysfs_emit(buf, "open\n");
 =09else
-=09=09return sprintf(buf, "closed\n");
+=09=09return sysfs_emit(buf, "closed\n");
 }
=20
 static ssize_t dock_show(struct device *dev, struct device_attribute *attr=
,
@@ -399,11 +399,11 @@ static ssize_t dock_show(struct device *dev, struct d=
evice_attribute *attr,
 =09struct fujitsu_laptop *priv =3D dev_get_drvdata(dev);
=20
 =09if (!(priv->flags_supported & FLAG_DOCK))
-=09=09return sprintf(buf, "unknown\n");
+=09=09return sysfs_emit(buf, "unknown\n");
 =09if (priv->flags_state & FLAG_DOCK)
-=09=09return sprintf(buf, "docked\n");
+=09=09return sysfs_emit(buf, "docked\n");
 =09else
-=09=09return sprintf(buf, "undocked\n");
+=09=09return sysfs_emit(buf, "undocked\n");
 }
=20
 static ssize_t radios_show(struct device *dev, struct device_attribute *at=
tr,
@@ -412,11 +412,11 @@ static ssize_t radios_show(struct device *dev, struct=
 device_attribute *attr,
 =09struct fujitsu_laptop *priv =3D dev_get_drvdata(dev);
=20
 =09if (!(priv->flags_supported & FLAG_RFKILL))
-=09=09return sprintf(buf, "unknown\n");
+=09=09return sysfs_emit(buf, "unknown\n");
 =09if (priv->flags_state & FLAG_RFKILL)
-=09=09return sprintf(buf, "on\n");
+=09=09return sysfs_emit(buf, "on\n");
 =09else
-=09=09return sprintf(buf, "killed\n");
+=09=09return sysfs_emit(buf, "killed\n");
 }
=20
 static DEVICE_ATTR_RO(lid);
--=20
2.44.0



