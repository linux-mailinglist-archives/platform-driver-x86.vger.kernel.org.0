Return-Path: <platform-driver-x86+bounces-12299-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 71827AC2518
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 May 2025 16:35:13 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 337E4540353
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 May 2025 14:35:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E8801295DAE;
	Fri, 23 May 2025 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b84De/zP"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D8861CB518
	for <platform-driver-x86@vger.kernel.org>; Fri, 23 May 2025 14:35:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748010910; cv=none; b=orKkgSBO/answy3TaejQW/qmlK1P4dToWq1wYbe/TULAupMwxcyz4epRITiK2fI1ja2kiB3WLpo7gIPiURcttRVIZxStGb0fH7uIQrXV2pLASuUyWuvGqpUwyXraatIRgc509vC4CRjzELKXCHJAfqoUsJLQku9bhR14tzgzlgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748010910; c=relaxed/simple;
	bh=rpziN1/05Zj11wUE9u4BbCxVKKTZOSPJiBdxOoe4oCQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=aMgDWiC9xJ2OzW3YSHxc9A2ELs3kSkvFtPx0xtz8tX2/1z7Tq7FJYeL5OZcNYejaiesn9VHFWqm0JMvV8aJypZ2iXBLL8wE5NkUxdWVk6u2KLH4HYqE48ccTnoUojS2dAYVR6f3YLFrFLkpwTJapdtEKh2esI1fHFGHeyEOEEoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b84De/zP; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-231d7f590ffso55016635ad.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 May 2025 07:35:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748010909; x=1748615709; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OHIXFovAEYPRF7pj3DkvXM+Wh6ry7OAZQdb2dc5cgKo=;
        b=b84De/zPy6OG7FPMct1S/l0RArSEw077OwRFF8QI1wCXcsIr22NtiTb84AWT63UXbP
         RfM3rq17cVcnzqgWKhmBoF+fXJTWsZbY4F/p8C/xjl0ettvBg6kn/kgB9W5QVh2Yvi2Y
         4Mf+ZzIJd2th0q3njefRUC3Dj3tZTzrFD0do/0h28Lgx9fGfwnW5b8SZ6IMBZurC3HOM
         p9dzZj/9SpMFYBFzYmh/PlOz/oMQz0ZLLY3NlRWunqFyPr8lpy6o1b4lIbxcOhb2xIKd
         BdsWUWUpRel+re7QfPTc+rW7RtdZgHK2xYATjZ0VzkEICtxIe8tLX8GxMjEOKKkXoQ6O
         +4jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748010909; x=1748615709;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OHIXFovAEYPRF7pj3DkvXM+Wh6ry7OAZQdb2dc5cgKo=;
        b=Mc/SZ7USugQPP2jJsku9wFPu/sGeCwbCHDpEog7xXa3ryAHvEoiIg9TNL6uKQK+DNR
         GRzYJCew7c2IM6IkufAo1tylIQlQwDlHM6EYk6T9BuR/7xd9+Tr6m9DfDP3l4rc4Pd/X
         7AMJ025p1/Cfi5xBt3wHysKZBG6mgVqcGGzmUHuB+25E1OM+AH3rUDyvS78NhFgzdv1k
         bG2PJp0kREc9B5P7Q4m0IhxFpjJMHxRlKMBZ53CkurJ7tXlQuDPwyBD/H7CmNOZ16uu9
         adnzPUOJOvFpjDvn3ni7J0Yj+F494wH7Gzk9IT0J8fTa1LlWjNoPIh/PFjMwH3g0kc3j
         cqtw==
X-Forwarded-Encrypted: i=1; AJvYcCU723hl+ZCk7EOTsaKiUuvEmBZacWqCGaPRdGBlRmGNjIJZ2l2f49IQMqsYwna0pmh9xLypEZ+G12Dw2k/DsBmtLYdG@vger.kernel.org
X-Gm-Message-State: AOJu0YxLk08rHyWiJKJd0fQvBOi0sQ3cmHG1+gIN9og71LFDwnLGMy5T
	jqf6bcEFR2MsLZQsnkJRVw5CkSI6hbLwpw20QuzCvDTBLo4sammbNusLcLnDjBZkW5iQt75WcgB
	CXbzqMA==
X-Google-Smtp-Source: AGHT+IFz7sb0nLy8RLNRfKCeKqRGA0z4OYWQ9Q5+lv5cIKJ3DXiQQbAp7L//6YajGR6GltgQpVeH/+sDQGY=
X-Received: from plka13.prod.google.com ([2002:a17:903:f8d:b0:231:def0:d268])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:41c7:b0:224:1221:1ab4
 with SMTP id d9443c01a7336-231de317b43mr439457305ad.22.1748010908457; Fri, 23
 May 2025 07:35:08 -0700 (PDT)
Date: Fri, 23 May 2025 07:35:03 -0700
In-Reply-To: <20250523043935.2009972-4-kees@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250523043251.it.550-kees@kernel.org> <20250523043935.2009972-4-kees@kernel.org>
Message-ID: <aDCHl0RBMgNzGu6j@google.com>
Subject: Re: [PATCH v2 04/14] x86: Handle KCOV __init vs inline mismatches
From: Sean Christopherson <seanjc@google.com>
To: Kees Cook <kees@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Vitaly Kuznetsov <vkuznets@redhat.com>, Henrique de Moraes Holschuh <hmh@hmh.eng.br>, 
	Hans de Goede <hdegoede@redhat.com>, 
	"Ilpo =?utf-8?B?SsOkcnZpbmVu?=" <ilpo.jarvinen@linux.intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>, Ard Biesheuvel <ardb@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Michal Wilczynski <michal.wilczynski@intel.com>, 
	Juergen Gross <jgross@suse.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Roger Pau Monne <roger.pau@citrix.com>, 
	David Woodhouse <dwmw@amazon.co.uk>, Usama Arif <usama.arif@bytedance.com>, 
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>, Thomas Huth <thuth@redhat.com>, Brian Gerst <brgerst@gmail.com>, 
	kvm@vger.kernel.org, ibm-acpi-devel@lists.sourceforge.net, 
	platform-driver-x86@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-efi@vger.kernel.org, 
	linux-mm@kvack.org, "Gustavo A. R. Silva" <gustavoars@kernel.org>, Christoph Hellwig <hch@lst.de>, 
	Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrey Ryabinin <ryabinin.a.a@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nicolas.schier@linux.dev>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, linux-doc@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-security-module@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	sparclinux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="us-ascii"

On Thu, May 22, 2025, Kees Cook wrote:
> diff --git a/arch/x86/kernel/kvm.c b/arch/x86/kernel/kvm.c
> index 921c1c783bc1..72f13d643fca 100644
> --- a/arch/x86/kernel/kvm.c
> +++ b/arch/x86/kernel/kvm.c
> @@ -420,7 +420,7 @@ static u64 kvm_steal_clock(int cpu)
>  	return steal;
>  }
>  
> -static inline void __set_percpu_decrypted(void *ptr, unsigned long size)
> +static __always_inline void __set_percpu_decrypted(void *ptr, unsigned long size)

I'd rather drop the "inline" and explicitly mark this "__init".  There's value
in documenting and enforcing that memory is marked decrypted/shared only during
boot.

>  {
>  	early_set_memory_decrypted((unsigned long) ptr, size);
>  }

