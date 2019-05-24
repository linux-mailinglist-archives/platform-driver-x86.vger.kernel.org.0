Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B53A429F81
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2019 22:01:26 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391726AbfEXUB0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 May 2019 16:01:26 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:38510 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391723AbfEXUB0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 May 2019 16:01:26 -0400
Received: by mail-qk1-f195.google.com with SMTP id p26so6734572qkj.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2019 13:01:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7MCwCqfjoZ8d95LiJVDhxA5XYJ+Tj0Dl3KZTdK/joyg=;
        b=QPwVNsf12m0Ku3ysuAaKBpvuJ8a3v8BLq8bmJgIiNhWhchdu4WhWI2Rexbzv1BrOv6
         vHy80gDcR04xvAP1Ui/TbWCdoaksT+uNOFkBVQpnK4esy54HDNjzBP1RSnGq9fm/uI9u
         CbqMvLYx7Tv+AwKwCjKX8gnYXnt3zY0V/pAhrQeC97pXJxyb8VyJ2nCUHwG0Oy8Sf9rg
         hkRl/ADp/emeDS5wlzE/5L/bPxWGmky3EbGtEPeRmWar30IO6KVy39x3QCfwWFMaoOmm
         tFOqNavX3JitsMfMi9ZnllGycKEgnz6qLYs+mNTJ/SQyYUON+YXSeYb/5iFBt+GXIEC1
         ekuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7MCwCqfjoZ8d95LiJVDhxA5XYJ+Tj0Dl3KZTdK/joyg=;
        b=CgSyteKM54rriOl6NwFsLa1/dmEzeQ1hQrwe29CqXtohSWsbHyu4tYINBqVbkDWfax
         nl5ogmx0NywFyzYgGFkmk+qai3jgA6fB4Dz/bEzB2GGa1iPyF9b58YwDGNo6I9/QtEw8
         tIMPy3S3ArOt2zavvZl/sjA7Zzenrnz6qCUmQIKeUA8P8JTv04IP2mp670avPxHtRED/
         1JSJB4wXLR5PpbuiQnW61a0XI/Xd9kx3J3FDT1zLyXPtazMDi2qeQXmjyVAqp5BVm7BZ
         uZ1gjN9ed8wsPMUBJmuiW9ebd6N7R6EU96R+DzSf8YWv95Pi8E0GMk9MPoZlpeA8m8ku
         txfQ==
X-Gm-Message-State: APjAAAWjFU7gsGTXrT13Hwl39L0GPiDsXN+dDLTtWDIc+27ufw6xgsdc
        b0GptC7P1on4IhgPf8e7Rk4qy1j6HOCKyDiKOgGfFA==
X-Google-Smtp-Source: APXvYqwmQ8vdr/LlrWLOpFql9wh2DV/r+PF+HEzE73QWbEFTFSebC6c4U3R9GbbX9W5aU+gRPziPL17BiM5hloLyPHI=
X-Received: by 2002:a0c:d4ee:: with SMTP id y43mr83524858qvh.26.1558728085164;
 Fri, 24 May 2019 13:01:25 -0700 (PDT)
MIME-Version: 1.0
References: <c8cdb347-e206-76b2-0d43-546ef660ffb7@gmail.com> <4613f54b-b6ba-c9ad-15ca-e43d440b9f63@gmail.com>
In-Reply-To: <4613f54b-b6ba-c9ad-15ca-e43d440b9f63@gmail.com>
From:   Daniel Drake <drake@endlessm.com>
Date:   Fri, 24 May 2019 14:01:14 -0600
Message-ID: <CAD8Lp46s0agX15gSXq_hXc2TFn9v9dfZYi7+j=HuQJdGBK2Hug@mail.gmail.com>
Subject: Re: [PATCH v4 03/13] platform/x86: asus-wmi: Increase input buffer
 size of WMI methods
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

On Tue, May 14, 2019 at 12:54 PM Yurii Pavlovskyi
<yurii.pavlovskyi@gmail.com> wrote:
>
> The asus-nb-wmi driver is matched by WMI alias but fails to load on TUF
> Gaming series laptops producing multiple ACPI errors in the kernel log.
>
> The input buffer for WMI method invocation size is 2 dwords, whereas
> 3 are expected by this model.
>
> FX505GM:
> ..
> Method (WMNB, 3, Serialized)
> {
>     P8XH (Zero, 0x11)
>     CreateDWordField (Arg2, Zero, IIA0)
>     CreateDWordField (Arg2, 0x04, IIA1)
>     CreateDWordField (Arg2, 0x08, IIA2)
>     Local0 = (Arg1 & 0xFFFFFFFF)
>     ...
>
> Compare with older K54C:
> ...
> Method (WMNB, 3, NotSerialized)
> {
>     CreateDWordField (Arg2, 0x00, IIA0)
>     CreateDWordField (Arg2, 0x04, IIA1)
>     Local0 = (Arg1 & 0xFFFFFFFF)
>     ...
>
> Increase buffer size to 3 dwords. No negative consequences of this change
> are expected, as the input buffer size is not verified. The original
> function is replaced by a wrapper for a new method passing value 0 for the
> last parameter. The new function will be used to control RGB keyboard
> backlight.
>
> Signed-off-by: Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>

Reviewed-by: Daniel Drake <drake@endlessm.com>
