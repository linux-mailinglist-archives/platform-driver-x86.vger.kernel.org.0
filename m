Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 873FB1DCB1A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 21 May 2020 12:33:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728391AbgEUKds (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 May 2020 06:33:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727040AbgEUKdr (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 May 2020 06:33:47 -0400
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com [IPv6:2607:f8b0:4864:20::343])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87D21C061A0E
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2020 03:33:46 -0700 (PDT)
Received: by mail-ot1-x343.google.com with SMTP id 69so5133991otv.2
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 May 2020 03:33:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=BOAM0G0ep685BfrMMBrzsYRUAH+LriI/QnKS9UMVwNk=;
        b=uH4FX2c6naImNpjF1yQheOyvouai08mR4fONjux3LXSwa3atWtvcysuGNlXmbrb2pN
         wRJ1on7y169STLPyifgebGjBJUp4EubM6NTntvwVHxEBoXDUL0fj2fzTWI+cl7JkmyjK
         IJys+HFLx2Q67txxqeDno/tSCHQOokbC3WZOHjoaptNlXp6rDVji/5NZfPTiTY1MNW08
         fS2BDjYIqJTkHLfRTVVF7HzzbLiXNGUfSPX9s4FisYDCQUOV0beVy1YvZa/HukO+DX/u
         9W0HyWNLnI9NAyu+QV/QDl1/qiCK7ZcHFpfJx5EiOT1O0M4qSVauCMeTgNH6Ad+FbxZz
         l4dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=BOAM0G0ep685BfrMMBrzsYRUAH+LriI/QnKS9UMVwNk=;
        b=O05/nVj/ldEdUZl4yYuJ+noJ3oKGNporujWIqmakzJUXDHvBEQ4p6Fw/Gt4tcSGB5K
         uMAGF2pvrFQXITA3qAhoFVszmyoE1ChALMn3s4vxPbWon/VSBpnjqysInDaF4QfPU6EJ
         z1pwoLnPbOVSWhUqs/XcC1a9FIRuHarjiCscYnyV9THeREa1O2Uu/LdaGiYR4hR492bG
         2ZJxUpWWKXzB8boE7v3yeP4titwReoURvVe30TVLQyu8Z849usOBHioUAAnoDMrzR539
         avXMe2WAHw/2eG4hMRPv2k6KoS4BVdkSNxsZ8x4Fxhun8cBDtz8rzlLkETgL7o3vq/nM
         wEog==
X-Gm-Message-State: AOAM533Y+XSu+8VUOw1M7TWZjeDjtunc0MoeVsgwG5WsFqWzBd0yTGcP
        J84aUbUpoH5skH1yJrHuxJ6qHS8HgYMSJlZ/aQRrKw==
X-Google-Smtp-Source: ABdhPJwwl/pmo34XMx/bgS2GIn2MGs3NQHbfZ5KuMsiWv3SazK0fO1syIUSWbDavZ8iyAhFZ0WAU2t/9+eYeCvS63uM=
X-Received: by 2002:a9d:6ac9:: with SMTP id m9mr6583072otq.33.1590057225584;
 Thu, 21 May 2020 03:33:45 -0700 (PDT)
MIME-Version: 1.0
From:   Chris Chiu <chiu@endlessm.com>
Date:   Thu, 21 May 2020 18:33:34 +0800
Message-ID: <CAB4CAweJ6Zi2DqQ5qgQq-apAMzSSk3uzoohEJ443F5T=LohAAA@mail.gmail.com>
Subject: asus-wmi fails to load on new ASUS laptop UX325JA
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Hans de Goede <hdegoede@redhat.com>,
        gregkh@linuxfoundation.org, gayatri.kammela@intel.com,
        Mika Westerberg <mika.westerberg@linux.intel.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel <linux-kernel@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
    I have the ASUS new laptop UX325JA and most of the media keys are
not working even with the latest kernel (5.7.0-rc5+). Looking into the
dmesg log, the ASUS WMI driver fails to load because of
[    7.827241] asus-nb-wmi: probe of asus-nb-wmi failed with error -5.

    Before this message, the following message repeat 5 times, please
check the full dmesg log here
https://gist.github.com/mschiu77/9a53cd8ff17029e949210dfb3ec1213f
[    7.825975] ACPI BIOS Error (bug): AE_AML_BUFFER_LIMIT, Field
[IIA3] at bit offset/length 96/32 exceeds size of target Buffer (96
bits) (20200326/dsopcode-203)
[    7.825985] No Local Variables are initialized for Method [WMNB]
[    7.826005] ACPI Error: Aborting method \_SB.ATKD.WMNB due to
previous error (AE_AML_BUFFER_LIMIT) (20200326/psparse-531)

    It fails the \_SB.ATKD.WMNB because the local variable IIA3
exceeds the buffer limit. The WMNB is the function to deal with all
ASUS WMI functions, such as ASUS_WMI_METHODID_INIT...etc. The related
code in DSDT is as follows. The full DSDT is here
https://gist.github.com/mschiu77/849c6cb89a8d8cadd015fa75465882dd

Method (WMNB, 3, Serialized)
{
    P8XH (Zero, 0x11)
    CreateDWordField (Arg2, Zero, IIA0)
    CreateDWordField (Arg2, 0x04, IIA1)
    CreateDWordField (Arg2, 0x08, IIA2)
    CreateDWordField (Arg2, 0x0C, IIA3)
    CreateDWordField (Arg2, 0x10, IIA4)
    Local0 = (Arg1 & 0xFFFFFFFF)
    If ((Local0 == 0x54494E49))

    Just as the error messages indicated,  the IIA3 is out of boundary
for the target Buffer. The limit 96bits (12 bytes) is determined by
the input acpi_buffer size, which refers to internally defined struct
bios_args, in asus_wmi_evaluate_method3. Because all ASUS WMI
evaluations will invoke  asus_wmi_evaluate_method3 at last, so all
ASUS WMI functions fail to work. I can simply fix this by extending
the bios_args from 3 args to 5 u32 args as follows, but I don't think
it's generic enough and may have to change if there're more local
variables declared in ACPI method on the future ASUS machines. Any
suggestions for this?

--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -116,6 +116,8 @@ struct bios_args {
        u32 arg0;
        u32 arg1;
        u32 arg2; /* At least TUF Gaming series uses 3 dword input buffer. */
+       u32 arg3;
+       u32 arg4;
 } __packed;


Chris
