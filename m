Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8175F3F1A62
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Aug 2021 15:31:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238488AbhHSNbo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Aug 2021 09:31:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36000 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S238469AbhHSNbo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Aug 2021 09:31:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629379867;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ZMxPO4Hsb+ECqs+fN77FMO4kFLr98qHqe4Bnv69c3Jg=;
        b=Kck7FIUYivf6J9cvOeYwdA+OtMGDW/iI3wuByVtEczhYkXJy2wC7eagjmpEpfK45HVLX2J
        lDbaR5NmGOlPEvbToN1H83KCcyPmJmscg9egFRtfLv0TeV4HV+t+AlghKnlbyQnzJFIM5+
        YfUT79YhpJId2Lqt8QHrtsOHjFhs1y0=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-588-P8QuZzumNEaxN7qmRgJzMA-1; Thu, 19 Aug 2021 09:31:06 -0400
X-MC-Unique: P8QuZzumNEaxN7qmRgJzMA-1
Received: by mail-ed1-f72.google.com with SMTP id a23-20020a50ff170000b02903b85a16b672so2832694edu.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Aug 2021 06:31:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=ZMxPO4Hsb+ECqs+fN77FMO4kFLr98qHqe4Bnv69c3Jg=;
        b=n9OPjjfm/kleeRMWK4rkClYkNR1MzKRcyiNchDKXQyGvpCJ88WO52/8qoFQNPzNhXn
         LCXenkXy3JA40GVhumPIh51ZE6Cy7dPkp5e+uvw58cR9z71WWawkES9oYMsz6FESteqb
         b3/i/p7e3kVwamgx7Hw1KOhBZ1gTRBsvtgDfE7zVUGJDuiBMvdFmVweljZxWZYRkZ2nJ
         XmdiIUKacLZd0RTgqIJfJr+pQ02Gb7QB2zC4DX4WCpPXF5tW/2mQhwJqfj9eZ4XHll2R
         8uiiqYpFPcQInPHSxaE0C2URklPwV327T5uj0P44u4JMfZ/zMd+wXSfte6o41WsYsf90
         vY2A==
X-Gm-Message-State: AOAM533GDw+GOmCnr9B/t15WlVxF/aBXRFk+ZJY14fCB44swcvSnEUH8
        QysWOYUWm2HKvTo/XwF8IJkFFM/m2NZR73MNAi7z7gzsl3bf8Z3o1YyxLKNBjSJv6JJmN/NJcc2
        doA5C1PvfqTQDI+Ukkg9mOvyqDNAva6OG8fTsU8yIjrq/F7DYagDY7azZJKwu7s+ukeLsupjWKH
        pGARy5oDhBNg==
X-Received: by 2002:a50:ff06:: with SMTP id a6mr4145081edu.220.1629379865288;
        Thu, 19 Aug 2021 06:31:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwGnmmdalfHADjyQGbyzstD3BtvbvvSJ6O7IbgTbECK8QY8ELWP/34Dn+fihz1l1FIIItPynA==
X-Received: by 2002:a50:ff06:: with SMTP id a6mr4145049edu.220.1629379865120;
        Thu, 19 Aug 2021 06:31:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b3sm1298090ejb.7.2021.08.19.06.31.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 06:31:04 -0700 (PDT)
Subject: Re: [PATCH v3 00/20] Intel platform driver code movement
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Kate Hsuan <hpa@redhat.com>, Alex Hung <alex.hung@canonical.com>,
        Mark Gross <mgross@linux.intel.com>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        AceLan Kao <acelan.kao@canonical.com>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        Sujith Thomas <sujith.thomas@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        Zha Qipeng <qipeng.zha@intel.com>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        "David E . Box" <david.e.box@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Dell.Client.Kernel@dell.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20210819033001.20136-1-hpa@redhat.com>
 <1360c64f-b695-a4b8-8b61-a4dfb0e896f0@redhat.com>
 <CAHp75VcdOc+G1Yov9HcGhMbEqzGwemmD7=SHd3qOOsEdAqjg2Q@mail.gmail.com>
 <CAHp75VfvjVeq716d=aGvZXvmzbpW4+XG66ryVYrBxk5G5Wd6cg@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a5e52890-c162-ab48-4858-3eb0e971e5a1@redhat.com>
Date:   Thu, 19 Aug 2021 15:31:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VfvjVeq716d=aGvZXvmzbpW4+XG66ryVYrBxk5G5Wd6cg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/21 2:14 PM, Andy Shevchenko wrote:
> On Thu, Aug 19, 2021 at 3:03 PM Andy Shevchenko
> <andy.shevchenko@gmail.com> wrote:
>> On Thu, Aug 19, 2021 at 1:48 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>>
>>> Thank you for your patch-series, I've applied the series to my
>>> review-hans branch:
>>> https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans
>>>
>>> With the changes mentioned in replies to individual patches.
>>
>> Can we postpone this a bit, please?
>>
>> I have a few comments here and there. I'll send asap.
> 
> Hmm... It seems it will take less time if I simply take what you have
> in your repo and produce a v4.
> Would it work?

That is fine by me, I might be better to just do a small follow-up patch
though, given that you seem to only have a few small remarks.

But if you prefer to do a v4 that is fine too. I was planning on
keeping this in review-hans for a while anyways.

I did notice the couple of stray changes which you pointed out but
they get corrected by other commits (or are removal of extra whitespace
left-over from other commits), so I decided that they were harmless
since the end-result Makefile / Kconfig files were good.

Regards,

Hans

