Return-Path: <platform-driver-x86+bounces-1587-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6883E867375
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 12:40:04 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E64C828A70A
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 11:40:02 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4419B4DA0D;
	Mon, 26 Feb 2024 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CKCcU4cn"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58134D9E5
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 11:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708947491; cv=none; b=jfGvNvBtqsqZ6ypVnCuwPFF0HWtY2GcLkvh68epmqD4Jb5QeD9Gna1kqh0NxB4QLACs3Q/2e5jAeB+dQLbzDX3rwYVZM80WWNliLBZ2JqjOe8nezVChuH8FedkqWegQJ/eBhikKfAFAPa439mJcPh47P9FiBswHttnLor5R0vCM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708947491; c=relaxed/simple;
	bh=zKWL2peHfZ1QAk8oGfvhL+iRa+wZt2aUm7o0lbIQEcQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nmlUgaRi1AGjVGH93KEAIFwgzv/pvuKi6kFGSmmqFWT6N/1zFTkqeSp8/o6sg9ZXsg5iYoumcrIjtZkg8cN062+m3kQjoFDnesE3LbM53A0UvUvTqHUIWhbwcw5i0GcpuXuU36D79pBxV0t/kZ2QttHGN62rmvKcqtv76a7QA7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CKCcU4cn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708947487;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=P7MvwJ3D+StrVSUK3tB0CQEyFNz7AAwahnICJB9p7gg=;
	b=CKCcU4cn03dPd+6Fpxzyd/FWGnaa6kbVlXlmBc6S87o1aD8FkXyn3Lbj0FGWWctwMxvXiG
	dE3B+upEvdeQ3RUAaUev/KjJt1yr+e6J+h0doWBHK0NKdjRilhAwmKRHAC15tmB8lyabCl
	wmfJcmM34ige3BNF8Fu8OkdU/bOQa7w=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-167-kbujespYMkGacS8pZ_K5Aw-1; Mon, 26 Feb 2024 06:38:06 -0500
X-MC-Unique: kbujespYMkGacS8pZ_K5Aw-1
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-512fb30e992so901983e87.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 03:38:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708947485; x=1709552285;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P7MvwJ3D+StrVSUK3tB0CQEyFNz7AAwahnICJB9p7gg=;
        b=cz8xK/1w5a2GRIplwCZDp7GyQZmdgIePm8jZLuLhHqxjhT3w20NOjJ596lie6IEvbv
         Gd09eWTK/nuqmIAmzeJ7Fx5ezUhqUHBOEd8++rt2gm5/d1WWqaPe2aEpsY36tbG+NY1f
         LG33XuqRp+17p6P1q4nAqPnyw2cHenvHIFULm6Byqa9tRU/wd0gHbDo9FNaYOg8eVHoh
         tZ1qgTUOSVE0Gk/MLBLp+lMBaYL2dBjWt9todw4mxaZTeT20rTeZ+a+DjotC+HBRPIfX
         j00LJYTQp8t1PS35xZOzYR4R1ymPoGvCGiYkAxnUhcq3Faxb8JmBo2NKThcGpLjo6YFe
         HRjw==
X-Forwarded-Encrypted: i=1; AJvYcCUksZwGUC5J0gf+oI1LHt5tI2dUAXPAZOmf3fmfkoojl//yCiHUW4gBmqG+mUR58/gR1RU1hhsv9WDSOsyVSc8ytBJXjhFyWpXLEaTYVuUwF3/3pQ==
X-Gm-Message-State: AOJu0YwwlyWGXxJ2+1/12WLnC+i97FQvuoq+hyD4Mg6YXDG2zeVmascT
	fbLBv++IG5Y1QQTPs4GP1MvAgZOVuhtd9kOgZgbZfdXjtjdHrJuKVR7q+YSEnRyGg5P/qWYBo/f
	U5oiRuRHSzrD9fujxcstBOF0ZqV4LYm89PhQCzZqDEZP9tLDGWeb/z+vNX8R6BSS64GiTThk=
