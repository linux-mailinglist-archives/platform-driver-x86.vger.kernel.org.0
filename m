Return-Path: <platform-driver-x86+bounces-2740-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A78A8A05FD
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Apr 2024 04:36:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id C50AE28489F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 11 Apr 2024 02:36:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7E29313B7A3;
	Thu, 11 Apr 2024 02:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VLYh8seB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADF5713AD23;
	Thu, 11 Apr 2024 02:35:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712802946; cv=none; b=JgVBWGblzmh+yBW69O9narqwKnUvYjWVrj5iuVe4jl23yXv3WyrFFYvSIC8HbnWiSMB39W5Ribt8CemX5LZzfuWIwanCqIQrCHM0/748JU0GlZaTMQMOsgXMQQOXtPVks7s9sajzAuSnj1lj9ngFX73bzbAXJBllOHEQeCtonmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712802946; c=relaxed/simple;
	bh=PuvC33TVS1qm4PU5j0dcV1yhW4mEmTgl8nq0bFS0dJ4=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=KJDG6IQp81HI0rHQLJ15FbbxuTsKQNtE8bLC6o/rPn5qg51p4Sc4T1kwrBQdf9dsu7NT2Bj/UL6Q5BCYujvQ0saj9SNE284uYc8e9Zyl6SEHMrJBTieveN2AxzNcOSPgRYzWWN/pDaerUGOE6+fMtJ067su703yGnUYZM/3Oj6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VLYh8seB; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1712802936; h=From:To:Subject:Date:Message-Id:MIME-Version:Content-Type;
	bh=Zq5ZIs1lycb8+fRPLrFWO3fWSd1JFqpmuShYk0Wcu0s=;
	b=VLYh8seBF3rfI524Rd/2L8V5XB3hfXE2O1773z7Z6C8ws1XagyhFDSgE2JkwzNJjDZAKPMHIMdL7SFVMw2DOmmvJIga4mHbUGJfzFxCM93T8CDYUuYiO+LbXWkGBgTjb+vdzMUqKlq1kuS2kD6FreNybzoIL4PIYoNAFP7HeHVM=
X-Alimail-AntiSpam:AC=PASS;BC=-1|-1;BR=01201311R331e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=ay29a033018046060;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=26;SR=0;TI=SMTPD_---0W4JWqPJ_1712802933;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0W4JWqPJ_1712802933)
          by smtp.aliyun-inc.com;
          Thu, 11 Apr 2024 10:35:34 +0800
From: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To: virtualization@lists.linux.dev
Cc: Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Vadim Pasternak <vadimp@nvidia.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Cornelia Huck <cohuck@redhat.com>,
	Halil Pasic <pasic@linux.ibm.com>,
	Eric Farman <farman@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
	linux-um@lists.infradead.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-s390@vger.kernel.org,
	kvm@vger.kernel.org
Subject: [PATCH vhost v8 5/6] virtio: vring_new_virtqueue(): pass struct instead of multi parameters
Date: Thu, 11 Apr 2024 10:35:27 +0800
Message-Id: <20240411023528.10914-6-xuanzhuo@linux.alibaba.com>
X-Mailer: git-send-email 2.32.0.3.g01195cf9f
In-Reply-To: <20240411023528.10914-1-xuanzhuo@linux.alibaba.com>
References: <20240411023528.10914-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Git-Hash: d277a0b9519b
Content-Transfer-Encoding: 8bit

Now, we pass multi parameters to vring_new_virtqueue. These parameters
may from transport or from driver.

vring_new_virtqueue is called by many places.
Every time, we try to add a new parameter, that is difficult.

If parameters from the driver, that should directly be passed to vring.
Then the vring can access the config from driver directly.

If parameters from the transport, we squish the parameters to a
structure. That will be helpful to add new parameter.

Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Acked-by: Jason Wang <jasowang@redhat.com>
---
 drivers/platform/mellanox/mlxbf-tmfifo.c | 12 ++++---
 drivers/remoteproc/remoteproc_virtio.c   | 11 ++++---
 drivers/virtio/virtio_ring.c             | 29 +++++++++++-----
 include/linux/virtio_ring.h              | 42 +++++++++++++++++++-----
 tools/virtio/virtio_test.c               |  4 +--
 tools/virtio/vringh_test.c               | 28 ++++++++--------
 6 files changed, 84 insertions(+), 42 deletions(-)

