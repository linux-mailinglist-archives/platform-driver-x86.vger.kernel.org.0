Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 898CA5612A5
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Jun 2022 08:40:29 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231852AbiF3GkU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 30 Jun 2022 02:40:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbiF3GkS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Jun 2022 02:40:18 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 8478A2F39C
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656571216;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=jAHrr0+GxDfej1qVCdn75eKSnjxER8aot4sqAySqnyU=;
        b=Oo3ryxbYhjMRU4GeMSGk2FfioiMTH0El4VRsR94NLhqA4QpDxWAuBUof6yPymtfkGYauQz
        r7/s4y1IUeaKMnB8O+VAV4weR+9cE/mDwvHqqjS/VPBNOg1B5jvPdhTowJLqYQUauhKKKE
        BJV0e+ZIGypGkIJSUfMk8WS4mJus1mY=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-77-PuUx_UmUO1CMUVWNWHScSg-1; Thu, 30 Jun 2022 02:40:15 -0400
X-MC-Unique: PuUx_UmUO1CMUVWNWHScSg-1
Received: by mail-lf1-f72.google.com with SMTP id be18-20020a056512251200b0048120ff434dso4967914lfb.19
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 Jun 2022 23:40:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jAHrr0+GxDfej1qVCdn75eKSnjxER8aot4sqAySqnyU=;
        b=xPkXnlilLrag5WeIBQ8kamiNBNSyy41L4x/NZ4iRQ4j6yzDvH6uRoWCrVznhQJ+sRK
         4pJa7tK4bTzwI3Zre3mSUI7MkzhH4w0VWSzOJByh93oQ+B3yff4+wy4QR0CNprecWL1I
         lgIGLbmaRgsCvakoXrmKZxwgInM6/EShyC4EMgpzdZa9y5o8ouFCFVqsEOdYXhR6Uhs3
         mmVu/qb0e2A1u0zrEzqrVw6zn2OOMrpzCf0JpzXsCYTB5aahZGF8v6koI154kcWciiF1
         U5nOOYJaEsJ6UJnMY0OENMQEriVuGg5FJEnAxUNKjrw7txRJFi2vN5ABZ39gDmU7jVM3
         K05w==
X-Gm-Message-State: AJIora9Nwq0dzLFo61y822cYLJQUMDMWl41TngypYDwpYGdbtPyqRoCU
        EcE5QflqHqRhu4GxIiQqHcC+MzXEfIHKuk5LbMYkKr/ZZrSdt/cwIZ8i3pnvJIDndKUGR17QUc/
        tc8+AcsqcQJPJg074FnaBpoohH6Ts2xNIUYJXfq1ViNtgSCSq0w==
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id bp13-20020a056512158d00b0047f718c28b5mr4753552lfb.397.1656571213834;
        Wed, 29 Jun 2022 23:40:13 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tAA0XU6ZzbOAb5pqi3g/cuvZsx0P7N9Yp/LWOT+IpPh+uRjEGCtW9glE4GIh09HeOKg0ELev5VqROwEDkQfbM=
X-Received: by 2002:a05:6512:158d:b0:47f:718c:28b5 with SMTP id
 bp13-20020a056512158d00b0047f718c28b5mr4753513lfb.397.1656571213588; Wed, 29
 Jun 2022 23:40:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com> <20220629065656.54420-6-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20220629065656.54420-6-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
Date:   Thu, 30 Jun 2022 14:40:02 +0800
Message-ID: <CACGkMEvfFV8w34=SiS4XFyEH5+EEkb9JqYg0t_rKpU1rRBMLiQ@mail.gmail.com>
Subject: Re: [PATCH v11 05/40] virtio_ring: split vring_virtqueue
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc:     virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
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
        linux-um@lists.infradead.org, netdev <netdev@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm <kvm@vger.kernel.org>,
        "open list:XDP (eXpress Data Path)" <bpf@vger.kernel.org>,
        kangjie.xu@linux.alibaba.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jun 29, 2022 at 2:57 PM Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
>
> Separate the two inline structures(split and packed) from the structure
> vring_virtqueue.
>
> In this way, we can use these two structures later to pass parameters
> and retain temporary variables.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>

Acked-by: Jason Wang <jasowang@redhat.com>

