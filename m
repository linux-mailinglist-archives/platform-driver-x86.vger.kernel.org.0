Return-Path: <platform-driver-x86+bounces-8282-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 56239A01E38
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Jan 2025 04:34:07 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id D68723A13E7
	for <lists+platform-driver-x86@lfdr.de>; Mon,  6 Jan 2025 03:34:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C8BDF18A6A8;
	Mon,  6 Jan 2025 03:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="AudNEtMu"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43AC02EB10
	for <platform-driver-x86@vger.kernel.org>; Mon,  6 Jan 2025 03:33:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736134439; cv=none; b=DYxtJAoQFVxvayAMnUwpJj8km1FtOqlUCScOISK8BxR1QKhDrPBTEHdTs+o9UcaW7FBW/2RL79c0OIxANz6lINjpSNDRpfDhgJKipe9Afk18W402aGKLcn0+hYdvTCRz2RVLdrr0QmSKcXH4i+OIp7coucpYW7cLM/8w1FVgcgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736134439; c=relaxed/simple;
	bh=X7BNCRu5UAROhoOwa5ppwFMHFfL5H8jnMYKPP5bBnpA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FaYX645pBb41R7kcyrp5kfyf3IX+yaOAJY780L3kT85l65xNdSxNWvwzJoHzXox/cFuXK5LvAbwFtTJVroujNT5KYRaaEgD9bks4OuYPy0EZVX7sHfgfGO9XH5vvcwRgs4TwUBDbIZawtd7gxfO43D9MZqvzgmYUzCV0we4X2XY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=AudNEtMu; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30167f4c1deso135259221fa.1
        for <platform-driver-x86@vger.kernel.org>; Sun, 05 Jan 2025 19:33:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1736134434; x=1736739234; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kzwm9/S2LDeM74xbsL4nFsqFRfr/0gBz/oeeZ/g9Uyw=;
        b=AudNEtMulrvA1v7v/Y+CPKwpBbGxTUxxCD6NxAvKJfyN5pgmb8ma6jBGoRCGGY/+H4
         O0d0ONms7bQKnp5R9qEvQwQT/Duj/Kn25tIIdKw7rSGdtURbQS4lDQmiVb72jNTPjsgB
         a0Dl8t/Pax2y2WHr7gB/ptRQEHn8ziPy1Y4Y3NbNMdzp7OKi3RfncuoMZ1R7Zx2keBmv
         MA1tnPGbRohugveGsrpn5na2RgxJBcuNe9CrOdoYJP+SKTEor59tJXJEsyaF1B+VCzcL
         gQAB2RxZa360Fd24f59WJxhqXjByD+xhggKom2rQhxkKkPzP2oZOCpfdtSsBUOL5u08E
         LoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736134434; x=1736739234;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kzwm9/S2LDeM74xbsL4nFsqFRfr/0gBz/oeeZ/g9Uyw=;
        b=BQ7lBomQPafqtId5z9bCffB7qVCsXUpdXjyFY62JVeGH3EJ2lEgSxtqdqqQ+alznXG
         d+6JjmfL8BhlSc+/w67c28cQuXrmuTezCup0gcXwAHDivu7vvQ9E7lXwTGtqo5y1e06V
         +TXl5lBv4sswwK+Ap8nZoTv7UMn+iuqEmOdDSyJhcen5V0yV8rPG7VqZlM+6Hcc38asW
         7PGYKBldRpIrw5EFqx2Fl9YEx5t9mqYxMZDPf15Oyb3mBdo/c7ALAVz27QpiM8TIdqxO
         9UfOS9CHbcMkVSYFgE0UHPDZKCIATzgwiICaayjUwuvTc83Mt7a1f6DjWjFuKAC7c1dD
         aU0g==
