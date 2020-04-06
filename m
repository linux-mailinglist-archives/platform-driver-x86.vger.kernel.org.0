Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7F55619FFDB
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Apr 2020 23:03:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726695AbgDFVC1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Apr 2020 17:02:27 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:55871 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726393AbgDFVCY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Apr 2020 17:02:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586206943;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=c0TsndpJVTVi+maigb4wqF83+v7IC6vuTnjCeLiosRo=;
        b=NFSSmi+/cfeX8LSNJYZoRa01FAfMatZ9O5vahKxXEJcFYeSnGt1XsL9B/MLBbGMnBxoU5M
        FemcW1v28pQbHUwkEBKv9lIz4s8CChiRRwSGtVvj5al1Lb+agXVrAuhoutng32gLoi3DAV
        pyerZBJPnhcODbS5Uq1Dcjl3WFKalXM=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-SLiKaQSbPlm2mw31XQ-q0w-1; Mon, 06 Apr 2020 17:02:21 -0400
X-MC-Unique: SLiKaQSbPlm2mw31XQ-q0w-1
Received: by mail-wr1-f71.google.com with SMTP id c8so512931wru.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Apr 2020 14:02:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=c0TsndpJVTVi+maigb4wqF83+v7IC6vuTnjCeLiosRo=;
        b=YupkcIHsdkR3y5N4wBdrHaO67ccYWSSo12cyVupA7FoNusm7lgm8Wj+i+7fiEgQoEA
         AWSCjH0pYkIkmf8guJ7rC+jt/ZyqaFbKK0tnBE1VIyl0ncbGIOPfypSb2Yo/r30FmPXx
         KgGnGFuQHkh6R10gVGGhBi/rv/FbjY3wT24yUf/21cgZyTyovzQFrR2NKrxq6nVck1j1
         fuwHO/seH0o64Do6PxaoIDyc2DjWBfB2VlFCGgalpihOTmH2kXfUgbzScLE20l4pS3+5
         S3OcutVK/20Y17dw/PjkXilRJQMaHQxV16S3yXkGsuSNFRsNJRsDmnXylifIb9IM1oFy
         jtPg==
X-Gm-Message-State: AGi0PuYXAyf4TmXNQ5TB/ScFf+zD13lYiUx3IR7iMdHzksHjmzRvDwcE
        2KhwxvtJ+ci2DrQRLhffxMPNa3pUx8owq48UzR8Yi7cOFIWVM8UrKfouX0MjbLExvOkjQWNNS01
        0OxZI5O2Cy2ScsAh/L2QlQAOxOQ3apb70bA==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr1140873wrx.395.1586206940298;
        Mon, 06 Apr 2020 14:02:20 -0700 (PDT)
X-Google-Smtp-Source: APiQypKIrPYFPbzjPlWje3cehQSPwSKmpRF4J8aJ0cjsFyb5G1zSVTqx+JyfqOMTdrfebQUwk8AetQ==
X-Received: by 2002:a05:6000:105:: with SMTP id o5mr1140841wrx.395.1586206939931;
        Mon, 06 Apr 2020 14:02:19 -0700 (PDT)
Received: from redhat.com (bzq-79-176-51-222.red.bezeqint.net. [79.176.51.222])
        by smtp.gmail.com with ESMTPSA id z3sm922928wma.22.2020.04.06.14.02.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2020 14:02:18 -0700 (PDT)
Date:   Mon, 6 Apr 2020 17:02:17 -0400
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

