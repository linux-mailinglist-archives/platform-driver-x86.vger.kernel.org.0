Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5C35E416F34
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Sep 2021 11:41:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245290AbhIXJnF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 Sep 2021 05:43:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245221AbhIXJnF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 Sep 2021 05:43:05 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 25523C061757
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Sep 2021 02:41:32 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id z24so38551274lfu.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 Sep 2021 02:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shutemov-name.20210112.gappssmtp.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=7QWYmDDdQ14wxTTMWtNorG+4hnmrm04qfz4ZOujDnZs=;
        b=a94RXEUJuMmQvxSDKok9kJbMV98Mo28f1Csi4Z4iwvW7+MkRyX5SrQhnYAAaonglNs
         TqzSbC141ptsWvvzM0S2r5099PgvSLUTd+llMs5cQH1O/KYv2VKwA3rHbEQ17XEUoJiN
         b88sf+8/Kq6CN5gKqNMDbt0WofHePWjCWhJfrHH/URopiQYKQJViZtb5wMUubTQfdu6m
         e490qkHKD0Pb0R4D5rMx+0JuhhDDbQUkFWETXBCjCVPYNSZnkKFRM+sk+iiLVm+sara7
         E1aPac0dVliF4TZMk0iL6yousngzwZf3UFxxtnempLUEnPswt9hwLB+6ECQ/gPgJLFvg
         u+ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=7QWYmDDdQ14wxTTMWtNorG+4hnmrm04qfz4ZOujDnZs=;
        b=j5zyk54KZ3C8eSOfZHX6bNprqarY9Mh83t6Mgmd4SnHLeCrBx4Q4w6L1mTbVO3V1Tn
         aBNhTvq8ijYXauqupcB7J7BsS/lzT+a1VoYZ/ZpEjxN8mjD8t+qN0nm+T53zTTlFFRFA
         RM56vlwnVTG8Y3Xrjh9q5yZBNDM5pH7/JH8h6U0EkVNCsnYf/mgA+mZI3nsfSXosI0FG
         vvnzD1Lpwl3uvo9ECitDq0H07f4jPks6vKMNJIaV9kYamCzniGFVuLCWccc2jCGazz7+
         B1BlDJHaqIHgzx+ngYWnwtXxbYJtzLLjdg8QSANn1nHqfEXgzfE8UkxYf0RrlrXPropj
         5srQ==
X-Gm-Message-State: AOAM532plI3Q+iMOuS7U/cwDoYlJ9/dv2elfR0m7e5CoBqBCqwtVK5t1
        /lXJ1FBFeBwi5vFH/9J4CmB+hw==
X-Google-Smtp-Source: ABdhPJz+tcQG7FGy3FlEBQPrN+mpMikLwlc4Lo7J+ey+pIvMNuRrMxCLd7yfmXFIncsb4Qxt6AJb6g==
X-Received: by 2002:a2e:804c:: with SMTP id p12mr10420673ljg.344.1632476490492;
        Fri, 24 Sep 2021 02:41:30 -0700 (PDT)
Received: from box.localdomain ([86.57.175.117])
        by smtp.gmail.com with ESMTPSA id k21sm952544lji.81.2021.09.24.02.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Sep 2021 02:41:29 -0700 (PDT)
Received: by box.localdomain (Postfix, from userid 1000)
        id 84289103068; Fri, 24 Sep 2021 12:41:32 +0300 (+03)
Date:   Fri, 24 Sep 2021 12:41:32 +0300
From:   "Kirill A. Shutemov" <kirill@shutemov.name>
To:     Borislav Petkov <bp@alien8.de>
Cc:     Tom Lendacky <thomas.lendacky@amd.com>,
        linuxppc-dev@lists.ozlabs.org, linux-s390@vger.kernel.org,
        linux-kernel@vger.kernel.org, x86@kernel.org,
        iommu@lists.linux-foundation.org, kvm@vger.kernel.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-graphics-maintainer@vmware.com,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        kexec@lists.infradead.org, linux-fsdevel@vger.kernel.org,
        Brijesh Singh <brijesh.singh@amd.com>,
        Joerg Roedel <joro@8bytes.org>,
        Andi Kleen <ak@linux.intel.com>,
        Sathyanarayanan Kuppuswamy 
        <sathyanarayanan.kuppuswamy@linux.intel.com>,
        Tianyu Lan <Tianyu.Lan@microsoft.com>,
        Christoph Hellwig <hch@infradead.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Will Deacon <will@kernel.org>
Subject: Re: [PATCH v3 5/8] x86/sme: Replace occurrences of sme_active() with
 cc_platform_has()
Message-ID: <20210924094132.gxyqp4z3qdk5w4j6@box.shutemov.name>
References: <20210921212059.wwlytlmxoft4cdth@box.shutemov.name>
 <YUpONYwM4dQXAOJr@zn.tnic>
 <20210921213401.i2pzaotgjvn4efgg@box.shutemov.name>
 <00f52bf8-cbc6-3721-f40e-2f51744751b0@amd.com>
 <20210921215830.vqxd75r4eyau6cxy@box.shutemov.name>
 <01891f59-7ec3-cf62-a8fc-79f79ca76587@amd.com>
 <20210922143015.vvxvh6ec73lffvkf@box.shutemov.name>
 <YUuJZ2qOgbdpfk6N@zn.tnic>
 <20210922210558.itofvu3725dap5xx@box.shutemov.name>
 <YUzFj+yH79XRc3F3@zn.tnic>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YUzFj+yH79XRc3F3@zn.tnic>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Sep 23, 2021 at 08:21:03PM +0200, Borislav Petkov wrote:
> On Thu, Sep 23, 2021 at 12:05:58AM +0300, Kirill A. Shutemov wrote:
> > Unless we find other way to guarantee RIP-relative access, we must use
> > fixup_pointer() to access any global variables.
> 
> Yah, I've asked compiler folks about any guarantees we have wrt
> rip-relative addresses but it doesn't look good. Worst case, we'd have
> to do the fixup_pointer() thing.
> 
> In the meantime, Tom and I did some more poking at this and here's a
> diff ontop.
> 
> The direction being that we'll stick both the AMD and Intel
> *cc_platform_has() call into cc_platform.c for which instrumentation
> will be disabled so no issues with that.
> 
> And that will keep all that querying all together in a single file.

And still do cc_platform_has() calls in __startup_64() codepath?

It's broken.

Intel detection in cc_platform_has() relies on boot_cpu_data.x86_vendor
which is not initialized until early_cpu_init() in setup_arch(). Given
that X86_VENDOR_INTEL is 0 it leads to false-positive.

I think opencode these two calls is the way forward. Maybe also move the
check from sme_encrypt_kernel() to __startup_64().

-- 
 Kirill A. Shutemov
