Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 49E9423A8C7
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 16:46:45 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726805AbgHCOqm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 10:46:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726189AbgHCOql (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 10:46:41 -0400
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com [IPv6:2a00:1450:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87E9BC06174A
        for <platform-driver-x86@vger.kernel.org>; Mon,  3 Aug 2020 07:46:41 -0700 (PDT)
Received: by mail-wr1-x433.google.com with SMTP id a15so34453975wrh.10
        for <platform-driver-x86@vger.kernel.org>; Mon, 03 Aug 2020 07:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Mpr7X2tUqNRV5SACxTjLHt/jsoHBkY8yGCJRt0X0I64=;
        b=FvTWfSG6ddRP+BVCBRO7fbvmea5k+nyymxoyVPStaLOL4//jwMvtCqFX4GcAAwHvLS
         AL3WFs2huN+xgu5lYCPzV37602kHHnO5L6g168YqfjU7+kXUN8XSfxDNONFVLGutkBPz
         rFGMGosbRzk49dyiviHOQwAOjLOW2rvf+mgYbCiIDMlRb21ruhRrbJBVUDgI1TaMS/mc
         TMG+pByuIB8IpWdlSs7dQT1/CYa9bDj9wIvbi4NGI/05iSv+9AjMbrgaHzTRQQ/mq/3Y
         bcZng8z232xvgjOOyHZZvjH9bE9QQv57R/fMMQvEv2co1lgQ3kyoUqKpW0TQHoYNNtXd
         PrQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Mpr7X2tUqNRV5SACxTjLHt/jsoHBkY8yGCJRt0X0I64=;
        b=D5xYb6F9PLndMr7GA+ysxRkNPHDSbwq5BMpLM8ZQ3RZAae+7GjxW/E5F6G6fjSdbZZ
         yTUxOlyE0Yjz6Gi49i8TDU2YPhUxeO7KuGp0fB6Ywm9VL/+/V84BmQ5Y3anH4C2uMVSG
         o+B4uUp8d4dYaQD3GnqtJpGESyasjVP76vZ0iSqpDuaraOiqI2lPQhHNgtmiLTHSQ5GU
         ZEuc/4mk2Z/L2cWqC0X0j1RovxN6nL4eeaeqUkfNZNm+xP2YcZvAR4i4AVNYjaTGR0My
         nvtZqh2Q06z2i1/62eXKyOXmszSgT1e1dyizw11P3vSVDr6tMRV+uN2CgEqeJqCRYKpH
         BmyA==
X-Gm-Message-State: AOAM530tnc6zY8Ld5Hct8li0HlyNI7PRCywiklzqBUidoTXHS5K3MZZ2
        xudzZqkSzBeh8n1J/t8K7Qjp5g2rrYbt6kZZIyk=
X-Google-Smtp-Source: ABdhPJwIgroiDmOu8HmwNeQplYTLCpO7T0UTLPmad6F1Yv5MY1n8jmnstTG6D+WvI4uagWLhffCir4PtlgfQj4erevQ=
X-Received: by 2002:adf:9526:: with SMTP id 35mr16404882wrs.326.1596465999869;
 Mon, 03 Aug 2020 07:46:39 -0700 (PDT)
MIME-Version: 1.0
References: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
 <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com> <0e462361-a3bc-a7b8-bacd-85f32b575bac@lenovo.com>
In-Reply-To: <0e462361-a3bc-a7b8-bacd-85f32b575bac@lenovo.com>
From:   Elvis Stansvik <elvstone@gmail.com>
Date:   Mon, 3 Aug 2020 16:46:28 +0200
Message-ID: <CAHms=eZ4YVAvmUsjcZTsPOf15sxK_vELbK6fvCs=Bbm3gxFGeQ@mail.gmail.com>
Subject: Re: [External] Re: [ibm-acpi-devel] [PATCH v5] platform/x86:
 thinkpad_acpi: lap or desk mode interface
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     ibm-acpi@hmh.eng.br, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, andy.shevchenko@gmail.com,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Den m=C3=A5n 3 aug. 2020 kl 16:27 skrev Mark Pearson <markpearson@lenovo.co=
m>:
>
> Hi Elvis,
>
> On 8/3/2020 9:20 AM, Elvis Stansvik wrote:
> >
> > Den s=C3=B6n 2 aug. 2020 kl 23:10 skrev Elvis Stansvik
> > <elvstone@gmail.com>:
> >>
> >> (Apologies in advance for missing In-Reply-To header in this
> >> reply. I subscribed to the list just now.)
> >>
> >> Den fre 3 juli 2020 kl 01:24 skrev Mark Pearson
> >> <markpearson@lenovo.com>:
> >>> Newer Lenovo Thinkpad platforms have support to identify whether
> >>> the system is on-lap or not using an ACPI DYTC event from the
> >>> firmware.
> >>>
> >>> This patch provides the ability to retrieve the current mode via
> >>> sysfs entrypoints and will be used by userspace for thermal mode
> >>> and WWAN functionality
> >>
> >> I tried the patch out on my X1C6 (20KH007BMX), running Lenovo
> >> firmware version 0.1.49.
> >>
> >> The sysfs path /sys/devices/platform/thinkpad_acpi/dytc_lapmode is
> >> showing up, but it's reporting 0 regardless if the laptop is in my
> >> lap or on a desk.
> >>
> >> I tested this by having the laptop in my lap for five minutes, and
> >> then on a desk for five minutes. The value reported through
> >> /sys/devices/platform/thinkpad_acpi/dytc_lapmode was always 0.
> >>
> Thanks for the update.
> The X1C6 doesn't have support for the new thermal mode implementation so
> I'm wondering if the lapmode being available could be related to the
> version of DYTC is available. I'll check with the firmware team and get
> back to you on that - they hadn't listed it to me as a limitation
> previously and unfortunately I don't have an X1C6 so didn't test on that
> platform.
>
> As a note - the lapmode is primarily for the thermal modes (it is also
> being used for WWAN power control but that is not supported for Linux on
> the X1C6 either for other reasons). I'm afraid the interface is of
> limited use to you anyway....

Thanks Mark. I know the X1C6 firmware did not get the new thermal mode
implementation, but thought that I would still be able to query its
lap mode.

The reason I wanted query the lap mode is actually because I'm trying
to help Matthew Garrett out in adding support for the adaptive DPTF
performance policy on the thermald side, instead of on the firmware
side like Lenovo decided to do for more recent models. See that effort
here https://github.com/mjg59/thermal_daemon/issues/7). We were
surprised to find that all of the OEM conditions in the APCT table
remained unchanged when the laptop was taken between lap and desk. So
I started suspecting that perhaps the X1C6 and its firmware simply
does not have the ability to detect lap vs desk. That's why I wanted
to use this patch to query the lap mode, as a debugging aid.

If X1C6 does not have the ability to detect lap mode, then that would
obviously explain why the firmware does not change any APCT condition
when put on/off lap, and any effort to get adaptive performance policy
working on the thermald side is probably doomed :(

Elvis

>
> Mark
