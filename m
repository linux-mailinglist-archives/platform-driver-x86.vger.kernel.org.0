Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 8A51A144847
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jan 2020 00:28:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726970AbgAUX2a (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jan 2020 18:28:30 -0500
Received: from mta-p7.oit.umn.edu ([134.84.196.207]:49174 "EHLO
        mta-p7.oit.umn.edu" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725933AbgAUX2a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jan 2020 18:28:30 -0500
Received: from localhost (unknown [127.0.0.1])
        by mta-p7.oit.umn.edu (Postfix) with ESMTP id 482PqK49mlz9vKTV
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2020 23:28:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at umn.edu
Received: from mta-p7.oit.umn.edu ([127.0.0.1])
        by localhost (mta-p7.oit.umn.edu [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id AHH63mBek8_K for <platform-driver-x86@vger.kernel.org>;
        Tue, 21 Jan 2020 17:28:29 -0600 (CST)
Received: from mail-yw1-f69.google.com (mail-yw1-f69.google.com [209.85.161.69])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mta-p7.oit.umn.edu (Postfix) with ESMTPS id 482PqK3BRcz9vKT9
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2020 17:28:29 -0600 (CST)
Received: by mail-yw1-f69.google.com with SMTP id v126so3779878ywf.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jan 2020 15:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umn.edu; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDSoCgRn2awPXZIHPqZUcbJK/YN9MXXwLcpipylIxRc=;
        b=DJF3Jr9OAWSaXREE+ECGzJQ5H8j/Jkoj8rXQIpqijNt8TCHZSHdERIn73pa9hMPS/x
         tQGZa5WSYDCgkyZe3xlHX3B3/43tfSLcYkb1bbADEz7wvM/WzQHTHwbT6WIox9rHC35E
         MjWBDfezMfGjiFMhWlc2m+HVCFqT78YPAARiqOZEVCSgS013htZ8zsgV2JYSDByYszs/
         7FmTdfL8BGNkoUuE8GXnnfoo6viEbZ0wPgElhBhlVhFZKwsXb5brVQBLO/04xf//Od4s
         cidUon7N+snecewRd3Y7FMtBqPVs9aCtx7qGOy3HcAil8WVb1BiE7K/V9c7HthWpytq1
         MfIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QDSoCgRn2awPXZIHPqZUcbJK/YN9MXXwLcpipylIxRc=;
        b=tXbDBmSj3N/34175a5upH6uMIFuxErzNly2hYChw4JujBDnPXjrXygFv4UpUMb+DTI
         8me2hONrmSCIdq/pLFf3lhpP8QB6RN3+BMPPndIOHSB53muqnOah6ziXLAK0x+fcE7Im
         na9cADqAlHtjrNjudcQ0MIaTmzoWdl5O8S+MeLdWa+lmQTuSgak9mwxjsEBM1Iu1u8gM
         +ZPWNk04UmQptE2aCZRYLjnk/bPdqMRAE9vPAcv7eMeZVnMak0z6/D+yC06gv+AvxGCG
         QPXXz80kQ+k7j4U3pkh8bNv7pNbAUL/HT38lEO/eT2QaVYjj+5Z3ZUgAxk8dW08anIkB
         XdGw==
X-Gm-Message-State: APjAAAUg1hOLqspq18dnXvGof57YF/yi1aSjqwHGyp7bNw59cyGAUJsJ
        sXtyw9JrBTGVfW0J/3CQWC/RLk0jiVOwleWCd5qtwJlwwU4gvPj8VJ/PC6wnRYKDTHvIWiiSlQd
        E4w8JnlR3/hlodZIM+OEt52aUs7sU1q28VQLwwg==
X-Received: by 2002:a81:b645:: with SMTP id h5mr5497663ywk.350.1579649308881;
        Tue, 21 Jan 2020 15:28:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqzIsms8HwlBlMjPYZ9klO4Ont2Y1e8CBZEjaa8VIBUstS21NtE1l/1pwdtycPZcQfR4MgjCMg==
X-Received: by 2002:a81:b645:: with SMTP id h5mr5497642ywk.350.1579649308608;
        Tue, 21 Jan 2020 15:28:28 -0800 (PST)
Received: from cs-u-syssec1.dtc.umn.edu (cs-u-syssec1.cs.umn.edu. [128.101.106.66])
        by smtp.gmail.com with ESMTPSA id g190sm17580313ywf.41.2020.01.21.15.28.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2020 15:28:28 -0800 (PST)
From:   Aditya Pakki <pakki001@umn.edu>
To:     pakki001@umn.edu
Cc:     kjlu@umn.edu, Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        Juergen Gross <jgross@suse.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Heiko Carstens <heiko.carstens@de.ibm.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mike Rapoport <rppt@linux.ibm.com>,
        Lubomir Rintel <lkundrak@v3.sk>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Allison Randal <allison@lohutok.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH] x86/platform/olpc: Fix the error handling of memblock_alloc failure
Date:   Tue, 21 Jan 2020 17:28:16 -0600
Message-Id: <20200121232818.28018-1-pakki001@umn.edu>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

In case of an error in memblock_alloc, the code calls both panic and
BUG_ON. Revert the error handling to BUG_ON.

Fixes: 8a7f97b902f4 (add checks for the return value of memblock_alloc*())
Signed-off-by: Aditya Pakki <pakki001@umn.edu>
---
 arch/x86/platform/olpc/olpc_dt.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/x86/platform/olpc/olpc_dt.c b/arch/x86/platform/olpc/olpc_dt.c
index 26d1f6693789..92d5ce1232ab 100644
--- a/arch/x86/platform/olpc/olpc_dt.c
+++ b/arch/x86/platform/olpc/olpc_dt.c
@@ -137,9 +137,6 @@ void * __init prom_early_alloc(unsigned long size)
 		 * wasted bootmem) and hand off chunks of it to callers.
 		 */
 		res = memblock_alloc(chunk_size, SMP_CACHE_BYTES);
-		if (!res)
-			panic("%s: Failed to allocate %zu bytes\n", __func__,
-			      chunk_size);
 		BUG_ON(!res);
 		prom_early_allocated += chunk_size;
 		memset(res, 0, chunk_size);
-- 
2.20.1

