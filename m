Return-Path: <platform-driver-x86+bounces-12503-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 4943CACFEB8
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Jun 2025 11:04:49 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id C745018983DD
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Jun 2025 09:05:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9E0C6286421;
	Fri,  6 Jun 2025 09:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yr1l27W8"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F78C28640B
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Jun 2025 09:04:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749200680; cv=none; b=Fo3FQVNZn8T43qRl0/nVkA9b6gvnp6Eoi+Q+15QonU4uOh8DJm3SRIQ99MTq7g3F+p99jsdEpD2KTXNVynOoQTB5nv424vF1KNTO4gCZalo0+/ZJQMmB59TLMvrXH05WlrvVPwpKhr0MONRXlbr0cRWhU8AQpPAHM6+6JzRz1K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749200680; c=relaxed/simple;
	bh=ITvBuxSeIAXDkBJEWGSGD5rlQvO64BrbWaK4vCuf/rQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KXibBjBGpPivZdARK3RnF8UYKH5jSN26VvUjW2wKnnSyfSyIxRGOGYyqGDGYFBGUWinpM5DWZbCG/9O3uCoTvKy2DF04gVavl6KAXXf+qLWO+cBnN4+1n7raUQlKcpNOkVJ3AVTCF+IyggRbYP6kB7Dh30IZs5hvR/RSvIW4BpM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yr1l27W8; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-450dd065828so13776085e9.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 06 Jun 2025 02:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749200676; x=1749805476; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=yr1l27W8cUM/Ij7/AcbfDzBETTN6LucQXjVhHwYsqs+I0cjoajpSHJcGu49FF0LdNd
         UVDmZILBPMmJ/09mBBSgqLIC5ptsMLC691HSZYcXviFtfA5ZJ3rRDjQePX+vHwGci5m8
         qcAaH+8V82AggiqR4EaO4xiFEDfft/CrRxya9h/7I8pUA6T6bJDKZa5JDhBRuKVbxMnM
         VLra/shle7JRd/rtH1cCFkt41lPEIkY+dxoRT14Jp1wYyU3FFhofZ+WKXsR3k2PquYo6
         bYQZA7+2CdXYJjWqL+bx/QNnh3tb+1fGYGeY5BrqO3U9dYt5iDu8e2Tix7jkz4OFSsiF
         n2lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749200676; x=1749805476;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S/emY2XS5cFVoX90o0NgZjiKA3eudgdKvmBzuNCnA9A=;
        b=Xia/rG5/Qu/g2IfzcYctSl2uBol8tK5QlCTPLoYRqn9y9DQh0P4AyPYxDdaoxC5Joe
         rzNHvXLlhlxrCmDMWpiH+fG6QRRHBWoQKUj9sl69tH+2CSKn087A0rjlEpCpX/ZPk5m4
         JX0tdZJV/uDed9Erx6BkqHns5pg4mAKL2sq7iqzY5lyeXRZCwQKWmBgjNsoTlMxfRHV7
         hhsjYeeuyo6WVrmSvst9VMdod+68GuB1lr6O5ScaSk1u0B4jrTbY/kx0UGmbszQ6Gv+U
         dba1c0PyyviBpxCvyJMAvmPi5WvihpOKOKtptrXN4nHIvwWwMUV6FCnFRmKgE/Qr+Sf6
         yqkQ==
X-Forwarded-Encrypted: i=1; AJvYcCWgj/G97/siylj1OzH8J6KyMBY5Wg1CJX7Lh7MyqMA57WXf+J4TPeMkNCJFUeukxvcCq/g2AEahltNX4yGlZ07B6+97@vger.kernel.org
X-Gm-Message-State: AOJu0YwhV8JOHCd3kcGsBdtYM4gmQTKmv30aydMyET9p5eR+NKaSqHgO
	7XmA1L9S8LGyxFk7WSMlbeMKvNFD1dHvE5CP6ixGyBkOFugVFxsWGJXoz21m0sma+NY=
X-Gm-Gg: ASbGnctbbr/qDBPBGxjbPsPAPXMSeT/4HwOWdsv5Tunx32Js4kOC2uouv9L5PMMKyO5
	037oTnmZUTojXpzFLklyIbsMo50Fa/EnuwTi7SKRsEjuDNvP6wdfSWjxzFWXNH7f73UbxgOreck
	u5t/XmrB2I2ywn4Bmj5SwxNfx0RldbYyh1M+DbHZuO2ktmQXrNbCTFqV1SFZwHu7qO2bGIJE6tJ
	+Ueny/1IBKU+yBYPWdZ4XsEaxNAeTFTuRj419wot8n2Ada/kpeWhy66LP5HQjUHVOw27V9NnqYy
	lPQKVwMDZb8Zcr8Cg6R2Mv4gpjXjvpfqcR/WCSB7rmgCaz8NHZRnQ+Oz89JX4Q0PgqRMcTMr1YO
	lww==
X-Google-Smtp-Source: AGHT+IFhA2vqyp8xEAIPBvNHsWP+ZzsHRKW0V5DhFiNi2JLK+60alY4CgxuHf71qdKGE0Cj1Xq0Z3g==
X-Received: by 2002:a05:600c:6207:b0:442:f4a3:b5ec with SMTP id 5b1f17b1804b1-452013fd6b5mr27037065e9.4.1749200676516;
        Fri, 06 Jun 2025 02:04:36 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4526e155ce7sm14210735e9.10.2025.06.06.02.04.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 02:04:35 -0700 (PDT)
Date: Fri, 6 Jun 2025 12:04:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Greg KH <gregkh@linuxfoundation.org>,
	Ingo Molnar <mingo@kernel.org>, platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] platform/x86/intel: power-domains: Fix error code in
 tpmi_init()
Message-ID: <aEKvIGCt6d8Gcx4S@stanley.mountain>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Return -ENOMEM instead of success if kcalloc() fails.

Fixes: e37be5d85c60 ("platform/x86/intel: power-domains: Add interface to get Linux die ID")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/platform/x86/intel/tpmi_power_domains.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/tpmi_power_domains.c b/drivers/platform/x86/intel/tpmi_power_domains.c
index 0c5c88eb7baf..9d8247bb9cfa 100644
--- a/drivers/platform/x86/intel/tpmi_power_domains.c
+++ b/drivers/platform/x86/intel/tpmi_power_domains.c
@@ -228,8 +228,10 @@ static int __init tpmi_init(void)
 
 	domain_die_map = kcalloc(size_mul(topology_max_packages(), MAX_POWER_DOMAINS),
 				 sizeof(*domain_die_map), GFP_KERNEL);
-	if (!domain_die_map)
+	if (!domain_die_map) {
+		ret = -ENOMEM;
 		goto free_domain_mask;
+	}
 
 	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"platform/x86/tpmi_power_domains:online",
-- 
2.47.2


