Return-Path: <platform-driver-x86+bounces-11532-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 67590A9DC92
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Apr 2025 19:30:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id B6DE85A67F4
	for <lists+platform-driver-x86@lfdr.de>; Sat, 26 Apr 2025 17:30:10 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3708625CC60;
	Sat, 26 Apr 2025 17:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="RGJ7UtfT"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from linux1587.grserver.gr (linux1587.grserver.gr [185.138.42.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6309F176AC5;
	Sat, 26 Apr 2025 17:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.138.42.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745688624; cv=none; b=fdgLyXRV/T8qY4LT5OCk70ntHeaHBCIW/5KCptNkn6wNC1Nj8ODtCqA0PjJiPYSMsZhWT1KTP9xexd0scw+EHP+nEONRZSSnijFXTCDnzPozl6+FNQMSxxvhcIJrcRxLKtD7/nwECI6A2PklN45cJuz82SaUw68TGM2VD7zVUOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745688624; c=relaxed/simple;
	bh=vfyDkHT/jwlMoS1K7SzkF7b6eZ99VgSEDGYxDeujKM0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qevWYCCYCaaMRRg/vAx8ZduapDy0Z9ukEGnpGm2/MihyZsZAM/wbMFLbg3R3Zb1VUZU3IX3cOoQWe11Fs+JOdCU/4Jo9ZQ6K+xC3mMHlaZbXX7s4pN/EYkajJPB8I8bGjgkqE9RL7dN3ZhJu/a5pEFS9wQSAHXcWovlVw9m4Ms4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=pass (1024-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=RGJ7UtfT; arc=none smtp.client-ip=185.138.42.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from localhost.localdomain (unknown [IPv6:2a02:2149:8b6a:d000:ae13:99fc:9070:c966])
	by linux1587.grserver.gr (Postfix) with ESMTPSA id AEB022E0295E;
	Sat, 26 Apr 2025 20:30:09 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1745688610;
	bh=JxOsmVj/bd8uX/O7XVpXUlYH/scuLIA+Aqtg/yDWZ2s=; h=From:To:Subject;
	b=RGJ7UtfTnC9cXxhSteXYtL39HAgpGhpMqi4e0A6M+M9nHNus/xKoW8gNBZYFyIHOM
	 LQ4OM2P4sAyxGFI6d6h2Thmr3RNgf4jFiXfsYwwX3m1Wg1oaV0CeaklJ10KqE6IOzq
	 n3I0dF2bypTyLyuIJpbVr14gBt6TtkWDCAqoJpE0=
Authentication-Results: linux1587.grserver.gr;
	spf=pass (sender IP is 2a02:2149:8b6a:d000:ae13:99fc:9070:c966) smtp.mailfrom=lkml@antheas.dev smtp.helo=localhost.localdomain
Received-SPF: pass (linux1587.grserver.gr: connection is authenticated)
From: Antheas Kapenekakis <lkml@antheas.dev>
To: platform-driver-x86@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Derek John Clark <derekjohn.clark@gmail.com>,
	=?UTF-8?q?Joaqu=C3=ADn=20Ignacio=20Aramend=C3=ADa?= <samsagax@gmail.com>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Eileen <eileen@one-netbook.com>,
	Antheas Kapenekakis <lkml@antheas.dev>
Subject: [PATCH v1 0/2] platform/x86: oxpec: Add support for OneXPlayer G1
 Intel/AMD
Date: Sat, 26 Apr 2025 19:29:53 +0200
Message-ID: <20250426172955.13957-1-lkml@antheas.dev>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-PPP-Message-ID: 
 <174568861046.7620.10625543685939717842@linux1587.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 0.103.11 at linux1587.grserver.gr
X-Virus-Status: Clean

The OneXPlayer G1 is a new clamshell factor model by OneXPlayer. The
special quirk on this one is that there is an additional bit on the turbo
button register we should not touch, so the first patch converts the turbo
function to apply a mask instead.

Antheas Kapenekakis (2):
  platform/x86: oxpec: Make turbo val apply a bitmask
  platform/x86: oxpec: Add support for the OneXPlayer G1

 drivers/platform/x86/oxpec.c | 121 +++++++++++++++++------------------
 1 file changed, 60 insertions(+), 61 deletions(-)


base-commit: f5612600314bcce86934318601501e2d8301176d
-- 
2.49.0


