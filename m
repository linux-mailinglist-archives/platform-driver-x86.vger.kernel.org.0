Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D6F0C56302A
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 Jul 2022 11:34:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234741AbiGAJdW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 1 Jul 2022 05:33:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236241AbiGAJdT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Jul 2022 05:33:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 18DD1140F0
        for <platform-driver-x86@vger.kernel.org>; Fri,  1 Jul 2022 02:33:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1656667996;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=f5mtGmTe8EOGM3d6UvtPR8foUzN0Vd8FdOhETeQJNPM=;
        b=MReX2+Xlzcs8C5oKn9ZuHZ6QFf6aPTcoSbiUuAHB8mwcZz/w36GrqfX45skiZ36HZgDcGz
        N87XzzZA48s1qzGmzrzpRqCGVlmu0CnN953nQFQ3aiiPPHEUxAUINKC6BoC/R26gElrO+3
        9D9KFV6Tx7vAs/NYHnKFlGc/1ouGzXQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-497-UkQ7BJ8pM5iGA8KvxmZzhA-1; Fri, 01 Jul 2022 05:33:12 -0400
X-MC-Unique: UkQ7BJ8pM5iGA8KvxmZzhA-1
Received: by mail-pg1-f198.google.com with SMTP id l189-20020a6388c6000000b0040d40295743so1057256pgd.15
        for <platform-driver-x86@vger.kernel.org>; Fri, 01 Jul 2022 02:33:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f5mtGmTe8EOGM3d6UvtPR8foUzN0Vd8FdOhETeQJNPM=;
        b=thiQ4oFG3FL9L9h1Npg2p7R0k91/de7HiR/CneXmRF6M7VZxx9ZNJISdP+kbz2W6wp
         s+zMzxCduOQpFYAXa7tp9qPkYeexb9ZsIIkjKnGHTJMEOwNz7dKQ8PpH4Jz7i8f5p8VI
         7PixxwYr3au5P5V+17jVYfVIi0Qc+GHOvbAPLSBPLhl1UJQB99/n5xAjG8g7jKORGRea
         SujkQo5rodWo40J83IoogI6QjWzZzf/WpG+8rZ59s417wsNyGSe5/KqhJlB9AzH1jBSI
         HnjES0JUmnt5Pa3/FWXCM6ZdEvx2JvrnmjhB0eiRTy/ae32rkspaa/+Lk2yduv7+MXAa
         b6Xw==
X-Gm-Message-State: AJIora9Q7F7a1PEQydtb8l1HhCab3mFYM/L/8qI4emgFR+0eQXAF1Iwf
        Eau6nHrTpAp0h3W8zo0CB7yAaTHxYw2f99CnBteqLubBnEuQCIY3Qpi3ItkYHK2fR8kvGA58Wip
        Dw2Wp/8jnRegzSSB/tB54jyuUDa7zXoVopA==
X-Received: by 2002:a17:90b:4a0c:b0:1ec:d90c:601d with SMTP id kk12-20020a17090b4a0c00b001ecd90c601dmr15636524pjb.154.1656667991677;
        Fri, 01 Jul 2022 02:33:11 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1tVe2pzm2DqVb3UijAovoeTNBz5xv7L4VqCc/Ur/3iGdxZa8PDpPNxiGPMy4N7soHRJKb82Vw==
X-Received: by 2002:a17:90b:4a0c:b0:1ec:d90c:601d with SMTP id kk12-20020a17090b4a0c00b001ecd90c601dmr15636485pjb.154.1656667991387;
        Fri, 01 Jul 2022 02:33:11 -0700 (PDT)
Received: from [10.72.13.237] ([209.132.188.80])
        by smtp.gmail.com with ESMTPSA id u4-20020a170902714400b0015e8d4eb28fsm15068862plm.217.2022.07.01.02.33.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 Jul 2022 02:33:10 -0700 (PDT)
Message-ID: <f35fdd60-8f69-6004-dd00-62e5fe8a8856@redhat.com>
Date:   Fri, 1 Jul 2022 17:33:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.11.0
Subject: Re: [PATCH v11 23/40] virtio_pci: move struct virtio_pci_common_cfg
 to virtio_pci_modern.h
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
 <20220629065656.54420-24-xuanzhuo@linux.alibaba.com>
From:   Jason Wang <jasowang@redhat.com>
In-Reply-To: <20220629065656.54420-24-xuanzhuo@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-3.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


