Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 463195009E4
	for <lists+platform-driver-x86@lfdr.de>; Thu, 14 Apr 2022 11:30:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241815AbiDNJcy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 14 Apr 2022 05:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59266 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241796AbiDNJcp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 14 Apr 2022 05:32:45 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id DF94870046
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Apr 2022 02:30:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649928619;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=xTVIrXTky6oGSdrW6vSloYGYrjPuyKnFBXOPprwmmi4=;
        b=FvjIU4/WhzpYU41DbpC4SczPQI5G6iG+1CnuCEHNmggD+HhBncDLKocTCijlDTmSNGmZBh
        lPlXIblUU5sq9ERNT4bN+GGtKQVlG+Xt5K+8bWVVErQIQAyzgwbrqEBhuaT2SyANH3nLuP
        j+4apWbbiyCdV/+oJ0NSw5QVDjjINbU=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-jrM8TwIrPmKM-Q0sz5odPg-1; Thu, 14 Apr 2022 05:30:15 -0400
X-MC-Unique: jrM8TwIrPmKM-Q0sz5odPg-1
Received: by mail-lj1-f197.google.com with SMTP id 75-20020a2e054e000000b0024d422d3be9so359942ljf.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 14 Apr 2022 02:30:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=xTVIrXTky6oGSdrW6vSloYGYrjPuyKnFBXOPprwmmi4=;
        b=aUOCyoN7fJPydzemXNco0zGVGXMfKWf/pNHptCoAk6NBcIsY50JEwqcvtJ5hjGNAyG
         j5gv3rgl4bNAoVpFh+w1HGd1XHqK+5leh2GPHGtMQDV5RyM+jSFSzuNdiKY4CdcbvN9n
         4EPp2z1DvEBE2wRRQO1yHDl1PX81+Lo+NvdQpepIWQFGCjW01zGiCnu1LB325ioGFbF2
         /PY3J1O+188X8Emd6ih44c8IbsTpavzXWDXhB9JhiSBeGdIej09Tz6buAJVvWM7FI8eP
         pYNv27snkNYUlgoMirlNqNEQkUbeehVgclDR9eoZe4FCByIYwatxPR5Z1SU0GbXxm1BW
         qxNQ==
X-Gm-Message-State: AOAM53136/kwbDk6Ab2eXDof7txCAzIrMe2rAsjRFRv5wAb545P6jocw
        NRuLMmiFQ5pafvMdZdgHRLNyGR8LEAifXRILiZdNg/cx5k9KKtDLwdDStdIy6OGRvjrhlNqnu2p
        Tjg24sDhZxEoJbWgQwXBo0hfLObjn7Oi8JjCbKcYYO0ZBafZcDg==
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id p21-20020a056512139500b00446d38279a5mr1356150lfa.210.1649928613781;
        Thu, 14 Apr 2022 02:30:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr4h2U/Fe61ajhZ/yffQb0+ghbUvKwuL6LwQ7b0T02xdZ+hsOeGv/9VI/5jkuBOiC1HbxYHbK+Cv1CpJTPCfU=
X-Received: by 2002:a05:6512:1395:b0:446:d382:79a5 with SMTP id
 p21-20020a056512139500b00446d38279a5mr1356123lfa.210.1649928613476; Thu, 14
 Apr 2022 02:30:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-32-xuanzhuo@linux.alibaba.com> <122008a6-1e79-14d3-1478-59f96464afc9@redhat.com>
 <1649838917.6726515-10-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1649838917.6726515-10-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 14 Apr 2022 17:30:02 +0800
