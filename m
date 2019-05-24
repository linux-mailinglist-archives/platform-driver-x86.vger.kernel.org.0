Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3D73429F6C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2019 21:54:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391715AbfEXTy4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 May 2019 15:54:56 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:43219 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391612AbfEXTy4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 May 2019 15:54:56 -0400
Received: by mail-qk1-f196.google.com with SMTP id z6so9230635qkl.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2019 12:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xt54DDre1TnEzFOMPDPIB0ZqDFDYOYSsZfmW1xx+YWQ=;
        b=mK/rlgCHAU31Ndy2/TknRICETkuDWRLiMDV9Ep2/UJnYqsLhT0+uhK5DQn2MjbacoA
         UtiSL81Y223VZ6hhlz7ZAYZwMZGNX4FAZAS3sZCi79fa/aqx+afEspIN8tBtToMwLpTG
         LvCmWMXmX5LwkMDAbCTY06fFTq4oiMdL4RDL+Ps5Ue+gI1cfOUjDMsIDc0Gptly9jdpl
         kIfzx+J9WwBJziJN+BTwFqTpoFKVpN6upMG7aSCuQLlMyscTSWU5if+RVptV9/uRtsGH
         Bl+ipk0QHHOZ0PFSEiHZ1P4IHxDGEcwlHB9F3JHxEygIOdGg9zASrzNFFvQDVt/GPfP9
         zj9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xt54DDre1TnEzFOMPDPIB0ZqDFDYOYSsZfmW1xx+YWQ=;
        b=paejKLH0CobdCCq53IHwRnWVJSFQe2WYx+Fu6OcDo9K8ifpw6JmGT7pl5+kwpGWSIc
         YeTS34ki1A/j7BgubqW604JlFTuVTcoEaDpqnpnoCBzCZlcxdKj93uzEAdsRzHacjXuZ
         VhlubF5rcW3BUVCY/1eh1RHRHabJmQ3IrVz+p37Ki31qTF7KSmYZaWePX6uaHmuoxfH3
         Z3IYbgaHYaxHG0peUm1T1KRTrTxfa2Z/yKujagfmOWXv6EYpQPOM1rAYoxRBffIAJSpm
         13xh/SrlJ1++M+q94OUAtr2xWVjiU7ixOUCz3WED4fRcxpaNuWYuj+Qua6ZXs3wcRY48
         YRWw==
X-Gm-Message-State: APjAAAXDRYU3zukrrqbWeIB3ie2dp7KICgp+sbVohoDikxeALBcgoWXo
        TrfYPcnIRhAC7/Buxg63WBlnEzUVf2gMQeh7LOIg1w==
X-Google-Smtp-Source: APXvYqyo8T2pI3L/tSaJN/dd+mXtWpM0a0rQ1acXLdl3BAB2msIrdC2JhDoRUg14bZemZDHN0lW9N0Qjfgk274/XaX0=
X-Received: by 2002:a0c:d4ee:: with SMTP id y43mr83514431qvh.26.1558727695449;
 Fri, 24 May 2019 12:54:55 -0700 (PDT)
MIME-Version: 1.0
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <e0f78773-518b-b62d-3d95-12225724ea5f@gmail.com>
In-Reply-To: <e0f78773-518b-b62d-3d95-12225724ea5f@gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Fri, 24 May 2019 13:54:44 -0600
Message-ID: <CAD8Lp45namPGpKjcBMo8ivQjzBdsVNM4_sThSaaXxGH=NrSRVQ@mail.gmail.com>
Subject: Re: [PATCH v4 01/13] platform/x86: asus-wmi: Fix hwmon device cleanup
To:     Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Chris Chiu <chiu@endlessm.com>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 14, 2019 at 12:50 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The driver does not clean up the hwmon device on exit or error. To
> reproduce the bug, repeat rmmod, insmod to verify that device number
> /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?? grows every time. Replace
> call for registering device with devm_* version that unregisters it
> automatically.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
