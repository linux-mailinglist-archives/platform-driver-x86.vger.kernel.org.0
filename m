Return-Path: <platform-driver-x86+bounces-10740-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 2168FA79671
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Apr 2025 22:25:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 37C433B396F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Apr 2025 20:25:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3CB1925AB;
	Wed,  2 Apr 2025 20:25:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gs2CaA9B"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A1D42A9E
	for <platform-driver-x86@vger.kernel.org>; Wed,  2 Apr 2025 20:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743625522; cv=none; b=iRrGF7bNyvLcy3FtSbc1ns2Tb34pyP5GLIjlsr3GIau/dl8OELq9TgQFCl9UZZGYGTSO2ITOWQw9WQzTqysaLWYPpzA9iL1Yibr9/U2EblTaja/hsMuGSB0pUgILDZs7YC5M6lDQyPi527VLHXxuOuFuGpDLWQyeIZuGA09P/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743625522; c=relaxed/simple;
	bh=dle1jYeuY0GFDuFy+kfTk09EJY2huK3nefmgnM0ZN9w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=DJnK2o3s85jbkH2XTkSwGWMRLZuyII7UUDSiTLtdeUaBn11PXLvvn+Rd2YmJiyt3BhM3MDlm/++el4klWBfdlRPs83NB/F4sS8uUMoQwiIHAUpnknVdX1aknCaEwS5PxPrsmH/MdMfaXSDdkmtznYx6HkSURqz1ZxqC2J7yrPBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gs2CaA9B; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743625519;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=l26oYIs8N4f3DnxbEm9xB1mfFLgRPz9tzzyzMLs+QUs=;
	b=Gs2CaA9BF9Chw4Z2nblrJgQK8Nm/Yawuy4NSVIZUIZi4ToBYbHcdWnNxrexpo9KH0PGeIb
	USuBxFEwCrq1VYywk7xJ0Z3Z3mV80ZwxyQVoV94LyJVCer0SbEYHM8AEAYZBbOulqf94k+
	KuM1uvq9RWpgmRQ9agXnPiYqQTwbKPc=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-439--5yXoLVANQeRnYPd33UACg-1; Wed,
 02 Apr 2025 16:25:18 -0400
X-MC-Unique: -5yXoLVANQeRnYPd33UACg-1
X-Mimecast-MFC-AGG-ID: -5yXoLVANQeRnYPd33UACg_1743625516
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 10C281954B36;
	Wed,  2 Apr 2025 20:25:16 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.44.32.69])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 365B11801752;
	Wed,  2 Apr 2025 20:25:11 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Dan Scally <djrscally@gmail.com>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hao Yao <hao.yao@intel.com>,
	Bingbu Cao <bingbu.cao@intel.com>,
	Duane <duanek@chorus.net>,
	platform-driver-x86@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v2 0/9] platform/x86: int3472: Add handshake pin support
Date: Wed,  2 Apr 2025 22:25:01 +0200
Message-ID: <20250402202510.432888-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111

New Intel Meteor Lake based laptops with IPU6 cameras have a new type 0x12
pin defined in the INT3472 sensor companion device which describes
the sensor's GPIOs.

This pin is primarily used on designs with a Lattice FPGA chip which is
capable of running the sensor independently of the main CPU for features
like presence detection. This pin needs to be driven high to make the FPGA
run the power-on sequence of the sensor. After driving the pin high
the FPGA "firmware" needs 25ms to comlpete the power-on sequence.

This series implements support for this by modelling the handshake GPIO
as a GPIO driven 'dvdd' regulator with an enable-time of 25 ms, also see:

https://lore.kernel.org/platform-driver-x86/59f672c3-6d87-4ec7-9b7f-f44fe2cce934@redhat.com/

Patch   1   Is an unrelated cleanup which I had lying around
Patches 2-7 Prepare + Implement the handshake GPIO
Patch   8   Is a small patch adding some extra debugging to GPIO remapping

Changes in v2:
- Add Andy's Reviewed-by to patches 1-3
- Address Andy's review remarks on patch 5
- Add 2 Tested-by tags to patch 8/9

This series applies on top of Torvald's latest master, for testing with
6.14 this patch needs to be cherry-picked first:
https://web.git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/commit/?id=81b251c66bdfe263fb5e7a16838512ddaeed77df

Regards,

Hans


Hans de Goede (9):
  platform/x86: int3472: Add skl_int3472_register_clock() helper
  platform/x86: int3472: Stop setting a supply-name for GPIO regulators
  platform/x86: int3472: Drop unused gpio field from struct
    int3472_gpio_regulator
  platform/x86: int3472: Rework AVDD second sensor quirk handling
  platform/x86: int3472: Make regulator supply name configurable
  platform/x86: int3472: Avoid GPIO regulator spikes
  platform/x86: int3472: Prepare for registering more then 1 GPIO
    regulator
  platform/x86: int3472: Add handshake pin support
  platform/x86: int3472: Debug log when remapping pins

 drivers/platform/x86/intel/int3472/Makefile   |   3 +-
 .../x86/intel/int3472/clk_and_regulator.c     | 164 ++++++------------
 drivers/platform/x86/intel/int3472/common.h   |  50 ++++--
 drivers/platform/x86/intel/int3472/discrete.c |  39 ++++-
 .../x86/intel/int3472/discrete_quirks.c       |  22 +++
 5 files changed, 147 insertions(+), 131 deletions(-)
 create mode 100644 drivers/platform/x86/intel/int3472/discrete_quirks.c

-- 
2.49.0


