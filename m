Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 322386B2E39
	for <lists+platform-driver-x86@lfdr.de>; Thu,  9 Mar 2023 21:10:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230236AbjCIUKd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Mar 2023 15:10:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229914AbjCIUKb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Mar 2023 15:10:31 -0500
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com [IPv6:2607:f8b0:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 267DAFA0BC
        for <platform-driver-x86@vger.kernel.org>; Thu,  9 Mar 2023 12:10:28 -0800 (PST)
Received: by mail-oi1-x22c.google.com with SMTP id bj30so2579608oib.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 09 Mar 2023 12:10:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678392627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jQMKLdTJ5Wf+3GParwPftgkIGe1NYFOM48Da2CqcGFk=;
        b=jHprmMPfuwkWl6lwOj2PotZ3hktBaRAUdM39aTYP2o1OmQicYwBe38zssDVayGjB2z
         sOOO60XDwUyyPEc/RTofuvWXnnc+oOSUae+x9Kvw0qPsKETqM+mY7LqZluuNs272iweH
         0nqrZL76YrvexBpFGqpGeB/81tZr8OTHKhDp5xM1uOX0pvqLoBFb0SJD9Cer+xE3eCFL
         dQuz6PJwFBVmKksSBEl8BMBP6Jc7NiDfRBpKQ/OOZ7lskdb7C461LgXYy4/FxzUKI/WQ
         /aaEKnLt6dci5/CSJgPWm88xnmI7fYyyof4D/6wDhR26JqHzx6HMoueeXPB/M2MzSvPZ
         2q9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678392627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jQMKLdTJ5Wf+3GParwPftgkIGe1NYFOM48Da2CqcGFk=;
        b=CS+393MNu6O9B4wFOah5GCh9E4OVWDU02aBTwqygw04ynYPITdWsv7ld9/Iog8wgtg
         +7V4ysH+7fDJjbFBU/1kztgO94yIG+aWuJztcdXmZjzTw+qfGuGheBndiDXGOWyyN3AC
         JhMbMRD4QDeqq1kB4/eYtSxp1Bm35kGujRNEkMNU8y2cgxLA0Ys4ur86vKNrTgw0dlTb
         I95vsTv+brWthyhhloobrxxbzNNlu119AzwWxNROyorn+eGXkjYr7DSOyFWJZD/yxswS
         Tys1rImWaytm9dWlqdEnt+mxToV7MXF/uVukOzsJZ0ksfMERXdzOKDhhi7s4pehJ4P/J
         tyzA==
X-Gm-Message-State: AO0yUKVnit4J04xRCXL2rdLM43df3V89FJz5nnXJo7uA08pQAYGxSWMC
        isxQ919Fu+TNYvwyYkMozyHdWzEKGWI=
X-Google-Smtp-Source: AK7set8PqDr9nYojRO12aekTnlysJUIXkM2Vawt8Vh8c4KTrf5tkogGeWf+4XouK20BFDLduyzA1hA==
X-Received: by 2002:aca:1902:0:b0:384:3e58:2666 with SMTP id l2-20020aca1902000000b003843e582666mr9777081oii.5.1678392627240;
        Thu, 09 Mar 2023 12:10:27 -0800 (PST)
Received: from grumpy-VECTOR.hsd1.tx.comcast.net ([2601:2c3:480:7390:44ca:abca:1f7c:b8e7])
        by smtp.gmail.com with ESMTPSA id r129-20020acaf387000000b00383f58e7e95sm98879oih.17.2023.03.09.12.10.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Mar 2023 12:10:25 -0800 (PST)
From:   Jorge Lopez <jorgealtxwork@gmail.com>
X-Google-Original-From: Jorge Lopez <jorge.lopez2@hp.com>
To:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 1/4] Introduction of HP-BIOSCFG driver
Date:   Thu,  9 Mar 2023 14:10:19 -0600
Message-Id: <20230309201022.9502-2-jorge.lopez2@hp.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230309201022.9502-1-jorge.lopez2@hp.com>
References: <20230309201022.9502-1-jorge.lopez2@hp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The purpose for this patch is submit HP BIOSCFG driver to be list of
HP Linux kernel drivers.  The driver include a total of 12 files
broken in several patches.

HP BIOS Configuration driver purpose is to provide a driver supporting
the latest sysfs class firmware attributes framework allowing the user
to change BIOS settings and security solutions on HP Inc.’s commercial
notebooks.

Many features of HP Commercial PC’s can be managed using Windows
Management Instrumentation (WMI). WMI is an implementation of Web-Based
Enterprise Management (WBEM) that provides a standards-based interface
for changing and monitoring system settings.  HP BISOCFG driver provides
a native Linux solution and the exposed features facilitates the
migration to Linux environments.

