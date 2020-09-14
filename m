Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 39F4C268C4D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 15:37:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726766AbgINNhD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 09:37:03 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:51407 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726559AbgINN2h (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 09:28:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600090094;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=MiKix775mTYO5U26GuNI0OcN+XpFB53mHKQB9wZvP48=;
        b=czwmDeNZ/efFVneuw1QslQRtqcNCjBii87cGkR0N6wlS18h52OpwBKbwUo184m/PwIp/Mg
        9sbkDsk5Z1CrdeWGQM23Rf6ekXOj+x7HVeLehGmxqUgc9SNtrF7VhJz09DF6ibT4HjUeFk
        fm5+8Z6uX1Gu15OivNzjF3clYgvhzG8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-281-lH3m8sDVNcSLeuYiF6AQGA-1; Mon, 14 Sep 2020 09:28:13 -0400
X-MC-Unique: lH3m8sDVNcSLeuYiF6AQGA-1
Received: by mail-ej1-f70.google.com with SMTP id rs9so7999151ejb.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 06:28:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MiKix775mTYO5U26GuNI0OcN+XpFB53mHKQB9wZvP48=;
        b=fSiMgnBKJAaX3HbuX1qb/3vGHbeswd619LcPnIDwAoZ+v9Fmu+NXFiKyjSBtg+7u7E
         t8DGBHeO1NvExPYdC7C0f74jFGVu3eAKLaqbeaPdl8hA2XYCtTdBZHvBmPdhOGsb9nNx
         XkaTL3MEVEz9GTS9FWupgir8AXJH8kBiFQ24xdfI6AI+TcUYK+rWPOvAXg4NKQNk4c0I
         uI68a5behDpD0Lpd/epydXawe4kHDHe+oEeIbwR123bsymGtRgUchvnI4aPE48EmJVar
         k+pXrnLK9U/XjUfyXgUvzhR6VuuYKoqGHBQp5bsuvKShpJwbcauk4DMuhghvjcmJyYHm
         d1uA==
X-Gm-Message-State: AOAM532VEeW8sr8/iZEycE3e6Ysi6c5StWiSsVoimk5D9w6MXRvsj8Lw
        HJ91ncafruESvvTwFk25rvnVKrULIEGc2+23AaiwsVjKakIdqFlk0E0djU9ZXpQFU90uKZay1Om
        DdA+s8DZ8eg3ZuIa8sNY0F8iSIwAiGRB03Q==
X-Received: by 2002:a17:907:9ed:: with SMTP id ce13mr14201681ejc.180.1600090088487;
        Mon, 14 Sep 2020 06:28:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzzYJNpdxdP8WmjoDcexFhZ2V7t4N4VRMrDunHUZRPP+Ptv7uTu61EVa8CJ0101bmmqchaMxA==
X-Received: by 2002:a17:907:9ed:: with SMTP id ce13mr14201656ejc.180.1600090088086;
        Mon, 14 Sep 2020 06:28:08 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id z21sm7790860eja.72.2020.09.14.06.28.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 06:28:07 -0700 (PDT)
Subject: Re: [PATCH 3/3] platform/x86: Intel PMT Crashlog capability driver
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        dvhart@infradead.org, andy@infradead.org,
        alexander.h.duyck@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
References: <20200911194549.12780-1-david.e.box@linux.intel.com>
 <20200911194549.12780-4-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <6e3738db-bfff-7fd2-65e6-bd0d126f9eaa@redhat.com>
Date:   Mon, 14 Sep 2020 15:28:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200911194549.12780-4-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/11/20 9:45 PM, David E. Box wrote:
> From: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> 
> Add support for the Intel Platform Monitoring Technology crashlog
> interface.  This interface provides a few sysfs values to allow for
> controlling the crashlog telemetry interface as well as a character driver
> to allow for mapping the crashlog memory region so that it can be accessed
> after a crashlog has been recorded.
> 
> This driver is meant to only support the server version of the crashlog
> which is identified as crash_type 1 with a version of zero. Currently no
> other types are supported.
> 
> Signed-off-by: Alexander Duyck <alexander.h.duyck@linux.intel.com>
> Signed-off-by: David E. Box <david.e.box@linux.intel.com>
> ---
>   .../ABI/testing/sysfs-class-pmt_crashlog      |  66 ++
>   drivers/platform/x86/Kconfig                  |  10 +
>   drivers/platform/x86/Makefile                 |   1 +
>   drivers/platform/x86/intel_pmt_crashlog.c     | 588 ++++++++++++++++++
>   4 files changed, 665 insertions(+)
>   create mode 100644 Documentation/ABI/testing/sysfs-class-pmt_crashlog
>   create mode 100644 drivers/platform/x86/intel_pmt_crashlog.c
> 
> diff --git a/Documentation/ABI/testing/sysfs-class-pmt_crashlog b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
> new file mode 100644
> index 000000000000..40fb4ff437a6
> --- /dev/null
> +++ b/Documentation/ABI/testing/sysfs-class-pmt_crashlog
> @@ -0,0 +1,66 @@
> +What:		/sys/class/pmt_crashlog/
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		The pmt_crashlog/ class directory contains information
> +		for devices that expose crashlog capabilities using the Intel
> +		Platform Monitoring Technology (PTM).
> +
> +What:		/sys/class/pmt_crashlog/crashlogX
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		The crashlogX directory contains files for configuring an
> +		instance of a PMT crashlog device that can perform crash data
> +		recoring. Each crashlogX device has an associated
> +		/dev/crashlogX device node. This node can be opened and mapped
> +		to access the resulting crashlog data. The register layout for
> +		the log can be determined from an XML file of specified guid
> +		for the parent device.
> +
> +What:		/sys/class/pmt_crashlog/crashlogX/guid
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		(RO) The guid for this crashlog device. The guid identifies the
> +		version of the XML file for the parent device that should be
> +		used to determine the register layout.
> +
> +What:		/sys/class/pmt_crashlog/crashlogX/size
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		(RO) The length of the result buffer in bytes that corresponds
> +		to the mapping size for the /dev/crashlogX device node.
> +
> +What:		/sys/class/pmt_crashlog/crashlogX/offset
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		(RO) The offset of the buffer in bytes that corresponds
> +		to the mapping for the /dev/crashlogX device node.
> +
> +What:		/sys/class/pmt_crashlog/crashlogX/enable
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		(RW) Boolean value controlling if the crashlog functionality
> +		is enabled for the /dev/crashlogX device node.
> +
> +What:		/sys/class/pmt_crashlog/crashlogX/trigger
> +Date:		September 2020
> +KernelVersion:	5.10
> +Contact:	Alexander Duyck <alexander.h.duyck@linux.intel.com>
> +Description:
> +		(RW) Boolean value controlling  the triggering of the
> +		/dev/crashlogX device node. When read it provides data on if
> +		the crashlog has been triggered. When written to it can be
> +		used to either clear the current trigger by writing false, or
> +		to trigger a new event if the trigger is not currently set.
> +

Both the pmt_crashlog and the attributes suggest that this is highly
Intel PMT specific. /sys/class/foo interfaces are generally speaking
meant to be generic interfaces.

If this was defining a generic, vendor and implementation agnostic interface for
configuring / accessing crashlogs, then using a class would be fine, but that
is not the case, so I believe that this should not implement / register a class.

Since the devices are instantiated through MFD there already is a
static sysfs-path which can be used to find the device in sysfs:
/sys/bus/platform/device/pmt_crashlog

So you can register the sysfs attributes directly under the platform_device
and then userspace can easily find them, so there really is no need to
use a class here.

> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 48335b02014f..50c3234e4f72 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1360,6 +1360,16 @@ config INTEL_PMC_CORE
>   		- LTR Ignore
>   		- MPHY/PLL gating status (Sunrisepoint PCH only)
>   
> +config INTEL_PMT_CRASHLOG
> +	tristate "Intel Platform Monitoring Technology (PMT) Crashlog driver"
> +	help
> +	 The Intel Platform Monitoring Technology (PMT) crashlog driver provides
> +	 access to hardware crashlog capabilities on devices that support the
> +	 feature.
> +
> +	 For more information, see
> +	 <file:Documentation/ABI/testing/sysfs-class-intel_pmt_crashlog>
> +
>   config INTEL_PMT_TELEMETRY
>   	tristate "Intel Platform Monitoring Technology (PMT) Telemetry driver"
>   	help
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index ca942e70de8d..1b8b2502d460 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -140,6 +140,7 @@ obj-$(CONFIG_INTEL_MFLD_THERMAL)	+= intel_mid_thermal.o
>   obj-$(CONFIG_INTEL_MID_POWER_BUTTON)	+= intel_mid_powerbtn.o
>   obj-$(CONFIG_INTEL_MRFLD_PWRBTN)	+= intel_mrfld_pwrbtn.o
>   obj-$(CONFIG_INTEL_PMC_CORE)		+= intel_pmc_core.o intel_pmc_core_pltdrv.o
> +obj-$(CONFIG_INTEL_PMT_CRASHLOG)	+= intel_pmt_crashlog.o
>   obj-$(CONFIG_INTEL_PMT_TELEMETRY)	+= intel_pmt_telemetry.o
>   obj-$(CONFIG_INTEL_PUNIT_IPC)		+= intel_punit_ipc.o
>   obj-$(CONFIG_INTEL_SCU_IPC)		+= intel_scu_ipc.o
> diff --git a/drivers/platform/x86/intel_pmt_crashlog.c b/drivers/platform/x86/intel_pmt_crashlog.c
> new file mode 100644
> index 000000000000..31d43708055c
> --- /dev/null
> +++ b/drivers/platform/x86/intel_pmt_crashlog.c
> @@ -0,0 +1,588 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Intel Platform Monitoring Technology Crashlog driver
> + *
> + * Copyright (c) 2020, Intel Corporation.
> + * All Rights Reserved.
> + *
> + * Authors: "Alexander Duyck" <alexander.h.duyck@linux.intel.com>
> + */
> +
> +#include <linux/cdev.h>
> +#include <linux/idr.h>
> +#include <linux/kernel.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +#include <linux/uaccess.h>
> +
> +#define DRV_NAME		"pmt_crashlog"
> +
> +/* Crashlog access types */
> +#define ACCESS_FUTURE		1
> +#define ACCESS_BARID		2
> +#define ACCESS_LOCAL		3
> +
> +/* Crashlog discovery header types */
> +#define CRASH_TYPE_OOBMSM	1
> +
> +/* Control Flags */
> +#define CRASHLOG_FLAG_DISABLE	BIT(27)
> +#define CRASHLOG_FLAG_CLEAR	BIT(28)
> +#define CRASHLOG_FLAG_EXECUTE	BIT(29)
> +#define CRASHLOG_FLAG_COMPLETE	BIT(31)
> +#define CRASHLOG_FLAG_MASK	GENMASK(31, 28)
> +
> +/* Common Header */
> +#define CONTROL_OFFSET		0x0
> +#define GUID_OFFSET		0x4
> +#define BASE_OFFSET		0x8
> +#define SIZE_OFFSET		0xC
> +#define GET_ACCESS(v)		((v) & GENMASK(3, 0))
> +#define GET_TYPE(v)		(((v) & GENMASK(7, 4)) >> 4)
> +#define GET_VERSION(v)		(((v) & GENMASK(19, 16)) >> 16)
> +
> +#define GET_ADDRESS(v)		((v) & GENMASK(31, 3))
> +#define GET_BIR(v)		((v) & GENMASK(2, 0))
> +
> +static DEFINE_IDA(crashlog_devid_ida);
> +
> +struct crashlog_header {
> +	u32	base_offset;
> +	u32	size;
> +	u32	guid;
> +	u8	bir;
> +	u8	access_type;
> +	u8	crash_type;
> +	u8	version;
> +};
> +
> +struct pmt_crashlog_priv;
> +
> +struct crashlog_entry {
> +	struct pmt_crashlog_priv	*priv;
> +	struct crashlog_header		header;
> +	struct resource			*header_res;
> +	void __iomem			*disc_table;
> +	unsigned long			crashlog_data;
> +	size_t				crashlog_data_size;
> +	struct cdev			cdev;
> +	dev_t				devt;
> +	int				devid;
> +	struct ida			*ida;
> +};
> +
> +struct pmt_crashlog_priv {
> +	struct device		*dev;
> +	struct pci_dev		*parent;
> +	struct crashlog_entry	*entry;
> +	int			num_entries;
> +};
> +
> +/*
> + * I/O
> + */
> +static bool pmt_crashlog_complete(struct crashlog_entry *entry)
> +{
> +	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	/* return current value of the crashlog complete flag */
> +	return !!(control & CRASHLOG_FLAG_COMPLETE);
> +}
> +
> +static bool pmt_crashlog_disabled(struct crashlog_entry *entry)
> +{
> +	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	/* return current value of the crashlog disabled flag */
> +	return !!(control & CRASHLOG_FLAG_DISABLE);
> +}
> +
> +static void pmt_crashlog_set_disable(struct crashlog_entry *entry, bool disable)
> +{
> +	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	/* clear control bits */
> +	control &= ~(CRASHLOG_FLAG_MASK | CRASHLOG_FLAG_DISABLE);
> +	if (disable)
> +		control |= CRASHLOG_FLAG_DISABLE;
> +
> +	writel(control, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +static void pmt_crashlog_set_clear(struct crashlog_entry *entry)
> +{
> +	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	/* clear control bits */
> +	control &= ~CRASHLOG_FLAG_MASK;
> +	control |= CRASHLOG_FLAG_CLEAR;
> +
> +	writel(control, entry->disc_table + CONTROL_OFFSET);
> +}
> +
> +static void pmt_crashlog_set_execute(struct crashlog_entry *entry)
> +{
> +	u32 control = readl(entry->disc_table + CONTROL_OFFSET);
> +
> +	/* clear control bits */
> +	control &= ~CRASHLOG_FLAG_MASK;
> +	control |= CRASHLOG_FLAG_EXECUTE;
> +
> +	writel(control, entry->disc_table + CONTROL_OFFSET);
> +}

These 3 pmt_crashlog_set_* functions are all triggered through
sysfs writes and they all do read-modify-write of the control-register,
so this is racy. You need to add a mutex to protect the r-m-w sequences.


> +
> +/*
> + * devfs
> + */
> +static int pmt_crashlog_open(struct inode *inode, struct file *filp)
> +{
> +	struct crashlog_entry *entry;
> +	struct pci_driver *pci_drv;
> +	struct pmt_crashlog_priv *priv;
> +
> +	if (!capable(CAP_SYS_ADMIN))
> +		return -EPERM;
> +
> +	entry = container_of(inode->i_cdev, struct crashlog_entry, cdev);
> +	priv = entry->priv;
> +	pci_drv = pci_dev_driver(priv->parent);
> +
> +	if (!pci_drv)
> +		return -ENODEV;
> +
> +	filp->private_data = entry;
> +	get_device(&priv->parent->dev);
> +
> +	if (!try_module_get(pci_drv->driver.owner)) {
> +		put_device(&priv->parent->dev);
> +		return -ENODEV;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmt_crashlog_release(struct inode *inode, struct file *filp)
> +{
> +	struct crashlog_entry *entry = filp->private_data;
> +	struct pmt_crashlog_priv *priv;
> +	struct pci_driver *pci_drv;
> +
> +	priv = entry->priv;
> +	pci_drv = pci_dev_driver(priv->parent);
> +
> +	put_device(&priv->parent->dev);
> +	module_put(pci_drv->driver.owner);
> +
> +	return 0;
> +}
> +
> +static int
> +pmt_crashlog_mmap(struct file *filp, struct vm_area_struct *vma)
> +{
> +	struct crashlog_entry *entry = filp->private_data;
> +	struct pmt_crashlog_priv *priv;
> +	unsigned long phys = entry->crashlog_data;
> +	unsigned long pfn = PFN_DOWN(phys);
> +	unsigned long vsize = vma->vm_end - vma->vm_start;
> +	unsigned long psize;
> +
> +	if ((vma->vm_flags & VM_WRITE) ||
> +	    (vma->vm_flags & VM_MAYWRITE))
> +		return -EPERM;
> +
> +	priv = entry->priv;
> +
> +	if (!entry->crashlog_data_size) {
> +		dev_err(priv->dev, "Crashlog data not accessible\n");
> +		return -EAGAIN;
> +	}
> +
> +	psize = (PFN_UP(entry->crashlog_data + entry->crashlog_data_size) - pfn) *
> +		PAGE_SIZE;
> +	if (vsize > psize) {
> +		dev_err(priv->dev, "Requested mmap size is too large\n");
> +		return -EINVAL;
> +	}
> +
> +	vma->vm_page_prot = pgprot_noncached(vma->vm_page_prot);
> +	if (io_remap_pfn_range(vma, vma->vm_start, pfn,
> +		vsize, vma->vm_page_prot))
> +		return -EAGAIN;
> +
> +	return 0;
> +}
> +
> +static const struct file_operations pmt_crashlog_fops = {
> +	.owner =	THIS_MODULE,
> +	.open =		pmt_crashlog_open,
> +	.mmap =		pmt_crashlog_mmap,

mmap but no read, I guess read may be emulated through mmap,
is that the case ?

I can see sysadmins wanting to be able to do a simple cat
on this file to get the logs (including headers), so if
the kernel-core does not emulate read in this case, you
should really add read support I guess.

Also how big are these files ?  sysfs also supports binary
files, so unless these files are huge / this is really
performance critical it may make more sense to just add
a binary sysfs attr for this and get rid of the whole chardev
all together.


> +	.release =	pmt_crashlog_release,
> +};
> +
> +/*
> + * sysfs
> + */
> +static ssize_t
> +guid_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *entry;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "0x%x\n", entry->header.guid);
> +}
> +static DEVICE_ATTR_RO(guid);
> +
> +static ssize_t size_show(struct device *dev, struct device_attribute *attr,
> +			 char *buf)
> +{
> +	struct crashlog_entry *entry;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", entry->crashlog_data_size);
> +}
> +static DEVICE_ATTR_RO(size);
> +
> +static ssize_t
> +offset_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *entry;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	return sprintf(buf, "%lu\n", offset_in_page(entry->crashlog_data));
> +}
> +static DEVICE_ATTR_RO(offset);
> +
> +static ssize_t
> +enable_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *entry;
> +	int enabled;
> +
> +	entry = dev_get_drvdata(dev);
> +	enabled = !pmt_crashlog_disabled(entry);
> +
> +	return sprintf(buf, "%d\n", enabled);
> +}
> +
> +static ssize_t
> +enable_store(struct device *dev, struct device_attribute *attr,
> +	    const char *buf, size_t count)
> +{
> +	struct crashlog_entry *entry;
> +	bool enabled;
> +	int result;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &enabled);
> +	if (result)
> +		return result;
> +
> +	pmt_crashlog_set_disable(entry, !enabled);
> +
> +	return strnlen(buf, count);
> +}
> +static DEVICE_ATTR_RW(enable);
> +
> +static ssize_t
> +trigger_show(struct device *dev, struct device_attribute *attr, char *buf)
> +{
> +	struct crashlog_entry *entry;
> +	int trigger;
> +
> +	entry = dev_get_drvdata(dev);
> +	trigger = pmt_crashlog_complete(entry);
> +
> +	return sprintf(buf, "%d\n", trigger);
> +}
> +
> +static ssize_t
> +trigger_store(struct device *dev, struct device_attribute *attr,
> +	    const char *buf, size_t count)
> +{
> +	struct crashlog_entry *entry;
> +	bool trigger;
> +	int result;
> +
> +	entry = dev_get_drvdata(dev);
> +
> +	result = kstrtobool(buf, &trigger);
> +	if (result)
> +		return result;
> +
> +	if (trigger) {
> +		/* we cannot trigger a new crash if one is still pending */
> +		if (pmt_crashlog_complete(entry))
> +			return -EEXIST;
> +
> +		/* if device is currently disabled, return busy */
> +		if (pmt_crashlog_disabled(entry))
> +			return -EBUSY;
> +
> +		pmt_crashlog_set_execute(entry);
> +	} else {
> +		pmt_crashlog_set_clear(entry);
> +	}
> +
> +	return strnlen(buf, count);
> +}
> +static DEVICE_ATTR_RW(trigger);
> +
> +static struct attribute *pmt_crashlog_attrs[] = {
> +	&dev_attr_guid.attr,
> +	&dev_attr_size.attr,
> +	&dev_attr_offset.attr,
> +	&dev_attr_enable.attr,
> +	&dev_attr_trigger.attr,
> +	NULL
> +};
> +ATTRIBUTE_GROUPS(pmt_crashlog);
> +
> +static struct class pmt_crashlog_class = {
> +	.name = "pmt_crashlog",
> +	.owner = THIS_MODULE,
> +	.dev_groups = pmt_crashlog_groups,
> +};
> +
> +/*
> + * initialization
> + */
> +static int pmt_crashlog_make_dev(struct pmt_crashlog_priv *priv,
> +				 struct crashlog_entry *entry)
> +{
> +	struct device *dev;
> +	int ret;
> +
> +	ret = alloc_chrdev_region(&entry->devt, 0, 1, DRV_NAME);
> +	if (ret < 0) {
> +		dev_err(priv->dev, "alloc_chrdev_region err: %d\n", ret);
> +		return ret;
> +	}
> +
> +	/* Create a character device for Samplers */
> +	cdev_init(&entry->cdev, &pmt_crashlog_fops);
> +
> +	ret = cdev_add(&entry->cdev, entry->devt, 1);
> +	if (ret) {
> +		dev_err(priv->dev, "Could not add char dev\n");
> +		return ret;
> +	}
> +
> +	dev = device_create(&pmt_crashlog_class, &priv->parent->dev, entry->devt,
> +			    entry, "%s%d", "crashlog", entry->devid);
> +
> +	if (IS_ERR(dev)) {
> +		dev_err(priv->dev, "Could not create device node\n");
> +		cdev_del(&entry->cdev);
> +	}
> +
> +	return PTR_ERR_OR_ZERO(dev);
> +}
> +
> +static void
> +pmt_crashlog_populate_header(void __iomem *disc_offset,
> +			     struct crashlog_header *header)
> +{
> +	u32 discovery_header = readl(disc_offset);
> +
> +	header->access_type = GET_ACCESS(discovery_header);
> +	header->crash_type = GET_TYPE(discovery_header);
> +	header->version = GET_VERSION(discovery_header);
> +	header->guid = readl(disc_offset + GUID_OFFSET);
> +	header->base_offset = readl(disc_offset + BASE_OFFSET);
> +
> +	/*
> +	 * For non-local access types the lower 3 bits of base offset
> +	 * contains the index of the base address register where the
> +	 * crashlogetry can be found.
> +	 */
> +	header->bir = GET_BIR(header->base_offset);
> +	header->base_offset ^= header->bir;
> +
> +	/* Size is measured in DWORDs */
> +	header->size = readl(disc_offset + SIZE_OFFSET);
> +}
> +
> +static int pmt_crashlog_add_entry(struct pmt_crashlog_priv *priv,
> +				  struct crashlog_entry *entry)
> +{
> +	struct resource *res = entry->header_res;
> +	int ret;
> +
> +	pmt_crashlog_populate_header(entry->disc_table, &entry->header);
> +
> +	/* Local access and BARID only for now */
> +	switch (entry->header.access_type) {
> +	case ACCESS_LOCAL:
> +		dev_info(priv->dev, "access_type: LOCAL\n");
> +		if (entry->header.bir) {
> +			dev_err(priv->dev,
> +				"Unsupported BAR index %d for access type %d\n",
> +				entry->header.bir, entry->header.access_type);
> +			return -EINVAL;
> +		}
> +
> +		entry->crashlog_data = res->start + resource_size(res) +
> +				       entry->header.base_offset;
> +		break;
> +
> +	case ACCESS_BARID:
> +		dev_info(priv->dev, "access_type: BARID\n");
> +		entry->crashlog_data =
> +			priv->parent->resource[entry->header.bir].start +
> +			entry->header.base_offset;
> +		break;
> +
> +	default:
> +		dev_err(priv->dev, "Unsupported access type %d\n",
> +			entry->header.access_type);
> +		return -EINVAL;
> +	}
> +
> +	dev_info(priv->dev, "crashlod_data address: 0x%lx\n", entry->crashlog_data);
> +
> +	entry->crashlog_data_size = entry->header.size * 4;
> +
> +	if (entry->header.crash_type != CRASH_TYPE_OOBMSM) {
> +		dev_err(priv->dev, "Unsupported crashlog header type %d\n",
> +			entry->header.crash_type);
> +		return -EINVAL;
> +	}
> +
> +	if (entry->header.version != 0) {
> +		dev_err(priv->dev, "Unsupported version value %d\n",
> +			entry->header.version);
> +		return -EINVAL;
> +	}
> +
> +	entry->ida = &crashlog_devid_ida;
> +
> +	entry->devid = ida_simple_get(entry->ida, 0, 0, GFP_KERNEL);
> +	if (entry->devid < 0)
> +		return entry->devid;
> +
> +	ret = pmt_crashlog_make_dev(priv, entry);
> +	if (ret) {
> +		ida_simple_remove(entry->ida, entry->devid);
> +		return ret;
> +	}

Hmm wait, you are making one chardev per log entry ? Then just using
binary sysfs attributes seems to make even more sense to me.

> +
> +	return 0;
> +}
> +
> +static void pmt_crashlog_remove_entries(struct pmt_crashlog_priv *priv)
> +{
> +	int i;
> +
> +	for (i = 0; i < priv->num_entries; i++) {
> +		device_destroy(&pmt_crashlog_class, priv->entry[i].devt);
> +		cdev_del(&priv->entry[i].cdev);
> +
> +		unregister_chrdev_region(priv->entry[i].devt, 1);
> +		ida_simple_remove(priv->entry[i].ida, priv->entry[i].devid);
> +	}
> +}
> +static int pmt_crashlog_probe(struct platform_device *pdev)
> +{
> +	struct pmt_crashlog_priv *priv;
> +	struct crashlog_entry *entry;
> +	int i;
> +
> +	priv = devm_kzalloc(&pdev->dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, priv);
> +	priv->dev = &pdev->dev;
> +	priv->parent  = to_pci_dev(priv->dev->parent);
> +
> +	priv->entry = devm_kcalloc(&pdev->dev, pdev->num_resources,
> +				   sizeof(*(priv->entry)), GFP_KERNEL);
> +
> +	for (i = 0, entry = priv->entry; i < pdev->num_resources;
> +	     i++, entry++) {
> +		int ret;
> +
> +		entry->header_res = platform_get_resource(pdev, IORESOURCE_MEM,
> +							  i);
> +		if (!entry->header_res) {
> +			pmt_crashlog_remove_entries(priv);
> +			return -ENODEV;
> +		}
> +
> +		dev_info(&pdev->dev, "%d res start: 0x%llx, end 0x%llx\n", i,
> +			 entry->header_res->start, entry->header_res->end);
> +
> +		entry->disc_table = devm_platform_ioremap_resource(pdev, i);
> +		if (IS_ERR(entry->disc_table)) {
> +			pmt_crashlog_remove_entries(priv);
> +			return PTR_ERR(entry->disc_table);
> +		}
> +
> +		ret = pmt_crashlog_add_entry(priv, entry);
> +		if (ret) {
> +			pmt_crashlog_remove_entries(priv);
> +			return ret;
> +		}
> +
> +		entry->priv = priv;
> +		priv->num_entries++;
> +	}
> +
> +	return 0;
> +}
> +
> +static int pmt_crashlog_remove(struct platform_device *pdev)
> +{
> +	struct pmt_crashlog_priv *priv;
> +
> +	priv = (struct pmt_crashlog_priv *)platform_get_drvdata(pdev);
> +
> +	pmt_crashlog_remove_entries(priv);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver pmt_crashlog_driver = {
> +	.driver = {
> +		.name   = DRV_NAME,
> +	},
> +	.probe  = pmt_crashlog_probe,
> +	.remove = pmt_crashlog_remove,
> +};
> +
> +static int __init pmt_crashlog_init(void)
> +{
> +	int ret = class_register(&pmt_crashlog_class);
> +
> +	if (ret)
> +		return ret;
> +
> +	ret = platform_driver_register(&pmt_crashlog_driver);
> +	if (ret) {
> +		class_unregister(&pmt_crashlog_class);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
> +static void __exit pmt_crashlog_exit(void)
> +{
> +	platform_driver_unregister(&pmt_crashlog_driver);
> +	class_unregister(&pmt_crashlog_class);
> +	ida_destroy(&crashlog_devid_ida);
> +}
> +
> +module_init(pmt_crashlog_init);
> +module_exit(pmt_crashlog_exit);
> +
> +MODULE_AUTHOR("Alexander Duyck <alexander.h.duyck@linux.intel.com>");
> +MODULE_DESCRIPTION("Intel PMT Crashlog driver");
> +MODULE_ALIAS("platform:" DRV_NAME);
> +MODULE_LICENSE("GPL v2");
> 

Regards,

Hans

