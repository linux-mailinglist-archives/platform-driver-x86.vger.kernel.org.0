Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2BA9D172C5
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 May 2019 09:42:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727016AbfEHHmv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 May 2019 03:42:51 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:42314 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726628AbfEHHmv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 May 2019 03:42:51 -0400
Received: by mail-pf1-f194.google.com with SMTP id 13so9743724pfw.9
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 May 2019 00:42:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=alt2cu7/XBV8/705DHAhcCIT3nnvxdHw37CLiuD4dEE=;
        b=iP2kmRTdh7CgTfjYSiQCnScCDM41UnnDIcAI51qO9o6sADOcn370cCXLhCZ3pdkFpr
         +kPyH53ycD9Zf2/wj2UnsLHthmOm3JLMha61D8EM2OJYbVRP4+lhvvIJ27rlqD0QXqYz
         IbtJW54OuF8hR1i+tdUxmvGdMdx436kL+ixkX431CRcr9L3mZomAKcnD23SHpJGOx2Rj
         07xKvrSM10ZIyzo8onb6y+aMAuTS1zMl06IxlMihWRpbUvRu9lPg/VrAJ9wvM2mhI0YD
         iizgu1GYKn52w7Xc1CcueKtaCQtdfkIgfznaASnaoNs9QY1bMOP8OSjp5HrulDN+ILik
         O7Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=alt2cu7/XBV8/705DHAhcCIT3nnvxdHw37CLiuD4dEE=;
        b=fAEerS8wx0T225Wg3VHmDxsJOYcFIeClLu744wsB8oCDiRDP8y+B4XlILbnY10aDBH
         LyM53QYPX2Zuxst4T+IUA6yR0EnwIRNKOKkLn8eDJoXQmac6b0Mua3kOwztHtidBUqx7
         yG3p5NqWrYsDQgRXNYM17Id9WexnsFIxHDBAr97l5by92voPnx9FNTFmvyJuGhbOuVK6
         mHZwOEouzKPTEIy6iDA7pUdcw1+5cK+Km5A6znd9Yrt92z9QcKBP6Ige2DgtjfqRTIlP
         6aoe2luN/OkgrMAcsXHsKDSbHWwG9j6J8AGVQpSdCiu0yMO+8D0LBcmoSP4SK63osX+7
         zSLQ==
X-Gm-Message-State: APjAAAWmZj4f3IT8I5yYMIdNs/rBUbJE0hFQFxDI4QfJOvb7VQWwcD9P
        5b/fdR7VA5zUW2HUP+ACQa9JlSiEAoKGYXvaZN2P1J/I
X-Google-Smtp-Source: APXvYqw0G/4JoAlDf8XcEmLzY7Fy/Iu4WCSeXOvqOLO+FlmE2wnRDvKgBdEnCiRgQDhFsn5NgCpHPmeZWSvisu4A5wA=
X-Received: by 2002:a63:dd58:: with SMTP id g24mr44779234pgj.161.1557301370529;
 Wed, 08 May 2019 00:42:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190508032829.GA5413@hjy-HP-Notebook>
In-Reply-To: <20190508032829.GA5413@hjy-HP-Notebook>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 8 May 2019 10:42:38 +0300
Message-ID: <CAHp75Vcr+oBjjEXYO4yBCO9JrhSg8XyZtCE_KDmQx392kd24ew@mail.gmail.com>
Subject: Re: [PATCH] fix double fetch in wmi_ioctl.
To:     houjingyi <houjingyi647@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, May 8, 2019 at 6:28 AM houjingyi <houjingyi647@gmail.com> wrote:
>
> There is a double fetch problem in function wmi_ioctl.
> After second fetch overwrite the length to avoid this.
>

Thanks for the patch.

First of all, don't forget to include mailing list into Cc.
Second, I think I already commented on change like this that there is
no issue with that. Otherwise, elaborate in the commit message what
exactly the issue is.

> Signed-off-by: houjingyi <houjingyi647@gmail.com>

...and use your real name here.

> ---
>  drivers/platform/x86/wmi.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index 7b26b6ccf1a0..628b9730b4d7 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -823,6 +823,7 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>         struct wmi_ioctl_buffer *buf = NULL;
>         struct wmi_driver *wdriver = NULL;
>         int ret;
> +       __u64 length;
>
>         if (_IOC_TYPE(cmd) != WMI_IOC)
>                 return -ENOTTY;
> @@ -833,24 +834,24 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>
>         mutex_lock(&wblock->char_mutex);
>         buf = wblock->handler_data;
> -       if (get_user(buf->length, &input->length)) {
> +       if (get_user(length, &input->length)) {
>                 dev_dbg(&wblock->dev.dev, "Read length from user failed\n");
>                 ret = -EFAULT;
>                 goto out_ioctl;
>         }
>         /* if it's too small, abort */
> -       if (buf->length < wblock->req_buf_size) {
> +       if (length < wblock->req_buf_size) {
>                 dev_err(&wblock->dev.dev,
>                         "Buffer %lld too small, need at least %lld\n",
> -                       buf->length, wblock->req_buf_size);
> +                       length, wblock->req_buf_size);
>                 ret = -EINVAL;
>                 goto out_ioctl;
>         }
>         /* if it's too big, warn, driver will only use what is needed */
> -       if (buf->length > wblock->req_buf_size)
> +       if (length > wblock->req_buf_size)
>                 dev_warn(&wblock->dev.dev,
>                         "Buffer %lld is bigger than required %lld\n",
> -                       buf->length, wblock->req_buf_size);
> +                       length, wblock->req_buf_size);
>
>         /* copy the structure from userspace */
>         if (copy_from_user(buf, input, wblock->req_buf_size)) {
> @@ -860,6 +861,9 @@ static long wmi_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
>                 goto out_ioctl;
>         }
>
> +       /* Override length in case it is changed between two userspace fetches */
> +       buf->length = length;
> +
>         /* let the driver do any filtering and do the call */
>         wdriver = container_of(wblock->dev.dev.driver,
>                                struct wmi_driver, driver);
> --
> 2.20.1
>


-- 
With Best Regards,
Andy Shevchenko
