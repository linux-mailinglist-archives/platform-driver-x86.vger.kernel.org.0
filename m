Return-Path: <platform-driver-x86+bounces-1595-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C6624867476
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 13:12:20 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 1417CB20A2B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 26 Feb 2024 12:12:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A5260604A5;
	Mon, 26 Feb 2024 12:12:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="gWSUm9AT"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0956027A
	for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 12:12:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708949534; cv=none; b=Hi8nWad8mEADPefvwZyEt0tfbO+i3RXyyEg/WytxgL3UJNPO8xpol518yJ6MTHoJ9O+4TI3XkcmaozNzuRpnZdP6fv9yJqnAmgay9Hf0b/BTIVmFNy6SoRSd4zoJ/wN5DGp3fkJWVh0+x34zUsiVK30dw5MldmZS/RsAo0X1P68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708949534; c=relaxed/simple;
	bh=e0N6/2zQUM1QOqkgabnyahS6/9h1qmMEkf5qlHoAwkI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFHmuaAshBWhT+gJPXCC+GsuZOq284RLh9tC+Q2orRc9azBdanSP0YFmGCcBjbq+0N8tVg/h+fMI6nwSypYQUvvD5hHm65lfAPtGYXOjpD7fHToJxq1rJMoTUH+4m5JU8vSj2Di/jP2QiNCPBnPzv+wPOHYMHagT+HJJfD2et/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=gWSUm9AT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1708949532;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=lVX2aIqulG7pb2ZKAY6wEN/hr8j5RuJ02O3KYwJHnAk=;
	b=gWSUm9AT5UCgVZbInrct6QYaZaJCsjSd5nz8Kmdzoy6Zfiqzub4BKPhs8srSMHI4eGfi9S
	SdYu8UZ2nwoUkSKS7ADJP7Dt1HQvtA3PNR5eSLGs1cLDClMYaz+9irpBLeRT6ShIuxfS1o
	N5e+T1GOnfqeu0dOq+DXb4zAbKewMsI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-433-MGncc-LzPoO-EkgclH_m2Q-1; Mon, 26 Feb 2024 07:12:10 -0500
X-MC-Unique: MGncc-LzPoO-EkgclH_m2Q-1
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-33dadb50731so1627054f8f.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 26 Feb 2024 04:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708949529; x=1709554329;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lVX2aIqulG7pb2ZKAY6wEN/hr8j5RuJ02O3KYwJHnAk=;
        b=dIbasfN+WErsmz20/EkWUi9bXkUzrJpYjpua7PLPw0QnjwFTG0d3ZaEZ53lRvafGyC
         l9bCeJyx5DA6+i+VNVo4PFy0BkIkKWORD+Iw55/tviu83VPjq0TDMBnk/5qD2RZHCTv5
         cux3IeToVW+0kohf5n/0LGttMpKUthUWRvXo5q4R34pzK9v8tbmK1EvVOefhLxboZmVi
         uOLIXG7EuIbxOyq8S68uamtonmvFPtn/ylttnHlJxoOPMBssd9UWeL72fNsyfnIajQAz
         6zfraJ2wP2FAE30dlDCVsJuu8iyLwjU52fIgRBfYEB8R+tGtvMbQPK10Y9PmLL/mvLuq
         MkQw==
X-Forwarded-Encrypted: i=1; AJvYcCURxOzckC4v11Z/5jx+jqRZ9E5UZYzPu9p0ETiNfvO4G774K+3Rm+IBJM7QiJ39FdowfkbkJP2oDwNjL6RSYb/jI5erVqyOiGKdvsQmZDXF+G2C0g==
X-Gm-Message-State: AOJu0YwWVvFaTIaY1uMyx6e5hmQ+5NMkU0o/EUBK1ZeMvGO1rRacnPA/
	x0Bmb4uWZSXNytwEU95iLWPRpy2ZtrMiQII+442MXUsuGo/pclYCoglFBOS4USO8VG08Grjrdqk
	X99HV8oayLriz+e5Xn16jNbHkAXBuO5X2OorkXFi4tUXpRv6GAMxPb1IrlwYCxo5zqjUTMRA=
