Return-Path: <platform-driver-x86+bounces-1746-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ED3886C566
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Feb 2024 10:35:24 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 728FF1C23D5C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 29 Feb 2024 09:35:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 203795F473;
	Thu, 29 Feb 2024 09:34:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R+ic0V/N"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 395B65EE8E
	for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 09:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199275; cv=none; b=F+UiCD0u2F5Gn5+UogM31GP7Zpyazj8odJZidr840fYnKrohGkgbURAn1xOy9G2nw7m1u09ZNwdJrhc3l/e2agz59Nk5cgp3PoF7MuDn7W1sXZD6k9KT2PJ9cjjMqLuTjlrpkSqCJMPZyCu5gAvuuXRKMs8TozctKwDGvaDoTh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199275; c=relaxed/simple;
	bh=GkGAw/dbvtAPuNf/2pfICzWyjWviIwP6O5SJmj0u3KA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jSU2aHB3h0eDZ8OXgT9LvNYZ8VaDTEKUIxNsKanqwOgdfSOQatBOQ9Wk3JGEX/Qn/l5ds1b5v0kaLqH1afBTuJsaaapkFMZ8UXaRFNjads95KjuZlHEjjYYiqn72y4f3+9iDIJdSSkuyMT1EbgpPZctJLPRLHachqY+Ik/sFIvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R+ic0V/N; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709199271;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TZsdg3ZN0LxY9nQESQ96ahFfH0ahlO3yM9XYoF9kTdE=;
	b=R+ic0V/NoM8GgFQi+NvpZvZqbffRRV7hW5uafPPt9ZrXzTME8zPm1Je+gLMKp+fuL/NRJM
	4UdF/hCprvzdLrnOC/YtiuxMp51+BBg0upG5TEjf+7wp2IfOTeG4+rQ4HLuhvvJO41gIcB
	y3wbMMluRf11jtyFx5Gi5iUF6UBgYh0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-BlUDzVPuMCqGMWPzOd8H3w-1; Thu, 29 Feb 2024 04:34:29 -0500
X-MC-Unique: BlUDzVPuMCqGMWPzOd8H3w-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-40e4478a3afso3172225e9.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 29 Feb 2024 01:34:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199268; x=1709804068;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZsdg3ZN0LxY9nQESQ96ahFfH0ahlO3yM9XYoF9kTdE=;
        b=evSOL+YstV//skLrG2sCPTnkP8qucoVB4R41XMRO/Tjq+b0QxqYxWOunR2zK9Wvbr0
         CZM4DwQYeS5XQuAWEBmrU53g2U3nSGLM3jMPM5cFe3U4FPCAHVzWiKKSdHHz1Cl7o3gU
         OXpwIshzDe7CjvP+FUJ1C0Zrrgq5YJ9yWoGK09RX+exqb65tZ0veEzlmkQAo59MTYo2V
         T5IH7ep+Q99uGd4qkbBH6bkr99tYeT0sdeBxm3cnSEgmTL1QDpQ+lbINkZl90u9TC6vB
         fPIuhkeHhmFrCNAVE63fLS+4hovT+ZMMTHZD0dwfjfuX6UBk84diWX94q86TuVAlX0X5
         lwPw==
X-Forwarded-Encrypted: i=1; AJvYcCXIo3xhEqm5zmMGIvHOI3epwuNwQsHJqRP4ALqNPQEAQEOVOfp+psC+64ekMkImKqWEfwFypkhEpBDlGximUziC7S7glcljNpU/4i7pw1J8MpNYVQ==
X-Gm-Message-State: AOJu0YykPyKem+iGkU/L3u7JM4Q6o/r49L8n7TXb9Nj51DrheM30hH8r
	Nhf5y/GqHYUfElWz2jovj0zn4EEVK0KXMH3HHq7tMGLlRK7bGPI6Q5rKUv92Vr3lqtwWu56sEOJ
	coihdRzhoRYlqkHLMhs3TmvZkUAvDrxPjCGOpx/IMJNzEL/64imkpodkELUiDQhYcFY7fZNY=
X-Received: by 2002:a05:600c:1548:b0:412:aec6:484f with SMTP id f8-20020a05600c154800b00412aec6484fmr1414579wmg.15.1709199268301;
        Thu, 29 Feb 2024 01:34:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEfnF8uRkHXZC7wKNnT1fDTSMQyKX3qeooc5Rt0FsbIbstjuFdW8armLc3YEo+G0sH6Cq11xQ==
X-Received: by 2002:a05:600c:1548:b0:412:aec6:484f with SMTP id f8-20020a05600c154800b00412aec6484fmr1414542wmg.15.1709199267841;
        Thu, 29 Feb 2024 01:34:27 -0800 (PST)
Received: from redhat.com ([2a02:14f:178:d6b0:a21c:61c4:2098:5db])
        by smtp.gmail.com with ESMTPSA id o17-20020adfa111000000b0033df8854f0dsm1256096wro.26.2024.02.29.01.34.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Feb 2024 01:34:27 -0800 (PST)
Date: Thu, 29 Feb 2024 04:34:20 -0500
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
Subject: Re: [PATCH vhost v3 00/19] virtio: drivers maintain dma info for
 premapped vq
Message-ID: <20240229043238-mutt-send-email-mst@kernel.org>
References: <20240229072044.77388-1-xuanzhuo@linux.alibaba.com>
 <20240229031755-mutt-send-email-mst@kernel.org>
 <1709197357.626784-1-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1709197357.626784-1-xuanzhuo@linux.alibaba.com>

