Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C57E626792D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 11:33:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725821AbgILJdv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 05:33:51 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:52303 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1725814AbgILJdu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 05:33:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599903228;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Ur0YIVOfHoGO8zxT+XGpnVso/VGN4z7SSInEehsm6U8=;
        b=XhknqU8pU1CwgZDuT7KVmoe9v9pzg175eldV0M380PincdClNohwXgl5M241f1GczLVVrm
        f9MqrTTp14bxVUL4FVa8hSa87NvaujFtfEc+ws/qXKVRVCJnTBY38wPFiLI2YwuSwrsxMQ
        pNelosllc5B7LIq3oJJkeZrAGyxOyzQ=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-8k-iM_I0Pk6acUb6IFxa_g-1; Sat, 12 Sep 2020 05:33:46 -0400
X-MC-Unique: 8k-iM_I0Pk6acUb6IFxa_g-1
Received: by mail-ed1-f69.google.com with SMTP id y21so6385238edu.23
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 02:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Ur0YIVOfHoGO8zxT+XGpnVso/VGN4z7SSInEehsm6U8=;
        b=KfNudP4HIlQRz/1qmdYkDochEgm0pdBF0fNxwVRaAQr/1qe3vBtXQKItgaGEwSmwtr
         wmGwmMnbEw5x35PLyMcgKoAjeaHes/u+Qyea7ub6exmmhq2IvxMR9SvNGmGW8+J/jwVa
         t44+bJPzoigJjCvw17/lIVqQSWhFcA6YJPViqz7tFmatUsMNLsC9DhwINUrc309BA+hT
         Ojw3OH5R076ZF6WzN+oqGLhOBAM/faicD/XkNaGEfzhhEhgyRs4YEAdq3DLolc3qI0eQ
         OjQAY3qU8kykauyucvIMsgbSN5IArqTqI4eFscDacuufctnDJ/pmwjJG+0v0GuxdDIv4
         XyBA==
X-Gm-Message-State: AOAM532n6dO5YqHQwh5IZGxf3PXX+8popimAgk1LCSMxUj11qpUxv14q
        olWJU7jZcL3nfJa70SJ/hZ0dz7tjbVenJdZKCnXM1O+cMQD3CXoM3/vz5YO61BHr1qrgbY69lqL
        KcsenC3yexwtew3NLK5Uj/VILqRMECVBwCA==
X-Received: by 2002:a17:906:1b04:: with SMTP id o4mr5703854ejg.332.1599903224620;
        Sat, 12 Sep 2020 02:33:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyzeUd1Ebnwb27RwaziNpUySNQ9EtRwaRFM04bTgENQgdK2ioxreY5uYx03UKB8EGa7zCz3cQ==
X-Received: by 2002:a17:906:1b04:: with SMTP id o4mr5703846ejg.332.1599903224383;
        Sat, 12 Sep 2020 02:33:44 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id l7sm2945043ejc.25.2020.09.12.02.33.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 12 Sep 2020 02:33:43 -0700 (PDT)
Subject: Re: platform/x86: intel-vbtn: reports SW_TABLET_MODE=1 even if that's
 not the case
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <xLfPpWwkWaQU4pHxoBXzNeZI7WiE3fDhUosWg0cGx6I9xjfGDuimPIRxyRAYc_2wMnrUlsoTJejBrzjh6sDWyzVMJPJn-rXlFxr08figVQw=@protonmail.com>
 <e14f5acb-7533-19d9-246e-bc7fedbd1283@redhat.com>
 <GMp06zPfgYjjqpspL-HMXHNK7Ueq2GXKEFrDNbi8Rp8xBBK-JFXFB_70z-ZukFX5N_z2jgWv_lb_KVl3r4cZEpBWLXiHKkVt-ldtSVK8D7g=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <9f504b07-8c2b-c9d7-a1c0-916bee64239f@redhat.com>
Date:   Sat, 12 Sep 2020 11:33:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <GMp06zPfgYjjqpspL-HMXHNK7Ueq2GXKEFrDNbi8Rp8xBBK-JFXFB_70z-ZukFX5N_z2jgWv_lb_KVl3r4cZEpBWLXiHKkVt-ldtSVK8D7g=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/12/20 1:00 AM, Barnabás Pőcze wrote:
> Hi,
> 
> thanks for the quick response and patch. I compiled a kernel and
> the user reported that it no longer reports SW_TABLET_MODE as active,
> and the keyboard and touchpad are usable.

Ok, so at least the regression is fixed.

>>> As a sidenote, another interesting thing is that seemingly no ACPI events are fired when
>>> the device is "folded".
>>
>> Hmm, that is weird, there is a handler for such an event in the EC event handler
>> table in the DSDT. How did you monitor this?
> 
> acpid + acpi_listen, evtest, and now evemu-record. None of them show any activity.
> 
> 
>> Can you ask the user to run "sudo evemu-record" and then select the
>> "Intel Virtual Button driver" device? That should now report 0 as state
>> for SW_TABLET_MODE when booted in normal clamshell mode; and hopefully it
>> will change to 1 when the user folds the 2-in-1 into tablet mode.
> 
> Reportedly, that does not happen. It stays zero.

Bummer, the DSDT does have this embedded-controller event-handler,
but I guess that is not getting triggered then:

         Method (_Q49, 0, NotSerialized)  // _Qxx: EC Query, xx=0x00-0xFF
         {
             If ((ROLS == Zero))
             {
                 Notify (VGBI, 0xCD) // Hardware-Specific
             }
             Else
             {
                 Notify (VGBI, 0xCC) // Hardware-Specific
             }
         }

> Interestingly, the keyboard
> and touchpad are disabled nonetheless in tablet mode.

Yes that is probably done by in firmware by the embedded-controller.

I actually verified that the (ROLS == Zero) condition means laptop
mode by checking what the emitted 0xCD event does in the intel-vbtn.c
code, to verify that my check for the 0x10 bit would behave as it should:

             Method (VGBS, 0, Serialized)
             {
                 If ((^^PCI0.LPCB.EC0.ROLS == Zero))
                 {
                     VBDS = 0x10
                 }
                 Else
                 {
                     VBDS = Zero
                 }

                 Return (VBDS) /* \_SB_.VGBI.VBDS */
             }

Which as you see also gets set when (ROLS == Zero).

Interestingly enough, I have a HP Stream X360 11 myself
(note a Stream not a Pavilion) and that has:

             Method (VGBS, 0, Serialized)
             {
                 If ((^^PCI0.LPCB.EC0.ROLS == Zero))
                 {
                     VBDS = Zero
                 }
                 Else
                 {
                     VBDS = Zero
                 }

                 Return (VBDS) /* \_SB_.VGBI.VBDS */
             }

But this is not a problem because it does emit events,
including an event at boot shortly after loading the
vbtn driver, fixing the invalid initial state.

Anyways too bad that we cannot get the SW_TABLET_MODE
reporting to fully work, but at least my patch fixes
the regression.

So I will submit my fix for the regression upstream now.

<snip>

> I have no idea what might be going on with that laptop, but fortunately,
> the patch seems to have solved the most pressing issue.

If you feel like digging deeper, you could try to figure out
why the _Q49 method does not get called. Chances are it has
something to do with the ACPI embedded-controller (EC) code.

You could ask for a full dmesg and check for:
a) kernel cmdline parameters which should normally not be there
b) ACPI EC errors

And maybe also see "cat /proc/interrupts" output and check that
there is an "acpi" interrupt handler (typically IRQ 9).

Regards,

Hans

