Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D3A8D57C746
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 Jul 2022 11:15:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232862AbiGUJP3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 Jul 2022 05:15:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbiGUJP1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Jul 2022 05:15:27 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 9E9D113F91
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jul 2022 02:15:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1658394925;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PKluuKiO4nPSBSIDesJ3n2h9tlkDSbj9xB+0JNp3iV8=;
        b=KGFmuzMp2N+6Hm2oks30I2y2wkGaIq1UNpqGHBIoeBeCqYfaSrWKBKic9ScLya2E8bo5fY
        jGDULZ+Adj7Vrkbo0RH1M5QemP8+YUj4iW7Vwqvwz0gXDSoAKXdSqq7fWE1KUoh10cMJgS
        UlYywgOhWI5kHvl4Ns5+2selUdhXZDQ=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-551-Iu9uucylP66nz9lFMrCbqQ-1; Thu, 21 Jul 2022 05:15:24 -0400
X-MC-Unique: Iu9uucylP66nz9lFMrCbqQ-1
Received: by mail-pj1-f71.google.com with SMTP id b8-20020a17090a010800b001f1f4fc8178so540732pjb.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Jul 2022 02:15:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=PKluuKiO4nPSBSIDesJ3n2h9tlkDSbj9xB+0JNp3iV8=;
        b=q6kl871jBLhDxS3OXdlhyhylUG3LU2uCEzx8ZLYgAkoi6RXtHQYqiEbTT78dCxZmBR
         oqaOcDN98ZPkIZ4NApVbJy1dGG9mQvDcg4+Ub32/bbHpjAHDWzb5xQo09ocivNI4Qfd4
         hd2emjaLWgBBFhBfvaqB6D8bEhtq4Old5DZiBiZc7isRKs80dspjfo35YSWEMhQGCd8E
         AzS7OT0GeGWsQKXn9iU4pl2wpLNo9F4mtKiyoWYw+MPO8FaNRU0C5kzT779ytY/kHFMx
         WduW8cMtqrrRL8eX+/YjHF28XwaEGMzDQxLatZmi4bCmAcB3IW4m8xcsK1kFcTf55bmB
         vicQ==
X-Gm-Message-State: AJIora+rWwV0KVlMk1stK4isbvC15k6AQLc7M1lHPIVHH+QhDhaBeDuv
        w9dZTR4NJHEg4WUN/19RvUBSkQhAjxCSjYrX720bkkOu7wgW3pQPK5uEKaFemRQWUBOKhCEUkyr
        Shxtd+G01ADW8jaG3zkUNIm7NgzWnLoCTTw==
X-Received: by 2002:a65:42cc:0:b0:3a9:f71f:33f9 with SMTP id l12-20020a6542cc000000b003a9f71f33f9mr36793856pgp.391.1658394923337;
        Thu, 21 Jul 2022 02:15:23 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sgEw6i8bsR36Y8ICw8UMYj7/O02SOjej4lcmI0dJ1BovICarsVAAvAc6/oM7JcSOz5o3pTJA==
X-Received: by 2002:a65:42cc:0:b0:3a9:f71f:33f9 with SMTP id l12-20020a6542cc000000b003a9f71f33f9mr36793799pgp.391.1658394922973;
        Thu, 21 Jul 2022 02:15:22 -0700 (PDT)
Received: from [10.72.12.47] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id y20-20020a170902e19400b0016c35b21901sm1077023pla.195.2022.07.21.02.15.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Jul 2022 02:15:22 -0700 (PDT)
Message-ID: <efb6adca-a2a8-98d2-5604-5482d8be6ec9@redhat.com>
Date:   Thu, 21 Jul 2022 17:15:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v12 30/40] virtio_pci: support VIRTIO_F_RING_RESET
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
Cc:     Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
        "Michael S. Tsirkin" <mst@redhat.com>,
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
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
References: <20220720030436.79520-1-xuanzhuo@linux.alibaba.com>
 <20220720030436.79520-31-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220720030436.79520-31-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/7/20 11:04, Xuan Zhuo 写道:
