Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E9DB14D29BB
	for <lists+platform-driver-x86@lfdr.de>; Wed,  9 Mar 2022 08:51:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbiCIHwh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 9 Mar 2022 02:52:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229740AbiCIHwg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 9 Mar 2022 02:52:36 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B930C1405D0
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Mar 2022 23:51:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1646812296;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=8EooiEDUIiNqsLqksX/5gFpvlfrwnXfbsnSG7xyKFRM=;
        b=hNK1RfRLODPTnqeWOLM64QckM1ELf/KRJ9fgqTVeieFX7lDs2p0G900CTjPEI9s02hhmbt
        Lg0U7IFqu/51HZ9a7nT43c/KmlCeup8oefYX+1kDLWAsvdqmtW4nH+chOJkAooXHeiC5Kz
        3n+cRBpoJT2aS2y/usoFGkY1uQLGulg=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-56-3gdNVniAOzGZxxPsgVPWeg-1; Wed, 09 Mar 2022 02:51:35 -0500
X-MC-Unique: 3gdNVniAOzGZxxPsgVPWeg-1
Received: by mail-pj1-f69.google.com with SMTP id m9-20020a17090ade0900b001bedf2d1d4cso3319814pjv.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Mar 2022 23:51:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8EooiEDUIiNqsLqksX/5gFpvlfrwnXfbsnSG7xyKFRM=;
        b=sVoaAz6z0MptmT5so7r/wKq5mmuiFDOMz+xJEDYDgEX/KNzNN77JcndLrITEPMe5t5
         0+fRjD4vavYMuCiUFyzwJ26c9lc7AAgC+wz7S1Oj5ssFrA/CD9PjTYY1Hr/YpQFq9XJP
         cRE333mCFxssFQOKEKmhm1m+uouLDtGGIn+QafKJQ7fD3jYjaJFTRwC8zf4FBw4va836
         l3ZL6vAfSEbrU5jKYgt6GtDwepDrw5df1iOS90gpX/v9g2cx57QtlN5Rfx8WtHzrKC1B
         iko58qo6+fd1vgy6SW4BR5w1lEBvclqKDijQzmWPwDrHH5JQ5q4Y1Uk/jQBJNH88Mwis
         syyw==
X-Gm-Message-State: AOAM532X6/X6WJBBE4LlQzRvN4Nlu7figiIqU+1UoIgCFynhLuYb3uGs
        wE4J9fR2/lRMdSEiD1kxMjvH0/u2x20w56kZxdLKRW3DGUAiXY1ifiz6mdhXZmnxhQf1kow0Bau
        sj681Oj0ljuukjkAyCmVHJsvu6c8KcHshjw==
X-Received: by 2002:a05:6a00:1aca:b0:4e1:a2b6:5b9 with SMTP id f10-20020a056a001aca00b004e1a2b605b9mr22032636pfv.4.1646812294708;
        Tue, 08 Mar 2022 23:51:34 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw7Di4SBo0vIcLZV8aD0YrzixtPGak4ozbl1xizUy139HXfoBpN9nPz+x4ygNPWdbKEaJoHaw==
X-Received: by 2002:a05:6a00:1aca:b0:4e1:a2b6:5b9 with SMTP id f10-20020a056a001aca00b004e1a2b605b9mr22032623pfv.4.1646812294417;
        Tue, 08 Mar 2022 23:51:34 -0800 (PST)
Received: from [10.72.12.183] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id s16-20020a63ff50000000b003650ee901e1sm1468074pgk.68.2022.03.08.23.51.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Mar 2022 23:51:33 -0800 (PST)
Message-ID: <aa24df8c-787a-0db5-7b16-60adcb86ab0c@redhat.com>
Date:   Wed, 9 Mar 2022 15:51:13 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.6.1
Subject: Re: [PATCH v7 08/26] virtio_ring: extract the logic of freeing vring
Content-Language: en-US
To:     Xuan Zhuo <xuanzhuo@linux.alibaba.com>,
        virtualization@lists.linux-foundation.org, netdev@vger.kernel.org
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
        linux-um@lists.infradead.org, platform-driver-x86@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-s390@vger.kernel.org,
        kvm@vger.kernel.org, bpf@vger.kernel.org
