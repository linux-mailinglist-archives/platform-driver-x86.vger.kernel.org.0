Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 25CF34A88DE
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Feb 2022 17:44:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352374AbiBCQo2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Feb 2022 11:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352375AbiBCQo1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Feb 2022 11:44:27 -0500
Received: from mail-ua1-x92a.google.com (mail-ua1-x92a.google.com [IPv6:2607:f8b0:4864:20::92a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1593AC061714
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Feb 2022 08:44:27 -0800 (PST)
Received: by mail-ua1-x92a.google.com with SMTP id w18so2874286uar.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 03 Feb 2022 08:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/7hWGiKDX/+3TtHvDCLSMJlu4NmyHYy7nVm6Glu5jcs=;
        b=Eu44Mg8zNIVsl+UBg0lHCou2bGR731muhWBsGIFlH7Qlfig/tH9EjGG7LhYDeVUgL2
         yBKfPclwTyg18UZrOiqfuJ89i8XybLNqTaYSX/a4KtBkhWzz5k8noCv5qKrQnf7pz9gC
         cU9EIuCV0fRK8UzYYfyJ83sxVUdyV2whm2zfukAd37PEkif+0OQrFVjVtJRfk/NpB5kF
         aTGPNskbxUyxI7LLEMPrnqlI95zdXOWkLpELHRbx4BnCz2oqk41Y/TO4YHXrNBFYCbhD
         etxqFqFShnXPHvrKvugW+xoT0rdqJ0frp0xn6PltLCnhV9Fkya4hBOscS61TtYtWobdj
         h4pQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/7hWGiKDX/+3TtHvDCLSMJlu4NmyHYy7nVm6Glu5jcs=;
        b=tEvIBH+VRJur/xeDiH2S40Ez/VQGOcW520oYHDUgwZe6tVnP5b6PaIVtaEoXdsNo+I
         +7NYtTG+iBA2eIeSiENE+2iQc4gfIcZ7Vi00jpZJzb9hud8Aj43pT28FjZP4Pd7eoFtk
         PWv2UN8+JFfWUkWiJKc1pnmY0OJ/TA/krdqGotcY81Z5ehwaNi/igO876/R199Ig7xSf
         NDyUKDQs1ScOoBSCDSBtt1hKlCoYCu+ClJS862+ZrgtV+gDJsNNSFi8ROeHWY5cm3+s2
         7Cuks/VxpwAFWpEFq9XCDxFQcQ1bkLPj3//lmTa8Y1+RmGBVWtgTjWPP6gb25pN/WXKO
         uuNA==
X-Gm-Message-State: AOAM531m8ODDjd1LiSPmD0jxYUGgFLZqOeBEfwjI/7BCiIRE/eRNKNDb
        8DQP56WnUxY3Bp8Ry7uAZ+5mRg==
X-Google-Smtp-Source: ABdhPJx2HB4OlovRK80h8tYU9Mdgc8buyu05GDejH1rOLWTHA+JswrW0YVKJpoDXnPTHBnmidcJ4GQ==
X-Received: by 2002:a67:fd55:: with SMTP id g21mr14698421vsr.86.1643906666202;
        Thu, 03 Feb 2022 08:44:26 -0800 (PST)
Received: from localhost (host8.190-224-49.telecom.net.ar. [190.224.49.8])
        by smtp.gmail.com with ESMTPSA id m185sm6362545vke.30.2022.02.03.08.44.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Feb 2022 08:44:26 -0800 (PST)
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
To:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org,
        Martin Fernandez <martin.fernandez@eclypsium.com>
Subject: [PATCH v6 6/6] drivers/node: Show in sysfs node's crypto capabilities
Date:   Thu,  3 Feb 2022 13:43:28 -0300
Message-Id: <20220203164328.203629-7-martin.fernandez@eclypsium.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
References: <20220203164328.203629-1-martin.fernandez@eclypsium.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Show in each node in sysfs if its memory is able to do be encrypted by
the CPU, ie. if all its memory is marked with EFI_MEMORY_CPU_CRYPTO in
the EFI memory map.

Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
---
 Documentation/ABI/testing/sysfs-devices-node | 10 ++++++++++
 drivers/base/node.c                          | 10 ++++++++++
 2 files changed, 20 insertions(+)
 create mode 100644 Documentation/ABI/testing/sysfs-devices-node

diff --git a/Documentation/ABI/testing/sysfs-devices-node b/Documentation/ABI/testing/sysfs-devices-node
new file mode 100644
index 000000000000..0d1fd86c9faf
--- /dev/null
+++ b/Documentation/ABI/testing/sysfs-devices-node
@@ -0,0 +1,10 @@
+What:		/sys/devices/system/node/nodeX/crypto_capable
+Date:		February 2022
+Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
+Users:		fwupd (https://fwupd.org)
+Description:
+		This value is 1 if all system memory in this node is
+		marked with EFI_MEMORY_CPU_CRYPTO, indicating that the
+		system memory is capable of being protected with the
+		CPU’s memory cryptographic capabilities. It is 0
+		otherwise.
\ No newline at end of file
diff --git a/drivers/base/node.c b/drivers/base/node.c
index 87acc47e8951..dabaed997ecd 100644
--- a/drivers/base/node.c
+++ b/drivers/base/node.c
@@ -560,11 +560,21 @@ static ssize_t node_read_distance(struct device *dev,
 }
 static DEVICE_ATTR(distance, 0444, node_read_distance, NULL);
 
+static ssize_t crypto_capable_show(struct device *dev,
+				   struct device_attribute *attr, char *buf)
+{
+	struct pglist_data *pgdat = NODE_DATA(dev->id);
+
+	return sysfs_emit(buf, "%d\n", pgdat->crypto_capable);
+}
+static DEVICE_ATTR_RO(crypto_capable);
+
 static struct attribute *node_dev_attrs[] = {
 	&dev_attr_meminfo.attr,
 	&dev_attr_numastat.attr,
 	&dev_attr_distance.attr,
 	&dev_attr_vmstat.attr,
+	&dev_attr_crypto_capable.attr,
 	NULL
 };
 
-- 
2.30.2

