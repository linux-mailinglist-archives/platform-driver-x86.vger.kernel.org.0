Return-Path: <platform-driver-x86+bounces-346-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 97BEB80BCEB
	for <lists+platform-driver-x86@lfdr.de>; Sun, 10 Dec 2023 21:25:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3C3A91F20F2B
	for <lists+platform-driver-x86@lfdr.de>; Sun, 10 Dec 2023 20:25:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F29851C2BC;
	Sun, 10 Dec 2023 20:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="HzBsEK2j"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.21])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BC51D9;
	Sun, 10 Dec 2023 12:25:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702239890; x=1702844690; i=w_armin@gmx.de;
	bh=nEzwU52lYQi+/R9GIe0rBArnh2CCXp/tBe9TfyhvPCA=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=HzBsEK2jbC7OYIDMBKiLE6ndf+6zsa0+OuRKfPYxi1ccm/G8EXR9mWriMCsTgLMD
	 OxWce9PKoMzJ7rc/qb3I056WBaEO0+wv1lZRJjiUFwj1uwgxpCkcsHudxhtiKA7JB
	 TFrEm69cMgRSm7TEdTtrKEdCIU/eAlmUgb0L4WLXbpMftnV4bic1twqWq1BsXEMUM
	 5N9MXnEU+QmU7vu5YsNhnwNRhOLFdbhXkvGVUwbQoXB46be0pSKqI/jLFzUz5vhBv
	 wb5KDMCSkcRZzxXbk3416fn+BqVlP0Js1Lh2VmJP/kWHiQGx7LTCYSYO6Wy6kqVOJ
	 r8mDLAfBZtEek7zFqA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MCsQ4-1r3evi0EvQ-008q9M; Sun, 10 Dec 2023 21:24:50 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	corbet@lwn.net
Cc: Dell.Client.Kernel@dell.com,
	linux-doc@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/5] platform/x86: wmi: Remove debug_dump_wdg module param
Date: Sun, 10 Dec 2023 21:24:39 +0100
Message-Id: <20231210202443.646427-2-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231210202443.646427-1-W_Armin@gmx.de>
References: <20231210202443.646427-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:18uIVdOhrEMyff6XzMXk1KWrC5IIU9dSuao/uPp08FVCUmbmN6h
 0gagiKgH/Ohdhefw+Gu267noKKcVjc+Bb+YI3gbbLksc+5TlzuOnyJ/LJuCX+0JveOvd/L1
 kNGnLQOs01BY97rpWhP01Nks866uTnEdTRXXEjUwB+5SKCYFVU/SVqeg/zdm3tLZzPoNtIz
 PX3zgvYHDa5Hu+FHEMzTQ==
UI-OutboundReport: notjunk:1;M01:P0:2GkTMKMnWyE=;q5W6DdyV1IzpPDr1aVejIBdZftA
 berl80ecIpCZNOD9M3GBQibfovAzxfr2RpvM0WOaBJUZ/UxQ4d2JzauQcnaBOZGfaFyXEkXJN
 fjdsMP06IoZhxCA8xRK/hZE61d5XyxedIQDjqRjpvHWlmnGxtv1Ehb9UEcqwpggwknd2cgwIz
 MXAEvw9/jCsy8nNXkeOPFqZ8orQ/uac0CzmtYeylYu/pNX9Fp7/SZt+UnQQzcWVP/NaJtzcHN
 FxW/nck1g1P9JWYfRUMmlcvRD2xh4lnuIZ76hZoQFK/bLri4uE6ZDbeCkpDmVJpF/bogxMMi3
 1w26AMP35ybsOMokULwKiqkD/0h7jz6EtU0vJthbOISm2XIuvKIfIX+XfjbX106w2m5QLlkiD
 fQKzLr+K2SdLwZ3+mbMRmrBSqKATFOP3og701mIpU8VeWC84+95OMyzhglx5sahfFfAUTwZHI
 OCF74JcqkHC1aTockj/P1f28ruyJziRvd73HEUlxaV3nZaIG5IcYxjABTb//Y6fVkS62uc1jc
 eyKNzq2UAY+yhrrpHCeh1BomeLz/6Q+5XT2246tTbWgleaUhn74pfrI/UUq6JQOCtlBsOEj/n
 Lige9A2Z5AcmJtQXLuLRZ5204fLEb/9/yTuniZ2/aktdgj2nQ5k0+8HGh3XHvueKPf93N1Sya
 6sktv+TXpKC0aajMRa54DginfTvPqq7Nmc4SPR3sxOmV+6S0DNsXRUUGPJv47SNvJK9OUWL1+
 QOPwTTaGQU02heir8Ccn6G7FFmMxjwCz1lLYIlSzHWics0tN7ePzDo33pbHh7M8YZPdAjOBdJ
 fTtsU9PHZKMFjRI1vMj8rmla3CTrQmh8lNLTOYVtXA3Z+TnP5TUOCkp1f5XNNV5UHHOhUeErF
 qSCfOW5EF8C0/293RF6izn14VChBpYTrbOKt8MxMcp3vS/ykILle2PT+gYtIZHRb2BsBKD5ku
 jQ8S9ZfJ9b/69Hmr4tCr1ZnvlMA=

