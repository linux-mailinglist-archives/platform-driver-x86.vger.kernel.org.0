Return-Path: <platform-driver-x86+bounces-2110-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 7ED77880E75
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Mar 2024 10:23:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DF6D9B2229A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 20 Mar 2024 09:23:17 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8B4383A1DD;
	Wed, 20 Mar 2024 09:23:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QhCoCYhR"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9736039FEB
	for <platform-driver-x86@vger.kernel.org>; Wed, 20 Mar 2024 09:23:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710926589; cv=none; b=mmxF8Ku+vCmasrlHQjT6oR4nKvuKNDR3ulHBFpns3Bwt87HdkzBW8lyiRulxZLHFEiRRhfvQqUXSy36zSEboxDK8hV74l625PJpywrkPi6S/L8oWn2OnOhjJsVOpoA6jrYh5nVIDUrfz8dm4vvCMBUnQ65d0fbVAs00dYmfaYj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710926589; c=relaxed/simple;
	bh=9shQ/eAmTaQK6Q7YTowaKS9ym+5bwIiLd/mi5mRa/SU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VF3C1YzTVuzxttsQh7SRRHHbxZ7e1unGbinSQDnI++lOBCPHYDakvq2fEGZmEpHwURhDafIvK+q86EQH7wqh6b355G4s+9ICO5HxihGxfWHT1EbThUN+9hsP0dKOWzUf6wPzLsRR2bA+3fvUOziuKA9d5uTrGFVU+r0HW/jygB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QhCoCYhR; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710926586;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9Vjg8zrCnFg/tqbys7l4j13t+oLp9giExjkF7oHtAuI=;
	b=QhCoCYhRI2MbWBXPLyH3Uy3IhBeQ0I4z65vOwTr5zjLVg2ZXwQ0igsLHf4TE/OxgCsHRyG
	MmbJOMkFB5EDnnS9BezpAAN1lNOGnzk65ckb2D2+Q8mUTVFH9wqQZwfR0sNEX3rq1LdDW0
	8Luhf/W+dKe0fGQRx1B6esSTB2CXDcc=
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-QQEACTPDMn21bSLCmG5p-A-1; Wed, 20 Mar 2024 05:23:02 -0400
X-MC-Unique: QQEACTPDMn21bSLCmG5p-A-1
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-29905ac5c21so4957184a91.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 20 Mar 2024 02:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710926581; x=1711531381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9Vjg8zrCnFg/tqbys7l4j13t+oLp9giExjkF7oHtAuI=;
        b=XRTmmCpkNvOLjw/ioiJCEG9UatiuSoqLNN2WKqRQpGiJGnKfLSH4K2zTm6ilq9tsRh
         X5TmMe8ZpT+993lz5oLsmGGu6SALwEJ23RNn+AFG1ZB0VeIKtkx3we+jD4euT097OHu4
         XazDib10XZeNHEPAoT4/Ldn2oy0LYRdlorYUQ5XJqxKjYv7XoEEUgpM9zRH24rkp18i8
         w8w7B7zAdUkd9eZRU+0EzUfKqadYe6zXLG8V+JOmX/PTWcCx04u89oljxSpQkOFOq8aj
         r/33HSj9cVBTaS77FnOdwfHpuIiDiMvb/LS0zlPamUANLZqwSGECdmj5Di9Js7W/Mqz5
         klzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUwU1tfKlVpcT3cdVwzrxJ1hwLsdb+cNUfQ8Y8DMceiJQLdntlM+fY6J+2HgTHoWrJNKF0SzYN8SCldEGs7zJGDmzBZ2/X8qRW4b8Oh8glug3g9kw==
X-Gm-Message-State: AOJu0YxMgm+vnqSrRcPcMxvs7SEj1X4WmoP4NtojCax497dT8Epdbnq9
	ZAA+EFrhdx5CsWfwr30eWbKIP0eu6KuKCJTi46zGxNfzpFIyaUKKYc55i6Ty1Xd5nYprmjMvXeL
	WF1NSZt2OWtmY1SoFCJ+KoQSJAvVPIxC0U4p15HS3yIBCco10ecQrAUcMV/ToHHK9PIRhkzPQnK
	ddCLgB8rxB3Q7Qw2w7S1nelOvqANBxkgt4mOWQlfgW5iGmig==
X-Received: by 2002:a17:90b:3649:b0:29e:926:b582 with SMTP id nh9-20020a17090b364900b0029e0926b582mr10780669pjb.23.1710926581657;
        Wed, 20 Mar 2024 02:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGa5t5yKeGVgUBrB/m7ZYinl2zOV2h69MtzYov0EG5AwEvBxWiWBFcij6dKejn6wI3bBgvnbbPLiFiqn5O6R+A=
