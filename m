Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 74CE8206EE7
	for <lists+platform-driver-x86@lfdr.de>; Wed, 24 Jun 2020 10:21:25 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390351AbgFXIVW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 24 Jun 2020 04:21:22 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:31560 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2388916AbgFXIVV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 24 Jun 2020 04:21:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1592986879;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FSjuEfO+NltLeTZsHhRu2LFLe7ORa0+1E0t726m4hME=;
        b=WgU2x/ZK45H+oOoqrjGHRd77oTk25AkJvxH8MaOtZs3r5S7KbGIMX3PxxxeflYnXG4Jlls
        K6Sb/dr/t+xwU0iIqi/g6CaT8cxTBs4+cA0ol4i91MTBp36lELUKf86NcDjhlHQpzzr8s+
        B9h7XDHxVB6fyOthAsgpnYnZsaclGvI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-61--wSemjO8MPKCHQ5iJrci7w-1; Wed, 24 Jun 2020 04:21:14 -0400
X-MC-Unique: -wSemjO8MPKCHQ5iJrci7w-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A3DC19057A0;
        Wed, 24 Jun 2020 08:21:13 +0000 (UTC)
Received: from colo-mx.corp.redhat.com (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 506958927C;
        Wed, 24 Jun 2020 08:21:13 +0000 (UTC)
Received: from zmail20.collab.prod.int.phx2.redhat.com (zmail20.collab.prod.int.phx2.redhat.com [10.5.83.23])
        by colo-mx.corp.redhat.com (Postfix) with ESMTP id CBFA31048FD;
        Wed, 24 Jun 2020 08:21:12 +0000 (UTC)
Date:   Wed, 24 Jun 2020 04:21:12 -0400 (EDT)
From:   Bastien Nocera <bnocera@redhat.com>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
Message-ID: <68783097.298335.1592986872595.JavaMail.zimbra@redhat.com>
In-Reply-To: <20200624020806.25388-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com> <20200624020806.25388-1-markpearson@lenovo.com>
Subject: Re: [PATCH v3] platform/x86: thinkpad_acpi: lap or desk mode
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.36.115.15, 10.4.195.23]
Thread-Topic: platform/x86: thinkpad_acpi: lap or desk mode interface
Thread-Index: DrFjCl7sJLWkehdH2pd1wLVw9zF4AA==
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



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
> Changes in v3:
> - Fixed inaccurate comments
> - Used BIT macro to check lapmode bit setting as recommended and update
>   define name
> - Check for new_state == dytc_lapmode in dytc_lapmode_refresh
> 
> Changes in v2:
> - cleaned up initialisation sequence to be cleaner and avoid spamming
>   platforms that don't have DYTC with warning message. Tested on P52
> - Adding platform-driver-x86 mailing list for review as requested
> 
>  drivers/platform/x86/thinkpad_acpi.c | 110 +++++++++++++++++++++++++++
>  1 file changed, 110 insertions(+)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c
> b/drivers/platform/x86/thinkpad_acpi.c
> index 0f704484ae1d..ce3bfb546109 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -4049,6 +4049,7 @@ static bool hotkey_notify_6xxx(const u32 hkey,
>  		pr_debug("EC reports: Thermal Control Command set completed (DYTC)\n");
>  		/* recommended action: do nothing, we don't have
>  		 * Lenovo ATM information */
> +		tpacpi_driver_event(hkey);

Do you want to update the comments just above now that the notification is handled?

<snip>
> +static void dytc_lapmode_refresh(void)
> +{
> +	int new_state;
> +
> +	new_state = dytc_lapmode_get();
> +	if ((new_state == -ENODEV) || (new_state == -EIO) || (new_state ==
> dytc_lapmode))
> +		return;
> +
> +	if (dytc_lapmode != new_state) {

There's no need to check here, you're exiting the function on new_state == dytc_lapmode

> +		dytc_lapmode = new_state;
> +		dytc_lapmode_notify_change();
> +	}
> +}

Rest looks fine.

Cheers

