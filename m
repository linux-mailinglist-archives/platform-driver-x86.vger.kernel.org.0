Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 4DBA9356FB1
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 Apr 2021 17:03:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345043AbhDGPDN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Apr 2021 11:03:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55518 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239509AbhDGPDL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Apr 2021 11:03:11 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9900C061756;
        Wed,  7 Apr 2021 08:03:00 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id e12so5279980wro.11;
        Wed, 07 Apr 2021 08:03:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+Dd4tF0J8mnaZXxIAb/IBoNUv1r5Y5oY1KaV/UKGqtY=;
        b=mirFRIfb3SJEORaFHiWSXKgsNHpDD9oFsoY10TI10lxygv42yqmK3+vmYVytla2Ma7
         Ijq816Nv/ESBaDwVmneP9snkINgeVRotROtFUPqzt4hrHYgzCIIf2G/FZwYszecwy7RH
         sbuLFmf2NlUl8DoxGkFNqSMmj4cIaHVNYJEd96MHaq5/+CO6dMWJqCX8WiKpbvc1mxvS
         2s9aDQzBdKVcWjbvdwPspb2QEjnIQcqpLThyWR5dK/etOYM5uiDXQxbA3fUz3LZMzLED
         D1G4XFmG3hwue4e7syxKbnDAl4ZHnyui01YnSzk66vlt18D9SlHEP6fGmkTw2xwqu8ik
         B7Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+Dd4tF0J8mnaZXxIAb/IBoNUv1r5Y5oY1KaV/UKGqtY=;
        b=XPPnuhqycNyJ0DCUplUYwOXqMKvwPGTia1pul1Aba/jk2tOz/see4YdNvNlrszcyX5
         Kcikkeq3m1xFf7fzocZCavjxk+Cyp3mf+twFZzikrDvvomfxmpTtxAr/AeTyXPYTKYFN
         jde+hVFEdQ0B3qGqx6OSSn1Y6cBPswGdKi1hRSviRFRf2acX1wDi1CjWR37yf2Z2jSVJ
         bPbwd1r4dXXPXljfxk5WJWKxAUvmxX5DpZk0YAdIAqY9r09XLkDiDEzC0/xqC5eeCQ6o
         jZ+G3eqOj1ttaEtae8MmVZkLW9HoGANmGgpLGiAAUjpoAs/0ZO7MorZ1+n4dWRhaMPJy
         iPtw==
X-Gm-Message-State: AOAM533NkULhVT0mirnoPQiRtkI52yAxEXwjiTnLUI0/BcdWzS4GB9dG
        jykDQXgk7X82jJqjYfCIbhivKp10dzlxAyHSux94f0hORxq1FQ==
X-Google-Smtp-Source: ABdhPJw4nJTK1uBiwYk5+aBQXt2TXJJ4y6DuzL5fJ5WfO5zPd1QKM7NjiDgJyv+Mtcl3aOsMnMg4RxOGJKjcJUn2iuo=
X-Received: by 2002:adf:a3d4:: with SMTP id m20mr3684046wrb.326.1617807779324;
 Wed, 07 Apr 2021 08:02:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210401030558.2301621-1-david.e.box@linux.intel.com> <20210401030558.2301621-3-david.e.box@linux.intel.com>
In-Reply-To: <20210401030558.2301621-3-david.e.box@linux.intel.com>
From:   Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>
Date:   Wed, 7 Apr 2021 11:02:33 -0400
Message-ID: <CAE2upjQ9FZk0quVxm2_4r3AY7GPSgroX=ErSixz3y_JqkWXgcg@mail.gmail.com>
Subject: Re: [PATCH 2/9] platform/x86: intel_pmc_core: Remove global struct pmc_dev
To:     "David E. Box" <david.e.box@linux.intel.com>
Cc:     hdegoede@redhat.com, mgross@linux.intel.com,
        gayatri.kammela@intel.com, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Reviewed-by: Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>

