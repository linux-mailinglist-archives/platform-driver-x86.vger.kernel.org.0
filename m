Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4115F4FB82
	for <lists+platform-driver-x86@lfdr.de>; Sun, 23 Jun 2019 14:16:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbfFWMQf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Jun 2019 08:16:35 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:60367 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726086AbfFWMQe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Jun 2019 08:16:34 -0400
Received: from Internal Mail-Server by MTLPINE2 (envelope-from vadimp@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 23 Jun 2019 15:16:32 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id x5NCGW1D001431;
        Sun, 23 Jun 2019 15:16:32 +0300
From:   Vadim Pasternak <vadimp@mellanox.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@mellanox.com>
Subject: [PATCH v1 platform-next 0/7] platform/x86: mlx-platform: init flow amendments and support for new attributes
Date:   Sun, 23 Jun 2019 12:16:23 +0000
Message-Id: <20190623121630.17945-1-vadimp@mellanox.com>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patchset includes:
- Changes in initialization flow to allow passing a ‘regmap’ handle to
  i2c-mlxcpd driver.
- Adding separate register map default structure for the next
  generation systems.
- Modification order in ‘mlxplat_dmi_table’ in order to reduce the
  number of ‘dmi_table’ entries necessary for new systems support.
- Adding more reset causes attributes.
- Adding new attributes to documentation.
- Fixing duplicated attribute name in documentation.

Vadim Pasternak (7):
  platform/x86: mlx-platform: Move regmap initialization before all
    drivers activation
  platform/x86: mlx-platform: Change API for i2c-mlxcpld driver
    activation
  platform/x86: mlx-platform: Add regmap structure for the next
    generation systems
  platform/x86: mlx-platform: Modify DMI matching order
  platform/x86: mlx-platform: Add more reset cause attributes
  Documentation/ABI: Add new attribute for mlxreg-io sysfs interfaces
  Documentation/ABI: Fix duplicated attribute for mlxreg-io sysfs
    interfaces

 Documentation/ABI/stable/sysfs-driver-mlxreg-io |  22 ++-
 drivers/platform/x86/mlx-platform.c             | 216 +++++++++++++++++-------
 2 files changed, 173 insertions(+), 65 deletions(-)

-- 
2.11.0

