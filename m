Return-Path: <platform-driver-x86+bounces-3986-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4665F91251B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jun 2024 14:25:44 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EFCB81F22B25
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jun 2024 12:25:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B71E4150993;
	Fri, 21 Jun 2024 12:25:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TpRsl99s"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2A4C14E2ED
	for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jun 2024 12:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718972740; cv=none; b=TGlVFt2Iyx/wlbHnZgRxf0pjHdJ/PO0DzZI7TntoKyiJadktbNydtRSgOxu/BzKYNC8tAri4ePUR1WwPmHVx0s0arS2oB7aC9lL4gdLB2mmlF9w82g75DYMze1MfaE01NkMPyt024xctOQf6E9dOCSvIq3M9mBcg2YwZeYyr2ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718972740; c=relaxed/simple;
	bh=IEkrubddanHbp9WgkVb/7Vl4ND7a6llRo+67E5KyWxs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DHJK2V/7g5UZq8PHdQTU93MzOsRxvwKTUw0FWJTHpYSvRTLnRr/Rb0j/Jzs4Ky5eBobyyw+F8iZg2g0pgMVxmZAk+tdh6ozoxfnUd0ZQ6POPtXf8yyxPFNPyphfspoN1jZPrY2ch8xfpiJH+ysXyUz9UajP+KCENNcKm5UQQ7rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TpRsl99s; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718972737;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Eo6coHb5pN6we0+M0McVJzW8Eeeu5yZPUM4trXcbBEI=;
	b=TpRsl99sQx9hlqDSSMYbp2l9Lknj7XcMAzhBORxAS7SdVeN8Kst+HgMZv2oanbqobRBqVo
	0reQWV+iXU7kcck9/7PJm+6FKmpR1NCWlgdlv5D3yc42bMi0sshoTKAHijUushZ5rBUvya
	GpGgjZQfIclo3u2IKCWZ1E4CH8swY1E=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-228-Q43UJTL9PCCx0cO3Tk4AeQ-1; Fri,
 21 Jun 2024 08:25:36 -0400
X-MC-Unique: Q43UJTL9PCCx0cO3Tk4AeQ-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id C36B3196E071;
	Fri, 21 Jun 2024 12:25:10 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.194.69])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id B136C3000218;
	Fri, 21 Jun 2024 12:25:04 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Wolfram Sang <wsa@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	eric.piel@tremplin-utc.net,
	Marius Hoch <mail@mariushoch.de>,
	Dell.Client.Kernel@dell.com,
	Kai Heng Feng <kai.heng.feng@canonical.com>,
	platform-driver-x86@vger.kernel.org,
	Jean Delvare <jdelvare@suse.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org
Subject: [PATCH v3 0/6] i2c-i801 / dell-smo8800: Move instantiation of lis3lv02d i2c_client from i2c-i801 to dell-smo8800
Date: Fri, 21 Jun 2024 14:24:55 +0200
Message-ID: <20240621122503.10034-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi All,

Here is v3 of my patch series to move the manual instantation of lis3lv02d
i2c_client-s for SMO88xx ACPI device from the generic i2c-i801.c code to
the SMO88xx specific dell-smo8800 driver.

Moving the i2c_client instantiation there has the following advantages:

1. This moves the SMO88xx ACPI device quirk handling away from the generic
i2c-i801 module which is loaded on all Intel x86 machines to the SMO88xx
specific dell-smo8800 module where it belongs.

2. This removes the duplication of the SMO88xx ACPI Hardware ID (HID) table
between the i2c-i801 and dell-smo8800 drivers.

3. This allows extending the quirk handling by adding new code and related
module parameters to the dell-smo8800 driver, without needing to modify
the i2c-i801 code.

This series also extends the i2c_client instantiation with support for
probing for the i2c-address of the lis3lv02d chip on devices which
are not yet listed in the DMI table with i2c-addresses for known models.
This probing is only done when requested through a module parameter.

The probing support adds quite a bit of code which shows why it is good
to move the handling out of the generic i2c-i801 code.

Changes in v3:
- Use an i2c bus notifier so that the i2c_client will still be instantiated if
  the i801 i2c_adapter shows up later or is re-probed (removed + added again).
  This addresses the main concern / review-comments made during review of v2.
- Add 2 prep patches to the i2c-core / the i2c-i801 driver to allow bus-notifier
  use / to avoid the need to duplicate the PCI-ids of IDF i2c-i801 adapters.
- Switch to standard dmi_system_id matching to check both sys-vendor +
  product-name DMI fields
- Drop the patch to alternatively use the st_accel IIO driver instead of
  drivers/misc/lis3lv02d/lis3lv02d.c

Changes in v2:
- Drop "[PATCH 1/6] platform/x86: dell-smo8800: Only load on Dell laptops"
- Use a pci_device_id table to check for IDF (non main) i2c-i801 SMBusses
- Add a comment documenting the IDF PCI device ids
- Keep using drivers/misc/lis3lv02d/lis3lv02d.c by default
- Rename the module-parameter to use_iio_driver which can be set to
  use the IIO st_accel driver instead
- Add a new patch adding the accelerometer address for the 2 models
  I have tested this on to dell_lis3lv02d_devices[]

Since this touches files under both drivers/i2c and drivers/platform/x86
some subsystem coordination is necessary. I think it would be best to just
merge the entire series through the i2c subsystem since this touches some
core i2c files. As pdx86 subsys co-maintainer I'm fine with doing so.

Regards,

Hans


Hans de Goede (6):
  i2c: core: Setup i2c_adapter runtime-pm before calling device_add()
  i2c: i801: Use a different adapter-name for IDF adapters
  platform/x86: dell-smo8800: Move instantiation of lis3lv02d i2c_client
    from i2c-i801 to dell-smo8800
  platform/x86: dell-smo8800: Allow lis3lv02d i2c_client instantiation
    without IRQ
  platform/x86: dell-smo8800: Add a couple more models to
    dell_lis3lv02d_devices[]
  platform/x86: dell-smo8800: Add support for probing for the
    accelerometer i2c address

 drivers/i2c/busses/i2c-i801.c            | 133 +------
 drivers/i2c/i2c-core-base.c              |  13 +-
 drivers/platform/x86/dell/dell-smo8800.c | 438 +++++++++++++++++++++--
 3 files changed, 424 insertions(+), 160 deletions(-)

-- 
2.45.1