> ---
>  drivers/virtio/virtio_ring.c | 116 ++++++++++++++++++-----------------
>  1 file changed, 60 insertions(+), 56 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index bb4e8ae09c9b..2806e033a651 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -85,6 +85,64 @@ struct vring_desc_extra {
>         u16 next;                       /* The next desc state in a list. */
>  };
>
> +struct vring_virtqueue_split {
> +       /* Actual memory layout for this queue. */
> +       struct vring vring;
> +
> +       /* Last written value to avail->flags */
> +       u16 avail_flags_shadow;
> +
> +       /*
> +        * Last written value to avail->idx in
> +        * guest byte order.
> +        */
> +       u16 avail_idx_shadow;
> +
> +       /* Per-descriptor state. */
> +       struct vring_desc_state_split *desc_state;
> +       struct vring_desc_extra *desc_extra;
> +
> +       /* DMA address and size information */
> +       dma_addr_t queue_dma_addr;
> +       size_t queue_size_in_bytes;
> +};
> +
> +struct vring_virtqueue_packed {
> +       /* Actual memory layout for this queue. */
> +       struct {
> +               unsigned int num;
> +               struct vring_packed_desc *desc;
> +               struct vring_packed_desc_event *driver;
> +               struct vring_packed_desc_event *device;
> +       } vring;
> +
> +       /* Driver ring wrap counter. */
> +       bool avail_wrap_counter;
> +
> +       /* Avail used flags. */
> +       u16 avail_used_flags;
> +
> +       /* Index of the next avail descriptor. */
> +       u16 next_avail_idx;
> +
> +       /*
> +        * Last written value to driver->flags in
> +        * guest byte order.
> +        */
> +       u16 event_flags_shadow;
> +
> +       /* Per-descriptor state. */
> +       struct vring_desc_state_packed *desc_state;
> +       struct vring_desc_extra *desc_extra;
> +
> +       /* DMA address and size information */
> +       dma_addr_t ring_dma_addr;
> +       dma_addr_t driver_event_dma_addr;
> +       dma_addr_t device_event_dma_addr;
> +       size_t ring_size_in_bytes;
> +       size_t event_size_in_bytes;
> +};
> +
>  struct vring_virtqueue {
>         struct virtqueue vq;
>
> @@ -124,64 +182,10 @@ struct vring_virtqueue {
>
>         union {
>                 /* Available for split ring */
> -               struct {
> -                       /* Actual memory layout for this queue. */
> -                       struct vring vring;
> -
> -                       /* Last written value to avail->flags */
> -                       u16 avail_flags_shadow;
> -
> -                       /*
> -                        * Last written value to avail->idx in
> -                        * guest byte order.
> -                        */
> -                       u16 avail_idx_shadow;
> -
> -                       /* Per-descriptor state. */
> -                       struct vring_desc_state_split *desc_state;
> -                       struct vring_desc_extra *desc_extra;
> -
> -                       /* DMA address and size information */
> -                       dma_addr_t queue_dma_addr;
> -                       size_t queue_size_in_bytes;
> -               } split;
> +               struct vring_virtqueue_split split;
>
>                 /* Available for packed ring */
> -               struct {
> -                       /* Actual memory layout for this queue. */
> -                       struct {
> -                               unsigned int num;
> -                               struct vring_packed_desc *desc;
> -                               struct vring_packed_desc_event *driver;
> -                               struct vring_packed_desc_event *device;
> -                       } vring;
> -
> -                       /* Driver ring wrap counter. */
> -                       bool avail_wrap_counter;
> -
> -                       /* Avail used flags. */
> -                       u16 avail_used_flags;
> -
> -                       /* Index of the next avail descriptor. */
> -                       u16 next_avail_idx;
> -
> -                       /*
> -                        * Last written value to driver->flags in
> -                        * guest byte order.
> -                        */
> -                       u16 event_flags_shadow;
> -
> -                       /* Per-descriptor state. */
> -                       struct vring_desc_state_packed *desc_state;
> -                       struct vring_desc_extra *desc_extra;
> -
> -                       /* DMA address and size information */
> -                       dma_addr_t ring_dma_addr;
> -                       dma_addr_t driver_event_dma_addr;
> -                       dma_addr_t device_event_dma_addr;
> -                       size_t ring_size_in_bytes;
> -                       size_t event_size_in_bytes;
> -               } packed;
> +               struct vring_virtqueue_packed packed;
>         };
>
>         /* How to notify other side. FIXME: commonalize hcalls! */
> --
> 2.31.0
>

