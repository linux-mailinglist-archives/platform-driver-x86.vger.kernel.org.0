Return-Path: <platform-driver-x86+bounces-608-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DDC181D25D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Dec 2023 06:07:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id D171B1F23BEF
	for <lists+platform-driver-x86@lfdr.de>; Sat, 23 Dec 2023 05:07:50 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8CE602117;
	Sat, 23 Dec 2023 05:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="iJbC/nHq"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AB54D270;
	Sat, 23 Dec 2023 05:06:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=0IQ6eY5t7H4CQgzSB2rccly8JDANanOLav3vAFYUpa8=; b=iJbC/nHq48kzd602Cpsynv12sd
	m8RRjJpv0aNtdCYj4NQK/L1ZaXdeEeBF3O5qAAmQv4ljkFQq2GwHEezpzLMLnhVdG0hPOAuRqfY2d
	45z03FdOfrZszkUSAurI/nAAtqZ9ksjSt3SDns+o/2kqLzBqdwodhw4BYhA+3+Xn3mEhzWthqXOQg
	cePmfj9M3O58+eWmySxWkRxTEf1n+xzO6X90+C869DgRJI4IHDzVrKo+jFRlJ741uhVMISI+GbgvC
	viWxjZabNAN+9Ge3DQlF1nIaSj0LidGiLlaLCSUX7GuR1RAnw000tpa34qbOzu6l1SHxYjWYuPg3U
	sF33+WeQ==;
Received: from [50.53.46.231] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1rGuDw-007Opp-2L;
	Sat, 23 Dec 2023 05:06:56 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Armin Wolf <W_Armin@gmx.de>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH] platform/x86: wmi: linux/wmi.h: fix Excess kernel-doc description warning
Date: Fri, 22 Dec 2023 21:06:55 -0800
Message-ID: <20231223050656.14068-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Remove the "private:" comment to prevent the kernel-doc warning:

include/linux/wmi.h:27: warning: Excess struct member 'setable' description in 'wmi_device'

Either a struct member is documented (via kernel-doc) or it's private,
but not both.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Armin Wolf <W_Armin@gmx.de>
Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org
---
 include/linux/wmi.h |    2 --
 1 file changed, 2 deletions(-)

diff -- a/include/linux/wmi.h b/include/linux/wmi.h
--- a/include/linux/wmi.h
+++ b/include/linux/wmi.h
@@ -21,8 +21,6 @@
  */
 struct wmi_device {
 	struct device dev;
-
-	/* private: used by the WMI driver core */
 	bool setable;
 };
 

