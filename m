Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 06730772D5B
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Aug 2023 19:57:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229947AbjHGR5W (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Aug 2023 13:57:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229818AbjHGR5W (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Aug 2023 13:57:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 71F761703
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Aug 2023 10:56:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691430994;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=erccyO3QKy2zFm77CvV1z/W49Rh1dRbioVF76XNszQQ=;
        b=H6xgXxCSMeEWv0n4n05PjjpuJq79M1Dz83pdw4K6WivpBt4Gk6F9pa9y+DcSJYh4ZKjv/g
        IhOhhrvvh6JPMPwdKJ86CwE+8TGFIGtvxvc3WQcyemYq8kN4tuUtf4qQ0djPiTJHVV64Oy
        ZBgFqwa9+069t17W11q0GOaDm/dygB8=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-1-HcfiUCeMPzKCiCotMzejrw-1; Mon, 07 Aug 2023 13:56:33 -0400
X-MC-Unique: HcfiUCeMPzKCiCotMzejrw-1
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-99bebfada8cso300985766b.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Aug 2023 10:56:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691430992; x=1692035792;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=erccyO3QKy2zFm77CvV1z/W49Rh1dRbioVF76XNszQQ=;
        b=ZTKgtl7sokPW89iOx9dM4Qj1qQ4/kqdix5Q5aD8Eq0K5uB+E2pwblxPyHRqD1ZcAr2
         s80AGsGYkhn7BAssv9ZEszq+I3VwGvMSY73Ealac2u76vJp48NLHzK91k6a4dHWTj5P+
         dArKB5us3iFY+tPbENACy/8KXNYLQPBcnYt+vbBNpX3npG2Z6ph84Sze479P2P8IUDRy
         GVAsxm4RwHw5DSTS27XWHL77cENKiZ24ZlSY6paLwAFwSnG1O1SxWQvuIEfDwOCQRTaq
         uc6CbtyRtfTZ5JHydQocZ7y1yyuuMrNux5yBlC3Hr5bkrfbF2AlsME4dA2max+RNDO+v
         2SEg==
X-Gm-Message-State: AOJu0Yz+3+y0FUJzIQzdfAyK9YF/8bosLuuomNcpH/B5a2SG4eFhzDuj
        vB2T/rbHjIoWxAcM4tP1KICLo3GHQTi2uS1/g8fkBYJG84B5tkG9tgjiOnRw6jAkYfFcUUw8pOA
        kDT9iDHx6P13r0PdjgHYZAby0gXt1csngtw==
X-Received: by 2002:a17:906:1ba9:b0:99c:ae06:ffe4 with SMTP id r9-20020a1709061ba900b0099cae06ffe4mr6491032ejg.32.1691430991992;
        Mon, 07 Aug 2023 10:56:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEfuUFo20Lv+j5knb/LsIjGj8TveA2891c0c/kOPERwO3//+FapBzWdXiglzCRBZcRM7N8ZCQ==
X-Received: by 2002:a17:906:1ba9:b0:99c:ae06:ffe4 with SMTP id r9-20020a1709061ba900b0099cae06ffe4mr6491004ejg.32.1691430991728;
        Mon, 07 Aug 2023 10:56:31 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id gs10-20020a170906f18a00b0099caf5bed64sm4340334ejb.57.2023.08.07.10.56.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Aug 2023 10:56:31 -0700 (PDT)
Message-ID: <d07bdfec-df86-5216-4b9a-533da25fec42@redhat.com>
Date:   Mon, 7 Aug 2023 19:56:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 0/3] x86/cpu: Cleanup of INTEL_FAM6_foo
Content-Language: en-US, nl
To:     Peter Zijlstra <peterz@infradead.org>, x86@kernel.org
Cc:     mingo@redhat.com, acme@kernel.org, mark.rutland@arm.com,
        alexander.shishkin@linux.intel.com, jolsa@kernel.org,
        namhyung@kernel.org, irogers@google.com, adrian.hunter@intel.com,
        tglx@linutronix.de, bp@alien8.de, dave.hansen@linux.intel.com,
        hpa@zytor.com, Tony Luck <tony.luck@intel.com>, luto@kernel.org,
        james.morse@arm.com, mchehab@kernel.org, rric@kernel.org,
        jacob.jun.pan@linux.intel.com, lenb@kernel.org,
        irenic.rajneesh@gmail.com, david.e.box@intel.com,
        markgross@kernel.org, srinivas.pandruvada@linux.intel.com,
        rafael@kernel.org, daniel.lezcano@linaro.org, amitk@kernel.org,
        rui.zhang@intel.com, linux-perf-users@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-edac@vger.kernel.org,
        linux-pm@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20230807123806.700370534@infradead.org>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20230807123806.700370534@infradead.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.9 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H4,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,
        SPF_NONE autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/7/23 14:38, Peter Zijlstra wrote:
> Hi,
> 
> I seem to have missed 'spring' but here goes...

Thanks, series looks good to me:

Acked-by: Hans de Goede <hdegoede@redhat.com>

For the few small drivers/platform/x86 changes.

Feel free to merge this through whatever tree is convenient.

Regards,

Hans



