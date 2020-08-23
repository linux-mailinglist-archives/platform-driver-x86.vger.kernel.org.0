Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E18F724F05D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 00:55:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726737AbgHWWz3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Aug 2020 18:55:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57856 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbgHWWz2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Aug 2020 18:55:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 893D3C061573;
        Sun, 23 Aug 2020 15:55:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Date:Message-ID:Subject:Cc:From:To:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=p4hQ05/Ug37W1HDkIRxESilsvD5PeBDjK4JNqUubzq8=; b=aZDohJ1eEonSrHKxuzVX8l3AVL
        Q88wykXTy0+T0miG+OB1zizyPfvUItgvyy0EFvzfYJorDckZOPC2lmNDg/K4/Day71l3Eea6goRnn
        vk8ZZBX509E8DISxh6fsY66IatQzwMjuY6J1ipveKY2LxH5UPQ4AGm1ZSFQYpnkL7G7cF/L0uUrTk
        w03mOHUWc+L1Bg4lPyVVH57ySqGUXlYP5n7xWTEvkAVe5IpL03QdELlzlH2nKNFkz1RB5alzZ3Gfg
        ReoffXFMibMCzvaLlbymvE+kR9abV4BQqR7IYP87+onv30oyyBQFb0AOxXhhIOEzB8iZ5fvZwXUdd
        OO25U2vQ==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1k9ytU-0007jb-Gz; Sun, 23 Aug 2020 22:55:20 +0000
To:     LKML <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] Documentation: laptops: thinkpad-acpi: fix underline length
 build warning
Message-ID: <7b2ecef9-dfb7-808a-7c05-4e4f44b363c4@infradead.org>
Date:   Sun, 23 Aug 2020 15:55:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Randy Dunlap <rdunlap@infradead.org>

Fix underline length build warning in thinkpad-acpi.rst documentation:

Documentation/admin-guide/laptops/thinkpad-acpi.rst:1437: WARNING: Title underline too short.
DYTC Lapmode sensor
------------------

Fixes: acf7f4a59114 ("platform/x86: thinkpad_acpi: lap or desk mode interface")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Nitin Joshi <njoshi1@lenovo.com>
Cc: Sugumaran <slacshiminar@lenovo.com>
Cc: Bastien Nocera <bnocera@redhat.com>
Cc: Mark Pearson <markpearson@lenovo.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Darren Hart <dvhart@infradead.org>
Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
Cc: ibm-acpi-devel@lists.sourceforge.net
Cc: platform-driver-x86@vger.kernel.org
---
 Documentation/admin-guide/laptops/thinkpad-acpi.rst |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- lnx-59-rc2.orig/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ lnx-59-rc2/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1434,7 +1434,7 @@ on the feature, restricting the viewing
 
 
 DYTC Lapmode sensor
-------------------
+-------------------
 
 sysfs: dytc_lapmode
 


