Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 41C467202B9
	for <lists+platform-driver-x86@lfdr.de>; Fri,  2 Jun 2023 15:11:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236007AbjFBNLI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 2 Jun 2023 09:11:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235979AbjFBNKy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 2 Jun 2023 09:10:54 -0400
Received: from mail-oi1-x236.google.com (mail-oi1-x236.google.com [IPv6:2607:f8b0:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3BBA91B6;
        Fri,  2 Jun 2023 06:10:52 -0700 (PDT)
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-39a55e5cfc0so1754535b6e.3;
        Fri, 02 Jun 2023 06:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685711451; x=1688303451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RZU9mJB4e9US6MCdUI4SgAPj2VKTbassbztj2iVhT3I=;
        b=TNCIRYaiUeg9WdMhl1tBc85lJclJFdPd19g9hrRjdQ/Cf4Z/AC/cVVm8uv3DTmc8pV
         EYBhr4lU6fPwlSlkKhL39/Afb9BDfuIFqa8sOW6i1G5OqoNKtOFDn8pa/BE7292pr2lK
         WKPBVgDIgLb9dfQ70wkKOajbjHPRCOzJy7JiwtL04l9FoKqlZ/lDd1NaDgQ44l4Is9tF
         CwrL7wZJEQ6ZhsHWszlzgkXe4Fzv1ans2RGYbabYrbSWKzLg6+f2hg4k4WcB1W5PcI8a
         1URKx/E2SZdu258KP+8GU9sGtm0WS08NPWxpnflVXiCYuCfCRftUXOmbTjXmWWe+YSI3
         JqeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685711451; x=1688303451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZU9mJB4e9US6MCdUI4SgAPj2VKTbassbztj2iVhT3I=;
        b=grQnQnSbwcNOwA/ISwF48Fof2fdHXYT2Lr+L/7Jd2+do3reibJ5bQjAsXSRvqbwPKE
         Pqfg/930PZlboNAIhVgR+xoaITaNBv7VPGlmmnjdtCvAugr83Yr1QEa12sNAUik2DbRO
         muanO5AwEiYzErHYKFrqscR7U5C1w7DFJqg1GEqKpbg2pY1tWfaYOLAPAeLQVqxCn4qH
         VDjRU2CjBflJ7qa9bI+MMzPLQv3Oco6j8K20XbwJ7cqIAme+rxVlN/mXgxZuYCIanker
         8ZQOTs+6wCgsJIj9iJnfrIXxVUcUbwLVik7pk4QhRm48Kdzd1CYVDDaPIqMWTg5L9iST
         lLaQ==
X-Gm-Message-State: AC+VfDzSkMN3bfaqWrEBi1jKL591BUBVJyoPYrxse6VmUu5ZYglRsuBl
        58O4G/dQAvDDnefXAu5Lf9E=
X-Google-Smtp-Source: ACHHUZ7ZM853el2B2KL/2nQLo+ORcJ7OhuxVsnrdtZfUoOxTlPv5fulNCmpqnT9z/vxz8zupE2LWig==
X-Received: by 2002:a05:6808:307:b0:398:342a:f491 with SMTP id i7-20020a056808030700b00398342af491mr2438754oie.34.1685711451003;
        Fri, 02 Jun 2023 06:10:51 -0700 (PDT)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:125c:6b6d:18e9:9361])
        by smtp.gmail.com with ESMTPSA id k17-20020a544691000000b0039a531d9b92sm483762oic.56.2023.06.02.06.10.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 06:10:50 -0700 (PDT)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, thomas@t-8ch.de,
        ilpo.jarvinen@linux.intel.com
Subject: [PATCH v16 04/13] hp-bioscfg: biosattr-interface
Date:   Fri,  2 Jun 2023 08:10:35 -0500
Message-Id: <20230602131044.3297-5-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230602131044.3297-1-jorge.lopez2@hp.com>
References: <20230602131044.3297-1-jorge.lopez2@hp.com>
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

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

