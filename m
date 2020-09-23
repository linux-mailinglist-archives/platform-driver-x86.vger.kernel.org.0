Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6DBE275E97
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Sep 2020 19:27:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbgIWR1k (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Sep 2020 13:27:40 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:35532 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726422AbgIWR1j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Sep 2020 13:27:39 -0400
X-Greylist: delayed 400 seconds by postgrey-1.27 at vger.kernel.org; Wed, 23 Sep 2020 13:27:39 EDT
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 23 Sep 2020 20:20:56 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 08NHKtgk020358;
        Wed, 23 Sep 2020 20:20:56 +0300
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy.shevchenko@gmail.com, dvhart@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform-next 0/5] platform/x86: mlx-platform: Topology fixes and configuration updates
Date:   Wed, 23 Sep 2020 20:20:48 +0300
Message-Id: <20200923172053.26296-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

The patchset provides topology fixes for power units related structure
and extension of FAN structure with capability field.
The patchset includes:
Patch#1 - Removes PSU EEPROM configuration for systems class equipped
	  with 200x32Gb switch.
Patch#2 - Changes topology for the next generation systems.
Patch#3 - Updates module license to SPDX.
Patches#4-#5 - Add capability field for core platform data structure.

Vadim Pasternak (5):
  platform/x86: mlx-platform: Remove PSU EEPROM configuration
  platform/x86: mlx-platform: Fix extended topology configuration for
    power supply units
  platform_data/mlxreg: Update module license
  platform_data/mlxreg:  Extend core platform structure
  platform/x86: mlx-platform: Add capability field to platform FAN
    description

 drivers/platform/x86/mlx-platform.c  | 28 +++++++++++++---------------
 include/linux/platform_data/mlxreg.h | 34 ++++------------------------------
 2 files changed, 17 insertions(+), 45 deletions(-)

-- 
2.11.0

