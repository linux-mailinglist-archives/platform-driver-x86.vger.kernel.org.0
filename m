Return-Path: <platform-driver-x86+bounces-1129-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id C7933843AB7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 10:16:15 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 3A9361F2294F
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 09:16:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B145878679;
	Wed, 31 Jan 2024 09:12:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LVuPuzxv"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03B2F76C85
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692367; cv=none; b=qvh3HXZi4awGbrYGOtdYnvpuDZRfdURfXYxe2oZpcns/EfZdP7zBAXpy5QfSAI2I1GDRU+dar/6zD50OwVrslCczECUqZtVsViACj1RkzADAz0iqZr6JtkE9fEQIX+ZRu9mO0XSA1btWgNfLAlhBHP59q245oAyITcMcsjb5C5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692367; c=relaxed/simple;
	bh=iy8IxvqKOpmyszmUICuSRJZdyFyS8a08syYg9oqhiwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q0yTVxTeds3vTZ+d11+5q+xQqfr4dUQ9P+bIkRs1zxKzQPjwC/LrttPmUrJ2ZjJROQ3yoHjAjcX3AJIl4SrCcxCO5R5ImKse1o9FZETao/ZMyTDfqSPvlG/RNC1bqiM6JiWjZF2srA7OXXj7iKZzqvbO2b8gdIq6/v20aXnjANI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LVuPuzxv; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wsqjWW/MnDSmuwoZiRaLj0nDWAmbUu5RXdiCDY/znJM=;
	b=LVuPuzxv5elUYxKmZAPACxDbX6MbCXbrdW4NH1wXxldQ8x0vQeml4Yxx1ZgwVSk7wYsWO6
	3Z2P7T9nEJjCsWOiEu6DDhxtU3/nFFq3lguKapfpSURdGGCpCGFm/aqe7ycSRrmWwrDVIS
	96qE5kZKkDWh1Am2AO2e+RTSlW2ptVA=
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-444-5QMnsICuNoOB8LqtQAXj3g-1; Wed, 31 Jan 2024 04:12:41 -0500
X-MC-Unique: 5QMnsICuNoOB8LqtQAXj3g-1
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-3bdb7decd26so4944007b6e.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 01:12:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692361; x=1707297161;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wsqjWW/MnDSmuwoZiRaLj0nDWAmbUu5RXdiCDY/znJM=;
        b=K6niaK8wBvz3yzPeecUhJSWwgO9VKeuiORkOqVyABz4cZAf0THNRc9Vv4Hg5JTH+JE
         1dGnULl+hESEMRC04z9k2kKGpSPgz1lw8vYdNjAbvNEdSPRs7WJSckrHuNAVfwmpJVfi
         Ry7SuczG1muw34wggeqzM+azj99NLAGZ5MM4DdnPuLADuHKNPqQlozcjpXvkZp29SYKO
         12g70t606QbDvh7VuiqfS/8VLld2J/Ib2bGgxqCow2wrro0NlX1jyxS2Gstj8edAtyoq
         ExJPLtNKJy9wyf5QUSzE+hjG4Gvu1mcNeUlE96NipOdcvdcvIldGMzOqrMPSsUCZP8cu
         qY2w==
X-Gm-Message-State: AOJu0YxABcJxBGamqyHUtNWtC8wpruiCWt1UPvo9PjSHiwm9fWGF6zst
	scwQMXHyK4YMf07eo+illkDhiDzzvu6FWeSs1BtJuBbmAl4aPpIbl44i7LeQf9bDIRENu57y0dR
	9kJ6b6hq+MRRDVxPy9gz5t2v8jIwUFUOUDooyMZoH0PivX7DAiB+4ClRkw7eIEBpTGJe6kb8LgT
	5PussoWeeQCQcxA+bmwRWNzohOenUYML2/xRZuyiwcdk+1OQ==
