Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C62F319C889
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Apr 2020 20:07:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389665AbgDBSHr (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Apr 2020 14:07:47 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:21473 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728225AbgDBSHr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Apr 2020 14:07:47 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585850866;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=v5oGIDGIVPedhHzR4MpWr3PEXpVfUB1v8StSapSY84c=;
        b=hgKM18r0TSwDiRJoP6mU9CCbktsVL7nAVyQZzRLpn8mAiMSVFgOGYm+Rh9SHCIBbk51HZJ
        MtWNC9bClvQaTjtGN2JPlXfOsyBTn2m8Q8Zhv9V+oEkNNZOQ5YE4Tgwz155LauOa4eTI36
        FEPkficKGF2OGN7MGT7dfjV16zLAang=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-199-JsKDMOkAOMqkdsAHCWt7nQ-1; Thu, 02 Apr 2020 14:07:42 -0400
X-MC-Unique: JsKDMOkAOMqkdsAHCWt7nQ-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 54119800D5F;
        Thu,  2 Apr 2020 18:07:41 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.7a2m.lab.eng.bos.redhat.com [10.16.222.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id CCDB699E12;
        Thu,  2 Apr 2020 18:07:40 +0000 (UTC)
From:   Prarit Bhargava <prarit@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Prarit Bhargava <prarit@redhat.com>,
        andriy.shevchenko@linux.intel.com,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH] tools/power/x86/intel-speed-select: Fix CLX-N package information output
Date:   Thu,  2 Apr 2020 14:07:32 -0400
Message-Id: <20200402180732.24684-1-prarit@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On CLX-N the perf-profile output is missing the package, die, and cpu
output.  On CLX-N the pkg_dev struct will never be evaluated by the core
code so pkg_dev.processed is always 0 and the package, die, and cpu
information is never output.

Set the pkg_dev.processed flag to 1 for CLX-N processors.

Signed-off-by: Prarit Bhargava <prarit@redhat.com>
Cc: andriy.shevchenko@linux.intel.com
Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 tools/power/x86/intel-speed-select/isst-config.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tools/power/x86/intel-speed-select/isst-config.c b/tools/pow=
er/x86/intel-speed-select/isst-config.c
index d1ac57be0cbd..2e64b9b6eb2e 100644
--- a/tools/power/x86/intel-speed-select/isst-config.c
+++ b/tools/power/x86/intel-speed-select/isst-config.c
@@ -1169,6 +1169,7 @@ static void dump_clx_n_config_for_cpu(int cpu, void=
 *arg1, void *arg2,
=20
 		ctdp_level =3D &clx_n_pkg_dev.ctdp_level[0];
 		pbf_info =3D &ctdp_level->pbf_info;
+		clx_n_pkg_dev.processed =3D 1;
 		isst_ctdp_display_information(cpu, outf, tdp_level, &clx_n_pkg_dev);
 		free_cpu_set(ctdp_level->core_cpumask);
 		free_cpu_set(pbf_info->core_cpumask);
--=20
2.18.2

