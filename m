Return-Path: <platform-driver-x86+bounces-7709-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 83BFD9ED3E7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 18:45:23 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 639E0160E74
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 17:45:15 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E87FE1DDA3C;
	Wed, 11 Dec 2024 17:45:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="OvXSFC0A"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B94A1FECDD
	for <platform-driver-x86@vger.kernel.org>; Wed, 11 Dec 2024 17:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733939116; cv=none; b=tivh2g9vTah4E10N2hd1wYbqvq/yW96GvO+DPZ567G6QCGgvdq8b8ZZH4s8hN4Jav0kyCUeyzuRHWfaPkDMkSJAlIGOeNxwnBZbQHP6HA2yGAiPCNNAvPfiT5OphP57GIjNo2rratJbzcXM7HrC7b22ven1N4uQmUtdHdRA5Qq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733939116; c=relaxed/simple;
	bh=sruSSgbU9bN7Bth47IbVk1RUm3lXg1MZijtVfcRKfAw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KC4xj4+iRCSNWyI5C0xhgla41XhNBY/qL1JYFlCT/Io6tEVwreRaB3uYInm2IEyrRAXkzpGQXrS2tu6dG2rc8R3p8Y4YdR4wIrYKOYIOqi4EnTL8C+lJHNh8QCqfzt3ZakzpK0PYGiMZIfA29lMLVoGxZolj00M4xB1fh38vVT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=OvXSFC0A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1733939114;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=3Obrw8+Q4+mIX7WDYMRKjnVOxBajV2clzJJs+ZN61YM=;
	b=OvXSFC0A8IL4rU1Go+qwXxM3n5qOkN/5+poMX8SDm3Do8z+eSJbYRxQUZXc+XUyYxoOwu+
	ktdVJw90BGNL4oCUxr1wfpC64lq7q33BmE+Hbw5che8DHygIPlC8UptgdgMW/cWcMtbGpF
	Cgajbb1xti6eEQDhZVL68tpNm7gYtrE=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-591-FGRtjSidOb6W_objnzoMvg-1; Wed,
 11 Dec 2024 12:45:11 -0500
X-MC-Unique: FGRtjSidOb6W_objnzoMvg-1
X-Mimecast-MFC-AGG-ID: FGRtjSidOb6W_objnzoMvg
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id CB4091955F3B;
	Wed, 11 Dec 2024 17:45:09 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.61])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B1D01955F41;
	Wed, 11 Dec 2024 17:45:07 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Andy Shevchenko <andy@kernel.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
	Sebastian Reichel <sre@kernel.org>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Jelle van der Waa <jelle@vdwaa.nl>,
	platform-driver-x86@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: [PATCH v4 2/4] power: supply: core: Add new "charge_types" property
Date: Wed, 11 Dec 2024 18:44:49 +0100
Message-ID: <20241211174451.355421-3-hdegoede@redhat.com>
In-Reply-To: <20241211174451.355421-1-hdegoede@redhat.com>
References: <20241211174451.355421-1-hdegoede@redhat.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

Add a new "charge_types" property, this is identical to "charge_type" but
reading returns a list of supported charge-types with the currently active
type surrounded by square brackets, e.g.:

Fast [Standard] "Long_Life"

This has the advantage over the existing "charge_type" property that this
allows userspace to find out which charge-types are supported for writable
charge_type properties.

Drivers which already support "charge_type" can easily add support for
this by setting power_supply_desc.charge_types to a bitmask representing
valid charge_type values. The existing "charge_type" get_property() and
set_property() code paths can be re-used for "charge_types".

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Changes in v4:
- Rebase on top of latest sre/linux-power-supply.git/for-next
- Only print current value in uevent using new uevent flag passed to
  power_supply_format_property()
- Put new POWER_SUPPLY_PROP_CHARGE_TYPES enum power_supply_property entry
  directly after the existing POWER_SUPPLY_PROP_CHARGE_TYPE entry

