Return-Path: <platform-driver-x86+bounces-5781-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 44BE3991AD5
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2024 23:28:52 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D7ADD1F215A6
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Oct 2024 21:28:51 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 47513166F16;
	Sat,  5 Oct 2024 21:28:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HaTk1QC5"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE39B161901
	for <platform-driver-x86@vger.kernel.org>; Sat,  5 Oct 2024 21:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728163726; cv=none; b=mnJkhoIjqGFIqoNAAHR6FZ0b6e77Un4h1vest6BR/bSo5NTlCTObQ56GkzDme1t6B+skpIHhNPak8yRxnVosqJt4m0m6nsURCttWTRzeBWNOBA1lw1tCXyiacf+7Qf/5lexca5wRoSKLYYLHY5kucOVVwO2Po1plOu74uelide0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728163726; c=relaxed/simple;
	bh=RwnTrH3dvmqmKFIBlAJBSejFsf2w2e6V9U7rC5J2kFA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ip++txDupiebl7CtC1SLiOzuor7Dq4sJMADQ2/VHhkwatoPI8jU7KONjIWBq6NvYEPlYThw+wEHwXkU6x7zvlOXJRf29U/cGaONbwESdwthvWn3IV5iH3r7Wg/C1/RsnnsuPlyK7S7IfHtAX8wEzqR2aX/EfNMYQdmcw9NnI8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HaTk1QC5; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1728163722;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=SUx/ck0zck+PB9rqCtoPu4QaW9DBNILmInyjGNkkXjY=;
	b=HaTk1QC5cRFnTFhjBCrmE46J3lBDKMHf/gqTXJqPNg1STqrVKS388WQ/zO6f3FwPJuISdQ
	RsXUXmB57lebX99nkhshWYj/ZOhCwzRlotySvp5xE5V7OYwC67GTYhVhYqg1AJ0YqC5d+w
	OeUS6IP+6t5NJrdxH4E2p61HuMMxbtU=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-MMKTH9MSPH2wipnYcBo4Fw-1; Sat,
 05 Oct 2024 17:28:39 -0400
X-MC-Unique: MMKTH9MSPH2wipnYcBo4Fw-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 37929195421A;
	Sat,  5 Oct 2024 21:28:38 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.19])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 2B3CF1955F42;
	Sat,  5 Oct 2024 21:28:35 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	linux-acpi@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	Stefan Blum <stefan.blum@gmail.com>,
	All applicable <stable@vger.kernel.org>
Subject: [PATCH 1/4] ACPI: resource: Make Asus ExpertBook B2402 matches cover more models
Date: Sat,  5 Oct 2024 23:28:16 +0200
Message-ID: <20241005212819.354681-2-hdegoede@redhat.com>
In-Reply-To: <20241005212819.354681-1-hdegoede@redhat.com>
References: <20241005212819.354681-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15

The Asus ExpertBook B2402CBA / B2402FBA are the non flip / flip versions
of the 14" Asus ExpertBook B2 with 12th gen Intel processors.

It has been reported that the B2402FVA which is the 14" Asus ExpertBook
B2 flip with 13th gen Intel processors needs to skip the IRQ override too.

And looking at Asus website there also is a B2402CVA which is the non flip
model with 13th gen Intel processors.

Summarizing the following 4 models of the Asus ExpertBook B2 are known:

B2402CBA: 12th gen Intel CPU, non flip
B2402FBA: 12th gen Intel CPU, flip
B2402CVA: 13th gen Intel CPU, non flip
B2402FVA: 13th gen Intel CPU, flip

Fold the 2 existing quirks for the B2402CBA and B2402FBA into a single
quirk covering B2402* to also cover the 2 other models while at the same
time reducing the number of quirks.

Reported-by: Stefan Blum <stefan.blum@gmail.com>
Closes: https://lore.kernel.org/platform-driver-x86/a983e6d5-c7ab-4758-be9b-7dcfc1b44ed3@gmail.com/
Cc: All applicable <stable@vger.kernel.org>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/resource.c | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/drivers/acpi/resource.c b/drivers/acpi/resource.c
index 3d74ebe9dbd8..cbe51ae6ae25 100644
--- a/drivers/acpi/resource.c
+++ b/drivers/acpi/resource.c
@@ -483,17 +483,10 @@ static const struct dmi_system_id irq1_level_low_skip_override[] = {
                 },
         },
 	{
-		/* Asus ExpertBook B2402CBA */
+		/* Asus ExpertBook B2402 (B2402CBA / B2402FBA / B2402CVA / B2402FVA) */
 		.matches = {
 			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_BOARD_NAME, "B2402CBA"),
-		},
-	},
-	{
-		/* Asus ExpertBook B2402FBA */
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
-			DMI_MATCH(DMI_BOARD_NAME, "B2402FBA"),
+			DMI_MATCH(DMI_BOARD_NAME, "B2402"),
 		},
 	},
 	{
-- 
2.46.2


