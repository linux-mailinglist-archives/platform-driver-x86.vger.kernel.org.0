Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D4FF82142F7
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Jul 2020 05:21:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727777AbgGDDVa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Jul 2020 23:21:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48812 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727943AbgGDDV1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jul 2020 23:21:27 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55E39C061794;
        Fri,  3 Jul 2020 20:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
        Content-Type:Content-ID:Content-Description;
        bh=q/jxUDlRbAWpTfER8Qjcml7jB2V9gg4ZvM3Yif0zDus=; b=AOpHy3PNTO8Th8dORBpwr2nQG4
        /qoP+Nyv9xB23zCJGi4fKi1/I4Zv33sHJsycO15HMO07JLIoAOnSa7qmHkptkjcKSjy6Cxe1kE0AF
        W80tLaqZnjl4zYFoA77aHJkSLrfI6vIEUfuI3DXi6ig1pntvH/bLegV0TJ1eJxowSI0Q7z7GtAFWy
        l4/bss+e3xI3T1XZ3S4zGMgS6VrtOMGMVFTB8DnqYvn2Fxg3Yc+X1U9fZEoW6v9zMq0CNQcmCJB2F
        rH3cNphwKYeOoJW/X9Rb0OylwfwkR0ph+YELJ+jWTaJcJW8ooqHMGZ+5Cp7nnksfQaukHCv9c61cl
        5onz3FAw==;
Received: from [2601:1c0:6280:3f0::19c2] (helo=smtpauth.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1jrYk0-0000Ri-NR; Sat, 04 Jul 2020 03:21:25 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-kernel@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        cgroups@vger.kernel.org, dm-devel@redhat.com,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
        Trond Myklebust <trond.myklebust@hammerspace.com>,
        Anna Schumaker <anna.schumaker@netapp.com>,
        linux-nfs@vger.kernel.org,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        Len Brown <lenb@kernel.org>, linux-pm@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        "Darrick J . Wong" <darrick.wong@oracle.com>,
        linux-xfs@vger.kernel.org
Subject: [PATCH 12/13] Documentation/admin-guide: tainted-kernels: drop doubled word
Date:   Fri,  3 Jul 2020 20:20:19 -0700
Message-Id: <20200704032020.21923-13-rdunlap@infradead.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200704032020.21923-1-rdunlap@infradead.org>
References: <20200704032020.21923-1-rdunlap@infradead.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Drop the doubled word "the".

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
---
 Documentation/admin-guide/tainted-kernels.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20200701.orig/Documentation/admin-guide/tainted-kernels.rst
+++ linux-next-20200701/Documentation/admin-guide/tainted-kernels.rst
@@ -61,7 +61,7 @@ this on the machine that had the stateme
 	 * Proprietary module was loaded (#0)
 	 * Kernel issued warning (#9)
 	 * Externally-built ('out-of-tree') module was loaded  (#12)
-	See Documentation/admin-guide/tainted-kernels.rst in the the Linux kernel or
+	See Documentation/admin-guide/tainted-kernels.rst in the Linux kernel or
 	 https://www.kernel.org/doc/html/latest/admin-guide/tainted-kernels.html for
 	 a more details explanation of the various taint flags.
 	Raw taint value as int/string: 4609/'P        W  O     '
