Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A6B831DE133
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 May 2020 09:44:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728304AbgEVHoi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 May 2020 03:44:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728225AbgEVHoi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 May 2020 03:44:38 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4320DC05BD43
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2020 00:44:38 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id y18so4840562pfl.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 May 2020 00:44:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yHgMp9qQi+PCJI/VBjHbC9Rf08TFR7c0CBHdT2/5bV8=;
        b=ouxLLASBd4bC1FEvoSmxHBT4ntXgoOvhe1Vmj1CaZUox/4yxYs+fx9NnjHLu9Fex71
         hAGT95zYoP2Zk2jgyTdZpy3P4nNBSJVB1McrscQxhBzQP43cZfZt1bC0P6S8HkCHDW8B
         ItpJXCQ88y8RYeq5kKkqaS7Ubcyf8KV5aCwRRbtAQcIxDlXOFT0GaVALi4c7RP3h5PTw
         H28ocn4QRtImLDwoQe40X48RBLSh+nP6yHtMWO/KeuBDgfqrodgD4DFMMrh8UB0G0wDX
         Jfp2aeEVyxtrPKA8eCIQSdDPz1hlP5/ZL93BasEVKuokjNrfMaC14jBpQmIT7yQ70wMh
         cl2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=yHgMp9qQi+PCJI/VBjHbC9Rf08TFR7c0CBHdT2/5bV8=;
        b=scudpJJFaasCizep0/myxEqzZ2mF7hEaQjqHV8yZCIVbqP/mCetQL4bF5DjHbM7BGG
         yaMZLu8gHJouOZP1R9DczNYNAuDgeUO4wKFNrJB9w7393xs5ALQLMUQYqqkQQGBogjnc
         nPvdLTFQhAf1FaOB1vz89yqzym6duZfOgQXNnsL88pWnJEEEyFGvHte3d5PJGiNOq3c/
         NkzeWL2wu8EqELorScBqG6X/wKG0W4ckrcImHELex7rRKaXvEJNX8ESRGRtU87tIqtJ5
         Y1ziQHYNBNnARqVAM+gnq2uDy6JYAAW1uXmztVbn1CIYduiMa1t1Gd1NqWRKl7p2x3hJ
         qpng==
X-Gm-Message-State: AOAM5337ick1b33AOJaSuPMF11yf4hOIbKHCPnhjQDBpUUhknpqAzNgz
        grJkwahu4ZzwnfhI3OP6Q0nkng==
X-Google-Smtp-Source: ABdhPJyAvg5qCU4a8WBTgJOw7/e+Q9mT0HTGBx/lAfs255ToOAmWDheoNol2fnmJhq+/ADXGgzd14Q==
X-Received: by 2002:aa7:81d1:: with SMTP id c17mr2732212pfn.58.1590133477438;
        Fri, 22 May 2020 00:44:37 -0700 (PDT)
Received: from localhost.localdomain (59-127-47-126.HINET-IP.hinet.net. [59.127.47.126])
        by smtp.gmail.com with ESMTPSA id u45sm5826659pjb.7.2020.05.22.00.44.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 22 May 2020 00:44:37 -0700 (PDT)
From:   Chris Chiu <chiu@endlessm.com>
To:     dvhart@infradead.org, andy@infradead.org, hdegoede@redhat.com,
        gregkh@linuxfoundation.org, gayatri.kammela@intel.com,
        mika.westerberg@linux.intel.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux@endlessm.com, Chris Chiu <chiu@endlessm.com>
Subject: [PATCH] platform/x86: asus_wmi: Reserve more space for struct bias_args
Date:   Fri, 22 May 2020 15:44:24 +0800
Message-Id: <20200522074424.54264-1-chiu@endlessm.com>
X-Mailer: git-send-email 2.21.1 (Apple Git-122.3)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On the ASUS laptop UX325JA/UX425JA, most of the media keys are not
working due to the ASUS WMI driver fails to be loaded. The ACPI error
as follows leads to the failure of asus_wmi_evaluate_method.
  ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field [IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96 bits) (20200326/dsopcode-203)
  No Local Variables are initialized for Method [WMNB]
  ACPI Error: Aborting method \_SB.ATKD.WMNB due to previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)

The DSDT for the WMNB part shows that 5 DWORD required for local
variables and the 3rd variable IIA3 hit the buffer limit.

Method (WMNB, 3, Serialized)
{ ..
    CreateDWordField (Arg2, Zero, IIA0)
    CreateDWordField (Arg2, 0x04, IIA1)
    CreateDWordField (Arg2, 0x08, IIA2)
    CreateDWordField (Arg2, 0x0C, IIA3)
    CreateDWordField (Arg2, 0x10, IIA4)
    Local0 = (Arg1 & 0xFFFFFFFF)
    If ((Local0 == 0x54494E49))
  ..
}

The limitation is determined by the input acpi_buffer size passed
to the wmi_evaluate_method. Since the struct bios_args is the data
structure used as input buffer by default for all ASUS WMI calls,
the size needs to be expanded to fix the problem.

Signed-off-by: Chris Chiu <chiu@endlessm.com>
---
 drivers/platform/x86/asus-wmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index bb7c529d7d16..cd212ee210e2 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -116,6 +116,8 @@ struct bios_args {
 	u32 arg0;
 	u32 arg1;
 	u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
+	u32 arg4;
+	u32 arg5;
 } __packed;
 
 /*
-- 
2.25.2

