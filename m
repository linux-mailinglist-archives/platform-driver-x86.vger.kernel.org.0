Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E7EA172850D
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Jun 2023 18:33:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235601AbjFHQdr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Jun 2023 12:33:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235550AbjFHQdn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2023 12:33:43 -0400
Received: from mail-oi1-x22e.google.com (mail-oi1-x22e.google.com [IPv6:2607:f8b0:4864:20::22e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 869D51BE8;
        Thu,  8 Jun 2023 09:33:29 -0700 (PDT)
Received: by mail-oi1-x22e.google.com with SMTP id 5614622812f47-39c873a5127so402265b6e.1;
        Thu, 08 Jun 2023 09:33:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242007; x=1688834007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ALKvUbwEoK6sN0u4267gUmCgwa1wmNF0ohLYAs32gtc=;
        b=qgE5hOsArDOcq97eJhnZQyMLmZpI5zUnBBgFj+tumBrJKtsGH1J0DvpN1I5iFRczmO
         juJk/hJgkKZwqW4K6hBZcREhqvtx3I83wuRt7DCzC9jCOp6eKQc/e4PQTzMIXVIkTyWZ
         sNseX2XflFQX+lrQZP19NGIgsOzRw7J8u/pIIuk6dMaaiGtGCoxqPZMCgtk6vYZQAc5A
         L6Qd8RgvwLAgcxoTigTCJR0n1PgtmVPWCjb1N4MEYPnATg/z5AXTXYkt2Gvn+ZbsewRh
         Ej1bXmJmJur3csgOj6VnqrPrn6WcjuMMKDfg4VeK1ILym/uhnQ5Pr/D+i9zM8OIVtk3P
         XKXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242007; x=1688834007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ALKvUbwEoK6sN0u4267gUmCgwa1wmNF0ohLYAs32gtc=;
        b=JWmZvNZi4ObhhIqkPNoHkXIsaK1cWZl4Ho9dQd5o9VA5ojkVhK2WNW1OquI6L1JK0i
         9NZ41skucanlYzcI1yLi4JOIGKcWxe6f3jl+viTzWWYVPdyvdVo0AM0Dum+dtAIMI1lm
         RJbx3fephbUUkHGjppMDwROdu1KtewbLWTi5ixfLPU+B+hCszCgDUbZIpJDj+7/vxeg2
         /U5Wyvhgi/DW4959TYFUgNUa8ZpXzMmr7YbzOOUZy22z3LZA1Abq1jcbzJY/xsedmQ3w
         c22oBfEZ4mvr93TAH/MJDYEKzGDsBe8MDsOagZMKBWeQ8HUPiafac2T7qbQyfQRB9gwJ
         IugQ==
X-Gm-Message-State: AC+VfDzrXt9/IEIyOh9zlWUp3V/cEfqrItFrg9xJPuDniAS54IA68OLK
        +HFzR13I/Sn2nlYOWLGGL5A=
X-Google-Smtp-Source: ACHHUZ7mwxCc8pJMcPuVf2zkx0Kd9aMuLfcwd1+bjftAOB7cGCdl8pm2dKFMulWZo6gDtUxLOZsGGA==
X-Received: by 2002:a54:4403:0:b0:39c:785a:9755 with SMTP id k3-20020a544403000000b0039c785a9755mr3301180oiw.9.1686242007622;
        Thu, 08 Jun 2023 09:33:27 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:a60f:2d4d:e52b:2fca])
        by smtp.gmail.com with ESMTPSA id e10-20020acab50a000000b003942036439dsm577500oif.46.2023.06.08.09.33.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:33:27 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: [PATCH v17 05/13] hp-bioscfg: enum-attributes
Date:   Thu,  8 Jun 2023 11:33:11 -0500
Message-Id: <20230608163319.18934-6-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230608163319.18934-1-jorge.lopez2@hp.com>
References: <20230608163319.18934-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add enumeration attributes support to hp-bioscfg.

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../x86/hp/hp-bioscfg/enum-attributes.c       | 447 ++++++++++++++++++
 1 file changed, 447 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
