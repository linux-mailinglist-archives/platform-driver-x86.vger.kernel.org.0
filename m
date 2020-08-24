Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C70EF24FAF2
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 12:02:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbgHXKCS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 06:02:18 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:50040 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726086AbgHXKCR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 06:02:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598263336;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=d5WjFeKcT8vJmK2T92yi7w25HeJKu4Dz9dSI4L65Jpc=;
        b=LWD5rUlqcteUT2BTg9rnXf7lmdDubro/rhFQuzi20yargUPT/9FYijAjhMq0olT0MBBm2/
        un2mLK3cCyj82WZ06zFPbklJF4BCVe5jHcBDFXsqK+SE9Ut01BHl4BAjs3nDsjTBAAfSqQ
        dG/Q4/D9N20qGlyhtpK/BtUquFB6oUo=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-245-408O_GjGOfW2Olwc7k_lmQ-1; Mon, 24 Aug 2020 06:02:14 -0400
X-MC-Unique: 408O_GjGOfW2Olwc7k_lmQ-1
Received: by mail-ej1-f70.google.com with SMTP id g20so264048ejd.8
        for <platform-driver-x86@vger.kernel.org>; Mon, 24 Aug 2020 03:02:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=d5WjFeKcT8vJmK2T92yi7w25HeJKu4Dz9dSI4L65Jpc=;
        b=jSpMbnXfZn7FSQnPfT3WJpbkkxrGTyvaf78Xc/p02j8dMUIyvl2XufaUOqC/jHNLTG
         N39/7FZfJlL1O+wgdCwEcT2ibDjNaflzyPUk8ETpAqKQWdFzeV7QRuGqF2lTKiRdFNQh
         xqwWqFR6gwskh45V/KIdCGCGHLYSCXITrdghzDhbZu/GGM7nXNEPV0mYKnQG+jAZ3gKh
         5HQmmGTN8OCZjJtn8tWUq2jgmJnzZS8wIpnYL9HAxC6NQiGmM4AhICp28ImnwTbdzGbu
         3QSkXhlE0d+juiEdJBWXPKZj4U/JOs7fyHCQFEQK/OH+I4U0WenoDSxvITuJ3OCP9bsk
         Iucg==
X-Gm-Message-State: AOAM532trTsp9BNwU+mviAWqKQD/g61B/nL0JT2G2Pcy69v807cjZJlE
        PFniu6JnZVEWyihjXr7M5MeKNcVwgr0BcOt9alAlQV7qIVlbyg/N3ZxCLwJHCuYIRC19KFL71HQ
        A8SFI6kNufChzwIOfz47jLjYalous3PuWew==
X-Received: by 2002:a17:906:bcd4:: with SMTP id lw20mr507522ejb.499.1598263333760;
        Mon, 24 Aug 2020 03:02:13 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy4Fpk3y75YUItUjoQTQypj15PNEnNzI7hV3RjyWjCVyraWzjzCQWOF6INzjlqgsWMA3pfG4Q==
X-Received: by 2002:a17:906:bcd4:: with SMTP id lw20mr507507ejb.499.1598263333562;
        Mon, 24 Aug 2020 03:02:13 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id d7sm9371498ejk.99.2020.08.24.03.02.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2020 03:02:13 -0700 (PDT)
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Marius Iacob <themariusus@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
Date:   Mon, 24 Aug 2020 12:02:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200824082501.GB1891694@smile.fi.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/24/20 10:25 AM, Andy Shevchenko wrote:
> On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
> 
>> I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
> 
> Can you be more specific, why that module is not loaded?

Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.

>> I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?

include/linux/i8042.h

Contains a stub for i8042_install_filter() for when CONFIG_SERIO_I8042 is not enabled, so you can build
your own kernel with that option unset. But we really ought to come up with a better fix which will also
work for standard distro kernels, see above.

Regards,

Hans

