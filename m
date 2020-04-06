Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3FD361A011F
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Apr 2020 00:27:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726608AbgDFW07 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 18:26:59 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:52911 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726594AbgDFW06 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 18:26:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586212018;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=nS0LENPibu3BN8DvjYKOeyJ1JVPN+T87e7mUOYlbPgs=;
        b=gPJN2UuyawIQwYysGB4G+/XNbxgHX3QfAwWJ6L8dNdvo2lFyorKfcpsO3fD0sCgdIKnsw+
        auvtoDu1BiWW4X8Ykl76arwbzAfu1d4ziGSytauKTTBga7gHSxPm/yyTVLfwXybnJp4j1r
        EHyxYz9uajjp7m1z999ZK4cK8FuYEIs=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-olnOckcZNA6izYiP_xOE5Q-1; Mon, 06 Apr 2020 18:26:56 -0400
X-MC-Unique: olnOckcZNA6izYiP_xOE5Q-1
Received: by mail-wr1-f72.google.com with SMTP id d1so642659wru.15
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 15:26:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nS0LENPibu3BN8DvjYKOeyJ1JVPN+T87e7mUOYlbPgs=;
        b=aC6UAQApJ9mmTQLtswNmon6EP1Lq98D164AuDnXGDi82Bb7SQKaC5yLDdt1tIwO5Uf
         SKnDTUAxEpxKa+QL+/oZ2ObLOo4ocRlN2ChDq75iz0XVb/tzQi02m6AKzWx2SS7qrSV9
         YxeDzzCYbYb3r0D/X7Ct1rW+2W73+ldczsJ1DdM5y+blVrL3aRgIi1vpghrqMpH2dl+X
         xjV/fkvJokt0FwE6X6c7/0cPnkFf9QVXv87y96Rsuz+YZM0P9UgSgK0mffT7fZP8WDDz
         exdBQi0wHWD+jSV7D6PYAzkTAL15g5TrdQf92bEF2/PpeKd9iH0QZU6uklQ3h0GO5AY0
         obEw==
X-Gm-Message-State: AGi0PuZtEz0Yxy9JU4NDmwrTnQzuDrRoLRBltiEnJjYod5+iVQnEfX2q
        lmg0nfPLmVa1B2rnW7bIRoTXSTlZmD/rgqIGrrA+d5sI7GXeHo1So4DVS+hwhMJY8Lv8GHhe4No
        H1Ow2TCz9AQhUlDOs1hRjVUXOIP9XlR1VFA==
X-Received: by 2002:a5d:5688:: with SMTP id f8mr1451064wrv.245.1586212015143;
        Mon, 06 Apr 2020 15:26:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIHymMZRHj1Sm4dOx+tQ64Z7ASDaldjwKN9H1tQat8QPeUzMFWR6n70IbVTsuZ0VB+tk6gakg==
X-Received: by 2002:a5d:5688:: with SMTP id f8mr1451052wrv.245.1586212014946;
        Mon, 06 Apr 2020 15:26:54 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id p5sm2990935wrn.93.2020.04.06.15.26.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 15:26:54 -0700 (PDT)
Date:   Mon, 6 Apr 2020 18:26:53 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v6 12/12] mellanox: switch to virtio_legacy_init/size
Message-ID: <20200406222507.281867-13-mst@redhat.com>
References: <20200406222507.281867-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200406222507.281867-1-mst@redhat.com>
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

