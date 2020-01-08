Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 63586134B40
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jan 2020 20:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729843AbgAHTIO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jan 2020 14:08:14 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:45928 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1729813AbgAHTIN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jan 2020 14:08:13 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578510492;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Amws6MWhDh9ExYW39LjH1zvpuHRVUUVI5bKPn/z5HTo=;
        b=MgrzUElRXSqqnGryin3ePG5/wLCinB1rGbHGoagz4D+fKKE5ukqp8Uo3sYWeTVSqCt/rWr
        lirw98n1ZbFmu7pMx5xSuDMT5/tA4l0TipOQwCHOpxPVylTAVDTR+Y9Svxh8dc/Ar1km+U
        MVNHYTqdDlci2Ogw7GZSwP+DKWyOpsY=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-114-CuQrK39rPiy9KzuONE4PmQ-1; Wed, 08 Jan 2020 14:08:11 -0500
X-MC-Unique: CuQrK39rPiy9KzuONE4PmQ-1
Received: by mail-wm1-f72.google.com with SMTP id l11so129205wmi.0
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jan 2020 11:08:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:content-transfer-encoding:from:mime-version
         :subject:date:message-id:references:cc:in-reply-to:to;
        bh=Amws6MWhDh9ExYW39LjH1zvpuHRVUUVI5bKPn/z5HTo=;
        b=PqQUfW2vJdvCOqAABP1bUPav7czLcyfOfOmR5+5uGlvCw3co7iN6pcuU/YTWilf99v
         ELnwWsoyfpM2XdS5fZSLdh3LNLZ8Q1gQPJeTWXMjqU9JO9W/VVGRoWZWJibBril4rqle
         kltBT3481qoTFAafmY6nfjEjaq6AF8nzZ4xMLxKg3TWydHm6y0ORvqkXwkk64hVfydXt
         /2dGgNAKuvAyeKRFmW5xGDzXU9iu9O7rRLhJdXqiDTPgdiitd0ES/h9Tn6N3HG+GhjcP
         ShL5aMslZxAQcwaxwjBax8+Q9Za74pBbpcPNGlACTewtPisrRjlikiG15NfiziDREEJo
         sHpQ==
X-Gm-Message-State: APjAAAWOHgBbld/Qk07KfKDu452kNA7Jx8QvZONOm0H7NskWw/jNFAN2
        7gjWVdz6BTKAy1NWgmb+dqHpUDN0Q8Py2q77zuv+zln4b87kELhNRNkb/P5udpAI0e5nuiWidda
        9Uq0CDAy8We2lHylye8obFNB91K8sn76Asg==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr6334289wrv.77.1578510490048;
        Wed, 08 Jan 2020 11:08:10 -0800 (PST)
X-Google-Smtp-Source: APXvYqzwSf5xR5AuD7FXuI2qLWJMD45CtNqKofERmd6oZKYNzsaH7aKCx0AwVIr77ei63TWVvkuj2Q==
X-Received: by 2002:a5d:534d:: with SMTP id t13mr6334244wrv.77.1578510489748;
        Wed, 08 Jan 2020 11:08:09 -0800 (PST)
Received: from [192.168.3.122] (p5B0C6BAD.dip0.t-ipconnect.de. [91.12.107.173])
        by smtp.gmail.com with ESMTPSA id f12sm49809wmf.28.2020.01.08.11.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 11:08:09 -0800 (PST)
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
From:   David Hildenbrand <david@redhat.com>
Mime-Version: 1.0 (1.0)
Subject: Re: [PATCH v2 2/8] mm/memory_hotplug: Rename mhp_restrictions to mhp_modifiers
Date:   Wed, 8 Jan 2020 20:08:07 +0100
Message-Id: <5D5ED235-EB67-4072-8CCA-C046B7EC031C@redhat.com>
References: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
Cc:     Logan Gunthorpe <logang@deltatee.com>,
        David Hildenbrand <david@redhat.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        linux-ia64@vger.kernel.org,
        linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
        linux-s390 <linux-s390@vger.kernel.org>,
        Linux-sh <linux-sh@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, Linux MM <linux-mm@kvack.org>,
        Michal Hocko <mhocko@kernel.org>,
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
In-Reply-To: <CAPcyv4hdpMs5om4_VrYUz98aWDJ9eRhj7WJr312Jwn6LCmAm9Q@mail.gmail.com>
To:     Dan Williams <dan.j.williams@intel.com>
X-Mailer: iPhone Mail (17C54)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



> Am 08.01.2020 um 20:00 schrieb Dan Williams <dan.j.williams@intel.com>:
>=20
> =EF=BB=BFOn Wed, Jan 8, 2020 at 9:17 AM Logan Gunthorpe <logang@deltatee.c=
om> wrote:
>>=20
>>=20
>>=20
>>> On 2020-01-08 5:28 a.m., David Hildenbrand wrote:
>>> On 07.01.20 21:59, Logan Gunthorpe wrote:
>>>> The mhp_restrictions struct really doesn't specify anything resembling
>>>> a restriction anymore so rename it to be mhp_modifiers.
>>>=20
>>> I wonder if something like "mhp_params" would be even better. It's
>>> essentially just a way to avoid changing call chains rough-out all archs=

>>> whenever we want to add a new parameter.
>>=20
>> Sure, that does sound a bit nicer to me. I can change it for v3.
>=20
> Oh, I was just about to chime in to support "modifiers" because I
> would expect all parameters to folded into a "params" struct. The
> modifiers seem to be limited to the set of items that are only
> considered in a non-default / expert memory hotplug use cases.
>=20

It=E2=80=98s a set of extended parameters I=E2=80=98d say.=20=