References: <20220308123518.33800-1-xuanzhuo@linux.alibaba.com>
 <20220308123518.33800-9-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220308123518.33800-9-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/3/8 下午8:35, Xuan Zhuo 写道:
> Introduce vring_free() to free the vring of vq.
>
> Prevent double free by setting vq->reset.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   drivers/virtio/virtio_ring.c | 25 ++++++++++++++++++++-----
>   include/linux/virtio.h       |  8 ++++++++
>   2 files changed, 28 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/virtio/virtio_ring.c b/drivers/virtio/virtio_ring.c
> index b5a9bf4f45b3..e0422c04c903 100644
> --- a/drivers/virtio/virtio_ring.c
> +++ b/drivers/virtio/virtio_ring.c
> @@ -2442,14 +2442,10 @@ struct virtqueue *vring_new_virtqueue(unsigned int index,
>   }
>   EXPORT_SYMBOL_GPL(vring_new_virtqueue);
>   
> -void vring_del_virtqueue(struct virtqueue *_vq)
> +static void __vring_free(struct virtqueue *_vq)
>   {
>   	struct vring_virtqueue *vq = to_vvq(_vq);
>   
> -	spin_lock(&vq->vq.vdev->vqs_list_lock);
> -	list_del(&_vq->list);
> -	spin_unlock(&vq->vq.vdev->vqs_list_lock);
> -
>   	if (vq->we_own_ring) {
>   		if (vq->packed_ring) {
>   			vring_free_queue(vq->vq.vdev,
> @@ -2480,6 +2476,25 @@ void vring_del_virtqueue(struct virtqueue *_vq)
>   		kfree(vq->split.desc_state);
>   		kfree(vq->split.desc_extra);
>   	}
> +}
> +
> +static void vring_free(struct virtqueue *vq)
> +{
> +	__vring_free(vq);
> +	vq->reset = VIRTIO_VQ_RESET_STEP_VRING_RELEASE;
> +}
> +
> +void vring_del_virtqueue(struct virtqueue *_vq)
> +{
> +	struct vring_virtqueue *vq = to_vvq(_vq);
> +
> +	spin_lock(&vq->vq.vdev->vqs_list_lock);
> +	list_del(&_vq->list);
> +	spin_unlock(&vq->vq.vdev->vqs_list_lock);
> +
> +	if (_vq->reset != VIRTIO_VQ_RESET_STEP_VRING_RELEASE)
> +		__vring_free(_vq);
> +
>   	kfree(vq);
>   }
>   EXPORT_SYMBOL_GPL(vring_del_virtqueue);
> diff --git a/include/linux/virtio.h b/include/linux/virtio.h
> index d59adc4be068..e3714e6db330 100644
> --- a/include/linux/virtio.h
> +++ b/include/linux/virtio.h
> @@ -10,6 +10,13 @@
>   #include <linux/mod_devicetable.h>
>   #include <linux/gfp.h>
>   
> +enum virtio_vq_reset_step {
> +	VIRTIO_VQ_RESET_STEP_NONE,
> +	VIRTIO_VQ_RESET_STEP_DEVICE,
> +	VIRTIO_VQ_RESET_STEP_VRING_RELEASE,
> +	VIRTIO_VQ_RESET_STEP_VRING_ATTACH,
> +};


This part looks not related to the subject.

And it needs detail documentation on this.

But I wonder how useful it is, anyway we can check the reset status via 
transport specific way and in the future we may want to do more than 
just resizing (e.g PASID).

Thanks


> +
>   /**
>    * virtqueue - a queue to register buffers for sending or receiving.
>    * @list: the chain of virtqueues for this device
> @@ -33,6 +40,7 @@ struct virtqueue {
>   	unsigned int num_free;
>   	unsigned int num_max;
>   	void *priv;
> +	enum virtio_vq_reset_step reset;
>   };
>   
>   int virtqueue_add_outbuf(struct virtqueue *vq,

