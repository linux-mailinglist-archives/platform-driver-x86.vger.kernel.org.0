Return-Path: <platform-driver-x86+bounces-2088-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A31687E2BE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Mar 2024 05:22:06 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id DB4AE1C20D20
	for <lists+platform-driver-x86@lfdr.de>; Mon, 18 Mar 2024 04:22:04 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AD2BC20332;
	Mon, 18 Mar 2024 04:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="REzjQUQ/"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6F54208A4
	for <platform-driver-x86@vger.kernel.org>; Mon, 18 Mar 2024 04:22:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710735722; cv=none; b=feUc/HvtN0QXjUXofmhDZlWKP+xkXRGqSA+fD8eeLaKw11JqYIMsNlNLL1KC9GnaIs25sYxRTze2/CJ2N4VVFvXNbkyDjMuN9bGJhw8/7oq6U/XeY6wHzVrhzdnN0hWszX2uNtd0UwSRAycb0nhm9WDr8+N2ham4EDYbcHG6S2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710735722; c=relaxed/simple;
	bh=ekPFn+KMupcA3DsAmtHNfwNQA8+5dgvbgt0ROt0BcLg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tIlKnMi0AcNd2uOAabkh0QuEfkYfvR+Zk4fQD7yFJll3kLBABOSTUtAOhpsUcoiT5PLE5QbycXdgzrPLBufJJytogmpJkZ16BFPJLhPrVo63+3XB6gEEedarrrRGw1eiHwUYO/Gdt2ZxuWXdRNiuAVBNaTMTQUNTV5TypBwqkM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=REzjQUQ/; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710735719;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YcMIvlcXZmHfP6Yrf0ho0KeclSMy8eBKOPAz1pFY4gM=;
	b=REzjQUQ/xUx0ppffbqg63agM6MVX5Hi/INHFhgbr2fFej9cKuKz34i+Ki6/7fKSzPHcZCY
	vuXFsbe6XQZyqEfTNRvbJIzoTxfIC/gs1GNjvBBHw8iWQFgTXUzRYre3XfPj8TW77oBtyW
	Jb2dtsvcyAYBSwdR0GNR0sW3c1w7g0U=
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-661-IL_p9kyNOnKh_I0IRKU5gQ-1; Mon, 18 Mar 2024 00:18:35 -0400
X-MC-Unique: IL_p9kyNOnKh_I0IRKU5gQ-1
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-1e01f53a293so5960055ad.0
        for <platform-driver-x86@vger.kernel.org>; Sun, 17 Mar 2024 21:18:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710735514; x=1711340314;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YcMIvlcXZmHfP6Yrf0ho0KeclSMy8eBKOPAz1pFY4gM=;
        b=pBx4hbVdbJA1g0k1byEgA3agphtB9rA6VaDPg8GHVh9dHM2+5zeonSsQ0Yadc5JiyC
         v2si2KKZTrv2GEs478qgGtuM0SGyGfmoXSIbsE0fdEGm7bcZDUAtpnp5zikrcCFRkDt2
         JuB+EG6yEDeoAYHfJdDFuoIeXxaXBhj1hyKR5vaXnXSl3rZiJOvIBdfftWSr7zuPBaDp
         LtpRgWYHGxpet/XcUrabKamfnFdfj4cxtWk4y5wBFTEmbSxmkC79lD0uoYEvZcmtGPry
         rU9UNuU57fZ8Q31ckCHYxNUi4uZ0PYgIUljrXLhEYsFwlfhqvHH7k7+bkVzz8vUHatGV
         xLTw==
X-Forwarded-Encrypted: i=1; AJvYcCUp9e0KoO54SJ2EDkDKwmT5TRYka1A7eOF0M7CkaQsvI1NRTsZaUnXDCj+miLnouxW+PRcDq5AM2lNwAngENg97dygP1Dn0NRVLN9IIKWGITnOkrQ==
X-Gm-Message-State: AOJu0YzzAz8NwpVHA5K6Si6XOJ3njxQjpFVlhSgRQawNwjbgmNpy6ztV
	iAhDVbCkhNsp+STYU7Q0n0kbOwJU9dC7/dqofl18ndcx/9M/pYNGTx36bSnnm+8SDH4biqPfyV9
	/BrXUlEmqkYlQV0Oor/Pgf1X3o3lQiRMMB9CnnRVv+Rb4UbWe7ABeEWoa2zLsLJceGWkRFWCc0v
	7F/KMyTaXuvNMo7DlR0QoF9MDMqTSHTPcNJDJyimkHNSUXGg==
X-Received: by 2002:a17:902:d68b:b0:1de:f91:3cf3 with SMTP id v11-20020a170902d68b00b001de0f913cf3mr9020690ply.55.1710735514573;
        Sun, 17 Mar 2024 21:18:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFC9oB0f9oW121Bvau3zWELRsInCawRgYQJTSjt+TRvAgqSmbvs/LBhfOLf7eU9EldQFzvUZZSWPwuwPejjiP0=
X-Received: by 2002:a17:902:d68b:b0:1de:f91:3cf3 with SMTP id
 v11-20020a170902d68b00b001de0f913cf3mr9020679ply.55.1710735514309; Sun, 17
 Mar 2024 21:18:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312021013.88656-1-xuanzhuo@linux.alibaba.com>
 <20240312021013.88656-2-xuanzhuo@linux.alibaba.com> <CACGkMEvVgfgAxLoKeFTgy-1GR0W07ciPYFuqs6PiWtKCnXuWTw@mail.gmail.com>
 <1710395908.7915084-1-xuanzhuo@linux.alibaba.com> <CACGkMEsT2JqJ1r_kStUzW0+-f+qT0C05n2A+Yrjpc-mHMZD_mQ@mail.gmail.com>
 <1710487245.6843069-1-xuanzhuo@linux.alibaba.com>
