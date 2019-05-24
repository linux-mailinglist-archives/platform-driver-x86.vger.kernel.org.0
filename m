Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id EF90929F78
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2019 21:58:07 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391724AbfEXT6C (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 May 2019 15:58:02 -0400
Received: from mail-qk1-f196.google.com ([209.85.222.196]:33916 "EHLO
        mail-qk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391669AbfEXT6C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 May 2019 15:58:02 -0400
Received: by mail-qk1-f196.google.com with SMTP id t64so9079001qkh.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2019 12:58:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RfJ7Wmu+isnYJEI0NneC1wcTrVYA9eunxNNo2wKm6wc=;
        b=WkfMoLBXlXaD8fN+Z7zVQLMt0cNkLBAr6nPCu0BzVrAL6KLcuTRZxhzhj3Rw0r9aPe
         6scipkf0Hh2C0ICehiVOm5O1NExP1/GNZCJjUMAhD3eAsBxl0MoohZ+wTpPxYPng6VkU
         9ZgOLZbTGSv4gT320oeYwbGJP6w1WPYs8PE4Kqv1dnlB/yf3UtAVXSHn7OAYsVx7cmxp
         rT6io7BGKgFgGtZIR+pKfJuQ2/N7hmMBqFHYLwxTK+ZK0mIRk4YrctauDi2RFZXIvRls
         mV6lR+WDOOGQ9LDe+vr2xq4ONJ7TgNRpzvJS2+7+x+H8XUpN11C7rzzK4ElDPHM5V2tX
         hPhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RfJ7Wmu+isnYJEI0NneC1wcTrVYA9eunxNNo2wKm6wc=;
        b=AWkwEYDqu0CInJPloeYllWV6dcNjb3EsfSLt7/2tmk//DlkMI86m9BaLKK72FOxoN/
         J7j8DDXiUS4rFk+yTRk37AaDcnlXg42JnA/hykUbYyc+R1mgZpzGwV7Mi8tCKPe9pRH9
         2V5wmxVo3xyS754JxwcnbU+La7eVFS0kMnXXiqETxLCkM34z24GSJQSQuPK2zLDUL4fL
         neaTZggKaWSafVuwsm+SmtdEX8KG+ML0i9Joum1lafL1Wz2ZPBm+56VSfFCbMrcndobN
         IWzQWdnzW5tYGHkVEYj0dxlBQc5ZPYRaHAGqU2CZabP5oD4IY+WfOzc7XNAFlm0ryTKd
         HLLQ==
X-Gm-Message-State: APjAAAX0pqG7Hi76kGd0SNYk4FxLmuyqCHANpKJfyVXTo8c1ohNc46wf
        Povqd/c0kYDnzgovAr0sP3wYvohiLm/9lhfFGpQRmHZQ
X-Google-Smtp-Source: APXvYqxQyrFf0F8YAYWWEOD6q14fdkQ741Geyi3ajDMrBap8GX4q0wCbDoN3ZSd/Pt5Qh3urWtsKZNrUeN8cveM5JYw=
X-Received: by 2002:a37:9ac7:: with SMTP id c190mr70006657qke.300.1558727881655;
 Fri, 24 May 2019 12:58:01 -0700 (PDT)
MIME-Version: 1.0
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <40403d07-293a-62a1-e0e9-ad6a2ba84844@gmail.com>
In-Reply-To: <40403d07-293a-62a1-e0e9-ad6a2ba84844@gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Fri, 24 May 2019 13:57:50 -0600
Message-ID: <CAD8Lp44PeLhTb=g3zz9mfOZpco8ybDqcKDVD6ZmJZL+D_+3X7Q@mail.gmail.com>
Subject: Re: [PATCH v4 02/13] platform/x86: asus-wmi: Fix preserving keyboard
 backlight intensity on load
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

On Tue, May 14, 2019 at 12:51 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The error code and return value are mixed up. The intensity is always set
> to 0 on load as kbd_led_read returns either 0 or negative value. To
> reproduce set backlight to maximum, reload driver and try to increase it
> using keyboard hotkey, the intensity will drop as a result. Correct the
> implementation.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
