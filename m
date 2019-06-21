Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B3AE04ECA1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jun 2019 17:54:44 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726210AbfFUPyj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Jun 2019 11:54:39 -0400
Received: from mail-io1-f65.google.com ([209.85.166.65]:34779 "EHLO
        mail-io1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726049AbfFUPyj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Jun 2019 11:54:39 -0400
Received: by mail-io1-f65.google.com with SMTP id k8so1245744iot.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 21 Jun 2019 08:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=67Zwr0+JR5ftAH9XUiVHCrJ8ZWllxG5OsGyxy9ZC38U=;
        b=PHUKIT0ZA3D4YNl0n8jtu3bk/mrY4ytlRjGB3rTDb7+ENS6p5Mu5RTIT8BarLvMCTH
         gUUt+fPaymQJQez1UZ6QAZesqWJrySt+p1i0cDLoupf8DZ9WMJDGtaYPk7IxlBWw7Z1Y
         H7yJVROh7kaYVz1Ck9fATi7Avsz9ofKCoHfMDIBia5wwCTpMdxyk/N3SntRzXKNYQtfu
         I5kn+SsO+J0fWxgqcmq78xHSJdtdY5WuvM2c81CqjGs3krBniLMpYVXI1EzD+qvFHUh6
         PX2RqoVKiWVfbcoTmU5ZeGBFmhc9bJf7ehLbfEvtq5Lp1VuBJi7+ylPD2Tgle8PrztfY
         U3ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=67Zwr0+JR5ftAH9XUiVHCrJ8ZWllxG5OsGyxy9ZC38U=;
        b=JMp+HuvtHiHYNv5A2PEfw/9W0KXHzqmVlss/T0oQabxq5Vcd0jMxE5K9P+q2OLAasE
         3JIiPEjVXVS+68W13HmW6GjL+yIh9RY77xc9qLDrZo6ymCscmGoZjjnAsgxidGium6tg
         qajrMbl5Po5fQPtjdne8et2eKXm2qCiWMt8Oq4mjKLBnuPPPM68zekwBW5VnXdd+Tr08
         Dq2GKKLdK4LOOPnlldT1sMRZKsdxhMg0JsqCjDpnkQaI6uVQ8JkUDsoxHCv4PTuOzW13
         ZDgB4YbeNKMnF//vlH5IkIWk1F7dNYWMKj5oZ47HGSE700BKLn+ZA5jh9acGnOZ/QXVD
         SQMQ==
X-Gm-Message-State: APjAAAUWaghe/ikNC88UPmqg6faKrMOHMa49M72ubfhkF1OnAnvYgDXh
        kbDmnqOgkc4pY3fW4KThy1rKR0M3O74mBi8iR6TQokjtGlAxSQ==
X-Google-Smtp-Source: APXvYqyi87dZ/gi5usy6mMIGsqoAR7PMShcYzW72U858qc3P99BF2m9iqkby4DNpe/dyc1JPF0bLnWX/rYQGsvwmFAE=
X-Received: by 2002:a05:6602:98:: with SMTP id h24mr7359926iob.49.1561132478625;
 Fri, 21 Jun 2019 08:54:38 -0700 (PDT)
MIME-Version: 1.0
References: <1560966464-27644-1-git-send-email-cai@lca.pw> <FFF73D592F13FD46B8700F0A279B802F4F787D4B@ORSMSX114.amr.corp.intel.com>
In-Reply-To: <FFF73D592F13FD46B8700F0A279B802F4F787D4B@ORSMSX114.amr.corp.intel.com>
From:   Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date:   Fri, 21 Jun 2019 17:54:27 +0200
Message-ID: <CAKv+Gu8ynfn04eSNqJR__yFJMrp6=FptxTcN40YwomV4O5u=OA@mail.gmail.com>
Subject: Re: [PATCH v2] x86/efi: fix a -Wtype-limits compilation warning
To:     "Prakhya, Sai Praneeth" <sai.praneeth.prakhya@intel.com>
Cc:     Qian Cai <cai@lca.pw>, "bp@alien8.de" <bp@alien8.de>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "hpa@zytor.com" <hpa@zytor.com>, "x86@kernel.org" <x86@kernel.org>,
        "linux-efi@vger.kernel.org" <linux-efi@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 19 Jun 2019 at 19:53, Prakhya, Sai Praneeth
<sai.praneeth.prakhya@intel.com> wrote:
>
> > Compiling a kernel with W=1 generates this warning,
> >
> > arch/x86/platform/efi/quirks.c:731:16: warning: comparison of unsigned
> > expression >= 0 is always true [-Wtype-limits]
> >
> > Fixes: 3425d934fc03 ("efi/x86: Handle page faults occurring while running EFI
> > runtime services")
> > Signed-off-by: Qian Cai <cai@lca.pw>
> > ---
> >
> > v2: Add a "Fixes" tag.
>
> Makes sense.
> Thanks for the fix Qian Cai.
>

Queued as a fix with Sai's ack

Thanks,
