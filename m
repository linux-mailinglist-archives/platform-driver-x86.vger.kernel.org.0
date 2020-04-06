Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id F08DC1A0056
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Apr 2020 23:35:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726948AbgDFVfZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 17:35:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:49296 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726934AbgDFVfY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 17:35:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586208923;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=p1zo9E/0T2RBJhS0NHCftwHqPvc0s/jKRL4zh5KiBdQ=;
        b=BvSzKhFHJQdJtlrI65qQyc+uWumxBkPxX7C2sbSzV28vXavSY8ov8BXkEnKXq7HlCl5CNr
        D04yXpKP+ddCpbspkaCUYVcClm2vOa40T2cRo46YSKelOJkn7vAinTscao+SQKx68k3Wah
        yFHDq0ZKaugI/cT2+/TgmE/2jIw0WEg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-327-qtFpPiVxPOKtvKPTLlbO0Q-1; Mon, 06 Apr 2020 17:35:21 -0400
X-MC-Unique: qtFpPiVxPOKtvKPTLlbO0Q-1
Received: by mail-wr1-f69.google.com with SMTP id y1so582085wrp.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 14:35:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=p1zo9E/0T2RBJhS0NHCftwHqPvc0s/jKRL4zh5KiBdQ=;
        b=ZeULMi4ca1zLlcAA7uVj1x7xeF3JiguSqrw+My5+/rMUASJVKKFl3//wkoEyZ58jAA
         ux/TINWCzKz+bKQflKCFZv8L8Hh9t+iq35BCOzDJcus9dFZbvVhk6nOcGAZJBI+GucK3
         0C4+IqWqhWRhZuO/Kb32q2STgiN1RxDTkWOQWYbebHQM3kOEeGIZaH5sOJCGZOPrnKvv
         e1vKJSx+60rQvEnEgqbeGlBVm+LzM35Ol7DsXJttukOnvee32L36bOUrpZ25lZ7wTxH7
         dUlXgrrq+pW8YANsqQle/7mpjcfgIBB/ztsLvPrw+Qr/XDEiwz4iEjvL3tKkkqVc8Pwj
         32Cg==
X-Gm-Message-State: AGi0PuaLPduL+GQsPnKnsnXAu4oPd8Ftbf6dyt0VFSbDpBOVJFp+V45s
        H9pNb1ApY+ih/S9GZhxkP5j0Mq7en836oI7XdHSt7saXVhBBHOpTMm+wwStB8dCvkatLjZlx023
        UpVKbYBLLAEh/0FfHt16MTsB18/ADqQv9YQ==
X-Received: by 2002:adf:e98a:: with SMTP id h10mr1328610wrm.370.1586208919959;
        Mon, 06 Apr 2020 14:35:19 -0700 (PDT)
X-Google-Smtp-Source: APiQypKFsjTJU6wZbFct97kHV2BeMmwhQkfVOIaQ+Y5VpGC+kCzeP6ryUgMDqGqdvs1NHdN2FLH2hA==
X-Received: by 2002:adf:e98a:: with SMTP id h10mr1328592wrm.370.1586208919806;
        Mon, 06 Apr 2020 14:35:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id r20sm950812wmh.46.2020.04.06.14.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:35:19 -0700 (PDT)
Date:   Mon, 6 Apr 2020 17:35:17 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v5 12/12] mellanox: switch to virtio_legacy_init/size
Message-ID: <20200406213314.248038-13-mst@redhat.com>
References: <20200406213314.248038-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406213314.248038-1-mst@redhat.com>
X-Mailer: git-send-email 2.24.1.751.gd10ce2899c
X-Mutt-Fcc: =sent
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

These are used for legacy ring format, switch to APIs that make this
explicit.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---

maintainers, pls ack merging this through virtio tree due to dependency
on previous patches in the patchset.

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

