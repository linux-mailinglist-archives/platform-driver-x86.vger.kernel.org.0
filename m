Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 357C318BED1
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Mar 2020 18:54:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgCSRyt (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Mar 2020 13:54:49 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43600 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726934AbgCSRyt (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Mar 2020 13:54:49 -0400
Received: by mail-pg1-f195.google.com with SMTP id u12so1649423pgb.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 19 Mar 2020 10:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=WZUkTgUkcAa/tBBLrE0tWPL0RyWAxIwy8JurbkbC3F8=;
        b=pHY8jMFt1Ekn0wX+ddYqWL22rSPZMM7zLUoQ285nY76NrYjy4bvj9IAGyQQT7gdIT5
         pL31eCEmr0BvjHIEikARTyMi27U8Txpi5hnwZK3BVyvHe9TZpnjSAGyjBwyU/eSDQtz5
         pZ/bAIowdqG5mJdPXhLlhA1BpHQ5wkdEX3cjzGPL9jmeRjodDbk3191V1D6jdsuxArtp
         SevPSc/PqXv83AqWyP41nI3RiMquE7VNB2rc7K/H1isAM9TVbpIRwPX/WWD7kMgK/7Pi
         ZpbXalOPhVWQYkuZasINGLVuz52mT3pikDLfz6TVAG1z0m5jlbqJxzCyDOspT8ZvgbUK
         bJiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=WZUkTgUkcAa/tBBLrE0tWPL0RyWAxIwy8JurbkbC3F8=;
        b=Yikp53L8DGIpy4ny80CpTy9ynlikhP0mb1zJBw7556z1oz8b5bonCfpLzeUeFD2FtW
         5zj4bwFyvc4LzupNRUELn5+bqhEdtbOEWKTXcbQ8sDyaPOeY9SQzw5gt4RA8nX1kH72T
         KgjKsGg3aAhzyEREXDsR9eeexlxSxtcHHguZwCRKqAKTf5qKKYxte3tHDy/Nxv8WFpVq
         zTwuuXBOjexdadRVzmxSeXTLZUIDII5vTWXDlmk76YATYkofQkMZoscfex6wd1EvOUDI
         LhWQvCUsBcEnHQMe+UvmhALkc38WAM7P+ZM0iHCMOiZitu2zAaUExHSmKiX6sTdh8BKj
         +3tg==
X-Gm-Message-State: ANhLgQ3E2XxPLLrEGyJJGvUqRGe/JchOmCnAClT2C5gFkZGCQE+jNVxs
        CaRXL3yCHThWhykJ2/lykPj/sNHcLsa/sYPKliuu1mm0
X-Google-Smtp-Source: ADFU+vsbe5iL4/shEFiB1rzMyGh1ZPy/ostKxbalFlvVnNDVj+1DopNbDWQ013uyok3RBcgUcSBHMUC/XVWG9uS8gLU=
X-Received: by 2002:a63:5859:: with SMTP id i25mr4378548pgm.74.1584640486864;
 Thu, 19 Mar 2020 10:54:46 -0700 (PDT)
MIME-Version: 1.0
References: <a53f7cc8-a054-4afb-b8d6-a318347614c5@www.fastmail.com>
In-Reply-To: <a53f7cc8-a054-4afb-b8d6-a318347614c5@www.fastmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Thu, 19 Mar 2020 19:54:39 +0200
Message-ID: <CAHp75VeiYE3sPtNEw+uLAwyhx6RBd-MHK1Y=XTxD99YHKRG2TA@mail.gmail.com>
Subject: Re: [PATCH] [v4] platform/x86: surface3_power: MSHW0011 rev-eng implementation
To:     =?UTF-8?Q?Bla=C5=BE_Hrastnik?= <blaz@mxxn.io>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, Mar 19, 2020 at 5:08 AM Bla=C5=BE Hrastnik <blaz@mxxn.io> wrote:
>
> I'm resubmitting this patch with review feedback addressed:

Thank you for an update!

Unfortunately it does not apply to our for-next branch. Care to rebase?

>
> https://patchwork.kernel.org/patch/10584079/
>
> The patch was previously not resubmitted because it required a change
> that was reverted in the ACPICA. That has since been corrected:
>
> https://github.com/acpica/acpica/commit/9159c09a2a5897a43f78c95cdffc160d3=
99722c3
>
> We've been using this patch for a while and user reports confirm that it
> works:
>
> https://github.com/linux-surface/linux-surface
>
> Previous description follows.
>
> ---
>
> The MSHW0011 device is a chip that replaces the battery firmware
> by using ACPI operation regions on the Surface 3.
> It is unclear whether or not the chip will be reused somewhere else
> (under Windows, the chip is called "Surface Platform Power Driver"
> and the driver is provided by Microsoft).
>
> The values have been obtained by reverse engineering, and are subject to
> errors. Looks like it works on overall pretty well.
>
> I couldn't manage to get the IRQ correctly triggered, so I am using a
> good old polling thread to check for changes. This is something
> to be fixed in a later version.
>
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=3D106231
>
> Signed-off-by: Bla=C5=BE Hrastnik <blaz@mxxn.io>
> Signed-off-by: Benjamin Tissoires <benjamin.tissoires@redhat.com>
> Signed-off-by: Stephen Just <stephenjust@gmail.com>
> ---
>
> changes in v2:
> - moved to drivers/acpi/ instead of power
> - use uuid_le
> - fix uper/lower case
> - print_hex_dump() used in mshw0011_dump_registers() instead of custom du=
mp
> - removed "MSHW0011:00" in mshw0011_id
>
> changes in v3:
> - remove le16_to_cpu() after i2c_smbus_read_word_data() as it already
>   handles it properly
> - use i2c_acpi_new_device() to remove a bunch of duplicated code from I2C
>   core.
> - move the driver in platform/x86
> - add depends ACPI && I2C in Kconfig
> - remove the dump registers facility, as it's debugging only
> - use of BIT() in MSHW0011 defs
> - use of guid_t
> - remove useless ret =3D 0
> - use probe_new()
> - remove empty .id_table
> - removed mshw0011_i2c_read_block() and use directly
>   i2c_smbus_read_i2c_block_data()
> - use snprintf() instead of custom memcpy()
> - renamed the 'version' as 'mask'
> - use SPDX license identifier
>
> changes in v4:
> - address review feedback
> ---
>  drivers/platform/x86/Kconfig          |   7 +
>  drivers/platform/x86/Makefile         |   1 +
>  drivers/platform/x86/surface3_power.c | 599 ++++++++++++++++++++++++++
>  3 files changed, 607 insertions(+)
>  create mode 100644 drivers/platform/x86/surface3_power.c
>
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 27d5b40fb717..96c516d1f0cd 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -1212,6 +1212,13 @@ config SURFACE_3_BUTTON
>         ---help---
>           This driver handles the power/home/volume buttons on the Micros=
oft Surface 3 tablet.
>
> +config SURFACE_3_POWER_OPREGION
> +       tristate "Surface 3 battery platform operation region support"
> +       depends on ACPI && I2C
> +       help
> +          This driver provides support for ACPI operation
> +         region of the Surface 3 battery platform driver.
> +
>  config INTEL_PUNIT_IPC
>         tristate "Intel P-Unit IPC Driver"
>         ---help---
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefil=
e
> index 42d85a00be4e..d707a8edd738 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -89,6 +89,7 @@ obj-$(CONFIG_INTEL_PMC_IPC)   +=3D intel_pmc_ipc.o
>  obj-$(CONFIG_TOUCHSCREEN_DMI)  +=3D touchscreen_dmi.o
>  obj-$(CONFIG_SURFACE_PRO3_BUTTON)      +=3D surfacepro3_button.o
>  obj-$(CONFIG_SURFACE_3_BUTTON) +=3D surface3_button.o
> +obj-$(CONFIG_SURFACE_3_POWER_OPREGION) +=3D surface3_power.o
>  obj-$(CONFIG_INTEL_PUNIT_IPC)  +=3D intel_punit_ipc.o
>  obj-$(CONFIG_INTEL_BXTWC_PMIC_TMU)     +=3D intel_bxtwc_tmu.o
>  obj-$(CONFIG_INTEL_TELEMETRY)  +=3D intel_telemetry_core.o \
> diff --git a/drivers/platform/x86/surface3_power.c b/drivers/platform/x86=
/surface3_power.c
> new file mode 100644
> index 000000000000..2e0e16b984a0
> --- /dev/null
> +++ b/drivers/platform/x86/surface3_power.c
> @@ -0,0 +1,599 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Supports for the power IC on the Surface 3 tablet.
> + *
> + * (C) Copyright 2016-2018 Red Hat, Inc
> + * (C) Copyright 2016-2018 Benjamin Tissoires <benjamin.tissoires@gmail.=
com>
> + * (C) Copyright 2016 Stephen Just <stephenjust@gmail.com>
> + *
> + * This driver has been reverse-engineered by parsing the DSDT of the Su=
rface 3
> + * and looking at the registers of the chips.
> + *
> + * The DSDT allowed to find out that:
> + * - the driver is required for the ACPI BAT0 device to communicate to t=
he chip
> + *   through an operation region.
> + * - the various defines for the operation region functions to communica=
te with
> + *   this driver
> + * - the DSM 3f99e367-6220-4955-8b0f-06ef2ae79412 allows to trigger ACPI
> + *   events to BAT0 (the code is all available in the DSDT).
> + *
> + * Further findings regarding the 2 chips declared in the MSHW0011 are:
> + * - there are 2 chips declared:
> + *   . 0x22 seems to control the ADP1 line status (and probably the char=
ger)
> + *   . 0x55 controls the battery directly
> + * - the battery chip uses a SMBus protocol (using plain SMBus allows no=
n
> + *   destructive commands):
> + *   . the commands/registers used are in the range 0x00..0x7F
> + *   . if bit 8 (0x80) is set in the SMBus command, the returned value i=
s the
> + *     same as when it is not set. There is a high chance this bit is th=
e
> + *     read/write
> + *   . the various registers semantic as been deduced by observing the r=
egister
> + *     dumps.
> + */
> +
> +#include <linux/acpi.h>
> +#include <linux/freezer.h>
> +#include <linux/i2c.h>
> +#include <linux/kernel.h>
> +#include <linux/kthread.h>
> +#include <linux/slab.h>
> +#include <linux/uuid.h>
> +#include <asm/unaligned.h>
> +
> +#define POLL_INTERVAL          (2 * HZ)
> +#define SURFACE_3_STRLEN 10
> +
> +struct mshw0011_data {
> +       struct i2c_client       *adp1;
> +       struct i2c_client       *bat0;
> +       unsigned short          notify_mask;
> +       struct task_struct      *poll_task;
> +       bool                    kthread_running;
> +
> +       bool                    charging;
> +       bool                    bat_charging;
> +       u8                      trip_point;
> +       s32                     full_capacity;
> +};
> +
> +struct mshw0011_lookup {
> +       struct mshw0011_data    *cdata;
> +       unsigned int            n;
> +       unsigned int            index;
> +       int                     addr;
> +};
> +
> +struct mshw0011_handler_data {
> +       struct acpi_connection_info     info;
> +       struct i2c_client               *client;
> +};
> +
> +struct bix {
> +       u32     revision;
> +       u32     power_unit;
> +       u32     design_capacity;
> +       u32     last_full_charg_capacity;
> +       u32     battery_technology;
> +       u32     design_voltage;
> +       u32     design_capacity_of_warning;
> +       u32     design_capacity_of_low;
> +       u32     cycle_count;
> +       u32     measurement_accuracy;
> +       u32     max_sampling_time;
> +       u32     min_sampling_time;
> +       u32     max_average_interval;
> +       u32     min_average_interval;
> +       u32     battery_capacity_granularity_1;
> +       u32     battery_capacity_granularity_2;
> +       char    model[SURFACE_3_STRLEN];
> +       char    serial[SURFACE_3_STRLEN];
> +       char    type[SURFACE_3_STRLEN];
> +       char    OEM[SURFACE_3_STRLEN];
> +} __packed;
> +
> +struct bst {
> +       u32     battery_state;
> +       s32     battery_present_rate;
> +       u32     battery_remaining_capacity;
> +       u32     battery_present_voltage;
> +} __packed;
> +
> +struct gsb_command {
> +       u8      arg0;
> +       u8      arg1;
> +       u8      arg2;
> +} __packed;
> +
> +struct gsb_buffer {
> +       u8      status;
> +       u8      len;
> +       u8      ret;
> +       union {
> +               struct gsb_command      cmd;
> +               struct bst              bst;
> +               struct bix              bix;
> +       } __packed;
> +} __packed;
> +
> +#define ACPI_BATTERY_STATE_DISCHARGING BIT(0)
> +#define ACPI_BATTERY_STATE_CHARGING    BIT(1)
> +#define ACPI_BATTERY_STATE_CRITICAL    BIT(2)
> +
> +#define MSHW0011_CMD_DEST_BAT0         0x01
> +#define MSHW0011_CMD_DEST_ADP1         0x03
> +
> +#define MSHW0011_CMD_BAT0_STA          0x01
> +#define MSHW0011_CMD_BAT0_BIX          0x02
> +#define MSHW0011_CMD_BAT0_BCT          0x03
> +#define MSHW0011_CMD_BAT0_BTM          0x04
> +#define MSHW0011_CMD_BAT0_BST          0x05
> +#define MSHW0011_CMD_BAT0_BTP          0x06
> +#define MSHW0011_CMD_ADP1_PSR          0x07
> +#define MSHW0011_CMD_BAT0_PSOC         0x09
> +#define MSHW0011_CMD_BAT0_PMAX         0x0a
> +#define MSHW0011_CMD_BAT0_PSRC         0x0b
> +#define MSHW0011_CMD_BAT0_CHGI         0x0c
> +#define MSHW0011_CMD_BAT0_ARTG         0x0d
> +
> +#define MSHW0011_NOTIFY_GET_VERSION    0x00
> +#define MSHW0011_NOTIFY_ADP1           0x01
> +#define MSHW0011_NOTIFY_BAT0_BST       0x02
> +#define MSHW0011_NOTIFY_BAT0_BIX       0x05
> +
> +#define MSHW0011_ADP1_REG_PSR          0x04
> +
> +#define MSHW0011_BAT0_REG_CAPACITY             0x0c
> +#define MSHW0011_BAT0_REG_FULL_CHG_CAPACITY    0x0e
> +#define MSHW0011_BAT0_REG_DESIGN_CAPACITY      0x40
> +#define MSHW0011_BAT0_REG_VOLTAGE      0x08
> +#define MSHW0011_BAT0_REG_RATE         0x14
> +#define MSHW0011_BAT0_REG_OEM          0x45
> +#define MSHW0011_BAT0_REG_TYPE         0x4e
> +#define MSHW0011_BAT0_REG_SERIAL_NO    0x56
> +#define MSHW0011_BAT0_REG_CYCLE_CNT    0x6e
> +
> +#define MSHW0011_EV_2_5_MASK           GENMASK(8, 0)
> +
> +static const guid_t mshw0011_guid =3D
> +       GUID_INIT(0x3F99E367, 0x6220, 0x4955,
> +                       0x8B, 0x0F, 0x06, 0xEF, 0x2A, 0xE7, 0x94, 0x12);
> +
> +static int
> +mshw0011_notify(struct mshw0011_data *cdata, u8 arg1, u8 arg2,
> +               unsigned int *ret_value)
> +{
> +       union acpi_object *obj;
> +       struct acpi_device *adev;
> +       acpi_handle handle;
> +       unsigned int i;
> +
> +       handle =3D ACPI_HANDLE(&cdata->adp1->dev);
> +       if (!handle || acpi_bus_get_device(handle, &adev))
> +               return -ENODEV;
> +
> +       obj =3D acpi_evaluate_dsm_typed(handle, &mshw0011_guid, arg1, arg=
2, NULL,
> +                                     ACPI_TYPE_BUFFER);
> +       if (!obj) {
> +               dev_err(&cdata->adp1->dev, "device _DSM execution failed\=
n");
> +               return -ENODEV;
> +       }
> +
> +       *ret_value =3D 0;
> +       for (i =3D 0; i < obj->buffer.length; i++)
> +               *ret_value |=3D obj->buffer.pointer[i] << (i * 8);
> +
> +       ACPI_FREE(obj);
> +       return 0;
> +}
> +
> +static const struct bix default_bix =3D {
> +       .revision =3D 0x00,
> +       .power_unit =3D 0x01,
> +       .design_capacity =3D 0x1dca,
> +       .last_full_charg_capacity =3D 0x1dca,
> +       .battery_technology =3D 0x01,
> +       .design_voltage =3D 0x10df,
> +       .design_capacity_of_warning =3D 0x8f,
> +       .design_capacity_of_low =3D 0x47,
> +       .cycle_count =3D 0xffffffff,
> +       .measurement_accuracy =3D 0x00015f90,
> +       .max_sampling_time =3D 0x03e8,
> +       .min_sampling_time =3D 0x03e8,
> +       .max_average_interval =3D 0x03e8,
> +       .min_average_interval =3D 0x03e8,
> +       .battery_capacity_granularity_1 =3D 0x45,
> +       .battery_capacity_granularity_2 =3D 0x11,
> +       .model =3D "P11G8M",
> +       .serial =3D "",
> +       .type =3D "LION",
> +       .OEM =3D "",
> +};
> +
> +static int mshw0011_bix(struct mshw0011_data *cdata, struct bix *bix)
> +{
> +       struct i2c_client *client =3D cdata->bat0;
> +       char buf[SURFACE_3_STRLEN];
> +       int ret;
> +
> +       *bix =3D default_bix;
> +
> +       /* get design capacity */
> +       ret =3D i2c_smbus_read_word_data(client,
> +                                      MSHW0011_BAT0_REG_DESIGN_CAPACITY)=
;
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Error reading design capacity: %d\=
n",
> +                       ret);
> +               return ret;
> +       }
> +       bix->design_capacity =3D ret;
> +
> +       /* get last full charge capacity */
> +       ret =3D i2c_smbus_read_word_data(client,
> +                                      MSHW0011_BAT0_REG_FULL_CHG_CAPACIT=
Y);
> +       if (ret < 0) {
> +               dev_err(&client->dev,
> +                       "Error reading last full charge capacity: %d\n", =
ret);
> +               return ret;
> +       }
> +       bix->last_full_charg_capacity =3D ret;
> +
> +       /* get serial number */
> +       ret =3D i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_S=
ERIAL_NO,
> +                                           sizeof(buf), buf);
> +       if (ret !=3D sizeof(buf)) {
> +               dev_err(&client->dev, "Error reading serial no: %d\n", re=
t);
> +               return ret;
> +       }
> +       snprintf(bix->serial, ARRAY_SIZE(bix->serial),
> +                "%3pE%6pE", buf + 7, buf);
> +
> +       /* get cycle count */
> +       ret =3D i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_CYCLE_=
CNT);
> +       if (ret < 0) {
> +               dev_err(&client->dev, "Error reading cycle count: %d\n", =
ret);
> +               return ret;
> +       }
> +       bix->cycle_count =3D ret;
> +
> +       /* get OEM name */
> +       ret =3D i2c_smbus_read_i2c_block_data(client, MSHW0011_BAT0_REG_O=
EM,
> +                                           4, buf);
> +       if (ret !=3D 4) {
> +               dev_err(&client->dev, "Error reading cycle count: %d\n", =
ret);
> +               return ret;
> +       }
> +       snprintf(bix->OEM, ARRAY_SIZE(bix->OEM), "%3pE", buf);
> +
> +       return 0;
> +}
> +
> +static int mshw0011_bst(struct mshw0011_data *cdata, struct bst *bst)
> +{
> +       struct i2c_client *client =3D cdata->bat0;
> +       int rate, capacity, voltage, state;
> +       s16 tmp;
> +
> +       rate =3D i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_RATE)=
;
> +       if (rate < 0)
> +               return rate;
> +
> +       capacity =3D i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_C=
APACITY);
> +       if (capacity < 0)
> +               return capacity;
> +
> +       voltage =3D i2c_smbus_read_word_data(client, MSHW0011_BAT0_REG_VO=
LTAGE);
> +       if (voltage < 0)
> +               return voltage;
> +
> +       tmp =3D rate;
> +       bst->battery_present_rate =3D abs((s32)tmp);
> +
> +       state =3D 0;
> +       if ((s32) tmp > 0)
> +               state |=3D ACPI_BATTERY_STATE_CHARGING;
> +       else if ((s32) tmp < 0)
> +               state |=3D ACPI_BATTERY_STATE_DISCHARGING;
> +       bst->battery_state =3D state;
> +
> +       bst->battery_remaining_capacity =3D capacity;
> +       bst->battery_present_voltage =3D voltage;
> +
> +       return 0;
> +}
> +
> +static int mshw0011_adp_psr(struct mshw0011_data *cdata)
> +{
> +       struct i2c_client *client =3D cdata->adp1;
> +       int ret;
> +
> +       ret =3D i2c_smbus_read_byte_data(client, MSHW0011_ADP1_REG_PSR);
> +       if (ret < 0)
> +               return ret;
> +
> +       return ret;
> +}
> +
> +static int mshw0011_isr(struct mshw0011_data *cdata)
> +{
> +       struct bst bst;
> +       struct bix bix;
> +       int ret;
> +       bool status, bat_status;
> +
> +       ret =3D mshw0011_adp_psr(cdata);
> +       if (ret < 0)
> +               return ret;
> +
> +       status =3D ret;
> +       if (status !=3D cdata->charging)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_ADP1, &ret);
> +
> +       cdata->charging =3D status;
> +
> +       ret =3D mshw0011_bst(cdata, &bst);
> +       if (ret < 0)
> +               return ret;
> +
> +       bat_status =3D bst.battery_state;
> +       if (bat_status !=3D cdata->bat_charging)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_BAT0_BST, &ret);
> +
> +       cdata->bat_charging =3D bat_status;
> +
> +       ret =3D mshw0011_bix(cdata, &bix);
> +       if (ret < 0)
> +               return ret;
> +
> +       if (bix.last_full_charg_capacity !=3D cdata->full_capacity)
> +               mshw0011_notify(cdata, cdata->notify_mask,
> +                               MSHW0011_NOTIFY_BAT0_BIX, &ret);
> +
> +       cdata->full_capacity =3D bix.last_full_charg_capacity;
> +
> +       return 0;
> +}
> +
> +static int mshw0011_poll_task(void *data)
> +{
> +       struct mshw0011_data *cdata =3D data;
> +       int ret =3D 0;
> +
> +       cdata->kthread_running =3D true;
> +
> +       set_freezable();
> +
> +       while (!kthread_should_stop()) {
> +               schedule_timeout_interruptible(POLL_INTERVAL);
> +               try_to_freeze();
> +               ret =3D mshw0011_isr(data);
> +               if (ret)
> +                       break;
> +       }
> +
> +       cdata->kthread_running =3D false;
> +       return ret;
> +}
> +
> +static acpi_status
> +mshw0011_space_handler(u32 function, acpi_physical_address command,
> +                       u32 bits, u64 *value64,
> +                       void *handler_context, void *region_context)
> +{
> +       struct gsb_buffer *gsb =3D (struct gsb_buffer *)value64;
> +       struct mshw0011_handler_data *data =3D handler_context;
> +       struct acpi_connection_info *info =3D &data->info;
> +       struct acpi_resource_i2c_serialbus *sb;
> +       struct i2c_client *client =3D data->client;
> +       struct mshw0011_data *cdata =3D i2c_get_clientdata(client);
> +       struct acpi_resource *ares;
> +       u32 accessor_type =3D function >> 16;
> +       acpi_status ret;
> +       int status =3D 1;
> +
> +       ret =3D acpi_buffer_to_resource(info->connection, info->length, &=
ares);
> +       if (ACPI_FAILURE(ret))
> +               return ret;
> +
> +       if (!value64 || ares->type !=3D ACPI_RESOURCE_TYPE_SERIAL_BUS) {
> +               ret =3D AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> +       sb =3D &ares->data.i2c_serial_bus;
> +       if (sb->type !=3D ACPI_RESOURCE_SERIAL_TYPE_I2C) {
> +               ret =3D AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> +       if (accessor_type !=3D ACPI_GSB_ACCESS_ATTRIB_RAW_PROCESS) {
> +               ret =3D AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> +       if (gsb->cmd.arg0 =3D=3D MSHW0011_CMD_DEST_ADP1 &&
> +           gsb->cmd.arg1 =3D=3D MSHW0011_CMD_ADP1_PSR) {
> +               ret =3D mshw0011_adp_psr(cdata);
> +               if (ret >=3D 0) {
> +                       status =3D ret;
> +                       ret =3D 0;
> +               }
> +               goto out;
> +       }
> +
> +       if (gsb->cmd.arg0 !=3D MSHW0011_CMD_DEST_BAT0) {
> +               ret =3D AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> +       switch (gsb->cmd.arg1) {
> +       case MSHW0011_CMD_BAT0_STA:
> +               break;
> +       case MSHW0011_CMD_BAT0_BIX:
> +               ret =3D mshw0011_bix(cdata, &gsb->bix);
> +               break;
> +       case MSHW0011_CMD_BAT0_BTP:
> +               cdata->trip_point =3D gsb->cmd.arg2;
> +               break;
> +       case MSHW0011_CMD_BAT0_BST:
> +               ret =3D mshw0011_bst(cdata, &gsb->bst);
> +               break;
> +       default:
> +               pr_info("command(0x%02x) is not supported.\n", gsb->cmd.a=
rg1);
> +               ret =3D AE_BAD_PARAMETER;
> +               goto err;
> +       }
> +
> + out:
> +       gsb->ret =3D status;
> +       gsb->status =3D 0;
> +
> + err:
> +       ACPI_FREE(ares);
> +       return ret;
> +}
> +
> +static int mshw0011_install_space_handler(struct i2c_client *client)
> +{
> +       acpi_handle handle;
> +       struct mshw0011_handler_data *data;
> +       acpi_status status;
> +
> +       handle =3D ACPI_HANDLE(&client->dev);
> +       if (!handle)
> +               return -ENODEV;
> +
> +       data =3D kzalloc(sizeof(struct mshw0011_handler_data),
> +                           GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->client =3D client;
> +       status =3D acpi_bus_attach_private_data(handle, (void *)data);
> +       if (ACPI_FAILURE(status)) {
> +               kfree(data);
> +               return -ENOMEM;
> +       }
> +
> +       status =3D acpi_install_address_space_handler(handle,
> +                               ACPI_ADR_SPACE_GSBUS,
> +                               &mshw0011_space_handler,
> +                               NULL,
> +                               data);
> +       if (ACPI_FAILURE(status)) {
> +               dev_err(&client->dev, "Error installing i2c space handler=
\n");
> +               acpi_bus_detach_private_data(handle);
> +               kfree(data);
> +               return -ENOMEM;
> +       }
> +
> +       acpi_walk_dep_device_list(handle);
> +       return 0;
> +}
> +
> +static void mshw0011_remove_space_handler(struct i2c_client *client)
> +{
> +       struct mshw0011_handler_data *data;
> +       acpi_handle handle;
> +       acpi_status status;
> +
> +       handle =3D ACPI_HANDLE(&client->dev);
> +       if (!handle)
> +               return;
> +
> +       acpi_remove_address_space_handler(handle,
> +                               ACPI_ADR_SPACE_GSBUS,
> +                               &mshw0011_space_handler);
> +
> +       status =3D acpi_bus_get_private_data(handle, (void **)&data);
> +       if (ACPI_SUCCESS(status))
> +               kfree(data);
> +
> +       acpi_bus_detach_private_data(handle);
> +}
> +
> +static int mshw0011_probe(struct i2c_client *client)
> +{
> +       struct i2c_board_info board_info;
> +       struct device *dev =3D &client->dev;
> +       struct i2c_client *bat0;
> +       struct mshw0011_data *data;
> +       int error, mask;
> +
> +       data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +       if (!data)
> +               return -ENOMEM;
> +
> +       data->adp1 =3D client;
> +       i2c_set_clientdata(client, data);
> +
> +       memset(&board_info, 0, sizeof(board_info));
> +       strlcpy(board_info.type, "MSHW0011-bat0", I2C_NAME_SIZE);
> +
> +       bat0 =3D i2c_acpi_new_device(dev, 1, &board_info);
> +       if (!bat0)
> +               return -ENOMEM;
> +
> +       data->bat0 =3D bat0;
> +       i2c_set_clientdata(bat0, data);
> +
> +       error =3D mshw0011_notify(data, 1, MSHW0011_NOTIFY_GET_VERSION, &=
mask);
> +       if (error)
> +               goto out_err;
> +
> +       data->notify_mask =3D mask =3D=3D MSHW0011_EV_2_5_MASK;
> +
> +       data->poll_task =3D kthread_run(mshw0011_poll_task, data, "mshw00=
11_adp");
> +       if (IS_ERR(data->poll_task)) {
> +               error =3D PTR_ERR(data->poll_task);
> +               dev_err(&client->dev, "Unable to run kthread err %d\n", e=
rror);
> +               goto out_err;
> +       }
> +
> +       error =3D mshw0011_install_space_handler(client);
> +       if (error)
> +               goto out_err;
> +
> +       return 0;
> +
> +out_err:
> +       if (data->kthread_running)
> +               kthread_stop(data->poll_task);
> +       i2c_unregister_device(data->bat0);
> +       return error;
> +}
> +
> +static int mshw0011_remove(struct i2c_client *client)
> +{
> +       struct mshw0011_data *cdata =3D i2c_get_clientdata(client);
> +
> +       mshw0011_remove_space_handler(client);
> +
> +       if (cdata->kthread_running)
> +               kthread_stop(cdata->poll_task);
> +
> +       i2c_unregister_device(cdata->bat0);
> +
> +       return 0;
> +}
> +
> +static const struct acpi_device_id mshw0011_acpi_match[] =3D {
> +       { "MSHW0011", 0 },
> +       { }
> +};
> +MODULE_DEVICE_TABLE(acpi, mshw0011_acpi_match);
> +
> +static struct i2c_driver mshw0011_driver =3D {
> +       .probe_new =3D mshw0011_probe,
> +       .remove =3D mshw0011_remove,
> +       .driver =3D {
> +               .name =3D "mshw0011",
> +               .acpi_match_table =3D ACPI_PTR(mshw0011_acpi_match),
> +       },
> +};
> +module_i2c_driver(mshw0011_driver);
> +
> +MODULE_AUTHOR("Benjamin Tissoires <benjamin.tissoires@gmail.com>");
> +MODULE_DESCRIPTION("mshw0011 driver");
> +MODULE_LICENSE("GPL v2");
> --
> 2.24.1



--=20
With Best Regards,
Andy Shevchenko
