Return-Path: <platform-driver-x86+bounces-7632-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 79B589EA075
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Dec 2024 21:41:13 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 7694918826CF
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Dec 2024 20:41:13 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id EDAC219AD8B;
	Mon,  9 Dec 2024 20:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Q8FtZjlp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41DA419B5BE
	for <platform-driver-x86@vger.kernel.org>; Mon,  9 Dec 2024 20:41:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733776865; cv=none; b=vCZ3Sk//3MVpiH48bPzl8qkFzficB1InOSObFZDfO5jEnAkNV2x0c5zoNJCnNyFlomzKLSeO5H/SxXJZgvLkzAHXRHOmNwqFYK6VYYXNfkways9sLzZg5pF12gDfzbty3fS441xoVDPvTwmLsYwMFiV3F+J2unye+fJ9NyiftMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733776865; c=relaxed/simple;
	bh=b3QC0lxSEqtE/2sZDN6CxxldMhhm6er9n1gHmsyRGh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nIs23MfTBUffQDj2Q4ygRztXlDLjsGTLHGIhg2fWWwrZTJg3GMSk6r0KORwMpIkS6cIomJrWJOxHM4+cMh4+PeHagT2NgkKpDxhzE6TznekW3ZnOMl+X1JXnWDn5qVtm7SBODiZPSERwmMbHsFRLLP3g1alP2F0FpOntYRlnFQM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Q8FtZjlp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733776860;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=neXEvMUWmmBYpBk/TV8cGUzUSFhztB6qT1VprsT8z7I=;
	b=Q8FtZjlp8v+flk1KLryAN4I5KDHt9vcHeERIrsNQOjpaxkS78M83hrEBi4WLwdf+N6rl5J
	8bA/kAOt61mpN9gGQMdsK4eJXPoQ85sYfliIQwMew2Nq/HIh11aQhxojxXtrBi1/SZG0v5
	WS7EXLkvxZs81sSR8Ig13d2doRHP0+k=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-1dxczdoBNfGO7qG9WIHNuQ-1; Mon,
 09 Dec 2024 15:40:57 -0500
X-MC-Unique: 1dxczdoBNfGO7qG9WIHNuQ-1
X-Mimecast-MFC-AGG-ID: 1dxczdoBNfGO7qG9WIHNuQ
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 971EE1956048;
	Mon,  9 Dec 2024 20:40:55 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.3])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 8226A300018D;
	Mon,  9 Dec 2024 20:40:52 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jelle van der Waa <jelle@vdwaa.nl>,
	linux-pm@vger.kernel.org
Subject: [PATCH v3 0/4] power: supply: Add new "charge_types" property
Date: Mon,  9 Dec 2024 21:40:47 +0100
Message-ID: <20241209204051.8786-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4

Hi,

As first discussed here:
https://lore.kernel.org/linux-pm/49993a42-aa91-46bf-acef-4a089db4c2db@redhat.com/

Some power_supply devices have a writable charge_type property, but
userspace cannot know which charge_type values are valid to write.

This series adds a new "charge_types" property, which is identical to
"charge_type" but reading returns a list of supported charge-types with
the currently active type surrounded by square brackets, e.g.:

Fast [Standard] Long_Life

this allows userspace to find out which charge-types are supported.

Patch 1/4 does some prep work and patch 2/4 is the core implementation
of "charge_types" property support.

Patch 3/4 is a standard psy-driver user of the new "charge_types"
property support. Patch 4/4 shows an ACPI battery extension driver
with support for this property using the new show()/store() helpers.

Changes in v3:
- Rebase on top of v6.13-rc1

Changes in v2:
- Replace spaces with '_' instead of surrounding the text-value by ""
- Add "Check charge_types to get the values supported by the battery."
  to Documentation/ABI/testing/sysfs-class-power
- Add a note about labels with spaces having these replaced by '_'
  in charge_types output to Documentation/ABI/testing/sysfs-class-power
- Use power_supply_match_string() in power_supply_charge_types_parse()

Regards,

Hans


Hans de Goede (4):
  power: supply: power_supply_show_enum_with_available(): Replace spaces
    with '_'
  power: supply: core: Add new "charge_types" property
  power: supply: bq24190_charger: Add support for "charge_types"
    property
  platform/x86: dell-laptop: Use power_supply_charge_types_show/_parse()
    helpers

 Documentation/ABI/testing/sysfs-class-power | 20 ++++++
 drivers/platform/x86/dell/dell-laptop.c     | 54 ++++++++--------
 drivers/power/supply/bq24190_charger.c      |  7 ++
 drivers/power/supply/power_supply_sysfs.c   | 71 +++++++++++++++++++--
 include/linux/power_supply.h                | 23 ++++++-
 5 files changed, 141 insertions(+), 34 deletions(-)

-- 
2.47.1


