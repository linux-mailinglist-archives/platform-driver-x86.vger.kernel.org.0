Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E35B925772D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Aug 2020 12:18:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbgHaKSi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Aug 2020 06:18:38 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:30043 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726081AbgHaKSg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Aug 2020 06:18:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598869113;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ho2lhKNdOFL4eVeMgqgsx4+wTVAfSKzlyLf7qhryslc=;
        b=LWuX6EM9byHA/zJa357y/LqcnLoCYADzixvi/eLRRm9z5tYe02LLMhtC322ao3jfGcJ5MY
        cwK7sGvqnP2Lv2b9nFxbJVxw9hrCvlDd/07KWA6mb/wkWRduwhpE5c0r+AIclwCHCisvI5
        DhUEbzCfmnnLimzFBECGirBTVBQcRkU=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-202-OF3WekZ1PhS1ukcsghUehg-1; Mon, 31 Aug 2020 06:18:30 -0400
X-MC-Unique: OF3WekZ1PhS1ukcsghUehg-1
Received: by mail-ej1-f72.google.com with SMTP id l18so294633ejn.17
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Aug 2020 03:18:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=ho2lhKNdOFL4eVeMgqgsx4+wTVAfSKzlyLf7qhryslc=;
        b=NaqVQDZrCz2kmW7F49hxjjdqTnjq9RyNERpF5FB57OE4DqkMPuTQ25my27a4g47GEs
         zSiYJVaaSnEt5cKEvgPUeWL3f9BfaKC32pHrnjPYprYrMrI1pI3sTmRx+usggvQk9hu/
         u1xTBu88tzyJIigbWTSmWEb3ShHZlwH4J71UBqWycXCEGZofkQ32xB1vqaQ46/owRpJo
         7E1yEvnmBxrbxYZl+Ny5wgLwOUvjrjgZHsv3SaGQmSAnvfMsbaDXFAtzp+rT8Ea5cuAP
         H5F99IjJOXNXHAJG9cCaLplM574IY0WI2pXe38LSKg93QrZJcBpBUqMD9OAONQZu9RJd
         w+PQ==
X-Gm-Message-State: AOAM5321Q+9dEeSSDpxQYxvvtl3VMZxeckPDhMXbKNN2ZNnx9BbaWKV7
        gV2Ky57F/EDboDBe6GvKQOGJqO2ZuxdzvdcPIUTQ1tIrs6Ab24vmL2FIKK4skfKw5+bKFh+UL9L
        LZy3wPW1MkpEfNcFv6PST2pBrGD6yV+8big==
X-Received: by 2002:a50:fd84:: with SMTP id o4mr548382edt.76.1598869109640;
        Mon, 31 Aug 2020 03:18:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx3fe/TdjkSQyjX2m5a8M7Ljd4qJ7Fo6BF0GDYgEtP+Q2D3X5m17iFWPXrjalnVsrGU6Mn5yg==
X-Received: by 2002:a50:fd84:: with SMTP id o4mr548365edt.76.1598869109383;
        Mon, 31 Aug 2020 03:18:29 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id eb11sm7495204edb.76.2020.08.31.03.18.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2020 03:18:28 -0700 (PDT)
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
To:     Marius Iacob <themariusus@gmail.com>
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
 <20200824082501.GB1891694@smile.fi.intel.com>
 <c2c95d92-756a-8c85-a217-5b146d1590eb@redhat.com>
 <20200824190043.tvy3ryzr27su4bg4@archer-mini>
 <267951d7-d981-ae32-a7d1-8944361014ac@redhat.com>
 <20200830211750.bmi2fpylctehqsnm@archer>
 <a7a5b70e-47bb-e4bc-76ac-82e83fd4d746@redhat.com>
 <20200831082126.wsto3d2qqkylscm4@archer>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <183aa099-47d7-4647-1651-9134d720f71c@redhat.com>
