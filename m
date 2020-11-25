Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6E95B2C3D5D
	for <lists+platform-driver-x86@lfdr.de>; Wed, 25 Nov 2020 11:12:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728264AbgKYKLB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 25 Nov 2020 05:11:01 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:37724 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726595AbgKYKLB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 25 Nov 2020 05:11:01 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 25 Nov 2020 12:10:58 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 0APAAvjt025972;
        Wed, 25 Nov 2020 12:10:57 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH platform 0/2] platform/x86: mlx-platform: Remove PSU EEPROM configuration
Date:   Wed, 25 Nov 2020 12:10:54 +0200
Message-Id: <20201125101056.174708-1-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Remove PSU EEPROM configuration for systems MSN2700, MSN2100, MSN274x
to support the requirement of power unit replacement by "off the shelf"
device, matching electrical required parameters. Such device can be
equipped with different EEPROM types or even could be not equipped with
EEPROM.

Patch set contains two bug fixes:
- For MSN2700 and MSN2100 system types.
- For MSN274x system types.

Vadim Pasternak (2):
  platform/x86: mlx-platform: Remove PSU EEPROM from default platform
    configuration
  platform/x86: mlx-platform: Remove PSU EEPROM from MSN274x platform
    configuration

 drivers/platform/x86/mlx-platform.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

-- 
2.11.0

