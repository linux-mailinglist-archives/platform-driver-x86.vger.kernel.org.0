Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEF932AB522
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Nov 2020 11:39:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727915AbgKIKjl (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Nov 2020 05:39:41 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:49462 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1727791AbgKIKjl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 05:39:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604918379;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=sNz4CwdEBgDEFBS+cBSmmbQnCB5qRqllefFeVHk1v+Y=;
        b=b7xXmfRyQwaiCMTh7+q4j72hbXmWHJCwyjic2NV7mnU9nO5/rCohYZlRYezNiFoKr30AdQ
        dpNXa7525yjdnHGwVWDUNsLT7HnhCoCM+RUCpDl63MuWmiZ2FRs1ZUTudbJCKIKNbtPyTQ
        xhRm+qz/Y1/ry/Pw3eQ++aURjH+ItMM=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-590-uDF12lNaN4uSuekFAdzQJg-1; Mon, 09 Nov 2020 05:39:37 -0500
X-MC-Unique: uDF12lNaN4uSuekFAdzQJg-1
Received: by mail-ed1-f71.google.com with SMTP id dj19so1115688edb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 02:39:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sNz4CwdEBgDEFBS+cBSmmbQnCB5qRqllefFeVHk1v+Y=;
        b=oaqQ9Bz8kx8cNiXI/ZSdnp5/Ou3mEl/SHnv44n3n1cbBCTx4tl6qpL372zcCmmiAUC
         q1NV2jljW6wZPmWRlgLbzHBtm1Uug3TwEBUEVU3Pn1TF4+B7KdvNrfY0hJDOxBxCr0Pv
         +nzqbyOnkfk7C/N92jYYW5V+UC5zgehbiJB8Qk/deiSZyzXw6tIpjvwO4uqsSUH7RPS5
         G6BcUbeMtIiEPWIsjPo1ICRlKashk3ArIIvxmvPGkP4ji8ysFFurQFWY6t1GI8TEsMFS
         yzWSmHvYfHBeNUT/Zzpu3ds6c//BuyzBMCYTnJWq0PX38F9yhzV1BE4lA+0/bKaXzGqw
         PTlw==
X-Gm-Message-State: AOAM531OXS0TzMeeuVxNbPF4YwhqUVs9DbvwT09jMQGC1H3zXFRzUAIS
        cJmAzNOvbpUjC/BZOkLiBr6gnP6hD57CElPDZS5hnVpC3qy//Iy58AnPs65Kyo7PFrwiIFUElWh
        SgK3J8T2HiL+rpTKayVClKFlSsRVJU7ldOA==
X-Received: by 2002:a17:906:389a:: with SMTP id q26mr14655312ejd.211.1604918376670;
        Mon, 09 Nov 2020 02:39:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzVWP24PKWT9B6c5rAm9vB839w4Ouy2HSHzIwt9rcCZnr3Hht/K5F7miQWkdEyGYabOritcsQ==
X-Received: by 2002:a17:906:389a:: with SMTP id q26mr14655295ejd.211.1604918376417;
        Mon, 09 Nov 2020 02:39:36 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id k2sm8517627ejp.6.2020.11.09.02.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 02:39:35 -0800 (PST)
Subject: Re: [GIT PULL] Immutable branch between MFD and x86 due for the v5.11
 merge window
To:     Lee Jones <lee.jones@linaro.org>,
        "David E. Box" <david.e.box@linux.intel.com>
Cc:     mgross@linux.intel.com, bhelgaas@google.com,
        alexey.budankov@linux.intel.com, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pci@vger.kernel.org
References: <20201029014449.14955-1-david.e.box@linux.intel.com>
 <20201104111723.GC4488@dell>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <41c7e595-d529-8483-6766-e9906f407a09@redhat.com>
Date:   Mon, 9 Nov 2020 11:39:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201104111723.GC4488@dell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/4/20 12:17 PM, Lee Jones wrote:
> Enjoy!
> 
> The following changes since commit 3650b228f83adda7e5ee532e2b90429c03f7b9ec:
> 
>   Linux 5.10-rc1 (2020-10-25 15:14:11 -0700)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git ib-mfd-x86-v5.11
> 
> for you to fetch changes up to 5ef9998c96b0c99c49c202054586967e609286d2:
> 
>   platform/x86: Intel PMT Crashlog capability driver (2020-11-04 11:14:38 +0000)
> 
> ----------------------------------------------------------------
> Immutable branch between MFD and x86 due for the v5.11 merge window

Thank you I've merged this into my review-hans (future for-next) branch of:
git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86

Regards,

Hans



> 
> ----------------------------------------------------------------
> Alexander Duyck (3):
>       platform/x86: Intel PMT class driver
>       platform/x86: Intel PMT Telemetry capability driver
>       platform/x86: Intel PMT Crashlog capability driver
> 
> David E. Box (2):
>       PCI: Add defines for Designated Vendor-Specific Extended Capability
>       mfd: Intel Platform Monitoring Technology support
> 
>  Documentation/ABI/testing/sysfs-class-intel_pmt | 119 +++++++++
>  MAINTAINERS                                     |   6 +
>  drivers/mfd/Kconfig                             |  10 +
>  drivers/mfd/Makefile                            |   1 +
>  drivers/mfd/intel_pmt.c                         | 223 ++++++++++++++++
>  drivers/platform/x86/Kconfig                    |  34 +++
>  drivers/platform/x86/Makefile                   |   3 +
>  drivers/platform/x86/intel_pmt_class.c          | 297 +++++++++++++++++++++
>  drivers/platform/x86/intel_pmt_class.h          |  52 ++++
>  drivers/platform/x86/intel_pmt_crashlog.c       | 328 ++++++++++++++++++++++++
>  drivers/platform/x86/intel_pmt_telemetry.c      | 160 ++++++++++++
>  include/uapi/linux/pci_regs.h                   |   5 +
>  12 files changed, 1238 insertions(+)
>  create mode 100644 Documentation/ABI/testing/sysfs-class-intel_pmt
>  create mode 100644 drivers/mfd/intel_pmt.c
>  create mode 100644 drivers/platform/x86/intel_pmt_class.c
>  create mode 100644 drivers/platform/x86/intel_pmt_class.h
>  create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c
>  create mode 100644 drivers/platform/x86/intel_pmt_telemetry.c
> 

