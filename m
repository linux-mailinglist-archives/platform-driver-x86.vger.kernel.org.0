Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CA0728519
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Jun 2023 18:34:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235839AbjFHQeW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Jun 2023 12:34:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235828AbjFHQdr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Jun 2023 12:33:47 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 485CE30C3;
        Thu,  8 Jun 2023 09:33:37 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-39aa8256db7so521136b6e.0;
        Thu, 08 Jun 2023 09:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686242015; x=1688834015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iZ7rLLJQsLWdZ9Zopr/jJRNquJYYEl50eK4BcqvMQ1E=;
        b=bw2Mb/bGuedJUorgea5euAW8WR9TYzRUMc1En3/GjJ7QbxWPWl59oP7tZIjWRh+mJe
         cELAWhX7vXZLSrkFVN/Ev/f+iN7d8fIHo7mm5vzjzQDQwU8oh2d3iP8tp4RsW062EwBS
         aWMQqPaUoOTgjIy9bWch0YjNkmCtlqT4Q09E/Gw923uleRX7Vb/kbGCXUGBhy+/aU67T
         8hP5SGFaNbjsNPD9gYNKn8hMzXGEij4CUFOMhwJBDfbAEdWgQOs6+z5bGgjZSSXETcqL
         VOxKTkJmrcIQoXHQQlb++bs0DaxlhkxXbck0zX27mFAcnwPCj43CKjPnO6qB70/k6pIG
         ikjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686242015; x=1688834015;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iZ7rLLJQsLWdZ9Zopr/jJRNquJYYEl50eK4BcqvMQ1E=;
        b=RJJrtR8lRIht4tFSaUnYI5zHzHuaNWsm46hpaw8JZaiQT7RlLXOcaA/2ZVV3HmUDEK
         T3PbEwZlBfQLFOyELEsxXYJYOjucbYeNpZKfwfrCRalKwdIby5Wq40Wu+n2eOIXdduSp
         RgeF6M3y2gJwGGcS9riDDcrTct6ldH3zsyIBJRuC/kyOH1F4xgExLXTP2tqmOADtmdV1
         CYtI36dmqtddnxm5DNIyyj0FGtX5RdBctgfrxAOKQgx5Xh1G+74s4DokdCMOHqkvEPYo
         vPnGmwfDwQM0s28evRbHzKKgvvIB/tWBvvF72oY2DqimYLmtlr6y1485IvZG0CT9rRzf
         Eh5A==
X-Gm-Message-State: AC+VfDwEvm4fBLyyATFnP3OKH598aDlVrRUyy8td3+ew4vi+pOMVkHf8
        Jt3gwdXlic7UKY90Ev0Z4W78Zw04NzI=
X-Google-Smtp-Source: ACHHUZ56iBGuOzTvKx04TIAp7OFmdk6yBvW+CSfSdJDpJ7fiPAJVG9SFPOQbgrp1i3S+tQHNgQuO5w==
X-Received: by 2002:a05:6808:c4:b0:39a:aba9:bcb6 with SMTP id t4-20020a05680800c400b0039aaba9bcb6mr8951362oic.0.1686242013615;
        Thu, 08 Jun 2023 09:33:33 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:a60f:2d4d:e52b:2fca])
        by smtp.gmail.com with ESMTPSA id e10-20020acab50a000000b003942036439dsm577500oif.46.2023.06.08.09.33.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 09:33:33 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: [PATCH v17 10/13] hp-bioscfg: string-attributes
Date:   Thu,  8 Jun 2023 11:33:16 -0500
Message-Id: <20230608163319.18934-11-jorge.lopez2@hp.com>
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

Add string attributes support to hp-bioscfg.

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../x86/hp/hp-bioscfg/string-attributes.c     | 390 ++++++++++++++++++
 1 file changed, 390 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
