Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CADF31CB8AA
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 May 2020 21:54:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726913AbgEHTyh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 8 May 2020 15:54:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:22528 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726908AbgEHTyg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 8 May 2020 15:54:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1588967675;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s5cbh8+ouztnaKRRaYLQNlZBz5qzMye0e7qTGD4rFGs=;
        b=R/BtsJDfEwamiu6SrXmNs/fGsiRzyCFsYgCcXLELei29Jp3o8Sk5BpUfioGedQ7d4kFPiv
        BDcWxAvsNkvI4sz6xFM4FlRh2ujMdx9cJAVKji1cPyuEYxHiLjca+lG/fS5yFIKUcRhTVy
        Up7zNDb2WLpf6fpRzhoHSfe1PLfomDI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-6vzmKxMQM3Gee66AKcMTBw-1; Fri, 08 May 2020 15:54:33 -0400
X-MC-Unique: 6vzmKxMQM3Gee66AKcMTBw-1
Received: by mail-wr1-f72.google.com with SMTP id d1so1385776wru.6
        for <platform-driver-x86@vger.kernel.org>; Fri, 08 May 2020 12:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=s5cbh8+ouztnaKRRaYLQNlZBz5qzMye0e7qTGD4rFGs=;
        b=XXHCG/eK/5NUaQn7R1tZah0sP79xwxrvYYYSmJgUAww0j7U8t9shLmk2JKNFyYGyaC
         YKMWbVq7e5Y6e54eppV4NO4Dj8Z2XlBlJlxR71r/8C/NH2Ge+ygbqQoL/d0N19cSiNjC
         ukX6PM6q2C3AeNl1zAw/jAJXqAh38J+9L6IQ3DNlRWQO9bP/hHCmgviqLrj+7+YZL/D9
         3yF5wWybQHIpH4I1r6ecWCdCzEr2raLe1t+TSXnKR0cecD/tCNhWmOal6qetqOzDh0NY
         sAPxweBPWuYMNXN+J6nvx3lyYQfnm4dXOTj1nEuq767sT+XbpFG6P7bxijl8yZM5TV66
         GHaQ==
X-Gm-Message-State: AGi0PuYuWZBgV4C+Gvi65luk6xQt/QATtVJUyOzx5vs3lLuwEuiF7j0C
        zfkvVuS5IQ2DRAARb10780cCkcLgECgXtSfX0ImrWFUmCnCqsnJtFPlmktGG0aUfaWov2fuplOs
        ca+5K56vC4DLkT2Emnoe6cZLKx0JAA5IKfA==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr3790115wmi.171.1588967671897;
        Fri, 08 May 2020 12:54:31 -0700 (PDT)
X-Google-Smtp-Source: APiQypIBI6rLXYcoq93Y+zxvA74WmuxCHNqHB3zIGRZ3df4OAX7qIF0r2Uz6EwU7+wTXmQom686gqA==
X-Received: by 2002:a05:600c:206:: with SMTP id 6mr3790097wmi.171.1588967671653;
        Fri, 08 May 2020 12:54:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id s14sm13815172wmh.18.2020.05.08.12.54.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 May 2020 12:54:30 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus-nb-wmi: Do not load on Asus T100TA and
 T200TA
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200422220559.99726-1-hdegoede@redhat.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <bcb4d40a-8971-22d6-959b-14b2d329cfd4@redhat.com>
Date:   Fri, 8 May 2020 21:54:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <20200422220559.99726-1-hdegoede@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/23/20 12:05 AM, Hans de Goede wrote:
> asus-nb-wmi does not add any extra functionality on these Asus
> Transformer books. They have detachable keyboards, so the hotkeys are
> send through a HID device (and handled by the hid-asus driver) and also
> the rfkill functionality is not used on these devices.
> 
> Besides not adding any extra functionality, initializing the WMI interface
> on these devices actually has a negative side-effect. For some reason
> the \_SB.ATKD.INIT() function which asus_wmi_platform_init() calls drives
> GPO2 (INT33FC:02) pin 8, which is connected to the front facing webcam LED,
> high and there is no (WMI or other) interface to drive this low again
> causing the LED to be permanently on, even during suspend.
> 
> This commit adds a blacklist of DMI system_ids on which not to load the
> asus-nb-wmi and adds these Transformer books to this list. This fixes
> the webcam LED being permanently on under Linux.
> 
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>

Because of the BYT/CHT work which I do as a side project I have a bunch
of BYT/CHT based 2-in-1s as test devices, including the T100TA and T200TA.

So recently I've been looking into properly reporting SW_TABLET_MODE
state to userspace to let userspace know if the keyboard of these
detachables is attached or not; and guess what, the Asus models
report this through WMI. So blacklisting is not the right thing to do
here after all :|  I do have a plan for another fix for this
(which will also involve DMI matching)...

Andy, Darren, I see that you have already added this to the for-next
branch of linux-platform-drivers-x86. I'm not sure what your vision
on forced pushed there is. If forced pushes are ok, please drop this
patch. If not let me know and I will send out a revert.

Regards,

Hans



> ---
>   drivers/platform/x86/asus-nb-wmi.c | 24 ++++++++++++++++++++++++
>   1 file changed, 24 insertions(+)
> 
> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
> index 6f12747a359a..c4404d9c1de4 100644
> --- a/drivers/platform/x86/asus-nb-wmi.c
> +++ b/drivers/platform/x86/asus-nb-wmi.c
> @@ -515,9 +515,33 @@ static struct asus_wmi_driver asus_nb_wmi_driver = {
>   	.detect_quirks = asus_nb_wmi_quirks,
>   };
>   
> +static const struct dmi_system_id asus_nb_wmi_blacklist[] __initconst = {
> +	{
> +		/*
> +		 * asus-nb-wm adds no functionality. The T100TA has a detachable
> +		 * USB kbd, so no hotkeys and it has no WMI rfkill; and loading
> +		 * asus-nb-wm causes the camera LED to turn and _stay_ on.
> +		 */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T100TA"),
> +		},
> +	},
> +	{
> +		/* The Asus T200TA has the same issue as the T100TA */
> +		.matches = {
> +			DMI_EXACT_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
> +			DMI_EXACT_MATCH(DMI_PRODUCT_NAME, "T200TA"),
> +		},
> +	},
> +	{} /* Terminating entry */
> +};
>   
>   static int __init asus_nb_wmi_init(void)
>   {
> +	if (dmi_check_system(asus_nb_wmi_blacklist))
> +		return -ENODEV;
> +
>   	return asus_wmi_register_driver(&asus_nb_wmi_driver);
>   }
>   
> 

