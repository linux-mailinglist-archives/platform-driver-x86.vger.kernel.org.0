Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4CF53147B1
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 May 2019 11:35:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725883AbfEFJfm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 6 May 2019 05:35:42 -0400
Received: from mail-pg1-f196.google.com ([209.85.215.196]:46513 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbfEFJfm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 6 May 2019 05:35:42 -0400
Received: by mail-pg1-f196.google.com with SMTP id t187so2059988pgb.13
        for <platform-driver-x86@vger.kernel.org>; Mon, 06 May 2019 02:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=IlMJJ3+cpdMj3EMoZ5YDRABxSoCWEJQLwYya5Gz5Gok=;
        b=FyWXW5LXs0U+IUmXqXrojl2FaZHd7dYR+1GE/0AZM1wVf4NiRdabJqvqZVjaavZAmq
         hoA9MVd1PA3W6vG+aLvrWS4O4iY6eo1yYcn+Y9Hd4WWNfhjh1pARQ/WEOZbTzSl33ME8
         iKxDMBXc7qjy04bk5aYbJtlf7NytIU48+QqNZJeIRVAydcv4p8Sw/RN8ZcCEyT2wI54Y
         NwBk++zLirGZxZb49AvNmRrlegWN/GT3N8mX5r4l9/i5rLvDZTc57ANfSaUBrcBPcv8I
         7Z2b0xmn76555O1G9RvVPeQvk/mHIFKzbGKY+tSolDy9yy1OIXQ+zIXdNM6Ems9zoMsu
         Y7gQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IlMJJ3+cpdMj3EMoZ5YDRABxSoCWEJQLwYya5Gz5Gok=;
        b=UF314rg6weXTP08hCF7GSPxIZqM1qQ2EoOLIulVPVw/RdwcIwtcVJ5fPm+suDxbLNu
         meVdlqd4Hvr8DjLlzqbS06/V4g2gB1FrILPUva4CN+UX5eWasqL3ruvq8qCI8dl0wgi9
         I0dnV0Mo+BnBIpqno1TIlNAtYl7YTGIkQfSX2X0o6u8EJ6eDqkvFYNFfXfgfMwB1s4GQ
         UfYzugVUCqKE45unlksJwVfAqU4P5RxKkq5jEdmLnjGQl+kNwF9Uwb94wnzYKoNdiDt9
         t9hq0IeSKmQBQjdPYj2zG/hlTAL/h2/g8SzDm0QOhuI9AXOL4Nb4hzWf2EV/z78OT91J
         E+MA==
X-Gm-Message-State: APjAAAUztYYPkadL+ZsiZL5nw8KGpPKE7xxj15BkfESUml27CwEH5g1O
        TU7Swdbse6L8B/nZMO8+Yzfl8zHqB5KP/x0qqIE=
X-Google-Smtp-Source: APXvYqwKrmnm4rg+tMu9cEaXGVnTTDKWD9pqHNRTFgzORDCLaPURwJ757ITZE09+ezcs6Xxv+byovL43aNZgHxFkQdk=
X-Received: by 2002:a63:5443:: with SMTP id e3mr30606771pgm.265.1557135341791;
 Mon, 06 May 2019 02:35:41 -0700 (PDT)
MIME-Version: 1.0
References: <20190318105823.2821-1-vadimp@mellanox.com>
In-Reply-To: <20190318105823.2821-1-vadimp@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Mon, 6 May 2019 12:35:30 +0300
Message-ID: <CAHp75Vfz+aXzgMX0=fMGFR8a4OxoUTFn9vCg=0qxbF7YHDG=9w@mail.gmail.com>
Subject: Re: [PATCH v1 platform-next 0/2] platform/x86: Mellanox: add new features
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        michealsh@mellanox.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 18, 2019 at 12:58 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> This patchset:
> - Adds support for tachometer speed capability register.
> - Adds support for Mellanox watchdog driver activation.
>

Pushed to my review and testing queue, thanks!

I have added one patch on top, please, check if it's okay with you.

> Vadim Pasternak (2):
>   platform/x86: mlx-platform: Add support for tachometer speed register
>   platform/x86: mlx-platform: Add mlx-wdt platform driver activation
>
>  drivers/platform/x86/mlx-platform.c | 232 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 230 insertions(+), 2 deletions(-)
>
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
