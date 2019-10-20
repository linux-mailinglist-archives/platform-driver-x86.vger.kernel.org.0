Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 82ACADDD3C
	for <lists+platform-driver-x86@lfdr.de>; Sun, 20 Oct 2019 10:02:23 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725893AbfJTICW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 20 Oct 2019 04:02:22 -0400
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34627 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725823AbfJTICW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 20 Oct 2019 04:02:22 -0400
Received: by mail-pl1-f194.google.com with SMTP id k7so4999727pll.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 20 Oct 2019 01:02:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hGxLiKriszNNauF+dxxESOpBvAgD9yGPZLuaMzscZV4=;
        b=YnTFRL0vdiNQpcOS4LyxvUPGwI2Jh244rdcLmtRFcboXJCSOnBdPO5X2ACohwuGAGS
         lyxTtoITk3LZ0lfhX+SvMhvuZQpPWterx7RoYh0qhzIJKkulxH7S4BX7BHVO6U2mQoRQ
         9i9V3VbYcSPg+sCJV60X7/qKtSZ25zUxRXYGryGDpumBMhn1eGGI1mUIMThI/wLxqUZK
         iz5yemS9FsPsynt9h8WaYCgJgZsuv4sdPBsKgoTKRDfxlrn2YKqxJfdGy2lbMaZfgLzj
         M8vSdZGDZ+KZnV7Kg9GGf0e1xvqhX7DAVAY/SwEUuazSVpNAEcdAzjIoUg5tFC2U4vy0
         EQcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hGxLiKriszNNauF+dxxESOpBvAgD9yGPZLuaMzscZV4=;
        b=l1XRz2T8dPJZkSnaecfmmMrNY5TtUrdjLjzosr/0EFnWg2dPQGudnjQMbOtv8ha21A
         2J7UHSKEBqY6Q2Lhk8V/7sDgyILztN9nt8GIcxCXP0orwIv/UR9RKrwGTD0phwUhWHls
         zhQu1PtGdI9PaoFWNq1ZzbgJ2259YplkR8t1h9k1Meb0VjGaOHw4Z4pQ665t1U8lZ7oD
         yUd1wJ63yX7/Ayr+NIv6F82QC6f5GHkiy4SBCa73EmauhFvQ955fcojUAP2wLlbXRxpq
         SL2Dvxib1lgOJ8FS6kZyda2byIMr2A13NrjWze5i1ilMjMdmOTBaiQ/8EASeQ1m8pSrm
         UinA==
X-Gm-Message-State: APjAAAXAAF8cbXKslxUf1ERpwNi3nPUh10U1T5hZXlD0IRKcYDbJ5vk9
        jo5h7lYMQ9faBk4Lj0XBoBoCROaFrP3a107i/sQ=
X-Google-Smtp-Source: APXvYqyedFMSI8u5j3lNvyIS2fStLMWt+XlUkCqvyNd9Py3WgwJC2Yqivg2o0N7vVu6ACAuOkCQyKkfdLUcACq2rack=
X-Received: by 2002:a17:902:9881:: with SMTP id s1mr18980345plp.18.1571558541849;
 Sun, 20 Oct 2019 01:02:21 -0700 (PDT)
MIME-Version: 1.0
References: <20191014115739.15342-1-andriy.shevchenko@linux.intel.com> <bf1a28d9-30d6-3730-ea08-c7ae2b3c8e79@redhat.com>
In-Reply-To: <bf1a28d9-30d6-3730-ea08-c7ae2b3c8e79@redhat.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Sun, 20 Oct 2019 11:02:10 +0300
Message-ID: <CAHp75VdC9=cthNgQDUxK3h9kHON5JCTbMkQn+otcrXLvHbOgbQ@mail.gmail.com>
Subject: Re: [RESEND][PATCH v1] platform/x86: i2c-multi-instantiate: Fail the
 probe if no IRQ provided
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Ammy Yi <ammy.yi@intel.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Oct 16, 2019 at 4:01 PM Hans de Goede <hdegoede@redhat.com> wrote:
> On 10/14/19 1:57 PM, Andy Shevchenko wrote:
> > For APIC case of interrupt we don't fail a ->probe() of the driver,
> > which makes kernel to print a lot of warnings from the children.

> I thought I already replied to this, but the archive disagrees. Patch
> looks good to me:
>
> Reviewed-by; Hans de Goede <hdegoede@redhat.com>

Thank you!
Sorry, it went without your Rb tag.

-- 
With Best Regards,
Andy Shevchenko