X-Received: by 2002:a17:90b:3649:b0:29e:926:b582 with SMTP id
 nh9-20020a17090b364900b0029e0926b582mr10780641pjb.23.1710926581319; Wed, 20
 Mar 2024 02:23:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240312021013.88656-1-xuanzhuo@linux.alibaba.com>
 <20240312021013.88656-2-xuanzhuo@linux.alibaba.com> <CACGkMEvVgfgAxLoKeFTgy-1GR0W07ciPYFuqs6PiWtKCnXuWTw@mail.gmail.com>
 <1710395908.7915084-1-xuanzhuo@linux.alibaba.com> <CACGkMEsT2JqJ1r_kStUzW0+-f+qT0C05n2A+Yrjpc-mHMZD_mQ@mail.gmail.com>
 <1710487245.6843069-1-xuanzhuo@linux.alibaba.com> <CACGkMEspzDTZP1yxkBz17MgU9meyfCUBDxG8mjm=acXHNxAxhg@mail.gmail.com>
 <1710741592.205804-1-xuanzhuo@linux.alibaba.com> <20240319025726-mutt-send-email-mst@kernel.org>
In-Reply-To: <20240319025726-mutt-send-email-mst@kernel.org>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 20 Mar 2024 17:22:50 +0800
Message-ID: <CACGkMEsO6e2=v36F=ezhHCEaXqG0+AhkCM2ZgmKAtyWncnif5Q@mail.gmail.com>
Subject: Re: [PATCH vhost v3 1/4] virtio: find_vqs: pass struct instead of
 multi parameters
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Xuan Zhuo <xuanzhuo@linux.alibaba.com>, virtualization@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Hans de Goede <hdegoede@redhat.com>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Vadim Pasternak <vadimp@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Cornelia Huck <cohuck@redhat.com>, 
	Halil Pasic <pasic@linux.ibm.com>, Eric Farman <farman@linux.ibm.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>, 
	Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger <borntraeger@linux.ibm.com>, 
	Sven Schnelle <svens@linux.ibm.com>, linux-um@lists.infradead.org, 
	platform-driver-x86@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
	linux-s390@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 19, 2024 at 2:58=E2=80=AFPM Michael S. Tsirkin <mst@redhat.com>=
 wrote:
>
> On Mon, Mar 18, 2024 at 01:59:52PM +0800, Xuan Zhuo wrote:
> > On Mon, 18 Mar 2024 12:18:23 +0800, Jason Wang <jasowang@redhat.com> wr=
ote:
> > > On Fri, Mar 15, 2024 at 3:26=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux.ali=
baba.com> wrote:
> > > >
> > > > On Fri, 15 Mar 2024 11:51:48 +0800, Jason Wang <jasowang@redhat.com=
> wrote:
> > > > > On Thu, Mar 14, 2024 at 2:00=E2=80=AFPM Xuan Zhuo <xuanzhuo@linux=
.alibaba.com> wrote:
> > > > > >
> > > > > > On Thu, 14 Mar 2024 11:12:24 +0800, Jason Wang <jasowang@redhat=
.com> wrote:
> > > > > > > On Tue, Mar 12, 2024 at 10:10=E2=80=AFAM Xuan Zhuo <xuanzhuo@=
linux.alibaba.com> wrote:
> > > > > > > >
> > > > > > > > Now, we pass multi parameters to find_vqs. These parameters
> > > > > > > > may work for transport or work for vring.
> > > > > > > >
> > > > > > > > And find_vqs has multi implements in many places:
> > > > > > > >
> > > > > > > >  arch/um/drivers/virtio_uml.c
> > > > > > > >  drivers/platform/mellanox/mlxbf-tmfifo.c
> > > > > > > >  drivers/remoteproc/remoteproc_virtio.c
> > > > > > > >  drivers/s390/virtio/virtio_ccw.c
> > > > > > > >  drivers/virtio/virtio_mmio.c
> > > > > > > >  drivers/virtio/virtio_pci_legacy.c
> > > > > > > >  drivers/virtio/virtio_pci_modern.c
> > > > > > > >  drivers/virtio/virtio_vdpa.c
> > > > > > > >
> > > > > > > > Every time, we try to add a new parameter, that is difficul=
t.
> > > > > > > > We must change every find_vqs implement.
> > > > > > > >
> > > > > > > > One the other side, if we want to pass a parameter to vring=
,
> > > > > > > > we must change the call path from transport to vring.
> > > > > > > > Too many functions need to be changed.
> > > > > > > >
> > > > > > > > So it is time to refactor the find_vqs. We pass a structure
> > > > > > > > cfg to find_vqs(), that will be passed to vring by transpor=
t.
> > > > > > > >
> > > > > > > > Because the vp_modern_create_avq() use the "const char *nam=
es[]",
> > > > > > > > and the virtio_uml.c changes the name in the subsequent com=
mit, so
> > > > > > > > change the "names" inside the virtio_vq_config from "const =
char *const
> > > > > > > > *names" to "const char **names".
> > > > > > > >
> > > > > > > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > > > > > > Acked-by: Johannes Berg <johannes@sipsolutions.net>
> > > > > > > > Reviewed-by: Ilpo J=3DE4rvinen <ilpo.jarvinen@linux.intel.c=
om>
> > > > > > >
> > > > > > > The name seems broken here.
> > > > > >
> > > > > > Email APP bug.
> > > > > >
> > > > > > I will fix.
> > > > > >
> > > > > >
> > > > > > >
> > > > > > > [...]
> > > > > > >
> > > > > > > >
> > > > > > > >  typedef void vq_callback_t(struct virtqueue *);
> > > > > > > >
> > > > > > > > +/**
> > > > > > > > + * struct virtio_vq_config - configure for find_vqs()
> > > > > > > > + * @cfg_idx: Used by virtio core. The drivers should set t=
his to 0.
> > > > > > > > + *     During the initialization of each vq(vring setup), =
we need to know which
> > > > > > > > + *     item in the array should be used at that time. But =
since the item in
> > > > > > > > + *     names can be null, which causes some item of array =
to be skipped, we
> > > > > > > > + *     cannot use vq.index as the current id. So add a cfg=
_idx to let vring
> > > > > > > > + *     know how to get the current configuration from the =
array when
> > > > > > > > + *     initializing vq.
> > > > > > >
> > > > > > > So this design is not good. If it is not something that the d=
river
> > > > > > > needs to care about, the core needs to hide it from the API.
> > > > > >
> > > > > > The driver just ignore it. That will be beneficial to the virti=
o core.
> > > > > > Otherwise, we must pass one more parameter everywhere.
> > > > >
> > > > > I don't get here, it's an internal logic and we've already done t=
hat.
> > > >
> > > >
> > > > ## Then these must add one param "cfg_idx";
> > > >
> > > >  struct virtqueue *vring_create_virtqueue(struct virtio_device *vde=
v,
> > > >                                          unsigned int index,
> > > >                                          struct vq_transport_config=
 *tp_cfg,
> > > >                                          struct virtio_vq_config *c=
fg,
> > > > -->                                      uint cfg_idx);
> > > >
> > > >  struct virtqueue *vring_new_virtqueue(struct virtio_device *vdev,
> > > >                                       unsigned int index,
> > > >                                       void *pages,
> > > >                                       struct vq_transport_config *t=
p_cfg,
> > > >                                       struct virtio_vq_config *cfg,
> > > > -->                                      uint cfg_idx);
> > > >
> > > >
> > > > ## The functions inside virtio_ring also need to add a new param, s=
uch as:
> > > >
> > > >  static struct virtqueue *vring_create_virtqueue_split(struct virti=
o_device *vdev,
> > > >                                                       unsigned int =
index,
> > > >                                                       struct vq_tra=
nsport_config *tp_cfg,
> > > >                                                       struct virtio=
_vq_config,
> > > > -->                                                   uint cfg_idx)=
;
> > > >
> > > >
> > > >
> > >
> > > I guess what I'm missing is when could the index differ from cfg_idx?
> >
> >
> >  @cfg_idx: Used by virtio core. The drivers should set this to 0.
> >      During the initialization of each vq(vring setup), we need to know=
 which
> >      item in the array should be used at that time. But since the item =
in
> >      names can be null, which causes some item of array to be skipped, =
we
> >      ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> >      cannot use vq.index as the current id. So add a cfg_idx to let vri=
ng
> >      know how to get the current configuration from the array when
> >      initializing vq.
> >
> >
> > static int vp_find_vqs_msix(struct virtio_device *vdev, unsigned int nv=
qs,
> >
> >       ................
> >
> >       for (i =3D 0; i < nvqs; ++i) {
> >               if (!names[i]) {
> >                       vqs[i] =3D NULL;
> >                       continue;
> >               }
> >
> >               if (!callbacks[i])
> >                       msix_vec =3D VIRTIO_MSI_NO_VECTOR;
> >               else if (vp_dev->per_vq_vectors)
> >                       msix_vec =3D allocated_vectors++;
> >               else
> >                       msix_vec =3D VP_MSIX_VQ_VECTOR;
> >               vqs[i] =3D vp_setup_vq(vdev, queue_idx++, callbacks[i], n=
ames[i],
> >                                    ctx ? ctx[i] : false,
> >                                    msix_vec);
> >
> >
> > Thanks.
>
>
> Jason what do you think is the way to resolve this?

I wonder which driver doesn't use a specific virtqueue in this case.

And it looks to me, introducing a per-vq-config struct might be better
then we have

virtio_vqs_config {
      unsigned int nvqs;
      struct virtio_vq_config *configs;
}

So we don't need the cfg_idx stuff.

Thanks

>
> > >
> > > Thanks
> > >
> > > > Thanks.
> > > >
> > > >
> > > >
> > > >
> > > > >
> > > > > Thanks
> > > > >
> > > > > >
> > > > > > Thanks.
> > > > > >
> > > > > > >
> > > > > > > Thanks
> > > > > > >
> > > > > >
> > > > >
> > > >
> > >
>