On Thu, Feb 29, 2024 at 05:02:37PM +0800, Xuan Zhuo wrote:
> On Thu, 29 Feb 2024 03:21:14 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Thu, Feb 29, 2024 at 03:20:25PM +0800, Xuan Zhuo wrote:
> > > As discussed:
> > > http://lore.kernel.org/all/CACGkMEvq0No8QGC46U4mGsMtuD44fD_cfLcPaVmJ3rHYqRZxYg@mail.gmail.com
> > >
> > > If the virtio is premapped mode, the driver should manage the dma info by self.
> > > So the virtio core should not store the dma info.
> > > So we can release the memory used to store the dma info.
> > >
> > > But if the desc_extra has not dma info, we face a new question,
> > > it is hard to get the dma info of the desc with indirect flag.
> > > For split mode, that is easy from desc, but for the packed mode,
> > > it is hard to get the dma info from the desc. And for hardening
> > > the dma unmap is saft, we should store the dma info of indirect
> > > descs.
> > >
> > > So I introduce the "structure the indirect desc table" to
> > > allocate space to store dma info with the desc table.
> > >
> > > On the other side, we mix the descs with indirect flag
> > > with other descs together to share the unmap api. That
> > > is complex. I found if we we distinguish the descs with
> > > VRING_DESC_F_INDIRECT before unmap, thing will be clearer.
> > >
> > > Because of the dma array is allocated in the find_vqs(),
> > > so I introduce a new parameter to find_vqs().
> > >
> > > Note:
> > >     this is on the top of
> > >         [PATCH vhost v1] virtio: packed: fix unmap leak for indirect desc table
> > >         http://lore.kernel.org/all/20240223071833.26095-1-xuanzhuo@linux.alibaba.com
> > >
> > > Please review.
> > >
> > > Thanks
> > >
> > > v3:
> > >     1. fix the conflict with the vp_modern_create_avq().
> >
> > Okay but are you going to address huge memory waste all this is causing for
> > - people who never do zero copy
> > - systems where dma unmap is a nop
> >
> > ?
> >
> > You should address all comments when you post a new version, not just
> > what was expedient, or alternatively tag patch as RFC and explain
> > in commit log that you plan to do it later.
> 
> 
> Do you miss this one?
> http://lore.kernel.org/all/1708997579.5613105-1-xuanzhuo@linux.alibaba.com


I did. The answer is that no, you don't get to regress memory usage
for lots of people then fix it up.
So the patchset is big, I guess it will take a couple of cycles to
merge gradually.

> I asked you. But I didnot recv your answer.
> 
> Thanks.
> 
> 
> >
> > > v2:
> > >     1. change the dma item of virtio-net, every item have MAX_SKB_FRAGS + 2
> > >         addr + len pairs.
> > >     2. introduce virtnet_sq_free_stats for __free_old_xmit
> > >
> > > v1:
> > >     1. rename transport_vq_config to vq_transport_config
> > >     2. virtio-net set dma meta number to (ring-size + 1)(MAX_SKB_FRGAS +2)
> > >     3. introduce virtqueue_dma_map_sg_attrs
> > >     4. separate vring_create_virtqueue to an independent commit
> > >
> > >
> > >
> > > Xuan Zhuo (19):
> > >   virtio_ring: introduce vring_need_unmap_buffer
> > >   virtio_ring: packed: remove double check of the unmap ops
> > >   virtio_ring: packed: structure the indirect desc table
> > >   virtio_ring: split: remove double check of the unmap ops
> > >   virtio_ring: split: structure the indirect desc table
> > >   virtio_ring: no store dma info when unmap is not needed
> > >   virtio: find_vqs: pass struct instead of multi parameters
> > >   virtio: vring_create_virtqueue: pass struct instead of multi
> > >     parameters
> > >   virtio: vring_new_virtqueue(): pass struct instead of multi parameters
> > >   virtio_ring: simplify the parameters of the funcs related to
> > >     vring_create/new_virtqueue()
> > >   virtio: find_vqs: add new parameter premapped
> > >   virtio_ring: export premapped to driver by struct virtqueue
> > >   virtio_net: set premapped mode by find_vqs()
> > >   virtio_ring: remove api of setting vq premapped
> > >   virtio_ring: introduce dma map api for page
> > >   virtio_ring: introduce virtqueue_dma_map_sg_attrs
> > >   virtio_net: unify the code for recycling the xmit ptr
> > >   virtio_net: rename free_old_xmit_skbs to free_old_xmit
> > >   virtio_net: sq support premapped mode
> > >
> > >  arch/um/drivers/virtio_uml.c             |  31 +-
> > >  drivers/net/virtio_net.c                 | 283 ++++++---
> > >  drivers/platform/mellanox/mlxbf-tmfifo.c |  24 +-
> > >  drivers/remoteproc/remoteproc_virtio.c   |  31 +-
> > >  drivers/s390/virtio/virtio_ccw.c         |  33 +-
> > >  drivers/virtio/virtio_mmio.c             |  30 +-
> > >  drivers/virtio/virtio_pci_common.c       |  59 +-
> > >  drivers/virtio/virtio_pci_common.h       |   9 +-
> > >  drivers/virtio/virtio_pci_legacy.c       |  16 +-
> > >  drivers/virtio/virtio_pci_modern.c       |  38 +-
> > >  drivers/virtio/virtio_ring.c             | 698 ++++++++++++-----------
> > >  drivers/virtio/virtio_vdpa.c             |  45 +-
> > >  include/linux/virtio.h                   |  13 +-
> > >  include/linux/virtio_config.h            |  48 +-
> > >  include/linux/virtio_ring.h              |  82 +--
> > >  tools/virtio/virtio_test.c               |   4 +-
> > >  tools/virtio/vringh_test.c               |  28 +-
> > >  17 files changed, 847 insertions(+), 625 deletions(-)
> > >
> > > --
> > > 2.32.0.3.g01195cf9f
> >


