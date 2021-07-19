Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 37F723CEE88
	for <lists+platform-driver-x86@lfdr.de>; Mon, 19 Jul 2021 23:45:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234780AbhGSVDY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 19 Jul 2021 17:03:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1384742AbhGSSfR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jul 2021 14:35:17 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55595C0613E4
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jul 2021 12:04:27 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id j4so3333261pgk.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jul 2021 12:14:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2XllpOUOhhdBvpd5Av+f2na/9hRxJV/QURDHxqubmW8=;
        b=TAK2LJLZI6u4VHRX2CtOxDwgftlqvQHU1lzhdQy0LcCcpbcr9ralpKcma3Fe1DAXVB
         YEbBG2X95V7PcYiO0NGfbsi3Mq0cpEE3BWadst6/qrqSI45eUiSf3Qjvvs6crWGL9pAk
         f2S4uAxDH1tnD8dXBw6emsJHGIQpk2eykj7mExtMmKVHuA7Vr+eL6Oey1hzAPDg0oa7c
         OqiF98AMx5gJrcAFkQlYE7iIsV7JKMNqh9RKqeBFp/4OqS+g0z1Kqo7z2BDexEgHIRFG
         OcCF2FjqNIBEhh9hv1V9N0corxEGyzsVRPh6ngPwFo0wqMpY3VZZiMwxPSWpMijKQ4qA
         4xYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2XllpOUOhhdBvpd5Av+f2na/9hRxJV/QURDHxqubmW8=;
        b=tOeQ0acN3Z8IIKwm7+YhCBecZzrJsNIjXSfT9O+JBcTvEH4Ok5FtBsdzw3Vo0sC1pJ
         0bYseoQ5+S+gpdOpPMSVHXolumByDWLgBpbu/dFfGwVYmIO20+gpHeFtJpPBX7jfLks+
         h5J7xCBm9gXYxKTfU4o23TiDvnNy2a+3ELPbYErYL7oHygCyLAY77EHDMc4o0uQsaSRw
         uWcExkqBDIla04t/vRWtgTAxceLwwMilfs58ihwUo1/5aDnfrCDoaijwOf2gTPxIxDp6
         iA7fpvJ9J4+5rxH5EoeQm2M8MBe8xwpTv/JWM3KgPOjOvSezBOqSGTjCjtLDu0edHYcq
         sJ0w==
X-Gm-Message-State: AOAM532jIwZyy8TVVBZ9tYHBxZXQuRsxv1RyttWuqXtT4uZY6J/feiUi
        kqGNcP6e2TXawZA9W6PFQikWCA==
X-Google-Smtp-Source: ABdhPJx+EzDcqa/llq3nQF6Vq0NHWvv5j8Tkv3O31Pzz7AmNV8hJdli78mh1Sa+ATMQeYmFd5XN3Uw==
X-Received: by 2002:a63:5059:: with SMTP id q25mr26911779pgl.9.1626722059360;
        Mon, 19 Jul 2021 12:14:19 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id u24sm22109816pfm.141.2021.07.19.12.14.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 12:14:18 -0700 (PDT)
Date:   Mon, 19 Jul 2021 19:14:15 +0000
From:   Sean Christopherson <seanjc@google.com>
To:     Brijesh Singh <brijesh.singh@amd.com>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
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
Subject: Re: [PATCH Part2 RFC v4 25/40] KVM: SVM: Reclaim the guest pages
 when SEV-SNP VM terminates
Message-ID: <YPXPB1WMW8WY9cZ7@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-26-brijesh.singh@amd.com>
 <YPHnb5pW9IoTcwWU@google.com>
 <2711d9f9-21a0-7baa-d0ff-2c0f69ca6949@amd.com>
 <YPIoaoDCjNVzn2ZM@google.com>
 <e1cc1e21-e7b7-5930-1c01-8f4bb6e43b3a@amd.com>
 <YPWz6YwjDZcla5/+@google.com>
 <912c929c-06ba-a391-36bb-050384907d81@amd.com>
 <YPXMas+9O1Y5910b@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YPXMas+9O1Y5910b@google.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 19, 2021, Sean Christopherson wrote:
> On Mon, Jul 19, 2021, Brijesh Singh wrote:
> > 
> > On 7/19/21 12:18 PM, Sean Christopherson wrote:
> > > > 
> > > > Okay, I will add helper to make things easier. One case where we will
> > > > need to directly call the rmpupdate() is during the LAUNCH_UPDATE
> > > > command. In that case the page is private and its immutable bit is also
> > > > set. This is because the firmware makes change to the page, and we are
> > > > required to set the immutable bit before the call.
> > > 
> > > Or do "int rmp_make_firmware(u64 pfn, bool immutable)"?
> > 
> > That's not what we need.
> > 
> > We need 'rmp_make_private() + immutable' all in one RMPUPDATE.  Here is the
> > snippet from SNP_LAUNCH_UPDATE.
> 
> Ah, not firmwrare, gotcha.  But we can still use a helper, e.g. an inner
> double-underscore helper, __rmp_make_private().

Hmm, looking at it again, I think I also got confused by the comment for the VMSA
page:

	/* Transition the VMSA page to a firmware state. */
 	e.assigned = 1;
	e.immutable = 1;
	e.asid = sev->asid;
	e.gpa = -1;
	e.pagesize = RMP_PG_SIZE_4K;

Unlike __snp_alloc_firmware_pages() in the CCP code, the VMSA is associated with
the guest's ASID, just not a GPA.  I.e. the VMSA is more of a specialized guest
private page, as opposed to a dedicated firmware page.  I.e. a __rmp_make_private()
and/or rmp_make_private_immutable() definitely seems like a good idea.
