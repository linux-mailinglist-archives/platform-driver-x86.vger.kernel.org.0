Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 09C2355CA46
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Jun 2022 14:58:16 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232406AbiF0Gjz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jun 2022 02:39:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232388AbiF0Gjy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jun 2022 02:39:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 356442BF9
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 23:39:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656311992;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=U7baKcmVh0uhuh+ZmBGa53jqLb2UYPCAjccnnH6jK0k=;
        b=RBMXiC1qYB+yM8w4m4XxcH1W4IekBWfTlqb/GcduNEEXtOwaM1ck51jGi/b7hfLKmSHy0p
        CSAUoZqCmGaGUF5zR7bq7sbVJKfhAPp903bFFStW7OEYHc0L7lcbiw0PIGwhnwjtHY8qOA
        WJB4Q/xuVHbw7h5BVeHbg8IfzGaA+jY=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-281-YwAM4nPVNiOgoZOvGT9aQA-1; Mon, 27 Jun 2022 02:39:50 -0400
X-MC-Unique: YwAM4nPVNiOgoZOvGT9aQA-1
Received: by mail-wm1-f70.google.com with SMTP id i184-20020a1c3bc1000000b003a026f48333so3145937wma.4
        for <platform-driver-x86@vger.kernel.org>; Sun, 26 Jun 2022 23:39:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=U7baKcmVh0uhuh+ZmBGa53jqLb2UYPCAjccnnH6jK0k=;
        b=d856pb1YLgV1A09/dY9HGCmfYOgXEXgr93HgpXIwLlgBg4mxp9/T7UtzGWC1zSQrKy
         jsmWiB4KBNs4Ux/svLhSvxtUkMaXb4WoLk7aeJCQSHKNSkIaaNW5PxxZJpVkXnjG6qEV
         RMpcRjcKnGuodiIDGfILlXrDeJFbdAzHnPErh05HUoG9tW1peGyK32skj+a7Y/Z1jlbs
         y7wmn0hBN0/gA+BPS6jZZgOU6TRMbUpNBQ1QZJZDNJ4d3nLqKdrP96fSZQ4pxBiDAAxj
         MMnxco2lBElVhqYZ42YJTKLjdJ4hSRG3kAK3ZEaDX6XGT2GAH80mC2fGh9tEmJTLEc3r
         U/Yg==
X-Gm-Message-State: AJIora/jI61uqqiTavSJr/YsduaLE+81frcU4vmpGzqBsRvLLz4hcm1Q
        RhFJPH//a01dMSuyNcEH5QR+1EBC1Mii+Hf4CuWas5zmVzeBlSqBDPO89d3UGwIenLNkr6E5jc8
        fyqiBqRaouUtsbVxAfGjIkto9agEYdwfIVA==
X-Received: by 2002:a1c:7719:0:b0:3a0:31a6:4469 with SMTP id t25-20020a1c7719000000b003a031a64469mr13386069wmi.20.1656311988764;
        Sun, 26 Jun 2022 23:39:48 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vfc26YvQIey3qttFGe5qu2ZyIXAHXaFMfl6hGpqk+G+5KirT06gbQyA+crLIwD71j66IUjig==
X-Received: by 2002:a1c:7719:0:b0:3a0:31a6:4469 with SMTP id t25-20020a1c7719000000b003a031a64469mr13386024wmi.20.1656311988469;
        Sun, 26 Jun 2022 23:39:48 -0700 (PDT)
Received: from redhat.com ([2.54.45.90])
        by smtp.gmail.com with ESMTPSA id bg21-20020a05600c3c9500b003a046549a85sm5777975wmb.37.2022.06.26.23.39.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 23:39:47 -0700 (PDT)
Date:   Mon, 27 Jun 2022 02:39:41 -0400
From:   "Michael S. Tsirkin" <mst@redhat.com>
To:     Jason Wang <jasowang@redhat.com>
Cc:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        Johannes Berg <johannes@sipsolutions.net>,
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
Subject: Re: [PATCH v10 25/41] virtio_pci: struct virtio_pci_common_cfg add
 queue_notify_data
Message-ID: <20220627023841-mutt-send-email-mst@kernel.org>
References: <20220624025621.128843-1-xuanzhuo@linux.alibaba.com>
 <20220624025621.128843-26-xuanzhuo@linux.alibaba.com>
 <20220624025817-mutt-send-email-mst@kernel.org>
 <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACGkMEseptD=45j3kQr0yciRxR679Jcig=292H07-RYC2vXmFQ@mail.gmail.com>
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jun 27, 2022 at 10:30:42AM +0800, Jason Wang wrote:
> On Fri, Jun 24, 2022 at 2:59 PM Michael S. Tsirkin <mst@redhat.com> wrote:
> >
> > On Fri, Jun 24, 2022 at 10:56:05AM +0800, Xuan Zhuo wrote:
> > > Add queue_notify_data in struct virtio_pci_common_cfg, which comes from
> > > here https://github.com/oasis-tcs/virtio-spec/issues/89
> > >
> > > For not breaks uABI, add a new struct virtio_pci_common_cfg_notify.
> >
> > What exactly is meant by not breaking uABI?
> > Users are supposed to be prepared for struct size to change ... no?
> 
> Not sure, any doc for this?
> 
> Thanks


Well we have this:

        The drivers SHOULD only map part of configuration structure
        large enough for device operation.  The drivers MUST handle
        an unexpectedly large \field{length}, but MAY check that \field{length}
        is large enough for device operation.



> 
> >
> >
> > > Since I want to add queue_reset after queue_notify_data, I submitted
> > > this patch first.
> > >
> > > Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> > > Acked-by: Jason Wang <jasowang@redhat.com>
> > > ---
> > >  include/uapi/linux/virtio_pci.h | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> > > index 3a86f36d7e3d..22bec9bd0dfc 100644
> > > --- a/include/uapi/linux/virtio_pci.h
> > > +++ b/include/uapi/linux/virtio_pci.h
> > > @@ -166,6 +166,13 @@ struct virtio_pci_common_cfg {
> > >       __le32 queue_used_hi;           /* read-write */
> > >  };
> > >
> > > +struct virtio_pci_common_cfg_notify {
> > > +     struct virtio_pci_common_cfg cfg;
> > > +
> > > +     __le16 queue_notify_data;       /* read-write */
> > > +     __le16 padding;
> > > +};
> > > +
> > >  /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
> > >  struct virtio_pci_cfg_cap {
> > >       struct virtio_pci_cap cap;
> > > --
> > > 2.31.0
> >

