Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 812F72ABCC5
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Nov 2020 14:41:08 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387889AbgKINkY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Nov 2020 08:40:24 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:28360 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730602AbgKINkX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Nov 2020 08:40:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1604929219;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YLacT/m7jiVdHUCtddmpWARUSklYIDJ6fpQekLyo2Lk=;
        b=BV/VHSmkmhMQpf8RFuXIpF/NY96OA5B3UQJ7oWJm8/2ik1+fYib8g6xCRb4cRyaqO3H3vZ
        128fpUVu6SEJaYUhLlf0Y5dMNCnRzfvO/14Nc00GN4K9yO9zvP9pbn1E2knw2ADS4FdIdC
        zo1Ru5wT96S5N+D94ZEiXgBN5M8xetY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-419-YzhuIkTGNeWww0SjpifI7w-1; Mon, 09 Nov 2020 08:40:15 -0500
X-MC-Unique: YzhuIkTGNeWww0SjpifI7w-1
Received: by mail-ed1-f70.google.com with SMTP id b68so2729083edf.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Nov 2020 05:40:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YLacT/m7jiVdHUCtddmpWARUSklYIDJ6fpQekLyo2Lk=;
        b=AWQQcl5FsUs4ky8oB2R3J+TdAgJS7bcoWESj3kOPgd1STFkzjnGoVdhEevAqb+dMzP
         CtygVk0XO3CZi7ZHC7HliG3nAGZPzgYKq1mOCrwNDDbZlM6dACIo1hFC3/Cq73BQUqrv
         qrLKjrjbac59W9U2m7SCqaiXq4SLuzoHoxs5fCQDUSxmeEG9YZYJuz37/4lRq47dsHbe
         QKfwH/V4B3aiAN3ORftQU4mfhrZG6BTd612Ke94srcHNBjZProDrTcyoe9MAQhA6FFja
         At7Q86VQwWFglc1YWcNo8NSHVgv9e2oSSQ+t/n9izS1Snsfx6ITiFaX8BfUhA3PyGGcE
         W/Fg==
X-Gm-Message-State: AOAM531sqBaz+PFyWw9aoLjq0ODK24DygJhJRcsKUVKvJGHgeiUQ7SbC
        wjqm0tgy3fNGgihAoMzA8acPFdadu8p0lfMl9nApquk6dHz2yCjk6ZVmMmcp7GsnL1naUnZLa8a
        618vQXKsmlqF3PrVztau090BFr85SGMSTjg==
X-Received: by 2002:a17:906:b53:: with SMTP id v19mr14582783ejg.136.1604929212913;
        Mon, 09 Nov 2020 05:40:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx7hcLfqDGk0d+16PtZ52VMqca/8um52sH3Agus9psG989Eu4nQtGQLV/fguENT4j6lKBz1vw==
X-Received: by 2002:a17:906:b53:: with SMTP id v19mr14582765ejg.136.1604929212634;
        Mon, 09 Nov 2020 05:40:12 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-6c10-fbf3-14c4-884c.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:6c10:fbf3:14c4:884c])
        by smtp.gmail.com with ESMTPSA id l25sm8759826eds.65.2020.11.09.05.40.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2020 05:40:12 -0800 (PST)
Subject: Re: [PATCH v5] platform/x86: amd-pmc: Add AMD platform support for
 S2Idle
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
        mgross@linux.intel.com, andy.shevchenko@gmail.com,
        platform-driver-x86@vger.kernel.org
