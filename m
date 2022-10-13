Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A947B5FE3A2
	for <lists+platform-driver-x86@lfdr.de>; Thu, 13 Oct 2022 23:01:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbiJMVBD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 13 Oct 2022 17:01:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229977AbiJMVBC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 13 Oct 2022 17:01:02 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id ADB32170DED
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 14:01:00 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id 128so3040528vsz.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 13 Oct 2022 14:01:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vl6cdceIfSLEAxmLwC9m2TMbI2mgFoDktXj4qb4IX6M=;
        b=JyzGe36jN6a44ks51OsthNFBJoCn0S0eWNzB1CMybLAkSSAAL3Bkjb6rebwGsX+WGu
         qDEOWY9nxLULNYzg0QNGNqkb1XiLkf1ql/qbqPZo+V3ys3LrpwEE+DjHvTIT0qAcWUD9
         GDP7H4/7phBjIWi0LA5XCDPPxpydhhZhmB53CUVih21EDcNl8JDAnnq3pRQq3YuWi0S9
         IgXJukKX0ZbkBsL1JTIvJhXzfz8kbBT6r/wG2yHnme/YYOd7J5sJloY1FRTzC4uIabAA
         kxtCVM5Z3tB2ymoQ6lTNfGHqxQAzxcc5MUsKVAHcbt9bfPuzPtcSk2dYtKohOt/bWM67
         ZzEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vl6cdceIfSLEAxmLwC9m2TMbI2mgFoDktXj4qb4IX6M=;
        b=6P4lFz5wIzLMqwGjcZCzxeUrk9uDH4Dgc1Xi1DxkHP5CW6Aatop49fRAOSn0eaBC/3
         cxspe5zVzt3cIMvP9RoPPPyWB2wneAlf/GBuiesRUxS7XDXWmAbAishXX2X6vMLC3LZJ
         HyA0yV4YykJPTelend6x0OpQQfeuO9s5efvPZGzaPPSHbDbtDzClewRWpb+ynX2KAnme
         AW1Jrbt7kNFxZKgVwde/Q2brfp/B7nUr7Mdc2sOvdSaVcS9RNOJSXy1f1Sdrsd5vLSSj
         5q5XJ66XbpWWBZIg5D1s47oYbG7gPg6RKkNiONC5XSpddxsS3rC2BWWr6S3R8209DivM
         aJmA==
X-Gm-Message-State: ACrzQf3yOwc2h9uAtMjWbYKLzLuk0S4sKv1jeO0Re9+gaCAE/Qj058p2
        rf+4cY7LdVFPGQrJOpUCVYH2DYK1koso4FC9AEMKGQ==
X-Google-Smtp-Source: AMsMyM745IH36YDPS78240aSd5ih8VEEqLheErzdCP96kDnzeFZDtidSehtNqirERd6mNNyNjGgVTcshfQletGvsk+k=
X-Received: by 2002:a67:ee85:0:b0:38a:bb8e:d04e with SMTP id
 n5-20020a67ee85000000b0038abb8ed04emr1424360vsp.26.1665694859658; Thu, 13 Oct
 2022 14:00:59 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:136f:0:b0:3d2:4916:f286 with HTTP; Thu, 13 Oct 2022
 14:00:58 -0700 (PDT)
In-Reply-To: <Y0hrhzprPFTK+VWV@zn.tnic>
References: <20220704135833.1496303-1-martin.fernandez@eclypsium.com> <Y0hrhzprPFTK+VWV@zn.tnic>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Thu, 13 Oct 2022 18:00:58 -0300
Message-ID: <CAKgze5ajp-z0+F+8Qo2z=834=i=HNa5=s54MLyrk16wQVnxCzQ@mail.gmail.com>
Subject: Re: [PATCH v9 0/9] x86: Show in sysfs if a memory node is able to do encryption
To:     Borislav Petkov <bp@alien8.de>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, ardb@kernel.org,
        dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 10/13/22, Borislav Petkov <bp@alien8.de> wrote:
> On Mon, Jul 04, 2022 at 10:58:24AM -0300, Martin Fernandez wrote:
>> If all nodes are capable of encryption and if the system have tme/sme
>> on we can pretty confidently say that the device is actively
>> encrypting all its memory.
>
> Wait, what?
>
> If all memory is crypto capable and I boot with mem_encrypt=off, then
> the device is certainly not encrypting any memory.
>
> dhansen says TME cannot be controlled this way and if you turn it off in
> the BIOS, EFI_MEMORY_CPU_CRYPTO attr should not be set either.

That's bad, because it would be nice if that attribute only depended
on the hardware and not on some setting.

The plan of this patch was, as you mentioned just to report
EFI_MEMORY_CPU_CRYPTO in a per node level.

Now, I think I will need to check for tme/sme and only if those are
active then show the file in sysfs, otherwise not show it at all,
because it would be misleading. Any other idea?

> But that
> marking won't work on AMD.

You mean that EFI_MEMORY_CPU_CRYPTO means nothing on an AMD system?
