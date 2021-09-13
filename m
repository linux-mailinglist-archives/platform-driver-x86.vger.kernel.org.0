Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A3E0408AD6
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Sep 2021 14:15:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237106AbhIMMRI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Sep 2021 08:17:08 -0400
Received: from mail1.protonmail.ch ([185.70.40.18]:45627 "EHLO
        mail1.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236765AbhIMMRI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 08:17:08 -0400
Date:   Mon, 13 Sep 2021 12:15:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631535350;
        bh=HEgJT80cplqOGko4uCmBos4hwbahCjSeY4JV/Ip7qyU=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=u2sBnQGKgZfRtYy+7GfNx2OlBFAFUDchRnVlhK91MHNBi+A9oxI1guwSVRGYWZx+6
         kizWNsDlklrsITF78/PohD3h2cj1JxdDZgcP33QM7ysCLR/RQwk7qFq4CJgxd0fTTm
         fs2Eb73PZdQdsxZWx+vbckwKu81jWod3UBTm3YjE=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v1] platform/x86: wmi: initialize method name directly
Message-ID: <iEeEte3wo5BG2NCmh5maeSDY6lUKyxcNdSTRMDXkKsClHCr1LkfBFv0OLwpuIr6EHnl2_6QvRmTy9XTAtgTT5vpLWYe1dy6GisNb7-1UjUw=@protonmail.com>
In-Reply-To: <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com>
References: <20210913110805.12387-1-pobrn@protonmail.com> <14e14dd2-a51e-87ae-5776-5f0a585e4936@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 13., h=C3=A9tf=C5=91 13:53 keltez=C3=A9ssel, Hans de Goede=
 =C3=ADrta:
> In "platform/x86: wmi: introduce helper to generate method names"
> you added a get_acpi_method_name() helper for generating WMI
> method-names and you are using that everywhere else.
>
> IMHO it would be better to also use that here. Is there any
> specific reason why you are not using this here ?

Yes, indeed, but `get_acpi_method_name()` uses the `object_id` of the GUID =
block,
this one uses the `notify_id`. And it seemed problematic to find a simple
way to reconcile the differences, so I haven't really given it much thought=
.
I'm open to suggestions.


Regards,
Barnab=C3=A1s P=C5=91cze