Many features of HP Commercial notebooks can be managed using Windows
Management Instrumentation (WMI). WMI is an implementation of Web-Based
Enterprise Management (WBEM) that provides a standards-based interface
for changing and monitoring system settings. HP BIOSCFG driver provides
a native Linux solution and the exposed features facilitates the
migration to Linux environments.

The Linux security features to be provided in hp-bioscfg driver enables
managing the BIOS settings and security solutions via sysfs, a virtual
filesystem that can be used by user-mode applications. The new
documentation cover HP-specific firmware sysfs attributes such Secure
Platform Management and Sure Start. Each section provides security
feature description and identifies sysfs directories and files exposed
by the driver.

Many HP Commercial notebooks include a feature called Secure Platform
Management (SPM), which replaces older password-based BIOS settings
management with public key cryptography. PC secure product management
begins when a target system is provisioned with cryptographic keys
that are used to ensure the integrity of communications between system
management utilities and the BIOS.

HP Commercial notebooks have several BIOS settings that control its
behaviour and capabilities, many of which are related to security.
To prevent unauthorized changes to these settings, the system can
be configured to use a cryptographic signature-based authorization
string that the BIOS will use to verify authorization to modify the
setting.

Linux Security components are under development and not published yet.
The only linux component is the driver (hp bioscfg) at this time.
Other published security components are under Windows.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next
---
 .../x86/hp/hp-bioscfg/biosattr-interface.c    | 312 ++++++++++++++++++
 1 file changed, 312 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