X-Received: by 2002:a05:6512:3ca3:b0:512:f7e0:6691 with SMTP id h35-20020a0565123ca300b00512f7e06691mr2981105lfv.19.1708947485169;
        Mon, 26 Feb 2024 03:38:05 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnsM1ZsaF+jfyc7l4FKwhqvdAxsvM86u3iK4cS/xJgeTAIsI5uC686Hboo06ERT5eZbbABGA==
X-Received: by 2002:a05:6512:3ca3:b0:512:f7e0:6691 with SMTP id h35-20020a0565123ca300b00512f7e06691mr2981082lfv.19.1708947484706;
        Mon, 26 Feb 2024 03:38:04 -0800 (PST)
Received: from redhat.com ([109.253.193.52])
        by smtp.gmail.com with ESMTPSA id 9-20020a05600c020900b004104bc8d841sm11598576wmi.13.2024.02.26.03.37.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 03:38:04 -0800 (PST)
Date: Mon, 26 Feb 2024 06:37:56 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Jason Wang <jasowang@redhat.com>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Hans de Goede <hdegoede@redhat.com>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
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
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-um@lists.infradead.org, netdev@vger.kernel.org,
	platform-driver-x86@vger.kernel.org,
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
	kvm@vger.kernel.org, bpf@vger.kernel.org
Subject: Re: [PATCH vhost v2 19/19] virtio_net: sq support premapped mode
Message-ID: <20240226063746-mutt-send-email-mst@kernel.org>
References: <20240223082726.52915-1-xuanzhuo@linux.alibaba.com>
 <20240223082726.52915-20-xuanzhuo@linux.alibaba.com>
 <20240225032330-mutt-send-email-mst@kernel.org>
 <1708927861.8802218-1-xuanzhuo@linux.alibaba.com>
 <1708933452.9792151-2-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708933452.9792151-2-xuanzhuo@linux.alibaba.com>

