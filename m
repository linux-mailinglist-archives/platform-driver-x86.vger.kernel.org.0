Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8EF37564C22
	for <lists+platform-driver-x86@lfdr.de>; Mon,  4 Jul 2022 05:46:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230420AbiGDDqL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 3 Jul 2022 23:46:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229629AbiGDDqK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 3 Jul 2022 23:46:10 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 7F0B36308
        for <platform-driver-x86@vger.kernel.org>; Sun,  3 Jul 2022 20:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656906368;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=k1fqdfPA46kNXwMkn+hgf7CVCtyPIFPh7p9ueCijmgk=;
        b=QpIFeTRDbwD2e2OIQaO1J7XiDtNxpQ4gR1KsMZEHXJ7DvWkQKbEwMLX4uOJPoUUmzQBQYE
        H8vTNanROKKAUR4cM/Hz8YCnJSmqKS8k9a5Vk+BFTnkiUnWr2keXhqPddCfB11ZpafIfWh
        pifM19KsXCR0Jf7icri1Qv9o3RKZ7os=
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-633-U24JtqCSPJ-n5zrpIqgZOw-1; Sun, 03 Jul 2022 23:46:07 -0400
X-MC-Unique: U24JtqCSPJ-n5zrpIqgZOw-1
Received: by mail-pl1-f199.google.com with SMTP id x15-20020a170902ec8f00b0016be3695c2aso995638plg.10
        for <platform-driver-x86@vger.kernel.org>; Sun, 03 Jul 2022 20:46:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=k1fqdfPA46kNXwMkn+hgf7CVCtyPIFPh7p9ueCijmgk=;
        b=Ji70GzKHeRFbHX/1/U39Qyh+eMdf6pru6FbQ2c/FjVpOyYn9piod6lCd51vfGvXFiw
         A/wgSGfETw4QTzf1eiP7F87aLtpauZDi8ydmF+/MmzH6Ns9fQG/ARfHE0OopsIYtn/1E
         Y7kdybffpIXtRX9/MJJ2GAYU+Mm511gxb8KR0DIwTp0pQLdAKazA/EPjfnCKPUgBt6lO
         tBy+BzyPBq2YoCbScaaPCbSOATiHW/R7C4nYNYOX7kq1hBO9tTYUv+wmtQP456Wx7OYC
         SBAnfBbsK2gm8ha94TIinXOY57/jHWk23HTOpFuuzhrGvjR/hyrpY0HZT/R5SUr6IOiH
         OX2A==
X-Gm-Message-State: AJIora91Ag1Z8vTlDHm3tXYASEglt5K+RCfzo35XNd/HMbFZhUrybqac
        JDow5ZXsxzXAS9lkhz+n13BLd4p2O0HOH2dg16CvHuaN48c1MGoiM7RsI4ZD/XVmuin2h7J4YDp
        5DtHwJX7wNhudasgo8a1j86JZbJkgwkB8oQ==
X-Received: by 2002:a63:2c90:0:b0:40c:fe76:59ef with SMTP id s138-20020a632c90000000b0040cfe7659efmr22961158pgs.288.1656906366265;
        Sun, 03 Jul 2022 20:46:06 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tMM6o7yalxZeXP62Xa+gMhpFFiuGy1AJFimSP7XmVuOI3Uo0EjGkGdnl1vLBLRphpJaPg+Zw==
X-Received: by 2002:a63:2c90:0:b0:40c:fe76:59ef with SMTP id s138-20020a632c90000000b0040cfe7659efmr22961130pgs.288.1656906366010;
        Sun, 03 Jul 2022 20:46:06 -0700 (PDT)
Received: from [10.72.13.251] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id s6-20020a170902ea0600b0016bdb5a3e37sm2067372plg.250.2022.07.03.20.45.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 03 Jul 2022 20:46:05 -0700 (PDT)
Message-ID: <102d3b83-1ae9-a59a-16ce-251c22b7afb0@redhat.com>
Date:   Mon, 4 Jul 2022 11:45:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v11 39/40] virtio_net: support tx queue resize
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org
Cc:     Richard Weinberger <richard@nod.at>,
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
        linux-um@lists.infradead.org, netdev@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org,
        kangjie.xu@linux.alibaba.com
