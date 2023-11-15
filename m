Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1436F7E1106
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Nov 2023 21:59:15 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229733AbjKDU7P (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Nov 2023 16:59:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjKDU7P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Nov 2023 16:59:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 92D15D65
        for <platform-driver-x86@vger.kernel.org>; Sat,  4 Nov 2023 13:58:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1699131513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=9MYSylF7D63mQeDYGWMad8OtfBIPbXBCIH5nkZWYNMk=;
        b=XcfQFSqXNjaXrw9JYyKwtCw1HJlA+QfBT8lJ5Gs3Gi21EbZ+601saAulUhAI6df/0gxcfT
        x4IRgHKqNbAorLyKbRraM+aDryV7KOIuPYzvW1Uz8wNMVKAzkDc1wvycr3G7fNvK/XgRgz
        ytBtMZALw8EmOyNg5R00LdQ0SUmOG/0=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-466-DN1gPslPMmyhVjfTkCU1ug-1; Sat,
 04 Nov 2023 16:58:30 -0400
X-MC-Unique: DN1gPslPMmyhVjfTkCU1ug-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6564D38117EB;
        Sat,  4 Nov 2023 20:58:30 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.2])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 63A462026D4C;
        Sat,  4 Nov 2023 20:58:29 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>
Cc:     Hans de Goede <hdegoede@redhat.com>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH v2 1/4] ACPI: scan: Add LNXVIDEO HID to ignore_serial_bus_ids[]
Date:   Sat,  4 Nov 2023 21:58:25 +0100
Message-ID: <20231104205828.63139-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
X-Spam-Status: No, score=-2.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The I2C-core already has filtering to skip i2c_client instantiation for
LNXVIDEO acpi_device-s with I2cSerialBus resources, since LNXVIDEO devices
are not i2c_client-s and are handled by the acpi_video driver.

This filtering was added to i2c-core-acpi.c in commit 3a4991a9864c ("i2c:
acpi: Do not create i2c-clients for LNXVIDEO ACPI devices").

Now a similar problem has shown up where the SPI-core is instantiating
an unwanted SPI-device for a SpiSerialBus resource under a LNXVIDEO
acpi_device. On a Lenovo Yoga Tab 3 YT3-X90F this unwanted SPI-device
instanstantiation causes the SPI-device instanstantiation for the WM5102
audio codec to fail with:

[   21.988441] pxa2xx-spi 8086228E:00: chipselect 0 already in use

Instead of duplicating the I2C-core filtering in the SPI-core code, push
the filtering of SerialBus resources under LNXVIDEO acpi_device-s up into
the ACPI-core by adding the LNXVIDEO HID to ignore_serial_bus_ids[].

Note the filtering in the I2C-core i2c_acpi_do_lookup() function is still
necessary because this not only impacts i2c_client instantiation but it
also makes the I2C-core ignore the I2cSerialBus resource when checking what
the maximum speed is the I2C bus supports, which is still necessary.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/scan.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
index 691d4b7686ee..4b6faa2350f5 100644
--- a/drivers/acpi/scan.c
+++ b/drivers/acpi/scan.c
@@ -1727,6 +1727,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
 	 * Some ACPI devs contain SerialBus resources even though they are not
 	 * attached to a serial bus at all.
 	 */
+		{ACPI_VIDEO_HID, },
 		{"MSHW0028", },
 	/*
 	 * HIDs of device with an UartSerialBusV2 resource for which userspace
-- 
2.41.0

