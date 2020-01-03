Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 57B1A12F96B
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Jan 2020 16:01:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727942AbgACPBO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Jan 2020 10:01:14 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:51103 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727797AbgACPBO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jan 2020 10:01:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578063671;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=dmmU7Y4tXxpLxtzH+JL6KsCdBtRAVF0QRT/RRTASmHY=;
        b=iLuxrVMV5HpDiTT1R5RofR54HTqyMHiG51B5+UXbyL2JkXStDXM/w9DIb0TLwtX6yZKeLS
        uD2QpSqtHjxNw3lb2TlC1dCo+zgSsi6RWzY9+CBeK9zzL8+rQR6lNPUrKDGVt0209N+iMs
        FJlH9/T8QOSRVkH39Q0ccA6KrScIvw0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-232-hOiYr5TWOg623DI68S7aVA-1; Fri, 03 Jan 2020 10:01:07 -0500
X-MC-Unique: hOiYr5TWOg623DI68S7aVA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8576F802574;
        Fri,  3 Jan 2020 15:01:06 +0000 (UTC)
Received: from dhcp-44-196.space.revspace.nl (ovpn-112-44.ams2.redhat.com [10.36.112.44])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 16CAE7D973;
        Fri,  3 Jan 2020 15:01:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tim Josten <timjosten@gmail.com>
Subject: [PATCH] platform/x86: touchscreen_dmi: Add info for the PiPO W11 tablet
Date:   Fri,  3 Jan 2020 16:00:59 +0100
Message-Id: <20200103150059.14762-1-hdegoede@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Tim Josten <timjosten@gmail.com>

Add touchscreen info for the PiPO W11 tablet.

Signed-off-by: Tim Josten <timjosten@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/touchscreen_dmi.c | 28 ++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x8=
6/touchscreen_dmi.c
index 4a09b479cda5..3c9d913b71b3 100644
--- a/drivers/platform/x86/touchscreen_dmi.c
+++ b/drivers/platform/x86/touchscreen_dmi.c
@@ -511,6 +511,23 @@ static const struct ts_dmi_data pipo_w2s_data =3D {
 	.properties	=3D pipo_w2s_props,
 };
=20
+static const struct property_entry pipo_w11_props[] =3D {
+	PROPERTY_ENTRY_U32("touchscreen-min-x", 1),
+	PROPERTY_ENTRY_U32("touchscreen-min-y", 15),
+	PROPERTY_ENTRY_U32("touchscreen-size-x", 1984),
+	PROPERTY_ENTRY_U32("touchscreen-size-y", 1532),
+	PROPERTY_ENTRY_STRING("firmware-name",
+			      "gsl1680-pipo-w11.fw"),
+	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
+	PROPERTY_ENTRY_BOOL("silead,home-button"),
+	{ }
+};
+
+static const struct ts_dmi_data pipo_w11_data =3D {
+	.acpi_name	=3D "MSSL1680:00",
+	.properties	=3D pipo_w11_props,
+};
+
 static const struct property_entry pov_mobii_wintab_p800w_v20_props[] =3D=
 {
 	PROPERTY_ENTRY_U32("touchscreen-min-x", 32),
 	PROPERTY_ENTRY_U32("touchscreen-min-y", 16),
@@ -969,6 +986,17 @@ const struct dmi_system_id touchscreen_dmi_table[] =3D=
 {
 			DMI_MATCH(DMI_PRODUCT_NAME, "W2S"),
 		},
 	},
+	{
+		/* Pipo W11 */
+		.driver_data =3D (void *)&pipo_w11_data,
+		.matches =3D {
+			DMI_MATCH(DMI_SYS_VENDOR, "PIPO"),
+			DMI_MATCH(DMI_PRODUCT_NAME, "To be filled by O.E.M."),
+			/* Above matches are too generic, add bios-ver match */
+			DMI_MATCH(DMI_BIOS_VERSION,
+				  "JS-BI-10.6-SF133GR300-GA55B-024-F"),
+		},
+	},
 	{
 		/* Ployer Momo7w (same hardware as the Trekstor ST70416-6) */
 		.driver_data =3D (void *)&trekstor_surftab_wintron70_data,
--=20
2.23.0