diff --git a/drivers/platform/mellanox/mlxbf-tmfifo.c b/drivers/platform/mellanox/mlxbf-tmfifo.c
index 4252388f52a2..d2e871fad8b4 100644
--- a/drivers/platform/mellanox/mlxbf-tmfifo.c
+++ b/drivers/platform/mellanox/mlxbf-tmfifo.c
@@ -1059,6 +1059,7 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
 					struct virtio_vq_config *cfg)
 {
 	struct mlxbf_tmfifo_vdev *tm_vdev = mlxbf_vdev_to_tmfifo(vdev);
+	struct vq_transport_config tp_cfg = {};
 	struct virtqueue **vqs = cfg->vqs;
 	struct mlxbf_tmfifo_vring *vring;
 	unsigned int nvqs = cfg->nvqs;
@@ -1078,10 +1079,13 @@ static int mlxbf_tmfifo_virtio_find_vqs(struct virtio_device *vdev,
 		/* zero vring */
 		size = vring_size(vring->num, vring->align);
 		memset(vring->va, 0, size);
-		vq = vring_new_virtqueue(i, vring->num, vring->align, vdev,
-					 false, false, vring->va,
-					 mlxbf_tmfifo_virtio_notify,
-					 cfg->callbacks[i], cfg->names[i]);
+
+		tp_cfg.num = vring->num;
+		tp_cfg.vring_align = vring->align;
+		tp_cfg.weak_barriers = false;
+		tp_cfg.notify = mlxbf_tmfifo_virtio_notify;
+
+		vq = vring_new_virtqueue(vdev, i, vring->va, &tp_cfg, cfg);
 		if (!vq) {
 			dev_err(&vdev->dev, "vring_new_virtqueue failed\n");
 			ret = -ENOMEM;
diff --git a/drivers/remoteproc/remoteproc_virtio.c b/drivers/remoteproc/remoteproc_virtio.c
index bbde11287f8a..a819bcd39dde 100644
--- a/drivers/remoteproc/remoteproc_virtio.c
+++ b/drivers/remoteproc/remoteproc_virtio.c
@@ -106,6 +106,7 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 {
 	struct rproc_vdev *rvdev = vdev_to_rvdev(vdev);
 	struct rproc *rproc = vdev_to_rproc(vdev);
+	struct vq_transport_config tp_cfg = {};
 	struct device *dev = &rproc->dev;
 	struct rproc_mem_entry *mem;
 	struct rproc_vring *rvring;
@@ -135,14 +136,16 @@ static struct virtqueue *rp_find_vq(struct virtio_device *vdev,
 	dev_dbg(dev, "vring%d: va %pK qsz %d notifyid %d\n",
 		id, addr, num, rvring->notifyid);
 
+	tp_cfg.num = num;
+	tp_cfg.vring_align = rvring->align;
+	tp_cfg.weak_barriers = false;
+	tp_cfg.notify = rproc_virtio_notify;
+
 	/*
 	 * Create the new vq, and tell virtio we're not interested in
 	 * the 'weak' smp barriers, since we're talking with a real device.
 	 */
-	vq = vring_new_virtqueue(id, num, rvring->align, vdev, false,
-				 cfg->ctx ? cfg->ctx[id] : false,
-				 addr, rproc_virtio_notify, cfg->callbacks[id],
-				 cfg->names[id]);
+	vq = vring_new_virtqueue(vdev, id, addr, &tp_cfg, cfg);
 	if (!vq) {
 		dev_err(dev, "vring_new_virtqueue %s failed\n", cfg->names[id]);
 		rproc_free_vring(rvring);
diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
index b0e19a84644c..20e5e4779f36 100644
--- a/drivers/virtio/virtio_ring.c
+++ b/drivers/virtio/virtio_ring.c
@@ -2835,18 +2835,29 @@ int virtqueue_reset(struct virtqueue *_vq,
 EXPORT_SYMBOL_GPL(virtqueue_reset);
 
 /* Only available for split ring */
-struct virtqueue *vring_new_virtqueue(unsigned int index,
-				      unsigned int num,
-				      unsigned int vring_align,
-				      struct virtio_device *vdev,
-				      bool weak_barriers,
-				      bool context,
+struct virtqueue *vring_new_virtqueue(struct virtio_device *vdev,
+				      unsigned int index,
 				      void *pages,
-				      bool (*notify)(struct virtqueue *vq),
-				      void (*callback)(struct virtqueue *vq),
-				      const char *name)
+				      struct vq_transport_config *tp_cfg,
+				      struct virtio_vq_config *cfg)
 {
 	struct vring_virtqueue_split vring_split = {};
+	unsigned int num;
+	unsigned int vring_align;
+	bool weak_barriers;
+	bool context;
+	bool (*notify)(struct virtqueue *_);
+	void (*callback)(struct virtqueue *_);
+	const char *name;
+
+	num            = tp_cfg->num;
+	vring_align    = tp_cfg->vring_align;
+	weak_barriers  = tp_cfg->weak_barriers;
+	notify         = tp_cfg->notify;
+
+	name     = cfg->names[index];
+	callback = cfg->callbacks[index];
+	context  = cfg->ctx ? cfg->ctx[index] : false;
 
 	if (virtio_has_feature(vdev, VIRTIO_F_RING_PACKED))
 		return NULL;
diff --git a/include/linux/virtio_ring.h b/include/linux/virtio_ring.h
index 0a81f7f025ce..ed005dc65cc0 100644
--- a/include/linux/virtio_ring.h
+++ b/include/linux/virtio_ring.h
@@ -96,16 +96,40 @@ struct virtqueue *vring_create_virtqueue(struct virtio_device *vdev,
  * Creates a virtqueue with a standard layout but a caller-allocated
  * ring.
  */
-struct virtqueue *vring_new_virtqueue(unsigned int index,
-				      unsigned int num,
-				      unsigned int vring_align,
-				      struct virtio_device *vdev,
-				      bool weak_barriers,
-				      bool ctx,
+struct virtqueue *vring_new_virtqueue(struct virtio_device *vdev,
+				      unsigned int index,
 				      void *pages,
-				      bool (*notify)(struct virtqueue *vq),
-				      void (*callback)(struct virtqueue *vq),
-				      const char *name);
+				      struct vq_transport_config *tp_cfg,
+				      struct virtio_vq_config *cfg);
+
+static inline struct virtqueue *vring_new_virtqueue_one(unsigned int index,
+							unsigned int num,
+							unsigned int vring_align,
+							struct virtio_device *vdev,
+							bool weak_barriers,
+							bool context,
+							void *pages,
+							bool (*notify)(struct virtqueue *vq),
+							void (*callback)(struct virtqueue *vq),
+							const char *name)
+{
+	struct vq_transport_config tp_cfg = {};
+	struct virtio_vq_config cfg = {};
+	vq_callback_t *callbacks[] = { callback };
+	const char *names[] = { name };
+
+	tp_cfg.num = num;
+	tp_cfg.vring_align = vring_align;
+	tp_cfg.weak_barriers = weak_barriers;
+	tp_cfg.notify = notify;
+
+	cfg.nvqs = 1;
+	cfg.callbacks = callbacks;
+	cfg.names = names;
+	cfg.ctx = &context;
+
+	return vring_new_virtqueue(vdev, index, pages, &tp_cfg, &cfg);
+}
 
 /*
  * Destroys a virtqueue.  If created with vring_create_virtqueue, this
diff --git a/tools/virtio/virtio_test.c b/tools/virtio/virtio_test.c
index 028f54e6854a..e41300d71d5e 100644
--- a/tools/virtio/virtio_test.c
+++ b/tools/virtio/virtio_test.c
@@ -102,8 +102,8 @@ static void vq_reset(struct vq_info *info, int num, struct virtio_device *vdev)
 
 	memset(info->ring, 0, vring_size(num, 4096));
 	vring_init(&info->vring, num, info->ring, 4096);
-	info->vq = vring_new_virtqueue(info->idx, num, 4096, vdev, true, false,
-				       info->ring, vq_notify, vq_callback, "test");
+	info->vq = vring_new_virtqueue_one(info->idx, num, 4096, vdev, true, false,
+					   info->ring, vq_notify, vq_callback, "test");
 	assert(info->vq);
 	info->vq->priv = info;
 }
diff --git a/tools/virtio/vringh_test.c b/tools/virtio/vringh_test.c
index 98ff808d6f0c..040689111584 100644
--- a/tools/virtio/vringh_test.c
+++ b/tools/virtio/vringh_test.c
@@ -316,11 +316,11 @@ static int parallel_test(u64 features,
 		if (sched_setaffinity(getpid(), sizeof(cpu_set), &cpu_set))
 			err(1, "Could not set affinity to cpu %u", first_cpu);
 
-		vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &gvdev.vdev, true,
-					 false, guest_map,
-					 fast_vringh ? no_notify_host
-					 : parallel_notify_host,
-					 never_callback_guest, "guest vq");
+		vq = vring_new_virtqueue_one(0, RINGSIZE, ALIGN, &gvdev.vdev, true,
+					     false, guest_map,
+					     fast_vringh ? no_notify_host
+					     : parallel_notify_host,
+					     never_callback_guest, "guest vq");
 
 		/* Don't kfree indirects. */
 		__kfree_ignore_start = indirects;
@@ -485,10 +485,10 @@ int main(int argc, char *argv[])
 	memset(__user_addr_min, 0, vring_size(RINGSIZE, ALIGN));
 
 	/* Set up guest side. */
-	vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true, false,
-				 __user_addr_min,
-				 never_notify_host, never_callback_guest,
-				 "guest vq");
+	vq = vring_new_virtqueue_one(0, RINGSIZE, ALIGN, &vdev, true, false,
+				     __user_addr_min,
+				     never_notify_host, never_callback_guest,
+				     "guest vq");
 
 	/* Set up host side. */
 	vring_init(&vrh.vring, RINGSIZE, __user_addr_min, ALIGN);
@@ -668,11 +668,11 @@ int main(int argc, char *argv[])
 
 		/* Force creation of direct, which we modify. */
 		__virtio_clear_bit(&vdev, VIRTIO_RING_F_INDIRECT_DESC);
-		vq = vring_new_virtqueue(0, RINGSIZE, ALIGN, &vdev, true,
-					 false, __user_addr_min,
-					 never_notify_host,
-					 never_callback_guest,
-					 "guest vq");
+		vq = vring_new_virtqueue_one(0, RINGSIZE, ALIGN, &vdev, true,
+					     false, __user_addr_min,
+					     never_notify_host,
+					     never_callback_guest,
+					     "guest vq");
 
 		sg_init_table(guest_sg, 4);
 		sg_set_buf(&guest_sg[0], d, sizeof(*d)*2);
-- 
2.32.0.3.g01195cf9f


