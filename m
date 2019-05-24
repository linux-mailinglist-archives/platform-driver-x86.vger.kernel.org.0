Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C56DB29DFD
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2019 20:26:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727157AbfEXS05 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 24 May 2019 14:26:57 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:46261 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726071AbfEXS04 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 24 May 2019 14:26:56 -0400
Received: by mail-pg1-f194.google.com with SMTP id o11so862774pgm.13
        for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2019 11:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=l1/ARJcgHxYj3UiESO3kHPvosQmSI7Yr7/NWsKCtvSg=;
        b=D/AJMZHTDHPwgviRxPca4LOTptBlM2+yG6AsBtEIDKODOARBxec4VS7IjFYs7swKh+
         6J04/Qk94LE96ryw2bu3NBwUDzli1eQZJUkIsO1g6f0HScDUsd5XvmFWyOUCLFMgltGF
         GxFbGp9M6JYcWO6q5aqPeNlV9vDBD3jVmoGThBlRfZfpQ8AbtBAPXELyDwDa/+j5LmLx
         /33SWBhN621KRoGHzcKCL1KhwP1Fw3BQ1Z4DTLbqNmZ0JLVeZ8y/bx+0nQ0FeRjAKkqz
         bIBgc3h8FxPQ24E8wWyQ11YhAA3rY8wGbtqxsqzqxFTRmUMhc+BNPsL1YUMhU+Qey61x
         /F+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=l1/ARJcgHxYj3UiESO3kHPvosQmSI7Yr7/NWsKCtvSg=;
        b=i1Hx5orKcVKxACYp07POgOuwmyhX8sruHwY/ne2jMwu76AXGidE4P8AWOYhK+rmCLQ
         z0Uq53VaTm8dqwNkJBypFFEnFJjGTdCgwlZ/uP3zapgmDFNoKAPWIpuZ7rAg9bq3YbZu
         wSJ3olp9a6ekU6x5Lr79E9hiN11paDhg4eRyugAKnZ7+qRv4KuwXt2D2Wd9lGPthm1GS
         941pmCd5tudsPbRY7vBMpqxSgll8/qmj0p3Of2ZpFy63MkRwv+e7Tc0Q2eco14dkZM9Y
         2I5n9ajWU/9P+fgEIvmBUpr/W+ABdWKM1Ua2lvgHW48tCrkDiK1ZOi+X516Hyw8zC6qY
         mYXg==
X-Gm-Message-State: APjAAAVsrPLwLt3Yn+x7f7raXAfDhG9UouViIOFmRrG54TyTIRwyWt13
        85EDH8WOnIiuQu0H7Ok974WiBHUA4rcYOZleWpU=
X-Google-Smtp-Source: APXvYqwWZ/JECNUkZhTdZ1FHjhrgni7uCZ+r+k/XZAB56I/wuNORkx5kmn4V5oJZDNUZ99yIiIRPXT/UHVUUt7i4LEE=
X-Received: by 2002:a63:e645:: with SMTP id p5mr106690767pgj.4.1558722415955;
 Fri, 24 May 2019 11:26:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190523164152.21057-1-vadimp@mellanox.com>
In-Reply-To: <20190523164152.21057-1-vadimp@mellanox.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 24 May 2019 21:26:44 +0300
Message-ID: <CAHp75VcDk+3gZsjDRr1=K-q=ZGd44DhFhR2_XgMWQGEPRYYKiw@mail.gmail.com>
Subject: Re: [PATCH v1 platform] platform/mellanox: mlxreg-hotplug: Add
 devm_free_irq call to remove flow
