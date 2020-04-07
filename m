Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A157C1A040D
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 Apr 2020 03:08:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726792AbgDGBIN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 21:08:13 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37818 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726725AbgDGBIL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 21:08:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586221690;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=tGzj3Xy5+PE0S44YeXdrCLBeKxIojEvp8oKLEKl/XHc=;
        b=Wji0lAKLuqUKZf7eaP/iGsotMviwviA9bWeaqNamYtc1lXC6IQSNb6nbp1wLqWYyi5Uplh
        Is+4ZFkEzwwel/EMLsDEpNyINAOJxdFGGiySYXSy0jZz79BCPajtz//ts6uBXZKjKP6DRE
        9KpmZZV3J/iY1wTnKNQa2ekTKtR/sv4=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-361-ut93Nw9bNoie_aued70LdQ-1; Mon, 06 Apr 2020 21:08:06 -0400
X-MC-Unique: ut93Nw9bNoie_aued70LdQ-1
Received: by mail-wm1-f70.google.com with SMTP id o5so8054wmo.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 18:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=tGzj3Xy5+PE0S44YeXdrCLBeKxIojEvp8oKLEKl/XHc=;
        b=VSM0mx8/0wycLACz98YHBXekms4TgUdU+BrJE4p3CFau258ko0ozS7HLqk1GJflJmB
         lqm5duKL+AntQ0sULAfsQcJmJtpUwh/1yxwomWIcRswdUMga8uYgjFBIM34hKdpJrs6E
         kZLea4vlTvhErNHS6IDBB63Xcu3S87edTLCExgzd+fzJEHhLrm+b26WrBA3Y4LnG3786
         dbtX3hSD9q/jgFRQpb1y7Ig/tSjPeBegbsBcDA30aeyqvA0jYJFWRv20jg7Nx+Fr6O4X
         wVtaWDLKfZmeDviaJrhpHzRaECAhISoA0JhJtUJsCdESJnAMCNQJnHqPbcbEQcLH5/e1
         VAUw==
X-Gm-Message-State: AGi0PuZQr+YMLzZXAxfoX7esioWAjXs/UpW/hZaSyQMEudrsiFbpJ4j5
        cqNre5nhpe4yYuIUVVOquxPzrsh3StghzD7KFxkn1AZf/hZMkZJomomLRRIzGixOhPiAzJwit55
        58FQofJylj28alU1aYCFo7ffp5wjBvIJmfw==
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr1944492wrw.87.1586221685579;
        Mon, 06 Apr 2020 18:08:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypJOYPrm0BpL822A167zoqe2yatDB+PJHHZa0T7EJnIUzZJgCtY2T5VptGribbSNFHHfdJHOOA==
X-Received: by 2002:a5d:6a43:: with SMTP id t3mr1944479wrw.87.1586221685374;
        Mon, 06 Apr 2020 18:08:05 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id n11sm31357283wrg.72.2020.04.06.18.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 18:08:04 -0700 (PDT)
Date:   Mon, 6 Apr 2020 21:08:03 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v7 16/19] mellanox: switch to virtio_legacy_init/size
Message-ID: <20200407010700.446571-17-mst@redhat.com>
References: <20200407010700.446571-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200407010700.446571-1-mst@redhat.com>
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