On Mon, Feb 26, 2024 at 03:44:12PM +0800, Xuan Zhuo wrote:
> On Mon, 26 Feb 2024 14:11:01 +0800, Xuan Zhuo <xuanzhuo@linux.alibaba.com> wrote:
> > On Sun, 25 Feb 2024 03:38:48 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > On Fri, Feb 23, 2024 at 04:27:26PM +0800, Xuan Zhuo wrote:
> > > > If the xsk is enabling, the xsk tx will share the send queue.
> > > > But the xsk requires that the send queue use the premapped mode.
> > > > So the send queue must support premapped mode.
> > > >
> > > > cmd:
> > > >     sh samples/pktgen/pktgen_sample01_simple.sh -i eth0 \
> > > >         -s 16 -d 10.0.0.128 -m 00:16:3e:2c:c8:2e -n 0 -p 100
> > > > CPU:
> > > >     Intel(R) Xeon(R) Platinum 8369B CPU @ 2.70GHz
> > > >
> > > > Machine:
> > > >     ecs.g7.2xlarge(Aliyun)
> > > >
> > > > before:              1600010.00
> > > > after(no-premapped): 1599966.00
> > > > after(premapped):    1600014.00
> > > >
> > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > ---
> > > >  drivers/net/virtio_net.c | 136 +++++++++++++++++++++++++++++++++++++--
> > > >  1 file changed, 132 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> > > > index 7715bb7032ec..b83ef6afc4fb 100644
> > > > --- a/drivers/net/virtio_net.c
> > > > +++ b/drivers/net/virtio_net.c
> > > > @@ -146,6 +146,25 @@ struct virtnet_rq_dma {
> > > >  	u16 need_sync;
> > > >  };
> > > >
> > > > +
> >
> > [...]
> >
> > > > +static struct virtnet_sq_dma *virtnet_sq_map_sg(struct send_queue *sq,
> > > > +						int nents, void *data)
> > > > +{
> > > > +	struct virtnet_sq_dma *d;
> > > > +	struct scatterlist *sg;
> > > > +	int i;
> > > > +
> > > > +	if (!sq->dmainfo.free)
> > > > +		return NULL;
> > > > +
> > > > +	d = sq->dmainfo.free;
> > > > +	sq->dmainfo.free = d->next;
> > > > +
> > > > +	for_each_sg(sq->sg, sg, nents, i) {
> > > > +		if (virtqueue_dma_map_sg_attrs(sq->vq, sg, DMA_TO_DEVICE, 0))
> > > > +			goto err;
> > > > +
> > > > +		d->addr[i] = sg->dma_address;
> > > > +		d->len[i] = sg->length;
> > > > +	}
> > > > +
> > > > +	d->data = data;
> > > > +	d->num = i;
> > > > +	return d;
> > > > +
> > > > +err:
> > > > +	d->num = i;
> > > > +	virtnet_sq_unmap(sq, (void **)&d);
> > > > +	return NULL;
> > > > +}
> > >
> > >
> > > Do I see a reimplementation of linux/llist.h here?
> >
> > YES. This can be done by the APIs of linux/lllist.h.
> >
> > But now, there is not __llist_del_first() (That will be used by
> > virtnet_sq_map_sg()).
> > And that is simple and just two places may use the APIs, so I implement it
> > directly.
> >
> > >
> > >
> > > > +
> > > > +static int virtnet_add_outbuf(struct send_queue *sq, u32 num, void *data)
> > > > +{
> > > > +	int ret;
> > > > +
> > > > +	if (sq->vq->premapped) {
> > > > +		data = virtnet_sq_map_sg(sq, num, data);
> > > > +		if (!data)
> > > > +			return -ENOMEM;
> > > > +	}
> > > > +
> > > > +	ret = virtqueue_add_outbuf(sq->vq, sq->sg, num, data, GFP_ATOMIC);
> > > > +	if (ret && sq->vq->premapped)
> > > > +		virtnet_sq_unmap(sq, &data);
> > > > +
> > > > +	return ret;
> > > > +}
> > > > +
> > > > +static int virtnet_sq_init_dma_mate(struct send_queue *sq)
> > >
> > > Mate? The popular south african drink?
> >
> > Sorry, should be meta, I mean metadata.
> >
> > >
> > > > +{
> > > > +	struct virtnet_sq_dma *d;
> > > > +	int num, i;
> > > > +
> > > > +	num = virtqueue_get_vring_size(sq->vq);
> > > > +
> > > > +	sq->dmainfo.free = kcalloc(num, sizeof(*sq->dmainfo.free), GFP_KERNEL);
> > > > +	if (!sq->dmainfo.free)
> > > > +		return -ENOMEM;
> > >
> > >
> > > This could be quite a bit of memory for a large queue.  And for a bunch
> > > of common cases where unmap is a nop (e.g. iommu pt) this does nothing
> > > useful at all.
> >
> > Then can we skip the unmap api, so pass a zero to the unmap api?
> 
> Typo.
> 
> Then can we skip the unmap api, or pass a zero(because the dma address is not
> recorded) to the unmap api?
> 
> Thanks


That's the idea.

> 
> 
> >
> > > And also, this does nothing useful if PLATFORM_ACCESS is off
> > > which is super common.
> >
> > That is ok. That just work when PLATFORM_ACCESS is on.
> >
> > Thanks.
> >
> > >
> > > A while ago I proposed:
> > > - extend DMA APIs so one can query whether unmap is a nop
> > >   and whether sync is a nop
> > > - virtio wrapper taking into account PLATFORM_ACCESS too
> > >
> > > then we can save all this work and memory when not needed.
> > >
> > >
> > >
> > > > +
> > > > +	sq->dmainfo.p = sq->dmainfo.free;
> > > > +
> > > > +	for (i = 0; i < num; ++i) {
> > > > +		d = &sq->dmainfo.free[i];
> > > > +		d->next = d + 1;
> > > > +	}
> > > > +
> > > > +	d->next = NULL;
> > > > +
> > > > +	return 0;
> > > > +}
> > > > +
> > > >  static void __free_old_xmit(struct send_queue *sq, bool in_napi,
> > > >  			    struct virtnet_sq_free_stats *stats)
> > > >  {
> > > > @@ -377,6 +487,9 @@ static void __free_old_xmit(struct send_queue *sq, bool in_napi,
> > > >  	while ((ptr = virtqueue_get_buf(sq->vq, &len)) != NULL) {
> > > >  		++stats->packets;
> > > >
> > > > +		if (sq->vq->premapped)
> > > > +			virtnet_sq_unmap(sq, &ptr);
> > > > +
> > > >  		if (!is_xdp_frame(ptr)) {
> > > >  			struct sk_buff *skb = ptr;
> > > >
> > > > @@ -890,8 +1003,7 @@ static int __virtnet_xdp_xmit_one(struct virtnet_info *vi,
> > > >  			    skb_frag_size(frag), skb_frag_off(frag));
> > > >  	}
> > > >
> > > > -	err = virtqueue_add_outbuf(sq->vq, sq->sg, nr_frags + 1,
> > > > -				   xdp_to_ptr(xdpf), GFP_ATOMIC);
> > > > +	err = virtnet_add_outbuf(sq, nr_frags + 1, xdp_to_ptr(xdpf));
> > > >  	if (unlikely(err))
> > > >  		return -ENOSPC; /* Caller handle free/refcnt */
> > > >
> > > > @@ -2357,7 +2469,7 @@ static int xmit_skb(struct send_queue *sq, struct sk_buff *skb)
> > > >  			return num_sg;
> > > >  		num_sg++;
> > > >  	}
> > > > -	return virtqueue_add_outbuf(sq->vq, sq->sg, num_sg, skb, GFP_ATOMIC);
> > > > +	return virtnet_add_outbuf(sq, num_sg, skb);
> > > >  }
> > > >
> > > >  static netdev_tx_t start_xmit(struct sk_buff *skb, struct net_device *dev)
> > > > @@ -4166,6 +4278,8 @@ static void virtnet_free_queues(struct virtnet_info *vi)
> > > >  	for (i = 0; i < vi->max_queue_pairs; i++) {
> > > >  		__netif_napi_del(&vi->rq[i].napi);
> > > >  		__netif_napi_del(&vi->sq[i].napi);
> > > > +
> > > > +		kfree(vi->sq[i].dmainfo.p);
> > > >  	}
> > > >
> > > >  	/* We called __netif_napi_del(),
> > > > @@ -4214,6 +4328,15 @@ static void free_receive_page_frags(struct virtnet_info *vi)
> > > >
> > > >  static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf)
> > > >  {
> > > > +	struct virtnet_info *vi = vq->vdev->priv;
> > > > +	struct send_queue *sq;
> > > > +	int i = vq2rxq(vq);
> > > > +
> > > > +	sq = &vi->sq[i];
> > > > +
> > > > +	if (sq->vq->premapped)
> > > > +		virtnet_sq_unmap(sq, &buf);
> > > > +
> > > >  	if (!is_xdp_frame(buf))
> > > >  		dev_kfree_skb(buf);
> > > >  	else
> > > > @@ -4327,8 +4450,10 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> > > >  		if (ctx)
> > > >  			ctx[rxq2vq(i)] = true;
> > > >
> > > > -		if (premapped)
> > > > +		if (premapped) {
> > > >  			premapped[rxq2vq(i)] = true;
> > > > +			premapped[txq2vq(i)] = true;
> > > > +		}
> > > >  	}
> > > >
> > > >  	cfg.nvqs      = total_vqs;
> > > > @@ -4352,6 +4477,9 @@ static int virtnet_find_vqs(struct virtnet_info *vi)
> > > >  		vi->rq[i].vq = vqs[rxq2vq(i)];
> > > >  		vi->rq[i].min_buf_len = mergeable_min_buf_len(vi, vi->rq[i].vq);
> > > >  		vi->sq[i].vq = vqs[txq2vq(i)];
> > > > +
> > > > +		if (vi->sq[i].vq->premapped)
> > > > +			virtnet_sq_init_dma_mate(&vi->sq[i]);
> > > >  	}
> > > >
> > > >  	/* run here: ret == 0. */
> > > > --
> > > > 2.32.0.3.g01195cf9f
> > >
> >