> This patch implements virtio pci support for QUEUE RESET.
>
> Performing reset on a queue is divided into these steps:
>
>   1. notify the device to reset the queue
>   2. recycle the buffer submitted
>   3. reset the vring (may re-alloc)
>   4. mmap vring to device, and enable the queue
>
> This patch implements virtio_reset_vq(), virtio_enable_resetq() in the
> pci scenario.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/virtio/virtio_pci_common.c | 12 +++-
>   drivers/virtio/virtio_pci_modern.c | 96 ++++++++++++++++++++++++++++++
>   2 files changed, 105 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/virtio/virtio_pci_common.c b/drivers/virtio/virtio_pci_common.c
> index ca51fcc9daab..ad258a9d3b9f 100644
> --- a/drivers/virtio/virtio_pci_common.c
> +++ b/drivers/virtio/virtio_pci_common.c
> @@ -214,9 +214,15 @@ static void vp_del_vq(struct virtqueue *vq)
>   	struct virtio_pci_vq_info *info = vp_dev->vqs[vq->index];
>   	unsigned long flags;
>   
> -	spin_lock_irqsave(&vp_dev->lock, flags);
> -	list_del(&info->node);
> -	spin_unlock_irqrestore(&vp_dev->lock, flags);
> +	/*
> +	 * If it fails during re-enable reset vq. This way we won't rejoin
> +	 * info->node to the queue. Prevent unexpected irqs.
> +	 */
> +	if (!vq->reset) {
> +		spin_lock_irqsave(&vp_dev->lock, flags);
> +		list_del(&info->node);
> +		spin_unlock_irqrestore(&vp_dev->lock, flags);
> +	}
>   
>   	vp_dev->del_vq(info);
>   	kfree(info);
> diff --git a/drivers/virtio/virtio_pci_modern.c b/drivers/virtio/virtio_pci_modern.c
> index 9041d9a41b7d..4d28b6918c80 100644
> --- a/drivers/virtio/virtio_pci_modern.c
> +++ b/drivers/virtio/virtio_pci_modern.c
> @@ -34,6 +34,9 @@ static void vp_transport_features(struct virtio_device *vdev, u64 features)
>   	if ((features & BIT_ULL(VIRTIO_F_SR_IOV)) &&
>   			pci_find_ext_capability(pci_dev, PCI_EXT_CAP_ID_SRIOV))
>   		__virtio_set_bit(vdev, VIRTIO_F_SR_IOV);
> +
> +	if (features & BIT_ULL(VIRTIO_F_RING_RESET))
> +		__virtio_set_bit(vdev, VIRTIO_F_RING_RESET);
>   }
>   
>   /* virtio config->finalize_features() implementation */
> @@ -199,6 +202,95 @@ static int vp_active_vq(struct virtqueue *vq, u16 msix_vec)
>   	return 0;
>   }
>   
> +static int vp_modern_reset_vq(struct virtqueue *vq)
> +{
> +	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> +	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> +	struct virtio_pci_vq_info *info;
> +	unsigned long flags;
> +
> +	if (!virtio_has_feature(vq->vdev, VIRTIO_F_RING_RESET))
> +		return -ENOENT;
> +
> +	vp_modern_set_queue_reset(mdev, vq->index);
> +
> +	info = vp_dev->vqs[vq->index];
> +
> +	/* delete vq from irq handler */
> +	spin_lock_irqsave(&vp_dev->lock, flags);
> +	list_del(&info->node);
> +	spin_unlock_irqrestore(&vp_dev->lock, flags);
> +
> +	INIT_LIST_HEAD(&info->node);
> +
> +	/* For the case where vq has an exclusive irq, to prevent the irq from
> +	 * being received again and the pending irq, call synchronize_irq(), and
> +	 * break it.
> +	 *
> +	 * We can't use disable_irq() since it conflicts with the affinity
> +	 * managed IRQ that is used by some drivers. So this is done on top of
> +	 * IRQ hardening.
> +	 *
> +	 * In the scenario based on shared interrupts, vq will be searched from
> +	 * the queue virtqueues. Since the previous list_del() has been deleted
> +	 * from the queue, it is impossible for vq to be called in this case.
> +	 * There is no need to close the corresponding interrupt.
> +	 */
> +	if (vp_dev->per_vq_vectors && info->msix_vector != VIRTIO_MSI_NO_VECTOR) {
> +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> +		__virtqueue_break(vq);
> +#endif


I think we should do this unconditionally since it's an independent 
feature, though the list_del() above should be sufficient.


> +		synchronize_irq(pci_irq_vector(vp_dev->pci_dev, info->msix_vector));
> +	}
> +
> +	vq->reset = true;
> +
> +	return 0;
> +}
> +
> +static int vp_modern_enable_reset_vq(struct virtqueue *vq)
> +{
> +	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> +	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> +	struct virtio_pci_vq_info *info;
> +	unsigned long flags, index;
> +	int err;
> +
> +	if (!vq->reset)
> +		return -EBUSY;
> +
> +	index = vq->index;
> +	info = vp_dev->vqs[index];
> +
> +	if (vp_modern_get_queue_reset(mdev, index))
> +		return -EBUSY;
> +
> +	if (vp_modern_get_queue_enable(mdev, index))
> +		return -EBUSY;
> +
> +	err = vp_active_vq(vq, info->msix_vector);
> +	if (err)
> +		return err;
> +
> +	if (vq->callback) {
> +		spin_lock_irqsave(&vp_dev->lock, flags);
> +		list_add(&info->node, &vp_dev->virtqueues);
> +		spin_unlock_irqrestore(&vp_dev->lock, flags);
> +	} else {
> +		INIT_LIST_HEAD(&info->node);
> +	}
> +
> +#ifdef CONFIG_VIRTIO_HARDEN_NOTIFICATION
> +	if (vp_dev->per_vq_vectors && info->msix_vector != VIRTIO_MSI_NO_VECTOR)
> +		__virtqueue_unbreak(vq);
> +#endif
> +
> +	vp_modern_set_queue_enable(&vp_dev->mdev, index, true);
> +	vq->reset = false;
> +
> +	return 0;
> +}
> +
>   static u16 vp_config_vector(struct virtio_pci_device *vp_dev, u16 vector)
>   {
>   	return vp_modern_config_vector(&vp_dev->mdev, vector);
> @@ -413,6 +505,8 @@ static const struct virtio_config_ops virtio_pci_config_nodev_ops = {
>   	.set_vq_affinity = vp_set_vq_affinity,
>   	.get_vq_affinity = vp_get_vq_affinity,
>   	.get_shm_region  = vp_get_shm_region,
> +	.disable_vq_and_reset = vp_modern_reset_vq,
> +	.enable_vq_after_reset = vp_modern_enable_reset_vq,


Nit:

To be consistent, let's use vp_modern_disable_vq_and_reset() and 
vp_modern_enable_vq_after_reset()

Thanks


>   };
>   
>   static const struct virtio_config_ops virtio_pci_config_ops = {
> @@ -431,6 +525,8 @@ static const struct virtio_config_ops virtio_pci_config_ops = {
>   	.set_vq_affinity = vp_set_vq_affinity,
>   	.get_vq_affinity = vp_get_vq_affinity,
>   	.get_shm_region  = vp_get_shm_region,
> +	.disable_vq_and_reset = vp_modern_reset_vq,
> +	.enable_vq_after_reset = vp_modern_enable_reset_vq,
>   };
>   
>   /* the PCI probing function */