new file mode 100644
index 000000000000..1b62e372fb9e
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -0,0 +1,390 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to string type attributes under
+ * HP_WMI_BIOS_STRING_GUID for use with hp-bioscfg driver.
+ *
+ * Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+#define WMI_STRING_TYPE "HPBIOS_BIOSString"
+
+GET_INSTANCE_ID(string);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	int instance_id = get_string_instance_id(kobj);
+
+	if (instance_id < 0)
+		return -EIO;
+
+	return  sysfs_emit(buf, "%s\n",
+			 bioscfg_drv.string_data[instance_id].current_value);
+}
+
+/**
+ * validate_string_input() -
+ * Validate input of current_value against min and max lengths
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_string_input(int instance_id, const char *buf)
+{
+	int in_len = strlen(buf);
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
+
+	/* BIOS treats it as a read only attribute */
+	if (string_data->common.is_readonly)
+		return -EIO;
+
+	if (in_len < string_data->min_length || in_len > string_data->max_length)
+		return -ERANGE;
+
+	return 0;
+}
+
+static void update_string_value(int instance_id, char *attr_value)
+{
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
+
+	/* Write settings to BIOS */
+	strscpy(string_data->current_value, attr_value, sizeof(string_data->current_value));
+}
+
+/*
+ * ATTRIBUTE_S_COMMON_PROPERTY_SHOW(display_name_language_code, string);
+ * static struct kobj_attribute string_display_langcode =
+ *	__ATTR_RO(display_name_language_code);
+ */
+
+ATTRIBUTE_S_COMMON_PROPERTY_SHOW(display_name, string);
+static struct kobj_attribute string_display_name =
+	__ATTR_RO(display_name);
+
+ATTRIBUTE_PROPERTY_STORE(current_value, string);
+static struct kobj_attribute string_current_val =
+	__ATTR_RW_MODE(current_value, 0644);
+
+ATTRIBUTE_N_PROPERTY_SHOW(min_length, string);
+static struct kobj_attribute string_min_length =
+	__ATTR_RO(min_length);
+
+ATTRIBUTE_N_PROPERTY_SHOW(max_length, string);
+static struct kobj_attribute string_max_length =
+	__ATTR_RO(max_length);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "string\n");
+}
+
+static struct kobj_attribute string_type =
+	__ATTR_RO(type);
+
+static struct attribute *string_attrs[] = {
+	&common_display_langcode.attr,
+	&string_display_name.attr,
+	&string_current_val.attr,
+	&string_min_length.attr,
+	&string_max_length.attr,
+	&string_type.attr,
+	NULL
+};
+
+static const struct attribute_group string_attr_group = {
+	.attrs = string_attrs,
+};
+
+int hp_alloc_string_data(void)
+{
+	bioscfg_drv.string_instances_count = hp_get_instance_count(HP_WMI_BIOS_STRING_GUID);
+	bioscfg_drv.string_data = kcalloc(bioscfg_drv.string_instances_count,
+					  sizeof(*bioscfg_drv.string_data), GFP_KERNEL);
+	if (!bioscfg_drv.string_data) {
+		bioscfg_drv.string_instances_count = 0;
+		return -ENOMEM;
+	}
+	return 0;
+}
+
+/* Expected Values types associated with each element */
+static const acpi_object_type expected_string_types[] = {
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
+	[STR_MIN_LENGTH] = ACPI_TYPE_INTEGER,
+	[STR_MAX_LENGTH] = ACPI_TYPE_INTEGER,
+};
+
+static int hp_populate_string_elements_from_package(union acpi_object *string_obj,
+						    int string_obj_count,
+						    int instance_id)
+{
+	char *str_value = NULL;
+	int value_len;
+	int ret = 0;
+	u32 int_value;
+	int elem;
+	int reqs;
+	int eloc;
+	int size;
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
+
+	if (!string_obj)
+		return -EINVAL;
+
+	for (elem = 1, eloc = 1; elem < string_obj_count; elem++, eloc++) {
+		/* ONLY look at the first STRING_ELEM_CNT elements */
+		if (eloc == STR_ELEM_CNT)
+			goto exit_string_package;
+
+		switch (string_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+			if (elem != PREREQUISITES) {
+				ret = hp_convert_hexstr_to_str(string_obj[elem].string.pointer,
+							       string_obj[elem].string.length,
+							       &str_value, &value_len);
+
+				if (ret)
+					continue;
+			}
+			break;
+		case ACPI_TYPE_INTEGER:
+			int_value = (u32)string_obj[elem].integer.value;
+			break;
+		default:
+			pr_warn("Unsupported object type [%d]\n", string_obj[elem].type);
+			continue;
+		}
+
+		/* Check that both expected and read object type match */
+		if (expected_string_types[eloc] != string_obj[elem].type) {
+			pr_err("Error expected type %d for elem %d, but got type %d instead\n",
+			       expected_string_types[eloc], elem, string_obj[elem].type);
+			return -EIO;
+		}
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			strscpy(string_data->current_value,
+				str_value, sizeof(string_data->current_value));
+			break;
+		case PATH:
+			strscpy(string_data->common.path, str_value,
+				sizeof(string_data->common.path));
+			break;
+		case IS_READONLY:
+			string_data->common.is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			string_data->common.display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			string_data->common.requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			string_data->common.sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			string_data->common.prerequisites_size = int_value;
+
+			if (string_data->common.prerequisites_size > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero. PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (string_data->common.prerequisites_size == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = min_t(u32, string_data->common.prerequisites_size,
+				     MAX_PREREQUISITES_SIZE);
+
+			for (reqs = 0; reqs < size; reqs++) {
+				if (elem >= string_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
+				ret = hp_convert_hexstr_to_str(string_obj[elem + reqs].string.pointer,
+							       string_obj[elem + reqs].string.length,
+							       &str_value, &value_len);
+
+				if (ret)
+					continue;
+
+				strscpy(string_data->common.prerequisites[reqs],
+					str_value,
+					sizeof(string_data->common.prerequisites[reqs]));
+				kfree(str_value);
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			string_data->common.security_level = int_value;
+			break;
+		case STR_MIN_LENGTH:
+			string_data->min_length = int_value;
+			break;
+		case STR_MAX_LENGTH:
+			string_data->max_length = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+
+		kfree(str_value);
+	}
+
+exit_string_package:
+	kfree(str_value);
+	return 0;
+}
+
+/**
+ * hp_populate_string_package_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @string_obj: ACPI object with string data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int hp_populate_string_package_data(union acpi_object *string_obj,
+				    int instance_id,
+				    struct kobject *attr_name_kobj)
+{
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
+
+	string_data->attr_name_kobj = attr_name_kobj;
+
+	hp_populate_string_elements_from_package(string_obj,
+						 string_obj->package.count,
+						 instance_id);
+
+	hp_update_attribute_permissions(string_data->common.is_readonly,
+					&string_current_val);
+	hp_friendly_user_name_update(string_data->common.path,
+				     attr_name_kobj->name,
+				     string_data->common.display_name,
+				     sizeof(string_data->common.display_name));
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+static int hp_populate_string_elements_from_buffer(u8 *buffer_ptr, u32 *buffer_size,
+						   int instance_id)
+{
+	int ret = 0;
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
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
+	ret = hp_get_string_from_buffer(&buffer_ptr, buffer_size, string_data->current_value,
+					sizeof(string_data->current_value));
+	if (ret < 0)
+		goto buffer_exit;
+
+	// COMMON:
+	ret = hp_get_common_data_from_buffer(&buffer_ptr, buffer_size, &string_data->common);
+	if (ret < 0)
+		goto buffer_exit;
+
+	// STR_MIN_LENGTH:
+	ret = hp_get_integer_from_buffer(&buffer_ptr, buffer_size,
+					 &string_data->min_length);
+	if (ret < 0)
+		goto buffer_exit;
+
+	// STR_MAX_LENGTH:
+	ret = hp_get_integer_from_buffer(&buffer_ptr, buffer_size,
+					 &string_data->max_length);
+
+buffer_exit:
+
+	return ret;
+}
+
+/**
+ * hp_populate_string_buffer_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int hp_populate_string_buffer_data(u8 *buffer_ptr, u32 *buffer_size,
+				   int instance_id,
+				   struct kobject *attr_name_kobj)
+{
+	struct string_data *string_data = &bioscfg_drv.string_data[instance_id];
+	int ret = 0;
+
+	string_data->attr_name_kobj = attr_name_kobj;
+
+	ret = hp_populate_string_elements_from_buffer(buffer_ptr, buffer_size,
+						      instance_id);
+	if (ret < 0)
+		return ret;
+
+	hp_update_attribute_permissions(string_data->common.is_readonly,
+					&string_current_val);
+	hp_friendly_user_name_update(string_data->common.path,
+				     attr_name_kobj->name,
+				     string_data->common.display_name,
+				     sizeof(string_data->common.display_name));
+
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+/**
+ * hp_exit_string_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void hp_exit_string_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.string_instances_count;
+	     instance_id++) {
+		struct kobject *attr_name_kobj =
+			bioscfg_drv.string_data[instance_id].attr_name_kobj;
+
+		if (attr_name_kobj)
+			sysfs_remove_group(attr_name_kobj, &string_attr_group);
+	}
+	bioscfg_drv.string_instances_count = 0;
+
+	kfree(bioscfg_drv.string_data);
+	bioscfg_drv.string_data = NULL;
+}
-- 
2.34.1

