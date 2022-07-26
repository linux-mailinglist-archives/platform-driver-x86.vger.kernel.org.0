Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C04B2580CCF
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Jul 2022 09:23:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbiGZHX0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 26 Jul 2022 03:23:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57582 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238089AbiGZHW7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jul 2022 03:22:59 -0400
Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CB6112B268;
        Tue, 26 Jul 2022 00:22:54 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R801e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046051;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=37;SR=0;TI=SMTPD_---0VKUOEem_1658820166;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0VKUOEem_1658820166)
          by smtp.aliyun-inc.com;
          Tue, 26 Jul 2022 15:22:47 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     virtualization@lists.linux-foundation.org
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Jason Wang <jasowang@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Eric Farman <farman@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
Subject: [PATCH v13 11/42] virtio_ring: split: extract the logic of alloc state and extra
Date:   Tue, 26 Jul 2022 15:21:54 +0800
Message-Id: <20220726072225.19884-12-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
References: <20220726072225.19884-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
X-Git-Hash: 19d2a6aae0b1
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Separate the logic of creating desc_state, desc_extra, and subsequent
patches will call it independently.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
---
 drivers/virtio/virtio_ring.c | 51 +++++++++++++++++++++++++-----------
 1 file changed, 35 insertions(+), 16 deletions(-)

diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index 3817520371ee..6c24b33ea186 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -212,6 +212,7 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 					       bool (*notify)(struct virtqueue *),
 					       void (*callback)(struct virtqueue *),
 					       const char *name);
+static struct vring_desc_extra *vring_alloc_desc_extra(unsigned int num);
 
 /*
  * Helpers.
@@ -947,6 +948,32 @@ static void *virtqueue_detach_unused_buf_split(struct virtqueue *_vq)
 	return NULL;
 }
 
+static int vring_alloc_state_extra_split(struct vring_virtqueue_split *vring_split)
+{
+	struct vring_desc_state_split *state;
+	struct vring_desc_extra *extra;
+	u32 num = vring_split->vring.num;
+
+	state = kmalloc_array(num, sizeof(struct vring_desc_state_split), GFP_KERNEL);
+	if (!state)
+		goto err_state;
+
+	extra = vring_alloc_desc_extra(num);
+	if (!extra)
+		goto err_extra;
+
+	memset(state, 0, num * sizeof(struct vring_desc_state_split));
+
+	vring_split->desc_state = state;
+	vring_split->desc_extra = extra;
+	return 0;
+
+err_extra:
+	kfree(state);
+err_state:
+	return -ENOMEM;
+}
+
 static void vring_free_split(struct vring_virtqueue_split *vring_split,
 			     struct virtio_device *vdev)
 {
@@ -2242,6 +2269,7 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 					       const char *name)
 {
 	struct vring_virtqueue *vq;
+	int err;
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return NULL;
@@ -2282,17 +2310,14 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 					vq->split.avail_flags_shadow);
 	}
 
-	vq->split.desc_state = kmalloc_array(vring_split->vring.num,
-			sizeof(struct vring_desc_state_split), GFP_KERNEL);
-	if (!vq->split.desc_state)
-		goto err_state;
-
-	vq->split.desc_extra = vring_alloc_desc_extra(vring_split->vring.num);
-	if (!vq->split.desc_extra)
-		goto err_extra;
+	err = vring_alloc_state_extra_split(vring_split);
+	if (err) {
+		kfree(vq);
+		return NULL;
+	}
 
-	memset(vq->split.desc_state, 0, vring_split->vring.num *
-			sizeof(struct vring_desc_state_split));
+	vq->split.desc_state = vring_split->desc_state;
+	vq->split.desc_extra = vring_split->desc_extra;
 
 	virtqueue_init(vq, vring_split->vring.num);
 
@@ -2300,12 +2325,6 @@ static struct virtqueue *__vring_new_virtqueue(unsigned int index,
 	list_add_tail(&vq->vq.list, &vdev->vqs);
 	spin_unlock(&vdev->vqs_list_lock);
 	return &vq->vq;
-
-err_extra:
-	kfree(vq->split.desc_state);
-err_state:
-	kfree(vq);
-	return NULL;
 }
 
 struct virtqueue *vring_create_virtqueue(
-- 
2.31.0

