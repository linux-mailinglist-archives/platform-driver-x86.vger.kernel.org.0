Return-Path: <platform-driver-x86+bounces-10888-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 82556A7F5E7
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Apr 2025 09:21:07 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6A04417D3B6
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Apr 2025 07:20:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7BF302620D5;
	Tue,  8 Apr 2025 07:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LtaqNtuk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B729325FA34
	for <platform-driver-x86@vger.kernel.org>; Tue,  8 Apr 2025 07:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096800; cv=none; b=aRN0a3xcVuXRd+igeaYnx/p93eUH++EtoGBgYKtHfdPyR5s7Fb1stNtfUyu3+c5RqutZrX3aL4vxJO6uEf2iHYd99WUaihU/uOC17SvyLzH7Xt7LNWIu4EPLszG2q1ACTaLPIDFQ/seQIN4k62P8+KNn3uczOU8jGgzlJa42LvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096800; c=relaxed/simple;
	bh=T+WH8Iwu/6dtTdR9z5RhK52HiLW1moQVVBrpWP9slQQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=h+PzV7r8rYVIDbKVWa1zNAB1xBU25RguhMnbwy+tm1HpMynT5i6kfAJxUAgjHS/fUqhpkapFnthiGfYaC3fQBTsEXiQVKDETce5qgDsmsEflOqh9BO7Rr7nDqnUISS+92KTPQjOnfffF+kKeLPohQVuuao9ctowZlscg74x4uz4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LtaqNtuk; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-39d83782ef6so185494f8f.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Apr 2025 00:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096797; x=1744701597; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W4uWWhb4aSngdGHb/52hqhL9aoRrvkL4lHuK2jkEB+c=;
        b=LtaqNtukZr21XdNC95ivTDk3H8dbbZHVJ5HEEP3zlOJqtJ/s3JU995k3DswgKxct2Y
         kUTzrvQHl1kyp/xA+lTwBLBltWIc9NPR6qfsrHwVNqrB+7MDUH4FRx8+LA4ADjwYBxk/
         AtxduYObAMMNH9jwLcwMpGl5m6+spkuJzwyHaypU7OTFvp+I4vN2Q9mEFqwZuaYsKV1x
         VKIji82Q2Idgd1UE6IKorC7XtIrwM65px8XMHDQSYdpTn/3L9c+0WQU/QlqdDinDE071
         NT0jhzg/bBCuD4jgs9/bGu1sqRRReuI9hw1qfEgxWBZximHxO+zsLP5wAioUjiAichT/
         XPXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096797; x=1744701597;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W4uWWhb4aSngdGHb/52hqhL9aoRrvkL4lHuK2jkEB+c=;
        b=b5EZjVDxDjw7FxioUGmdlAbh4Xr6HSAt5R4j4NhP1+9NGuzpNag/j0XjjxGmNl8HG/
         q3KBAZsrKVmJEKZxmfkaoas/yXs4aOHixylF1Qz+HCJ0jAbeVBbZ1DJHGb0kZJLr9fHz
         S5zKnknodzxYf4n63llSxzL2X/xF+9QHtaqDYs60pJZQ6fC6z5MV2I4Bo8+jR6FQWRAz
         PzgqtIHbw1ZvMGbMKDZfwFwLl8WL4yM77iUxkU42YfMrq6fqzucPdyDhc1vPqniD9hjg
         /CQbEoSs/1ZYzXOjw3aZWxRQA0Tmd7YI4dnwEb7Mq6VYvqxNxfpeqMnP93h6j8x5pTRU
         tepQ==
X-Gm-Message-State: AOJu0Yx9HTJO8PMNsrCEZL0XA/glmiROoFK2oFGssPLlfq6lYs8NqmmX
	8qjhn4vUcFXgg9kOGZKUL0bIespY5ekxUA2UVK0KYVxP6KGhSZQzbcyfZkBlbg4=
X-Gm-Gg: ASbGncsYxHRaZRpKoL5hFk266MrpLjlVc9A38m7mEYhjGMfu4IV9MNy3DmHsvFLcPps
	LSYYmhQDDpsD2ZsI/oMAPtiyuwh5FS/lnzAslip6qyhjf3xLvVb6+2YEb4b7tT1tZun8m+Rga6U
	z7Pj04VNZslrrYJgpEHjscu54B6L2p0oq3vAYCD3SFOa2I5Ptnv60F/z/3oScQmCnBrJpZALVyA
	Z19Zo72mV/Cvk/CHQN55+5KcCKn+COL+NbGMEbV9PiN17ecDJvfd0/ab7D1AlUXq+fBhimudVPv
	chO3hynbf9pYP4FrZq4BKRGOU6/quZyrWfkXUg==
