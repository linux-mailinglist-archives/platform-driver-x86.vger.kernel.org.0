Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7BF571392D9
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Jan 2020 14:59:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728899AbgAMN4e (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Jan 2020 08:56:34 -0500
Received: from mga06.intel.com ([134.134.136.31]:7012 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728890AbgAMN4e (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Jan 2020 08:56:34 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Jan 2020 05:56:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.69,429,1571727600"; 
   d="scan'208";a="397165116"
Received: from black.fi.intel.com ([10.237.72.28])
  by orsmga005.jf.intel.com with ESMTP; 13 Jan 2020 05:56:27 -0800
Received: by black.fi.intel.com (Postfix, from userid 1001)
        id 5F8404D5; Mon, 13 Jan 2020 15:56:24 +0200 (EET)
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Lee Jones <lee.jones@linaro.org>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H . Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Zha Qipeng <qipeng.zha@intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 08/36] platform/x86: intel_scu_ipc: Drop unused prototype intel_scu_ipc_fw_update()
Date:   Mon, 13 Jan 2020 16:55:55 +0300
Message-Id: <20200113135623.56286-9-mika.westerberg@linux.intel.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
References: <20200113135623.56286-1-mika.westerberg@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

There is no implementation for that anymore so drop the prototype.

Signed-off-by: Mika Westerberg <mika.westerberg@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/include/asm/intel_scu_ipc.h | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/include/asm/intel_scu_ipc.h b/arch/x86/include/asm/intel_scu_ipc.h
index d7bbebf4b729..b2dde96e0611 100644
--- a/arch/x86/include/asm/intel_scu_ipc.h
+++ b/arch/x86/include/asm/intel_scu_ipc.h
@@ -53,9 +53,6 @@ int intel_scu_ipc_command(int cmd, int sub, u32 *in, int inlen,
 int intel_scu_ipc_raw_command(int cmd, int sub, u8 *in, int inlen,
 			      u32 *out, int outlen, u32 dptr, u32 sptr);
 
-/* Update FW version */
-int intel_scu_ipc_fw_update(u8 *buffer, u32 length);
-
 extern struct blocking_notifier_head intel_scu_notifier;
 
 static inline void intel_scu_notifier_add(struct notifier_block *nb)
-- 
2.24.1