new file mode 100644
index 000000000000..1d59ad600b84
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/biosattr-interface.c
@@ -0,0 +1,312 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to methods under BIOS interface GUID
+ * for use with hp-bioscfg driver.
+ *
+ *  Copyright (c) 2022 Hewlett-Packard Inc.
+ */
+
+#include <linux/wmi.h>
+#include "bioscfg.h"
+
+/*
+ * struct bios_args buffer is dynamically allocated.  New WMI command types
+ * were introduced that exceeds 128-byte data size.  Changes to handle
+ * the data size allocation scheme were kept in hp_wmi_perform_query function.
+ */
+struct bios_args {
+	u32 signature;
+	u32 command;
+	u32 commandtype;
+	u32 datasize;
+	u8 data[];
+};
+
+/**
+ * hp_set_attribute
+ *
+ * @a_name: The attribute name
+ * @a_value: The attribute value
+ *
+ * Sets an attribute to new value
+ *
+ * Returns zero on success
+ *	-ENODEV if device is not found
+ *	-EINVAL if the instance of 'Setup Admin' password is not found.
+ *	-ENOMEM unable to allocate memory
+ */
+int hp_set_attribute(const char *a_name, const char *a_value)
+{
+	int security_area_size;
+	int a_name_size, a_value_size;
+	u16 *buffer = NULL;
+	u16 *start;
+	int  buffer_size, instance, ret;
+	char *auth_token_choice;
+
+	mutex_lock(&bioscfg_drv.mutex);
+
+	instance = hp_get_password_instance_for_type(SETUP_PASSWD);
+	if (instance < 0) {
+		ret = -EINVAL;
+		goto out_set_attribute;
+	}
+
+	/* Select which auth token to use; password or [auth token] */
+	if (bioscfg_drv.spm_data.auth_token)
+		auth_token_choice = bioscfg_drv.spm_data.auth_token;
+	else
+		auth_token_choice = bioscfg_drv.password_data[instance].current_password;
+
+	a_name_size = hp_calculate_string_buffer(a_name);
+	a_value_size = hp_calculate_string_buffer(a_value);
+	security_area_size = hp_calculate_security_buffer(auth_token_choice);
+	buffer_size = a_name_size + a_value_size + security_area_size;
+
+	buffer = kmalloc(buffer_size + 1, GFP_KERNEL);
+	if (!buffer) {
+		ret = -ENOMEM;
+		goto out_set_attribute;
+	}
+
+	/* build variables to set */
+	start = buffer;
+	start = hp_ascii_to_utf16_unicode(start, a_name);
+	if (!start) {
+		ret = -EINVAL;
+		goto out_set_attribute;
+	}
+
+	start = hp_ascii_to_utf16_unicode(start, a_value);
+	if (!start) {
+		ret = -EINVAL;
+		goto out_set_attribute;
+	}
+
+	ret = hp_populate_security_buffer(start, auth_token_choice);
+	if (ret < 0)
+		goto out_set_attribute;
+
+	ret = hp_wmi_set_bios_setting(buffer, buffer_size);
+
+out_set_attribute:
+	kfree(buffer);
+	mutex_unlock(&bioscfg_drv.mutex);
+	return ret;
+}
+
+/**
+ * hp_wmi_perform_query
+ *
+ * @query:	The commandtype (enum hp_wmi_commandtype)
+ * @command:	The command (enum hp_wmi_command)
+ * @buffer:	Buffer used as input and/or output
+ * @insize:	Size of input buffer
+ * @outsize:	Size of output buffer
+ *
+ * returns zero on success
+ *         an HP WMI query specific error code (which is positive)
+ *         -EINVAL if the query was not successful at all
+ *         -EINVAL if the output buffer size exceeds buffersize
+ *
+ * Note: The buffersize must at least be the maximum of the input and output
+ *       size. E.g. Battery info query is defined to have 1 byte input
+ *       and 128 byte output. The caller would do:
+ *       buffer = kzalloc(128, GFP_KERNEL);
+ *       ret = hp_wmi_perform_query(HPWMI_BATTERY_QUERY, HPWMI_READ,
+ *				    buffer, 1, 128)
+ */
+int hp_wmi_perform_query(int query, enum hp_wmi_command command, void *buffer,
+			 u32 insize, u32 outsize)
+{
+	struct acpi_buffer input, output = { ACPI_ALLOCATE_BUFFER, NULL };
+	struct bios_return *bios_return;
+	union acpi_object *obj = NULL;
+	struct bios_args *args = NULL;
+	u32 mid, actual_outsize, ret;
+	size_t bios_args_size;
+
+	mid = hp_encode_outsize_for_pvsz(outsize);
+	if (WARN_ON(mid < 0))
+		return mid;
+
+	bios_args_size = struct_size(args, data, insize);
+	args = kmalloc(bios_args_size, GFP_KERNEL);
+	if (!args)
+		return -ENOMEM;
+
+	input.length = bios_args_size;
+	input.pointer = args;
+
+	/* BIOS expects 'SECU' in hex as the signature value*/
+	args->signature = 0x55434553;
+	args->command = command;
+	args->commandtype = query;
+	args->datasize = insize;
+	memcpy(args->data, buffer, flex_array_size(args, data, insize));
+
+	ret = wmi_evaluate_method(HP_WMI_BIOS_GUID, 0, mid, &input, &output);
+	if (ret)
+		goto out_free;
+
+	obj = output.pointer;
+	if (!obj) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	if (obj->type != ACPI_TYPE_BUFFER ||
+	    obj->buffer.length < sizeof(*bios_return)) {
+		pr_warn("query 0x%x returned wrong type or too small buffer\n", query);
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	bios_return = (struct bios_return *)obj->buffer.pointer;
+	ret = bios_return->return_code;
+	if (ret) {
+		if (ret != INVALID_CMD_VALUE && ret != INVALID_CMD_TYPE)
+			pr_warn("query 0x%x returned error 0x%x\n", query, ret);
+		goto out_free;
+	}
+
+	/* Ignore output data of zero size */
+	if (!outsize)
+		goto out_free;
+
+	actual_outsize = min_t(u32, outsize, obj->buffer.length - sizeof(*bios_return));
+	memcpy_and_pad(buffer, outsize, obj->buffer.pointer + sizeof(*bios_return),
+		       actual_outsize, 0);
+
+out_free:
+	ret = hp_wmi_error_and_message(ret);
+
+	kfree(obj);
+	kfree(args);
+	return ret;
+}
+
+static void *utf16_empty_string(u16 *p)
+{
+	*p++ = 2;
+	*p++ = 0x00;
+	return p;
+}
+
+/**
+ * hp_ascii_to_utf16_unicode -  Convert ascii string to UTF-16 unicode
+ *
+ * BIOS supports UTF-16 characters that are 2 bytes long.  No variable
+ * multi-byte language supported.
+ *
+ * @p:   Unicode buffer address
+ * @str: string to convert to unicode
+ *
+ * Returns a void pointer to the buffer string
+ */
+void *hp_ascii_to_utf16_unicode(u16 *p, const u8 *str)
+{
+	int len = strlen(str);
+	int ret;
+
+	/*
+	 * Add null character when reading an empty string
+	 * "02 00 00 00"
+	 */
+	if (len == 0)
+		return utf16_empty_string(p);
+
+	/* Move pointer len * 2 number of bytes */
+	*p++ = len * 2;
+	ret = utf8s_to_utf16s(str, strlen(str), UTF16_HOST_ENDIAN, p, len);
+	if (ret < 0) {
+		dev_err(bioscfg_drv.class_dev, "UTF16 conversion failed\n");
+		return NULL;
+	}
+
+	if (ret * sizeof(u16) > U16_MAX) {
+		dev_err(bioscfg_drv.class_dev, "Error string too long\n");
+		return NULL;
+	}
+
+	p += len;
+	return p;
+}
+
+/**
+ * hp_wmi_set_bios_setting - Set setting's value in BIOS
+ *
+ * @input_buffer: Input buffer address
+ * @input_size:   Input buffer size
+ *
+ * Returns: Count of unicode characters written to BIOS if successful, otherwise
+ *		-ENOMEM unable to allocate memory
+ *		-EINVAL buffer not allocated or too small
+ */
+int hp_wmi_set_bios_setting(u16 *input_buffer, u32 input_size)
+{
+	union acpi_object *obj;
+	struct acpi_buffer input = {input_size, input_buffer};
+	struct acpi_buffer output = {ACPI_ALLOCATE_BUFFER, NULL};
+	int ret;
+
+	ret = wmi_evaluate_method(HP_WMI_SET_BIOS_SETTING_GUID, 0, 1, &input, &output);
+
+	obj = output.pointer;
+	if (!obj)
+		return -EINVAL;
+
+	if (obj->type != ACPI_TYPE_INTEGER) {
+		ret = -EINVAL;
+		goto out_free;
+	}
+
+	ret = obj->integer.value;
+	if (ret) {
+		ret = hp_wmi_error_and_message(ret);
+		goto out_free;
+	}
+
+out_free:
+	kfree(obj);
+	return ret;
+}
+
+static int hp_attr_set_interface_probe(struct wmi_device *wdev, const void *context)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	mutex_unlock(&bioscfg_drv.mutex);
+	return 0;
+}
+
+static void hp_attr_set_interface_remove(struct wmi_device *wdev)
+{
+	mutex_lock(&bioscfg_drv.mutex);
+	mutex_unlock(&bioscfg_drv.mutex);
+}
+
+static const struct wmi_device_id hp_attr_set_interface_id_table[] = {
+	{ .guid_string = HP_WMI_BIOS_GUID},
+	{ }
+};
+
+static struct wmi_driver hp_attr_set_interface_driver = {
+	.driver = {
+		.name = DRIVER_NAME,
+	},
+	.probe = hp_attr_set_interface_probe,
+	.remove = hp_attr_set_interface_remove,
+	.id_table = hp_attr_set_interface_id_table,
+};
+
+int hp_init_attr_set_interface(void)
+{
+	return wmi_driver_register(&hp_attr_set_interface_driver);
+}
+
+void hp_exit_attr_set_interface(void)
+{
+	wmi_driver_unregister(&hp_attr_set_interface_driver);
+}
+
+MODULE_DEVICE_TABLE(wmi, hp_attr_set_interface_id_table);
-- 
2.34.1

