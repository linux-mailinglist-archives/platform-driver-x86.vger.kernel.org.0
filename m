Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1D3F9254FF3
	for <lists+platform-driver-x86@lfdr.de>; Thu, 27 Aug 2020 22:20:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726266AbgH0UUU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 27 Aug 2020 16:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726120AbgH0UUT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 27 Aug 2020 16:20:19 -0400
Received: from mail-ej1-x641.google.com (mail-ej1-x641.google.com [IPv6:2a00:1450:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0548DC061264
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2020 13:20:19 -0700 (PDT)
Received: by mail-ej1-x641.google.com with SMTP id d26so9432209ejr.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2020 13:20:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mJdbXb7lKtzg07PSoJxVHersZO8RudU7Smq6g0vTttM=;
        b=FYzZW5Cd5RSujSjQPwdNgDJjjfNR7A4dRomdW7dLxRa0J1giWlmqnXVrtx5f2p+YiW
         sq2KyfVz6aB/SdQph2kP5SvVTo9qP8LoRviBbyqFIW5oMhqo6YH493ElB/Wo1MEi4sFK
         Q/jGZF4SQbMCVuWo3XPvT9g7pS0UT1VPw8LNw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mJdbXb7lKtzg07PSoJxVHersZO8RudU7Smq6g0vTttM=;
        b=YOiGz2xN7p5xN68m6L2FJiix/49jxIzq8OlJNBfoaRXDUooVSvX5bvChXBCPj0m18T
         zM78aM07VBni9YAmGCgw2LDbC+zVlwt5W1fWPtWV4ycR/ZM5s+OjKVZmYRBQJpLha7PE
         YfQ+Ie3RuEA2TypBoPpy6cK/ufTR963Gx9c0Nlptnm6ntjsHmENUmp4XMogdBTGQdl25
         ObIW5a1qPg8m4enod+YT6GRmHMcP46tZxrg8fYASVEtT/8XtNKTv6aBHhcFz7URqM8u+
         0Bd6eK6WztZn9MquEQJUnsp5JRFx8vC8CF224OpiCFTDtmL1wSm3lShoXndjopUEYYwH
         6TPw==
X-Gm-Message-State: AOAM53184WhegPJrqEipDPsMxPFtZs7TlRXQu3XunSBZU6sI/zTIrCrm
        GK7+Sfmx8SbIsLtMY45GHisK2vLyi+64vQ==
X-Google-Smtp-Source: ABdhPJxaNXRDPqu+xr9INckZed27Vhxvc9xIW1BWlv2NYdOPFAv0TwWsRUG5U5Sbr7cM+uopJ7QZCg==
X-Received: by 2002:a17:906:4356:: with SMTP id z22mr23596786ejm.414.1598559617712;
        Thu, 27 Aug 2020 13:20:17 -0700 (PDT)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id x8sm2766999ejf.6.2020.08.27.13.20.17
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Aug 2020 13:20:17 -0700 (PDT)
Received: by mail-ej1-f54.google.com with SMTP id a26so9418767ejc.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 27 Aug 2020 13:20:17 -0700 (PDT)
X-Received: by 2002:a17:906:410d:: with SMTP id j13mr22392017ejk.139.1598559616518;
 Thu, 27 Aug 2020 13:20:16 -0700 (PDT)
MIME-Version: 1.0
References: <20200827135205.1.I6981f9a9f0c12e60f8038f3b574184f8ffc1b9b5@changeid>
 <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
In-Reply-To: <CAHp75VfM-61vN_Ptz1YWz3JmRJ7eqssVykXuCircuiz9HL3TVA@mail.gmail.com>
From:   Raul Rangel <rrangel@chromium.org>
Date:   Thu, 27 Aug 2020 14:20:05 -0600
X-Gmail-Original-Message-ID: <CAHQZ30CbzL290WQ6J-sZh_pLfZFqHE1xgpaLPX+BfEJWg+7p3A@mail.gmail.com>
Message-ID: <CAHQZ30CbzL290WQ6J-sZh_pLfZFqHE1xgpaLPX+BfEJWg+7p3A@mail.gmail.com>
Subject: Re: [PATCH 1/2] Input: i8042 - Prevent intermixing i8042 commands
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     linux-input <linux-input@vger.kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        "S, Shirish" <Shirish.S@amd.com>,
        Andy Shevchenko <andy@infradead.org>,
        Dan Murphy <dmurphy@ti.com>,
        Darren Hart <dvhart@infradead.org>,
        Jacek Anaszewski <jacek.anaszewski@gmail.com>,
        "Lee, Chun-Yi" <jlee@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rajat Jain <rajatja@google.com>,
        Stephen Boyd <swboyd@chromium.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux LED Subsystem <linux-leds@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Aug 27, 2020 at 2:12 PM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
>
> On Thu, Aug 27, 2020 at 10:52 PM Raul E Rangel <rrangel@chromium.org> wrote:
> >
> > The i8042_mutex must be held by writers of the AUX and KBD ports, as
> > well as users of i8042_command. There were a lot of users of
> > i8042_command that were not calling i8042_lock_chip/i8042_unlock_chip.
> > This resulted in i8042_commands being issues in between PS/2
> > transactions.
> >
> > This change moves the mutex lock into i8042_command and removes the
> > burden of locking the mutex from the callers.
>
> Which is wrong according to your very patch. See below.
>
> > It is expected that the i8042_mutex is locked before calling
> > i8042_aux_write or i8042_kbd_write. This is currently done by the PS/2
> > layer via ps2_begin_command and ps2_end_command. Other modules
> > (serio_raw) do not currently lock the mutex, so there is still a
> > possibility for intermixed commands.
>
> ...
>
> > +       mutex_lock(&i8042_mutex);
> > +
> >         spin_lock_irqsave(&i8042_lock, flags);
> >         retval = __i8042_command(param, command);
> >         spin_unlock_irqrestore(&i8042_lock, flags);
> >
> > +        mutex_unlock(&i8042_mutex);
>
> Question 1. Why do you need mutex at all in the above situation? Spin
> lock isn't enough?

No. PS/2 transactions/commands consist of multiple calls to ps2_do_sendbyte.
So the spin lock only helps with sending an individual byte. The mutex
is for the
whole transaction. We don't want i8042_commands being sent in between a PS/2
transaction.

>
> ...
>
> > -       i8042_lock_chip();
> > -
> >         if (value == LED_OFF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_OFF);
> >         else if (value <= LED_HALF)
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_0_5HZ);
> >         else
> >                 i8042_command(NULL, CLEVO_MAIL_LED_BLINK_1HZ);
> > -
> > -       i8042_unlock_chip();
> > -
>
> Now, these three commands are not considered as a transaction (no
> atomicity). That's why your patch is wrong.

These are all mutually exclusive. So there is no change in behavior.
>
> >  }
>
> ...
>
> >         int rc;
> >
> > -       i8042_lock_chip();
> >         rc = i8042_command(&param, A1655_WIFI_COMMAND);
> > -       i8042_unlock_chip();
> >         return rc;
>
> rc become redundant.

Good catch. I'll send a v2 with it removed.

>
> --
> With Best Regards,
> Andy Shevchenko
