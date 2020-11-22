Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C83B42BC62E
	for <lists+platform-driver-x86@lfdr.de>; Sun, 22 Nov 2020 15:47:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727881AbgKVOrK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 22 Nov 2020 09:47:10 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:43813 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727860AbgKVOq5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 22 Nov 2020 09:46:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1606056416;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
        b=XA3Bdia/xK9rtALsHLhdMXNkl5EWPz83+inaq5KZnxbZp/pqE7ot4cuq9wfEbTWVu1jCkd
        fkI/qAlh4sU3l8dOrlq7C5hNdTdH0le7t+rDrYZ5+jjUTJP5ekv3G25710udgF6Q97joi/
        ih3DR460gM+B9YwlFm0ND3pgcFfhizQ=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-46-VUMpaSj2Nw6aTTPAgYDwxQ-1; Sun, 22 Nov 2020 09:46:52 -0500
X-MC-Unique: VUMpaSj2Nw6aTTPAgYDwxQ-1
Received: by mail-qt1-f199.google.com with SMTP id b10so11585327qtb.16
        for <platform-driver-x86@vger.kernel.org>; Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=apju6gP6XSpkYwp4WdL57a/nFAvNI/QCKhQkuBxc3S8=;
        b=gIFygmMIlIsgO94i/LB3w7GgxBnyfK5guDiu2d+BOs9iVyagnBf5upbpACN79bZA7T
         M6Yh2FftVpUDuyAnerHS0Swbuk+aVi3I1jK/c3E8ZXdANSJwwwD3/UHO2yV/7JKgqod0
         UeDI2p8KiXsGSvMNeq2rPiIRziOyn+TVdOLBX4oiLaLjtlMyK4YZihzPwDgVVW3c5LZA
         G303PplV6zvj6c2WJmCwkDY3Qbckkm1cLqTAahaLgZ23E/T2/9/KMcKnWYojqi8ESp2/
         dx9uaI9MjOOU8aeT1NFcEPMo0y78dwGvNEFSIdyu2vaf+hFI3etgxnND4Lz+rvN1HI3e
         LbdA==
X-Gm-Message-State: AOAM533SzMgxVskv9JRkoet/wmit08YPP2IhXynojfHbMKvt4wn46Dk7
        3dbh67fKGLS13HYbc4mbNt7zcad6aTJqhCgsaTWO9BwcfXgvh/nGNf20HbNmcfUG2v+/W4Et/1u
        Qkvrb7cSKprCGGwj1IhjOXs6JMhDr5zKruQ==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026161qvx.57.1606056412427;
        Sun, 22 Nov 2020 06:46:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyPQ8vJIBgyJxmgPlUVzOaStXFRaD0Z+d8VDmnR7kdLyNkvwByAGPov006wc7+pJBCcgj+/zw==
X-Received: by 2002:ad4:476b:: with SMTP id d11mr26026152qvx.57.1606056412222;
        Sun, 22 Nov 2020 06:46:52 -0800 (PST)
Received: from trix.remote.csb (075-142-250-213.res.spectrum.com. [75.142.250.213])
        by smtp.gmail.com with ESMTPSA id x72sm6888242qkb.90.2020.11.22.06.46.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Nov 2020 06:46:51 -0800 (PST)
Subject: Re: [RFC] MAINTAINERS tag for cleanup robot
To:     Matthew Wilcox <willy@infradead.org>
Cc:     joe@perches.com, clang-built-linux@googlegroups.com,
        linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
        xen-devel@lists.xenproject.org, tboot-devel@lists.sourceforge.net,
        kvm@vger.kernel.org, linux-crypto@vger.kernel.org,
        linux-acpi@vger.kernel.org, devel@acpica.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        intel-gfx@lists.freedesktop.org, netdev@vger.kernel.org,
        linux-media@vger.kernel.org, MPT-FusionLinux.pdl@broadcom.com,
        linux-scsi@vger.kernel.org, linux-wireless@vger.kernel.org,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-omap@vger.kernel.org, linux-fbdev@vger.kernel.org,
        ecryptfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
        cluster-devel@redhat.com, linux-mtd@lists.infradead.org,
        keyrings@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, alsa-devel@alsa-project.org,
        bpf@vger.kernel.org, linux-bluetooth@vger.kernel.org,
        linux-nfs@vger.kernel.org, patches@opensource.cirrus.com
References: <20201121165058.1644182-1-trix@redhat.com>
 <20201122032304.GE4327@casper.infradead.org>
From:   Tom Rix <trix@redhat.com>
Message-ID: <ddb08a27-3ca1-fb2e-d51f-4b471f1a56a3@redhat.com>
Date:   Sun, 22 Nov 2020 06:46:46 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20201122032304.GE4327@casper.infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 11/21/20 7:23 PM, Matthew Wilcox wrote:
> On Sat, Nov 21, 2020 at 08:50:58AM -0800, trix@redhat.com wrote:
>> The fixer review is
>> https://reviews.llvm.org/D91789
>>
>> A run over allyesconfig for x86_64 finds 62 issues, 5 are false positives.
>> The false positives are caused by macros passed to other macros and by
>> some macro expansions that did not have an extra semicolon.
>>
>> This cleans up about 1,000 of the current 10,000 -Wextra-semi-stmt
>> warnings in linux-next.
> Are any of them not false-positives?  It's all very well to enable
> stricter warnings, but if they don't fix any bugs, they're just churn.
>
While enabling additional warnings may be a side effect of this effort

the primary goal is to set up a cleaning robot. After that a refactoring robot.

Tom

