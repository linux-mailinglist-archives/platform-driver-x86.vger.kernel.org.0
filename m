Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BEA2853EAC5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Jun 2022 19:09:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235553AbiFFLmN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 Jun 2022 07:42:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45630 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235542AbiFFLmL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 Jun 2022 07:42:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 4ED17B24
        for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jun 2022 04:42:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1654515727;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=LbU0lHc+WuTsfhjoR9o0hk34WGqlmY1f4clG2HCMCgk=;
        b=GdNj97MlOG2A67jgibe+4hsKpOAHqDLNtwlv8f89XTvUMy7FELty6m42+Ym7NlPNYk1ftF
        wZuBPyISMIV7xl14tsoTbmeyiLX7MyZreko95BOwtqUJ9veUCFzfUNtNo4VWYfgsaCy1HK
        VwVPU0PiZkKgCAeginH8Y0s/lYp8hcg=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-302-rK_k0WlnMWmkRLAMiO5AEQ-1; Mon, 06 Jun 2022 07:42:06 -0400
X-MC-Unique: rK_k0WlnMWmkRLAMiO5AEQ-1
Received: by mail-wr1-f70.google.com with SMTP id t2-20020adfe442000000b002108370e7a3so2705270wrm.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 Jun 2022 04:42:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=LbU0lHc+WuTsfhjoR9o0hk34WGqlmY1f4clG2HCMCgk=;
        b=8IU2C+36rCu2ZXq4mJcIb+p4TAWoC/1IHslpz7hA/w3lJNqobFVy2s1ssT3V2QcCyR
         ihhRvLdTaOgAUkXASo/q5v0GUG+6OVX49ba3S8RKxGwPJpqH+MbRNRfYkKtHaYFBN7Ap
         kuc6nK3V/Kjgiau8M/DdSzSlLqhLEV5Mb+Odi6n0jofmN1trGh2rf3Ck9W/wXT0HYlV+
         UG+2n4yAh5qtDt9qu1N1bGwYqsq7/vhN2dAI45QqU02sCMqqbcdpWTHe60zyH0wtquqL
         hYHgqUQjB9Qm2G8g0dxrtqw4UNenBthlMfaP3bbiyxfdAOat6UGykKY3iTleyA7h5n1Y
         PCYg==
X-Gm-Message-State: AOAM532VASk4Dkmgfoi6EHoyhY5vzP1eSOEbUR+0YpzOLdOezsp4ysk3
        M99Cwsg+DHeXbyEKRTS8wXfYBmP+oX+16bQYL+xpqjli1Sjq2RSy21RLLnqdOfMf3uXfMKIRxzg
        lqgLQyj/bZz7GWpVVW5fm3rvTsrQOVQBdvQ==
X-Received: by 2002:adf:f385:0:b0:213:bb0e:383a with SMTP id m5-20020adff385000000b00213bb0e383amr16114877wro.481.1654515725446;
        Mon, 06 Jun 2022 04:42:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzEvzYVC9++mJVt13KuXQ5MBP3pxhBSkYiVChyG6utGpOcobdad2X2l/uq7b7FRSa2su3OnkA==
X-Received: by 2002:adf:f385:0:b0:213:bb0e:383a with SMTP id m5-20020adff385000000b00213bb0e383amr16114820wro.481.1654515725160;
        Mon, 06 Jun 2022 04:42:05 -0700 (PDT)
Received: from work-vm (cpc109025-salf6-2-0-cust480.10-2.cable.virginm.net. [82.30.61.225])
        by smtp.gmail.com with ESMTPSA id h5-20020a5d5045000000b0020d07d90b71sm14848968wrt.66.2022.06.06.04.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jun 2022 04:42:04 -0700 (PDT)
Date:   Mon, 6 Jun 2022 12:42:01 +0100
From:   "Dr. David Alan Gilbert" <dgilbert@redhat.com>
To:     Jarkko Sakkinen <jarkko.sakkinen@iki.fi>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org, kvm@vger.kernel.org,
        linux-efi@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-coco@lists.linux.dev, linux-mm@kvack.org,
        linux-crypto@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Joerg Roedel <jroedel@suse.de>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "H. Peter Anvin" <hpa@zytor.com>, Ard Biesheuvel <ardb@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Sean Christopherson <seanjc@google.com>,
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
Subject: Re: [PATCH Part2 RFC v4 04/40] x86/sev: Add the host SEV-SNP
 initialization support
Message-ID: <Yp3oCYwZbYuVQ9r6@work-vm>
References: <20210707183616.5620-1-brijesh.singh@amd.com>
 <20210707183616.5620-5-brijesh.singh@amd.com>
 <YpijNgA9ZJFOwF8k@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YpijNgA9ZJFOwF8k@kernel.org>
User-Agent: Mutt/2.2.1 (2022-02-19)
X-Spam-Status: No, score=-3.3 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

* Jarkko Sakkinen (jarkko.sakkinen@iki.fi) wrote:
> On Wed, Jul 07, 2021 at 01:35:40PM -0500, Brijesh Singh wrote:
> > The memory integrity guarantees of SEV-SNP are enforced through a new
> > structure called the Reverse Map Table (RMP). The RMP is a single data
> > structure shared across the system that contains one entry for every 4K
> > page of DRAM that may be used by SEV-SNP VMs. The goal of RMP is to
> > track the owner of each page of memory. Pages of memory can be owned by
> > the hypervisor, owned by a specific VM or owned by the AMD-SP. See APM2
> > section 15.36.3 for more detail on RMP.
> > 
> > The RMP table is used to enforce access control to memory. The table itself
> > is not directly writable by the software. New CPU instructions (RMPUPDATE,
> > PVALIDATE, RMPADJUST) are used to manipulate the RMP entries.
> 
> What's the point of throwing out a set of opcodes, if there's
> no explanation what they do?

TBF They are described in the public document section linked in the previous
paragraph.

Dave
> BR, Jarkko
> 
-- 
Dr. David Alan Gilbert / dgilbert@redhat.com / Manchester, UK

