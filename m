Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2F63B1C3C9D
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 May 2020 16:14:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728669AbgEDOOd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 4 May 2020 10:14:33 -0400
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:58109 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1728728AbgEDOOd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 4 May 2020 10:14:33 -0400
Received: from Internal Mail-Server by MTLPINE1 (envelope-from michaelsh@mellanox.com)
        with ESMTPS (AES256-SHA encrypted); 4 May 2020 17:14:31 +0300
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 044EEVtS022784;
        Mon, 4 May 2020 17:14:31 +0300
From:   michaelsh@mellanox.com
To:     linux@roeck-us.net, wim@linux-watchdog.org, andy@infradead.org,
        dvhart@infradead.org
Cc:     linux-watchdog@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, vadimp@mellanox.com,
        Michael Shych <michaelsh@mellanox.com>
Subject: [PATCH v4 0/4] support watchdog with longer timeout period
Date:   Mon,  4 May 2020 17:14:23 +0300
Message-Id: <20200504141427.17685-1-michaelsh@mellanox.com>
X-Mailer: git-send-email 2.11.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Michael Shych <michaelsh@mellanox.com>

This patchset adds support of extended new watchdog type 3 of Mellanox
Ethernet and Infiniband switch systems.
This type of watchdog can have a timeout period longer than 255 or 32 sec.
as it was before.

Michael Shych (4):
  platform_data/mlxreg: support new watchdog type with longer timeout
    period
  platform/x86: mlx-platform: support new watchdog type with longer
    timeout
  watchdog: mlx-wdt: support new watchdog type with longer timeout
    period
  docs: watchdog: mlx-wdt: Add description of new watchdog type 3

 Documentation/watchdog/mlx-wdt.rst   |  10 ++++
 drivers/platform/x86/mlx-platform.c  | 106 ++++++++++++++++++++++++++++++
 drivers/watchdog/mlx_wdt.c           |  73 ++++++++++++++++++++----
 include/linux/platform_data/mlxreg.h |   5 +-
 4 files changed, 182 insertions(+), 12 deletions(-)

-- 
2.11.0

