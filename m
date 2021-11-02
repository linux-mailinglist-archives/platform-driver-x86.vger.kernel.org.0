Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 627C444389F
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Nov 2021 23:40:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230389AbhKBWmr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Nov 2021 18:42:47 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34181 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229844AbhKBWmq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Nov 2021 18:42:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1635892811;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=AsEM89MLEc8fCV6I+1fMuH3xh7vs9MySsB9V3kUpA+o=;
        b=QHF4PCwkRyaX3ZoEC1LORCBbpFG6LQsFsz9B5RPfIObDyUcJJlVVaQzPcsTu0wyzYWLZMo
        LJfv44HX55Pfqu5k7JyDw1Qvoog23aACCvBhn4zRQJRGwd/sDL7jKvaze/OTuCVAyoloPs
        GlMn6k/3s9uU3f51dhZQExo2I+Pe3Pg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-ZThcXihtMqa9jOa-f5H9CQ-1; Tue, 02 Nov 2021 18:40:10 -0400
X-MC-Unique: ZThcXihtMqa9jOa-f5H9CQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2CBB98799EB;
        Tue,  2 Nov 2021 22:40:08 +0000 (UTC)
Received: from x1.localdomain (unknown [10.39.192.24])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1135060C17;
        Tue,  2 Nov 2021 22:40:03 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Sebastian Reichel <sre@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, Len Brown <lenb@kernel.org>,
        linux-acpi@vger.kernel.org, Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
Subject: [RFC v2 1/2] ACPI / x86: Add PWM2 on the Xiaomi Mi Pad 2 to the always_present list
Date:   Tue,  2 Nov 2021 23:39:58 +0100
Message-Id: <20211102223959.3873-2-hdegoede@redhat.com>
In-Reply-To: <20211102223959.3873-1-hdegoede@redhat.com>
References: <20211102223959.3873-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The Xiaomi Mi Pad 2 has backlit LEDs behind the capacitive menu, home
and back buttons below the screen which are controlled by the PWM2
controller of the CHT SoC. This PWM2 controller gets hidden by the
firmware, add it to the always_present_ids table so that we can use
the PWM controller to control the backlighting of the buttons.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/x86/utils.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/acpi/x86/utils.c b/drivers/acpi/x86/utils.c
index f22f23933063..cb988f9b23a1 100644
--- a/drivers/acpi/x86/utils.c
+++ b/drivers/acpi/x86/utils.c
@@ -58,6 +58,11 @@ static const struct always_present_id always_present_ids[] = {
 	ENTRY("80862289", "2", X86_MATCH(ATOM_AIRMONT), {
 			DMI_MATCH(DMI_PRODUCT_NAME, "Lenovo YB1-X9"),
 		}),
+	/* The Xiaomi Mi Pad 2 uses PWM2 for touchkeys backlight control */
+	ENTRY("80862289", "2", X86_MATCH(ATOM_AIRMONT), {
+		DMI_MATCH(DMI_SYS_VENDOR, "Xiaomi Inc"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Mipad2"),
+	      }),
 	/*
 	 * The INT0002 device is necessary to clear wakeup interrupt sources
 	 * on Cherry Trail devices, without it we get nobody cared IRQ msgs.
-- 
2.31.1