On Wed, Mar 31, 2021 at 11:06 PM David E. Box
<david.e.box@linux.intel.com> wrote:
>
> The intel_pmc_core driver did not always bind to a device which meant it
> lacked a struct device that could be used to maintain driver data. So a
> global instance of struct pmc_dev was used for this purpose and functions
> accessed this directly. Since the driver now binds to an ACPI device,
> remove the global pmc_dev in favor of one that is allocated during probe.
> Modify users of the global to obtain the object by argument instead.
>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>  drivers/platform/x86/intel_pmc_core.c | 41 ++++++++++++++-------------
>  1 file changed, 21 insertions(+), 20 deletions(-)
>
> diff --git a/drivers/platform/x86/intel_pmc_core.c b/drivers/platform/x86/intel_pmc_core.c
> index 260d49dca1ad..5ca40fe3da59 100644
> --- a/drivers/platform/x86/intel_pmc_core.c
> +++ b/drivers/platform/x86/intel_pmc_core.c
> @@ -31,8 +31,6 @@
>
>  #include "intel_pmc_core.h"
>
> -static struct pmc_dev pmc;
> -
>  /* PKGC MSRs are common across Intel Core SoCs */
>  static const struct pmc_bit_map msr_map[] = {
>         {"Package C2",                  MSR_PKG_C2_RESIDENCY},
> @@ -617,9 +615,8 @@ static int pmc_core_dev_state_get(void *data, u64 *val)
>
>  DEFINE_DEBUGFS_ATTRIBUTE(pmc_core_dev_state, pmc_core_dev_state_get, NULL, "%llu\n");
>
> -static int pmc_core_check_read_lock_bit(void)
> +static int pmc_core_check_read_lock_bit(struct pmc_dev *pmcdev)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
>         u32 value;
>
>         value = pmc_core_reg_read(pmcdev, pmcdev->map->pm_cfg_offset);
> @@ -744,28 +741,26 @@ static int pmc_core_ppfear_show(struct seq_file *s, void *unused)
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_ppfear);
>
>  /* This function should return link status, 0 means ready */
> -static int pmc_core_mtpmc_link_status(void)
> +static int pmc_core_mtpmc_link_status(struct pmc_dev *pmcdev)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
>         u32 value;
>
>         value = pmc_core_reg_read(pmcdev, SPT_PMC_PM_STS_OFFSET);
>         return value & BIT(SPT_PMC_MSG_FULL_STS_BIT);
>  }
>
> -static int pmc_core_send_msg(u32 *addr_xram)
> +static int pmc_core_send_msg(struct pmc_dev *pmcdev, u32 *addr_xram)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
>         u32 dest;
>         int timeout;
>
>         for (timeout = NUM_RETRIES; timeout > 0; timeout--) {
> -               if (pmc_core_mtpmc_link_status() == 0)
> +               if (pmc_core_mtpmc_link_status(pmcdev) == 0)
>                         break;
>                 msleep(5);
>         }
>
> -       if (timeout <= 0 && pmc_core_mtpmc_link_status())
> +       if (timeout <= 0 && pmc_core_mtpmc_link_status(pmcdev))
>                 return -EBUSY;
>
>         dest = (*addr_xram & MTPMC_MASK) | (1U << 1);
> @@ -791,7 +786,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>
>         mutex_lock(&pmcdev->lock);
>
> -       if (pmc_core_send_msg(&mphy_core_reg_low) != 0) {
> +       if (pmc_core_send_msg(pmcdev, &mphy_core_reg_low) != 0) {
>                 err = -EBUSY;
>                 goto out_unlock;
>         }
> @@ -799,7 +794,7 @@ static int pmc_core_mphy_pg_show(struct seq_file *s, void *unused)
>         msleep(10);
>         val_low = pmc_core_reg_read(pmcdev, SPT_PMC_MFPMC_OFFSET);
>
> -       if (pmc_core_send_msg(&mphy_core_reg_high) != 0) {
> +       if (pmc_core_send_msg(pmcdev, &mphy_core_reg_high) != 0) {
>                 err = -EBUSY;
>                 goto out_unlock;
>         }
> @@ -842,7 +837,7 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>         mphy_common_reg  = (SPT_PMC_MPHY_COM_STS_0 << 16);
>         mutex_lock(&pmcdev->lock);
>
> -       if (pmc_core_send_msg(&mphy_common_reg) != 0) {
> +       if (pmc_core_send_msg(pmcdev, &mphy_common_reg) != 0) {
>                 err = -EBUSY;
>                 goto out_unlock;
>         }
> @@ -863,9 +858,8 @@ static int pmc_core_pll_show(struct seq_file *s, void *unused)
>  }
>  DEFINE_SHOW_ATTRIBUTE(pmc_core_pll);
>
> -static int pmc_core_send_ltr_ignore(u32 value)
> +static int pmc_core_send_ltr_ignore(struct pmc_dev *pmcdev, u32 value)
>  {
> -       struct pmc_dev *pmcdev = &pmc;
>         const struct pmc_reg_map *map = pmcdev->map;
>         u32 reg;
>         int err = 0;
> @@ -891,6 +885,8 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>                                          const char __user *userbuf,
>                                          size_t count, loff_t *ppos)
>  {
> +       struct seq_file *s = file->private_data;
> +       struct pmc_dev *pmcdev = s->private;
>         u32 buf_size, value;
>         int err;
>
> @@ -900,7 +896,7 @@ static ssize_t pmc_core_ltr_ignore_write(struct file *file,
>         if (err)
>                 return err;
>
> -       err = pmc_core_send_ltr_ignore(value);
> +       err = pmc_core_send_ltr_ignore(pmcdev, value);
>
>         return err == 0 ? count : err;
>  }
> @@ -1228,13 +1224,19 @@ static void pmc_core_do_dmi_quirks(struct pmc_dev *pmcdev)
>  static int pmc_core_probe(struct platform_device *pdev)
>  {
>         static bool device_initialized;
> -       struct pmc_dev *pmcdev = &pmc;
> +       struct pmc_dev *pmcdev;
>         const struct x86_cpu_id *cpu_id;
>         u64 slp_s0_addr;
>
>         if (device_initialized)
>                 return -ENODEV;
>
> +       pmcdev = devm_kzalloc(&pdev->dev, sizeof(*pmcdev), GFP_KERNEL);
> +       if (!pmcdev)
> +               return -ENOMEM;
> +
> +       platform_set_drvdata(pdev, pmcdev);
> +
>         cpu_id = x86_match_cpu(intel_pmc_core_ids);
>         if (!cpu_id)
>                 return -ENODEV;
> @@ -1264,8 +1266,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>                 return -ENOMEM;
>
>         mutex_init(&pmcdev->lock);
> -       platform_set_drvdata(pdev, pmcdev);
> -       pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit();
> +       pmcdev->pmc_xram_read_bit = pmc_core_check_read_lock_bit(pmcdev);
>         pmc_core_do_dmi_quirks(pmcdev);
>
>         /*
> @@ -1274,7 +1275,7 @@ static int pmc_core_probe(struct platform_device *pdev)
>          */
>         if (pmcdev->map == &tgl_reg_map) {
>                 dev_dbg(&pdev->dev, "ignoring GBE LTR\n");
> -               pmc_core_send_ltr_ignore(3);
> +               pmc_core_send_ltr_ignore(pmcdev, 3);
>         }
>
>         pmc_core_dbgfs_register(pmcdev);
> --
> 2.25.1
>


-- 
Thanks,
Rajneesh