X-Google-Smtp-Source: AGHT+IGs693SF2skFJxtrnpVyyA4b648Sphiyre1DRml+SY6VGE/qft2VVMjkRtQmhfhLdF6SnmNvw==
X-Received: by 2002:a5d:584e:0:b0:390:dec3:2780 with SMTP id ffacd0b85a97d-39d820d2ad3mr1805877f8f.24.1744096797014;
        Tue, 08 Apr 2025 00:19:57 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c301a6608sm13882872f8f.23.2025.04.08.00.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:19:56 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:19:53 +0200
Subject: [PATCH 1/3] platform/x86: barco-p50: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-platform-x86-v1-1-6f67e76a722c@linaro.org>
References: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-platform-x86-v1-0-6f67e76a722c@linaro.org>
To: Santosh Kumar Yadav <santoshkumar.yadav@barco.com>, 
 Peter Korsgaard <peter.korsgaard@barco.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1503;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=udfDS9lyafCPGV+4xsVQ3dOFwSk2xrKk1FJNtTP7oag=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M4am3gjAMNUbHoWCiCoqknT/AS5a9eegVfGY
 4EDrIh9hoaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOGgAKCRARpy6gFHHX
 cuBVEADIgfqimyeJOkuRuAVqyxn0sjO5L0hv3Gs6/0y/f8XxZXC6CMs8MzmJkwNa8B6sN8hJ7V4
 Dxc0YPdYrGwGVA0+kLo+yH81VAP6MGX6CoxhtN69bGMISiZKHrhflFi/Ji7b6rhj1DT1nNtPBps
 PtlzfDIoORY0QJaulLpry8OYX93+nuLAM0Bnn7cvoxpXaqLFBr+lSVv7ED1QKTCeCSnHbgJhNd4
 Bo0ymRNs1114JMxjTWwS6s+KrJHPL/nw5sEH7S7ysHrdY0SqBhOEvbg/MbMW7ftRZ8EAtAWLnDl
 AN+WW29LnMLlutf4l9JS/ed52EsUhccwVpS11fHEMGEWj1/RrunaaOrfbYOWEYxC4aa7kimUtoS
 nf6Qna4mzdxmIxNPQbt4nfJ+VgL2k3SUll4Y0G0C6vTU+TmTJrz651/zSCJ4nv0mU6hhqiUTysM
 iezog/CtyllMI5/EC7E5ZR/pORd0HeIY9fu3Xfb4VXWBhQ+U7AMzOben1P5mKYegXRjICKjExrx
 BMXF1kBGuF70i1uaxu0xdz8eypgh72TLFtOk8Aajh0sAViRB0P5lyQT4AXvLLpuHONxeir49P7n
 XM4KaYnZ8TAE+6fnEEWmRvtDQa/Wzdyd13Nr9fomkeDRXMrhgRizq3iBcjZeI6dzpQ838pNz2ev
 0hsGQFUxfxz560w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/platform/x86/barco-p50-gpio.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/barco-p50-gpio.c b/drivers/platform/x86/barco-p50-gpio.c
index 143d14548565..bb3393bbfb89 100644
--- a/drivers/platform/x86/barco-p50-gpio.c
+++ b/drivers/platform/x86/barco-p50-gpio.c
@@ -268,15 +268,19 @@ static int p50_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return ret;
 }
 
-static void p50_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int p50_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct p50_gpio *p50 = gpiochip_get_data(gc);
+	int ret;
 
 	mutex_lock(&p50->lock);
 
-	p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO, gpio_params[offset], value);
+	ret = p50_send_mbox_cmd(p50, P50_MBOX_CMD_WRITE_GPIO,
+				gpio_params[offset], value);
 
 	mutex_unlock(&p50->lock);
+
+	return ret;
 }
 
 static int p50_gpio_probe(struct platform_device *pdev)
@@ -312,7 +316,7 @@ static int p50_gpio_probe(struct platform_device *pdev)
 	p50->gc.base = -1;
 	p50->gc.get_direction = p50_gpio_get_direction;
 	p50->gc.get = p50_gpio_get;
-	p50->gc.set = p50_gpio_set;
+	p50->gc.set_rv = p50_gpio_set;
 
 
 	/* reset mbox */

-- 
2.45.2


