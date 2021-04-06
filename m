Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D5332355AFF
	for <lists+platform-driver-x86@lfdr.de>; Tue,  6 Apr 2021 20:06:48 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233624AbhDFSGz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 6 Apr 2021 14:06:55 -0400
Received: from mga01.intel.com ([192.55.52.88]:22007 "EHLO mga01.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S232876AbhDFSGz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 6 Apr 2021 14:06:55 -0400
IronPort-SDR: RllVXhoTJTKLzCzTQOZkDmJasdPOA8ZF5FjL9kMIlaIjUCncCsDCvSEuNFuKwTZoWtRSwx1YF/
 TWXXAPa1qsRA==
X-IronPort-AV: E=McAfee;i="6000,8403,9946"; a="213502092"
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="213502092"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Apr 2021 11:06:47 -0700
IronPort-SDR: vV7N1tOOUS71nugDDBIpJDry+Bab/mlrbdsmHmCrAQfyr0OQFrQHI2zK0aLS1OuaQQK64sq+11
 Tl34LmpAZtCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.82,201,1613462400"; 
   d="scan'208";a="396336621"
Received: from linux.intel.com ([10.54.29.200])
  by orsmga002.jf.intel.com with ESMTP; 06 Apr 2021 11:06:46 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.27])
        by linux.intel.com (Postfix) with ESMTP id AD1695805A1;
        Tue,  6 Apr 2021 11:06:46 -0700 (PDT)
Message-ID: <ea7182237c98b2eff836b485cf61723bb6bdfa71.camel@linux.intel.com>
Subject: Re: [PATCH v4] platform/x86: intel_pmc_core: export platform
 global_reset via sysfs.
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Hans de Goede <hdegoede@redhat.com>,
        Tomas Winkler <tomas.winkler@intel.com>,
        Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
        David E Box <david.e.box@intel.com>,
        Mark Gross <mgross@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org,
        Tamar Mashiah <tamar.mashiah@intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Tue, 06 Apr 2021 11:06:46 -0700
In-Reply-To: <d5021cc2-46c7-7c78-73b1-af50524e1db2@redhat.com>
References: <20210402152113.1191796-1-tomas.winkler@intel.com>
         <d5021cc2-46c7-7c78-73b1-af50524e1db2@redhat.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Tomas,

On Tue, 2021-04-06 at 15:11 +0200, Hans de Goede wrote:
> Hi,
> 
> On 4/2/21 5:21 PM, Tomas Winkler wrote:
> > From: Tamar Mashiah <tamar.mashiah@intel.com>
> > 
> > During PCH (platform/board) manufacturing process a global reset
> > has to be induced in order for configuration changes take the effect
> > upon following platform reset.
> > This setting was commonly done by accessing PMC registers via
> > /dev/mem
> > but due to security concern /dev/mem access is much restricted, hence
> > the reason for exposing this setting via dedicated sysfs interface.
> > To prevent post manufacturing abuse the register is protected
> > by hardware locking.
> 
> The purpose of this reset functionality is not entirely clear to me.
> 
> Is this only used during production of a board? Or is this also
> something
> which a user/reseller may use as part of a factory-reset procedure?
> 
> If this is only used once during production, then I'm not sure if
> introducing a sysfs file for this is desirable.
> 
> Can you please provide a new version where the purpsoe of the newly
> introduced sysfs file is made more clear, both in the commit-msg
> as well as in the:

Could you also rebase it on the for-next branch at
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git

It has patches for intel_pmc_core. I also need to refactor my latest
patch set on top of this one since you're adding the same new register
as I am.

