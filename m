Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B1C3F200AC1
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Jun 2020 15:53:03 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726124AbgFSNxD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Jun 2020 09:53:03 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:22722 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725806AbgFSNxC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jun 2020 09:53:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592574780;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zpBDdoKVtfdB1PQqEPzGvmjeqioAWpEu20pmde74Ueo=;
        b=PTNg/wq8vKdqnKD41y3I8e8YMPnZtFhR0UmWzxYMM/sGBFFAc/m/62A+PecgnSy1G9DrTh
        TmhqDnQpAHWJWDEWB61y5x5dU2pQqcF155IuAItr6P8BOesbIddSWgoEfICJa5F7MMGn2i
        SYXuM1sr62ekduOwB/2W3ZTg6TSh+BI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-345-WUWpjMDLOAeWI-K8qc17Ww-1; Fri, 19 Jun 2020 09:52:56 -0400
X-MC-Unique: WUWpjMDLOAeWI-K8qc17Ww-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8830C107ACCA;
        Fri, 19 Jun 2020 13:52:55 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.20])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7FE261CA;
        Fri, 19 Jun 2020 13:52:55 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id 58F721809543;
        Fri, 19 Jun 2020 13:52:55 +0000 (UTC)
Date:   Fri, 19 Jun 2020 09:52:54 -0400 (EDT)
From:   Bastien Nocera <bnocera@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Message-ID: <1905013469.24563660.1592574774373.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200617180937.14949-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com> <20200617180937.14949-1-markpearson@lenovo.com>
Subject: Re: [RESEND PATCH v2] platform/x86: thinkpad_acpi: lap or desk mode
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.115.72, 10.4.195.30]
Thread-Topic: platform/x86: thinkpad_acpi: lap or desk mode interface
Thread-Index: dVeBStosBKcMwHd58dujsFnXdLyC7Q==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hey Mark,

----- Original Message -----
> Newer Lenovo Thinkpad platforms have support to identify whether the
>   system is on-lap or not using an ACPI DYTC event from the firmware.
> 
>   This patch provides the ability to retrieve the current mode via sysfs
>   entrypoints and will be used by userspace for thermal mode and WWAN
>   functionality
> 
> Co-developed-by: Nitin Joshi <njoshi1@lenovo.com>
> Signed-off-by: Nitin Joshi <njoshi1@lenovo.com>
> Reviewed-by: Sugumaran <slacshiminar@lenovo.com>
> Signed-off-by: Mark Pearson <markpearson@lenovo.com>
> ---
> Resend:
> - Adding Bastien Nocera to cc list as requested
> Changes in v2:
> - cleaned up initialisation sequence to be cleaner and avoid spamming
>   platforms that don't have DYTC with warning message. Tested on P52
> - Adding platform-driver-x86 mailing list for review as requested
> 
>  drivers/platform/x86/thinkpad_acpi.c | 113 +++++++++++++++++++++++++++
>  1 file changed, 113 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 0f704484ae1d..8f51bbba21cd 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4049,6 +4049,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
>  		/* recommended action: do nothing, we don't have
>  		 * Lenovo ATM information */
> +		tpacpi_driver_event(hkey);
>  		return true;
>  	case TP_HKEY_EV_THM_TRANSFM_CHANGED:
>  		pr_debug("EC reports: Thermal Transformation changed (GMTS)\n");
> @@ -9811,6 +9812,110 @@ static struct ibm_struct lcdshadow_driver_data = {
>  	.write = lcdshadow_write,
>  };
>  
> +/*************************************************************************
> + * DYTC subdriver, for the Lenovo performace mode feature
> + */

I don't think this should mention the performance mode, as it's a lap/table
detection mode. Do we need to call that "DYTC"? "lapmode"? "lap_detection"?
Or does the DYTC interface offer more functionality that we'd export in the
future?

> +
> +#define DYTC_CMD_GET      2 /*To get current IC function and mode*/

For this comment and all the ones below, space after "/*" and before "*/"

> +#define DYTC_GET_ENABLE_MASK  0x1 /*0 = disabled, 1 = enabled*/

Is that necessary?

> +#define DYTC_GET_LAPMODE_SHIFT 17

You'd probably want to call this "bit" rather than shift. We shift it to read
the value, but 17 is the bit's position. (See BIT() usage in the driver)

Do you want to add a comment here? Is there anything else that could be
documented (the other bits, which versions of firmware would have that, if
there's a publicly available version, or which hardware if publicly available)

> +static int  dytc_lapmode;
> +static void dytc_lapmode_notify_change(void)
> +{
> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
> +			"dytc_lapmode");
> +}
> +
> +static int dytc_command(int command)
> +{
> +	acpi_handle dytc_handle;
> +	int output;
> +
> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
> +		/*Platform doesn't support DYTC*/
> +		return -ENODEV;
> +	}
> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", command))
> +		return -EIO;
> +	return output;
> +}
> +
> +static int dytc_lapmode_get(void)
> +{
> +	int output;
> +
> +	output = dytc_command(DYTC_CMD_GET);
> +	if ((output == -ENODEV) || (output == -EIO))
> +		return output;
> +
> +	return ((output >> DYTC_GET_LAPMODE_SHIFT) &
> +				DYTC_GET_ENABLE_MASK);

Use BIT() instead? eg.
return (output & BIT(DYTC_GET_LAPMODE_SHIFT));

> +}
> +
> +static void dytc_lapmode_refresh(void)
> +{
> +	int new_state;
> +
> +	new_state = dytc_lapmode_get();
> +	if ((new_state == -ENODEV) || (new_state == -EIO))
> +		return;

You could also return early if "dytc_lapmode == new_state".

Rest looks good to me.

