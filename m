Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2BDE24FF6A6
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Apr 2022 14:22:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235367AbiDMMZP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Apr 2022 08:25:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60360 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229714AbiDMMZM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Apr 2022 08:25:12 -0400
Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D295AEE6;
        Wed, 13 Apr 2022 05:22:50 -0700 (PDT)
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=e01e04423;MF=xuanzhuo@linux.alibaba.com;NM=1;PH=DS;RN=33;SR=0;TI=SMTPD_---0V9zbh3._1649852563;
Received: from localhost(mailfrom:xuanzhuo@linux.alibaba.com fp:SMTPD_---0V9zbh3._1649852563)
          by smtp.aliyun-inc.com(127.0.0.1);
          Wed, 13 Apr 2022 20:22:44 +0800
Message-ID: <1649852469.9980721-2-xuanzhuo@linux.alibaba.com>
Subject: Re: [PATCH v9 18/32] virtio_ring: introduce virtqueue_resize()
Date:   Wed, 13 Apr 2022 20:21:09 +0800
From:   Xuan Zhuo <xuanzhuo@linux.alibaba.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        virtualization@lists.linux-foundation.org
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-19-xuanzhuo@linux.alibaba.com>
 <92622553-e02d-47bd-06f9-0ce24c22650c@redhat.com>
In-Reply-To: <92622553-e02d-47bd-06f9-0ce24c22650c@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-9.9 required=5.0 tests=BAYES_00,
        ENV_AND_HDR_SPF_MATCH,RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,
        RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNPARSEABLE_RELAY,USER_IN_DEF_SPF_WL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 12 Apr 2022 14:41:18 +0800, Jason Wang <jasowang@redhat.com> wrote:
>
> =E5=9C=A8 2022/4/6 =E4=B8=8A=E5=8D=8811:43, Xuan Zhuo =E5=86=99=E9=81=93:
> > Introduce virtqueue_resize() to implement the resize of vring.
> > Based on these, the driver can dynamically adjust the size of the vring.
> > For example: ethtool -G.
> >
> > virtqueue_resize() implements resize based on the vq reset function. In
> > case of failure to allocate a new vring, it will give up resize and use
> > the original vring.
> >
> > During this process, if the re-enable reset vq fails, the vq can no
> > longer be used. Although the probability of this situation is not high.
> >
> > The parameter recycle is used to recycle the buffer that is no longer
> > used.
> >
> > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > ---
> >   drivers/virtio/virtio_ring.c | 69 ++++++++++++++++++++++++++++++++++++
> >   include/linux/virtio.h       |  3 ++
> >   2 files changed, 72 insertions(+)
> >
> > diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> > index 06f66b15c86c..6250e19fc5bf 100644
> > --- a/drivers/virtio/virtio_ring.c
> > +++ b/drivers/virtio/virtio_ring.c
> > @@ -2554,6 +2554,75 @@ struct virtqueue *vring_create_virtqueue(
> >   }
> >   EXPORT_SYMBOL_GPL(vring_create_virtqueue);
> >
> > +/**
> > + * virtqueue_resize - resize the vring of vq
> > + * @_vq: the struct virtqueue we're talking about.
> > + * @num: new ring num
> > + * @recycle: callback for recycle the useless buffer
> > + *
> > + * When it is really necessary to create a new vring, it will set the =
current vq
> > + * into the reset state. Then call the passed callback to recycle the =
buffer
> > + * that is no longer used. Only after the new vring is successfully cr=
eated, the
> > + * old vring will be released.
> > + *
> > + * Caller must ensure we don't call this with other virtqueue operatio=
ns
> > + * at the same time (except where noted).
> > + *
> > + * Returns zero or a negative error.
>
>
> Should we document that the virtqueue is kept unchanged (still
> available) on (specific) failure?
>
>
> > + */
> > +int virtqueue_resize(struct virtqueue *_vq, u32 num,
> > +		     void (*recycle)(struct virtqueue *vq, void *buf))
> > +{
> > +	struct vring_virtqueue *vq =3D to_vvq(_vq);
> > +	struct virtio_device *vdev =3D vq->vq.vdev;
> > +	bool packed;
> > +	void *buf;
> > +	int err;
> > +
> > +	if (!vq->we_own_ring)
> > +		return -EINVAL;
> > +
> > +	if (num > vq->vq.num_max)
> > +		return -E2BIG;
> > +
> > +	if (!num)
> > +		return -EINVAL;
> > +
> > +	packed =3D virtio_has_feature(vdev, VIRTIO_F_RING_PACKED) ? true : fa=
lse;
> > +
> > +	if ((packed ? vq->packed.vring.num : vq->split.vring.num) =3D=3D num)
> > +		return 0;
> > +
> > +	if (!vdev->config->reset_vq)
> > +		return -ENOENT;
> > +
> > +	if (!vdev->config->enable_reset_vq)
> > +		return -ENOENT;
> > +
> > +	err =3D vdev->config->reset_vq(_vq);
> > +	if (err)
> > +		return err;
> > +
> > +	while ((buf =3D virtqueue_detach_unused_buf(_vq)) !=3D NULL)
> > +		recycle(_vq, buf);
> > +
> > +	if (packed) {
> > +		err =3D virtqueue_resize_packed(_vq, num);
> > +		if (err)
> > +			virtqueue_reinit_packed(vq);
>
>
> Calling reinit here seems a little bit odd, it looks more like a reset


I also feel that this is a bit odd, I will put virtqueue_reinit_* into
virtqueue_resize_*.

Thanks.

> of the virtqueue. Consider we may re-use virtqueue reset for more
> purpose, I wonder if we need a helper like:
>
> virtqueue_resize() {
>  =C2=A0=C2=A0=C2=A0 vdev->config->reset_vq(_vq);
>  =C2=A0=C2=A0=C2=A0 if (packed)
>  =C2=A0=C2=A0=C2=A0 =C2=A0=C2=A0=C2=A0 virtqueue_reinit_packed(_vq)
>  =C2=A0=C2=A0=C2=A0 else
>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 virtqueue_reinit_split(_vq)
> }
>
> Thanks
>
>
> > +	} else {
> > +		err =3D virtqueue_resize_split(_vq, num);
> > +		if (err)
> > +			virtqueue_reinit_split(vq);
> > +	}
> > +
> > +	if (vdev->config->enable_reset_vq(_vq))
> > +		return -EBUSY;
> > +
> > +	return err;
> > +}
> > +EXPORT_SYMBOL_GPL(virtqueue_resize);
> > +
> >   /* Only available for split ring */
> >   struct virtqueue *vring_new_virtqueue(unsigned int index,
> >   				      unsigned int num,
> > diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> > index d59adc4be068..c86ff02e0ca0 100644
> > --- a/include/linux/virtio.h
> > +++ b/include/linux/virtio.h
> > @@ -91,6 +91,9 @@ dma_addr_t virtqueue_get_desc_addr(struct virtqueue *=
vq);
> >   dma_addr_t virtqueue_get_avail_addr(struct virtqueue *vq);
> >   dma_addr_t virtqueue_get_used_addr(struct virtqueue *vq);
> >
> > +int virtqueue_resize(struct virtqueue *vq, u32 num,
> > +		     void (*recycle)(struct virtqueue *vq, void *buf));
> > +
> >   /**
> >    * virtio_device - representation of a device using virtio
> >    * @index: unique position on the virtio bus
>
