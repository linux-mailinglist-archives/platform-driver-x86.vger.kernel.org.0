Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id E707D174182
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Feb 2020 22:31:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726845AbgB1VbR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 28 Feb 2020 16:31:17 -0500
Received: from mail-ot1-f68.google.com ([209.85.210.68]:43916 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726603AbgB1VbR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 28 Feb 2020 16:31:17 -0500
Received: by mail-ot1-f68.google.com with SMTP id j5so3067881otn.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 28 Feb 2020 13:31:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=E57qmAYxRULljTteoL9BnNM233t9xRFNSPdb4qSFmz4=;
        b=FOSXg/gDLnMTvsFKrROzrWHQkymULqZ4VWWSzkxbCpGWafrvoL1DbhvWHkNA1awmFJ
         mqZ4yc3Xu7lUtGU0lnzzTMrQrhjDoBb0aAi0O834VNv0Xx2wr1FRPluT436M+3L6Uu3P
         OeEfO9GHrkLM+a5+P9XzccUiCN5lVGpuO1RMFe6qheaZSXTBuWXwalcRrw3HRO/r9ITu
         dbpQvHayrSz63xS3XZJvxFAo9ni5zPDlHcVTL49HtS1LUdDaUyRpVgHEgZqSQiaYscIw
         1HyAUUJ1ehUcyfKMFiPZLd4BrozyOvRYXTSs34KN1qjk4Mke8taeKrGC90q2MJWKZrKw
         q4mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=E57qmAYxRULljTteoL9BnNM233t9xRFNSPdb4qSFmz4=;
        b=WzhSkDZQ2Q/HCTbO4iKizBrTmXYpT6wS+WceIvtVI7XVNhw7wWAI781IiVpCe0LMsF
         JPZaw2CH2EFERHgwybNvo6aPA4dwSvIp/BukZ86pwSI49N9gXyZMMGlFlt2fiDqCs22j
         0hZdmIJSMsqSs4UvBmRlrYA9DISwJL+QL3mWmDiZFe2yPn3XZsjBQuUm1zqviz+uGVf2
         0P+ax4DnqMpVVxpxWUBBEDnFK2wdv447UMPYBgJ83c6RIVJ454ftgqd0qSGUSHcO3m7/
         QZnZJTUQk84JDN3F05Z+Ynllp2PGtlzvEdwrC1R96MsrEuB+zcdm1+kOA1YuWmIxbEI0
         bf2g==
X-Gm-Message-State: APjAAAX8igavlIbqUQk4RlUVHaH3DkZeCvgVKGoIzLWPdR++FUi83ea8
        xpV9j63GrcXcGVb+u6Qt0Xpsb3KF6qRpSz69KlJbIHud
X-Google-Smtp-Source: APXvYqw3lx5wUMOoXp5Dz6+9E6dRQ6P4Q87wBR0C2ISCuvp93d5At8nQ1nTZ6ODRu1fC1blNWg8tMcQbt7eE8AgCHRU=
X-Received: by 2002:a9d:64d8:: with SMTP id n24mr4607004otl.71.1582925476085;
 Fri, 28 Feb 2020 13:31:16 -0800 (PST)
MIME-Version: 1.0
References: <20200221182503.28317-1-logang@deltatee.com> <20200221182503.28317-2-logang@deltatee.com>
In-Reply-To: <20200221182503.28317-2-logang@deltatee.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Fri, 28 Feb 2020 13:31:05 -0800
Message-ID: <CAPcyv4gFiCBN_Bz5eZrWXV0PEaWhwdHDkgEW7e5z0xZkp6a83w@mail.gmail.com>
Subject: Re: [PATCH v3 1/7] mm/memory_hotplug: Drop the flags field from
 struct mhp_restrictions
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
        David Hildenbrand <david@redhat.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Eric Badger <ebadger@gigaio.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Feb 21, 2020 at 10:25 AM Logan Gunthorpe <logang@deltatee.com> wrote:
>
> This variable is not used anywhere and should therefore be removed
> from the structure.
>
> Signed-off-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: David Hildenbrand <david@redhat.com>

Reviewed-by: Dan Williams <dan.j.williams@intel.com>
