Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 92B1658CBEC
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Aug 2022 18:13:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243930AbiHHQNg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Aug 2022 12:13:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243926AbiHHQNf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Aug 2022 12:13:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 02098559D
        for <platform-driver-x86@vger.kernel.org>; Mon,  8 Aug 2022 09:13:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1659975212;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KLGbq2su7y8qF0iuV3H8NZV3RgfNkEtVGQYGB91WtLc=;
        b=TQ2R7dT4VBMJmCdV61D2RTvdF11aS7doEekN8OGhQpF0M7bv8H98DGLObTEvqzAAstaLKI
        A+3V9dfyYBUnYCHPMg7/N2+YQbQ6UaYrfF3Q3A3qzLeKPj22g9ZDRVLLzE0EbG4y8bcVHL
        2etiOmEWD+9xpW1BXcg7IFFuOr5Rr7M=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-655-cqmaATZ9NMScU23Jt98trw-1; Mon, 08 Aug 2022 12:13:31 -0400
X-MC-Unique: cqmaATZ9NMScU23Jt98trw-1
Received: by mail-ej1-f70.google.com with SMTP id gn23-20020a1709070d1700b0073094d0e02cso2588691ejc.20
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Aug 2022 09:13:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=KLGbq2su7y8qF0iuV3H8NZV3RgfNkEtVGQYGB91WtLc=;
        b=Wc5WxRPMdAnLeuihNoxZjp+dCnpKRHLgqzUfRrfPCu3ztEzHwfDOEdclFqJGhD4hTX
         yP8KKu4NNlrviQGZRVZ7UMztvgOfBIsbaz22PCLvQJwjiHHajYObFL1wRZS8gEqpqKPd
         R0bO5sCXufFgEiwRsDMcn7xSSyUUZY7T9X/2AdtQXA+Lc3SDD1xFBdKOrnNKnshp87qh
         Klyu7cy9HrUul6ld5m+k8e2o6lud0y9O3BjCGeYVpk83xx4PdlgRhLOgZfaoaScxaYTn
         Har4O+sMHpHalZxtET75f8KD1tqPVTY4psivRso9pLZSMiZNVDxD8Mxo61qP55+ZHWHf
         tkjQ==
X-Gm-Message-State: ACgBeo3ffN2B38RVUMNCenoEZLVJu+kl1broxo6cD9/NOzf/V66MyZZo
        kpKB0XVBffWmlhdAd3j7NyAXJS8M0O5wZ07cCwW/1dgV+rmfqHhzLoW1YAMOO2XCGLeNHc8PNsE
        u5dBe2yZDdWzdQFi2JCUIlr4ao+kQXLJSdA==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id et15-20020a056402378f00b0043ad3f579f2mr18616707edb.338.1659975210018;
        Mon, 08 Aug 2022 09:13:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5Kc6OlGYcnsyhPFkY4Wweec7H/qFBO8/QI44ngY3ug7LVyYtJhYC0p05uXc2jIPASVP4zWTg==
X-Received: by 2002:a05:6402:378f:b0:43a:d3f5:79f2 with SMTP id et15-20020a056402378f00b0043ad3f579f2mr18616692edb.338.1659975209877;
        Mon, 08 Aug 2022 09:13:29 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id k5-20020a17090632c500b0072b1cb2818csm11634ejk.158.2022.08.08.09.13.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Aug 2022 09:13:28 -0700 (PDT)
Message-ID: <23e2630c-2328-40cd-836b-f3b619ff6a4b@redhat.com>
Date:   Mon, 8 Aug 2022 18:13:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2 1/2] asus-wmi: Adjust tablet/lidflip handling to use
 enum
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        "Luke D. Jones" <luke@ljones.dev>
Cc:     Mark Gross <markgross@kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220808031132.10075-1-luke@ljones.dev>
 <20220808031132.10075-2-luke@ljones.dev>
 <CAHp75Vds+DmQdeuSM7ixtZiX60jg83CWveFZNcQoQ=QyiqcvUw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vds+DmQdeuSM7ixtZiX60jg83CWveFZNcQoQ=QyiqcvUw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-3.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/8/22 17:48, Andy Shevchenko wrote:
> On Mon, Aug 8, 2022 at 5:12 AM Luke D. Jones <luke@ljones.dev> wrote:
>>
>> Due to multiple types of tablet/lidflip, the existing code for
>> handlign these events is refactored to use an enum for each type.
> 
> handling
> 
> Can you run a spell checker for your commit messages?
> 
> ...
> 
> To the switch-cases, please add a "default" case to each of them.

The switch-cases are on an enum type, so adding a default is
not necessary and adding one will actually loose the useful
compiler warning about unhandled enum values.

Regards,

Hans

