Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 54B1B1140FB
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:46:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfLEMqv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:46:51 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:44940 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729096AbfLEMqv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:46:51 -0500
Received: by mail-pj1-f67.google.com with SMTP id w5so1253243pjh.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:46:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RDx8w62r1GCpdkSSbyf/5eQaYpbHz7BmYKCZfE/GCtI=;
        b=EPKsDEK2Si5c/ihncdlRJkoDzfCPotpF+3FF+fIP5ahsUhUODbniuyyf103WySBjkh
         QnqsBGcZV8VxEzQP3fJUiP9KvsLUak12iNK9CYm0ICex9tHbgbZiLXRDXXqjnAVDvPK/
         XlcWUhEhOcHZNlTM4EdiqAesj6FmVqwbM7rai7Dbn3Ff64wGsmcw9b1I2ufTgI2MJtT7
         mNNHBD3Z+JL2HyewHZp60zgpaC5QTzmI1v/9QNZzrVO8z3pLPTG1bbdSO4tm7vGjq7Hf
         5qHtYkCoASPuvSBYxJ5B5Qr7vEm9glwn9lJ9rgBbWpB2xHz8mkieaXmaxJKYM11M7rfu
         M89A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RDx8w62r1GCpdkSSbyf/5eQaYpbHz7BmYKCZfE/GCtI=;
        b=OZBNTxjA0JpMZOZwFYTLv0V8u7ANIccXEZEsn6NUSBz9hdl3h1uUB8QHdFHhmiibIB
         zMt/Txa+kynyj3e/B8KYzVfB/ZbBPIaBBprJeXC4PIwyUrg4THjcMmkHQ/B/Qsz4BzDW
         q2jVnaSlVgSdsDj+jBFDS/PV9MFc9Dfbo1eKY2RbKBhh4mVnyQk2f+/ooQ83UIiQCgkU
         FJp3a06fAZ11D+MJs/zNk9JcbZkATuF0dPhRLs8pvjWrTOam28o+V0Qr+MxfpWddhHAN
         ynYxds3G2/2d8J77035C+77JAg5bDLJ1qKQ7QgPSS9t3qqe3R6Oe9YESyK3sBg/axDjS
         zP6w==
X-Gm-Message-State: APjAAAXQPtk7HBv5yb5VOGqAnWPbH399+lsdhyy0iG4+ThjwZDCNwKU0
        PdJOXNDTQ455EL4OsAgEK0vPU8wuq6Ms6rreUCg=
X-Google-Smtp-Source: APXvYqwDPZrSJNg/06VYw/NXy3nuxBeGnopfX6uvi1KARYXnY3yKAZzfDgTVUPNyg+2WgGWUP72xFvjUV/9bhBNEhfI=
X-Received: by 2002:a17:90a:b10b:: with SMTP id z11mr9353374pjq.132.1575550010934;
 Thu, 05 Dec 2019 04:46:50 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <f13d1bfa52cc76a134c7616b1416aab426f8b99c.1575103866.git.matan@svgalib.org>
In-Reply-To: <f13d1bfa52cc76a134c7616b1416aab426f8b99c.1575103866.git.matan@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:46:41 +0200
Message-ID: <CAHp75Veg_S2p-nSBYUUoGxiO4Ta070cVFrb9+CaHDvL4WM3_ew@mail.gmail.com>
Subject: Re: [PATCH V2 6/7] platform/x86: lg-laptop.c: Expose reader mode as a
 LED, rather than a sysfs file for 2018 and newer models
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
> On 2018 and newer models, setting reader mode does not change display
> Gamma, so treat reader mode as a LED, instead of a switch.

> +static void reader_mode_led_set(struct led_classdev *cdev,
> +                               enum led_brightness brightness)
> +{
> +       reader_mode_store(NULL, NULL, brightness == LED_OFF ? "0" : "1", 1);
> +}
> +
> +static enum led_brightness reader_mode_led_get(struct led_classdev *cdev)
> +{
> +       char buf[BUFFER_SIZE];
> +
> +       reader_mode_show(NULL, NULL, buf);
> +       return buf[0] != '0';
> +}

Ah, I see not. No, this is abusing the API. Please, don't do like this.
If you need a common code, split it out to a helper function(s) and
re-use in both.

>         if (inited & INIT_TPAD_LED)
>                 led_classdev_unregister(&tpad_led);
>
> +       if (inited & INIT_RDMODE_LED)
> +               led_classdev_unregister(&reader_mode_led);

LED framework is protected against NULL or ERR pointer values in the
device, so this and actually above check are not needed anymore.

See the commit 1dbb9fb4082c for the details.

-- 
With Best Regards,
Andy Shevchenko