References: <20220629065656.54420-1-xuanzhuo@linux.alibaba.com>
 <20220629065656.54420-40-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220629065656.54420-40-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/6/29 14:56, Xuan Zhuo 写道:
> This patch implements the resize function of the tx queues.
> Based on this function, it is possible to modify the ring num of the
> queue.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/net/virtio_net.c | 48 ++++++++++++++++++++++++++++++++++++++++
>   1 file changed, 48 insertions(+)
>
> diff --git a/drivers/net/virtio_net.c b/drivers/net/virtio_net.c
> index 6ab16fd193e5..fd358462f802 100644
> --- a/drivers/net/virtio_net.c
> +++ b/drivers/net/virtio_net.c
> @@ -135,6 +135,9 @@ struct send_queue {
>   	struct virtnet_sq_stats stats;
>   
>   	struct napi_struct napi;
> +
> +	/* Record whether sq is in reset state. */
> +	bool reset;
>   };
>   
>   /* Internal representation of a receive virtqueue */
> @@ -279,6 +282,7 @@ struct padded_vnet_hdr {
>   };
>   
>   static void virtnet_rq_free_unused_buf(struct virtqueue *vq, void *buf);
> +static void virtnet_sq_free_unused_buf(struct virtqueue *vq, void *buf);
>   
>   static bool is_xdp_frame(void *ptr)
>   {
> @@ -1603,6 +1607,11 @@ static void virtnet_poll_cleantx(struct receive_queue *rq)
>   		return;
>   
>   	if (__netif_tx_trylock(txq)) {
> +		if (READ_ONCE(sq->reset)) {
> +			__netif_tx_unlock(txq);
> +			return;
> +		}
> +
>   		do {
>   			virtqueue_disable_cb(sq->vq);
>   			free_old_xmit_skbs(sq, true);
> @@ -1868,6 +1877,45 @@ static int virtnet_rx_resize(struct virtnet_info *vi,
>   	return err;
>   }
>   
> +static int virtnet_tx_resize(struct virtnet_info *vi,
> +			     struct send_queue *sq, u32 ring_num)
> +{
> +	struct netdev_queue *txq;
> +	int err, qindex;
> +
> +	qindex = sq - vi->sq;
> +
> +	virtnet_napi_tx_disable(&sq->napi);
> +
> +	txq = netdev_get_tx_queue(vi->dev, qindex);
> +
> +	/* 1. wait all ximt complete
> +	 * 2. fix the race of netif_stop_subqueue() vs netif_start_subqueue()
> +	 */
> +	__netif_tx_lock_bh(txq);
> +
> +	/* Prevent rx poll from accessing sq. */
> +	WRITE_ONCE(sq->reset, true);


Can we simply disable RX NAPI here?

Thanks


> +
> +	/* Prevent the upper layer from trying to send packets. */
> +	netif_stop_subqueue(vi->dev, qindex);
> +
> +	__netif_tx_unlock_bh(txq);
> +
> +	err = virtqueue_resize(sq->vq, ring_num, virtnet_sq_free_unused_buf);
> +	if (err)
> +		netdev_err(vi->dev, "resize tx fail: tx queue index: %d err: %d\n", qindex, err);
> +
> +	/* Memory barrier before set reset and start subqueue. */
> +	smp_mb();
> +
> +	WRITE_ONCE(sq->reset, false);
> +	netif_tx_wake_queue(txq);
> +
> +	virtnet_napi_tx_enable(vi, sq->vq, &sq->napi);
> +	return err;
> +}
> +
>   /*
>    * Send command via the control virtqueue and check status.  Commands
>    * supported by the hypervisor, as indicated by feature bits, should

