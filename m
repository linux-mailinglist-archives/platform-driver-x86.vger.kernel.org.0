Return-Path: <platform-driver-x86+bounces-1132-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id EE384843AC5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 10:17:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id AA06D28FD5A
	for <lists+platform-driver-x86@lfdr.de>; Wed, 31 Jan 2024 09:17:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D2CE179DAD;
	Wed, 31 Jan 2024 09:13:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="N7kBPgcS"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A3D969D2F
	for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 09:13:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706692396; cv=none; b=BLi8vuhIL6GEMNz77qGMS6GvJclDsTNxnOIKqDrLjcthgVhMD/FUB7rKq/MlnWUDwT5DZSMIclCiWAVFqitjcEXGoSVyTI6IiDhNk011mBVD/kTW1RsxCvKns/TBLWHZDp+/5y1EbxT3GxE+nNve4ySZjKF2+VVu/MLvis7UlIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706692396; c=relaxed/simple;
	bh=GFZDXlK/s4D6vSBTxs5Uj6beZ7wLcQBUCOrs3aA1zrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mNgqYBV/wb97ZI0JG9IRkpu0paYl2gHLDXxDsWOy8CzR0o568i2qz0FfRY+F2yk1nprYVV29xvMKPH7GARu79kBFaO7wf0h6pnBuPVtsD3ZtEE+opbkPTsqU6IH2mlYNaUnUnzru0tV++tKTYtLO6PbJZJotT7pMWTtL8IkYQBs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=N7kBPgcS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706692394;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GFZDXlK/s4D6vSBTxs5Uj6beZ7wLcQBUCOrs3aA1zrk=;
	b=N7kBPgcS3SOu0RNWXUvW6sLMSs97kVg5hAuyLL2UucWOPI02SS7gbLdeFaiaoSZ9k1Rtre
	W0kNPqD8fcmFAy8vULepFgn8J37h9pCwpFB1ezU3vW354LEhOjCOlbbBBmEb5qGf9DvGVZ
	I9i3GWRoBx8JtT/G+63ClST0VhJh3F0=
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-636-94CTO5oPPZWF7Rh7BdAh0w-1; Wed, 31 Jan 2024 04:13:12 -0500
X-MC-Unique: 94CTO5oPPZWF7Rh7BdAh0w-1
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-46b32362dbbso1279328137.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 31 Jan 2024 01:13:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706692392; x=1707297192;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GFZDXlK/s4D6vSBTxs5Uj6beZ7wLcQBUCOrs3aA1zrk=;
        b=GsYVuujhvKRpPnU28Nc2ksrd2Z2x3jqY1kpD2BNbp8FpQsNMuHnbgxvmwGanJZcwHw
         Rk8JgdTg0BOELs6Q+7lZvVqcDYsCZ2h5xi8yVkl8e5CdEwW8gp7b6TN1nIMp6bLnQ+Ij
         cNkzV5ODcLDX9YXD7SAAFpWYI5y4C80+AuCCo3TIfawxrWsCN62NyOC1T7cA5Z/KrsvL
         0X92pYNpJFpNLmbmO2Gam7AnpexMv+feas45YR5wrA58e4FP2hKaxvTzrr7hBL7T7CVQ
         gJemgmZokBWOotAkmYvPIJj5habtjq5GVbak12RhcMejglqma7HhoZXnSyojZT9Sc8OC
         yzsA==
X-Gm-Message-State: AOJu0Yy2jqAxo7HFl0ojOxeck/48qelGJL6wlvXlwjiPmh/jjLvUNf1C
	gNEEWHog2kgApOo06ppiq64Ry4FsI9jOKpYoF2o922NmKD7gIXV3OzswHuVDmjFiJh6zaNajbAe
	kE6dX9HfMu/6AOLgIRrJKABSVq+y5V5IAwmRKS+1r8eIbuiIlbAVIgSNhraj7atL2DyeRpOyYFK
	yiPPGBRHP+u9K/HHMHW+zSq+yKemEGku9TyCHljD0iSw7FWA==
X-Received: by 2002:a67:ec18:0:b0:469:96dd:4a93 with SMTP id d24-20020a67ec18000000b0046996dd4a93mr924026vso.10.1706692391848;
        Wed, 31 Jan 2024 01:13:11 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/cR50d4YHDD+w1IZRT3VXxyAnkVgoZf6Jvq1cGXaHp7Wnd5AI92yFzXhl3he/qD1ctU9FKOVMa+BK0TXujPo=
X-Received: by 2002:a67:ec18:0:b0:469:96dd:4a93 with SMTP id
 d24-20020a67ec18000000b0046996dd4a93mr924015vso.10.1706692391631; Wed, 31 Jan
 2024 01:13:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240130114224.86536-1-xuanzhuo@linux.alibaba.com> <20240130114224.86536-9-xuanzhuo@linux.alibaba.com>
In-Reply-To: <20240130114224.86536-9-xuanzhuo@linux.alibaba.com>
From: Jason Wang <jasowang@redhat.com>
Date: Wed, 31 Jan 2024 17:12:38 +0800
Message-ID: <CACGkMEsOR-Sz6tZC_Lm-Qxdh4Ugjyn4APsX28rkL6nA87oa_Yg@mail.gmail.com>
Subject: Re: [PATCH vhost 08/17] virtio: vring_new_virtqueue(): pass struct
 instead of multi parameters
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
> Just like find_vqs(), it is time to refactor the
> vring_new_virtqueue(). We pass the similar struct to
> vring_new_virtqueue.
>

Well, the vring_create_virtqueue() is converted with a structure.

We need to be consistent. And it seems better to use a separate patch
for vring_create_virtqueue() as well.

Thanks