Cc:     Alexander.Deucher@amd.com
References: <20201105140531.2955555-1-Shyam-sundar.S-k@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2e2e51d6-19f7-6477-0c5a-75fa55435603@redhat.com>
Date:   Mon, 9 Nov 2020 14:40:11 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201105140531.2955555-1-Shyam-sundar.S-k@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/5/20 3:05 PM, Shyam Sundar S K wrote:
> AMD Power Management Controller driver a.k.a. amd-pmc driver is the
> controller which is meant for the final S2Idle transaction that goes to
> the PMFW running on the AMD SMU (System Management Unit) responsible for
> tuning of the VDD.
> 
> Once all the monitored list or the idle constraints are met, this driver
> would go and set the OS_HINT (meaning all the devices have reached to
> their lowest state possible) via the SMU mailboxes.
> 
> This driver would also provide some debug capabilities via debugfs.
> 
> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note it will show up in my review-hans branch once I've pushed my
local branch there, which might take a while.

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> ---
> v2:(https://www.spinics.net/lists/platform-driver-x86/msg23269.html)
> - Remove duplicate code and make a common routine for polling SMU
> - Reorg Maintainers info
> - add missing iounmap() during erroneous case.
> 
> v3:(https://www.spinics.net/lists/platform-driver-x86/msg23413.html)
> - Addressed cosmetic problems like redundant assignments, blank lines
>   etc.
> - Moved to readx_poll_timeout() and pci_match_id() for better handling.
> - Removed the header and moved all macros to C code.
> 
> v4:(https://www.spinics.net/lists/platform-driver-x86/msg23421.html)
> - Used GENMASK(), devm_ioremap() for better handling
> - Corrected some spelling mistakes
> 
> v5:
> - Use pcibios_err_to_errno() when returning errors while using PCI
>   API's.
> - Removed extra blanks lines wherever possible.
> - Run spelling and grammer checks :-)
> ---
>  MAINTAINERS                    |   6 +
>  drivers/platform/x86/Kconfig   |  14 ++
>  drivers/platform/x86/Makefile  |   3 +
>  drivers/platform/x86/amd-pmc.c | 286 +++++++++++++++++++++++++++++++++
>  4 files changed, 309 insertions(+)
>  create mode 100644 drivers/platform/x86/amd-pmc.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index e2a8ad69c262..fc7b556994e4 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -929,6 +929,12 @@ L:	linux-i2c@vger.kernel.org
>  S:	Maintained
>  F:	drivers/i2c/busses/i2c-amd-mp2*
>  
> +AMD PMC DRIVER
> +M:	Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	drivers/platform/x86/amd-pmc.*
> +
>  AMD POWERPLAY
>  M:	Evan Quan <evan.quan@amd.com>
>  L:	amd-gfx@lists.freedesktop.org
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 0d91d136bc3b..58e60e6ac9d8 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -180,6 +180,20 @@ config ACER_WMI
>  	  If you have an ACPI-WMI compatible Acer/ Wistron laptop, say Y or M
>  	  here.
>  
> +config AMD_PMC
> +	tristate "AMD SoC PMC driver"
> +	depends on ACPI && PCI
> +	help
> +	  The driver provides support for AMD Power Management Controller
> +	  primarily responsible for S2Idle transactions that are driven from
> +	  a platform firmware running on SMU. This driver also provides a debug
> +	  mechanism to investigate the S2Idle transactions and failures.
> +
> +	  Say Y or M here if you have a notebook powered by AMD RYZEN CPU/APU.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd-pmc.
> +
>  config APPLE_GMUX
>  	tristate "Apple Gmux Driver"
>  	depends on ACPI && PCI
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index 5f823f7eff45..48203e87240c 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -22,6 +22,9 @@ obj-$(CONFIG_ACERHDF)		+= acerhdf.o
>  obj-$(CONFIG_ACER_WIRELESS)	+= acer-wireless.o
>  obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
> +# AMD
> +obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> +
>  # Apple
>  obj-$(CONFIG_APPLE_GMUX)	+= apple-gmux.o
>  
> diff --git a/drivers/platform/x86/amd-pmc.c b/drivers/platform/x86/amd-pmc.c
> new file mode 100644
> index 000000000000..0102bf1c7916
> --- /dev/null
> +++ b/drivers/platform/x86/amd-pmc.c
> @@ -0,0 +1,286 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * AMD SoC Power Management Controller Driver
> + *
> + * Copyright (c) 2020, Advanced Micro Devices, Inc.
> + * All Rights Reserved.
> + *
> + * Author: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <linux/acpi.h>
> +#include <linux/bitfield.h>
> +#include <linux/bits.h>
> +#include <linux/debugfs.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/iopoll.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/suspend.h>
> +#include <linux/seq_file.h>
> +#include <linux/uaccess.h>
> +
> +/* SMU communication registers */
> +#define AMD_PMC_REGISTER_MESSAGE	0x538
> +#define AMD_PMC_REGISTER_RESPONSE	0x980
> +#define AMD_PMC_REGISTER_ARGUMENT	0x9BC
> +
> +/* Base address of SMU for mapping physical address to virtual address */
> +#define AMD_PMC_SMU_INDEX_ADDRESS	0xB8
> +#define AMD_PMC_SMU_INDEX_DATA		0xBC
> +#define AMD_PMC_MAPPING_SIZE		0x01000
> +#define AMD_PMC_BASE_ADDR_OFFSET	0x10000
> +#define AMD_PMC_BASE_ADDR_LO		0x13B102E8
> +#define AMD_PMC_BASE_ADDR_HI		0x13B102EC
> +#define AMD_PMC_BASE_ADDR_LO_MASK	GENMASK(15, 0)
> +#define AMD_PMC_BASE_ADDR_HI_MASK	GENMASK(31, 20)
> +
> +/* SMU Response Codes */
> +#define AMD_PMC_RESULT_OK                    0x01
> +#define AMD_PMC_RESULT_CMD_REJECT_BUSY       0xFC
> +#define AMD_PMC_RESULT_CMD_REJECT_PREREQ     0xFD
> +#define AMD_PMC_RESULT_CMD_UNKNOWN           0xFE
> +#define AMD_PMC_RESULT_FAILED                0xFF
> +
> +/* List of supported CPU ids */
> +#define AMD_CPU_ID_RV			0x15D0
> +#define AMD_CPU_ID_RN			0x1630
> +#define AMD_CPU_ID_PCO			AMD_CPU_ID_RV
> +#define AMD_CPU_ID_CZN			AMD_CPU_ID_RN
> +
> +#define AMD_SMU_FW_VERSION		0x0
> +#define PMC_MSG_DELAY_MIN_US		100
> +#define RESPONSE_REGISTER_LOOP_MAX	200
> +
> +enum amd_pmc_def {
> +	MSG_TEST = 0x01,
> +	MSG_OS_HINT_PCO,
> +	MSG_OS_HINT_RN,
> +};
> +
> +struct amd_pmc_dev {
> +	void __iomem *regbase;
> +	void __iomem *smu_base;
> +	u32 base_addr;
> +	u32 cpu_id;
> +	struct device *dev;
> +#if IS_ENABLED(CONFIG_DEBUG_FS)
> +	struct dentry *dbgfs_dir;
> +#endif /* CONFIG_DEBUG_FS */
> +};
> +
> +static struct amd_pmc_dev pmc;
> +
> +static inline u32 amd_pmc_reg_read(struct amd_pmc_dev *dev, int reg_offset)
> +{
> +	return ioread32(dev->regbase + reg_offset);
> +}
> +
> +static inline void amd_pmc_reg_write(struct amd_pmc_dev *dev, int reg_offset, u32 val)
> +{
> +	iowrite32(val, dev->regbase + reg_offset);
> +}
> +
> +#if CONFIG_DEBUG_FS
> +static int smu_fw_info_show(struct seq_file *s, void *unused)
> +{
> +	struct amd_pmc_dev *dev = s->private;
> +	u32 value;
> +
> +	value = ioread32(dev->smu_base + AMD_SMU_FW_VERSION);
> +	seq_printf(s, "SMU FW Info: %x\n", value);
> +	return 0;
> +}
> +DEFINE_SHOW_ATTRIBUTE(smu_fw_info);
> +
> +static void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> +{
> +	debugfs_remove_recursive(dev->dbgfs_dir);
> +}
> +
> +static void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +	dev->dbgfs_dir = debugfs_create_dir("amd_pmc", NULL);
> +	debugfs_create_file("smu_fw_info", 0644, dev->dbgfs_dir, dev,
> +			    &smu_fw_info_fops);
> +}
> +#else
> +static inline void amd_pmc_dbgfs_register(struct amd_pmc_dev *dev)
> +{
> +}
> +
> +static inline void amd_pmc_dbgfs_unregister(struct amd_pmc_dev *dev)
> +{
> +}
> +#endif /* CONFIG_DEBUG_FS */
> +
> +static void amd_pmc_dump_registers(struct amd_pmc_dev *dev)
> +{
> +	u32 value;
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_RESPONSE);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_RESPONSE:%x\n", value);
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_ARGUMENT);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_ARGUMENT:%x\n", value);
> +
> +	value = amd_pmc_reg_read(dev, AMD_PMC_REGISTER_MESSAGE);
> +	dev_dbg(dev->dev, "AMD_PMC_REGISTER_MESSAGE:%x\n", value);
> +}
> +
> +static int amd_pmc_send_cmd(struct amd_pmc_dev *dev, bool set)
> +{
> +	int rc;
> +	u8 msg;
> +	u32 val;
> +
> +	/* Wait until we get a valid response */
> +	rc = readx_poll_timeout(ioread32, dev->regbase + AMD_PMC_REGISTER_RESPONSE,
> +				val, val > 0, PMC_MSG_DELAY_MIN_US,
> +				PMC_MSG_DELAY_MIN_US * RESPONSE_REGISTER_LOOP_MAX);
> +	if (rc) {
> +		dev_err(dev->dev, "failed to talk to SMU\n");
> +		return rc;
> +	}
> +
> +	/* Write zero to response register */
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_RESPONSE, 0);
> +
> +	/* Write argument into response register */
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_ARGUMENT, set);
> +
> +	/* Write message ID to message ID register */
> +	msg = (dev->cpu_id == AMD_CPU_ID_RN) ? MSG_OS_HINT_RN : MSG_OS_HINT_PCO;
> +	amd_pmc_reg_write(dev, AMD_PMC_REGISTER_MESSAGE, msg);
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_pmc_suspend(struct device *dev)
> +{
> +	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = amd_pmc_send_cmd(pdev, 1);
> +	if (rc)
> +		dev_err(pdev->dev, "suspend failed\n");
> +
> +	amd_pmc_dump_registers(pdev);
> +	return 0;
> +}
> +
> +static int __maybe_unused amd_pmc_resume(struct device *dev)
> +{
> +	struct amd_pmc_dev *pdev = dev_get_drvdata(dev);
> +	int rc;
> +
> +	rc = amd_pmc_send_cmd(pdev, 0);
> +	if (rc)
> +		dev_err(pdev->dev, "resume failed\n");
> +
> +	amd_pmc_dump_registers(pdev);
> +	return 0;
> +}
> +
> +static const struct dev_pm_ops amd_pmc_pm_ops = {
> +	SET_NOIRQ_SYSTEM_SLEEP_PM_OPS(amd_pmc_suspend, amd_pmc_resume)
> +};
> +
> +static const struct pci_device_id pmc_pci_ids[] = {
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_CZN) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RN) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_PCO) },
> +	{ PCI_DEVICE(PCI_VENDOR_ID_AMD, AMD_CPU_ID_RV) },
> +	{ }
> +};
> +
> +static int amd_pmc_probe(struct platform_device *pdev)
> +{
> +	struct amd_pmc_dev *dev = &pmc;
> +	struct pci_dev *rdev;
> +	u32 base_addr_lo;
> +	u32 base_addr_hi;
> +	u64 base_addr;
> +	int err;
> +	u32 val;
> +
> +	dev->dev = &pdev->dev;
> +
> +	rdev = pci_get_domain_bus_and_slot(0, 0, PCI_DEVFN(0, 0));
> +	if (!rdev || !pci_match_id(pmc_pci_ids, rdev))
> +		return -ENODEV;
> +
> +	dev->cpu_id = rdev->device;
> +	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_LO);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	base_addr_lo = val & AMD_PMC_BASE_ADDR_HI_MASK;
> +
> +	err = pci_write_config_dword(rdev, AMD_PMC_SMU_INDEX_ADDRESS, AMD_PMC_BASE_ADDR_HI);
> +	if (err) {
> +		dev_err(dev->dev, "error writing to 0x%x\n", AMD_PMC_SMU_INDEX_ADDRESS);
> +		return pcibios_err_to_errno(err);
> +	}
> +
> +	err = pci_read_config_dword(rdev, AMD_PMC_SMU_INDEX_DATA, &val);
> +	if (err)
> +		return pcibios_err_to_errno(err);
> +
> +	base_addr_hi = val & AMD_PMC_BASE_ADDR_LO_MASK;
> +	pci_dev_put(rdev);
> +	base_addr = ((u64)base_addr_hi << 32 | base_addr_lo);
> +
> +	dev->smu_base = devm_ioremap(dev->dev, base_addr, AMD_PMC_MAPPING_SIZE);
> +	if (!dev->smu_base)
> +		return -ENOMEM;
> +
> +	dev->regbase = devm_ioremap(dev->dev, base_addr + AMD_PMC_BASE_ADDR_OFFSET,
> +				    AMD_PMC_MAPPING_SIZE);
> +	if (!dev->regbase)
> +		return -ENOMEM;
> +
> +	amd_pmc_dump_registers(dev);
> +
> +	platform_set_drvdata(pdev, dev);
> +	amd_pmc_dbgfs_register(dev);
> +	return 0;
> +}
> +
> +static int amd_pmc_remove(struct platform_device *pdev)
> +{
> +	struct amd_pmc_dev *dev = platform_get_drvdata(pdev);
> +
> +	amd_pmc_dbgfs_unregister(dev);
> +	return 0;
> +}
> +
> +static const struct acpi_device_id amd_pmc_acpi_ids[] = {
> +	{"AMDI0005", 0},
> +	{"AMD0004", 0},
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(acpi, amd_pmc_acpi_ids);
> +
> +static struct platform_driver amd_pmc_driver = {
> +	.driver = {
> +		.name = "amd_pmc",
> +		.acpi_match_table = amd_pmc_acpi_ids,
> +		.pm = &amd_pmc_pm_ops,
> +	},
> +	.probe = amd_pmc_probe,
> +	.remove = amd_pmc_remove,
> +};
> +module_platform_driver(amd_pmc_driver);
> +
> +MODULE_LICENSE("GPL v2");
> +MODULE_DESCRIPTION("AMD PMC Driver");
> 

