Return-Path: <platform-driver-x86+bounces-5262-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id A1A3696E7B6
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Sep 2024 04:29:09 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 2D2E61F2250E
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Sep 2024 02:29:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0745838DE0;
	Fri,  6 Sep 2024 02:28:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b="jAYDD3wf"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82CB02D045
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Sep 2024 02:28:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.125.188.122
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725589732; cv=none; b=HhFDthu8kyJMwnklWd0j1BMhIr5Zh2tVSYhkAzD8GtA/iMGU3hCiN9vE5+aRVL6AK+JwyOvzCe5S8SQzmi6ntgINiL5UfEzt2bijSawN3FFsLcM6zfpSxze3529BpSSKw1Z9Y18S9OMS3BXYh3Obd6E/iTlEmcKy3amsMn2HOG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725589732; c=relaxed/simple;
	bh=OkuQP8GGUbsjpkJW7AUCQX3rxujXaiedJtgcoVUVLB0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VIB0ukFHUaRF6OsmFc/ELT3LcWnl/x8CnMrx6PdeAdVHNBppkefiZ0td8bLNQ+YvaJxhXnDl7at8QlzlpKXUPVGuxSbzv353qLC3j6ilr6iKiExyPx0xIIDxokypKzLhWnSPeQsKeBicJDys7oPjzEBzjODZz0rVTLbxafvm5Vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com; spf=pass smtp.mailfrom=canonical.com; dkim=pass (2048-bit key) header.d=canonical.com header.i=@canonical.com header.b=jAYDD3wf; arc=none smtp.client-ip=185.125.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=canonical.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=canonical.com
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com [209.85.208.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 128D43F5AB
	for <platform-driver-x86@vger.kernel.org>; Fri,  6 Sep 2024 02:28:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1725589726;
	bh=D33DP173HQ3sM4JzkRWdQ29nFSy60oZoLXqXyU1a/Ys=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=jAYDD3wfBjlUJh1mSIi7WYh3apS7ntBm/+vJzgkqJyUhjZR2Msypzg5S3sLmgdLen
	 qeG5+UrWol+PwYB+7F6Bzg+NhRBfHFN8ylK043kkIpoZteXzbbJT+Kf9eVAi1rmAjd
	 YRvqC5UT/U3epFoZVwFyvOy8R4qpMfcj3m7BoHL6RbGs4pyVoH61QzWSo3g1o3uoPX
	 Ot520dmQLirjTX4BEjUeBs8Nlvsm2/Q8Rf11bJtiqTIs12veRl2YoRmVm4pEgRxx0K
	 419ZxzVsZyxEF4ww2zWFWHqdy8dYiJJdd2bzjZDpk66HxeUFX11GjIxYCAlFNRw0kO
	 ysHSWwHbvHyOQ==
Received: by mail-lj1-f198.google.com with SMTP id 38308e7fff4ca-2f4444b34a7so14387311fa.0
        for <platform-driver-x86@vger.kernel.org>; Thu, 05 Sep 2024 19:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725589725; x=1726194525;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D33DP173HQ3sM4JzkRWdQ29nFSy60oZoLXqXyU1a/Ys=;
        b=RjdCiHTqax2YLOG3l8PHprCMjqz12mVUQG741b2Qn/PGlFrCydQgf7Qbf+IFxk+ssC
         WfcJvGSdCfUn98n8bFOblLpZKeX1FYhWo0zV/1E+8uVe7rgjfmxGzPoavQadAWsKolfg
         EzZQUlF6Wqqt/0HZQ0gYtLSqDkNrS/wV7g38H6sL5aXu2gmGLPlDwKisXdw2AvJaFcum
         fhiRkqltVFIdBBnCw/Q2m7MZxZ9rM3yeI060765GYQ90BCHe3B7C5KkI72E5ESQ3IGay
         6UbWNPCaJOwNGvstB2iKG7OXGZnyrnZs0x98+kKP2D2NdRo4i7C7YWIl0Ll5ISRaBuD0
         DkoA==
X-Forwarded-Encrypted: i=1; AJvYcCWvcnbJlFIkptDmZxL7BbkWzFvIJt5fgg13CjSXuHBvzrwuaYcCIKy3DQ11XTaEks4/6l4T7paN+58hMQdzO8F2wO9w@vger.kernel.org
X-Gm-Message-State: AOJu0YyUWkicg/PXTQ1Pwu58ClNhrwzorvRn8aQ0YSZp+8AwEnIIKzUO
	V7tELfQ/Ba5+izRpEfxBjOQsEgExTe3XhpHCJPF5g13lQtWbxVf0u0OnqLF8PiVU5v/dgm0mOfE
	mwXp1aIvrUErIQfgaQw3903iiic1EWs8Jsxf4SEgNH/Lv8YBWMfV3/jdVrRG4cz6D8Err/9ukja
	9TFLtdaHTBBbZSzVY0ONWUhaeGFt/V2nS+2MHkkHvlTCBxIac349mZN1kjlvWm1Q==
X-Received: by 2002:a2e:4c02:0:b0:2f6:4aed:9973 with SMTP id 38308e7fff4ca-2f7524a3509mr4708131fa.44.1725589724776;
        Thu, 05 Sep 2024 19:28:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEsJuR8zPgCf4lkerjcwSbQEX9fiFYVWJsPlZ1e01j7vn8MH5cH2SMuSKO+wh3rm8TmRkZuvU4OaRDetYMUxPk=
X-Received: by 2002:a2e:4c02:0:b0:2f6:4aed:9973 with SMTP id
 38308e7fff4ca-2f7524a3509mr4707991fa.44.1725589724093; Thu, 05 Sep 2024
 19:28:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240905042447.418662-1-kai.heng.feng@canonical.com>
 <20240905042447.418662-2-kai.heng.feng@canonical.com> <5544d302-9480-4cca-9cfd-ed56cecf6bd3@redhat.com>
In-Reply-To: <5544d302-9480-4cca-9cfd-ed56cecf6bd3@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Fri, 6 Sep 2024 10:28:32 +0800
Message-ID: <CAAd53p51jtJywwK3rNwe2gy7qKSx823EeAJqEtTE-u3L2Ym0Hw@mail.gmail.com>
Subject: Re: [PATCH 2/2] platform/x86/hp: Avoid spurious wakeup on HP ProOne 440
To: Hans de Goede <hdegoede@redhat.com>
Cc: ilpo.jarvinen@linux.intel.com, gregkh@linuxfoundation.org, 
	jorge.lopez2@hp.com, acelan.kao@canonical.com, 
	platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 5, 2024 at 4:56=E2=80=AFPM Hans de Goede <hdegoede@redhat.com> =
wrote:
>
> Hi Kai-Heng Feng,
>
> On 9/5/24 6:24 AM, Kai-Heng Feng wrote:
> > The HP ProOne 440 has a power saving design that when the display is
> > off, it also cuts the USB touchscreen device's power off.
> >
> > This can cause system early wakeup because cutting the power off the
> > touchscreen device creates a disconnect event and prevent the system
> > from suspending:
> > [  445.814574] hub 2-0:1.0: hub_suspend
> > [  445.814652] usb usb2: bus suspend, wakeup 0
> > [  445.824629] xhci_hcd 0000:00:14.0: Port change event, 1-11, id 11, p=
ortsc: 0x202a0
> > [  445.824639] xhci_hcd 0000:00:14.0: resume root hub
> > [  445.824651] xhci_hcd 0000:00:14.0: handle_port_status: starting usb1=
 port polling.
> > [  445.844039] xhci_hcd 0000:00:14.0: PM: pci_pm_suspend(): hcd_pci_sus=
pend+0x0/0x20 returns -16
> > [  445.844058] xhci_hcd 0000:00:14.0: PM: dpm_run_callback(): pci_pm_su=
spend+0x0/0x1c0 returns -16
> > [  445.844072] xhci_hcd 0000:00:14.0: PM: failed to suspend async: erro=
r -16
> > [  446.276101] PM: Some devices failed to suspend, or early wake event =
detected
> >
> > So add a quirk to make sure the following is happening:
> > 1. Let the i915 driver suspend first, to ensure the display is off so
> >    system also cuts the USB touchscreen's power.
> > 2. If the touchscreen is present, wait a while to let the USB disconnec=
t
> >    event fire.
> > 3. Since the disconnect event already happened, the xhci's suspend
> >    routine won't be interrupted anymore.
>
> You only set the suspend-handler from the dmi-quirk callback, so it
> is only ever set on the affected laptop-model. So this can be simplified
> by simply always doing the msleep(200) on suspend, instead of poking at
> USB system internals to find out if the touchscreen is there on suspend.
>
> I guess there may be versions of this specific laptop with/without
> the touchscreen, but I'm not overly worried about adding a 200 ms delay
> on just 1 model laptop for the versions which don't have a touchscreen.

My original idea is not to impose the delay for unaffected systems.
But yes not poking at USB subsystem can make things much easier.

>
> A bigger worry which I have is that we are going to see the same problem
> on other vendor's laptops. So I think in the end we may need something
> done in a more generic manner, in e.g. the drm subsystem (since this
> is display related). For now lets go with this fix and when we hit simila=
r
> cases we can figure out what a generic fix will look like.

Right now this is the only model I've seen that exhibit such behavior.
So I am not overly worried about such problem.

>
> One more comment inline below.
>
>
> >
> > Signed-off-by: Kai-Heng Feng <kai.heng.feng@canonical.com>
> > ---
> >  drivers/platform/x86/hp/hp-wmi.c | 104 ++++++++++++++++++++++++++++++-
> >  1 file changed, 103 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/platform/x86/hp/hp-wmi.c b/drivers/platform/x86/hp=
/hp-wmi.c
> > index 876e0a97cee1..80fc3ee4deaf 100644
> > --- a/drivers/platform/x86/hp/hp-wmi.c
> > +++ b/drivers/platform/x86/hp/hp-wmi.c
> > @@ -30,6 +30,9 @@
> >  #include <linux/rfkill.h>
> >  #include <linux/string.h>
> >  #include <linux/dmi.h>
> > +#include <linux/delay.h>
> > +#include <linux/pci.h>
> > +#include <linux/usb.h>
> >
> >  MODULE_AUTHOR("Matthew Garrett <mjg59@srcf.ucam.org>");
> >  MODULE_DESCRIPTION("HP laptop WMI driver");
> > @@ -1708,6 +1711,52 @@ static void __exit hp_wmi_bios_remove(struct pla=
tform_device *device)
> >               platform_profile_remove();
> >  }
> >
> > +static int hp_wmi_suspend_handler(struct device *device)
> > +{
> > +     acpi_handle handle;
> > +     struct acpi_device *adev;
> > +     struct device *physdev;
> > +     struct usb_port *port_dev;
> > +     struct usb_device *udev;
> > +     acpi_status status;
> > +     bool found =3D false;
> > +
> > +     /* The USB touchscreen device always connects to HS11 */
> > +     status =3D acpi_get_handle(NULL, "\\_SB.PC00.XHCI.RHUB.HS11", &ha=
ndle);
> > +     if (ACPI_FAILURE(status))
> > +             return 0;
> > +
> > +     adev =3D acpi_fetch_acpi_dev(handle);
> > +     if (!adev)
> > +             return 0;
> > +
> > +     physdev =3D get_device(acpi_get_first_physical_node(adev));
> > +     if (!physdev)
> > +             return 0;
> > +
> > +     port_dev =3D to_usb_port(physdev);
> > +     if (port_dev->state =3D=3D USB_STATE_NOTATTACHED)
> > +             return 0;
> > +
> > +     udev =3D port_dev->child;
> > +
> > +     if (udev) {
>
> This is racy. Often desktop environments will turn off the display
> before doing a system-suspend, so the touchscreen is already disconnected
> at this point but the USB subsystem may not have processed it yet.
>
> What if the USB subsystem processes the disconnect exactly at this point?
>
> Then your port_dev->child pointer is no longer valid and your passing
> a pointer to free-ed mem to usb_get_dev()
>
> As I said above since this code only runs on 1 model based on a DMI
> match just simplify this entire function to a single "msleep(200)"
> and be done with it.

OK, will scratch the poking part in next revision. Thanks for the review.

Kai-Heng

>
> Regards,
>
> Hans
>
>
> > +             usb_get_dev(udev);
> > +             if (le16_to_cpu(udev->descriptor.idVendor) =3D=3D 0x1fd2 =
&&
> > +                 le16_to_cpu(udev->descriptor.idProduct) =3D=3D 0x8102=
) {
> > +                     dev_dbg(&hp_wmi_platform_dev->dev, "LG Melfas tou=
chscreen found\n");
> > +                     found =3D true;
> > +             }
> > +             usb_put_dev(udev);
> > +
> > +             /* Let the xhci have time to handle disconnect event */
> > +             if (found)
> > +                     msleep(200);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >  static int hp_wmi_resume_handler(struct device *device)
> >  {
> >       /*
> > @@ -1745,7 +1794,7 @@ static int hp_wmi_resume_handler(struct device *d=
evice)
> >       return 0;
> >  }
> >
> > -static const struct dev_pm_ops hp_wmi_pm_ops =3D {
> > +static struct dev_pm_ops hp_wmi_pm_ops =3D {
> >       .resume  =3D hp_wmi_resume_handler,
> >       .restore  =3D hp_wmi_resume_handler,
> >  };
> > @@ -1871,6 +1920,57 @@ static int hp_wmi_hwmon_init(void)
> >       return 0;
> >  }
> >
> > +static int lg_usb_touchscreen_quirk(const struct dmi_system_id *id)
> > +{
> > +     struct pci_dev *vga, *xhci;
> > +     struct device_link *vga_link, *xhci_link;
> > +
> > +     vga =3D pci_get_class(PCI_CLASS_DISPLAY_VGA << 8, NULL);
> > +
> > +     xhci =3D pci_get_class(PCI_CLASS_SERIAL_USB_XHCI, NULL);
> > +
> > +     if (vga && xhci) {
> > +             xhci_link =3D device_link_add(&hp_wmi_platform_dev->dev, =
&xhci->dev,
> > +                                   DL_FLAG_STATELESS);
> > +             if (xhci_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend befo=
re %s\n",
> > +                              pci_name(xhci));
> > +             else
> > +                     return 1;
> > +
> > +             vga_link =3D device_link_add(&vga->dev, &hp_wmi_platform_=
dev->dev,
> > +                                        DL_FLAG_STATELESS);
> > +             if (vga_link)
> > +                     dev_info(&hp_wmi_platform_dev->dev, "Suspend afte=
r %s\n",
> > +                              pci_name(vga));
> > +             else {
> > +                     device_link_del(xhci_link);
> > +                     return 1;
> > +             }
> > +     }
> > +
> > +
> > +     /* During system bootup, the display and the USB touchscreen devi=
ce can
> > +      * be on and off several times, so the device may not be present =
during
> > +      * hp-wmi's probe routine. Try to find the device in suspend rout=
ine
> > +      * instead.
> > +      */
> > +     hp_wmi_pm_ops.suspend =3D hp_wmi_suspend_handler;
> > +
> > +     return 1;
> > +}
> > +
> > +static const struct dmi_system_id hp_wmi_quirk_table[] =3D {
> > +     {
> > +             .callback =3D lg_usb_touchscreen_quirk,
> > +             .matches =3D {
> > +                     DMI_MATCH(DMI_SYS_VENDOR, "HP"),
> > +                     DMI_MATCH(DMI_PRODUCT_NAME, "HP ProOne 440 23.8 i=
nch G9 All-in-One Desktop PC"),
> > +             },
> > +     },
> > +     {}
> > +};
> > +
> >  static int __init hp_wmi_init(void)
> >  {
> >       int event_capable =3D wmi_has_guid(HPWMI_EVENT_GUID);
> > @@ -1909,6 +2009,8 @@ static int __init hp_wmi_init(void)
> >                       goto err_unregister_device;
> >       }
> >
> > +     dmi_check_system(hp_wmi_quirk_table);
> > +
> >       return 0;
> >
> >  err_unregister_device:
>