To:     Vadim Pasternak <vadimp@mellanox.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, May 23, 2019 at 7:41 PM Vadim Pasternak <vadimp@mellanox.com> wrote:
>
> Add devm_free_irq() call to mlxreg-hotplug remove() for clean release
> of devices irq resource. Fix debugobjects warning triggered by rmmod
> It prevents of use-after-free memory, related to
> mlxreg_hotplug_work_handler.
>
> Issue has been reported as debugobjects warning triggered by
> 'rmmod mlxtreg-hotplug' flow, while running kernel with
> CONFIG_DEBUG_OBJECTS* options.
>
> [ 2489.623551] ODEBUG: free active (active state 0) object type: work_struct hint: mlxreg_hotplug_work_handler+0x0/0x7f0 [mlxreg_hotplug]
> [ 2489.637097] WARNING: CPU: 5 PID: 3924 at lib/debugobjects.c:328 debug_print_object+0xfe/0x180
> [ 2489.637165] RIP: 0010:debug_print_object+0xfe/0x180
> ?
> [ 2489.637214] Call Trace:
> [ 2489.637225]  __debug_check_no_obj_freed+0x25e/0x320
> [ 2489.637231]  kfree+0x82/0x110
> [ 2489.637238]  release_nodes+0x33c/0x4e0
> [ 2489.637242]  ? devres_remove_group+0x1b0/0x1b0
> [ 2489.637247]  device_release_driver_internal+0x146/0x270
> [ 2489.637251]  driver_detach+0x73/0xe0
> [ 2489.637254]  bus_remove_driver+0xa1/0x170
> [ 2489.637261]  __x64_sys_delete_module+0x29e/0x320
> [ 2489.637265]  ? __ia32_sys_delete_module+0x320/0x320
> [ 2489.637268]  ? blkcg_exit_queue+0x20/0x20
> [ 2489.637273]  ? task_work_run+0x7d/0x100
> [ 2489.637278]  ? exit_to_usermode_loop+0x5b/0xf0
> [ 2489.637281]  do_syscall_64+0x73/0x160
> [ 2489.637287]  entry_SYSCALL_64_after_hwframe+0x44/0xa9
> [ 2489.637290] RIP: 0033:0x7f95c3596fd7
>
> The difference in release flow with and with no devm_free_irq is listed
> below:
>
> bus: 'platform': remove driver mlxreg-hotplug
>  mlxreg_hotplug_remove(start)
>                                         -> devm_free_irq (with new code)
>  mlxreg_hotplug_remove (end)
>  release_nodes (start)
>   mlxreg-hotplug: DEVRES REL devm_hwmon_release (8 bytes)
>   device: 'hwmon3': device_unregister
>   PM: Removing info for No Bus:hwmon3
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (88 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (6 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (5 bytes)
>   mlxreg-hotplug: DEVRES REL devm_irq_release (16 bytes) (no new code)
>   mlxreg-hotplug: DEVRES REL devm_kzalloc_release (1376 bytes)
>    ------------[ cut here ]------------ (no new code):
>    ODEBUG: free active (active state 0) object type: work_struct hint: mlxreg_hotplug_work_handler
>
>  release_nodes(end)
> driver: 'mlxreg-hotplug': driver_release
>

Pushed to my review and testing queue, thanks!


> Fixes: 1f976f6978bf ("platform/x86: Move Mellanox platform hotplug driver to platform/mellanox")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> ---
>  drivers/platform/mellanox/mlxreg-hotplug.c | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/drivers/platform/mellanox/mlxreg-hotplug.c b/drivers/platform/mellanox/mlxreg-hotplug.c
> index 687ce6817d0d..f85a1b9d129b 100644
> --- a/drivers/platform/mellanox/mlxreg-hotplug.c
> +++ b/drivers/platform/mellanox/mlxreg-hotplug.c
> @@ -694,6 +694,7 @@ static int mlxreg_hotplug_remove(struct platform_device *pdev)
>
>         /* Clean interrupts setup. */
>         mlxreg_hotplug_unset_irq(priv);
> +       devm_free_irq(&pdev->dev, priv->irq, priv);
>
>         return 0;
>  }
> --
> 2.11.0
>


-- 
With Best Regards,
Andy Shevchenko
