Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C2E201A0460
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Apr 2020 03:17:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726852AbgDGBRH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 21:17:07 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43213 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726793AbgDGBRG (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 21:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586222226;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tGzj3Xy5+PE0S44YeXdrCLBeKxIojEvp8oKLEKl/XHc=;
        b=MEIXnwCndMWUO1M0uynO55gwDJLTSW/PFf5yhuMuLcZrjmvm6s/OO/+H5878/5ryABEZvx
        OjjKztJl1fA0DUQJKgk0HeZhNYS/9QJQWJsMDOnuMSixu0HjoZZZiamfOnv2hGOBXWhH1k
        k5LJRHcaKKWAEPCqYlaR87L9kL5qoN8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-h6tm8SXWMiOuhvUoBcnaAw-1; Mon, 06 Apr 2020 21:17:04 -0400
X-MC-Unique: h6tm8SXWMiOuhvUoBcnaAw-1
Received: by mail-wm1-f72.google.com with SMTP id s22so31515wmh.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 18:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tGzj3Xy5+PE0S44YeXdrCLBeKxIojEvp8oKLEKl/XHc=;
        b=asnjLky93ywdTStx6Es+U39fYWiCfzUuPezsDtNBLVDzbIpIEHarcJN0T4iV9eXFIS
         fDXTRdp1uwTc2vqfStAqYdW5e+hLGYryoepfnFCmmDmJ6G/y0QdpjWrUyTM0D8kbEto6
         9bnkYmbadlTqHac5hrXUwuTrvL/6PDubiRogTb+eVbL7JlCxjTz3Kl5vnH4rpjiLRRAe
         WpDC85oBpKAIj0Um/t2gL7Q6lf9J59SEkPYjhIso3sigfd1JSZpFv01TuZKujPToCFV4
         ptAmWCHboIYMRvEaXb+Yx3as4EHaCG5dooTRHw/x1aELhp4J0qsqv0j2KHSn6LEStPxL
         5Onw==
X-Gm-Message-State: AGi0PuaDgxUSy8vNsU0Eqou09ZTO3tjnst12E66XPUWMEWtcfMgQ48cQ
        Xs0HxHwrvKK+hdsUX1z894liq7eAElUb4Y6NVPJar5vfHIJh1upTwBy3P19Lnruzbkg1o7ytPLf
        TpWgdqJxJzr5CiGAdMF1W6sDNKDL7msJThg==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr2042962wrx.112.1586222223170;
        Mon, 06 Apr 2020 18:17:03 -0700 (PDT)
X-Google-Smtp-Source: APiQypIEn11jC0tGjNxm7Fs9YE85y7WQxqWpdu3lnz8HpXzuK+KjkQRa6rbOz9+IGoBWozZn6MgbFg==
X-Received: by 2002:a05:6000:2:: with SMTP id h2mr2042947wrx.112.1586222223007;
        Mon, 06 Apr 2020 18:17:03 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id z3sm116362wma.22.2020.04.06.18.17.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 18:17:02 -0700 (PDT)
Date:   Mon, 6 Apr 2020 21:17:00 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v8 16/19] mellanox: switch to virtio_legacy_init/size
Message-ID: <20200407011612.478226-17-mst@redhat.com>
References: <20200407011612.478226-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407011612.478226-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These are used for legacy ring format, switch to APIs that make this
explicit.

Acked-by: Andy Shevchenko <andy.shevchenko@gmail.com>
Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 5739a9669b29..f42b1fb713f1 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -214,7 +214,7 @@ static void mlxbf_tmfifo_free_vrings(struct mlxbf_tmfifo *fifo,
 	for (i = 0; i < ARRAY_SIZE(tm_vdev->vrings); i++) {
 		vring = &tm_vdev->vrings[i];
 		if (vring->va) {
-			size = vring_size(vring->num, vring->align);
+			size = vring_legacy_size(vring->num, vring->align);
 			dma_free_coherent(tm_vdev->vdev.dev.parent, size,
 					  vring->va, vring->dma);
 			vring->va = NULL;
@@ -245,7 +245,7 @@ static int mlxbf_tmfifo_alloc_vrings(struct mlxbf_tmfifo *fifo,
 		vring->vdev_id = tm_vdev->vdev.id.device;
 		dev = &tm_vdev->vdev.dev;
 
-		size = vring_size(vring->num, vring->align);
+		size = vring_legacy_size(vring->num, vring->align);
 		va = dma_alloc_coherent(dev->parent, size, &dma, GFP_KERNEL);
 		if (!va) {
 			mlxbf_tmfifo_free_vrings(fifo, tm_vdev);
@@ -935,7 +935,7 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
 		vring = &tm_vdev->vrings[i];
 
 		/* zero vring */
-		size = vring_size(vring->num, vring->align);
+		size = vring_legacy_size(vring->num, vring->align);
 		memset(vring->va, 0, size);
 		vq = vring_new_virtqueue(i, vring->num, vring->align, vdev,
 					 false, false, vring->va,
-- 
MST

