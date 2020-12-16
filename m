Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 471682DB889
	for <lists+platform-driver-x86@lfdr.de>; Wed, 16 Dec 2020 02:40:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725796AbgLPBkg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Dec 2020 20:40:36 -0500
Received: from mail2.protonmail.ch ([185.70.40.22]:61118 "EHLO
        mail2.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725783AbgLPBkg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Dec 2020 20:40:36 -0500
Date:   Wed, 16 Dec 2020 01:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1608082789;
        bh=gmAxguOG3WaPpE2+DSl8Kqy0YaxUZSOoD96cmDjDB3Y=;
        h=Date:To:From:Reply-To:Subject:In-Reply-To:References:From;
        b=ThlGWdX1imE4aP0acZgajK0DfCeQHSoVGOaVahqvEjhRfZLK8pEAfsUOpeYuc/VJz
         sNIdwg8Vc8lsW5QG6YlueU3TUH41KPJxEfHkLDFxK2lCmX1gJpNv+nqUQ1s/DfK4Mx
         koM4fbNNhJWom4VTN/2mbKxpvUg73Uit7qEjE16I=
To:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH 10/24] platform/x86: ideapad-laptop: misc. device attribute changes
Message-ID: <20201216013857.360987-11-pobrn@protonmail.com>
In-Reply-To: <20201216013857.360987-1-pobrn@protonmail.com>
References: <20201216013857.360987-1-pobrn@protonmail.com>
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

Do not handle zero length buffer separately. Use kstrtouint() instead
of sscanf().

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>

diff --git a/drivers/platform/x86/ideapad-laptop.c b/drivers/platform/x86/i=
deapad-laptop.c
index b6b5a508a8b8..a615c42d1beb 100644
--- a/drivers/platform/x86/ideapad-laptop.c
+++ b/drivers/platform/x86/ideapad-laptop.c
@@ -363,13 +363,13 @@ static ssize_t store_ideapad_cam(struct device *dev,
 =09=09=09=09 struct device_attribute *attr,
 =09=09=09=09 const char *buf, size_t count)
 {
-=09int ret, state;
+=09int ret;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned int state;
=20
-=09if (!count)
-=09=09return 0;
-=09if (sscanf(buf, "%i", &state) !=3D 1)
-=09=09return -EINVAL;
+=09ret =3D kstrtouint(buf, 0, &state);
+=09if (ret)
+=09=09return ret;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_CAMERA, state);
 =09if (ret)
 =09=09return ret;
@@ -396,14 +396,14 @@ static ssize_t store_ideapad_fan(struct device *dev,
 =09=09=09=09 struct device_attribute *attr,
 =09=09=09=09 const char *buf, size_t count)
 {
-=09int ret, state;
+=09int ret;
 =09struct ideapad_private *priv =3D dev_get_drvdata(dev);
+=09unsigned int state;
=20
-=09if (!count)
-=09=09return 0;
-=09if (sscanf(buf, "%i", &state) !=3D 1)
-=09=09return -EINVAL;
-=09if (state < 0 || state > 4 || state =3D=3D 3)
+=09ret =3D kstrtouint(buf, 0, &state);
+=09if (ret)
+=09=09return ret;
+=09if (state > 4 || state =3D=3D 3)
 =09=09return -EINVAL;
 =09ret =3D write_ec_cmd(priv->adev->handle, VPCCMD_W_FAN, state);
 =09if (ret)
--=20
2.29.2


