Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 909621BCE7D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Apr 2020 23:18:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726344AbgD1VSi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 28 Apr 2020 17:18:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726307AbgD1VSi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 28 Apr 2020 17:18:38 -0400
Received: from mail-lj1-x241.google.com (mail-lj1-x241.google.com [IPv6:2a00:1450:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC1ECC03C1AC
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2020 14:18:36 -0700 (PDT)
Received: by mail-lj1-x241.google.com with SMTP id h4so277813ljg.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 28 Apr 2020 14:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=DH3lbVdHca92rSuBZkBtWHIkQSjQBDDZMjTnCWaOG5I=;
        b=aGCan7OpFSrUJU4yfEnYLDl0CYDjk0ViNnBlLcJU4hvN2oxxkefuOfMRsbrxQSuFF1
         sxd+4UQtfRt5YNlrz8h6f4EwuhK6M2gXAfVsMg3ogBWaJR0pe+Nf3KCPxZRru9OzVvm/
         i7bp1WxOjlWQdgMhMMqPkS8YG5NyxG2H9YSOdV0Doxm34G2OAgKvkIL+oVls0/5bDBaw
         s8uY9nDKJcNe7WSf6uIqP0i4p0i/pCaxTWznLFQwXS9yu7YamU2jDqaPu62kGvcKwj++
         TuRRMIbiEptTT3NOHE0fFLVhRLhRwPECprBuExk1Bd+tr4KLJpVDN1UaUgceUaomchmg
         1p/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=DH3lbVdHca92rSuBZkBtWHIkQSjQBDDZMjTnCWaOG5I=;
        b=P/3phwyPTztvwlLF5qD4YE3EcgJ/2OePCOZUgN1hfccdN1ykkLH26FBXItkPC7lMVu
         QckE26wE0z45L7jE6TTMNhntJftNsNZ9oV5GliH0Hj+Lt5kb0bUgmK78BcZVqv+8+2vF
         MmZW/QGmkqolienhZy0T7dAuH/TRpM+c/LSIuB8GvxzFRV7aXmfCI7q5Lgd9K03QH+J5
         WS/YTEgUplfpkBH/OviNFcL4HipccZg2Wn2hvqkazulv7Wec5EQnc9A6bKym94NRfqpp
         lJAye/BDXrbaqKXm9dCTQ4d3IXkLEwgj2Ai56aEQ7m1/Eg8VHLG1qJtDw10dfVHPxpre
         Aa/Q==
X-Gm-Message-State: AGi0PubHZkRFD11PFGRZ1EFEO6J/q74SDvru/tMbnMIxpt0NvUV6hdsC
        K9ELclRsCIxt0E0ddjcI4c+0ut7bB16Oik4fvw==
X-Google-Smtp-Source: APiQypJqJIDbS3OAV/PUigRxko9bAdoMGaTfmn/8zXAbv9RdUr8pF0rp9dFK+KFfW/mAhtjMiKAKWZ0rHJPERFa+P7I=
X-Received: by 2002:a2e:99cc:: with SMTP id l12mr19286755ljj.290.1588108715186;
 Tue, 28 Apr 2020 14:18:35 -0700 (PDT)
MIME-Version: 1.0
References: <20200423165457.54388-1-larsh@apache.org> <20200423215709.72993-1-larsh@apache.org>
 <11041815.WYjWQN8m1R@lenovodario>
In-Reply-To: <11041815.WYjWQN8m1R@lenovodario>
From:   civic9 <civic9@gmail.com>
Date:   Tue, 28 Apr 2020 23:18:24 +0200
Message-ID: <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
To:     Dario Messina <nanodario@gmail.com>
Cc:     Lars <larsh@apache.org>, agk@godking.net, kjslag@gmail.com,
        bastidoerner@gmail.com, ibm-acpi-devel@lists.sourceforge.net,
        ibm-acpi@hmh.eng.br, platform-driver-x86@vger.kernel.org,
        sassmann@kpanic.de, arc@osknowledge.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

pon., 27 kwi 2020 o 20:41 Dario Messina <nanodario@gmail.com> napisa=C5=82(=
a):
>
> On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh@apache.org> wrote:
> > This adds dual fan control for the following models:
> > P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
> >
> > Both fans are controlled together as if they were a single fan.
> > [...]
> > Background:
> > I tested the BIOS default behavior on my X1E gen2 and both fans are alw=
ays
> > changed together. So rather than adding controls for each fan, this con=
trols
> > both fans together as the BIOS would do.
> Hi Lars, why have you chosen to control multiple fans in this way?
> I know that BIOS controls both fans together, but the EC has the capabili=
ties
> to control both fans independently, so maybe it can be convenient to expo=
se
> this feature.

+1
Previous version of the patch [1] allows to control both fans independently=
.
However some software like thinkfan is not ready to control two fans.
But I also think this feature should be at least optionally exposed.

[1] https://github.com/civic9/thinkpad_acpi.2ndfan.patch/blob/master/thinkp=
ad_acpi.2ndfan.patch/thinkpad_acpi.2ndfan.patch