new file mode 100644
index 000000000000..b1b241f0205a
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/enum-attributes.c
@@ -0,0 +1,447 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to enumeration type attributes under
+ * BIOS Enumeration GUID for use with hp-bioscfg driver.
+ *
+ * Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+GET_INSTANCE_ID(enumeration);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_enumeration_instance_id(kobj);
+
+	if (instance_id < 0)
+		return -EIO;
+
+	return sysfs_emit(buf, "%s\n",
+			 bioscfg_drv.enumeration_data[instance_id].current_value);
+}
+
+/**
+ * validate_enumeration_input() -
+ * Validate input of current_value against possible values
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_enumeration_input(int instance_id, const char *buf)
+{
+	int i;
+	int found = 0;
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+
+	/* Is it a read only attribute */
+	if (enum_data->common.is_readonly)
+		return -EIO;
+
+	for (i = 0; i < enum_data->possible_values_size && !found; i++)
+		if (!strcmp(enum_data->possible_values[i], buf))
+			found = 1;
+
+	if (!found)
+		return -EINVAL;
+
+	return 0;
+}
+
+static void update_enumeration_value(int instance_id, char *attr_value)
+{
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+
+	strscpy(enum_data->current_value,
+		attr_value,
+		sizeof(enum_data->current_value));
+}
+
+ATTRIBUTE_S_COMMON_PROPERTY_SHOW(display_name, enumeration);
+static struct kobj_attribute enumeration_display_name =
+		__ATTR_RO(display_name);
+
+ATTRIBUTE_PROPERTY_STORE(current_value, enumeration);
+static struct kobj_attribute enumeration_current_val =
+		__ATTR_RW(current_value);
+
+ATTRIBUTE_VALUES_PROPERTY_SHOW(possible_values, enumeration, SEMICOLON_SEP);
+static struct kobj_attribute enumeration_poss_val =
+		__ATTR_RO(possible_values);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "enumeration\n");
+}
+
+static struct kobj_attribute enumeration_type =
+		__ATTR_RO(type);
+
+static struct attribute *enumeration_attrs[] = {
+	&common_display_langcode.attr,
+	&enumeration_display_name.attr,
+	&enumeration_current_val.attr,
+	&enumeration_poss_val.attr,
+	&enumeration_type.attr,
+	NULL
+};
+
+static const struct attribute_group enumeration_attr_group = {
+	.attrs = enumeration_attrs,
+};
+
+int hp_alloc_enumeration_data(void)
+{
+	bioscfg_drv.enumeration_instances_count =
+		hp_get_instance_count(HP_WMI_BIOS_ENUMERATION_GUID);
+
+	bioscfg_drv.enumeration_data = kcalloc(bioscfg_drv.enumeration_instances_count,
+					       sizeof(*bioscfg_drv.enumeration_data), GFP_KERNEL);
+	if (!bioscfg_drv.enumeration_data) {
+		bioscfg_drv.enumeration_instances_count = 0;
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+/* Expected Values types associated with each element */
+static const acpi_object_type expected_enum_types[] = {
+	[NAME] = ACPI_TYPE_STRING,
+	[VALUE] = ACPI_TYPE_STRING,
+	[PATH] = ACPI_TYPE_STRING,
+	[IS_READONLY] = ACPI_TYPE_INTEGER,
+	[DISPLAY_IN_UI] = ACPI_TYPE_INTEGER,
+	[REQUIRES_PHYSICAL_PRESENCE] = ACPI_TYPE_INTEGER,
+	[SEQUENCE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES_SIZE] = ACPI_TYPE_INTEGER,
+	[PREREQUISITES] = ACPI_TYPE_STRING,
+	[SECURITY_LEVEL] = ACPI_TYPE_INTEGER,
+	[ENUM_CURRENT_VALUE] = ACPI_TYPE_STRING,
+	[ENUM_SIZE] = ACPI_TYPE_INTEGER,
+	[ENUM_POSSIBLE_VALUES] = ACPI_TYPE_STRING,
+};
+
+static int hp_populate_enumeration_elements_from_package(union acpi_object *enum_obj,
+							 int enum_obj_count,
+							 int instance_id)
+{
+	char *str_value = NULL;
+	int value_len;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int pos_values;
+	int ret;
+	int eloc;
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+
+	for (elem = 1, eloc = 1; elem < enum_obj_count; elem++, eloc++) {
+		/* ONLY look at the first ENUM_ELEM_CNT elements */
+		if (eloc == ENUM_ELEM_CNT)
+			goto exit_enumeration_package;
+
+		switch (enum_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+			if (PREREQUISITES != elem && ENUM_POSSIBLE_VALUES != elem) {
+				ret = hp_convert_hexstr_to_str(enum_obj[elem].string.pointer,
+							       enum_obj[elem].string.length,
+							       &str_value, &value_len);
+				if (ret)
+					return -EINVAL;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)enum_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", enum_obj[elem].type);
+			continue;
+		}
+
+		/* Check that both expected and read object type match */
+		if (expected_enum_types[eloc] != enum_obj[elem].type) {
+			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
+			       expected_enum_types[eloc], elem, enum_obj[elem].type);
+			return -EIO;
+		}
+
+		/* Assign appropriate element value to corresponding field */
+		switch (eloc) {
+		case NAME:
+		case VALUE:
+			break;
+		case PATH:
+			strscpy(enum_data->common.path, str_value,
+				sizeof(enum_data->common.path));
+			break;
+		case IS_READONLY:
+			enum_data->common.is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			enum_data->common.display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			enum_data->common.requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			enum_data->common.sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			enum_data->common.prerequisites_size = int_value;
+			if (int_value > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero. PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+
+		case PREREQUISITES:
+			size = min_t(u32, enum_data->common.prerequisites_size, MAX_PREREQUISITES_SIZE);
+			for (reqs = 0; reqs < size; reqs++) {
+				if (elem >= enum_obj_count) {
+					pr_err("Error enum-objects package is too small\n");
+					return -EINVAL;
+				}
+
+				ret = hp_convert_hexstr_to_str(enum_obj[elem + reqs].string.pointer,
+							       enum_obj[elem + reqs].string.length,
+							       &str_value, &value_len);
+
+				if (ret)
+					return -EINVAL;
+
+				strscpy(enum_data->common.prerequisites[reqs],
+					str_value,
+					sizeof(enum_data->common.prerequisites[reqs]));
+
+				kfree(str_value);
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			enum_data->common.security_level = int_value;
+			break;
+
+		case ENUM_CURRENT_VALUE:
+			strscpy(enum_data->current_value,
+				str_value, sizeof(enum_data->current_value));
+			break;
+		case ENUM_SIZE:
+			enum_data->possible_values_size = int_value;
+			if (int_value > MAX_VALUES_SIZE)
+				pr_warn("Possible number values size value exceeded the maximum number of elements supported or data may be malformed\n");
+
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero. POSSIBLE_VALUES
+			 * object is omitted by BIOS when the size is zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+
+		case ENUM_POSSIBLE_VALUES:
+			size = enum_data->possible_values_size;
+
+			for (pos_values = 0; pos_values < size && pos_values < MAX_VALUES_SIZE;
+			     pos_values++) {
+				if (elem >= enum_obj_count) {
+					pr_err("Error enum-objects package is too small\n");
+					return -EINVAL;
+				}
+
+				ret = hp_convert_hexstr_to_str(enum_obj[elem + pos_values].string.pointer,
+							       enum_obj[elem + pos_values].string.length,
+							       &str_value, &value_len);
+
+				if (ret)
+					return -EINVAL;
+
+				/*
+				 * ignore strings when possible values size
+				 * is greater than MAX_VALUES_SIZE
+				 */
+				if (size < MAX_VALUES_SIZE)
+					strscpy(enum_data->possible_values[pos_values],
+						str_value,
+						sizeof(enum_data->possible_values[pos_values]));
+			}
+			break;
+		default:
+			pr_warn("Invalid element: %d found in Enumeration attribute or data may be malformed\n", elem);
+			break;
+		}
+
+		kfree(str_value);
+	}
+
+exit_enumeration_package:
+	kfree(str_value);
+	return 0;
+}
+
+/**
+ * hp_populate_enumeration_package_data() -
+ * Populate all properties of an instance under enumeration attribute
+ *
+ * @enum_obj: ACPI object with enumeration data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int hp_populate_enumeration_package_data(union acpi_object *enum_obj,
+					 int instance_id,
+					 struct kobject *attr_name_kobj)
+{
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+
+	enum_data->attr_name_kobj = attr_name_kobj;
+
+	hp_populate_enumeration_elements_from_package(enum_obj,
+						      enum_obj->package.count,
+						      instance_id);
+	hp_update_attribute_permissions(enum_data->common.is_readonly,
+					&enumeration_current_val);
+	/*
+	 * Several attributes have names such "MONDAY". Friendly
+	 * user nane is generated to make the name more descriptive
+	 */
+	hp_friendly_user_name_update(enum_data->common.path,
+				     attr_name_kobj->name,
+				     enum_data->common.display_name,
+				     sizeof(enum_data->common.display_name));
+	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+}
+
+static int hp_populate_enumeration_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_size,
+							int instance_id)
+{
+	int values;
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+	int ret = 0;
+
+	/*
+	 * Only data relevant to this driver and its functionality is
+	 * read. BIOS defines the order in which each * element is
+	 * read. Element 0 data is not relevant to this
+	 * driver hence it is ignored. For clarity, all element names
+	 * (DISPLAY_IN_UI) which defines the order in which is read
+	 * and the name matches the variable where the data is stored.
+	 *
+	 * In earlier implementation, reported errors were ignored
+	 * causing the data to remain uninitialized. It is not
+	 * possible to determine if data read from BIOS is valid or
+	 * not. It is for this reason functions may return a error
+	 * without validating the data itself.
+	 */
+
+	// VALUE:
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size, enum_data->current_value,
+					sizeof(enum_data->current_value));
+	if (ret < 0)
+		goto buffer_exit;
+
+	// COMMON:
+	ret = hp_get_common_data_from_buffer(&buffer_ptr, buffer_size, &enum_data->common);
+	if (ret < 0)
+		goto buffer_exit;
+
+	// ENUM_CURRENT_VALUE:
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size,
+					enum_data->current_value,
+					sizeof(enum_data->current_value));
+	if (ret < 0)
+		goto buffer_exit;
+
+	// ENUM_SIZE:
+	ret = hp_get_integer_from_buffer(&buffer_ptr, buffer_size,
+					 &enum_data->possible_values_size);
+
+	if (enum_data->possible_values_size > MAX_VALUES_SIZE) {
+		/* Report a message and limit possible values size to maximum value */
+		pr_warn("Enum Possible size value exceeded the maximum number of elements supported or data may be malformed\n");
+		enum_data->possible_values_size = MAX_VALUES_SIZE;
+	}
+
+	// ENUM_POSSIBLE_VALUES:
+	for (values = 0; values < enum_data->possible_values_size; values++) {
+		ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size,
+						enum_data->possible_values[values],
+						sizeof(enum_data->possible_values[values]));
+		if (ret < 0)
+			break;
+	}
+
+buffer_exit:
+	return ret;
+}
+
+/**
+ * hp_populate_enumeration_buffer_data() -
+ * Populate all properties of an instance under enumeration attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int hp_populate_enumeration_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
+					int instance_id,
+					struct kobject *attr_name_kobj)
+{
+	struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+	int ret = 0;
+
+	enum_data->attr_name_kobj = attr_name_kobj;
+
+	/* Populate enumeration elements */
+	ret = hp_populate_enumeration_elements_from_buffer(buffer_ptr, buffer_size,
+							   instance_id);
+	if (ret < 0)
+		return ret;
+
+	hp_update_attribute_permissions(enum_data->common.is_readonly,
+					&enumeration_current_val);
+	/*
+	 * Several attributes have names such "MONDAY". A Friendlier
+	 * user nane is generated to make the name more descriptive
+	 */
+	hp_friendly_user_name_update(enum_data->common.path,
+				     attr_name_kobj->name,
+				     enum_data->common.display_name,
+				     sizeof(enum_data->common.display_name));
+
+	return sysfs_create_group(attr_name_kobj, &enumeration_attr_group);
+}
+
+/**
+ * hp_exit_enumeration_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void hp_exit_enumeration_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.enumeration_instances_count;
+	     instance_id++) {
+		struct enumeration_data *enum_data = &bioscfg_drv.enumeration_data[instance_id];
+		struct kobject *attr_name_kobj = enum_data->attr_name_kobj;
+
+		if (attr_name_kobj)
+			sysfs_remove_group(attr_name_kobj, &enumeration_attr_group);
+	}
+	bioscfg_drv.enumeration_instances_count = 0;
+
+	kfree(bioscfg_drv.enumeration_data);
+	bioscfg_drv.enumeration_data = NULL;
+}
-- 
2.34.1