X-Received: by 2002:a05:6000:1961:b0:33d:7ea3:5b90 with SMTP id da1-20020a056000196100b0033d7ea35b90mr5099367wrb.65.1708949529664;
        Mon, 26 Feb 2024 04:12:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEf07k3zYsXuRGP5oY8KvF8nVh4PymH1C6S7+HQTQO4YjooNJ90xav4OKE27dfDSxc5oKl0bw==
X-Received: by 2002:a05:6000:1961:b0:33d:7ea3:5b90 with SMTP id da1-20020a056000196100b0033d7ea35b90mr5099329wrb.65.1708949529347;
        Mon, 26 Feb 2024 04:12:09 -0800 (PST)
Received: from redhat.com ([109.253.193.52])
        by smtp.gmail.com with ESMTPSA id t20-20020adfa2d4000000b0033de1e1bddcsm1414633wra.26.2024.02.26.04.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Feb 2024 04:12:08 -0800 (PST)
Date: Mon, 26 Feb 2024 07:12:01 -0500
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
	kvm@vger.kernel.org, bpf@vger.kernel.org,
	Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH vhost v2 19/19] virtio_net: sq support premapped mode
Message-ID: <20240226071010-mutt-send-email-mst@kernel.org>
References: <20240223082726.52915-1-xuanzhuo@linux.alibaba.com>
 <20240223082726.52915-20-xuanzhuo@linux.alibaba.com>
 <20240225032330-mutt-send-email-mst@kernel.org>
 <1708946440.799724-1-xuanzhuo@linux.alibaba.com>
 <20240226063120-mutt-send-email-mst@kernel.org>
 <1708947209.1148863-1-xuanzhuo@linux.alibaba.com>
 <20240226063532-mutt-send-email-mst@kernel.org>
 <1708947549.7906592-2-xuanzhuo@linux.alibaba.com>
 <20240226065709-mutt-send-email-mst@kernel.org>
 <1708949183.5224328-4-xuanzhuo@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1708949183.5224328-4-xuanzhuo@linux.alibaba.com>

On Mon, Feb 26, 2024 at 08:06:23PM +0800, Xuan Zhuo wrote:
> On Mon, 26 Feb 2024 06:57:17 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > On Mon, Feb 26, 2024 at 07:39:09PM +0800, Xuan Zhuo wrote:
> > > On Mon, 26 Feb 2024 06:36:53 -0500, "Michael S. Tsirkin" <mst@redhat.com> wrote:
> > > > On Mon, Feb 26, 2024 at 07:33:29PM +0800, Xuan Zhuo wrote:
> > > > > > what is dma_map_direct? can't find it in the tree.
> > > > >
> > > > > YES.
> > > > >
> > > > >
> > > > > diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> > > > > index 58db8fd70471..5a8f7a927aa1 100644
> > > > > --- a/kernel/dma/mapping.c
> > > > > +++ b/kernel/dma/mapping.c
> > > > > @@ -144,6 +144,18 @@ static inline bool dma_map_direct(struct device *dev,
> > > > >         return dma_go_direct(dev, *dev->dma_mask, ops);
> > > > >  }
> > > > >
> > > > > +bool dma_is_direct(struct device *dev)
> > > > > +{
> > > > > +       if (!dma_map_direct(dev, ops))
> > > > > +               return false;
> > > > > +
> > > > > +       if (is_swiotlb_force_bounce(dev))
> > > > > +               return false;
> > > > > +
> > > > > +       return true;
> > > > > +}
> > > > > +EXPORT_SYMBOL(dma_unmap_page_attrs);
> > > > > +
> > > > >
> > > > > Thanks.
> > > >
> > > >
> > > > where is it? linux-next?
> > >
> > >
> > > I see it in the vhost branch kernel/dma/mapping.c.
> > >
> > > Maybe you miss it.
> > >
> > > Thanks.
> > >
> >
> > which hash?
> 
> fd0b29af02bb75acc94eb08c06e2c10cbce2ea67


Thanks. Now I see it donnu what was wrong with me.


> >
> > > >
> > > > --
> > > > MST
> > > >
> >