X-Forwarded-Encrypted: i=1; AJvYcCVTGTcsAuFxhHVuboXrpt0jRmrVQOrv0fBOkctPXVdd3kYevMHD8i+fDVSYOrVCX9VAs1YU1ze/PvYMLINX4g9dfLBN@vger.kernel.org
X-Gm-Message-State: AOJu0YxaM7fOr7phn2eQUdNV5ZnVmTzKJ4rc37jRxEqpRBx5llwEBuBd
	JmydkYHZ/wUCu7X1Wt/t70yPlX90L8nG39JPvV/GAJCFyv3P7GE2iuos1XocZCE=
X-Gm-Gg: ASbGncsTcjpqQrgalWlVgxepQ1k4k8ALk+qJVwcpy9xoCjG4ckjrp8Urhr0EYiDY7Nm
	rlONY8cPTExwlyL8qT6MvP5X3WS4Yl9Uy+Cqbq+bdyLvLutn5MmvfxCOEZFVLztyuZg/2etfnEH
	nLIQdsFOBGlMWuEt2TEMsFTiP4M88+xhWygj+6gAU54i+kRl6aJLuJSzCk/96KR/5sV4dkIxsWD
	ZadupsZUpgKnulUhmXFbchIepMU/QNL9+QAPhPkmLvLCWJYdHF2gOkP8przKHxtmkkIH4nuU9Vh
	e7LmdLoyfpqDIZGLw1Au+PoZqgkfB7+SZ4YO
X-Google-Smtp-Source: AGHT+IH3+zXH7aD7s8gniirv1TrhLdqMwayzdv9SoFpoAUeNYMvGHxbNhXT4ZMdyv365Ver5B4pCQA==
X-Received: by 2002:a2e:a991:0:b0:300:33b1:f0e1 with SMTP id 38308e7fff4ca-304684190bemr183566181fa.0.1736134434250;
        Sun, 05 Jan 2025 19:33:54 -0800 (PST)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045ad9bb7asm59277751fa.46.2025.01.05.19.33.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 19:33:52 -0800 (PST)
Date: Mon, 6 Jan 2025 05:33:50 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Pengyu Luo <mitltlatltl@gmail.com>
Cc: andersson@kernel.org, bryan.odonoghue@linaro.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, gregkh@linuxfoundation.org, hdegoede@redhat.com, 
	heikki.krogerus@linux.intel.com, ilpo.jarvinen@linux.intel.com, konradybcio@kernel.org, 
	krzk+dt@kernel.org, linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-usb@vger.kernel.org, nikita@trvn.ru, 
	platform-driver-x86@vger.kernel.org, robh@kernel.org, sre@kernel.org
Subject: Re: [PATCH 3/5] usb: typec: ucsi: add Huawei Matebook E Go
 (sc8280xp) ucsi driver
Message-ID: <h4icxzxk5fzgkdhhk6disrervqmb4dqe3xlc432k7pgyzsk77u@pyfrrtyjslpo>
References: <3q4xpa6gyw5sam4qr7glg2b25bzwgunxwhfqjogqw3wqocphph@5jdbkh6pkxic>
 <20241229090547.51958-1-mitltlatltl@gmail.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241229090547.51958-1-mitltlatltl@gmail.com>

