Return-Path: <platform-driver-x86+bounces-13711-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id C055BB2505F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 18:59:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id A3FF1583FC1
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Aug 2025 16:56:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id ABE4A28BAA6;
	Wed, 13 Aug 2025 16:56:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Feps1IAr"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9F3E28B40A;
	Wed, 13 Aug 2025 16:56:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755104190; cv=none; b=i289exUnFkoVzbE+uKm23aQFJflzKX0ELHl4hr4pnhsIY9BTjk5dMdwbJa5RLxICDrdabdEbXH7/D2V4TYn9qvVovq7Mqzhz6lQzY73hFiBQoSVkP8VWoPOrnqSK7fKwNqRC4Qc6o/4dx5Sk6jR2N5XIFNwOSDQ0L3ckaAy44AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755104190; c=relaxed/simple;
	bh=nzALyxIVz+Odu4JvpiWZy/GRnI5447kXU2zpU8VXgjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OqLDEoOKoPJ42DVmV58nURnkS3G2lBzFMtLqfy5b9hnePnQ7+rHy8VAs8vcboTmJ/cIXCpoUOPktjEWY1BCwqKzDrbTNi+6G++nIRdFvrr7yDa+x3St8hfhSiSP/Uk6kDmBEA4O2u1jSWcbItoO4c92iG+i+MpmRgJCFh/fsibk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Feps1IAr; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-3b9e411c820so19383f8f.1;
        Wed, 13 Aug 2025 09:56:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755104187; x=1755708987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=43XZwmGErlF6psigpkLMw9Zshu8YZJdDdWVr/aXLWM8=;
        b=Feps1IArX2jDN4pIrKj7AXAuxELKqobv2z1h053U2DvSlC8JPhMa8Prr+2FtpakXF2
         EBkX2PG/lmw/Povp5B9fzDfx7Cf0g4SvGonea+JIQAFzUudVoXq9YHWxNvuG5Qoaspep
         NsFfmN7z1IAkiI4CDK+LiBQT/dvlhcbEJvjZjXkGDvM5y49eQY5lV/s24U+w2IDSnv9f
         7SpZXwOXQFKdsRCUtatFytun6QuUouoa8R6COmyrgr2VyihuHLccYFklCNrUyqqNQn90
         uro6rSwgojmWNt6ozq/5gKLLK+GXhiBeWHzJStDTwvBoQeEuPt+Y+vei1/QiMk8nkdXv
         6yiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755104187; x=1755708987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=43XZwmGErlF6psigpkLMw9Zshu8YZJdDdWVr/aXLWM8=;
        b=ZRi1wgvUev/6S0P1Ic+glF9WYdmJdVEF7ICuVhp/jJeVG/9hLqIefLPhjjbCef9TD/
         wY/J2ESXvuHor7QfRA+lUozlC8tdFIt+1Mct5xhddb0r265Fu3xjJFoAvn+Bu+ZBpp74
         46UvhzrxYJL/YaDixl/Bi8/O7JUbozx4IRa+PzWK2qe+Nn+LIlb51kWggqsIjDx2tE1h
         oeWnRJKd1k3xBNiZReFdPmjj7y3xE2sQ8kOi+Sc6XDfzmUR7/9+kMixvpyiS/HKUsk07
         1XsQJ99df/OtKxswfr0yznPY/yai913ZrMVkHzsBIL3Cvc4htG8hWTQNxGIkO4d69zga
         qmBg==
X-Forwarded-Encrypted: i=1; AJvYcCW02g5/Tw3jppqWsLdA1xb6WSpZGdmdmLQr2zeaBEYemp/33WaY11uGOpBW5PtRYgL9YRjqc+IrZ9uazmQYxtCYD1tz@vger.kernel.org
X-Gm-Message-State: AOJu0YycFF2oxoyBdubrtHPIbj6Vf2cyttsv2z4BgA8GkPKL1CxZE1qT
	W7gUBtsTvwohSklBfzraeOqCJ4iwVhrwckF3wEwTtf2suDAVYtQZQEDrcf96IA==
X-Gm-Gg: ASbGncuRjArS/yGaxSm0u6sBjja+hUndd1lEEOzYngcFRyCySnt9KsulTgKSxQq4zwx
	W8WIzsuIILt+gNSEVlHALWQAFBTqrwuPoLUNuaiazmHAb+Tb+mPqaFi++WG7BBiQjUXSb57zj1b
	BzEPAzZ6GFeBLY9eCgGtHDPt8rDFkhx6UCeGWKEfq41WRBw2fzMRLaAkeKfoFDRFEqKwj2wwBug
	bOxogWdPoHM26AVvG9/wNQWbQEjuhiuJf20nyTg41lY350dRd2hBCrmJ+t0VZjo6C1N7ACmfaEC
	/bdBeBxgyKs26oHM4LFm6YX4AizZNnY8PwQrgkH4gGYf9EJxs0SzSbh2BZDpPNPAhWSO6moGMKh
	eVmcbFUSN5AfrTDvrN4qqn68=
X-Google-Smtp-Source: AGHT+IGGxaMihTDb3PQS6/1V76v1zpCuEaPu5jyF0yhcMdXvSaxNSUJeRajV+pCB1WzdQgNbTlOwow==
X-Received: by 2002:a05:6000:1889:b0:3b9:1108:e6f with SMTP id ffacd0b85a97d-3b9edfd3877mr27186f8f.25.1755104186821;
        Wed, 13 Aug 2025 09:56:26 -0700 (PDT)
