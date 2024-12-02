Return-Path: <platform-driver-x86+bounces-7417-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B5979E0C46
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Dec 2024 20:38:50 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id CB1C91653D7
	for <lists+platform-driver-x86@lfdr.de>; Mon,  2 Dec 2024 19:38:46 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 84E8C1DE8B1;
	Mon,  2 Dec 2024 19:38:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="boOmRcJJ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE2C1DE4F0;
	Mon,  2 Dec 2024 19:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733168321; cv=none; b=l7WE8vHzNZpF1oZ2m6dh0HQTGVtK7C3k/geFoniZ2G4iO3Qm7be+MuWCwlw6x8w1MieNDuI07y9Zi/Y/PtqZiiduUynHe40jME3uHGrRp2rIKSHluJSleFv4fi8lJiwWgXp1bqEiIG/VDYhh7Si+VXPorJPGIWdqqyUno4VpEfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733168321; c=relaxed/simple;
	bh=dEUF5TC8DT2o+cQgIrRqLsxV/N2WvbGPEHszONyH3nU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kvYqYj2tmSa5xW+yZU4ZLsbxyS0zzkeWlqNgSZWkIoXH1ztVL+yvCwsNxbNJBjYeFYUn8+DIJ06st0A+7HvRwrIJ+Vh2uWuIOYGy2VnoPTSknNsDaXWvTUB4lmITUtvAUiUdAvT8E4cKXj9MIaf964VOoFZhIuQLusfZWPgiUTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=boOmRcJJ; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1733168316;
	bh=dEUF5TC8DT2o+cQgIrRqLsxV/N2WvbGPEHszONyH3nU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=boOmRcJJNsSPppwl0cLoImXEfMsaUbNdaBPo+Kv12OxLmrtIYTfr2miYsPmdH7qYZ
	 ZVk/tZdjWrL6s46+sgX10nZUzL6HnlOjtr7zfLyEw9pMmsv//MK0qavMg9QBWoZ8oE
	 UCFGrwvQd2/dDB67ddxVfeKJ1dKkBBnSJs7baHoE=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Mon, 02 Dec 2024 20:38:35 +0100
Subject: [PATCH 4/5] platform/x86/intel/pmt: Constify 'struct
 bin_attribute'
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241202-sysfs-const-bin_attr-pdx86-v1-4-9ab204c2a814@weissschuh.net>
References: <20241202-sysfs-const-bin_attr-pdx86-v1-0-9ab204c2a814@weissschuh.net>
In-Reply-To: <20241202-sysfs-const-bin_attr-pdx86-v1-0-9ab204c2a814@weissschuh.net>
To: Stuart Hayes <stuart.w.hayes@gmail.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 "David E. Box" <david.e.box@linux.intel.com>, 
 Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>, 
 Carlos Bilbao <carlos.bilbao.osdev@gmail.com>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733168316; l=1434;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=dEUF5TC8DT2o+cQgIrRqLsxV/N2WvbGPEHszONyH3nU=;
 b=Ne4kYuRK7C3shiK6WjdCksksuRbZxHLWk2odkJkpBxlmn0ISdTSZY7frOFiqw34ebdLXj8Y7q
 7zm7twrW957CMj+4sMfCl4308tRucp4Ubz1/lOctHbgylxooO8N73TU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

The sysfs core now allows instances of 'struct bin_attribute' to be
moved into read-only memory. Make use of that to protect them against
accidental or malicious modifications.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 drivers/platform/x86/intel/pmt/class.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/intel/pmt/class.c b/drivers/platform/x86/intel/pmt/class.c
index 3c53cab033277bccc981310389f7dc47737825f4..65f26267ff49c39e3e143fa7eedb8df23d3ddc1d 100644
--- a/drivers/platform/x86/intel/pmt/class.c
+++ b/drivers/platform/x86/intel/pmt/class.c
@@ -81,7 +81,7 @@ EXPORT_SYMBOL_NS_GPL(pmt_telem_read_mmio, INTEL_PMT);
  */
 static ssize_t
 intel_pmt_read(struct file *filp, struct kobject *kobj,
-	       struct bin_attribute *attr, char *buf, loff_t off,
+	       const struct bin_attribute *attr, char *buf, loff_t off,
 	       size_t count)
 {
 	struct intel_pmt_entry *entry = container_of(attr,
@@ -308,7 +308,7 @@ static int intel_pmt_dev_register(struct intel_pmt_entry *entry,
 	entry->pmt_bin_attr.attr.name = ns->name;
 	entry->pmt_bin_attr.attr.mode = 0440;
 	entry->pmt_bin_attr.mmap = intel_pmt_mmap;
-	entry->pmt_bin_attr.read = intel_pmt_read;
+	entry->pmt_bin_attr.read_new = intel_pmt_read;
 	entry->pmt_bin_attr.size = entry->size;
 
 	ret = sysfs_create_bin_file(&dev->kobj, &entry->pmt_bin_attr);

-- 
2.47.1