The functionality of dumping WDG entries is better provided by
userspace tools like "fwts wmi", which also does not suffer from
garbled printk output caused by pr_cont().

Reviewed-by: Ilpo J=C3=A4rvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi.c | 31 -------------------------------
 1 file changed, 31 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 4f94e4b117f1..e8019bc19b4f 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -90,11 +90,6 @@ module_param(debug_event, bool, 0444);
 MODULE_PARM_DESC(debug_event,
 		 "Log WMI Events [0/1]");

-static bool debug_dump_wdg;
-module_param(debug_dump_wdg, bool, 0444);
-MODULE_PARM_DESC(debug_dump_wdg,
-		 "Dump available WMI interfaces [0/1]");
-
 static const struct acpi_device_id wmi_device_ids[] =3D {
 	{"PNP0C14", 0},
 	{"pnp0c14", 0},
@@ -597,29 +592,6 @@ acpi_status wmidev_block_set(struct wmi_device *wdev,=
 u8 instance, const struct
 }
 EXPORT_SYMBOL_GPL(wmidev_block_set);

-static void wmi_dump_wdg(const struct guid_block *g)
-{
-	pr_info("%pUL:\n", &g->guid);
-	if (g->flags & ACPI_WMI_EVENT)
-		pr_info("\tnotify_id: 0x%02X\n", g->notify_id);
-	else
-		pr_info("\tobject_id: %2pE\n", g->object_id);
-	pr_info("\tinstance_count: %d\n", g->instance_count);
-	pr_info("\tflags: %#x", g->flags);
-	if (g->flags) {
-		if (g->flags & ACPI_WMI_EXPENSIVE)
-			pr_cont(" ACPI_WMI_EXPENSIVE");
-		if (g->flags & ACPI_WMI_METHOD)
-			pr_cont(" ACPI_WMI_METHOD");
-		if (g->flags & ACPI_WMI_STRING)
-			pr_cont(" ACPI_WMI_STRING");
-		if (g->flags & ACPI_WMI_EVENT)
-			pr_cont(" ACPI_WMI_EVENT");
-	}
-	pr_cont("\n");
-
-}
-
 static void wmi_notify_debug(u32 value, void *context)
 {
 	struct acpi_buffer response =3D { ACPI_ALLOCATE_BUFFER, NULL };
@@ -1343,9 +1315,6 @@ static int parse_wdg(struct device *wmi_bus_dev, str=
uct platform_device *pdev)
 	total =3D obj->buffer.length / sizeof(struct guid_block);

 	for (i =3D 0; i < total; i++) {
-		if (debug_dump_wdg)
-			wmi_dump_wdg(&gblock[i]);
-
 		if (!gblock[i].instance_count) {
 			dev_info(wmi_bus_dev, FW_INFO "%pUL has zero instances\n", &gblock[i].=
guid);
 			continue;
=2D-
2.39.2


