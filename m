Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 87AC91140EA
	for <lists+platform-driver-x86@lfdr.de>; Thu,  5 Dec 2019 13:40:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729109AbfLEMkY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 5 Dec 2019 07:40:24 -0500
Received: from mail-pj1-f67.google.com ([209.85.216.67]:41306 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729099AbfLEMkY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 5 Dec 2019 07:40:24 -0500
Received: by mail-pj1-f67.google.com with SMTP id ca19so1253243pjb.8
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Dec 2019 04:40:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bNP2lOx/Z5/3LjBCkXtf2SLVjmnV7gS1nEHTW/kLoTU=;
        b=E7JB/dPfnVgPowY35rAqCRrXz38PYFILcl2G9/iDU2IX/VncqzqLd3tpOQn6facPSq
         ha0r3pbQdLVu3VuGh7QI0sMpf/cKLd6/6B1MkWdVKVQk74uSA48JArmgpmpukuozwp0o
         2XkgFu3G+4HcFJQbiFwTrUI4d1kJ+jSt5OJfEYOFtCUDmAmhnT7bobl03hdNx23yyhcM
         xYJG2S0zB8tSilbLfutgRanvGbs9P3Qu0ZPwBtCmmXM6o3wcel3jmWWwmX5g4zYvqezL
         W8XDXqIRYZIh995MC5n2eGAVA9SEyki1Hf8BDHGHwtLT27zb1MdUhkmn3xrGV0JBUya7
         vNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bNP2lOx/Z5/3LjBCkXtf2SLVjmnV7gS1nEHTW/kLoTU=;
        b=WIBv0rWL1aYfH2wJRZ3hAkFOVDR7UbJ0jxhpORYjIeZHQwf2igpgyxfoX509Fc5Am2
         cTX9AeDAXeW54xcwibDD5CpPFZPHR19HNqweMvyQe40uHT+D4cTdEY0KBWOSvecaKUFW
         fMo1vSclwncZFvIyu4tVAxlovvMjMwDepaM7diOeCaIEIQWXtm9uwkMvj9+wk+FEpUpG
         iQzo0wizFB9KW9xHt1nj4LAbpCKq2KX/SWU3zHLAbWKxqfIo220Em6E9hQAN/giF/3vd
         7TcA/VnX3XUX20KOwg412QOzG3fGYkGP7Y6UzleBIrg5o/5kRu3AiupXAY76lM9Li1Oq
         Gjgw==
X-Gm-Message-State: APjAAAXKYojjPpV5AXTbRJ7Qs5LbyrDRXcD1nkdrc92/vfhF7dFJ3Ikk
        pFO85jTQ7jEQiPiMVq8EUoT7nvop2ktlqjuT2zwwAsBHEJY=
X-Google-Smtp-Source: APXvYqx9Rs2iZL1eMm6tOYuXYzkdC85BlRR0vQRcVcfOWh6IIiBe6HobmUE1IUZIMcpSlhoMnsECUyvsFNTa2kLe66o=
X-Received: by 2002:a17:90b:3109:: with SMTP id gc9mr9110514pjb.30.1575549623963;
 Thu, 05 Dec 2019 04:40:23 -0800 (PST)
MIME-Version: 1.0
References: <cover.1575103866.git.matan@svgalib.org> <f13d1bfa52cc76a134c7616b1416aab426f8b99c.1575103866.git.matan@svgalib.org>
In-Reply-To: <f13d1bfa52cc76a134c7616b1416aab426f8b99c.1575103866.git.matan@svgalib.org>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 5 Dec 2019 14:40:14 +0200
Message-ID: <CAHp75VeWhnOa=tP65DsizXF1W4_8yYyEZ1yw2EEXjFQDBX3MyA@mail.gmail.com>
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

>  static struct attribute *dev_attributes[] = {
>         &dev_attr_fan_mode.attr,
>         &dev_attr_usb_charge.attr,
> -       &dev_attr_reader_mode.attr,
>         &dev_attr_fn_lock.attr,
>         &dev_attr_battery_care_limit.attr,
> +       &dev_attr_reader_mode.attr, // This is last, to be easily removed
>         NULL
>  };

Can't you simple add it at run-time?

> +       if (year >= 2018)
> +               dev_attributes[4] = NULL; // Remove reader mode special file.
> +

I don't like this code. It's fragile against changes and makes
maintenance harder.
See acpi_tad_probe() for example how it's done.

-- 
With Best Regards,
Andy Shevchenko
