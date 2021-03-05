Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C077832EDA5
	for <lists+platform-driver-x86@lfdr.de>; Fri,  5 Mar 2021 16:05:01 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229651AbhCEPE3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 5 Mar 2021 10:04:29 -0500
Received: from mail.kernel.org ([198.145.29.99]:42682 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230093AbhCEPED (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 5 Mar 2021 10:04:03 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 9191465013;
        Fri,  5 Mar 2021 15:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1614956642;
        bh=3yNzmedyazy+pxnYdAvRcPE4D0nB2OWz6uHDZ3HUJ3M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=DjAlk149Ir87jBvjJsAzCSa20QAjiL70aZUhpfZXcSr6Fnith515rA0VzYWUrzkrY
         ldp6muDOaA4SyNqzYcA/Xfb9/rjWbecj9zy+Z7QKoBJbHCGGaXyy/j3CdtN8AriEnn
         naLZdnbjVgbDqXMFHkpBfpCBXQvxoMATCqvywl8kx2Id3NtKa2D7CX+yspFOyiiTaM
         ZIqR/Ag3AQxpRsEySkMtsSOQ3o8wuldr1hrn8bGrLae1RtqNc/ij8G3IdB7/NksDcD
         gw6TGsAfwxxmhH6Kw8h03LML0VcnE3kxNU6kHNuM3cOLFRuxIHoqV+rr1gE78bJStY
         INtWqkT5fnrcg==
Received: by pali.im (Postfix)
        id 581F313AB; Fri,  5 Mar 2021 16:04:00 +0100 (CET)
Date:   Fri, 5 Mar 2021 16:04:00 +0100
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        Divya Bharathi <divya.bharathi@dell.com>,
        Prasanth Ksr <prasanth.ksr@dell.com>,
        Matthew Garrett <mjg59@srcf.ucam.org>,
        Jithu Joseph <jithu.joseph@intel.com>,
        Maurice Ma <maurice.ma@intel.com>,
        platform-driver-x86@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH] platform/x86: wmi: Make remove callback return void
Message-ID: <20210305150400.bfw3vnbs2s6fzi64@pali>
References: <20210301160404.1677064-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210301160404.1677064-1-u.kleine-koenig@pengutronix.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Monday 01 March 2021 17:04:04 Uwe Kleine-König wrote:
> The driver core ignores the return value of struct bus_type::remove()
> (and so wmi_dev_remove()) because there is only little that can be done.
> 
> To simplify the quest to make this function return void, let struct
> wmi_driver::remove() return void, too. All implementers of this callback
> return 0 already and this way it should be obvious to driver authors
> that returning an error code is a bad idea.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Looks good,

Reviewed-by: Pali Rohár <pali@kernel.org>

> ---
>  drivers/platform/x86/dell/dell-smbios-wmi.c                  | 3 +--
>  drivers/platform/x86/dell/dell-wmi-descriptor.c              | 3 +--
>  .../platform/x86/dell/dell-wmi-sysman/biosattr-interface.c   | 3 +--
>  .../x86/dell/dell-wmi-sysman/passwordattr-interface.c        | 3 +--
>  drivers/platform/x86/dell/dell-wmi.c                         | 3 +--
>  drivers/platform/x86/intel-wmi-sbl-fw-update.c               | 3 +--
>  drivers/platform/x86/intel-wmi-thunderbolt.c                 | 3 +--
>  drivers/platform/x86/wmi-bmof.c                              | 3 +--
>  drivers/platform/x86/wmi.c                                   | 5 ++---
>  include/linux/wmi.h                                          | 2 +-
>  10 files changed, 11 insertions(+), 20 deletions(-)
> 
> diff --git a/drivers/platform/x86/dell/dell-smbios-wmi.c b/drivers/platform/x86/dell/dell-smbios-wmi.c
> index 27a298b7c541..a1753485159c 100644
> --- a/drivers/platform/x86/dell/dell-smbios-wmi.c
> +++ b/drivers/platform/x86/dell/dell-smbios-wmi.c
> @@ -205,7 +205,7 @@ static int dell_smbios_wmi_probe(struct wmi_device *wdev, const void *context)
>  	return ret;
>  }
>  
> -static int dell_smbios_wmi_remove(struct wmi_device *wdev)
> +static void dell_smbios_wmi_remove(struct wmi_device *wdev)
>  {
>  	struct wmi_smbios_priv *priv = dev_get_drvdata(&wdev->dev);
>  	int count;
> @@ -218,7 +218,6 @@ static int dell_smbios_wmi_remove(struct wmi_device *wdev)
>  	count = get_order(priv->req_buf_size);
>  	free_pages((unsigned long)priv->buf, count);
>  	mutex_unlock(&call_mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id dell_smbios_wmi_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-descriptor.c b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> index a068900ae8a1..3c4af7c08bb1 100644
> --- a/drivers/platform/x86/dell/dell-wmi-descriptor.c
> +++ b/drivers/platform/x86/dell/dell-wmi-descriptor.c
> @@ -174,14 +174,13 @@ static int dell_wmi_descriptor_probe(struct wmi_device *wdev,
>  	return ret;
>  }
>  
> -static int dell_wmi_descriptor_remove(struct wmi_device *wdev)
> +static void dell_wmi_descriptor_remove(struct wmi_device *wdev)
>  {
>  	struct descriptor_priv *priv = dev_get_drvdata(&wdev->dev);
>  
>  	mutex_lock(&list_mutex);
>  	list_del(&priv->list);
>  	mutex_unlock(&list_mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id dell_wmi_descriptor_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> index f95d8ddace5a..c2dd2de6bc20 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/biosattr-interface.c
> @@ -152,12 +152,11 @@ static int bios_attr_set_interface_probe(struct wmi_device *wdev, const void *co
>  	return 0;
>  }
>  
> -static int bios_attr_set_interface_remove(struct wmi_device *wdev)
> +static void bios_attr_set_interface_remove(struct wmi_device *wdev)
>  {
>  	mutex_lock(&wmi_priv.mutex);
>  	wmi_priv.bios_attr_wdev = NULL;
>  	mutex_unlock(&wmi_priv.mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id bios_attr_set_interface_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> index 5780b4d94759..339a082d6c18 100644
> --- a/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> +++ b/drivers/platform/x86/dell/dell-wmi-sysman/passwordattr-interface.c
> @@ -119,12 +119,11 @@ static int bios_attr_pass_interface_probe(struct wmi_device *wdev, const void *c
>  	return 0;
>  }
>  
> -static int bios_attr_pass_interface_remove(struct wmi_device *wdev)
> +static void bios_attr_pass_interface_remove(struct wmi_device *wdev)
>  {
>  	mutex_lock(&wmi_priv.mutex);
>  	wmi_priv.password_attr_wdev = NULL;
>  	mutex_unlock(&wmi_priv.mutex);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id bios_attr_pass_interface_id_table[] = {
> diff --git a/drivers/platform/x86/dell/dell-wmi.c b/drivers/platform/x86/dell/dell-wmi.c
> index bbdb3e860892..5e1b7f897df5 100644
> --- a/drivers/platform/x86/dell/dell-wmi.c
> +++ b/drivers/platform/x86/dell/dell-wmi.c
> @@ -714,10 +714,9 @@ static int dell_wmi_probe(struct wmi_device *wdev, const void *context)
>  	return dell_wmi_input_setup(wdev);
>  }
>  
> -static int dell_wmi_remove(struct wmi_device *wdev)
> +static void dell_wmi_remove(struct wmi_device *wdev)
>  {
>  	dell_wmi_input_destroy(wdev);
> -	return 0;
>  }
>  static const struct wmi_device_id dell_wmi_id_table[] = {
>  	{ .guid_string = DELL_EVENT_GUID },
> diff --git a/drivers/platform/x86/intel-wmi-sbl-fw-update.c b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> index ea87fa0786e8..3c86e0108a24 100644
> --- a/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> +++ b/drivers/platform/x86/intel-wmi-sbl-fw-update.c
> @@ -117,10 +117,9 @@ static int intel_wmi_sbl_fw_update_probe(struct wmi_device *wdev,
>  	return 0;
>  }
>  
> -static int intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
> +static void intel_wmi_sbl_fw_update_remove(struct wmi_device *wdev)
>  {
>  	dev_info(&wdev->dev, "Slim Bootloader signaling driver removed\n");
> -	return 0;
>  }
>  
>  static const struct wmi_device_id intel_wmi_sbl_id_table[] = {
> diff --git a/drivers/platform/x86/intel-wmi-thunderbolt.c b/drivers/platform/x86/intel-wmi-thunderbolt.c
> index 974c22a7ff61..4ae87060d18b 100644
> --- a/drivers/platform/x86/intel-wmi-thunderbolt.c
> +++ b/drivers/platform/x86/intel-wmi-thunderbolt.c
> @@ -66,11 +66,10 @@ static int intel_wmi_thunderbolt_probe(struct wmi_device *wdev,
>  	return ret;
>  }
>  
> -static int intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
> +static void intel_wmi_thunderbolt_remove(struct wmi_device *wdev)
>  {
>  	sysfs_remove_group(&wdev->dev.kobj, &tbt_attribute_group);
>  	kobject_uevent(&wdev->dev.kobj, KOBJ_CHANGE);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id intel_wmi_thunderbolt_id_table[] = {
> diff --git a/drivers/platform/x86/wmi-bmof.c b/drivers/platform/x86/wmi-bmof.c
> index 66b434d6307f..80137afb9753 100644
> --- a/drivers/platform/x86/wmi-bmof.c
> +++ b/drivers/platform/x86/wmi-bmof.c
> @@ -86,13 +86,12 @@ static int wmi_bmof_probe(struct wmi_device *wdev, const void *context)
>  	return ret;
>  }
>  
> -static int wmi_bmof_remove(struct wmi_device *wdev)
> +static void wmi_bmof_remove(struct wmi_device *wdev)
>  {
>  	struct bmof_priv *priv = dev_get_drvdata(&wdev->dev);
>  
>  	sysfs_remove_bin_file(&wdev->dev.kobj, &priv->bmof_bin_attr);
>  	kfree(priv->bmofdata);
> -	return 0;
>  }
>  
>  static const struct wmi_device_id wmi_bmof_id_table[] = {
> diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
> index c669676ea8e8..aa9bd2ee7390 100644
> --- a/drivers/platform/x86/wmi.c
> +++ b/drivers/platform/x86/wmi.c
> @@ -986,7 +986,6 @@ static int wmi_dev_remove(struct device *dev)
>  	struct wmi_block *wblock = dev_to_wblock(dev);
>  	struct wmi_driver *wdriver =
>  		container_of(dev->driver, struct wmi_driver, driver);
> -	int ret = 0;
>  
>  	if (wdriver->filter_callback) {
>  		misc_deregister(&wblock->char_dev);
> @@ -995,12 +994,12 @@ static int wmi_dev_remove(struct device *dev)
>  	}
>  
>  	if (wdriver->remove)
> -		ret = wdriver->remove(dev_to_wdev(dev));
> +		wdriver->remove(dev_to_wdev(dev));
>  
>  	if (ACPI_FAILURE(wmi_method_enable(wblock, 0)))
>  		dev_warn(dev, "failed to disable device\n");
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static struct class wmi_bus_class = {
> diff --git a/include/linux/wmi.h b/include/linux/wmi.h
> index 8ef7e7faea1e..2cb3913c1f50 100644
> --- a/include/linux/wmi.h
> +++ b/include/linux/wmi.h
> @@ -37,7 +37,7 @@ struct wmi_driver {
>  	const struct wmi_device_id *id_table;
>  
>  	int (*probe)(struct wmi_device *wdev, const void *context);
> -	int (*remove)(struct wmi_device *wdev);
> +	void (*remove)(struct wmi_device *wdev);
>  	void (*notify)(struct wmi_device *device, union acpi_object *data);
>  	long (*filter_callback)(struct wmi_device *wdev, unsigned int cmd,
>  				struct wmi_ioctl_buffer *arg);
> -- 
> 2.30.0
> 