X-Received: by 2002:a05:6808:1411:b0:3bd:692d:b234 with SMTP id w17-20020a056808141100b003bd692db234mr1439593oiv.46.1706692360824;
        Wed, 31 Jan 2024 01:12:40 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkhNl8CYmtHiEfIUfnPYL5oLs/Tc6D6VHe9+SWIvn+sLqMZVRWwpFiE+EIR4sYMDOZHFDn03BUTmGXgWIZEJ8=
X-Received: by 2002:a05:6808:1411:b0:3bd:692d:b234 with SMTP id
 w17-20020a056808141100b003bd692db234mr1439555oiv.46.1706692360520; Wed, 31
 Jan 2024 01:12:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-7-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-7-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:29 +0800
Message-ID: <CACGkMEtNCjvtDWySzeAqETGZtBSL0MR6=JySBBtm3=s19wB=1w@mail.gmail.com>
Subject: Re: [PATCH vhost 06/17] virtio_ring: no store dma info when unmap is
 not needed
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	"Michael S. Tsirkin" <mst@redhat.com>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Jesper Dangaard Brouer <hawk@kernel.org>, 
	John Fastabend <john.fastabend@gmail.com>, Benjamin Berg <benjamin.berg@intel.com>, 
	Yang Li <yang.lee@linux.alibaba.com>, linux-um@lists.infradead.org, 
	netdev@vger.kernel.org, platform-driver-x86@vger.kernel.org, 
	linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org, 
	kvm@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 7:42=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> As discussed:
