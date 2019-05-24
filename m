Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 7773529C79
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2019 18:46:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390507AbfEXQqC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 May 2019 12:46:02 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:33648 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390346AbfEXQqC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 May 2019 12:46:02 -0400
Received: by mail-pf1-f194.google.com with SMTP id z28so5665913pfk.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2019 09:46:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YILCn2HdjzxtD2taeZMo1HQhQd4PqPnumSn7HIw29Y0=;
        b=RTC7kcs8MM1QtGIToUSx96fhrxXnUcW1eVWSTtiGg1Gg0LBt4UL3qVL62FUSNuU4XN
         jLhA3RVQGZMhxOPDww+O2OpBNZ9hOAz0ToycQeQ5CeOeF7/9TkD1bgP0tqn7API6Gc1u
         AVMwl31cZNeMkaKF7GWzkCJmjPVfhZIGxX2KJGKhtlAoUC3PEFBFVWIlR6h4bWkOx63S
         y87OXYrXDkV5/o1KpBS6Bmfnc2eVr6K+jwU93zDf5GRJSNGXVrqzZxiqQueznw3UMYuh
         mjo62kbPkxjFG+wQKMbH+eOBQSkU9Sj73adZT8K3uh1w+OY/fX+FMNKku35rZus98Ob1
         m6ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YILCn2HdjzxtD2taeZMo1HQhQd4PqPnumSn7HIw29Y0=;
        b=JgyddnIHnsP//BUPUwtIzoDk1TXG1sv1FgnNv8Xmg9zrAZasDQnAwgF/ZshfOhHXUb
         yaqKHU3TjSOHXIcCr7CK+MUQLLd0n6V6PkfUXd480UMlL+UYaDaNNnxK1Aa2W/JnwVQs
         pjWhKAtDOs7sDYv3gDNpCrIw07d/gXFTE1w8g6f3dg5ypUkugjm1XIyF8sBa07dQn4k9
         xKxOkaC+9hApiA6n6CSSru9yPQuWE9+mIEsHSq+xU87eewIT8uHNVJ8T7sK1wttZsp0b
         8boueeB9iU3Y3KBIHj/VD0gu/6wwD3k2vGYEdMFN/Xnsfm5EKL4Btf9khKAapfbxUYNL
         qlSQ==
X-Gm-Message-State: APjAAAUIX9KYF65VCSXRZFH+aiP/TYDOq/O3hRBMIdV/MxIcf1jBUXSj
        JYLQZn1h8ov5PU7sgDUmooa51COr/ZR5+MjGD8s=
X-Google-Smtp-Source: APXvYqwY8yvbbZbdFdxeXElXBi9Mys1k5CfYAXpx4CTluMSRje1UOHttaPu0RGeFgJKIGW3RiKEbsITT2L/2QGFhk44=
X-Received: by 2002:a17:90a:80c1:: with SMTP id k1mr10570201pjw.30.1558716361826;
 Fri, 24 May 2019 09:46:01 -0700 (PDT)
MIME-Version: 1.0
References: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net> <3756fda2-7270-e3b2-fac8-3c0c0be633fa@alexanderweb.de>
In-Reply-To: <3756fda2-7270-e3b2-fac8-3c0c0be633fa@alexanderweb.de>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 May 2019 19:45:51 +0300
Message-ID: <CAHp75VfaDqCe7R2ZWTXs4j4i5v+B56Od0zVLANtMJd8-JgyUPw@mail.gmail.com>
Subject: Re: [PATCH] Add Lenovo PrivacyGuard feature found in T480s, T490, T490s
To:     Alexander Schremmer <alex@alexanderweb.de>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, May 21, 2019 at 3:56 PM Alexander Schremmer
<alex@alexanderweb.de> wrote:
> I wonder whether you have received my kernel patch, referenced below. It
> might have been caught by the spam filter.

Yes, you may always consult with patchwork [1]. If it's they, it won't be lost.

[1]: https://patchwork.kernel.org/project/platform-driver-x86/list/

-- 
With Best Regards,
Andy Shevchenko
