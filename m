Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 6DECF23CCF0
	for <lists+platform-driver-x86@lfdr.de>; Wed,  5 Aug 2020 19:12:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728367AbgHERMV (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 5 Aug 2020 13:12:21 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:28985 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728558AbgHERKM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 5 Aug 2020 13:10:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1596647410;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=E6FiLGXEyromLE+NGBVYxEgCEa70YCiNICtsxGYJF7c=;
        b=QP8yJgvdDNr2BbylYdG1PVtVCpuYa0Q+HFe5SOoF094poxjRxn9b1O+c8FYHGS743Zdy9+
        uJjaQO1aecXSb81dLVhuy0x1Q2aTO4SQTIFF1vE2Rv5LhJxCdBQ6jbBuaNfBJlivQ+Y4qg
        luX2IAfuaAR2q/6azNSeOsuPW7l6EpM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-u5gX1rkzMM6JvwLSpYxHVA-1; Wed, 05 Aug 2020 09:44:12 -0400
X-MC-Unique: u5gX1rkzMM6JvwLSpYxHVA-1
Received: by mail-wr1-f70.google.com with SMTP id d6so12035183wrv.23
        for <platform-driver-x86@vger.kernel.org>; Wed, 05 Aug 2020 06:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=E6FiLGXEyromLE+NGBVYxEgCEa70YCiNICtsxGYJF7c=;
        b=jJ9SZ2ZJQ14Ao6y8fVLCt0WlMTbOHPuxF0CUNr35LpwcHeEboL42DkVFA3x1e0nDus
         Kd515ltN8hmg+1SJEbNt2HFx4XA9gkqKFxhuQfQzqNJ5soNTuxx45/b4RJiBbRp9ib2v
         L0oXlwUh2+uXGPPuUS77oIUXgIlcwxYxd1xxNieecZjoqD5xKZ97eJwpRi99FS6gr1DD
         WBb32KFqcTthcYJQIAdR+Qqs8YtJDZR1xJC4ZRyh+MdqnqFZ4V2Jg7eVM29V4mQj8Bus
         Gghlpja8GJkfw6zB/GS7tu7nBvadOOR9GIzPMKqpjURro1IyGH1y0bjLZK+VRRQOI32e
         qyWg==
X-Gm-Message-State: AOAM532O6e0rPvgilBAu76GjtHj6lpbIctWACjj42rMXkakk4D/ksV10
        Qe9kC1K6hERcklbDig0JQ43b7GHnNeyC9jh3Fk8+IAoNIzpwlrgrEfBGVZfmqNPWZ6S4su/d/LX
        m5aUK6toaFYB3h+F3cUr/a7F3u/e1PzVIKg==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr2747075wrn.28.1596635048496;
        Wed, 05 Aug 2020 06:44:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQI4FlgMw3rbHxklSaF89feIW66tgc8CCicGOY4FAHT13RLsJQet+pRNk6EzHyh659HRSHmQ==
X-Received: by 2002:adf:ec04:: with SMTP id x4mr2747025wrn.28.1596635047405;
        Wed, 05 Aug 2020 06:44:07 -0700 (PDT)
Received: from redhat.com ([192.117.173.58])
        by smtp.gmail.com with ESMTPSA id t13sm2717293wru.65.2020.08.05.06.44.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2020 06:44:06 -0700 (PDT)
Date:   Wed, 5 Aug 2020 09:44:04 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Cornelia Huck <cohuck@redhat.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Vadim Pasternak <vadimp@mellanox.com>,
        platform-driver-x86@vger.kernel.org
Subject: [PATCH v3 18/38] mlxbf-tmfifo: sparse tags for config access
Message-ID: <20200805134226.1106164-19-mst@redhat.com>
References: <20200805134226.1106164-1-mst@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200805134226.1106164-1-mst@redhat.com>
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
Acked-by: Cornelia Huck <cohuck@redhat.com>
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