Received: from denis-pc ([176.206.95.68])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3b79c48de68sm48600399f8f.67.2025.08.13.09.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 09:56:26 -0700 (PDT)
From: Denis Benato <benato.denis96@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org,
	"Limonciello, Mario" <mario.limonciello@amd.com>,
	"Luke D . Jones" <luke@ljones.dev>,
	Alok Tiwari <alok.a.tiwari@oracle.com>,
	Derek John Clark <derekjohn.clark@gmail.com>,
	Denis Benato <benato.denis96@gmail.com>
Subject: [PATCH v11 1/8] platform/x86: asus-wmi: export symbols used for read/write WMI
Date: Wed, 13 Aug 2025 18:56:13 +0200
Message-ID: <20250813165620.1131127-2-benato.denis96@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250813165620.1131127-1-benato.denis96@gmail.com>
References: <20250813165620.1131127-1-benato.denis96@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Luke D. Jones" <luke@ljones.dev>

Export symbols for reading/writing WMI symbols using a namespace.
Existing functions:
- asus_wmi_evaluate_method
- asus_wmi_set_devstate
New function:
- asus_wmi_get_devstate_dsts

The new function is intended for use with DSTS WMI method only and
avoids requiring the asus_wmi driver data to select the WMI method.

Signed-off-by: Denis Benato <benato.denis96@gmail.com>
Signed-off-by: Luke D. Jones <luke@ljones.dev>
Reviewed-by: Mario Limonciello <mario.limonciello@amd.com>
---
 drivers/platform/x86/asus-wmi.c            | 40 ++++++++++++++++++++--
 include/linux/platform_data/x86/asus-wmi.h |  5 +++
 2 files changed, 42 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index f7191fdded14..e31e0264a160 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -390,7 +390,7 @@ int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval)
 {
 	return asus_wmi_evaluate_method3(method_id, arg0, arg1, 0, retval);
 }
-EXPORT_SYMBOL_GPL(asus_wmi_evaluate_method);
+EXPORT_SYMBOL_NS_GPL(asus_wmi_evaluate_method, "ASUS_WMI");
 
 static int asus_wmi_evaluate_method5(u32 method_id,
 		u32 arg0, u32 arg1, u32 arg2, u32 arg3, u32 arg4, u32 *retval)
@@ -554,12 +554,46 @@ static int asus_wmi_get_devstate(struct asus_wmi *asus, u32 dev_id, u32 *retval)
 	return 0;
 }
 
-int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param,
-				 u32 *retval)
+/**
+ * asus_wmi_get_devstate_dsts() - Get the WMI function state.
+ * @dev_id: The WMI method ID to call.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: -ENODEV if the method ID is unsupported.
+ * @return: everything else is an error from WMI call.
+ */
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	int err;
+
+	err = asus_wmi_evaluate_method(ASUS_WMI_METHODID_DSTS, dev_id, 0, retval);
+	if (err)
+		return err;
+
+	if (*retval == ASUS_WMI_UNSUPPORTED_METHOD)
+		return -ENODEV;
+
+	return 0;
+}
+EXPORT_SYMBOL_NS_GPL(asus_wmi_get_devstate_dsts, "ASUS_WMI");
+
+/**
+ * asus_wmi_set_devstate() - Set the WMI function state.
+ * @dev_id: The WMI function to call.
+ * @ctrl_param: The argument to be used for this WMI function.
+ * @retval: A pointer to where to store the value returned from WMI.
+ * @return: 0 on success and retval is filled.
+ * @return: everything else is an error from WMI call.
+ *
+ * A asus_wmi_set_devstate() call must be paired with a
+ * asus_wmi_get_devstate_dsts() to check if the WMI function is supported.
+ */
+int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return asus_wmi_evaluate_method(ASUS_WMI_METHODID_DEVS, dev_id,
 					ctrl_param, retval);
 }
+EXPORT_SYMBOL_NS_GPL(asus_wmi_set_devstate, "ASUS_WMI");
 
 /* Helper for special devices with magic return codes */
 static int asus_wmi_get_devstate_bits(struct asus_wmi *asus,
diff --git a/include/linux/platform_data/x86/asus-wmi.h b/include/linux/platform_data/x86/asus-wmi.h
index 8a515179113d..dbd44d9fbb6f 100644
--- a/include/linux/platform_data/x86/asus-wmi.h
+++ b/include/linux/platform_data/x86/asus-wmi.h
@@ -166,6 +166,7 @@ enum asus_ally_mcu_hack {
 #if IS_REACHABLE(CONFIG_ASUS_WMI)
 void set_ally_mcu_hack(enum asus_ally_mcu_hack status);
 void set_ally_mcu_powersave(bool enabled);
+int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval);
 int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval);
 int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1, u32 *retval);
 #else
@@ -179,6 +180,10 @@ static inline int asus_wmi_set_devstate(u32 dev_id, u32 ctrl_param, u32 *retval)
 {
 	return -ENODEV;
 }
+static inline int asus_wmi_get_devstate_dsts(u32 dev_id, u32 *retval)
+{
+	return -ENODEV;
+}
 static inline int asus_wmi_evaluate_method(u32 method_id, u32 arg0, u32 arg1,
 					   u32 *retval)
 {
-- 
2.39.5


