Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4C03A3C62E4
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Jul 2021 20:46:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236019AbhGLStA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Jul 2021 14:49:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235996AbhGLSs7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Jul 2021 14:48:59 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1F4B7C0613E5
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jul 2021 11:46:10 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id a12so136880lfb.7
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Jul 2021 11:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gxxKGdA+5qR/PqDl5JcB6bRGhDZ950mjZMdzjeHwe9A=;
        b=v+epGUGrho+waSY/qXypfEen9g1FP1Y1I3VGFmt+FSd8NqjlYzx0xWVOhBij1bXxVe
         1rOMkUh+FfFAQKz6Akh9cS91jlTHunIs6MU8tC+0vMNPOFx98/BXd7VJi6NojikBw66S
         xuwJowHMP2SBEQFM0RFdRoPaFvfDUyTB7fKOIxuLad2FbLmwa9di03QUYyalRYiFy63E
         OoZWfSLwumDFV/ZpiHpbtTOWfBntcWKDkqVeu+r2G9Hf0MXJoq259JaXexCZPI/Usx02
         XIW38qdRKAXxDFSmfWCH6K/zlOqcrI8i7CPB7Euz7D0RucnOFsrWxxu0vLIJA0aOG0xp
         4vjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gxxKGdA+5qR/PqDl5JcB6bRGhDZ950mjZMdzjeHwe9A=;
        b=TjjdDr/yu35n9swVUuVvKsa0kErTCo13vQnG/WiFyWVmDQ+kVOpvSnbUZHe95Gsi90
         jGLN+kMtLQIsvDQVkU5M6PoGMcXNaomNrLg3hAZrylL21wODnDYb13AevgN1FH8FeBKr
         a+5NEgkiX9ainDia2Kmr+K7PCrqj1Q0yK8JIOjMNmqXanHE0NZHoe/Gm4om/LtcINiK5
         f16+f4DP8jjfRkAyc0KHF27h3v07YUlpPPN4FWQpC/6fiqhGvkrD94SgR6zxiZ900S6q
         VeHGM9do7RMiyESRJy25XIsDubCsmMnQqQ2yFGBj/tol60sQkQmfjkc1uuGkfDUgm22T
         Fa9w==
X-Gm-Message-State: AOAM533BThQpWFBI1WMwr40Z9ItskaKDOBf0rYsmTFqqYyZq0bc9wYaH
        FrKYL0y+E5gb//D2HVIC+BQ2H1NVqfS+ZOUD3Rnv4g==
X-Google-Smtp-Source: ABdhPJzsnk7g8zQbTcCI707MmRveOtRone01I/489DLAAbH6SqY0xHeKZ2mm1i8batQMfCx2LW4ztu4s6lovd6kKRS4=
X-Received: by 2002:a19:f710:: with SMTP id z16mr115428lfe.455.1626115568191;
 Mon, 12 Jul 2021 11:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20210707183616.5620-1-brijesh.singh@amd.com> <20210707183616.5620-24-brijesh.singh@amd.com>
In-Reply-To: <20210707183616.5620-24-brijesh.singh@amd.com>
From:   Peter Gonda <pgonda@google.com>
Date:   Mon, 12 Jul 2021 12:45:56 -0600
Message-ID: <CAMkAt6q5Zjyn798fbhyQhmy+2drwSVRnCzMWxTUR-QUFzY9kEg@mail.gmail.com>
Subject: Re: [PATCH Part2 RFC v4 23/40] KVM: SVM: Add KVM_SEV_SNP_LAUNCH_START command
To:     Brijesh Singh <brijesh.singh@amd.com>
Cc:     x86@kernel.org, linux-kernel@vger.kernel.org,
        kvm list <kvm@vger.kernel.org>, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-coco@lists.linux.dev,
        linux-mm@kvack.org, linux-crypto@vger.kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
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
        Sergio Lopez <slp@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>,
        David Rientjes <rientjes@google.com>,
        Dov Murik <dovmurik@linux.ibm.com>,
        Tobin Feldman-Fitzthum <tobin@ibm.com>,
        Borislav Petkov <bp@alien8.de>,
        Michael Roth <michael.roth@amd.com>,
        Vlastimil Babka <vbabka@suse.cz>, tony.luck@intel.com,
        Nathaniel McCallum <npmccallum@redhat.com>,
        brijesh.ksingh@gmail.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

>
> +static int snp_decommission_context(struct kvm *kvm)
> +{
> +       struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> +       struct sev_data_snp_decommission data = {};
> +       int ret;
> +
> +       /* If context is not created then do nothing */
> +       if (!sev->snp_context)
> +               return 0;
> +
> +       data.gctx_paddr = __sme_pa(sev->snp_context);
> +       ret = snp_guest_decommission(&data, NULL);
> +       if (ret)
> +               return ret;

Should we WARN or pr_err here? I see in the case of
snp_launch_start's e_free_context we do not warn the user they have
leaked a firmware page.

>
> +
> +       /* free the context page now */
> +       snp_free_firmware_page(sev->snp_context);
> +       sev->snp_context = NULL;
> +
> +       return 0;
> +}
> +
>  void sev_vm_destroy(struct kvm *kvm)
>  {
>         struct kvm_sev_info *sev = &to_kvm_svm(kvm)->sev_info;
> @@ -1847,7 +1969,15 @@ void sev_vm_destroy(struct kvm *kvm)
>
>         mutex_unlock(&kvm->lock);
>
> -       sev_unbind_asid(kvm, sev->handle);
> +       if (sev_snp_guest(kvm)) {
> +               if (snp_decommission_context(kvm)) {
> +                       pr_err("Failed to free SNP guest context, leaking asid!\n");

Should these errors be a WARN since we are leaking some state?


> +                       return;
> +               }
> +       } else {
> +               sev_unbind_asid(kvm, sev->handle);
> +       }
> +
>         sev_asid_free(sev);
>  }
>
