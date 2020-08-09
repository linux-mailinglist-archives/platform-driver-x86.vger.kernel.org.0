Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5A05623FDE5
	for <lists+platform-driver-x86@lfdr.de>; Sun,  9 Aug 2020 13:22:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726335AbgHILWq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 9 Aug 2020 07:22:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33192 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726199AbgHILWm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 9 Aug 2020 07:22:42 -0400
X-Greylist: delayed 1465 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sun, 09 Aug 2020 04:22:42 PDT
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2FD81C061756
        for <platform-driver-x86@vger.kernel.org>; Sun,  9 Aug 2020 04:22:42 -0700 (PDT)
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.89)
        (envelope-from <laforge@osmocom.org>)
        id 1k4j1n-00086z-Eh; Sun, 09 Aug 2020 12:58:11 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.94)
        (envelope-from <laforge@osmocom.org>)
        id 1k4j1b-009dCs-QT; Sun, 09 Aug 2020 12:57:59 +0200
From:   laforge@gnumonks.org
To:     platform-driver-x86@vger.kernel.org
Cc:     kenneth.t.chan@gmail.com, Harald Welte <laforge@gnumonks.org>
Subject: [PATCH] MAINTAINERS: Change panasonic-laptop to 'Orphan' state
Date:   Sun,  9 Aug 2020 12:57:55 +0200
Message-Id: <20200809105755.2295621-1-laforge@gnumonks.org>
X-Mailer: git-send-email 2.28.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Harald Welte <laforge@gnumonks.org>

I haven't been doing any work on those drivers in ages, neither
do I even use any related devices.

Signed-off-by: Harald Welte <laforge@gnumonks.org>
---
 MAINTAINERS | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 05f5eb227700..b39760224586 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -13023,9 +13023,8 @@ F:	include/net/page_pool.h
 F:	net/core/page_pool.c
 
 PANASONIC LAPTOP ACPI EXTRAS DRIVER
-M:	Harald Welte <laforge@gnumonks.org>
 L:	platform-driver-x86@vger.kernel.org
-S:	Maintained
+S:	Orphan
 F:	drivers/platform/x86/panasonic-laptop.c
 
 PARALLAX PING IIO SENSOR DRIVER
-- 
2.28.0