On Sun, Dec 29, 2024 at 05:05:47PM +0800, Pengyu Luo wrote:
> On Sun, Dec 29, 2024 at 12:40 PM Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > On Sat, Dec 28, 2024 at 01:13:51AM +0800, Pengyu Luo wrote:
> > > The Huawei Matebook E Go (sc8280xp) tablet provides implements UCSI
> > > interface in the onboard EC. Add the glue driver to interface the
> > > platform's UCSI implementation.
> > >
> > > Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> > > ---
> > >  drivers/usb/typec/ucsi/Kconfig              |   9 +
> > >  drivers/usb/typec/ucsi/Makefile             |   1 +
> > >  drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c | 481 ++++++++++++++++++++
> > >  3 files changed, 491 insertions(+)
> > >  create mode 100644 drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> > >
> > > diff --git a/drivers/usb/typec/ucsi/Kconfig b/drivers/usb/typec/ucsi/Kconfig
> > > index 680e1b87b..0d0f07488 100644
> > > --- a/drivers/usb/typec/ucsi/Kconfig
> > > +++ b/drivers/usb/typec/ucsi/Kconfig
> > > @@ -78,4 +78,13 @@ config UCSI_LENOVO_YOGA_C630
> > >         To compile the driver as a module, choose M here: the module will be
> > >         called ucsi_yoga_c630.
> > >
> > > +config UCSI_HUAWEI_GAOKUN
> > > +     tristate "UCSI Interface Driver for Huawei Matebook E Go (sc8280xp)"
> > > +     depends on EC_HUAWEI_GAOKUN
> > > +     help
> > > +       This driver enables UCSI support on the Huawei Matebook E Go tablet.
> > > +
> > > +       To compile the driver as a module, choose M here: the module will be
> > > +       called ucsi_huawei_gaokun.
> > > +
> > >  endif
> > > diff --git a/drivers/usb/typec/ucsi/Makefile b/drivers/usb/typec/ucsi/Makefile
> > > index aed41d238..0b400122b 100644
> > > --- a/drivers/usb/typec/ucsi/Makefile
> > > +++ b/drivers/usb/typec/ucsi/Makefile
> > > @@ -22,3 +22,4 @@ obj-$(CONFIG_UCSI_CCG)                      += ucsi_ccg.o
> > >  obj-$(CONFIG_UCSI_STM32G0)           += ucsi_stm32g0.o
> > >  obj-$(CONFIG_UCSI_PMIC_GLINK)                += ucsi_glink.o
> > >  obj-$(CONFIG_UCSI_LENOVO_YOGA_C630)  += ucsi_yoga_c630.o
> > > +obj-$(CONFIG_UCSI_HUAWEI_GAOKUN)     += ucsi_huawei_gaokun.o
> > > diff --git a/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> > > new file mode 100644
> > > index 000000000..84ed0407d
> > > --- /dev/null
> > > +++ b/drivers/usb/typec/ucsi/ucsi_huawei_gaokun.c
> > > @@ -0,0 +1,481 @@
> > > +// SPDX-License-Identifier: GPL-2.0-only
> > > +/*
> > > + * ucsi-huawei-gaokun - A UCSI driver for HUAWEI Matebook E Go (sc8280xp)
> > > + *
> > > + * reference: drivers/usb/typec/ucsi/ucsi_yoga_c630.c
> > > + *            drivers/usb/typec/ucsi/ucsi_glink.c
> > > + *            drivers/soc/qcom/pmic_glink_altmode.c
> > > + *
> > > + * Copyright (C) 2024 Pengyu Luo <mitltlatltl@gmail.com>
> > > + */
> > > +
> > > +#include <linux/auxiliary_bus.h>
> > > +#include <linux/bitops.h>
> > > +#include <linux/completion.h>
> > > +#include <linux/container_of.h>
> > > +#include <linux/delay.h>
> > > +#include <linux/module.h>
> > > +#include <linux/notifier.h>
> > > +#include <linux/of.h>
> > > +#include <linux/string.h>
> > > +#include <linux/workqueue_types.h>
> > > +
> > > +#include <linux/usb/pd_vdo.h>
> > > +#include <drm/bridge/aux-bridge.h>
> > > +
> > > +#include "ucsi.h"
> > > +#include <linux/platform_data/huawei-gaokun-ec.h>
> > > +
> > > +
> > > +#define EC_EVENT_UCSI        0x21
> > > +#define EC_EVENT_USB 0x22
> > > +
> > > +#define GAOKUN_CCX_MASK              GENMASK(1, 0)
> > > +#define GAOKUN_MUX_MASK              GENMASK(3, 2)
> > > +
> > > +#define GAOKUN_DPAM_MASK     GENMASK(3, 0)
> > > +#define GAOKUN_HPD_STATE_MASK        BIT(4)
> > > +#define GAOKUN_HPD_IRQ_MASK  BIT(5)
> > > +
> > > +#define CCX_TO_ORI(ccx) (++ccx % 3)
> > > +
> > > +#define GET_IDX(updt) (ffs(updt) - 1)
> > > +
> > > +/* Configuration Channel Extension */
> > > +enum gaokun_ucsi_ccx {
> > > +     USBC_CCX_NORMAL,
> > > +     USBC_CCX_REVERSE,
> > > +     USBC_CCX_NONE,
> > > +};
> > > +
> > > +enum gaokun_ucsi_mux {
> > > +     USBC_MUX_NONE,
> > > +     USBC_MUX_USB_2L,
> > > +     USBC_MUX_DP_4L,
> > > +     USBC_MUX_USB_DP,
> > > +};
> > > +
> > > +struct gaokun_ucsi_reg {
> > > +     u8 port_num;
> > > +     u8 port_updt;
> > > +     u8 port_data[4];
> > > +     u8 checksum;
> > > +     u8 reserved;
> > > +} __packed;
> > > +
> > > +struct gaokun_ucsi_port {
> > > +     struct completion usb_ack;
> > > +     spinlock_t lock;
> > > +
> > > +     struct gaokun_ucsi *ucsi;
> > > +     struct auxiliary_device *bridge;
> > > +
> > > +     int idx;
> > > +     enum gaokun_ucsi_ccx ccx;
> > > +     enum gaokun_ucsi_mux mux;
> > > +     u8 mode;
> > > +     u16 svid;
> > > +     u8 hpd_state;
> > > +     u8 hpd_irq;
> > > +};
> > > +
> > > +struct gaokun_ucsi {
> > > +     struct gaokun_ec *ec;
> > > +     struct ucsi *ucsi;
> > > +     struct gaokun_ucsi_port *ports;
> > > +     struct device *dev;
> > > +     struct work_struct work;
> > > +     struct notifier_block nb;
> > > +     u16 version;
> > > +     u8 port_num;
> > > +};
> > > +
> > > +/* -------------------------------------------------------------------------- */
> > > +/* For UCSI */
> > > +
> > > +static int gaokun_ucsi_read_version(struct ucsi *ucsi, u16 *version)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
> > > +
> > > +     *version = uec->version;
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int gaokun_ucsi_read_cci(struct ucsi *ucsi, u32 *cci)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
> > > +     u8 buf[GAOKUN_UCSI_READ_SIZE];
> > > +     int ret;
> > > +
> > > +     ret = gaokun_ec_ucsi_read(uec->ec, buf);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     memcpy(cci, buf, sizeof(*cci));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int gaokun_ucsi_read_message_in(struct ucsi *ucsi,
> > > +                                    void *val, size_t val_len)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
> > > +     u8 buf[GAOKUN_UCSI_READ_SIZE];
> > > +     int ret;
> > > +
> > > +     ret = gaokun_ec_ucsi_read(uec->ec, buf);
> > > +     if (ret)
> > > +             return ret;
> > > +
> > > +     memcpy(val, buf + GAOKUN_UCSI_CCI_SIZE,
> > > +            min(val_len, GAOKUN_UCSI_DATA_SIZE));
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static int gaokun_ucsi_async_control(struct ucsi *ucsi, u64 command)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(ucsi);
> > > +     u8 buf[GAOKUN_UCSI_WRITE_SIZE] = {};
> > > +
> > > +     memcpy(buf, &command, sizeof(command));
> > > +
> > > +     return gaokun_ec_ucsi_write(uec->ec, buf);
> > > +}
> > > +
> > > +static void gaokun_ucsi_update_connector(struct ucsi_connector *con)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(con->ucsi);
> > > +
> > > +     if (con->num > uec->port_num)
> > > +             return;
> > > +
> > > +     con->typec_cap.orientation_aware = true;
> > > +}
> > > +
> > > +static void gaokun_set_orientation(struct ucsi_connector *con,
> > > +                                struct gaokun_ucsi_port *port)
> > > +{
> > > +     enum gaokun_ucsi_ccx ccx;
> > > +     unsigned long flags;
> > > +
> > > +     spin_lock_irqsave(&port->lock, flags);
> > > +     ccx = port->ccx;
> > > +     spin_unlock_irqrestore(&port->lock, flags);
> > > +
> > > +     typec_set_orientation(con->port, CCX_TO_ORI(ccx));
> > > +}
> > > +
> > > +static void gaokun_ucsi_connector_status(struct ucsi_connector *con)
> > > +{
> > > +     struct gaokun_ucsi *uec = ucsi_get_drvdata(con->ucsi);
> > > +     int idx;
> > > +
> > > +     idx = con->num - 1;
> > > +     if (con->num > uec->port_num) {
> > > +             dev_warn(uec->ucsi->dev, "set orientation out of range: con%d\n", idx);
> > > +             return;
> > > +     }
> > > +
> > > +     gaokun_set_orientation(con, &uec->ports[idx]);
> > > +}
> > > +
> > > +const struct ucsi_operations gaokun_ucsi_ops = {
> > > +     .read_version = gaokun_ucsi_read_version,
> > > +     .read_cci = gaokun_ucsi_read_cci,
> > > +     .read_message_in = gaokun_ucsi_read_message_in,
> > > +     .sync_control = ucsi_sync_control_common,
> > > +     .async_control = gaokun_ucsi_async_control,
> > > +     .update_connector = gaokun_ucsi_update_connector,
> > > +     .connector_status = gaokun_ucsi_connector_status,
> > > +};
> > > +
> > > +/* -------------------------------------------------------------------------- */
> > > +/* For Altmode */
> > > +
> > > +static void gaokun_ucsi_port_update(struct gaokun_ucsi_port *port,
> > > +                                 const u8 *port_data)
> > > +{
> > > +     unsigned long flags;
> > > +     u8 dcc, ddi;
> > > +     int offset = port->idx * 2; /* every port has 2 Bytes data */
> > > +
> > > +     dcc = port_data[offset];
> > > +     ddi = port_data[offset + 1];
> >
> > What is dcc and ddi? Are those just names from the DSDT?
> >
> 
> Yes, DSDT's inventions. Huawei one uses that.
> 
> Some additional information, you can check the following in sc8280xp or
> xelite based dsdt.
> 
> In UPAN(usbc pinassignment notification), PBUF carries a pan info, which
> is a 8B data, {BPID, BORI, BMUX, BVID(2B), BSID(2B), BSSD} which stands for
> port_id, orientation of port, mux state, USB-IF vendor id, USB-IF standard id,
> I don't know the BSSD, (if linaro know something?)
> but according to drivers/soc/qcom/pmic_glink_altmode.c
> BSSD is related to pin assignment(mode field), hpd_state, hpd_irq, ddi is
> something equivalent to BSSD. dcc is something equivalent to BORI and BMUX.

Ack

> 
> 
> > > +
> > > +     spin_lock_irqsave(&port->lock, flags);
> > > +
> > > +     port->ccx = FIELD_GET(GAOKUN_CCX_MASK, dcc);
> > > +     port->mux = FIELD_GET(GAOKUN_MUX_MASK, dcc);
> > > +     port->mode = FIELD_GET(GAOKUN_DPAM_MASK, ddi);
> > > +     port->hpd_state = FIELD_GET(GAOKUN_HPD_STATE_MASK, ddi);
> > > +     port->hpd_irq = FIELD_GET(GAOKUN_HPD_IRQ_MASK, ddi);
> > > +
> > > +     switch (port->mux) {
> > > +     case USBC_MUX_NONE:
> > > +             port->svid = 0;
> > > +             break;
> > > +     case USBC_MUX_USB_2L:
> > > +             port->svid = USB_SID_PD;
> > > +             break;
> > > +     case USBC_MUX_DP_4L:
> > > +     case USBC_MUX_USB_DP:
> > > +             port->svid = USB_SID_DISPLAYPORT;
> > > +             if (port->ccx == USBC_CCX_REVERSE)
> > > +                     port->mode -= 6;
> >
> > I'd prefer it this were more explicit about what is happening.
> >
> 
> If orientation is reverse, then we should minus 6, EC's logic.
> I will add a comment for it. Actually, this field is unused, I don't
> find the mux yet, so I cannot set it with this field. But I don't want
> to make things imcomplete, so keep it.

Which values are you expecting / getting there? The -6 is a pure magic.
Please replace this with a switch-case or something more obvious.

> Let me go off the topic, on my device, I can just use drm_aux_hpd_bridge_notify
> to enable altmode, usb functions well after I pluged out, I don't need set mode
> switch(orientation switch is required if orientation is reverse), which is quiet
> similar to Acer aspire 1. Is mux controlled also by QMP combo phy(see [1])?
> 
> > > +             break;
> > > +     default:
> > > +             break;
> > > +     }
> > > +
> > > +     spin_unlock_irqrestore(&port->lock, flags);
> > > +}
> > > +
> > > +static int gaokun_ucsi_refresh(struct gaokun_ucsi *uec)
> > > +{
> > > +     struct gaokun_ucsi_reg ureg;
> > > +     int ret, idx;
> > > +
> > > +     ret = gaokun_ec_ucsi_get_reg(uec->ec, (u8 *)&ureg);
> > > +     if (ret)
> > > +             return -EIO;
> > > +
> > > +     uec->port_num = ureg.port_num;
> > > +     idx = GET_IDX(ureg.port_updt);
> > > +
> > > +     if (idx >= 0 && idx < ureg.port_num)
> > > +             gaokun_ucsi_port_update(&uec->ports[idx], ureg.port_data);
> > > +
> > > +     return idx;
> > > +}
> > > +
> > > +static void gaokun_ucsi_handle_altmode(struct gaokun_ucsi_port *port)
> > > +{
> > > +     struct gaokun_ucsi *uec = port->ucsi;
> > > +     int idx = port->idx;
> > > +
> > > +     if (idx >= uec->ucsi->cap.num_connectors || !uec->ucsi->connector) {
> > > +             dev_warn(uec->ucsi->dev, "altmode port out of range: %d\n", idx);
> > > +             return;
> > > +     }
> > > +
> > > +     /* UCSI callback .connector_status() have set orientation */
> > > +     if (port->bridge)
> > > +             drm_aux_hpd_bridge_notify(&port->bridge->dev,
> > > +                                       port->hpd_state ?
> > > +                                       connector_status_connected :
> > > +                                       connector_status_disconnected);
> >
> > Does your platform report any altmodes? What do you see in
> > /sys/class/typec/port0/port0.*/ ?
> >
> 
> /sys/class/typec/port0/port0.0:
> active  mode  mode1  power  svid  uevent  vdo
> 
> /sys/class/typec/port0/port0.1:
> active  mode  mode1  power  svid  uevent  vdo
> 
> /sys/class/typec/port0/port0.2:
> active  mode  mode1  power  svid  uevent  vdo
> 
> /sys/class/typec/port0/port0.3:
> active  mode  mode2  power  svid  uevent  vdo
> 
> /sys/class/typec/port0/port0.4:
> active  mode  mode3  power  svid  uevent  vdo

please:

cat /sys/class/typec/port0/port0*/svid
cat /sys/class/typec/port0/port0*/vdo

If DP is reported as one the altmodes, then it should be using the
DisplayPort AltMode driver, as suggested by Heikki.

> > > +
> > > +     gaokun_ec_ucsi_pan_ack(uec->ec, port->idx);
> > > +}
> > > +
> > > +static void gaokun_ucsi_altmode_notify_ind(struct gaokun_ucsi *uec)
> > > +{
> > > +     int idx;
> > > +
> > > +     idx = gaokun_ucsi_refresh(uec);
> > > +     if (idx < 0)
> > > +             gaokun_ec_ucsi_pan_ack(uec->ec, idx);
> > > +     else
> > > +             gaokun_ucsi_handle_altmode(&uec->ports[idx]);
> > > +}
> > > +
> > > +/*
> > > + * USB event is necessary for enabling altmode, the event should follow
> > > + * UCSI event, if not after timeout(this notify may be disabled somehow),
> > > + * then force to enable altmode.
> > > + */
> > > +static void gaokun_ucsi_handle_no_usb_event(struct gaokun_ucsi *uec, int idx)
> > > +{
> > > +     struct gaokun_ucsi_port *port;
> > > +
> > > +     port = &uec->ports[idx];
> > > +     if (!wait_for_completion_timeout(&port->usb_ack, 2 * HZ)) {
> > > +             dev_warn(uec->dev, "No USB EVENT, triggered by UCSI EVENT");
> > > +             gaokun_ucsi_altmode_notify_ind(uec);
> > > +     }
> > > +}
> > > +
> > > +static int gaokun_ucsi_notify(struct notifier_block *nb,
> > > +                           unsigned long action, void *data)
> > > +{
> > > +     u32 cci;
> > > +     struct gaokun_ucsi *uec = container_of(nb, struct gaokun_ucsi, nb);
> > > +
> > > +     switch (action) {
> > > +     case EC_EVENT_USB:
> > > +             gaokun_ucsi_altmode_notify_ind(uec);
> > > +             return NOTIFY_OK;
> > > +
> > > +     case EC_EVENT_UCSI:
> > > +             uec->ucsi->ops->read_cci(uec->ucsi, &cci);
> > > +             ucsi_notify_common(uec->ucsi, cci);
> > > +             if (UCSI_CCI_CONNECTOR(cci))
> > > +                     gaokun_ucsi_handle_no_usb_event(uec, UCSI_CCI_CONNECTOR(cci) - 1);
> > > +
> > > +             return NOTIFY_OK;
> > > +
> > > +     default:
> > > +             return NOTIFY_DONE;
> > > +     }
> > > +}
> > > +
> > > +static int gaokun_ucsi_get_port_num(struct gaokun_ucsi *uec)
> > > +{
> > > +     struct gaokun_ucsi_reg ureg;
> > > +     int ret;
> > > +
> > > +     ret = gaokun_ec_ucsi_get_reg(uec->ec, (u8 *)&ureg);
> > > +
> > > +     return ret ? 0 : ureg.port_num;
> > > +}
> > > +
> > > +static int gaokun_ucsi_ports_init(struct gaokun_ucsi *uec)
> > > +{
> > > +     u32 port;
> > > +     int i, ret, port_num;
> > > +     struct device *dev = uec->dev;
> > > +     struct gaokun_ucsi_port *ucsi_port;
> > > +     struct fwnode_handle *fwnode;
> > > +
> > > +     port_num = gaokun_ucsi_get_port_num(uec);
> > > +     uec->port_num = port_num;
> > > +
> > > +     uec->ports = devm_kzalloc(dev, port_num * sizeof(*(uec->ports)),
> > > +                               GFP_KERNEL);
> > > +     if (!uec->ports)
> > > +             return -ENOMEM;
> > > +
> > > +     for (i = 0; i < port_num; ++i) {
> > > +             ucsi_port = &uec->ports[i];
> > > +             ucsi_port->ccx = USBC_CCX_NONE;
> > > +             ucsi_port->idx = i;
> > > +             ucsi_port->ucsi = uec;
> > > +             init_completion(&ucsi_port->usb_ack);
> > > +             spin_lock_init(&ucsi_port->lock);
> > > +     }
> > > +
> > > +     device_for_each_child_node(dev, fwnode) {
> > > +             ret = fwnode_property_read_u32(fwnode, "reg", &port);
> > > +             if (ret < 0) {
> > > +                     dev_err(dev, "missing reg property of %pOFn\n", fwnode);
> > > +                     fwnode_handle_put(fwnode);
> > > +                     return ret;
> > > +             }
> > > +
> > > +             if (port >= port_num) {
> > > +                     dev_warn(dev, "invalid connector number %d, ignoring\n", port);
> > > +                     continue;
> > > +             }
> > > +
> > > +             ucsi_port = &uec->ports[port];
> > > +             ucsi_port->bridge = devm_drm_dp_hpd_bridge_alloc(dev, to_of_node(fwnode));
> > > +             if (IS_ERR(ucsi_port->bridge)) {
> > > +                     fwnode_handle_put(fwnode);
> > > +                     return PTR_ERR(ucsi_port->bridge);
> > > +             }
> > > +     }
> > > +
> > > +     for (i = 0; i < port_num; i++) {
> > > +             if (!uec->ports[i].bridge)
> > > +                     continue;
> > > +
> > > +             ret = devm_drm_dp_hpd_bridge_add(dev, uec->ports[i].bridge);
> > > +             if (ret)
> > > +                     return ret;
> > > +     }
> > > +
> > > +     return 0;
> > > +}
> > > +
> > > +static void gaokun_ucsi_register_worker(struct work_struct *work)
> > > +{
> > > +     struct gaokun_ucsi *uec;
> > > +     struct ucsi *ucsi;
> > > +     int ret;
> > > +
> > > +     uec = container_of(work, struct gaokun_ucsi, work);
> > > +     ucsi = uec->ucsi;
> > > +
> > > +     ucsi->quirks = UCSI_NO_PARTNER_PDOS | UCSI_DELAY_DEVICE_PDOS;
> >
> > Does it crash in the same way as GLINK crashes (as you've set
> > UCSI_NO_PARTNER_PDOS)?
> >
> 
> Yes, no partner can be detected, I checked. I think it is also handled by
> the firmware As you said in [2]
> > In some obscure cases (Qualcomm PMIC Glink) altmode is completely
> > handled by the firmware. Linux does not get proper partner altmode info.

This is a separate topic. Those two flags were added for a very
particular reason:

- To workaround firmware crash on requesting PDOs for a partner
- To delay requeting PDOs for the device because in the unconnected
  state the GET_PDOS returns incorrect information

Are you sure that those two flags are necessary for your platform?

> 
> > > +
> > > +     ssleep(3); /* EC can't handle UCSI properly in the early stage */
> > > +
> > > +     ret = gaokun_ec_register_notify(uec->ec, &uec->nb);
> > > +     if (ret) {
> > > +             dev_err_probe(ucsi->dev, ret, "notifier register failed\n");
> > > +             return;
> > > +     }
> > > +
> > > +     ret = ucsi_register(ucsi);
> > > +     if (ret)
> > > +             dev_err_probe(ucsi->dev, ret, "ucsi register failed\n");
> > > +}
> > > +
> > > +static int gaokun_ucsi_register(struct gaokun_ucsi *uec)
> >
> > Please inline
> >
> 
> I see.
> 
> Best wishes
> Pengyu
> 
> [1] https://elixir.bootlin.com/linux/v6.12.5/source/drivers/phy/qualcomm/phy-qcom-qmp-combo.c#L2679
> [2] https://lore.kernel.org/lkml/20240416-ucsi-glink-altmode-v1-0-890db00877ac@linaro.org

-- 
With best wishes
Dmitry

