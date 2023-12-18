Return-Path: <platform-driver-x86+bounces-518-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id BF651817B77
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 20:56:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2E5C028550D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Dec 2023 19:56:30 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6D64574091;
	Mon, 18 Dec 2023 19:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="GUUNUgNB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 828D273477;
	Mon, 18 Dec 2023 19:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1702929341; x=1703534141; i=w_armin@gmx.de;
	bh=yBaISgjLgSkrk947Vjw+ExCxzpblr64RVT6udQOT+ys=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:In-Reply-To:
	 References;
	b=GUUNUgNBZQyRX9s0ru/T9lvrpz0GgONRLBc1F10PsQky5vDog40lDIcvBXkXIBHu
	 0o4kpwQanyg5yQpsOKwo6XdUG4GsSeN/qWyDYfcyuxr0Q/nMEPO679t8/gaIXbFZf
	 XBCloq91WUeP10U/E9wNXFFe8/pNqHTrxGPwu8/PscWVolNeB99YMsE0zTITt1rqY
	 fbSpd/oc0RTtFElspRfhdmVr91LJwL644T24rXtkn4Rj5BsbsdYu69uMqVrHVTujs
	 FNnY+FyEUvG4YmxIv7VHQbbm6OAc5bzJMc8jdLeqFaqqNzuM/7ULs6LOOkcSW1ulj
	 +7kC43zKBISzSF2fMA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1N79yG-1rE8xN0mY0-017W3H; Mon, 18 Dec 2023 20:55:41 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 4/6] platform/x86: wmi: Create WMI bus device first
Date: Mon, 18 Dec 2023 20:55:29 +0100
Message-Id: <20231218195531.311179-5-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231218195531.311179-1-W_Armin@gmx.de>
References: <20231218195531.311179-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:cpLPpmkqL1pTP3W9ifc7hlAXoPsmtbOyiZPB94n16UHvQY8wmvW
 c3kJ4nkZow3x6FUEpvItt8eHzSltA9kud8H8NF+tOoa2qouAMLKovQbDopP0lSza1CLjfNF
 kyT7Z0nUIOcQTCoFOmJc/eeebyF+Wg+1cGmZcH0v05HqG4NSvTbrozkMOFJESOEkFzEEt1s
 qRwDG+s95yyrhj0lac3VQ==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:j1oDhK+hKtw=;SBIKcjvr6Kj2CcbuoUCV/5paOc0
 4U7sPlU/EiH77hznYkNBssPlLfibkBbWZpi/nGBeQoEPsAvxM3wBoNQhQo6PMhwTMNi736NHW
 dEG4E1U8dPAuOcJDHY0YvfcB6dwgBLUQtFotpKe0ufMQhSFMnQUB3J1/NJOsy+Klfhp8IKyfL
 jlrxnZ8na6OzhfWyztdz6aPYm08HalPtWNO/lXZpI/Oo5K42PLQZVgFGTrb33t6W+Rig2NJz3
 yDyrbbhcTQlwRHXPZwtpd5Mg/OQdaNthtuMIo97fiSZaA5k8rnFD5xV4aC6Gvt5krKSwQUs9x
 j2E8lEaYVLYHTJtq+0OTw45BrdVYNHG+tAB8q3WEVl/qx4gFQDnM/w+5HdW/S/e26412L9K1s
 9atTH2H22T8gWtAvd3T5sVwFmngQeCsNGrIk1ZGpmyWfvTAzDtnz2/XnCrGGp5Mew4GRsTWfY
 iBjdLxB05ZpA30O4+PRWwLrphj1nBSPqjT1N9cl7wnu92QrvNyKlOjTlwzrQDFahb3u2ckpqz
 TMRtUYr0wPTVTlRajS0uZqj2yEYAMstKLBl1T2+7bv20rxWFeL7LlZ2Aya9nFn/9OodawLAPJ
 5HU46nMtdYi2ciCPapP2a9ux2c9ORxNMY8ELlo4tYvcWLX3kKDYmVH+7PpsAwQh1r/DzHUqls
 2KNnh0FsZFqpLfyVHziaeDHYdIzpvAVg5jBtIT00u/V4c+M6yK1aqmgcLkKFR4cHK4CDQbBD6
 hbqp2EANjCaNxt2aq7z57oTgZLQlcVihopbIeV+Uqn/NpDSb4AMEsZ701gh7hBTeG8fznlWe+
 mkPkAmPRYQHExMNWcJJ+aaVkg/oyOBeodmWmEk6HbLfp+c2oif82OlLowMllh1guS4g9bEcma
 S/AHtS56mSi+AERYDgnPz96LLCVQrPDLPPvrDra/wN71Y8Y4ntGyEFvBVUbxnFGSdTtRVQMix
 iIvWzHdv2CjGsc/hKszN727DKnk=

Create the WMI bus device first so that it can be used
by the ACPI handlers.

Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/wmi.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 4bc5da70c1b0..e2bfdc61c4ce 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1276,6 +1276,17 @@ static int acpi_wmi_probe(struct platform_device *d=
evice)
 		return -ENODEV;
 	}

+	wmi_bus_dev =3D device_create(&wmi_bus_class, &device->dev, MKDEV(0, 0),=
 NULL, "wmi_bus-%s",
+				    dev_name(&device->dev));
+	if (IS_ERR(wmi_bus_dev))
+		return PTR_ERR(wmi_bus_dev);
+
+	error =3D devm_add_action_or_reset(&device->dev, acpi_wmi_remove_bus_dev=
ice, wmi_bus_dev);
+	if (error < 0)
+		return error;
+
+	dev_set_drvdata(&device->dev, wmi_bus_dev);
+
 	status =3D acpi_install_address_space_handler(acpi_device->handle,
 						    ACPI_ADR_SPACE_EC,
 						    &acpi_wmi_ec_space_handler,
@@ -1302,17 +1313,6 @@ static int acpi_wmi_probe(struct platform_device *d=
evice)
 	if (error < 0)
 		return error;

-	wmi_bus_dev =3D device_create(&wmi_bus_class, &device->dev, MKDEV(0, 0),
-				    NULL, "wmi_bus-%s", dev_name(&device->dev));
-	if (IS_ERR(wmi_bus_dev))
-		return PTR_ERR(wmi_bus_dev);
-
-	error =3D devm_add_action_or_reset(&device->dev, acpi_wmi_remove_bus_dev=
ice, wmi_bus_dev);
-	if (error < 0)
-		return error;
-
-	dev_set_drvdata(&device->dev, wmi_bus_dev);
-
 	error =3D parse_wdg(wmi_bus_dev, device);
 	if (error) {
 		pr_err("Failed to parse WDG method\n");
=2D-
2.39.2