> http://lore.kernel.org/all/CACGkMEug-=3DC+VQhkMYSgUKMC=3D=3D04m7-uem_yC21=
bgGkKZh845w@mail.gmail.com
>
> When the vq is premapped mode, the driver manages the dma
> info is a good way.
>
> So this commit make the virtio core not to store the dma
> info and release the memory which is used to store the dma
> info.
>
> If the use_dma_api is false, the memory is also not allocated.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>  drivers/virtio/virtio_ring.c | 89 ++++++++++++++++++++++++++++--------
>  1 file changed, 70 insertions(+), 19 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index 831667a57429..5bea25167259 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -94,12 +94,15 @@ struct vring_desc_state_packed {
>  };
>
>  struct vring_desc_extra {
> -       dma_addr_t addr;                /* Descriptor DMA addr. */
> -       u32 len;                        /* Descriptor length. */
>         u16 flags;                      /* Descriptor flags. */
>         u16 next;                       /* The next desc state in a list.=
 */
>  };
>
> +struct vring_desc_dma {
> +       dma_addr_t addr;                /* Descriptor DMA addr. */
> +       u32 len;                        /* Descriptor length. */
> +};
> +
>  struct vring_virtqueue_split {
>         /* Actual memory layout for this queue. */
>         struct vring vring;
> @@ -116,6 +119,7 @@ struct vring_virtqueue_split {
>         /* Per-descriptor state. */
>         struct vring_desc_state_split *desc_state;
>         struct vring_desc_extra *desc_extra;
> +       struct vring_desc_dma *desc_dma;
>
>         /* DMA address and size information */
>         dma_addr_t queue_dma_addr;
> @@ -156,6 +160,7 @@ struct vring_virtqueue_packed {
>         /* Per-descriptor state. */
>         struct vring_desc_state_packed *desc_state;
>         struct vring_desc_extra *desc_extra;
> +       struct vring_desc_dma *desc_dma;
>
>         /* DMA address and size information */
>         dma_addr_t ring_dma_addr;
> @@ -472,13 +477,14 @@ static unsigned int vring_unmap_one_split(const str=
uct vring_virtqueue *vq,
>                                           unsigned int i)
>  {
>         struct vring_desc_extra *extra =3D vq->split.desc_extra;
> +       struct vring_desc_dma *dma =3D vq->split.desc_dma;
>         u16 flags;
>
>         flags =3D extra[i].flags;
>
>         dma_unmap_page(vring_dma_dev(vq),
> -                      extra[i].addr,
> -                      extra[i].len,
> +                      dma[i].addr,
> +                      dma[i].len,
>                        (flags & VRING_DESC_F_WRITE) ?
>                        DMA_FROM_DEVICE : DMA_TO_DEVICE);
>
> @@ -535,8 +541,11 @@ static inline unsigned int virtqueue_add_desc_split(=
struct virtqueue *vq,
>                 next =3D extra[i].next;
>                 desc[i].next =3D cpu_to_virtio16(vq->vdev, next);
>
> -               extra[i].addr =3D addr;
> -               extra[i].len =3D len;
> +               if (vring->split.desc_dma) {
> +                       vring->split.desc_dma[i].addr =3D addr;
> +                       vring->split.desc_dma[i].len =3D len;
> +               }
> +
>                 extra[i].flags =3D flags;
>         } else
>                 next =3D virtio16_to_cpu(vq->vdev, desc[i].next);
> @@ -1072,16 +1081,26 @@ static void virtqueue_vring_attach_split(struct v=
ring_virtqueue *vq,
>         vq->free_head =3D 0;
>  }
>
> -static int vring_alloc_state_extra_split(struct vring_virtqueue_split *v=
ring_split)
> +static int vring_alloc_state_extra_split(struct vring_virtqueue_split *v=
ring_split,
> +                                        bool need_unmap)
>  {
>         struct vring_desc_state_split *state;
>         struct vring_desc_extra *extra;
> +       struct vring_desc_dma *dma;
>         u32 num =3D vring_split->vring.num;
>
>         state =3D kmalloc_array(num, sizeof(struct vring_desc_state_split=
), GFP_KERNEL);
>         if (!state)
>                 goto err_state;
>
> +       if (need_unmap) {
> +               dma =3D kmalloc_array(num, sizeof(struct vring_desc_dma),=
 GFP_KERNEL);
> +               if (!dma)
> +                       goto err_dma;
> +       } else {
> +               dma =3D NULL;
> +       }
> +
>         extra =3D vring_alloc_desc_extra(num);
>         if (!extra)
>                 goto err_extra;
> @@ -1090,9 +1109,12 @@ static int vring_alloc_state_extra_split(struct vr=
ing_virtqueue_split *vring_spl
>
>         vring_split->desc_state =3D state;
>         vring_split->desc_extra =3D extra;
> +       vring_split->desc_dma =3D dma;
>         return 0;
>
>  err_extra:
> +       kfree(dma);
> +err_dma:
>         kfree(state);
>  err_state:
>         return -ENOMEM;
> @@ -1108,6 +1130,7 @@ static void vring_free_split(struct vring_virtqueue=
_split *vring_split,
>
>         kfree(vring_split->desc_state);
>         kfree(vring_split->desc_extra);
> +       kfree(vring_split->desc_dma);
>  }
>
>  static int vring_alloc_queue_split(struct vring_virtqueue_split *vring_s=
plit,
> @@ -1209,7 +1232,8 @@ static int virtqueue_resize_split(struct virtqueue =
*_vq, u32 num)
>         if (err)
>                 goto err;
>
> -       err =3D vring_alloc_state_extra_split(&vring_split);
> +       err =3D vring_alloc_state_extra_split(&vring_split,
> +                                           vring_need_unmap_buffer(vq));
>         if (err)
>                 goto err_state_extra;
>
> @@ -1245,14 +1269,16 @@ static u16 packed_last_used(u16 last_used_idx)
>
>  /* caller must check vring_need_unmap_buffer() */
>  static void vring_unmap_extra_packed(const struct vring_virtqueue *vq,
> -                                    const struct vring_desc_extra *extra=
)
> +                                    unsigned int i)
>  {
> +       const struct vring_desc_extra *extra =3D &vq->packed.desc_extra[i=
];
> +       const struct vring_desc_dma *dma =3D &vq->packed.desc_dma[i];
>         u16 flags;
>
>         flags =3D extra->flags;

I don't think this can be compiled.

Thanks


