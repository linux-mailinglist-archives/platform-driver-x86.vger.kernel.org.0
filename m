Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A00301A004B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Apr 2020 23:35:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726679AbgDFVe6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 17:34:58 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:37411 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726651AbgDFVe4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 17:34:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586208895;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c0TsndpJVTVi+maigb4wqF83+v7IC6vuTnjCeLiosRo=;
        b=PMcAl8OdvS1+pCgyqdHGl3ffCSCd5mpy9ZW5eaPUBiqR+J5ZB1W2T2Werd5oodVEGb3drF
        A8NRvBJulp/OHHXMNa4BKPyZL0O1qOZydw+OkQQ/1fYWEMvTanlg55t5rxJcYYkxnXZbWk
        s6CB9OfjNxEOuR03ivGQrDmBdjdRiDQ=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-86-EH8Mir0JNHaGnePjQbf2yQ-1; Mon, 06 Apr 2020 17:34:53 -0400
X-MC-Unique: EH8Mir0JNHaGnePjQbf2yQ-1
Received: by mail-wr1-f69.google.com with SMTP id k11so565922wrm.19
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 14:34:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c0TsndpJVTVi+maigb4wqF83+v7IC6vuTnjCeLiosRo=;
        b=hXHJ8H6NpuBEyygt58dGJ4S3sBtY8aZ2s/js94zMJ8vTcIUuQvPpkLpHlK2bupcbLm
         Ljus9GWBsxrKFD0IvpVpk0VXTEmoWqjlctco/7Lf8sLalJXif+xZ74bYMX1T5owuTSkJ
         PYGR+cj7oiNJx+S51yUOZAPufKDL53k2ervHrkp9amDvs+V5sTg3ZHxHQw533k7ztxhb
         GdsF7wkt4ziLw61sewn2dqEQqByJe2WNJubdjf2MyBf/NoqQRSHsEuLvpuWR7iLvn//B
         rQJEcn+K8mvv9Osz/TAQe3HOF0Y3PSaWVvuQB3Q7LbNJwMI7Hci+s9RkjAg1PwsQBpF3
         dJ+Q==
X-Gm-Message-State: AGi0PuZz9lFu5vr39kTKSnyK+wpRtmsktmnNzh4zP3MYcbhNbp9a+cPf
        Iho2QVkOxJU24diy6jR8iA9BsUkaxwJ5kbPm10YFjdDUW4vLii8AwfGXv4lRTaqQ4GupoZqfMYk
        v//gXSSv0Z2AEnRk+PTAe2EIUOzPQ+BauSw==
X-Received: by 2002:a05:600c:24e:: with SMTP id 14mr1035592wmj.62.1586208892453;
        Mon, 06 Apr 2020 14:34:52 -0700 (PDT)
X-Google-Smtp-Source: APiQypLHlC2n03+GN3TkoQMJkZiKiJsJtlQihSdECc8VmU6MYBk5RPyGnEo0jVCg7ih0qinNIwtYtg==
X-Received: by 2002:a05:600c:24e:: with SMTP id 14mr1035577wmj.62.1586208892234;
        Mon, 06 Apr 2020 14:34:52 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id n6sm1476779wrs.81.2020.04.06.14.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:34:51 -0700 (PDT)
Date:   Mon, 6 Apr 2020 17:34:50 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 12/12] mellanox: switch to virtio_legacy_init/size
Message-ID: <20200406210108.148131-13-mst@redhat.com>
References: <20200406210108.148131-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406210108.148131-1-mst@redhat.com>
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

