Return-Path: <platform-driver-x86+bounces-7820-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id 13FF69F5705
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Dec 2024 20:42:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 5FAE9188F037
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Dec 2024 19:41:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 02BCE1F9AB1;
	Tue, 17 Dec 2024 19:40:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Zn9NU7JY"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D237E1F9A98
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Dec 2024 19:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734464447; cv=none; b=Wu16Plw9KM8mMr56X9wMz9iM4hRplRYiWFS95KaQ3//zqaZcTjw3llZZAhajixmsIOG0W3hFcdsqvWdy+KkzSiOWyHtmRdmpSwGBk0nNF0SX/dCf8GWlLw/NM/fAFb9M4GnvIiF8PiHzMsMZHFGiygzRafcfe0PGn0ePQNd1hi4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734464447; c=relaxed/simple;
	bh=GBXeYn6QUhSufnveMgQrWeDt1lHMy2FHbSthwreXJww=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kUW2VX4U1vY/dp5h2Jq3yEAN/0E8v8z6HoX+8CIziyBjBft/MIQw2MoD/L2zCqI8wsj/GEjxXEVyT6STdu30A56sLnN54ZX5U3KHXdOdFLZsKEJY24ql2srHY0R9/X9llGhG3WnVgPvPPkKUy4aE0U9F5yMHCYXZlyU2JoQDeO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Zn9NU7JY; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8BE1C4CED3;
	Tue, 17 Dec 2024 19:40:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734464447;
	bh=GBXeYn6QUhSufnveMgQrWeDt1lHMy2FHbSthwreXJww=;
	h=From:To:Cc:Subject:Date:From;
	b=Zn9NU7JYLDXujwrvv48wMtrAE7Mnbr0NWt3W2yxeJwU46kz0cQ33NKygdEQQkCWsq
	 RQ8gBQKPKv/9Qx2D/LusXLF2KWzH7Wg2lXpZEbfYHuivo8rV7F2Pd54s5zB69h93qn
	 Rc+nygy3eVFm0ZEfOlpjYqe9oUjGxs2CpEFw8s7NFk7qrqMyIVF2ypRMV9HcLWdChO
	 PAVlazedwvJ00SHoXdhCE1lxBIIuB4WKKttGlQuRFFMJYBkR6YDZO62WYyUHwF1qKD
	 vu+/qX8XeTh5+BfSWDrXgn6+lTykZG2kmI/SgovZj0DMm0d1cThan351sUmTdsiLPq
	 Z7EUonhC3Kvxg==
From: Mario Limonciello <superm1@kernel.org>
To: mario.limonciello@amd.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	Shyam-sundar.S-k@amd.com
Cc: platform-driver-x86@vger.kernel.org
Subject: [PATCH 0/2] Use guard(mutex) for amd platform drivers
Date: Tue, 17 Dec 2024 13:39:50 -0600
Message-ID: <20241217194027.1189038-1-superm1@kernel.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Mario Limonciello <mario.limonciello@amd.com>

Update the PMF and PMC drivers to use guard(mutex) instead of
mutex_lock/mutex_unlock.

Mario Limonciello (2):
  platform/x86/amd: pmc: Use guard(mutex)
  platform/x86/amd: pmf: Switch to guard(mutex)

 drivers/platform/x86/amd/pmc/pmc.c  | 14 ++++++--------
 drivers/platform/x86/amd/pmf/acpi.c |  6 ++----
 drivers/platform/x86/amd/pmf/core.c | 18 ++++++++----------
 3 files changed, 16 insertions(+), 22 deletions(-)

-- 
2.43.0


