Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8D10975366D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 14 Jul 2023 11:29:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbjGNJ3Q (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 14 Jul 2023 05:29:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235322AbjGNJ3P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 14 Jul 2023 05:29:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E54E2D51
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1689326908;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=e917PWoV2EQP18RF0PKWLGfuOBS2EM7fSGv2w9B6FsA=;
        b=NSI6sbh0vtHaj8n03MCccQo0UbORJlrxuJ4JnMU8Hu4GqxtUFBTJb4kYDQ3gJenKVAxBSV
        xpKMSW/Z+eKsthfxoiEuIse+dAVYve+KKuKWSlXTwb9qpvAEUJR4a3OQ5AvGk8zPqo94+V
        Y5ihu+mQ6JwCYTEIQL5ilZTF3iFXy2g=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-AQphtMexOhO032o_yiBjSA-1; Fri, 14 Jul 2023 05:28:27 -0400
X-MC-Unique: AQphtMexOhO032o_yiBjSA-1
Received: by mail-ej1-f72.google.com with SMTP id a640c23a62f3a-994320959f4so93825966b.2
        for <platform-driver-x86@vger.kernel.org>; Fri, 14 Jul 2023 02:28:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689326906; x=1691918906;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=e917PWoV2EQP18RF0PKWLGfuOBS2EM7fSGv2w9B6FsA=;
        b=LQbzlmQvj7keLv5PZiIu7fl+Kl7TYqoXabOys/ncgcTn0QCoieNdxHzPgDuWlx3ta1
         IGa/pMgbfmrWOYYTaimw9W2mLjC2/z+yf385uypXoC0nqx4DiGR6kZocZOhgRjZoy0Zw
         MNuk9lITCswpp7PT8cJFFn6KxHZ2Mj4eNddSO/2Q8yAUE50ZIufOi6ZiYhYRT85U702v
         hqlxLL8qQG3LRocqlAp0ghoOUQuB790GU1zZfHbtA23wMR5PKqYlUq71sNcVHanR0mRB
         W6IXnr0MMo6N00jbaipbNaNTSGNklOceMwokaGvRC0aZMWjH1UzMzJVm/oNF0w0hGIgL
         75JQ==
X-Gm-Message-State: ABy/qLaFZrm3vjDFYIbYroSxfsUjEC+wC/oJzMMwdum6W0P5CUfApXWN
        zimp2C0KT7a71m1g3ufYGqGWhMDS4ivg1Kxjck/Kp8tBoKIYuIt00XC3zEZWiLdDWPxMGvFoQ0L
        3OLdmEY6CUNV2yIbjyGXC0Fg1c5qPsFrpwQ==
X-Received: by 2002:a17:907:3fa8:b0:988:9621:d85f with SMTP id hr40-20020a1709073fa800b009889621d85fmr4159779ejc.58.1689326906206;
        Fri, 14 Jul 2023 02:28:26 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFU+Pc68BnX42o35KIETq90KYLk34BYAn7ZOZ1KHJLjq5Wb9nfi46Kj9Z/2DbOisETUAh4Weg==
X-Received: by 2002:a17:907:3fa8:b0:988:9621:d85f with SMTP id hr40-20020a1709073fa800b009889621d85fmr4159768ejc.58.1689326905941;
        Fri, 14 Jul 2023 02:28:25 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id k12-20020a1709063e0c00b00988c0c175c6sm5173154eji.189.2023.07.14.02.28.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 14 Jul 2023 02:28:25 -0700 (PDT)
Message-ID: <51386a3b-7a77-a18b-78b9-57f53d4979a4@redhat.com>
Date:   Fri, 14 Jul 2023 11:28:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 0/2] platform/x86: add CMOS battery monitoring for simatic
 IPCs
Content-Language: en-US, nl
To:     Henning Schild <henning.schild@siemens.com>,
        Mark Gross <markgross@kernel.org>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Jean Delvare <jdelvare@suse.com>,
        linux-watchdog@vger.kernel.org, linux-hwmon@vger.kernel.org,
        Tobias Schaffner <tobias.schaffner@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>
References: <20230706154831.19100-1-henning.schild@siemens.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230706154831.19100-1-henning.schild@siemens.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/6/23 17:48, Henning Schild wrote:
> The real change is in p2 and p1 just prepares to multiplex an IO region.
> We introduce a custom driver to read CMOS battery information on several
> of the Industrial PCs.
> 
> This is based on
>  "[PATCH 0/1] leds: simatic-ipc-leds-gpio: add new model BX-21A"
> 
> Henning Schild (2):
>   watchdog: simatic-ipc-wdt: make IO region access of one model muxed
>   platform/x86: add CMOS battery monitoring for simatic IPCs

Thank you. I've merged both into a platform-drivers-x86-simatic-ipc
branch where I'm collecting all the pending platform/x86: simatic-ipc
work.

I'll tag + send a pull-request to Lee Jones (for some dependent LED
patches) later today.

Guenter, I'll Cc you on the pull-req in case you also want to merge
the (immutable) tag to pick up the small watchdog change in this
series.

Regards,

Hans




> 
>  drivers/platform/x86/Kconfig                  |  48 ++++
>  drivers/platform/x86/Makefile                 |   6 +-
>  .../x86/simatic-ipc-batt-apollolake.c         |  51 ++++
>  .../x86/simatic-ipc-batt-elkhartlake.c        |  51 ++++
>  .../platform/x86/simatic-ipc-batt-f7188x.c    |  70 +++++
>  drivers/platform/x86/simatic-ipc-batt.c       | 250 ++++++++++++++++++
>  drivers/platform/x86/simatic-ipc-batt.h       |  20 ++
>  drivers/platform/x86/simatic-ipc.c            |  65 ++++-
>  drivers/watchdog/simatic-ipc-wdt.c            |   9 +-
>  .../platform_data/x86/simatic-ipc-base.h      |   1 +
>  10 files changed, 553 insertions(+), 18 deletions(-)
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-apollolake.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-elkhartlake.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt-f7188x.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt.c
>  create mode 100644 drivers/platform/x86/simatic-ipc-batt.h
> 

