Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9AAE323AEBC
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 23:01:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729183AbgHCVAK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 17:00:10 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:37592 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729171AbgHCVAK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 17:00:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596488408;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=8bq9rXUCTGSN68YwCNXz85TMhgq9vmhl8kPAax2zSMY=;
        b=Pl4VfI16ISJzhEc6tDzwQP33J/CY/u7EwEGFQ4pcLnq3oQL9higv6IontbLeJVyzmLuIju
        8GQfNLMFZCmhSvpoiBxP1Tv5pGllMYnopeIKvrn3RreNo2aeqltXEUbENFZAkfvFOqTrzC
        nmUb7iLbxdJ3PeuWZOwRmjdAitDkD5g=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-333-UUoyqmd9M-6xgOkhucGhtg-1; Mon, 03 Aug 2020 17:00:07 -0400
X-MC-Unique: UUoyqmd9M-6xgOkhucGhtg-1
Received: by mail-qt1-f200.google.com with SMTP id d24so20336334qtg.23
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2020 14:00:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=8bq9rXUCTGSN68YwCNXz85TMhgq9vmhl8kPAax2zSMY=;
        b=jdVyatBME6stdrRU0pd9FOcBauxdHlsT+2Y0jLyqKEIMJoI8tls5p2rGXuK6Eh/W7o
         AjX3d9wRfg4yongTg781qck57tu45hJFMIh6e5l0GJR3LD5zK4SZEL8vfbbvjFAxpK2m
         dmjECJcpKwLPTFhjHdY4yk/ZivxPQl8M8QLiBfuRoMPYQzTJNfoRowul0DBDpQZCKGfC
         Di/SaD4mVE/imZ7glR66n/dhurmR3a6RkQ43eNI8jFPnsOrHlWoMI/ebiFuFCzf97Su0
         e0WkFR+tauNL+NI5W8a3MaU3KE/h+JiD3z+scqKa3vjnQdK3uWgDN0jlZXIM3m/bcVsw
         9tKA==
X-Gm-Message-State: AOAM532IiWHxfI8g1FD2pxKcHUEyiTAhx0WExzdQIH2mcdiSHdhxqSKv
        7D47OmFm6nfEadPxAelAPeW/dagIQ98T6WdlRq99iIB0WhrNpVA0cxOczpsP8ylO6Pfk7w0fFci
        NMzO+S/dDk7vs96H4Hpqqn6LpF7ie8Na4Qw==
X-Received: by 2002:a05:620a:1034:: with SMTP id a20mr18018698qkk.88.1596488406606;
        Mon, 03 Aug 2020 14:00:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzZ4xACpDy2QuhLtURPr5OaRyOxNfQsRP3NRt54g2pzfNFf4aofKomQafv01c0VtrayvMamMQ==
X-Received: by 2002:a05:620a:1034:: with SMTP id a20mr18018682qkk.88.1596488406387;
        Mon, 03 Aug 2020 14:00:06 -0700 (PDT)
Received: from redhat.com (bzq-79-177-102-128.red.bezeqint.net. [79.177.102.128])
        by smtp.gmail.com with ESMTPSA id m15sm22165480qta.6.2020.08.03.14.00.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2020 14:00:05 -0700 (PDT)
Date:   Mon, 3 Aug 2020 17:00:01 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org,
        Jason Wang <jasowang@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v2 18/24] mlxbf-tmfifo: sparse tags for config access
Message-ID: <20200803205814.540410-19-mst@redhat.com>
References: <20200803205814.540410-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200803205814.540410-1-mst@redhat.com>
X-Mailer: git-send-email 2.27.0.106.g8ac3dc51b1
X-Mutt-Fcc: =sent
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

mlxbf-tmfifo accesses config space using native types -
which works for it since the legacy virtio native types.

This will break if it ever needs to support modern virtio,
so with new tags previously introduced for virtio net config,
sparse now warns for this in drivers.

Since this is a legacy only device, fix it up using
virtio_legacy_is_little_endian for now.

No functional changes.

Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 5739a9669b29..bbc4e71a16ff 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -625,7 +625,10 @@ static void mlxbf_tmfifo_rxtx_header(struct mlxbf_tmfifo_vring *vring,
 			vdev_id = VIRTIO_ID_NET;
 			hdr_len = sizeof(struct virtio_net_hdr);
 			config = &fifo->vdev[vdev_id]->config.net;
-			if (ntohs(hdr.len) > config->mtu +
+			/* A legacy-only interface for now. */
+			if (ntohs(hdr.len) >
+			    __virtio16_to_cpu(virtio_legacy_is_little_endian(),
+					      config->mtu) +
 			    MLXBF_TMFIFO_NET_L2_OVERHEAD)
 				return;
 		} else {
@@ -1231,8 +1234,12 @@ static int mlxbf_tmfifo_probe(struct platform_device *pdev)
 
 	/* Create the network vdev. */
 	memset(&net_config, 0, sizeof(net_config));
-	net_config.mtu = ETH_DATA_LEN;
-	net_config.status = VIRTIO_NET_S_LINK_UP;
+
+	/* A legacy-only interface for now. */
+	net_config.mtu = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
+					   ETH_DATA_LEN);
+	net_config.status = __cpu_to_virtio16(virtio_legacy_is_little_endian(),
+					      VIRTIO_NET_S_LINK_UP);
 	mlxbf_tmfifo_get_cfg_mac(net_config.mac);
 	rc = mlxbf_tmfifo_create_vdev(dev, fifo, VIRTIO_ID_NET,
 				      MLXBF_TMFIFO_NET_FEATURES, &net_config,
-- 
MST