Changes in v2:
- Add "Check charge_types to get the values supported by the battery."
  to Documentation/ABI/testing/sysfs-class-power
- Add a note about labels with spaces having these replaced by '_'
  to Documentation/ABI/testing/sysfs-class-power
- Use power_supply_match_string() in power_supply_charge_types_parse()
---
 Documentation/ABI/testing/sysfs-class-power | 20 ++++++++++++
 drivers/power/supply/power_supply_sysfs.c   | 36 +++++++++++++++++++++
 include/linux/power_supply.h                | 23 ++++++++++++-
 3 files changed, 78 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-class-power b/Documentation/ABI/testing/sysfs-class-power
index 45180b62d426..74050dfb5fc0 100644
--- a/Documentation/ABI/testing/sysfs-class-power
+++ b/Documentation/ABI/testing/sysfs-class-power
@@ -407,10 +407,30 @@ Description:
 
 		Access: Read, Write
 
+		Reading this returns the current active value, e.g. 'Standard'.
+		Check charge_types to get the values supported by the battery.
+
 		Valid values:
 			      "Unknown", "N/A", "Trickle", "Fast", "Standard",
 			      "Adaptive", "Custom", "Long Life", "Bypass"
 
+What:		/sys/class/power_supply/<supply_name>/charge_types
+Date:		December 2024
+Contact:	linux-pm@vger.kernel.org
+Description:
+		Identical to charge_type but reading returns a list of supported
+		charge-types with the currently active type surrounded by square
+		brackets, e.g.: "Fast [Standard] Long_Life".
+
+		power_supply class devices may support both charge_type and
+		charge_types for backward compatibility. In this case both will
+		always have the same active value and the active value can be
+		changed by writing either property.
+
+		Note charge-types which contain a space such as "Long Life" will
+		have the space replaced by a '_' resulting in e.g. "Long_Life".
+		When writing charge-types both variants are accepted.
+
 What:		/sys/class/power_supply/<supply_name>/charge_term_current
 Date:		July 2014
 Contact:	linux-pm@vger.kernel.org
