Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BFDE17AAFE4
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Sep 2023 12:47:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233425AbjIVKri (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Sep 2023 06:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56160 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229664AbjIVKrh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Sep 2023 06:47:37 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5858AC
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Sep 2023 03:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695379609;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=523CLNpg/sOwhLY70FMKKiUkZU7FDspbvgGF4P5huNs=;
        b=R/3+zw1I4CmUYlj4ZnskQUu1wBU3GX58ODFUN51WjbFaHrz9QM83FiOO3xPTDO3pwwzTZJ
        BjAzxawDmgO8XV8qAnXXfEAN/y3SMY8H9xXxeA0rz/tTDI9W/SArIDY1TmJaAh5NzodyjN
        HqWSCrGqxTueEplVObfm4qj+YgsxQiM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-194-NYB_3BcpMpG2QWSEek1F5g-1; Fri, 22 Sep 2023 06:46:48 -0400
X-MC-Unique: NYB_3BcpMpG2QWSEek1F5g-1
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-51da39aa6dcso1344404a12.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Sep 2023 03:46:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695379607; x=1695984407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=523CLNpg/sOwhLY70FMKKiUkZU7FDspbvgGF4P5huNs=;
        b=Oi7MIWmt6qWhAqL2ty26ewFu1Wc0J7sFQnhrM8/K6V+frROI4eLF5e6ysz7rxVBOto
         6eMTSz5HwzN2DAVa1OIXbU539Sb8LJj3yCskXO7Z2yHli1+MbUcXNyBlSWsWgRpTpklV
         E1C9J6S6e/ACMjpMlPPnMtq0mltk/vncdnDRwXGIKRg4hKa4ucSvpDSrBY1YQcMRC6AH
         UyXJv0qJd/9a4dMh4ZW3f06U6CJdTDkzpD5Vrw6NmJpDxtJ0u7YAxNC+jHkvYvlKGbXR
         GBN1pbiTkHpCDn8n46QiISyVTaAnQ3u1MlT0yZM08Y9M8d4b9h7EGh/lEUPFrczbkL+X
         juIQ==
X-Gm-Message-State: AOJu0YzwLMHDQ3StjlccK3ZmxuQrpIrFB2daeXBbsjrlfwIrIkVV6j3G
        2/l81fwJ41Fe/d5bLizmVqnxHyIX+QqZ0gPLG8jq+35iuDel6umFZZ2jQ60v7nJnC7eNrfWaMMB
        j6jHmQo2gq2mGjitKmITzJ6ZqIz4OdzhYOw==
X-Received: by 2002:a17:906:41:b0:9ad:e66a:4141 with SMTP id 1-20020a170906004100b009ade66a4141mr7499980ejg.28.1695379607571;
        Fri, 22 Sep 2023 03:46:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF/7A6BDEm5D1OAZEqbWCsMuJ65vhHu1qiz2aGlCcO2bpN2TOKZRlo73gCToO1Ojpp+az0gQA==
X-Received: by 2002:a17:906:41:b0:9ad:e66a:4141 with SMTP id 1-20020a170906004100b009ade66a4141mr7499940ejg.28.1695379607265;
        Fri, 22 Sep 2023 03:46:47 -0700 (PDT)
Received: from redhat.com ([2.52.150.187])
        by smtp.gmail.com with ESMTPSA id d26-20020a1709064c5a00b009ad875d12d7sm2528479ejw.210.2023.09.22.03.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Sep 2023 03:46:46 -0700 (PDT)
Date:   Fri, 22 Sep 2023 06:46:39 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     virtualization@lists.linux-foundation.org,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
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
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
Subject: Re: [PATCH v14 30/42] virtio_pci: introduce helper to get/set queue
 reset
Message-ID: <20230922064550-mutt-send-email-mst@kernel.org>
References: <20220801063902.129329-1-xuanzhuo@linux.alibaba.com>
 <20220801063902.129329-31-xuanzhuo@linux.alibaba.com>
 <20230921100112-mutt-send-email-mst@kernel.org>
 <1695347358.2770545-1-xuanzhuo@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1695347358.2770545-1-xuanzhuo@linux.alibaba.com>
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Sep 22, 2023 at 09:49:18AM +0800, Xuan Zhuo wrote:
> On Thu, 21 Sep 2023 10:02:53 -0400, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Mon, Aug 01, 2022 at 02:38:50PM +0800, Xuan Zhuo wrote:
> > > Introduce new helpers to implement queue reset and get queue reset
> > > status.
> > >
> > >  https://github.com/oasis-tcs/virtio-spec/issues/124
> > >  https://github.com/oasis-tcs/virtio-spec/issues/139
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  drivers/virtio/virtio_pci_modern_dev.c | 39 ++++++++++++++++++++++++++
> > >  include/linux/virtio_pci_modern.h      |  2 ++
> > >  2 files changed, 41 insertions(+)
> > >
> > > diff --git a/drivers/virtio/virtio_pci_modern_dev.c b/drivers/virtio/virtio_pci_modern_dev.c
> > > index fa2a9445bb18..869cb46bef96 100644
> > > --- a/drivers/virtio/virtio_pci_modern_dev.c
> > > +++ b/drivers/virtio/virtio_pci_modern_dev.c
> > > @@ -3,6 +3,7 @@
> > >  #include <linux/virtio_pci_modern.h>
> > >  #include <linux/module.h>
> > >  #include <linux/pci.h>
> > > +#include <linux/delay.h>
> > >
> > >  /*
> > >   * vp_modern_map_capability - map a part of virtio pci capability
> > > @@ -474,6 +475,44 @@ void vp_modern_set_status(struct virtio_pci_modern_device *mdev,
> > >  }
> > >  EXPORT_SYMBOL_GPL(vp_modern_set_status);
> > >
> > > +/*
> > > + * vp_modern_get_queue_reset - get the queue reset status
> > > + * @mdev: the modern virtio-pci device
> > > + * @index: queue index
> > > + */
> > > +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> > > +{
> > > +	struct virtio_pci_modern_common_cfg __iomem *cfg;
> > > +
> > > +	cfg = (struct virtio_pci_modern_common_cfg __iomem *)mdev->common;
> > > +
> > > +	vp_iowrite16(index, &cfg->cfg.queue_select);
> > > +	return vp_ioread16(&cfg->queue_reset);
> > > +}
> > > +EXPORT_SYMBOL_GPL(vp_modern_get_queue_reset);
> > > +
> >
> > Actually, this does not validate that the config structure is big
> > enough. So it can access some unrelated memory. Don't know whether
> > that's exploitable e.g. for CoCo but not nice, anyway.
> > Need to validate the size and disable reset if it's too small.
> 
> 
> static int vp_modern_disable_vq_and_reset(struct virtqueue *vq)
> {
> 	struct virtio_pci_device *vp_dev = to_vp_device(vq->vdev);
> 	struct virtio_pci_modern_device *mdev = &vp_dev->mdev;
> 	struct virtio_pci_vq_info *info;
> 	unsigned long flags;
> 
> ->	if (!virtio_has_feature(vq->vdev, VIRTIO_F_RING_RESET))
> 		return -ENOENT;
> 
> 	vp_modern_set_queue_reset(mdev, vq->index);
> 
> 
> I checked VIRTIO_F_RING_RESET before call this.

Yes but the point is that virtio is used with untrusted devices
(e.g. for SEV/TDX), so you can't really assume config structures
are in sync with feature bits.


> Do you mean, we should put the check to this function.
> 
> 
> Thanks.
> 
> 
> 
> >
> >
> > > +/*
> > > + * vp_modern_set_queue_reset - reset the queue
> > > + * @mdev: the modern virtio-pci device
> > > + * @index: queue index
> > > + */
> > > +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index)
> > > +{
> > > +	struct virtio_pci_modern_common_cfg __iomem *cfg;
> > > +
> > > +	cfg = (struct virtio_pci_modern_common_cfg __iomem *)mdev->common;
> > > +
> > > +	vp_iowrite16(index, &cfg->cfg.queue_select);
> > > +	vp_iowrite16(1, &cfg->queue_reset);
> > > +
> > > +	while (vp_ioread16(&cfg->queue_reset))
> > > +		msleep(1);
> > > +
> > > +	while (vp_ioread16(&cfg->cfg.queue_enable))
> > > +		msleep(1);
> > > +}
> > > +EXPORT_SYMBOL_GPL(vp_modern_set_queue_reset);
> > > +
> > >  /*
> > >   * vp_modern_queue_vector - set the MSIX vector for a specific virtqueue
> > >   * @mdev: the modern virtio-pci device
> > > diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
> > > index 05123b9a606f..c4eeb79b0139 100644
> > > --- a/include/linux/virtio_pci_modern.h
> > > +++ b/include/linux/virtio_pci_modern.h
> > > @@ -113,4 +113,6 @@ void __iomem * vp_modern_map_vq_notify(struct virtio_pci_modern_device *mdev,
> > >  				       u16 index, resource_size_t *pa);
> > >  int vp_modern_probe(struct virtio_pci_modern_device *mdev);
> > >  void vp_modern_remove(struct virtio_pci_modern_device *mdev);
> > > +int vp_modern_get_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
> > > +void vp_modern_set_queue_reset(struct virtio_pci_modern_device *mdev, u16 index);
> > >  #endif
> > > --
> > > 2.31.0
> >

