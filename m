Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ACE172D7E7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 10:34:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725957AbfE2Ie3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 04:34:29 -0400
Received: from shell.v3.sk ([90.176.6.54]:41386 "EHLO shell.v3.sk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725917AbfE2Ie3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 04:34:29 -0400
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 3B7821049D2;
        Wed, 29 May 2019 10:34:25 +0200 (CEST)
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10032)
        with ESMTP id K3q70uMCQfr4; Wed, 29 May 2019 10:34:13 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
        by zimbra.v3.sk (Postfix) with ESMTP id 3D1EA1049CD;
        Wed, 29 May 2019 10:34:12 +0200 (CEST)
X-Virus-Scanned: amavisd-new at zimbra.v3.sk
Received: from shell.v3.sk ([127.0.0.1])
        by localhost (zimbra.v3.sk [127.0.0.1]) (amavisd-new, port 10026)
        with ESMTP id eG41tRQeu1UT; Wed, 29 May 2019 10:34:08 +0200 (CEST)
Received: from belphegor.brq.redhat.com (nat-pool-brq-t.redhat.com [213.175.37.10])
        by zimbra.v3.sk (Postfix) with ESMTPSA id 613801049C2;
        Wed, 29 May 2019 10:34:08 +0200 (CEST)
From:   Lubomir Rintel <lkundrak@v3.sk>
To:     Andy Shevchenko <andy@infradead.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        YueHaibing <yuehaibing@huawei.com>,
        platform-driver-x86@vger.kernel.org
Subject: 
Date:   Wed, 29 May 2019 10:34:01 +0200
Message-Id: <20190529083405.332762-1-lkundrak@v3.sk>
X-Mailer: git-send-email 2.21.0
Reply-To: "[PATCH 0/4]"@zimbra.v3.sk, "Platform:OLPC:A"@zimbra.v3.sk,
          couple@zimbra.v3.sk, of@zimbra.v3.sk, bug@zimbra.v3.sk,
          fixes@zimbra.v3.sk
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

This set contains fixes for problems discovered with randconfig and 0-day
robot running agaist linux-next and one rather embarassing problem
introduced in the last OLPC EC patch set version.

They apply on top of for-next branch of
git://git.infradead.org/linux-platform-drivers-x86.git with two
patches from YueHaibing's set [1].

  Platform: OLPC: Add INPUT dependencies [2]
  Platform: OLPC: Fix build error without CONFIG_SPI [3]

[1] https://lore.kernel.org/lkml/20190528092806.20080-1-yuehaibing@huawei=
.com/
[2] https://lore.kernel.org/lkml/20190528092806.20080-2-yuehaibing@huawei=
.com/
[3] https://lore.kernel.org/lkml/20190528092806.20080-3-yuehaibing@huawei=
.com/

Thanks
Lubo




