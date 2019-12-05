Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 615021140EF
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:42:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729099AbfLEMmW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:42:22 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:45626 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbfLEMmV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:42:21 -0500
Received: by mail-pj1-f67.google.com with SMTP id r11so1247141pjp.12
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=de1EoRO5izxdJWjKCeVzss+guPdt7ApnmnfJ/o2AUTk=;
        b=SEh7U1/kB70RZCtGQI1+S5qtUVFVS//NXnKst3LNiKFg+i1e6TUjxlbXNAbx48ypi9
         Dy5aCPHNbDNLRx3nLECiXiEv+rviUQLQkIbkYbTszbMrQbEJMOMLHWKnNzDinKlffif0
         zJ0zlLjogZe/Ca9+CEYn3tyEmyWqCpfsUE0i4nKTres+i9+TnX3luZGfF7/aZJ9g/TrX
         uNK2ZssWL49cebheZsIH4r3j9C0ibrtZvNR1w8PoWT5bTUBRzqLmo8NOWKDHSttHeLbt
         ajKcUmWW4cdDFJSEaNEkMr8BgGmAVOF5lvpqxwFhP2vg94vcU2wWFBIeEvACmJOb7WmH
         H+jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=de1EoRO5izxdJWjKCeVzss+guPdt7ApnmnfJ/o2AUTk=;
        b=NvzEiTLt7kKsimLuf2ERxAx1i+8bR6ZWFO/xKzi6zohHUjGLfI6wuMeJlcwYSpNJnl
         VRaHpeUONui/0V2p0+O4CZGTnRaFBvGuTdkQ7cHXYFsfduLAXsXpTNT0fIFsIQLj7DvC
         6Np5vFxUkLCmPvp5WpiDEgcKA+gfsKcJNKKJdQoffWWxDdpwmczfGwQsxf+2cbbKLddx
         dUVlfZr6fACB7Bfa8B168EZxHFi4sgZZqsOIaAIfwLOucre4/dUzeKn4iO1TfsHRePr5
         7IQYnleO+V5VNrd7jMAa0E48oIVwgwyluuarg7iTj4BRD9oh6mkOXdOnvD4qB7cBJioy
         D3SQ==
X-Gm-Message-State: APjAAAUEFn1XRm7OmlIRehQY7sGoPI6B+DPzTEZnaf2aVgDhg4c6rQkG
        XGy6vEi1bQogNhB8EFwXGey5zcmIt5FgDy3eYt7yUD8Z
X-Google-Smtp-Source: APXvYqz76wHLcv4HyIC8i8CVcbN8G6U4nQ7IecpFpYL1k6QXkvVtgw37lF3H03MUD/Yn3bu2qABpAC2DjnZRMhebTEY=
X-Received: by 2002:a17:902:9308:: with SMTP id bc8mr8933930plb.18.1575549741040;
 Thu, 05 Dec 2019 04:42:21 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <42c3dd11018c45d402a5112be2f3a3fb884baf5a.1575103866.git.matan@svgalib.org>
In-Reply-To: <42c3dd11018c45d402a5112be2f3a3fb884baf5a.1575103866.git.matan@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:42:11 +0200
Message-ID: <CAHp75VcKaNcG5OXu8VMMQps5KmY8UjtXvoMPP=D9KcRzD8ZbvA@mail.gmail.com>
Subject: Re: [PATCH V2 2/7] platform/x86: lg-laptop.c: Use a small buffer
 instead of a full page for sysfs
To:     Matan Ziv-Av <matan@svgalib.org>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Nov 30, 2019 at 10:53 AM Matan Ziv-Av <matan@svgalib.org> wrote:
>
> reader_mode_show() is now called from the driver itself, so only allow

Where?

> a small buffer for the boolean text.
> -       return snprintf(buffer, PAGE_SIZE, "%d\n", status);
> +       return snprintf(buffer, BUFFER_SIZE, "%d\n", status);
>  }

No, this doesn't make sense, Actually sprintf() can be used here.

--
With Best Regards,
Andy Shevchenko
