Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C1026260EA3
	for <lists+platform-driver-x86@lfdr.de>; Tue,  8 Sep 2020 11:26:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728676AbgIHJ01 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 8 Sep 2020 05:26:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728755AbgIHJ0Z (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 8 Sep 2020 05:26:25 -0400
Received: from mail-wm1-x343.google.com (mail-wm1-x343.google.com [IPv6:2a00:1450:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0DDDCC061756
        for <platform-driver-x86@vger.kernel.org>; Tue,  8 Sep 2020 02:26:24 -0700 (PDT)
Received: by mail-wm1-x343.google.com with SMTP id c19so13911278wmd.1
        for <platform-driver-x86@vger.kernel.org>; Tue, 08 Sep 2020 02:26:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=7fUecfB9LLaLKdzP7guVOAA/NuO83G9N3hrYCH3AmL8=;
        b=wJYV9lcctSfmuShvtMnwiMIVuVUnaSV031DntX0fPG7kD7YYi7Qfx0Ilnmvxn+Tw25
         0yXFXi/KnDTcytB5oXrQwmbhRANSi9ZHYQ4yA73UBM8JqWiO7gdDn8US5QiiH+3oT6Vo
         kPnjYDMTPDh8b4bAjVNlacArbDfEGQiAkC8c6wOcN91nKyl3efu5sHrsVSsVB7nIZCm5
         so67u6UcFoc9cR19KUwSNswZGeHf/a1Zs9syrBrIgIMzoWRBYOj8DgeNl8shAfXwgYrw
         xeXE+agv6IvHaHR8GHjKeFYvPUpy4gyVAN7n2w9jqaUtiYdWjg+ns9/aw7TICaQv6nYy
         u6cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=7fUecfB9LLaLKdzP7guVOAA/NuO83G9N3hrYCH3AmL8=;
        b=MYOA8EKrbDJwU0+Vc/krIo61gphRITZet1axRP9pYTB7AJjFJYYoTp7deRoGpSpPWi
         EvunhmXgaUQ0AqfR+9FsroQDlAgqSIs48mApGLX9TB4g1dM+1i6E/GmWLLya3JUoNnmT
         5cseZu4R3w2Ktu7mNHBuu51Y8ihES8nJW2uvtkTKlbhhV1q+DK81V2s7IJyMKZW7RXE5
         hYn4PKrEw034Bwkk2EXjM3Cc+sTXmKDyAV0ipNAqAJhwI/JTcDopbMvU+HhY7Ady9UZl
         ICGD2byN9ZzfqvxQZAWvcVlr4x5fUgYFmrpgEhwxIDj6pmm3GP8P1GVuhhliaPLS0YUN
         anZg==
X-Gm-Message-State: AOAM533uBK9rXRACcYCrjZJatBkowt8zH5MjALjI5DhCnLQpShZw57PI
        08auSpbxL/RmsUdIqJp5v1zoEQ==
X-Google-Smtp-Source: ABdhPJxI5VTNa1Xbty/QYz3FSrIm20cmWjYp2Nbc80tWhzIUSdGZ4zy0+uyd6xA+5ltRC7Q3J3XUXA==
X-Received: by 2002:a1c:24c4:: with SMTP id k187mr3456257wmk.148.1599557183364;
        Tue, 08 Sep 2020 02:26:23 -0700 (PDT)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id g8sm31966189wmd.12.2020.09.08.02.26.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2020 02:26:22 -0700 (PDT)
Date:   Tue, 8 Sep 2020 10:26:20 +0100
From:   Lee Jones <lee.jones@linaro.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     "David E. Box" <david.e.box@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Alexander Duyck <alexander.h.duyck@linux.intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-pci <linux-pci@vger.kernel.org>
Subject: Re: [RESEND PATCH V5 0/3] Intel Platform Monitoring Technology
Message-ID: <20200908092620.GL4400@dell>
References: <20200819180255.11770-1-david.e.box@linux.intel.com>
 <20200828105655.GU1826686@dell>
 <CAHp75VcKrkxuAJvXnLGnHJTkVfac6N0RTH-3OEA5ksV2psWBew@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHp75VcKrkxuAJvXnLGnHJTkVfac6N0RTH-3OEA5ksV2psWBew@mail.gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 28 Aug 2020, Andy Shevchenko wrote:

> On Fri, Aug 28, 2020 at 1:57 PM Lee Jones <lee.jones@linaro.org> wrote:
> > On Wed, 19 Aug 2020, David E. Box wrote:
> >
> > [...]
> >
> > > David E. Box (3):
> > >   PCI: Add defines for Designated Vendor-Specific Extended Capability
> > >   mfd: Intel Platform Monitoring Technology support
> > >   platform/x86: Intel PMT Telemetry capability driver
> > >
> > >  .../ABI/testing/sysfs-class-pmt_telemetry     |  46 ++
> > >  MAINTAINERS                                   |   6 +
> > >  drivers/mfd/Kconfig                           |  10 +
> > >  drivers/mfd/Makefile                          |   1 +
> > >  drivers/mfd/intel_pmt.c                       | 220 +++++++++
> > >  drivers/platform/x86/Kconfig                  |  10 +
> > >  drivers/platform/x86/Makefile                 |   1 +
> > >  drivers/platform/x86/intel_pmt_telemetry.c    | 448 ++++++++++++++++++
> > >  include/uapi/linux/pci_regs.h                 |   5 +
> > >  9 files changed, 747 insertions(+)
> > >  create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_telemetry
> > >  create mode 100644 drivers/mfd/intel_pmt.c
> > >  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c
> >
> > What's the plan for this set?
> >
> > I'm happy to pick it up and take it through MFD if required.
> 
> I guess that was already agreed like this and you were in Cc list of
> that discussion.

I have many submissions on the go at the moment.

Keeping full status for each of them in my head would be impossible.

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