在 2022/6/29 14:56, Xuan Zhuo 写道:
> In order to facilitate the expansion of virtio_pci_common_cfg in the
> future, move it from uapi to virtio_pci_modern.h. In this way, we can
> freely expand virtio_pci_common_cfg in the future.
>
> Other projects using virtio_pci_common_cfg in uapi need to maintain a
> separate virtio_pci_common_cfg or use the offset macro defined in uapi.
>
> Signed-off-by: Xuan Zhuo <xuanzhuo@linux.alibaba.com>
> ---
>   include/linux/virtio_pci_modern.h | 26 ++++++++++++++++++++++++++
>   include/uapi/linux/virtio_pci.h   | 26 --------------------------
>   2 files changed, 26 insertions(+), 26 deletions(-)
>
> diff --git a/include/linux/virtio_pci_modern.h b/include/linux/virtio_pci_modern.h
> index eb2bd9b4077d..c4f7ffbacb4e 100644
> --- a/include/linux/virtio_pci_modern.h
> +++ b/include/linux/virtio_pci_modern.h
> @@ -5,6 +5,32 @@
>   #include <linux/pci.h>
>   #include <linux/virtio_pci.h>
>   
> +/* Fields in VIRTIO_PCI_CAP_COMMON_CFG: */
> +struct virtio_pci_common_cfg {
> +	/* About the whole device. */
> +	__le32 device_feature_select;	/* read-write */
> +	__le32 device_feature;		/* read-only */
> +	__le32 guest_feature_select;	/* read-write */
> +	__le32 guest_feature;		/* read-write */
> +	__le16 msix_config;		/* read-write */
> +	__le16 num_queues;		/* read-only */
> +	__u8 device_status;		/* read-write */
> +	__u8 config_generation;		/* read-only */
> +
> +	/* About a specific virtqueue. */
> +	__le16 queue_select;		/* read-write */
> +	__le16 queue_size;		/* read-write, power of 2. */
> +	__le16 queue_msix_vector;	/* read-write */
> +	__le16 queue_enable;		/* read-write */
> +	__le16 queue_notify_off;	/* read-only */
> +	__le32 queue_desc_lo;		/* read-write */
> +	__le32 queue_desc_hi;		/* read-write */
> +	__le32 queue_avail_lo;		/* read-write */
> +	__le32 queue_avail_hi;		/* read-write */
> +	__le32 queue_used_lo;		/* read-write */
> +	__le32 queue_used_hi;		/* read-write */
> +};
> +
>   struct virtio_pci_modern_device {
>   	struct pci_dev *pci_dev;
>   
> diff --git a/include/uapi/linux/virtio_pci.h b/include/uapi/linux/virtio_pci.h
> index 3a86f36d7e3d..247ec42af2c8 100644
> --- a/include/uapi/linux/virtio_pci.h
> +++ b/include/uapi/linux/virtio_pci.h
> @@ -140,32 +140,6 @@ struct virtio_pci_notify_cap {
>   	__le32 notify_off_multiplier;	/* Multiplier for queue_notify_off. */
>   };
>   
> -/* Fields in VIRTIO_PCI_CAP_COMMON_CFG: */
> -struct virtio_pci_common_cfg {
> -	/* About the whole device. */
> -	__le32 device_feature_select;	/* read-write */
> -	__le32 device_feature;		/* read-only */
> -	__le32 guest_feature_select;	/* read-write */
> -	__le32 guest_feature;		/* read-write */
> -	__le16 msix_config;		/* read-write */
> -	__le16 num_queues;		/* read-only */
> -	__u8 device_status;		/* read-write */
> -	__u8 config_generation;		/* read-only */
> -
> -	/* About a specific virtqueue. */
> -	__le16 queue_select;		/* read-write */
> -	__le16 queue_size;		/* read-write, power of 2. */
> -	__le16 queue_msix_vector;	/* read-write */
> -	__le16 queue_enable;		/* read-write */
> -	__le16 queue_notify_off;	/* read-only */
> -	__le32 queue_desc_lo;		/* read-write */
> -	__le32 queue_desc_hi;		/* read-write */
> -	__le32 queue_avail_lo;		/* read-write */
> -	__le32 queue_avail_hi;		/* read-write */
> -	__le32 queue_used_lo;		/* read-write */
> -	__le32 queue_used_hi;		/* read-write */
> -};
> -


I think it's better not delete those from uAPI. We can embed this struct 
in the private virito_pci_moden.h anyhow.

Thanks


>   /* Fields in VIRTIO_PCI_CAP_PCI_CFG: */
>   struct virtio_pci_cfg_cap {
>   	struct virtio_pci_cap cap;