The Linux security features to be provided in hp-bioscfg driver enables
managing the BIOS settings and security solutions via sysfs, a virtual
filesystem that can be used by user-mode applications.   The new
documentation cover features such Secure Platform Management, Sure
Admin, and Sure Start.  Each section provides security feature
description and identifies sysfs directories and files exposed by
the driver.

Many HP Commercial PC’s include a feature called Secure Platform
Management (SPM), which replaces older password-based BIOS settings
management with public key cryptography. PC secure product management
begins when a target system is provisioned with cryptographic keys
that are used to ensure the integrity of communications between system
management utilities and the BIOS.

HP Commercial PC’s have several BIOS settings that control its behaviour
and capabilities, many of which are related to security. To prevent
unauthorized changes to these settings, the system can be configured
to use a Sure Admin cryptographic signature-based authorization string
that the BIOS will use to verify authorization to modify the setting.

Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>

---
Based on the latest platform-drivers-x86.git/for-next

History

Version 6
	Breaks down the changes into 4 patches
	SureAdmin-attributes was removed

Version 5
	Remove version 4 patch 1
	Address review changes proposed in Version 4
	Reorganize all patches number and file order
---
 .../x86/hp/hp-bioscfg/spmobj-attributes.c     | 460 ++++++++++++++++++
 .../x86/hp/hp-bioscfg/string-attributes.c     | 459 +++++++++++++++++
 .../x86/hp/hp-bioscfg/surestart-attributes.c  | 149 ++++++
 3 files changed, 1068 insertions(+)
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
 create mode 100644 drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c