In-Reply-To: <1710487245.6843069-1-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Mon, 18 Mar 2024 12:18:23 +0800
Message-ID: <CACGkMEspzDTZP1yxkBz17MgU9meyfCUBDxG8mjm=acXHNxAxhg@mail.gmail.com>
Subject: Re: [PATCH vhost v3 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
To: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
Cc: virtualization@lists.linux.dev, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Johannes Berg <johannes@sipsolutions.net>, 
	Hans de Goede <hdegoede@redhat.com>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, "Michael S. Tsirkin" <mst@redhat.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 15, 2024 at 3:26=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.alibaba.c=
om> wrote:
>
> On Fri, 15 Mar 2024 11:51:48 +0800, Jason Wang <jasowang@redhat.com> wrot=
e:
> > On Thu, Mar 14, 2024 at 2:00=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.aliba=
ba.com> wrote:
> > >
> > > On Thu, 14 Mar 2024 11:12:24 +0800, Jason Wang <jasowang@redhat.com> =
wrote:
> > > > On Tue, Mar 12, 2024 at 10:10=E2=80=AFAM Xuan Zhuo <xuanzhuo@linux.=
alibaba.com> wrote:
> > > > >
> > > > > Now, we pass multi parameters to find_vqs. These parameters
> > > > > may work for transport or work for vring.
> > > > >
> > > > > And find_vqs has multi implements in many places:
> > > > >
> > > > >  arch/um/drivers/virtio_uml.c
> > > > >  drivers/platform/mellanox/mlxbf-tmfifo.c
> > > > >  drivers/remoteproc/remoteproc_virtio.c
> > > > >  drivers/s390/virtio/virtio_ccw.c
> > > > >  drivers/virtio/virtio_mmio.c
> > > > >  drivers/virtio/virtio_pci_legacy.c
> > > > >  drivers/virtio/virtio_pci_modern.c
> > > > >  drivers/virtio/virtio_vdpa.c
> > > > >
> > > > > Every time, we try to add a new parameter, that is difficult.
> > > > > We must change every find_vqs implement.
> > > > >
> > > > > One the other side, if we want to pass a parameter to vring,
> > > > > we must change the call path from transport to vring.
> > > > > Too many functions need to be changed.
> > > > >
> > > > > So it is time to refactor the find_vqs. We pass a structure
> > > > > cfg to find_vqs(), that will be passed to vring by transport.
> > > > >
> > > > > Because the vp_modern_create_avq() use the "const char *names[]",
> > > > > and the virtio_uml.c changes the name in the subsequent commit, s=
o
> > > > > change the "names" inside the virtio_vq_config from "const char *=
const
> > > > > *names" to "const char **names".
> > > > >
> > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> > > > > Reviewed-by: Ilpo J=3DE4rvinen <ilpo.jarvinen@linux.intel.com>
> > > >
> > > > The name seems broken here.
> > >
> > > Email APP bug.
> > >
> > > I will fix.
> > >
> > >
> > > >
> > > > [...]
> > > >
> > > > >
> > > > >  typedef void vq_callback_t(struct virtqueue *);
> > > > >
> > > > > +/**
> > > > > + * struct virtio_vq_config - configure for find_vqs()
> > > > > + * @cfg_idx: Used by virtio core. The drivers should set this to=
 0.
> > > > > + *     During the initialization of each vq(vring setup), we nee=
d to know which
> > > > > + *     item in the array should be used at that time. But since =
the item in
> > > > > + *     names can be null, which causes some item of array to be =
skipped, we
> > > > > + *     cannot use vq.index as the current id. So add a cfg_idx t=
o let vring
> > > > > + *     know how to get the current configuration from the array =
when
> > > > > + *     initializing vq.
> > > >
> > > > So this design is not good. If it is not something that the driver
> > > > needs to care about, the core needs to hide it from the API.
> > >
> > > The driver just ignore it. That will be beneficial to the virtio core=
.
> > > Otherwise, we must pass one more parameter everywhere.
> >
> > I don't get here, it's an internal logic and we've already done that.
>
>
> ## Then these must add one param "cfg_idx";
>
>  struct virtqueue *vring_create_virtqueue(struct virtio_device *vdev,
>                                          unsigned int index,
>                                          struct vq_transport_config *tp_c=
fg,
>                                          struct virtio_vq_config *cfg,
> -->                                      uint cfg_idx);
>
>  struct virtqueue *vring_new_virtqueue(struct virtio_device *vdev,
>                                       unsigned int index,
>                                       void *pages,
>                                       struct vq_transport_config *tp_cfg,
>                                       struct virtio_vq_config *cfg,
> -->                                      uint cfg_idx);
>
>
> ## The functions inside virtio_ring also need to add a new param, such as=
:
>
>  static struct virtqueue *vring_create_virtqueue_split(struct virtio_devi=
ce *vdev,
>                                                       unsigned int index,
>                                                       struct vq_transport=
_config *tp_cfg,
>                                                       struct virtio_vq_co=
nfig,
> -->                                                   uint cfg_idx);
>
>
>

I guess what I'm missing is when could the index differ from cfg_idx?

Thanks

> Thanks.
>
>
>
>
> >
> > Thanks
> >
> > >
> > > Thanks.
> > >
> > > >
> > > > Thanks
> > > >
> > >
> >
>


