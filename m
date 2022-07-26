Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 59B83580C68
	for <lists+platform-driver-x86@lfdr.de>; Tue, 26 Jul 2022 09:22:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237828AbiGZHWl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 26 Jul 2022 03:22:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237607AbiGZHWi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 26 Jul 2022 03:22:38 -0400
Received: from out30-44.freemail.mail.aliyun.com (out30-44.freemail.mail.aliyun.com [115.124.30.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3B3A13F15;
        Tue, 26 Jul 2022 00:22:35 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R991e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046049;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=37;SR=0;TI=SMTPD_---0VKUN6Jv_1658820149;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0VKUN6Jv_1658820149)
          by smtp.aliyun-inc.com;
          Tue, 26 Jul 2022 15:22:30 +0800
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
Subject: [PATCH v13 02/42] virtio: struct virtio_config_ops add callbacks for queue_reset
Date:   Tue, 26 Jul 2022 15:21:45 +0800
Message-Id: <20220726072225.19884-3-xuanzhuo@linux.alibaba.com>
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

reset can be divided into the following four steps (example):
 1. transport: notify the device to reset the queue
 2. vring:     recycle the buffer submitted
 3. vring:     reset/resize the vring (may re-alloc)
 4. transport: mmap vring to device, and enable the queue

In order to support queue reset, add two callbacks in struct
virtio_config_ops to implement steps 1 and 4.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 include/linux/virtio_config.h | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/include/linux/virtio_config.h b/include/linux/virtio_config.h
index b47c2e7ed0ee..36ec7be1f480 100644
--- a/include/linux/virtio_config.h
+++ b/include/linux/virtio_config.h
@@ -78,6 +78,18 @@ struct virtio_shm_region {
  * @set_vq_affinity: set the affinity for a virtqueue (optional).
  * @get_vq_affinity: get the affinity for a virtqueue (optional).
  * @get_shm_region: get a shared memory region based on the index.
+ * @disable_vq_and_reset: reset a queue individually (optional).
+ *	vq: the virtqueue
+ *	Returns 0 on success or error status
+ *	disable_vq_and_reset will guarantee that the callbacks are disabled and
+ *	synchronized.
+ *	Except for the callback, the caller should guarantee that the vring is
+ *	not accessed by any functions of virtqueue.
+ * @enable_vq_after_reset: enable a reset queue
+ *	vq: the virtqueue
+ *	Returns 0 on success or error status
+ *	If disable_vq_and_reset is set, then enable_vq_after_reset must also be
+ *	set.
  */
 typedef void vq_callback_t(struct virtqueue *);
 struct virtio_config_ops {
@@ -104,6 +116,8 @@ struct virtio_config_ops {
 			int index);
 	bool (*get_shm_region)(struct virtio_device *vdev,
 			       struct virtio_shm_region *region, u8 id);
+	int (*disable_vq_and_reset)(struct virtqueue *vq);
+	int (*enable_vq_after_reset)(struct virtqueue *vq);
 };
 
 /* If driver didn't advertise the feature, it will never appear. */
-- 
2.31.0