diff --git a/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
new file mode 100644
index 000000000000..60a7bcfd7951
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/spmobj-attributes.c
@@ -0,0 +1,460 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to secure platform management object type
+ * attributes under BIOS PASSWORD for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+
+#define MAX_KEK_BLOB_SIZE	4160
+#define MAX_SK_BLOB_SIZE	516
+
+enum spm_states_values {
+	NOT_PROVISIONED		 = 0x00,
+	PROVISIONED		 = 0x01,
+	PROVISIONING_IN_PROGRESS = 0x02
+};
+
+static const char * const spm_state_types[] = {
+	"not provisioned",
+	"provisioned",
+	"provisioning in progress"
+};
+
+
+int check_spm_is_enabled(void)
+{
+	/* do we need to check the admin password is also configured */
+	return bioscfg_drv.spm_data.is_enabled;
+}
+
+/*
+ * calculate_security_buffer() - determines size of security buffer
+ * for authentication scheme
+ *
+ * @authentication: the authentication content
+ *
+ * Currently only supported type is Admin password
+ */
+size_t calculate_security_buffer(const char *authentication)
+{
+	int size;
+
+	if (authentication != NULL && strlen(authentication) > 0) {
+
+		size = (sizeof(u16) + (strlen(authentication) * sizeof(u16)));
+		if (strncmp(authentication, BEAM_PREFIX, strlen(BEAM_PREFIX)) != 0)
+			size += (strlen(UTF_PREFIX) * sizeof(u16));
+
+		return size;
+	}
+
+	size  = sizeof(u16) * 2;
+	return size;
+}
+
+/*
+ * populate_security_buffer() - builds a security buffer for
+ * authentication scheme
+ *
+ * @buffer: the buffer to populate
+ * @authentication: the authentication content
+ *
+ * Currently only supported type is PLAIN TEXT
+ */
+void populate_security_buffer(u16 *buffer, const char *authentication)
+{
+	u16 *auth = buffer;
+	char *strprefix = NULL;
+
+	if (strncmp(authentication, BEAM_PREFIX, strlen(BEAM_PREFIX)) == 0) {
+		/*
+		 * BEAM_PREFIX is append to buffer when a signature
+		 * is provided and Sure Admin is enabled in BIOS
+		 */
+		// BEAM_PREFIX found, convert part to unicode
+		auth = ascii_to_utf16_unicode(auth, authentication);
+	} else {
+		/*
+		 * UTF-16 prefix is append to the * buffer when a BIOS
+		 * admin password is configured in BIOS
+		 */
+
+		// append UTF_PREFIX to part and then convert it to unicode
+		strprefix = kasprintf(GFP_KERNEL, "%s%s", UTF_PREFIX,
+				      authentication);
+		if (!strprefix)
+			goto out_populate_security_buffer;
+
+		auth = ascii_to_utf16_unicode(auth, strprefix);
+	}
+out_populate_security_buffer:
+
+	kfree(strprefix);
+	strprefix = NULL;
+}
+
+ssize_t update_spm_state(void)
+{
+	int ret;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto spm_state_exit;
+	}
+
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
+				   HPWMI_SECUREPLATFORM, data, 0,
+				   sizeof(struct secureplatform_provisioning_data));
+	if (ret < 0)
+		goto spm_state_exit;
+
+	bioscfg_drv.spm_data.mechanism = data->state;
+	if (bioscfg_drv.spm_data.mechanism)
+		bioscfg_drv.spm_data.is_enabled = 1;
+
+spm_state_exit:
+	kfree(data);
+
+	return ret;
+}
+
+/*
+ * statusbin - Reports SPM status in binary format
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *
+ */
+ssize_t statusbin(struct kobject *kobj,
+		  struct kobj_attribute *attr, char *buf)
+{
+	int ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_GET_STATE,
+				       HPWMI_SECUREPLATFORM, buf, 0,
+				       sizeof(struct secureplatform_provisioning_data));
+
+	return ret ? -ENODEV : sizeof(struct secureplatform_provisioning_data);
+}
+
+ssize_t statusbin_show(struct kobject *kobj,
+		       struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto statusbin_show_exit;
+	}
+
+	ret = statusbin(kobj, attr, (char *)data);
+	if (ret < 0)
+		goto statusbin_show_exit;
+
+	/* copy data to spm local structure */
+	memcpy(buf, data, sizeof(struct secureplatform_provisioning_data));
+
+statusbin_show_exit:
+	kfree(data);
+
+	return ret ? ret : strnlen(buf, PAGE_SIZE);
+}
+struct kobj_attribute password_spm_statusbin = __ATTR_RO(statusbin);
+
+/*
+ * status_show - Reads SPM status
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes read on success.  Otherwise,
+ *         an HP WMI query specific error code (which is positive)
+ *         -ENODEV if the query was not successful at all
+ *         -ENOMEM if cannot allocate required memory size
+ *
+ */
+ssize_t status_show(struct kobject *kobj, struct kobj_attribute
+		    *attr, char *buf)
+{
+	int ret, i;
+	struct secureplatform_provisioning_data *data = NULL;
+
+	data = kmalloc(sizeof(struct secureplatform_provisioning_data),
+		       GFP_KERNEL);
+	if (!data) {
+		ret = -ENOMEM;
+		goto status_show_exit;
+	}
+
+	ret = statusbin(kobj, attr, (char *)data);
+	if (ret < 0)
+		goto status_show_exit;
+
+	sysfs_emit(buf, "%sState: %d\n", buf, data->state);
+	sysfs_emit(buf, "%sVersion: %d.%d\n", buf, data->version[0],
+		   data->version[1]);
+
+	/*
+	 * state == 0 means secure platform management
+	 * feature is not configured in BIOS.
+	 */
+	if (data->state == 0)
+		goto status_show_exit;
+
+	sysfs_emit(buf, "%sNonce: %d\n", buf, data->nonce);
+	sysfs_emit(buf, "%sFeaturesInUse: %d\n", buf, data->features);
+	sysfs_emit(buf, "%sEndorsementKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		sysfs_emit(buf, "%s %u", buf, data->kek_mod[i]);
+
+	sysfs_emit(buf, "%s }\n", buf);
+	sysfs_emit(buf, "%sSigningKeyMod: {", buf);
+
+	for (i = 255; i >= 0; i--)
+		sysfs_emit(buf, "%s %u", buf, data->sk_mod[i]);
+
+	/* Return buf contents */
+
+	sysfs_emit(buf, "%s }\n", buf);
+
+status_show_exit:
+	kfree(data);
+
+	return strnlen(buf, PAGE_SIZE);
+}
+
+struct kobj_attribute password_spm_status = __ATTR_RO(status);
+
+attribute_spm_n_property_show(is_enabled, spm);
+static struct kobj_attribute password_spm_is_key_enabled = __ATTR_RO(is_enabled);
+
+
+static ssize_t key_mechanism_show(struct kobject *kobj, struct kobj_attribute *attr,
+				  char *buf)
+{
+	int ret;
+
+	ret = sysfs_emit(buf, "%s\n",
+			 spm_mechanism_types[bioscfg_drv.spm_data.mechanism]);
+	return ret;
+}
+static struct kobj_attribute password_spm_key_mechanism = __ATTR_RO(key_mechanism);
+
+static ssize_t sk_store(struct kobject *kobj,
+			struct kobj_attribute *attr,
+			const char *buf, size_t count)
+{
+	int ret;
+	int length;
+
+	length = count;
+	if (buf[length-1] == '\n')
+		length--;
+
+	/* allocate space and copy current signing key */
+	bioscfg_drv.spm_data.signing_key = kmalloc(length, GFP_KERNEL);
+	if (!bioscfg_drv.spm_data.signing_key) {
+		ret = -ENOMEM;
+		goto exit_signing_key;
+	}
+
+	memcpy(bioscfg_drv.spm_data.signing_key, buf, length);
+	bioscfg_drv.spm_data.signing_key[length] = '\0';
+
+	/* submit signing key payload */
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_SK,
+				   HPWMI_SECUREPLATFORM,
+				   (void *)bioscfg_drv.spm_data.signing_key,
+				   length, 0);
+
+	if (!ret) {
+		bioscfg_drv.spm_data.mechanism = SIGNING_KEY;
+		bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_signing_key:
+	kfree(bioscfg_drv.spm_data.signing_key);
+	bioscfg_drv.spm_data.signing_key = NULL;
+
+	return ret ? ret : count;
+}
+
+static struct kobj_attribute password_spm_signing_key = __ATTR_WO(sk);
+
+static ssize_t kek_store(struct kobject *kobj,
+			 struct kobj_attribute *attr,
+			 const char *buf, size_t count)
+{
+	int ret;
+	int length;
+
+	length = count;
+	if (buf[length-1] == '\n')
+		length--;
+
+	/* allocate space and copy current signing key */
+	bioscfg_drv.spm_data.endorsement_key = kmalloc(length, GFP_KERNEL);
+	if (!bioscfg_drv.spm_data.endorsement_key) {
+		ret = -ENOMEM;
+		goto exit_endorsement_key;
+	}
+
+	memcpy(bioscfg_drv.spm_data.endorsement_key, buf, length);
+	bioscfg_drv.spm_data.endorsement_key[length] = '\0';
+
+	ret = hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
+				   HPWMI_SECUREPLATFORM,
+				   (void *)bioscfg_drv.spm_data.endorsement_key,
+				   count, 0);
+
+	if (!ret) {
+		bioscfg_drv.spm_data.mechanism = ENDORSEMENT_KEY;
+		bioscfg_drv.pending_reboot = TRUE;
+	}
+
+exit_endorsement_key:
+	kfree(bioscfg_drv.spm_data.endorsement_key);
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+
+	return ret ? ret : count;
+}
+static struct kobj_attribute password_spm_endorsement_key = __ATTR_WO(kek);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute password_spm_display_langcode =
+	__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SPM_STR_DESC);
+}
+static struct kobj_attribute password_spm_display_name = __ATTR_RO(display_name);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "secure-platform-management\n");
+}
+static struct kobj_attribute password_spm_type = __ATTR_RO(type);
+
+static ssize_t role_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "%s\n", role_type[BIOS_SPM]);
+}
+static struct kobj_attribute password_spm_role = __ATTR_RO(role);
+
+static ssize_t auth_token_store(struct kobject *kobj,
+				struct kobj_attribute *attr,
+				const char *buf, size_t count)
+{
+	int ret = 0;
+	int length;
+
+	length = count;
+	if (buf[length-1] == '\n')
+		length--;
+
+	/* allocate space and copy current auth token */
+	bioscfg_drv.spm_data.auth_token = kmalloc(count, GFP_KERNEL);
+	if (!bioscfg_drv.spm_data.auth_token) {
+		ret = -ENOMEM;
+		goto exit_auth_token;
+	}
+
+	memcpy(bioscfg_drv.spm_data.auth_token, buf, count);
+	bioscfg_drv.spm_data.auth_token[length] = '\0';
+	return count;
+
+
+exit_auth_token:
+	kfree(bioscfg_drv.spm_data.auth_token);
+	bioscfg_drv.spm_data.auth_token = NULL;
+
+	return ret;
+
+}
+static struct kobj_attribute password_spm_auth_token = __ATTR_WO(auth_token);
+
+static struct attribute *secure_platform_attrs[] = {
+	&password_spm_display_name.attr,
+	&password_spm_display_langcode.attr,
+	&password_spm_is_key_enabled.attr,
+	&password_spm_signing_key.attr,
+	&password_spm_endorsement_key.attr,
+	&password_spm_key_mechanism.attr,
+	&password_spm_status.attr,
+	&password_spm_statusbin.attr,
+	&password_spm_type.attr,
+	&password_spm_role.attr,
+	&password_spm_auth_token.attr,
+	NULL,
+};
+
+static const struct attribute_group secure_platform_attr_group = {
+	.attrs = secure_platform_attrs,
+};
+
+void exit_secure_platform_attributes(void)
+{
+	/* remove secure platform sysfs entry and free key data*/
+
+	kfree(bioscfg_drv.spm_data.endorsement_key);
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+
+	kfree(bioscfg_drv.spm_data.signing_key);
+	bioscfg_drv.spm_data.signing_key = NULL;
+
+	kfree(bioscfg_drv.spm_data.auth_token);
+	bioscfg_drv.spm_data.auth_token = NULL;
+
+	if (bioscfg_drv.spm_data.attr_name_kobj)
+		sysfs_remove_group(bioscfg_drv.spm_data.attr_name_kobj,
+				   &secure_platform_attr_group);
+}
+
+int populate_secure_platform_data(struct kobject *attr_name_kobj)
+{
+	/* Populate data for Secure Platform Management */
+	bioscfg_drv.spm_data.attr_name_kobj = attr_name_kobj;
+
+	strscpy(bioscfg_drv.spm_data.attribute_name, SPM_STR,
+		sizeof(bioscfg_drv.spm_data.attribute_name));
+	strscpy(bioscfg_drv.spm_data.display_name, SPM_STR_DESC,
+		sizeof(bioscfg_drv.spm_data.display_name));
+
+	bioscfg_drv.spm_data.is_enabled = 0;
+	bioscfg_drv.spm_data.mechanism = 0;
+	bioscfg_drv.pending_reboot = FALSE;
+	update_spm_state();
+
+	bioscfg_drv.spm_data.endorsement_key = NULL;
+	bioscfg_drv.spm_data.signing_key = NULL;
+	bioscfg_drv.spm_data.auth_token = NULL;
+
+	return sysfs_create_group(attr_name_kobj, &secure_platform_attr_group);
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
new file mode 100644
index 000000000000..79ec007fbcee
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/string-attributes.c
@@ -0,0 +1,459 @@
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
+get_instance_id(string);
+
+static ssize_t current_value_show(struct kobject *kobj, struct kobj_attribute *attr, char *buf)
+{
+	ssize_t ret;
+	int instance_id = get_string_instance_id(kobj);
+
+	if (instance_id < 0)
+		return -EIO;
+
+	ret = sysfs_emit(buf, "%s\n",
+			 bioscfg_drv.string_data[instance_id].current_value);
+
+	return ret;
+}
+
+/*
+ * validate_string_input() -
+ * Validate input of current_value against min and max lengths
+ *
+ * @instance_id: The instance on which input is validated
+ * @buf: Input value
+ */
+static int validate_string_input(int instance_id, const char *buf)
+{
+	int in_len = strlen(buf);
+
+	/* BIOS treats it as a read only attribute */
+	if (bioscfg_drv.string_data[instance_id].is_readonly)
+		return -EIO;
+
+	if ((in_len < bioscfg_drv.string_data[instance_id].min_length) ||
+	    (in_len > bioscfg_drv.string_data[instance_id].max_length))
+		return -EINVAL;
+
+	/*
+	 * set pending reboot flag depending on
+	 * "RequiresPhysicalPresence" value
+	 */
+	if (bioscfg_drv.string_data[instance_id].requires_physical_presence)
+		bioscfg_drv.pending_reboot = TRUE;
+	return 0;
+}
+
+static void update_string_value(int instance_id, char *attr_value)
+{
+	/* Write settings to BIOS */
+	strscpy(bioscfg_drv.string_data[instance_id].current_value,
+		attr_value,
+		sizeof(bioscfg_drv.string_data[instance_id].current_value));
+}
+
+attribute_s_property_show(display_name_language_code, string);
+static struct kobj_attribute string_display_langcode =
+	__ATTR_RO(display_name_language_code);
+
+attribute_s_property_show(display_name, string);
+static struct kobj_attribute string_display_name =
+	__ATTR_RO(display_name);
+
+attribute_property_store(current_value, string);
+static struct kobj_attribute string_current_val =
+	__ATTR_RW_MODE(current_value, 0644);
+
+attribute_n_property_show(min_length, string);
+static struct kobj_attribute string_min_length =
+	__ATTR_RO(min_length);
+
+attribute_n_property_show(max_length, string);
+static struct kobj_attribute string_max_length =
+	__ATTR_RO(max_length);
+
+attribute_n_property_show(prerequisites_size, string);
+static struct kobj_attribute  string_prerequisites_size_val =
+		__ATTR_RO(prerequisites_size);
+
+attribute_values_property_show(prerequisites, string);
+static struct kobj_attribute  string_prerequisites_val =
+		__ATTR_RO(prerequisites);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "string\n");
+}
+static struct kobj_attribute string_type =
+	__ATTR_RO(type);
+
+static struct attribute *string_attrs[] = {
+	&string_display_langcode.attr,
+	&string_display_name.attr,
+	&string_current_val.attr,
+	&string_min_length.attr,
+	&string_max_length.attr,
+	&string_prerequisites_size_val.attr,
+	&string_prerequisites_val.attr,
+	&string_type.attr,
+	NULL
+};
+
+static const struct attribute_group string_attr_group = {
+	.attrs = string_attrs,
+};
+
+int alloc_string_data(void)
+{
+	int ret = 0;
+
+	bioscfg_drv.string_instances_count = get_instance_count(HP_WMI_BIOS_STRING_GUID);
+	bioscfg_drv.string_data = kcalloc(bioscfg_drv.string_instances_count,
+					  sizeof(struct string_data), GFP_KERNEL);
+	if (!bioscfg_drv.string_data) {
+		bioscfg_drv.string_instances_count = 0;
+		ret = -ENOMEM;
+	}
+	return ret;
+}
+
+/* Expected Values types associated with each element */
+static acpi_object_type expected_string_types[] = {
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
+	[STR_MAX_LENGTH] = ACPI_TYPE_INTEGER
+};
+
+/*
+ * populate_string_package_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @string_obj: ACPI object with string data
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_string_package_data(union acpi_object *string_obj,
+				 int instance_id,
+				 struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_string_elements_from_package(string_obj,
+					      string_obj->package.count,
+					      instance_id,
+					      HPWMI_STRING_TYPE);
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				     &string_current_val);
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.string_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.string_data[instance_id].display_name));
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+int populate_string_elements_from_package(union acpi_object *string_obj,
+					  int string_obj_count,
+					  int instance_id,
+					  enum hp_wmi_data_type type)
+{
+	char *str_value = NULL;
+	int value_len;
+	int ret = 0;
+	u32 size = 0;
+	u32 int_value;
+	int elem = 0;
+	int reqs;
+	int eloc;
+
+	if (!string_obj)
+		return -EINVAL;
+
+	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
+
+	for (elem = 1, eloc = 1; elem < string_obj_count; elem++, eloc++) {
+
+		/* ONLY look at the first 'hp_wmi_elements_count[type]' elements */
+		if (eloc == hp_wmi_elements_count[type])
+			goto exit_string_package;
+
+		switch (string_obj[elem].type) {
+		case ACPI_TYPE_STRING:
+
+			if (elem != PREREQUISITES) {
+				ret = convert_hexstr_to_str(string_obj[elem].string.pointer,
+							    string_obj[elem].string.length,
+							    &str_value, &value_len);
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
+			pr_err("Error expected type %d for elem  %d, but got type %d instead\n",
+			       expected_string_types[eloc], elem, string_obj[elem].type);
+			return -EIO;
+		}
+
+		/* Assign appropriate element value to corresponding field*/
+		switch (eloc) {
+		case VALUE:
+			strscpy(bioscfg_drv.string_data[instance_id].current_value,
+				str_value, sizeof(bioscfg_drv.string_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.string_data[instance_id].path, str_value,
+				sizeof(bioscfg_drv.string_data[instance_id].path));
+			break;
+		case IS_READONLY:
+			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.string_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.string_data[instance_id].prerequisites_size = int_value;
+			if (size > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			/*
+			 * This HACK is needed to keep the expected
+			 * element list pointing to the right obj[elem].type
+			 * when the size is zero.  PREREQUISITES
+			 * object is omitted by BIOS when the size is
+			 * zero.
+			 */
+			if (int_value == 0)
+				eloc++;
+			break;
+		case PREREQUISITES:
+			size = bioscfg_drv.string_data[instance_id].prerequisites_size;
+
+			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
+				if (elem >= string_obj_count) {
+					pr_err("Error elem-objects package is too small\n");
+					return -EINVAL;
+				}
+
+				ret = convert_hexstr_to_str(string_obj[elem + reqs].string.pointer,
+							    string_obj[elem + reqs].string.length,
+							    &str_value, &value_len);
+
+				if (ret)
+					continue;
+
+				strscpy(bioscfg_drv.string_data[instance_id].prerequisites[reqs],
+					str_value,
+					sizeof(bioscfg_drv.string_data[instance_id].prerequisites[reqs]));
+				kfree(str_value);
+				str_value = NULL;
+			}
+			break;
+
+		case SECURITY_LEVEL:
+			bioscfg_drv.string_data[instance_id].security_level = int_value;
+			break;
+		case STR_MIN_LENGTH:
+			bioscfg_drv.string_data[instance_id].min_length = int_value;
+			break;
+		case STR_MAX_LENGTH:
+			bioscfg_drv.string_data[instance_id].max_length = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+
+		kfree(str_value);
+		str_value = NULL;
+	}
+
+exit_string_package:
+	kfree(str_value);
+	str_value = NULL;
+	return 0;
+}
+
+/*
+ * populate_string_data() -
+ * Populate all properties of an instance under string attribute
+ *
+ * @buffer_ptr: Buffer pointer
+ * @buffer_size: Buffer size
+ * @instance_id: The instance to enumerate
+ * @attr_name_kobj: The parent kernel object
+ */
+int populate_string_buffer_data(u8 *buffer_ptr, int *buffer_size,
+				int instance_id,
+				struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.string_data[instance_id].attr_name_kobj = attr_name_kobj;
+
+	populate_string_elements_from_buffer(buffer_ptr, buffer_size,
+					     instance_id,
+					     HPWMI_STRING_TYPE);
+
+	update_attribute_permissions(bioscfg_drv.string_data[instance_id].is_readonly,
+				     &string_current_val);
+	friendly_user_name_update(bioscfg_drv.string_data[instance_id].path,
+				  attr_name_kobj->name,
+				  bioscfg_drv.string_data[instance_id].display_name,
+				  sizeof(bioscfg_drv.string_data[instance_id].display_name));
+
+	return sysfs_create_group(attr_name_kobj, &string_attr_group);
+}
+
+int populate_string_elements_from_buffer(u8 *buffer_ptr, int *buffer_size,
+					 int instance_id,
+					 enum hp_wmi_data_type type)
+{
+	int ret;
+	char *dst = NULL;
+	int elem;
+	int reqs;
+	int int_value;
+	int size = 0;
+	int dst_size = *buffer_size / sizeof(u16);
+
+	dst = kcalloc(dst_size, sizeof(char), GFP_KERNEL);
+	if (!dst)
+		return -ENOMEM;
+
+	strscpy(bioscfg_drv.string_data[instance_id].display_name_language_code,
+		LANG_CODE_STR,
+		sizeof(bioscfg_drv.string_data[instance_id].display_name_language_code));
+
+	for (elem = 1; elem < 3; elem++) {
+		ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+		/* Ignore. Zero length string values */
+		if (ret < 0)
+			continue;
+
+		switch (elem) {
+		case VALUE:
+			strscpy(bioscfg_drv.string_data[instance_id].current_value,
+				dst, sizeof(bioscfg_drv.string_data[instance_id].current_value));
+			break;
+		case PATH:
+			strscpy(bioscfg_drv.string_data[instance_id].path, dst,
+				sizeof(bioscfg_drv.string_data[instance_id].path));
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+
+	for (elem = 3; elem < hp_wmi_elements_count[type]; elem++) {
+		if (elem != PREREQUISITES) {
+			ret = get_integer_from_buffer((int **)&buffer_ptr,
+						      buffer_size,
+						      (int *)&int_value);
+			if (ret < 0)
+				continue;
+		}
+
+		switch (elem) {
+		case IS_READONLY:
+			bioscfg_drv.string_data[instance_id].is_readonly = int_value;
+			break;
+		case DISPLAY_IN_UI:
+			bioscfg_drv.string_data[instance_id].display_in_ui = int_value;
+			break;
+		case REQUIRES_PHYSICAL_PRESENCE:
+			bioscfg_drv.string_data[instance_id].requires_physical_presence = int_value;
+			break;
+		case SEQUENCE:
+			bioscfg_drv.string_data[instance_id].sequence = int_value;
+			break;
+		case PREREQUISITES_SIZE:
+			bioscfg_drv.string_data[instance_id].prerequisites_size = int_value;
+			if (int_value > MAX_PREREQUISITES_SIZE)
+				pr_warn("Prerequisites size value exceeded the maximum number of elements supported or data may be malformed\n");
+			break;
+
+		case PREREQUISITES:
+			size = bioscfg_drv.string_data[instance_id].prerequisites_size;
+			for (reqs = 0; reqs < size && reqs < MAX_PREREQUISITES_SIZE; reqs++) {
+				ret = get_string_from_buffer(&buffer_ptr, buffer_size, dst, dst_size);
+				/* Ignore. Zero length string values */
+				if (ret < 0)
+					continue;
+				strscpy(bioscfg_drv.string_data[instance_id].prerequisites[reqs],
+					dst,
+					sizeof(bioscfg_drv.string_data[instance_id].prerequisites[reqs]));
+			}
+			break;
+		case SECURITY_LEVEL:
+			bioscfg_drv.string_data[instance_id].security_level = int_value;
+			break;
+		case STR_MIN_LENGTH:
+			bioscfg_drv.string_data[instance_id].min_length = int_value;
+			break;
+		case STR_MAX_LENGTH:
+			bioscfg_drv.string_data[instance_id].max_length = int_value;
+			break;
+		default:
+			pr_warn("Invalid element: %d found in String attribute or data may be malformed\n", elem);
+			break;
+		}
+	}
+	kfree(dst);
+
+	return 0;
+}
+
+/*
+ * exit_string_attributes() - Clear all attribute data
+ *
+ * Clears all data allocated for this group of attributes
+ */
+void exit_string_attributes(void)
+{
+	int instance_id;
+
+	for (instance_id = 0; instance_id < bioscfg_drv.string_instances_count; instance_id++) {
+		if (bioscfg_drv.string_data[instance_id].attr_name_kobj)
+			sysfs_remove_group(bioscfg_drv.string_data[instance_id].attr_name_kobj,
+					   &string_attr_group);
+	}
+	bioscfg_drv.string_instances_count = 0;
+
+	kfree(bioscfg_drv.string_data);
+	bioscfg_drv.string_data = NULL;
+}
diff --git a/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
new file mode 100644
index 000000000000..f9fa81444706
--- /dev/null
+++ b/drivers/platform/x86/hp/hp-bioscfg/surestart-attributes.c
@@ -0,0 +1,149 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Functions corresponding to sure start object type attributes under
+ * BIOS for use with hp-bioscfg driver
+ *
+ *  Copyright (c) 2022 HP Development Company, L.P.
+ */
+
+#include "bioscfg.h"
+#include <asm-generic/posix_types.h>
+
+#define LOG_MAX_ENTRIES	254
+#define LOG_ENTRY_SIZE		16
+
+/*
+ * audit_log_entry_count_show - Reports the number of
+ *				existing audit log entries available
+ *				to be read
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as directory
+ *	   in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of existing audit log entries available to be read,
+ *         audit log entry size, and maximum number of entries
+ *         supported. Otherwise, an HP WMI query specific error code
+ *         (which is negative)
+ *
+ *         [No of entries],[log entry size],[Max number of entries supported]
+ */
+static ssize_t audit_log_entry_count_show(struct kobject *kobj,
+					  struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	u32 count = 0;
+
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
+				   HPWMI_SURESTART,
+				   &count, 0, sizeof(count));
+	if (ret < 0)
+		return ret;
+
+	return sysfs_emit(buf, "%d,%d,%d\n", count, LOG_ENTRY_SIZE,
+			  LOG_MAX_ENTRIES);
+}
+
+/*
+ * audit_log_entries_show() - Return all entries found in log file
+ *
+ * @kobj:  Pointer to a kernel object of things that show up as
+ *	   directory in the sysfs filesystem.
+ * @attr:  Pointer to list of attributes for the operation
+ * @buf:   Pointer to buffer
+ *
+ * Returns number of bytes needed to read all audit logs entries to be read.
+ *         Otherwise, an HP WMI query specific error code (which is negative)
+ *	   -EFAULT if the audit logs size exceeds 4KB
+ *
+ */
+static ssize_t audit_log_entries_show(struct kobject *kobj,
+				      struct kobj_attribute *attr, char *buf)
+{
+	int ret;
+	int i;
+	u32 count = 0;
+
+	// Get the number of event logs
+	ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
+				   HPWMI_SURESTART,
+				   &count, 1, 4);
+
+	/*
+	 * The show() api will not work if the audit logs ever go
+	 *  beyond 4KB
+	 */
+	if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
+		return -EFAULT;
+
+	if (ret < 0)
+		return ret;
+
+	/*
+	 * We are guaranteed the buffer is 4KB so today all the event
+	 * logs will fit
+	 */
+	for (i = 0; ((i < count) & (ret >= 0)); i++) {
+		*buf = (i + 1);
+		ret = hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
+					   HPWMI_SURESTART,
+					   buf, 1, 128);
+		if (ret >= 0)
+			buf += LOG_ENTRY_SIZE;
+	}
+	return (count * LOG_ENTRY_SIZE);
+}
+
+static struct kobj_attribute sure_start_audit_log_entry_count = __ATTR_RO(audit_log_entry_count);
+struct kobj_attribute sure_start_audit_log_entries = __ATTR_RO(audit_log_entries);
+
+static ssize_t type_show(struct kobject *kobj, struct kobj_attribute *attr,
+			 char *buf)
+{
+	return sysfs_emit(buf, "sure-start\n");
+}
+static struct kobj_attribute sure_start_type = __ATTR_RO(type);
+
+static ssize_t display_name_language_code_show(struct kobject *kobj,
+					       struct kobj_attribute *attr,
+					       char *buf)
+{
+	return sysfs_emit(buf, "%s\n", LANG_CODE_STR);
+}
+
+static struct kobj_attribute sure_start_display_langcode =
+		__ATTR_RO(display_name_language_code);
+
+
+static ssize_t display_name_show(struct kobject *kobj,
+				 struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%s\n", SURE_START_DESC);
+}
+static struct kobj_attribute sure_start_display_name = __ATTR_RO(display_name);
+
+static struct attribute *sure_start_attrs[] = {
+	&sure_start_display_name.attr,
+	&sure_start_display_langcode.attr,
+	&sure_start_audit_log_entry_count.attr,
+	&sure_start_audit_log_entries.attr,
+	&sure_start_type.attr,
+	NULL,
+};
+
+static const struct attribute_group sure_start_attr_group = {
+	.attrs = sure_start_attrs,
+};
+
+void exit_sure_start_attributes(void)
+{
+	sysfs_remove_group(bioscfg_drv.sure_start_attr_kobj,
+			   &sure_start_attr_group);
+}
+
+int populate_sure_start_data(struct kobject *attr_name_kobj)
+{
+	bioscfg_drv.sure_start_attr_kobj = attr_name_kobj;
+	return sysfs_create_group(attr_name_kobj, &sure_start_attr_group);
+}
-- 
2.34.1

