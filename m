Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A87677CA2FF
	for <lists+platform-driver-x86@lfdr.de>; Mon, 16 Oct 2023 10:59:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232649AbjJPI7u (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 16 Oct 2023 04:59:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjJPI7t (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 16 Oct 2023 04:59:49 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434FDB4
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Oct 2023 01:59:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1697446742;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ciQpvb8toJic6WpPKRE/AeagKH9fiYHBE+ZhRFvm5DI=;
        b=FfPK1IHrcNB5z0o4VtyDdqQGAuIbIXF4WMS6qKslnE28Vq4cZP2i9r8MYc+NLP5dj59Abn
        YhdMgugdG0EZkJWwkoB2/s/YbodxgnS/QSISGo6yUdP/WjRaOljlu5FhnSUaNL5LiRSZjH
        LcyqhV0C+XEXYZSl3/agilkI1YTyEGA=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-383-LhWdR_9TObO7YCv_Khpnww-1; Mon, 16 Oct 2023 04:59:00 -0400
X-MC-Unique: LhWdR_9TObO7YCv_Khpnww-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-99bca0b9234so101431766b.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 16 Oct 2023 01:59:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697446739; x=1698051539;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ciQpvb8toJic6WpPKRE/AeagKH9fiYHBE+ZhRFvm5DI=;
        b=oRhW/+hbNeyCw6mqsgRmd/HJ4lSP87B51BYuJk1MYe1EjkpdvYPK8CxqPUe7nSF4gD
         kJtTyMsq8SFdMXxsRjFcTQ6L7pl+DvMVqxY4HNGe3bKi4K4wsXy2K0rN+IbcHD/IobKD
         gb4kvx4sRxZG/MZFUuB34EKtV5abobt4KGI7GpJ9GgRedPjlmZIBTnzbRyQ8MPcK3j0a
         0S69ftHmYiGjPJd7gjxZixZdNyAppRMFH62DtxPX97rwfc/G/2i+OpX+iacDhYbUIH6s
         xpiyf2pZ+52lD8c2P5gWbBzIomuuSSbfdi5cQwnWZBDphPBHtHkzmq3hDYqF8xfYisj5
         nIiA==
X-Gm-Message-State: AOJu0Yy4c6EmNSHeHIRYwe5vU2zTKakrZl7cUF8wpecu6nxBBpVVQ39M
        C2Mq/xSJnbEp0v/56950LDXVQz77geb9E9j5wEhrSq232eMNfzimHG7d4OyNOoLVORiBN/gV9CS
        FU92DOA27PKhRXFFXXvpC8mIA9043DOJ0hg==
X-Received: by 2002:a17:907:1c25:b0:9bf:b022:dc7 with SMTP id nc37-20020a1709071c2500b009bfb0220dc7mr3798573ejc.48.1697446739777;
        Mon, 16 Oct 2023 01:58:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE0iTatvUyost5Hu3jUWmmtCCHZ34EkgvvWD43IwKXRJbTUeU4xoMjyb1HS9ASazaT5JYUKpg==
X-Received: by 2002:a17:907:1c25:b0:9bf:b022:dc7 with SMTP id nc37-20020a1709071c2500b009bfb0220dc7mr3798561ejc.48.1697446739511;
        Mon, 16 Oct 2023 01:58:59 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g7-20020a170906198700b00992b8d56f3asm3616538ejd.105.2023.10.16.01.58.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Oct 2023 01:58:59 -0700 (PDT)
Message-ID: <de3145e8-3d76-63af-e018-26b7ad1aca75@redhat.com>
Date:   Mon, 16 Oct 2023 10:58:57 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 4/4] platform/x86: x86-android-tablets: Add audio codec
 info for Lenovo Yoga Tab 3 Pro YT3-X90F
Content-Language: en-US
To:     Andy Shevchenko <andy@kernel.org>
Cc:     "Rafael J . Wysocki" <rafael@kernel.org>,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Brown <broonie@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-spi@vger.kernel.org
References: <20231014205314.59333-1-hdegoede@redhat.com>
 <20231014205314.59333-5-hdegoede@redhat.com>
 <65cb8c8c-1a07-922b-db7a-dba54afc76b6@redhat.com>
 <ZSzwslha2aUGod7A@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <ZSzwslha2aUGod7A@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/16/23 10:13, Andy Shevchenko wrote:
> On Sun, Oct 15, 2023 at 11:15:47AM +0200, Hans de Goede wrote:
>> On 10/14/23 22:53, Hans de Goede wrote:
> 
>>> +        .micbias={
>>> +           [0]={ /*MICBIAS1*/
> 
> Talking about spaces, how about
> 
>         .micbias = {
>            [0] = { / *MICBIAS1 */
>                  .mV = 2800 ,
>                  .ext_cap = 1,
>                  .discharge = 1 ,
>                  .soft_start = 0,
>                  .bypass = 0,

Ack, I already have it like this locally now. Also using only
tabs, there is plenty of width to just indent the "[0] = { ..."
with a tab too.

Regards,

Hans

