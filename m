Return-Path: <platform-driver-x86+bounces-6889-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DD549C2809
	for <lists+platform-driver-x86@lfdr.de>; Sat,  9 Nov 2024 00:24:55 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6F9291C2195B
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 Nov 2024 23:24:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D99FB1E2310;
	Fri,  8 Nov 2024 23:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SHlffibp"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066481E22EC
	for <platform-driver-x86@vger.kernel.org>; Fri,  8 Nov 2024 23:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731108290; cv=none; b=J3BSX6NHhIZq60QdzhyI0w6GZv0Dv8Zm1dZXkjfda48/hCJYeLN9gec9WI99ATE6SSE9G33zetqN2ywNQVo+P3R36yyB5zRSxJrOR9BkfESbndbBx035eqHmQf3O0Ixp9f1ICwM+ZQCvKmZQfMZ9Fzpo61YBTLGqZDjWMNw894c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731108290; c=relaxed/simple;
	bh=JGQ21j0vXHjPB9/DM90FB1eWnyMfsF8+Y87TlzmE5NY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gxuZ7UWUQHxJ6tzSA0m2H7R/KOiut+A7fPHWAtQdrLpcyp1ZO7tmZ1A0fY6QXcSVVRmI2VQQE/5QVIdq2y8Pd99+wmT//MVQQ0G2J8xF+WHQhe3MTDKQPB+m90vDiFiAO833sRTmL6Yuphm67TpI5PyyPwXOtDLwo7nHnfKWUr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SHlffibp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1731108287;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=8J3TtrS4YtnHEjLzvBaPzDZcOYEHuT8U37iuS3l51QA=;
	b=SHlffibpbKcu8DX6Oj/PV17KG1RcCFxZA+P2PBAH7Wuh765sj5TwOZHISAwg/ajxQlFScb
	HzA7JXrB9pbmI5yk2EHEAP43L2/j2t8PIZGzIsAkvDr6qCXFmwQyER1OebXAIQrjHWxLK/
	9uLa6UZX/khx8Rw5OV1HQ6j0BvHGWT8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-440-BJA4yAt8NfKRaGxLHSwRzg-1; Fri,
 08 Nov 2024 18:24:44 -0500
X-MC-Unique: BJA4yAt8NfKRaGxLHSwRzg-1
X-Mimecast-MFC-AGG-ID: BJA4yAt8NfKRaGxLHSwRzg
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 82F4319541BE;
	Fri,  8 Nov 2024 23:24:42 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.67])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 77982300019E;
	Fri,  8 Nov 2024 23:24:39 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	platform-driver-x86@vger.kernel.org,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Jelle van der Waa <jelle@vdwaa.nl>,
	linux-pm@vger.kernel.org
Subject: [PATCH v2 0/4] power: supply: Add new "charge_types" property
Date: Sat,  9 Nov 2024 00:24:34 +0100
Message-ID: <20241108232438.269156-1-hdegoede@redhat.com>
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
2.47.0