diff --git a/drivers/power/supply/power_supply_sysfs.c b/drivers/power/supply/power_supply_sysfs.c
index b7b29ce61c34..9497bc12f4cc 100644
--- a/drivers/power/supply/power_supply_sysfs.c
+++ b/drivers/power/supply/power_supply_sysfs.c
@@ -182,6 +182,8 @@ static struct power_supply_attr power_supply_attrs[] __ro_after_init = {
 	POWER_SUPPLY_ATTR(CHARGE_CONTROL_START_THRESHOLD),
 	POWER_SUPPLY_ATTR(CHARGE_CONTROL_END_THRESHOLD),
 	POWER_SUPPLY_ENUM_ATTR(CHARGE_BEHAVIOUR),
+	/* Same enum value texts as "charge_type" without the 's' at the end */
+	_POWER_SUPPLY_ENUM_ATTR(CHARGE_TYPES, POWER_SUPPLY_CHARGE_TYPE_TEXT),
 	POWER_SUPPLY_ATTR(INPUT_CURRENT_LIMIT),
 	POWER_SUPPLY_ATTR(INPUT_VOLTAGE_LIMIT),
 	POWER_SUPPLY_ATTR(INPUT_POWER_LIMIT),
@@ -339,6 +341,12 @@ static ssize_t power_supply_format_property(struct device *dev,
 		ret = power_supply_charge_behaviour_show(dev, psy->desc->charge_behaviours,
 							 value.intval, buf);
 		break;
+	case POWER_SUPPLY_PROP_CHARGE_TYPES:
+		if (uevent) /* no possible values in uevents */
+			goto default_format;
+		ret = power_supply_charge_types_show(dev, psy->desc->charge_types,
+						     value.intval, buf);
+		break;
 	case POWER_SUPPLY_PROP_MODEL_NAME ... POWER_SUPPLY_PROP_SERIAL_NUMBER:
 		ret = sysfs_emit(buf, "%s\n", value.strval);
 		break;
@@ -556,3 +564,31 @@ int power_supply_charge_behaviour_parse(unsigned int available_behaviours, const
 	return -EINVAL;
 }
 EXPORT_SYMBOL_GPL(power_supply_charge_behaviour_parse);
+
+ssize_t power_supply_charge_types_show(struct device *dev,
+				       unsigned int available_types,
+				       enum power_supply_charge_type current_type,
+				       char *buf)
+{
+	return power_supply_show_enum_with_available(
+				dev, POWER_SUPPLY_CHARGE_TYPE_TEXT,
+				ARRAY_SIZE(POWER_SUPPLY_CHARGE_TYPE_TEXT),
+				available_types, current_type, buf);
+}
+EXPORT_SYMBOL_GPL(power_supply_charge_types_show);
+
+int power_supply_charge_types_parse(unsigned int available_types, const char *buf)
+{
+	int i = power_supply_match_string(POWER_SUPPLY_CHARGE_TYPE_TEXT,
+					  ARRAY_SIZE(POWER_SUPPLY_CHARGE_TYPE_TEXT),
+					  buf);
+
+	if (i < 0)
+		return i;
+
+	if (available_types & BIT(i))
+		return i;
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(power_supply_charge_types_parse);
diff --git a/include/linux/power_supply.h b/include/linux/power_supply.h
index b98106e1a90f..a841b814743b 100644
--- a/include/linux/power_supply.h
+++ b/include/linux/power_supply.h
@@ -40,7 +40,7 @@ enum {
 };
 
 /* What algorithm is the charger using? */
-enum {
+enum power_supply_charge_type {
 	POWER_SUPPLY_CHARGE_TYPE_UNKNOWN = 0,
 	POWER_SUPPLY_CHARGE_TYPE_NONE,
 	POWER_SUPPLY_CHARGE_TYPE_TRICKLE,	/* slow speed */
@@ -99,6 +99,7 @@ enum power_supply_property {
 	/* Properties of type `int' */
 	POWER_SUPPLY_PROP_STATUS = 0,
 	POWER_SUPPLY_PROP_CHARGE_TYPE,
+	POWER_SUPPLY_PROP_CHARGE_TYPES,
 	POWER_SUPPLY_PROP_HEALTH,
 	POWER_SUPPLY_PROP_PRESENT,
 	POWER_SUPPLY_PROP_ONLINE,
@@ -245,6 +246,7 @@ struct power_supply_desc {
 	const char *name;
 	enum power_supply_type type;
 	u8 charge_behaviours;
+	u32 charge_types;
 	u32 usb_types;
 	const enum power_supply_property *properties;
 	size_t num_properties;
@@ -944,6 +946,11 @@ ssize_t power_supply_charge_behaviour_show(struct device *dev,
 					   char *buf);
 
 int power_supply_charge_behaviour_parse(unsigned int available_behaviours, const char *buf);
+ssize_t power_supply_charge_types_show(struct device *dev,
+				       unsigned int available_types,
+				       enum power_supply_charge_type current_type,
+				       char *buf);
+int power_supply_charge_types_parse(unsigned int available_types, const char *buf);
 #else
 static inline
 ssize_t power_supply_charge_behaviour_show(struct device *dev,
@@ -959,6 +966,20 @@ static inline int power_supply_charge_behaviour_parse(unsigned int available_beh
 {
 	return -EOPNOTSUPP;
 }
+
+static inline
+ssize_t power_supply_charge_types_show(struct device *dev,
+				       unsigned int available_types,
+				       enum power_supply_charge_type current_type,
+				       char *buf)
+{
+	return -EOPNOTSUPP;
+}
+
+static inline int power_supply_charge_types_parse(unsigned int available_types, const char *buf)
+{
+	return -EOPNOTSUPP;
+}
 #endif
 
 #endif /* __LINUX_POWER_SUPPLY_H__ */
-- 
2.47.1


