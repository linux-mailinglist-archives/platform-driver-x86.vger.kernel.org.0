Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9C0104FD979
	for <lists+platform-driver-x86@lfdr.de>; Tue, 12 Apr 2022 12:40:53 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355285AbiDLIRX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 12 Apr 2022 04:17:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358840AbiDLHmQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 12 Apr 2022 03:42:16 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 657F353E24
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 00:19:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1649747962;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Yuz95x1G3zlqb83uNRLz/nX1y2Nb6heM9sreLygHM+8=;
        b=e1xsGA0u6k5ZzQuDGpM/i83UMVxauBVEGYneTs/iMGaPzymbSZYNASxECQTqIKj+fMymyn
        hQVGp5+O8G68QuBNZ2IKDKLnn8meKQ8Xwv60fugrUt09YGE7lpcolO319+B2y3ZIPBxr1i
        eEyc4XLRXjoG3nAHVQQ5E5bxdLYlQ9c=
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-195-JaAox17JP_ufL5PSmIM5rA-1; Tue, 12 Apr 2022 03:19:21 -0400
X-MC-Unique: JaAox17JP_ufL5PSmIM5rA-1
Received: by mail-pf1-f199.google.com with SMTP id y7-20020a62ce07000000b005058f370a08so5726937pfg.6
        for <platform-driver-x86@vger.kernel.org>; Tue, 12 Apr 2022 00:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Yuz95x1G3zlqb83uNRLz/nX1y2Nb6heM9sreLygHM+8=;
        b=StPSvpsKtwkhp7kLBXpBoUcsucM4uJB9sb/DwKGmmga8ZDFNaGnJ5XjbzRfSLGnNDR
         QAdeOb5Nd21MniK44clWzmek7bCHcXFySJd52iPA0yYigTl52s2PEA5SifA4MqmSLk7L
         N/gBwN7LPD5OIkbwIOr6qSysIXV7sYa75x+P19n5XdLTtT5Cvg0AT1MITevgafV8vAy4
         HecejR7lOXOEdxZW8tqZLy413VJmXK3dnXZrmWoUn2I03KY0f4u2FxINaxFFF0kFVaqz
         Yy7XY9a1NgzR4v4HaWgadZGoBT7XNIiEIHi7gxzjczkvFzLf/iLLG2SX9VTJCQDYxi7f
         EFLQ==
X-Gm-Message-State: AOAM532UwFBNvguBccv3jkdvf7tKa6cb/o4VwKssXMluuTHcSs4qce3U
        yOQFSJb73eFl/CFHWBEBVvvUyAeM5hug2JR4edVABLlgYkR6zpat5PML9Tb3Lj+qNfCv+Q0LoEt
        H8CFtSLTR47fPLkTGLEZ4po97En2ZGyx5kw==
X-Received: by 2002:a63:ce45:0:b0:399:1124:fbfe with SMTP id r5-20020a63ce45000000b003991124fbfemr30142566pgi.542.1649747959959;
        Tue, 12 Apr 2022 00:19:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJybC3H9odgtD5WvWO3Wfz5iznlcc/pnW1u61iazVEqAlovz3OVbp6nLoj0UKzRc5hYeHz5xRQ==
X-Received: by 2002:a63:ce45:0:b0:399:1124:fbfe with SMTP id r5-20020a63ce45000000b003991124fbfemr30142555pgi.542.1649747959749;
        Tue, 12 Apr 2022 00:19:19 -0700 (PDT)
Received: from [10.72.14.5] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id oo16-20020a17090b1c9000b001b89e05e2b2sm1791569pjb.34.2022.04.12.00.19.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 12 Apr 2022 00:19:19 -0700 (PDT)
Message-ID: <2776b925-1989-40b2-44ed-6964105e22cb@redhat.com>
Date:   Tue, 12 Apr 2022 15:19:08 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.7.0
Subject: Re: [PATCH v9 29/32] virtio_net: get ringparam by
 virtqueue_get_vring_max_size()
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
Cc:     Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>,
        Anton Ivanov <anton.ivanov@cambridgegreys.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        Vadim Pasternak <vadimp@nvidia.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Cornelia Huck <cohuck@redhat.com>,
        Halil Pasic <pasic@linux.ibm.com>,
        Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Christian Borntraeger <borntraeger@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Sven Schnelle <svens@linux.ibm.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Jesper Dangaard Brouer <hawk@kernel.org>,
        John Fastabend <john.fastabend@gmail.com>,
        Johannes Berg <johannes.berg@intel.com>,
        Vincent Whitchurch <vincent.whitchurch@axis.com>,
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220406034346.74409-1-xuanzhuo@linux.alibaba.com>
 <20220406034346.74409-30-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220406034346.74409-30-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/4/6 上午11:43, Xuan Zhuo 写道:
> Use virtqueue_get_vring_max_size() in virtnet_get_ringparam() to set
> tx,rx_max_pending.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---


Acked-by: Jason Wang <jasowang@redhat.com>


>   drivers/net/virtio_net.c | 8 ++++----
>   1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index dad497a47b3a..96d96c666c8c 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -2177,10 +2177,10 @@ static void virtnet_get_ringparam(struct net_device *dev,
>   {
>   	struct virtnet_info *vi = netdev_priv(dev);
>   
> -	ring->rx_max_pending = virtqueue_get_vring_size(vi->rq[0].vq);
> -	ring->tx_max_pending = virtqueue_get_vring_size(vi->sq[0].vq);
> -	ring->rx_pending = ring->rx_max_pending;
> -	ring->tx_pending = ring->tx_max_pending;
> +	ring->rx_max_pending = virtqueue_get_vring_max_size(vi->rq[0].vq);
> +	ring->tx_max_pending = virtqueue_get_vring_max_size(vi->sq[0].vq);
> +	ring->rx_pending = virtqueue_get_vring_size(vi->rq[0].vq);
> +	ring->tx_pending = virtqueue_get_vring_size(vi->sq[0].vq);
>   }
>   
>   

