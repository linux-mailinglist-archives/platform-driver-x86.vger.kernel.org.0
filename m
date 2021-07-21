Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37D043D1594
	for <lists+platform-driver-x86@lfdr.de>; Wed, 21 Jul 2021 19:53:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229983AbhGURNA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 21 Jul 2021 13:13:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231254AbhGURM6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 21 Jul 2021 13:12:58 -0400
Received: from mail-qk1-x72d.google.com (mail-qk1-x72d.google.com [IPv6:2607:f8b0:4864:20::72d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7757DC061575
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 10:53:34 -0700 (PDT)
Received: by mail-qk1-x72d.google.com with SMTP id j184so2857731qkd.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 21 Jul 2021 10:53:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6yFvLCK83EARCEJW2USL66XPk2Snwg9rOn4V8eQnKq4=;
        b=LmYH4vBpP8tsrP/2QQX/a4c4LvuM1+b4/24JikG+Eg3ffRRWq1sLdvVWqmdZSpffFs
         zYMHn1k1Y7JSxueTKglktRFPafjcur+BGgT8Ux3LXzZB1CNjBqPF55WMoTS3UHR/naUy
         5HN4fHlgHkJlsYXgo1YafStP4kmIs1l/2txFBajcHQd5DgvTLQTHypzSg1u2dEsyWtNa
         1Gnt5R/qqXAZ4zGACvt2zRiwgMwtDzYJEII9SZ5Ev6ztWv9+tg0z29/yQFcibOFahdej
         SPDfQhV5wiSgG/WdTlqfqtvyXLh0cVDvfnKvx7ZZJF7FSQsGy43aezRKof8MJZkcTPGM
         o0VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6yFvLCK83EARCEJW2USL66XPk2Snwg9rOn4V8eQnKq4=;
        b=I030A3PMlT5zGuYAmlAAOrZLPJOCqzDDytZeagLTWxTm7F2ML+HC7J4Ul/99RuiURa
         96hE3NdNHtsTlHSomf7CXLGkmGl6iM3KxFyry41loq/nffpuvX0mNBYLe0vv1d7bQtyY
         pqx4G3T+KDlhWU6W8BmElzzgHuyFf6aqAZFQ0A3u+zpOYAKxaXbYccXuU3s9tss0/dx4
         0FtXkDf6/+fd/fb6kWBAgx+RbKIHnvi2IKuSLR2jQh6NznD7Xf0uSoDLUxD2aNzX4xvM
         /BewM2tJ6oIVtl1ckhjH6LhcbYCosv27fug58QQdkP11izygOtzdzlIlVhBjZBzC0J1T
         BhNQ==
X-Gm-Message-State: AOAM533U7cUFWHsfVnTM2CdBHN+RbRWtBo3G/1KowyQVKqIZEnuanIAw
        yT3947IOrmZC8iUwUBtVIqoMMf0OLcr6iB+ZIak/nA==
X-Google-Smtp-Source: ABdhPJzkyyOAFQakNLKPpJl5joOFjae/AcNTO5l2I8TPcjJJXSsAIKXc+xGIz33Gsbm9HQbKLCjKhxqfB9nnHVogi3Y=
X-Received: by 2002:a37:8044:: with SMTP id b65mr22312539qkd.150.1626890013396;
 Wed, 21 Jul 2021 10:53:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210707183616.5620-1-brijesh.singh@amd.com> <20210707183616.5620-27-brijesh.singh@amd.com>
 <YPHpk3RFSmE13ZXz@google.com> <9ee5a991-3e43-3489-5ee1-ff8c66cfabc1@amd.com> <YPWuVY+rKU2/DVUS@google.com>
In-Reply-To: <YPWuVY+rKU2/DVUS@google.com>
From:   Marc Orr <marcorr@google.com>
Date:   Wed, 21 Jul 2021 10:53:22 -0700
Message-ID: <CAA03e5EW1HUZW7xWbMyYMC1Q+A18G=91qfKT-ew=X0XNGHbVtg@mail.gmail.com>
Subject: Re: [PATCH Part2 RFC v4 26/40] KVM: SVM: Add KVM_SEV_SNP_LAUNCH_FINISH
 command
To:     Sean Christopherson <seanjc@google.com>
Cc:     Brijesh Singh <brijesh.singh@amd.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, kvm list <kvm@vger.kernel.org>,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-coco@lists.linux.dev, linux-mm@kvack.org,
        linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        Wanpeng Li <wanpengli@tencent.com>,
        Jim Mattson <jmattson@google.com>,
        Andy Lutomirski <luto@kernel.org>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Sergio Lopez <slp@redhat.com>, Peter Gonda <pgonda@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Michael Roth <michael.roth@amd.com>,
        Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
        npmccallum@redhat.com, brijesh.ksingh@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 19, 2021 at 9:54 AM Sean Christopherson <seanjc@google.com> wrote:
>
> On Fri, Jul 16, 2021, Brijesh Singh wrote:
> >
> > On 7/16/21 3:18 PM, Sean Christopherson wrote:
> > > On Wed, Jul 07, 2021, Brijesh Singh wrote:
> > >> +  data->gctx_paddr = __psp_pa(sev->snp_context);
> > >> +  ret = sev_issue_cmd(kvm, SEV_CMD_SNP_LAUNCH_FINISH, data, &argp->error);
> > > Shouldn't KVM unwind everything it did if LAUNCH_FINISH fails?  And if that's
> > > not possible, take steps to make the VM unusable?
> >
> > Well, I am not sure if VM need to unwind. If the command fail but VMM decide
> > to ignore the error then VMRUN will probably fail and user will get the KVM
> > shutdown event. The LAUNCH_FINISH command finalizes the VM launch process,
> > the firmware will probably not load the memory encryption keys until it moves
> > to the running state.
>
> Within reason, KVM needs to provide consistent, deterministic behavior.  Yes, more
> than likely failure at this point will be fatal to the VM, but that doesn't justify
> leaving the VM in a random/bogus state.  In addition to being a poor ABI, it also
> makes it more difficult to reason about what is/isn't possible in KVM.

+1 to Sean's feedback to unwind everything here properly here.
Comments of the nature of "XYZ should happen" -- without a test (e.g.,
selftest or kvm-unit-test) to ensure the XYZ _does_ happen -- are a
time bomb waiting to happen.

Also, I wonder if we leave pages, RMPUPDATE'd to immutable in previous
loop iterations, is it possible for them to remain as immutable and be
reused later on (after this guest is destroyed)? And if this happens,
will we get an RMP violation? Even if the answer is no -- go read this
code 2,000 lines away -- it handles this case. That's still not a very
satisfying answer. I'd rather see things cleaned up ASAP as soon as
the code starts to go off the rails.