Message-ID: <CACGkMEvPH1k76xB_cHq_S9hvMXgGruoXpKLfoMZvJZ-L7wM9iw@mail.gmail.com>
Subject: Re: [PATCH v9 31/32] virtio_net: support rx/tx queue resize
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
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
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        virtualization <virtualization@lists.linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Apr 13, 2022 at 4:47 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrot=
e:
>
> On Wed, 13 Apr 2022 16:00:18 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> >
> > =E5=9C=A8 2022/4/6 =E4=B8=8A=E5=8D=8811:43, Xuan Zhuo =E5=86=99=E9=81=
=93:
> > > This patch implements the resize function of the rx, tx queues.
> > > Based on this function, it is possible to modify the ring num of the
> > > queue.
> > >
> > > There may be an exception during the resize process, the resize may
> > > fail, or the vq can no longer be used. Either way, we must execute
> > > napi_enable(). Because napi_disable is similar to a lock, napi_enable
> > > must be called after calling napi_disable.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > ---
> > >   drivers/net/virtio_net.c | 81 +++++++++++++++++++++++++++++++++++++=
+++
> > >   1 file changed, 81 insertions(+)
> > >
> > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > index b8bf00525177..ba6859f305f7 100644
> > > --- a/drivers/net/virtio_net.c
> > > +++ b/drivers/net/virtio_net.c
> > > @@ -251,6 +251,9 @@ struct padded_vnet_hdr {
> > >     char padding[4];
> > >   };
> > >
> > > +static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *b=
uf);
> > > +static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *b=
uf);
> > > +
> > >   static bool is_xdp_frame(void *ptr)
> > >   {
> > >     return (unsigned long)ptr & VIRTIO_XDP_FLAG;
> > > @@ -1369,6 +1372,15 @@ static void virtnet_napi_enable(struct virtque=
ue *vq, struct napi_struct *napi)
> > >   {
> > >     napi_enable(napi);
> > >
> > > +   /* Check if vq is in reset state. The normal reset/resize process=
 will
> > > +    * be protected by napi. However, the protection of napi is only =
enabled
> > > +    * during the operation, and the protection of napi will end afte=
r the
> > > +    * operation is completed. If re-enable fails during the process,=
 vq
> > > +    * will remain unavailable with reset state.
> > > +    */
> > > +   if (vq->reset)
> > > +           return;
> >
> >
> > I don't get when could we hit this condition.
>
>
> In patch 23, the code to implement re-enable vq is as follows:
>
> +static int vp_modern_enable_reset_vq(struct virtqueue *vq)
> +{
> +       struct virtio_pci_device *vp_dev =3D to_vp_device(vq->vdev);
> +       struct virtio_pci_modern_device *mdev =3D &vp_dev->mdev;
> +       struct virtio_pci_vq_info *info;
> +       unsigned long flags, index;
> +       int err;
> +
> +       if (!vq->reset)
> +               return -EBUSY;
> +
> +       index =3D vq->index;
> +       info =3D vp_dev->vqs[index];
> +
> +       /* check queue reset status */
> +       if (vp_modern_get_queue_reset(mdev, index) !=3D 1)
> +               return -EBUSY;
> +
> +       err =3D vp_active_vq(vq, info->msix_vector);
> +       if (err)
> +               return err;
> +
> +       if (vq->callback) {
> +               spin_lock_irqsave(&vp_dev->lock, flags);
> +               list_add(&info->node, &vp_dev->virtqueues);
> +               spin_unlock_irqrestore(&vp_dev->lock, flags);
> +       } else {
> +               INIT_LIST_HEAD(&info->node);
> +       }
> +
> +       vp_modern_set_queue_enable(&vp_dev->mdev, index, true);
> +
> +       if (vp_dev->per_vq_vectors && info->msix_vector !=3D VIRTIO_MSI_N=
O_VECTOR)
> +               enable_irq(pci_irq_vector(vp_dev->pci_dev, info->msix_vec=
tor));
> +
> +       vq->reset =3D false;
> +
> +       return 0;
> +}
>
>
> There are three situations where an error will be returned. These are the
> situations I want to handle.

Right, but it looks harmless if we just schedule the NAPI without the check=
.

>
> But I'm rethinking the question, and I feel like you're right, although t=
he
> hardware setup may fail. We can no longer sync with the hardware. But usi=
ng it
> as a normal vq doesn't have any problems.

Note that we should make sure the buggy(malicous) device won't crash
the codes by changing the queue_reset value at its will.

>
> >
> >
> > > +
> > >     /* If all buffers were filled by other side before we napi_enable=
d, we
> > >      * won't get another interrupt, so process any outstanding packet=
s now.
> > >      * Call local_bh_enable after to trigger softIRQ processing.
> > > @@ -1413,6 +1425,15 @@ static void refill_work(struct work_struct *wo=
rk)
> > >             struct receive_queue *rq =3D &vi->rq[i];
> > >
> > >             napi_disable(&rq->napi);
> > > +
> > > +           /* Check if vq is in reset state. See more in
> > > +            * virtnet_napi_enable()
> > > +            */
> > > +           if (rq->vq->reset) {
> > > +                   virtnet_napi_enable(rq->vq, &rq->napi);
> > > +                   continue;
> > > +           }
> >
> >
> > Can we do something similar in virtnet_close() by canceling the work?
>
> I think there is no need to cancel the work here, because napi_disable wi=
ll wait
> for the napi_enable of the resize. So if the re-enable failed vq is used =
as a normal
> vq, this logic can be removed.

Actually I meant the part of virtnet_rx_resize().

If we don't synchronize with the refill work, it might enable NAPI unexpect=
edly?

Thanks

>
>
> >
> >
> > > +
> > >             still_empty =3D !try_fill_recv(vi, rq, GFP_KERNEL);
> > >             virtnet_napi_enable(rq->vq, &rq->napi);
> > >
> > > @@ -1523,6 +1544,10 @@ static void virtnet_poll_cleantx(struct receiv=
e_queue *rq)
> > >     if (!sq->napi.weight || is_xdp_raw_buffer_queue(vi, index))
> > >             return;
> > >
> > > +   /* Check if vq is in reset state. See more in virtnet_napi_enable=
() */
> > > +   if (sq->vq->reset)
> > > +           return;
> >
> >
> > We've disabled TX napi, any chance we can still hit this?
>
> Same as above.
>
> >
> >
> > > +
> > >     if (__netif_tx_trylock(txq)) {
> > >             do {
> > >                     virtqueue_disable_cb(sq->vq);
> > > @@ -1769,6 +1794,62 @@ static netdev_tx_t start_xmit(struct sk_buff *=
skb, struct net_device *dev)
> > >     return NETDEV_TX_OK;
> > >   }
> > >
> > > +static int virtnet_rx_resize(struct virtnet_info *vi,
> > > +                        struct receive_queue *rq, u32 ring_num)
> > > +{
> > > +   int err;
> > > +
> > > +   napi_disable(&rq->napi);
> > > +
> > > +   err =3D virtqueue_resize(rq->vq, ring_num, virtnet_rq_free_unused=
_buf);
> > > +   if (err)
> > > +           goto err;
> > > +
> > > +   if (!try_fill_recv(vi, rq, GFP_KERNEL))
> > > +           schedule_delayed_work(&vi->refill, 0);
> > > +
> > > +   virtnet_napi_enable(rq->vq, &rq->napi);
> > > +   return 0;
> > > +
> > > +err:
> > > +   netdev_err(vi->dev,
> > > +              "reset rx reset vq fail: rx queue index: %td err: %d\n=
",
> > > +              rq - vi->rq, err);
> > > +   virtnet_napi_enable(rq->vq, &rq->napi);
> > > +   return err;
> > > +}
> > > +
> > > +static int virtnet_tx_resize(struct virtnet_info *vi,
> > > +                        struct send_queue *sq, u32 ring_num)
> > > +{
> > > +   struct netdev_queue *txq;
> > > +   int err, qindex;
> > > +
> > > +   qindex =3D sq - vi->sq;
> > > +
> > > +   virtnet_napi_tx_disable(&sq->napi);
> > > +
> > > +   txq =3D netdev_get_tx_queue(vi->dev, qindex);
> > > +   __netif_tx_lock_bh(txq);
> > > +   netif_stop_subqueue(vi->dev, qindex);
> > > +   __netif_tx_unlock_bh(txq);
> > > +
> > > +   err =3D virtqueue_resize(sq->vq, ring_num, virtnet_sq_free_unused=
_buf);
> > > +   if (err)
> > > +           goto err;
> > > +
> > > +   netif_start_subqueue(vi->dev, qindex);
> > > +   virtnet_napi_tx_enable(vi, sq->vq, &sq->napi);
> > > +   return 0;
> > > +
> > > +err:
> >
> >
> > I guess we can still start the queue in this case? (Since we don't
> > change the queue if resize fails).
>
> Yes, you are right.
>
> Thanks.
>
> >
> >
> > > +   netdev_err(vi->dev,
> > > +              "reset tx reset vq fail: tx queue index: %td err: %d\n=
",
> > > +              sq - vi->sq, err);
> > > +   virtnet_napi_tx_enable(vi, sq->vq, &sq->napi);
> > > +   return err;
> > > +}
> > > +
> > >   /*
> > >    * Send command via the control virtqueue and check status.  Comman=
ds
> > >    * supported by the hypervisor, as indicated by feature bits, shoul=
d
> >
>

