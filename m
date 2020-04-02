Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1A88919C701
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Apr 2020 18:24:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389725AbgDBQYg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Apr 2020 12:24:36 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:57635 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2389598AbgDBQYg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Apr 2020 12:24:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1585844675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tJkodAglEtaJ6oVd60wHJUIs+4aJ5rhPN/vMMPpmDlw=;
        b=R6KFuhnJ0/FpsOml++S3O65pjE8O9I0JxhexYBurbQbMxQ6eAmOS5VaaiY0vt5h5Yb4OBg
        YnjYOzZv/7fE9AILbrbuieIjDfFZyzAJL58CxDzG0CMFEk2Ftk5uq+d7xzAyDkwtPyibcc
        eMhwAZmOaBvACxChcuI8XrN2Fwm8jMo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-382-7ABr0KnDP6W7eJZXIALpNA-1; Thu, 02 Apr 2020 12:24:33 -0400
X-MC-Unique: 7ABr0KnDP6W7eJZXIALpNA-1
Received: by mail-wr1-f70.google.com with SMTP id y1so1699464wrn.10
        for <platform-driver-x86@vger.kernel.org>; Thu, 02 Apr 2020 09:24:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tJkodAglEtaJ6oVd60wHJUIs+4aJ5rhPN/vMMPpmDlw=;
        b=RNO4OUGzjGLqnjzYNKyGA+fJqe1RehZHnbJDEP1yUSzCmjWhDFF4U/e6PNH2XZLVBa
         qbJxxSlXBrriPW8sfs68NG5uT1wETz2OSWdg/tlZquZ/GIrSvP80kQ45IFwy+SQBscZ2
         ZGl91p+YxyP4Rl5qmjo3wQakWc5HByiZqrHc/VH3SlJQfj+2By/OtYu5m/5B+Wnx9/yJ
         2BxV2mIopVjJ1wSQ/9FvQ9+FaFmMbV2Tm9+dJoEvX5eDlPqEG5OlFkSedceXM1ZI3DtD
         b/BIZlJTfx/CZ4w9iwwr6dGHMowS263dAmFCYBCmrcHIDFa4mWPCN2UQKtbktHKz7E/Y
         7zDQ==
X-Gm-Message-State: AGi0PuavvawHScoIBBAqyX8f+xxMfkErCX+EkaQp+1j2e0Pb6er8n7f8
        Eh7x5qbGdGLvDldNMpER7ze7yewlXUwSK1ctJG+JykRrPLCZSTSMtxOJlELhuOK0Wz7E7kqry6g
        0rFe/mcCZK2S/c+ci0yFRqxwuXaOYyFk/0g==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr4233999wmj.149.1585844672139;
        Thu, 02 Apr 2020 09:24:32 -0700 (PDT)
X-Google-Smtp-Source: APiQypJmtZ19Yr/ca6dp9uuHiBVzPVmyMwwwy1Q2Na1uWfDKBcypgwxppItXJBWcdSfEnEWNTw9Q0g==
X-Received: by 2002:a7b:c359:: with SMTP id l25mr4233981wmj.149.1585844671853;
        Thu, 02 Apr 2020 09:24:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id a186sm7712970wmh.33.2020.04.02.09.24.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2020 09:24:31 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86: touchscreen_dmi: Add touchscreen info
 for techBite Arc 11.6.
To:     Wiktor Ciurej <wiktor.ciurej@gmail.com>
Cc:     dvhart@infradead.org, andy.shevchenko@gmail.com,
        platform-driver-x86@vger.kernel.org
References: <20200402161313.GA27168@zyklotron>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <32b0a492-c42b-d1f3-a084-71feda39db5f@redhat.com>
Date:   Thu, 2 Apr 2020 18:24:30 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200402161313.GA27168@zyklotron>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/2/20 6:13 PM, Wiktor Ciurej wrote:
> Add touchscreen info for techBite Arc 11.6.
> 
> Signed-off-by: Wiktor Ciurej <wiktor.ciurej@gmail.com>
> ---
> Changes in v2:
>    - Add missing ts_dmi_data struct.

Oops.

New version looks good to me:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Regards,

Hans



> 
>   drivers/platform/x86/touchscreen_dmi.c | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/drivers/platform/x86/touchscreen_dmi.c b/drivers/platform/x86/touchscreen_dmi.c
> index 93177e6e5ecd..7c9e9a3e1d84 100644
> --- a/drivers/platform/x86/touchscreen_dmi.c
> +++ b/drivers/platform/x86/touchscreen_dmi.c
> @@ -537,6 +537,22 @@ static const struct ts_dmi_data schneider_sct101ctm_data = {
>   	.properties	= schneider_sct101ctm_props,
>   };
>   
> +static const struct property_entry techbite_arc_11_6_props[] = {
> +	PROPERTY_ENTRY_U32("touchscreen-min-x", 5),
> +	PROPERTY_ENTRY_U32("touchscreen-min-y", 7),
> +	PROPERTY_ENTRY_U32("touchscreen-size-x", 1981),
> +	PROPERTY_ENTRY_U32("touchscreen-size-y", 1270),
> +	PROPERTY_ENTRY_BOOL("touchscreen-inverted-y"),
> +	PROPERTY_ENTRY_STRING("firmware-name", "gsl1680-techbite-arc-11-6.fw"),
> +	PROPERTY_ENTRY_U32("silead,max-fingers", 10),
> +	{ }
> +};
> +
> +static const struct ts_dmi_data techbite_arc_11_6_data = {
> +	.acpi_name	= "MSSL1680:00",
> +	.properties	= techbite_arc_11_6_props,
> +};
> +
>   static const struct property_entry teclast_x3_plus_props[] = {
>   	PROPERTY_ENTRY_U32("touchscreen-size-x", 1980),
>   	PROPERTY_ENTRY_U32("touchscreen-size-y", 1500),
> @@ -969,6 +985,15 @@ static const struct dmi_system_id touchscreen_dmi_table[] = {
>   			DMI_MATCH(DMI_PRODUCT_NAME, "SCT101CTM"),
>   		},
>   	},
> +	{
> +		/* Techbite Arc 11.6 */
> +		.driver_data = (void *)&techbite_arc_11_6_data,
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "mPTech"),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "techBite Arc 11.6"),
> +			DMI_MATCH(DMI_BOARD_NAME, "G8316_272B"),
> +		},
> +	},
>   	{
>   		/* Teclast X3 Plus */
>   		.driver_data = (void *)&teclast_x3_plus_data,
> 

