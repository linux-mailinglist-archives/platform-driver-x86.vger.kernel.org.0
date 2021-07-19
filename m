Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C5A5F3CE7A6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 19 Jul 2021 19:14:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346447AbhGSQac (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 19 Jul 2021 12:30:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244117AbhGSQ1J (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 19 Jul 2021 12:27:09 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EC287C061767
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jul 2021 09:33:19 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id p36so16975974pfw.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 19 Jul 2021 09:54:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pHb5bkAVRB42TqiPWwfLPH1AL+uUpnACNe29QjGSxaY=;
        b=wWjAGEqCZT2SqkCZwd6sWt/7nsE3FDiXvtXZl03cKrrWqWxHoKPQIrsffQjKJ13WG3
         EtmnIKLF+iUOmpw/nICZRgWdRYzg5CVsZ4JGG31bckuuXW2KmDIrtW0aUWPbywlk+Re+
         ysYfGknbrkm6/fCX4e++AOlHrp85izifA31B0RM/WNmTyYeytvj3aGvaPOIheZbXd6Qg
         +f65RrcEPsNUtrQthvx/IqpwUYrZZlqBFKSDm3xxgdP4+/YqaSNRZrvRYVhpZxne3Fe3
         4pVNYC8FKZniaUHFqa3DGzuzMaVvBRv5hVoqiViY8Pgmw9z/gHkKcxQSKlLSDnwzB6Eb
         AujA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pHb5bkAVRB42TqiPWwfLPH1AL+uUpnACNe29QjGSxaY=;
        b=sLKo+ZB7LVkZDPk9JJIcx7RLwL762BVMj6hGJ2Us9CMTjlO6YwG3AV/o6OK4w2IDB0
         W52DvchQfza8QqmYMFiV4kG40PH9fQKFJ/FA4LAlRDXvAk14udJLQTNz7Etx872GU6nt
         NZlQf1G5GAaaEJDoFTZJ3xL4JOk3kiC192YO7k1vxfklR0JqprcfFdoZuGAsyIt/1vqE
         TWVqdTPqCgBD0X2K2OF4ZkpCUch3tehICzzKqTxHDgDUslZZR2RjLkpbE4D6oEGrhnSP
         guXCX2yS7+zKpz+qVsa0jgGB7s0BaNEevdZAy7YF8x1Zf5khEU5niQiRMSZtFQ2BBE+4
         5OdA==
X-Gm-Message-State: AOAM533Yhk3A6iBsYFJ/Sde6gE0bRJPd8tujMxZtN46oIvZVKGCLCKrn
        p92vk7Dwx0mBIihuqDrzac+pog==
X-Google-Smtp-Source: ABdhPJzjdliagIIxw89Ud0WLqDwORLqyx5dLKpfYjX5Qr2Jo5aV2ovPM9l2YmkMyXrKafSxH6Usw+Q==
X-Received: by 2002:a65:648f:: with SMTP id e15mr26154606pgv.165.1626713689551;
        Mon, 19 Jul 2021 09:54:49 -0700 (PDT)
Received: from google.com (157.214.185.35.bc.googleusercontent.com. [35.185.214.157])
        by smtp.gmail.com with ESMTPSA id q11sm25570pjd.30.2021.07.19.09.54.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 09:54:48 -0700 (PDT)
Date:   Mon, 19 Jul 2021 16:54:45 +0000
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
Subject: Re: [PATCH Part2 RFC v4 26/40] KVM: SVM: Add
 KVM_SEV_SNP_LAUNCH_FINISH command
Message-ID: <YPWuVY+rKU2/DVUS@google.com>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-27-brijesh.singh@amd.com>
 <YPHpk3RFSmE13ZXz@google.com>
 <9ee5a991-3e43-3489-5ee1-ff8c66cfabc1@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee5a991-3e43-3489-5ee1-ff8c66cfabc1@amd.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Jul 16, 2021, Brijesh Singh wrote:
> 
> On 7/16/21 3:18 PM, Sean Christopherson wrote:
> > On Wed, Jul 07, 2021, Brijesh Singh wrote:
> >> +	data->gctx_paddr = __psp_pa(sev->snp_context);
> >> +	ret = sev_issue_cmd(kvm, SEV_CMD_SNP_LAUNCH_FINISH, data, &argp->error);
> > Shouldn't KVM unwind everything it did if LAUNCH_FINISH fails?  And if that's
> > not possible, take steps to make the VM unusable?
> 
> Well, I am not sure if VM need to unwind. If the command fail but VMM decide
> to ignore the error then VMRUN will probably fail and user will get the KVM
> shutdown event. The LAUNCH_FINISH command finalizes the VM launch process,
> the firmware will probably not load the memory encryption keys until it moves
> to the running state.

Within reason, KVM needs to provide consistent, deterministic behavior.  Yes, more
than likely failure at this point will be fatal to the VM, but that doesn't justify
leaving the VM in a random/bogus state.  In addition to being a poor ABI, it also
makes it more difficult to reason about what is/isn't possible in KVM.

> >> +	 */
> >> +	if (sev_snp_guest(vcpu->kvm)) {
> >> +		struct rmpupdate e = {};
> >> +		int rc;
> >> +
> >> +		rc = rmpupdate(virt_to_page(svm->vmsa), &e);
> > So why does this not need to go through snp_page_reclaim()?
> 
> As I said in previous comments that by default all the memory is in the
> hypervisor state. if the rmpupdate() failed that means nothing is changed in
> the RMP and there is no need to reclaim. The reclaim is required only if the
> pages are assigned in the RMP table.

I wasn't referring to RMPUPDATE failing here (or anywhere).  This is the vCPU free
path, which I think means the svm->vmsa page was successfully updated in the RMP
during LAUNCH_UPDATE.  snp_launch_update_vmsa() goes through snp_page_reclaim()
on LAUNCH_UPDATE failure, whereas this happy path does not.  Is there some other
transition during teardown that obviastes the need for reclaim?  If so, a comment
to explain that would be very helpful.
