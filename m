Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 35FB2265F2F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Sep 2020 14:05:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725776AbgIKMFE (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Sep 2020 08:05:04 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34745 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725848AbgIKMEI (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Sep 2020 08:04:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599825841;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=MW/SRVnAn/A0iV6QQoU7r6xdjo3NKUTOwqRhR3nKPe0=;
        b=XxcGifZccobMko9GCklhHr8jjE6DqW5mDVr2TUnmFvDYl+GfCdBJ+Aky/+Fl4dSF8VuS0w
        nIpY/XuBIo2YKK6q8Lpt32HV2f2xhUITp6jQzxp9ITgsVgsjvcwppzLbAedDR0S0+kYiA6
        F2LLHVWt7eom0VHMM4Sjl0OwYi6FI10=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-473-xl8966lgOxmtJkoHAWgDfg-1; Fri, 11 Sep 2020 08:03:59 -0400
X-MC-Unique: xl8966lgOxmtJkoHAWgDfg-1
Received: by mail-ed1-f70.google.com with SMTP id r9so4135479edi.9
        for <platform-driver-x86@vger.kernel.org>; Fri, 11 Sep 2020 05:03:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=MW/SRVnAn/A0iV6QQoU7r6xdjo3NKUTOwqRhR3nKPe0=;
        b=rbLWedLBlDI+KYfYbTEyQR7LR8zrUPkRUeiQJxE0pSfVQjrGvYAqkKIc0s+FqsMr75
         4Qy+uGF9ET/UjW53YyGpJEZWFyujeZ+ixEZEmPACmnoQIgq3nVFWpUs/Uy3Dd1VloHDo
         hBsm2zlyshrzrAjOnHJdMraBww8mAh/Y49kA5S2HUnTNDVD7pS17kBxOXYTT+oaArYjT
         uki1RNYLLgQ+KIiqU063Eyol56SkFTSELUGt/Pq0uWlRKWGehzup59KZJfbJLvU6JuOK
         MPMcuA3s/hWGn0G0efA+QJIzlP0AYl/rHuMcfME4zB+a9/xEramBJmZpNZallHD0NqSi
         Crzw==
X-Gm-Message-State: AOAM531mtbHaXCrpQst5vwIiXw7gIvld501ASAofW70gGRD/BlAZ7/7B
        15HMm2R6UI02m8IM0nnXrgTfORpje1iDx4yml9dqpqvGCO2I6o1eWCgNvwBh72Jqo1XFL1zS3ft
        Pn2aBoswcXy6Dq+PpEfkHLY4QO+a90mub4A==
X-Received: by 2002:a17:906:6884:: with SMTP id n4mr1788729ejr.50.1599825837744;
        Fri, 11 Sep 2020 05:03:57 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJynEkIyHgxb8qo/3XKybj08bHtnjVgZ8yPieq49so0TPGoPUKFeYlG6/e+1RoosL7junP8/bw==
X-Received: by 2002:a17:906:6884:: with SMTP id n4mr1788706ejr.50.1599825837555;
        Fri, 11 Sep 2020 05:03:57 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id dc22sm1505609ejb.112.2020.09.11.05.03.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 11 Sep 2020 05:03:56 -0700 (PDT)
Subject: Re: platform/x86: intel-vbtn: reports SW_TABLET_MODE=1 even if that's
 not the case
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <e14f5acb-7533-19d9-246e-bc7fedbd1283@redhat.com>
Date:   Fri, 11 Sep 2020 14:03:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com>
Content-Type: multipart/mixed;
 boundary="------------0314F728800C5D3DA3DD3A67"
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------0314F728800C5D3DA3DD3A67
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi,

On 9/10/20 7:06 PM, Barnabás Pőcze wrote:
> Hello,
> 
> 
> it has been reported[1], the 'intel-vbtn' driver reports SW_TABLET_MODE=1
> even if that doesn't  accurately represent reality. That renders the
> built-in keyboard and touchpad unusable when using libinput.
> 
> The device in question is
> 
>   DMI: Hewlett-Packard HP Pavilion 11 x360 PC/8050, BIOS F.28 08/11/2015
> 
> with chassis type=10.
> 
> 
> The ACPI[2] device is as follows:
> 
>   Device (VGBI)
>   {
>   	Name (_HID, "INT33D6" /* Intel Virtual Buttons Device */)  // _HID: Hardware ID
>   	Name (VBDS, Zero)
>   	Name (ONTM, One)
>   	Method (_STA, 0, Serialized)  // _STA: Status
>   	{
>   		Return (0x0F)
>   	}
> 
>   	Method (VBDL, 0, Serialized)
>   	{
>   		P80H = 0xD1
>   		^^PCI0.LPCB.EC0.IVBD = One
>   	}
> 
>   	Method (VGBS, 0, Serialized)
>   	{
>   		If ((^^PCI0.LPCB.EC0.ROLS == Zero))
>   		{
>   			VBDS = 0x10
>   		}
>   		Else
>   		{
>   			VBDS = Zero
>   		}
> 
>   		Return (VBDS) /* \_SB_.VGBI.VBDS */
>   	}
>   }
> 
> 
> Seemingly, the 4th bit is set instead of the 6th (that is what the driver expects)
> when not in tablet mode. This causes the driver to always report SW_TABLET_MODE=1.
> 
> This issue has been (most probably) introduced by commit cfae58ed681c5fe0185db843013ecc71cd265ebf
> ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type").

Thank you for the detailed bug-report.

Attached is a patch which should fix this. Can you build a test-kernel for
the user with the patch added and ask him to test with the patched-kernel?

> As a sidenote, another interesting thing is that seemingly no ACPI events are fired when
> the device is "folded".

Hmm, that is weird, there is a handler for such an event in the EC event handler
table in the DSDT. How did you monitor this?

Can you ask the user to run "sudo evemu-record" and then select the
"Intel Virtual Button driver" device? That should now report 0 as state
for SW_TABLET_MODE when booted in normal clamshell mode; and hopefully it
will change to 1 when the user folds the 2-in-1 into tablet mode.

Regards,

Hans

--------------0314F728800C5D3DA3DD3A67
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-platform-x86-intel-vbtn-Fix-SW_TABLET_MODE-always-re.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-platform-x86-intel-vbtn-Fix-SW_TABLET_MODE-always-re.pa";
 filename*1="tch"

From 21104b5f14bb485cb36c3283056efb7f6f2b8ebf Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Fri, 11 Sep 2020 13:34:42 +0200
Subject: [PATCH] platform/x86: intel-vbtn: Fix SW_TABLET_MODE always reporting
 1 on the HP Pavilion 11 x360

Commit cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist
SW_TABLET_MODE on the 9 / "Laptop" chasis-type") restored SW_TABLET_MODE
reporting on the HP stream x360 11 series on which it was previously broken
by commit de9647efeaa9 ("platform/x86: intel-vbtn: Only activate tablet
mode switch on 2-in-1's").

It turns out that enabling SW_TABLET_MODE reporting on devices with a
chassis-type of 10 ("Notebook") causes SW_TABLET_MODE to always report 1
at boot on the HP Pavilion 11 x360, which causes libinput to disable the
kbd and touchpad.

The HP Pavilion 11 x360's ACPI VGBS method sets bit 4 instead of bit 6 when
NOT in tablet mode at boot. Inspecting all the DSDTs in my DSDT collection
shows only one other model, the Medion E1239T ever setting bit 4 and it
always sets this together with bit 6.

So lets treat bit 4 as a second bit which when set indicates the device not
being in tablet-mode, as we already do for bit 6.

While at it also prefix all VGBS constant defines with "VGBS_".

Fixes: cfae58ed681c ("platform/x86: intel-vbtn: Only blacklist SW_TABLET_MODE on the 9 / "Laptop" chasis-type")
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/intel-vbtn.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/platform/x86/intel-vbtn.c b/drivers/platform/x86/intel-vbtn.c
index e85d8e58320c..f443619e1e7e 100644
--- a/drivers/platform/x86/intel-vbtn.c
+++ b/drivers/platform/x86/intel-vbtn.c
@@ -15,9 +15,13 @@
 #include <linux/platform_device.h>
 #include <linux/suspend.h>
 
+/* Returned when NOT in tablet mode on some HP Stream x360 11 models */
+#define VGBS_TABLET_MODE_FLAG_ALT	0x10
 /* When NOT in tablet mode, VGBS returns with the flag 0x40 */
-#define TABLET_MODE_FLAG 0x40
-#define DOCK_MODE_FLAG   0x80
+#define VGBS_TABLET_MODE_FLAG		0x40
+#define VGBS_DOCK_MODE_FLAG		0x80
+
+#define VGBS_TABLET_MODE_FLAGS (VGBS_TABLET_MODE_FLAG | VGBS_TABLET_MODE_FLAG_ALT)
 
 MODULE_LICENSE("GPL");
 MODULE_AUTHOR("AceLan Kao");
@@ -72,9 +76,9 @@ static void detect_tablet_mode(struct platform_device *device)
 	if (ACPI_FAILURE(status))
 		return;
 
-	m = !(vgbs & TABLET_MODE_FLAG);
+	m = !(vgbs & VGBS_TABLET_MODE_FLAGS);
 	input_report_switch(priv->input_dev, SW_TABLET_MODE, m);
-	m = (vgbs & DOCK_MODE_FLAG) ? 1 : 0;
+	m = (vgbs & VGBS_DOCK_MODE_FLAG) ? 1 : 0;
 	input_report_switch(priv->input_dev, SW_DOCK, m);
 }
 
-- 
2.28.0


--------------0314F728800C5D3DA3DD3A67--

