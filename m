Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 673B42508B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 May 2019 15:37:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727534AbfEUNh1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 May 2019 09:37:27 -0400
Received: from mail-oi1-f196.google.com ([209.85.167.196]:42356 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727969AbfEUNh1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 May 2019 09:37:27 -0400
Received: by mail-oi1-f196.google.com with SMTP id w9so10974812oic.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 May 2019 06:37:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=H+BSjdKHMeiIAULb/QyaUOTkRt09BUDaEnpHHqHJQHo=;
        b=oYE7JAF3d5Xd55jYiP+FFNL6Ut3yy6uqIgip8mEGC8oTz1+IvRYcsGTOaUU5j8VFyi
         qlIZN4YmYuLrs5eY9gkBjWkzNagvcbXivOL+g55DksVqlPngfPyWIjsECXhDpaTdLVRa
         LltBxjxk+TjU9uoUpHMSUpwVOz7Qcw67t+Fhk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=H+BSjdKHMeiIAULb/QyaUOTkRt09BUDaEnpHHqHJQHo=;
        b=I2UkSMjbNVDK9oB6cIfpzWuJfqwkqrleAxjTb47Vd6FJHtndetmiKKWchqTMuZZBvO
         5+0mKeZSssCPEWfqNWpQIEeTgqQVpYhdLnTiARHV8jUAdM4WXUdbgTRqEON7pRHzUUtZ
         yILw1m6Kry+uw7GUCSqdwOJpf3X6jIySMKFCwIVh3euiu8r9ynFWa0g36xreGswf+lI3
         eGzk2uXt4dTi6jvmZsUitLK20e7xZW/cGhyMj+EaYb3YZOhh9pFInk2dv3mCzGQSsbuD
         xFQatZWeGphxh1FJj8hVuo44dmVlh2ZFgDsIX1XslM7OljLxdbtOjvMw70rJytDGVYI2
         Wh9w==
X-Gm-Message-State: APjAAAVIdsLEkMpaX4KxUeZcWHIjV/Gvm25pPXWncxi4wJ1qULlOqice
        0yQvBdVVwk6FOvFum2F4lQBn/6ZbRX4=
X-Google-Smtp-Source: APXvYqyNq5iJ9GZGUWDHojWueVjTncmkEpbb4+BwgrXOA+ebuy5IE1rbCMp+UmooH9zuBWjjYcMYRQ==
X-Received: by 2002:aca:3305:: with SMTP id z5mr3366201oiz.141.1558445845763;
        Tue, 21 May 2019 06:37:25 -0700 (PDT)
Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com. [209.85.210.51])
        by smtp.gmail.com with ESMTPSA id t4sm5651424otk.11.2019.05.21.06.37.24
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 21 May 2019 06:37:24 -0700 (PDT)
Received: by mail-ot1-f51.google.com with SMTP id n14so16355199otk.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 May 2019 06:37:24 -0700 (PDT)
X-Received: by 2002:a9d:58c5:: with SMTP id s5mr19522642oth.153.1558445844462;
 Tue, 21 May 2019 06:37:24 -0700 (PDT)
MIME-Version: 1.0
References: <20190520224124.153005-1-mathewk@chromium.org>
In-Reply-To: <20190520224124.153005-1-mathewk@chromium.org>
From:   Jett Rink <jettrink@chromium.org>
Date:   Tue, 21 May 2019 07:37:13 -0600
X-Gmail-Original-Message-ID: <CAK+PMK47_OE-BgOYD_TD0kwxD4RG+nS9Wstg4ydUy7yV9nVmHQ@mail.gmail.com>
Message-ID: <CAK+PMK47_OE-BgOYD_TD0kwxD4RG+nS9Wstg4ydUy7yV9nVmHQ@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: intel-vbtn: Report switch events when
 event wakes device
To:     Mathew King <mathewk@chromium.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        AceLan Kao <acelan.kao@canonical.com>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org, Mario.Limonciello@dell.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, May 20, 2019 at 4:41 PM Mathew King <mathewk@chromium.org> wrote:
>
> When a switch event, such as tablet mode/laptop mode or docked/undocked,
> wakes a device make sure that the value of the swich is reported.
> Without when a device is put in tablet mode from laptop mode when it is
> suspended or vice versa the device will wake up but mode will be
> incorrect.
>
> Tested by suspending a device in laptop mode and putting it in tablet
> mode, the device resumes and is in tablet mode. When suspending the
> device in tablet mode and putting it in laptop mode the device resumes
> and is in laptop mode.
>
> Signed-off-by: Mathew King <mathewk@chromium.org>
>
> ---
> Changes in v2:
>   - Added comment explaining why switch events are reported
>   - Format so that checkpatch is happy
> ---
>  drivers/platform/x86/intel-vbtn.c | 16 ++++++++++++++--
>  1 file changed, 14 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
> index 06cd7e818ed5..a0d0cecff55f 100644
> --- a/drivers/platform/x86/intel-vbtn.c
> +++ b/drivers/platform/x86/intel-vbtn.c
> @@ -76,12 +76,24 @@ static void notify_handler(acpi_handle handle, u32 event, void *context)
>         struct platform_device *device = context;
>         struct intel_vbtn_priv *priv = dev_get_drvdata(&device->dev);
>         unsigned int val = !(event & 1); /* Even=press, Odd=release */
> -       const struct key_entry *ke_rel;
> +       const struct key_entry *ke, *ke_rel;
>         bool autorelease;
>
>         if (priv->wakeup_mode) {
> -               if (sparse_keymap_entry_from_scancode(priv->input_dev, event)) {
> +               ke = sparse_keymap_entry_from_scancode(priv->input_dev, event);
> +               if (ke) {
>                         pm_wakeup_hard_event(&device->dev);
> +
> +                       /*
> +                        * Switch events like tablet mode will wake the device
> +                        * and report the new switch position to the input
> +                        * subsystem.
> +                        */
Thanks for adding the comment; This looks good to me.

> +                       if (ke->type == KE_SW)
> +                               sparse_keymap_report_event(priv->input_dev,
> +                                                          event,
> +                                                          val,
> +                                                          0);
>                         return;
>                 }
>                 goto out_unknown;
> --
> 2.21.0.1020.gf2820cf01a-goog
>

Reviewed-by: Jett Rink <jettrink@chromium.org>