> 
> Documentation/ABI/testing/sysfs-platform-intel-pmc
> 
> File ?
> 
> Regards,
> 
> Hans
> 
> 
> 
> > 
> > The register in MMIO space is defined for Cannon Lake and newer PCHs.
> > 
> > Cc: David E Box <david.e.box@intel.com>
> > Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Signed-off-by: Tamar Mashiah <tamar.mashiah@intel.com>
> > Signed-off-by: Tomas Winkler <tomas.winkler@intel.com>
> > ---
> > 2:
> > 1. Add locking for reading the ET3 register  (Andy)
> > 2. Fix few style issues (Andy)
> > V3:
> > 1. Resend
> > v4:
> > 1. Fix return statement (Andy) 
> > 2. Specify manufacturing process (Enrico)
> > 
> >  .../ABI/testing/sysfs-platform-intel-pmc      | 11 +++
> >  MAINTAINERS                                   |  1 +
> >  drivers/platform/x86/intel_pmc_core.c         | 97
> > +++++++++++++++++++
> >  drivers/platform/x86/intel_pmc_core.h         |  6 ++
> >  4 files changed, 115 insertions(+)
> >  create mode 100644 Documentation/ABI/testing/sysfs-platform-intel-
> > pmc
> > 
> > diff --git a/Documentation/ABI/testing/sysfs-platform-intel-pmc
> > b/Documentation/ABI/testing/sysfs-platform-intel-pmc
> > new file mode 100644
> > index 000000000000..7ce00e77fbcd
> > --- /dev/null
> > +++ b/Documentation/ABI/testing/sysfs-platform-intel-pmc
> > @@ -0,0 +1,11 @@
> > +What:          /sys/devices/platform/<platform>/global_reset
> > +Date:          Apr 2021
> > +KernelVersion: 5.13
> > +Contact:       "Tomas Winkler" <tomas.winkler@intel.com>
> > +Description:
> > +               Display global reset setting bits for PMC.
> > +                       * bit 31 - global reset is locked
> > +                       * bit 20 - global reset is set
> > +               Writing bit 20 value to the global_reset will induce
> > +               a platform global reset upon consequent platform
> > reset.
> > +               in case the register is not locked.
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 04f68e0cda64..618676eba8c8 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -9166,6 +9166,7 @@ M:        Rajneesh Bhardwaj <
> > irenic.rajneesh@gmail.com>
> >  M:     David E Box <david.e.box@intel.com>
> >  L:     platform-driver-x86@vger.kernel.org
> >  S:     Maintained
> > +F:     Documentation/ABI/testing/sysfs-platform-intel-pmc
> >  F:     drivers/platform/x86/intel_pmc_core*
> >  
> >  INTEL PMIC GPIO DRIVERS
> > diff --git a/drivers/platform/x86/intel_pmc_core.c
> > b/drivers/platform/x86/intel_pmc_core.c
> > index ee2f757515b0..8afc198550a4 100644
> > --- a/drivers/platform/x86/intel_pmc_core.c
> > +++ b/drivers/platform/x86/intel_pmc_core.c
> > @@ -401,6 +401,7 @@ static const struct pmc_reg_map cnp_reg_map = {
> >         .pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
> >         .pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> >         .ltr_ignore_max = CNP_NUM_IP_IGN_ALLOWED,
> > +       .etr3_offset = ETR3_OFFSET,
> >  };
> >  
> >  static const struct pmc_reg_map icl_reg_map = {
> > @@ -418,6 +419,7 @@ static const struct pmc_reg_map icl_reg_map = {
> >         .pm_cfg_offset = CNP_PMC_PM_CFG_OFFSET,
> >         .pm_read_disable_bit = CNP_PMC_READ_DISABLE_BIT,
> >         .ltr_ignore_max = ICL_NUM_IP_IGN_ALLOWED,
> > +       .etr3_offset = ETR3_OFFSET,
> >  };
> >  
> >  static const struct pmc_bit_map tgl_clocksource_status_map[] = {
> > @@ -585,6 +587,7 @@ static const struct pmc_reg_map tgl_reg_map = {
> >         .lpm_sts = tgl_lpm_maps,
> >         .lpm_status_offset = TGL_LPM_STATUS_OFFSET,
> >         .lpm_live_status_offset = TGL_LPM_LIVE_STATUS_OFFSET,
> > +       .etr3_offset = ETR3_OFFSET,
> >  };
> >  
> >  static inline u32 pmc_core_reg_read(struct pmc_dev *pmcdev, int
> > reg_offset)
> > @@ -603,6 +606,99 @@ static inline u64
> > pmc_core_adjust_slp_s0_step(struct pmc_dev *pmcdev, u32 value)
> >         return (u64)value * pmcdev->map->slp_s0_res_counter_step;
> >  }
> >  
> > +static int set_global_reset(struct pmc_dev *pmcdev)
> > +{
> > +       const struct pmc_reg_map *map = pmcdev->map;
> > +       u32 reg;
> > +       int err;
> > +
> > +       if (!map->etr3_offset)
> > +               return -EOPNOTSUPP;
> > +
> > +       mutex_lock(&pmcdev->lock);
> > +
> > +       /* check if CF9 is locked */
> > +       reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
> > +       if (reg & ETR3_CF9LOCK) {
> > +               err = -EACCES;
> > +               goto out_unlock;
> > +       }
> > +
> > +       /* write CF9 global reset bit */
> > +       reg |= ETR3_CF9GR;
> > +       pmc_core_reg_write(pmcdev, map->etr3_offset, reg);
> > +
> > +       reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
> > +       if (!(reg & ETR3_CF9GR)) {
> > +               err = -EIO;
> > +               goto out_unlock;
> > +       }
> > +
> > +       err = 0;
> > +
> > +out_unlock:
> > +       mutex_unlock(&pmcdev->lock);
> > +       return err;
> > +}
> > +
> > +static ssize_t global_reset_show(struct device *dev,
> > +                                struct device_attribute *attr, char
> > *buf)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +       const struct pmc_reg_map *map = pmcdev->map;
> > +       u32 reg;
> > +
> > +       if (!map->etr3_offset)
> > +               return -EOPNOTSUPP;
> > +
> > +       mutex_lock(&pmcdev->lock);
> > +
> > +       reg = pmc_core_reg_read(pmcdev, map->etr3_offset);
> > +       reg &= ETR3_CF9GR | ETR3_CF9LOCK;
> > +
> > +       mutex_unlock(&pmcdev->lock);
> > +
> > +       return sysfs_emit(buf, "0x%08x", reg);
> > +}
> > +
> > +static ssize_t global_reset_store(struct device *dev,
> > +                                 struct device_attribute *attr,
> > +                                 const char *buf, size_t len)
> > +{
> > +       struct pmc_dev *pmcdev = dev_get_drvdata(dev);
> > +       int err;
> > +       u32 reg;
> > +
> > +       err = kstrtouint(buf, 16, &reg);
> > +       if (err)
> > +               return err;
> > +
> > +       /* allow only CF9 writes */
> > +       if (reg != ETR3_CF9GR)
> > +               return -EINVAL;
> > +
> > +       err = set_global_reset(pmcdev);
> > +       if (err)
> > +               return err;
> > +
> > +       return len;
> > +}
> > +static DEVICE_ATTR_RW(global_reset);
> > +
> > +static struct attribute *pmc_attrs[] = {
> > +       &dev_attr_global_reset.attr,
> > +       NULL
> > +};
> > +
> > +static const struct attribute_group pmc_attr_group = {
> > +       .attrs = pmc_attrs,
> > +};
> > +
> > +static const struct attribute_group *pmc_dev_groups[] = {
> > +       &pmc_attr_group,
> > +       NULL
> > +};
> > +
> >  static int pmc_core_dev_state_get(void *data, u64 *val)
> >  {
> >         struct pmc_dev *pmcdev = data;
> > @@ -1364,6 +1460,7 @@ static struct platform_driver pmc_core_driver =
> > {
> >                 .name = "intel_pmc_core",
> >                 .acpi_match_table = ACPI_PTR(pmc_core_acpi_ids),
> >                 .pm = &pmc_core_pm_ops,
> > +               .dev_groups = pmc_dev_groups,
> >         },
> >         .probe = pmc_core_probe,
> >         .remove = pmc_core_remove,
> > diff --git a/drivers/platform/x86/intel_pmc_core.h
> > b/drivers/platform/x86/intel_pmc_core.h
> > index f33cd2c34835..98ebdfe57138 100644
> > --- a/drivers/platform/x86/intel_pmc_core.h
> > +++ b/drivers/platform/x86/intel_pmc_core.h
> > @@ -200,6 +200,11 @@ enum ppfear_regs {
> >  #define TGL_LPM_STATUS_OFFSET                  0x1C3C
> >  #define TGL_LPM_LIVE_STATUS_OFFSET             0x1C5C
> >  
> > +/* Extended Test Mode Register 3 (CNL and later) */
> > +#define ETR3_OFFSET                            0x1048
> > +#define ETR3_CF9GR                             BIT(20)
> > +#define ETR3_CF9LOCK                           BIT(31)
> > +
> >  const char *tgl_lpm_modes[] = {
> >         "S0i2.0",
> >         "S0i2.1",
> > @@ -263,6 +268,7 @@ struct pmc_reg_map {
> >         const u32 lpm_residency_offset;
> >         const u32 lpm_status_offset;
> >         const u32 lpm_live_status_offset;
> > +       const u32 etr3_offset;
> >  };
> >  
> >  /**
> > 
> 


