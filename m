Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3062D79B818
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Sep 2023 02:07:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355688AbjIKWBr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 11 Sep 2023 18:01:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244230AbjIKTjv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 11 Sep 2023 15:39:51 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D9EB412A
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:46 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id 98e67ed59e1d1-273fa877befso1201275a91.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 11 Sep 2023 12:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1694461186; x=1695065986; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CIfVld1coOvYARfYOzv2HqS0W6bVI+gXrtF9tymreUw=;
        b=N5KkZQsYv+I/nM/ltGRxMeZbJkCLnA7UWVMxaas4RQxp2G/2juc+8Njt2f1+Jw+L1y
         8WTCeD4Ga2Pz8lb8bbhAq5tQwg/F8hJ0xpHKvPL3QlVOGra+BnghOJUXXRjE2pcjPsVv
         VCFyjuee00x/Fl7GHHsPA1KpGD90T7EH7hlVE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694461186; x=1695065986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CIfVld1coOvYARfYOzv2HqS0W6bVI+gXrtF9tymreUw=;
        b=QCsFYPTetABmWCZMO85jxSE+vbTWlP7zcHwCAp8QphwSdWzP1ABmfKryOqN4rqAn8r
         /Ud1L8Yq2hpfmymGq5wmdn0k98zWwTB4J9yRTw0VvpFis/8TCsT97I8I6YNKcrG+sfg7
         L+NVu7uciu2tYnKm+VzB/Xi7yYewBt2vOC+XJqRuy1gmf0j1eWfnSlWP6rJW7RS+nNWo
         dYlDoUXdhmLFsSp6JkSl2/2W83yIilgR6LFNTcyxjlI+xGzBhBnElAz8cdU361N6rX2+
         CaRkoh7K4HYmagMLdYCMIzUVYz4mPXA3QYAOKcGaKOmWZT+1WhjQeAuW2LMRcUKWYTaa
         9bBg==
X-Gm-Message-State: AOJu0YyyCzqwL7W5OKlzMoGBkLhYUf3dT7UQ4xkjCa+L9ymNaXkwmLqn
        4bNmBTc7EtHAPIVMb/WNNXlrbsgtLalMAdTbFgM=
X-Google-Smtp-Source: AGHT+IEJD9aaS/paLlM3NnqHlPKypKmKoRzToVoKSA/lBjh/RRD+ka+skD5NVC21QofiO/2bL20UVQ==
X-Received: by 2002:a17:90b:1c0f:b0:273:ee6c:ee5c with SMTP id oc15-20020a17090b1c0f00b00273ee6cee5cmr5142476pjb.7.1694461186242;
        Mon, 11 Sep 2023 12:39:46 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:11a:201:d487:5e33:6656:3711])
        by smtp.gmail.com with ESMTPSA id fu8-20020a17090ad18800b00262e485156esm7736543pjb.57.2023.09.11.12.39.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Sep 2023 12:39:45 -0700 (PDT)
From:   Stephen Boyd <swboyd@chromium.org>
To:     Mika Westerberg <mika.westerberg@linux.intel.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>
Cc:     linux-kernel@vger.kernel.org, patches@lists.linux.dev,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Prashant Malani <pmalani@chromium.org>
Subject: [PATCH v3 4/4] platform/x86: intel_scu_ipc: Fail IPC send if still busy
Date:   Mon, 11 Sep 2023 12:39:36 -0700
Message-ID: <20230911193937.302552-5-swboyd@chromium.org>
X-Mailer: git-send-email 2.42.0.283.g2d96d420d3-goog
In-Reply-To: <20230911193937.302552-1-swboyd@chromium.org>
References: <20230911193937.302552-1-swboyd@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
        RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

It's possible for interrupts to get significantly delayed to the point
that callers of intel_scu_ipc_dev_command() and friends can call the
function once, hit a timeout, and call it again while the interrupt
still hasn't been processed. This driver will get seriously confused if
the interrupt is finally processed after the second IPC has been sent
with ipc_command(). It won't know which IPC has been completed. This
could be quite disastrous if calling code assumes something has happened
upon return from intel_scu_ipc_dev_simple_command() when it actually
hasn't.

Let's avoid this scenario by simply returning -EBUSY in this case.
Hopefully higher layers will know to back off or fail gracefully when
this happens. It's all highly unlikely anyway, but it's better to be
correct here as we have no way to know which IPC the status register is
telling us about if we send a second IPC while the previous IPC is still
processing.

Cc: Prashant Malani <pmalani@chromium.org>
Cc: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
Fixes: ed12f295bfd5 ("ipc: Added support for IPC interrupt mode")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/platform/x86/intel_scu_ipc.c | 40 +++++++++++++++++++---------
 1 file changed, 28 insertions(+), 12 deletions(-)

diff --git a/drivers/platform/x86/intel_scu_ipc.c b/drivers/platform/x86/intel_scu_ipc.c
index 6958265db29d..c5b15450598e 100644
--- a/drivers/platform/x86/intel_scu_ipc.c
+++ b/drivers/platform/x86/intel_scu_ipc.c
@@ -265,6 +265,24 @@ static int intel_scu_ipc_check_status(struct intel_scu_ipc_dev *scu)
 	return scu->irq > 0 ? ipc_wait_for_interrupt(scu) : busy_loop(scu);
 }
 
+static struct intel_scu_ipc_dev *intel_scu_ipc_get(struct intel_scu_ipc_dev *scu)
+{
+	u8 status;
+
+	if (!scu)
+		scu = ipcdev;
+	if (!scu)
+		return ERR_PTR(-ENODEV);
+
+	status = ipc_read_status(scu);
+	if (status & IPC_STATUS_BUSY) {
+		dev_dbg(&scu->dev, "device is busy\n");
+		return ERR_PTR(-EBUSY);
+	}
+
+	return scu;
+}
+
 /* Read/Write power control(PMIC in Langwell, MSIC in PenWell) registers */
 static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 			u32 count, u32 op, u32 id)
@@ -278,11 +296,10 @@ static int pwr_reg_rdwr(struct intel_scu_ipc_dev *scu, u16 *addr, u8 *data,
 	memset(cbuf, 0, sizeof(cbuf));
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
 
 	for (nc = 0; nc < count; nc++, offset += 2) {
@@ -437,12 +454,12 @@ int intel_scu_ipc_dev_simple_command(struct intel_scu_ipc_dev *scu, int cmd,
 	int err;
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
+
 	cmdval = sub << 12 | cmd;
 	ipc_command(scu, cmdval);
 	err = intel_scu_ipc_check_status(scu);
@@ -482,11 +499,10 @@ int intel_scu_ipc_dev_command_with_size(struct intel_scu_ipc_dev *scu, int cmd,
 		return -EINVAL;
 
 	mutex_lock(&ipclock);
-	if (!scu)
-		scu = ipcdev;
-	if (!scu) {
+	scu = intel_scu_ipc_get(scu);
+	if (IS_ERR(scu)) {
 		mutex_unlock(&ipclock);
-		return -ENODEV;
+		return PTR_ERR(scu);
 	}
 
 	memcpy(inbuf, in, inlen);
-- 
https://chromeos.dev