Date:   Mon, 31 Aug 2020 12:18:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200831082126.wsto3d2qqkylscm4@archer>
Content-Type: multipart/mixed;
 boundary="------------F5B45E4ADE2D87698658F852"
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This is a multi-part message in MIME format.
--------------F5B45E4ADE2D87698658F852
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/31/20 10:21 AM, Marius Iacob wrote:
> On 20-08-31 09:36:24, Hans de Goede wrote:
>> Hi,
>>
>> On 8/30/20 11:17 PM, Marius Iacob wrote:
>>> On 20-08-24 22:23:41, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 8/24/20 9:00 PM, Marius Iacob wrote:
>>>>> On 20-08-24 12:02:12, Hans de Goede wrote:
>>>>>> Hi,
>>>>>>
>>>>>> On 8/24/20 10:25 AM, Andy Shevchenko wrote:
>>>>>>> On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:
>>>>>>>
>>>>>>>> I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.
>>>>>>>
>>>>>>> Can you be more specific, why that module is not loaded?
>>>>>>
>>>>>> Yes that would be my first question too, have you tried passing "i8042.reset=1" and/or "i8042.nomux=1" on the
>>>>>> kernel cmdline? Typically passing "i8042.nomux=1" fixes all kinda i8042 issues.
>>>>>>
>>>>>
>>>>> I'm sorry, forgot to mention, because my device is a 2-in-1 it uses a detachable keyboard/touchpad and is connected by USB interface. So when trying to load i8042 module (also tried reset/nomux) it always says in dmesg "i8042: PNP: No PS/2 controller found." I'm guessing there is no PS/2 controller on this device...
>>>>
>>>> Ah I see, and I guess that after the "i8042: PNP: No PS/2 controller found." message (which is fine) the module fails to load, right ?
>>>
>>> Yes, modprobe: ERROR: could not insert 'i8042': No such device, and there's no trace of i8042 in lsmod output.
>>>
>>>> That really is a bug in the i8042 code, if a module is providing symbols to another module it should never exit with an error from
>>>> its module_init function.
>>>
>>> i8042 is doing a full init in its module_init. I've bypassed the PNP controller check and it fail while trying to talk to the controller:
>>> 	i8042: PNP detection disabled
>>> 	i8042: Can't read CTR while initializing i8042
>>> 	i8042: probe of i8042 failed with error -5
>>> I'm guessing it's module_init should look like asus-wmi's: a message saying it's loaded and return 0; but I don't have enough kernel development experience to do this modification.
>>
>> I haven't looked at the code (yet) but going by your description the trick would be to keep the PnP
>> check in the module_init function and instead of -ENODEV just return 0 when the check fails so that
>> the rest of the init function gets skipped.
>>
>> You probably want to check module_exit in this case to see if that is safe to run with the
>> rest of module_init skipped.
>>
>> Let me know if you need more help with this, I believe that fixing this should be pretty easy.
> 
> Unfortunately the PNP check is 2 layers deeper from module_init and it's expected to return 0 for success for the rest of the init procedure to continue (so that it's not that straightforward). The module seems to be built with a full init procedure on load in mind. I've looked at the code for quite a bit and it seems that it's a bit of patch to write, and most of the places the i8042 code is used (in other modules) expects the module to be not just loaded but fully initialized. So this should be a consideration also.

Please give the attached patch a try, I believe that this should fix the i8042 issue.

Once you have let me know that this works I'll replace the:

Reported-by: Marius Iacob <themariusus@gmail.com>

By:

Reported-and-tested-by: Marius Iacob <themariusus@gmail.com>

And submit the patch upstream. Note the input subsys
maintainers seems to be a bit slow to respond lately,
so I'm not sure how fast we can get this reviewed / merged.

Anyways first lets test it and see if it helps :)

Regards,

Hans

--------------F5B45E4ADE2D87698658F852
Content-Type: text/x-patch; charset=UTF-8;
 name="0001-Input-i8042-Allow-insmod-to-succeed-on-devices-witho.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
 filename*0="0001-Input-i8042-Allow-insmod-to-succeed-on-devices-witho.pa";
 filename*1="tch"

From 863a3a4b719de5d8131d1636dfbb7cfcc55540e9 Mon Sep 17 00:00:00 2001
From: Hans de Goede <hdegoede@redhat.com>
Date: Mon, 31 Aug 2020 12:02:46 +0200
Subject: [PATCH v8] Input: i8042 - Allow insmod to succeed on devices without
 an i8042 controller

The i8042 module exports several symbols which may be used by other
modules.

Before this commit it would refuse to load (when built as a module itself)
on systems without an i8042 controller.

This is a problem specifically for the asus-nb-wmi module. Many Asus
laptops support the Asus WMI interface. Some of them have an i8042
controller and need to use i8042_install_filter() to filter some kbd
events. Other models do not have an i8042 controller (e.g. they use an
USB attached kbd).

Before this commit the asus-nb-wmi driver could not be loaded on Asus
models without an i8042 controller, when the i8042 code was built as
a module (as Arch Linux does) because the module_init function of the
i8042 module would fail with -ENODEV and thus the i8042_install_filter
symbol could not be loaded.

This commit fixes this by exiting from module_init with a return code
of 0 if no controller is found.  It also adds a i8042_present bool to
make the module_exit function a no-op in this case and also adds a
check for i8042_present to the exported i8042_command function.

The latter i8042_present check should not really be necessary because
when builtin that function can already be used on systems without
an i8042 controller, but better safe then sorry.

Reported-by: Marius Iacob <themariusus@gmail.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/input/serio/i8042.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/input/serio/i8042.c b/drivers/input/serio/i8042.c
index d3eda48032e3..944cbb519c6d 100644
--- a/drivers/input/serio/i8042.c
+++ b/drivers/input/serio/i8042.c
@@ -122,6 +122,7 @@ module_param_named(unmask_kbd_data, i8042_unmask_kbd_data, bool, 0600);
 MODULE_PARM_DESC(unmask_kbd_data, "Unconditional enable (may reveal sensitive data) of normally sanitize-filtered kbd data traffic debug log [pre-condition: i8042.debug=1 enabled]");
 #endif
 
+static bool i8042_present;
 static bool i8042_bypass_aux_irq_test;
 static char i8042_kbd_firmware_id[128];
 static char i8042_aux_firmware_id[128];
@@ -343,6 +344,9 @@ int i8042_command(unsigned char *param, int command)
 	unsigned long flags;
 	int retval;
 
+	if (!i8042_present)
+		return -1;
+
 	spin_lock_irqsave(&i8042_lock, flags);
 	retval = __i8042_command(param, command);
 	spin_unlock_irqrestore(&i8042_lock, flags);
@@ -1612,12 +1616,15 @@ static int __init i8042_init(void)
 
 	err = i8042_platform_init();
 	if (err)
-		return err;
+		return (err == -ENODEV) ? 0 : err;
 
 	err = i8042_controller_check();
 	if (err)
 		goto err_platform_exit;
 
+	/* Set this before creating the dev to allow i8042_command to work right away */
+	i8042_present = true;
+
 	pdev = platform_create_bundle(&i8042_driver, i8042_probe, NULL, 0, NULL, 0);
 	if (IS_ERR(pdev)) {
 		err = PTR_ERR(pdev);
@@ -1636,6 +1643,9 @@ static int __init i8042_init(void)
 
 static void __exit i8042_exit(void)
 {
+	if (!i8042_present)
+		return;
+
 	platform_device_unregister(i8042_platform_device);
 	platform_driver_unregister(&i8042_driver);
 	i8042_platform_exit();
-- 
2.28.0


--------------F5B45E4ADE2D87698658F852--

