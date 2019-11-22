Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2C71B107168
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Nov 2019 12:31:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726417AbfKVLbS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Nov 2019 06:31:18 -0500
Received: from mail-pj1-f68.google.com ([209.85.216.68]:44023 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727584AbfKVLbR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Nov 2019 06:31:17 -0500
Received: by mail-pj1-f68.google.com with SMTP id a10so2935576pju.10
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2019 03:31:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qloD4/jBIwZawIaPfiSnB8KDIs7ALPAg1jvmBss/m3w=;
        b=o8kloqpIk7Kt64ivyGRa/M7iYW+u3H4ku1IrYCYvsFR0xpj1LvfIR3FL3yOamqmNri
         hblzNcb8cS7EJoL4HcClq+Qyv5WUKIjlcYyaQHdUeWiBUQAmgn/iYjeIZm87ffpVbLVi
         3qainbzgc31f5sjjc3lJ/RbiTTkRFt17hAMJI8tYJjN3TAWuuOI1nZxymK7kqnq/Ho8v
         GvHUcelhSebRL84A1yopsTxeB1Zb0PRfpptBqwPRAWDK+6exEuXjTKKy/u36Z8mVLdWT
         uY+EtPbSCPfGUPkAZmisJCO+cpQEYP+nBg7sUIleaYaEgI9PVNYrqDH7/FMXiN58R2y7
         Dy4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qloD4/jBIwZawIaPfiSnB8KDIs7ALPAg1jvmBss/m3w=;
        b=ua/DLmpH+b96gzk9Lj/nw2wVcphsQvsEHcbiOXtqA3hHnORCPs5FW6fhMgazH02f6e
         /ekxQ+P+3r+60vXKb1lze6LmyouBImKMhTgZTZP2ceQ/+Vey7KjijEmn/AqOPdXlHWPp
         2RoJipupnb1DclwO3ry9InpzrJvbiQCydoYkZbZPwYBy7f94tIRAksXinfnR/FgkP6hw
         wyYHW80TGEF22i057mtxxWlz1emRLWvkaDDCNYZ+zP5IWwwOvPAF/BWUgnlcuMD69oq/
         r7zzeX4+gHs42yKgc8hSgUCQJjGARimwqrFCCZtwOA5Om/SsLmmByEpQaT88P6w4G19N
         PVPQ==
X-Gm-Message-State: APjAAAXT1hLxRysR7yvfmcHx1bRUjYbHrpJIMmNm4IV8xi3NMnizX0Yi
        vFWHZlz0Fp4pyyi0p+TniIsao8Q6bax00lST4Bk=
X-Google-Smtp-Source: APXvYqyKEMLkZgKiLPcNEeUTeM5qrGs6lLycpvR6x8QY73ipSg5g0RGy3ehqN7uP8V6zeAajp/CKwjPnJP+H4gMy/oM=
X-Received: by 2002:a17:90a:c68f:: with SMTP id n15mr18454089pjt.20.1574422276809;
 Fri, 22 Nov 2019 03:31:16 -0800 (PST)
MIME-Version: 1.0
References: <82dfb75a-e743-e8db-df6f-22b768f7c112@gmail.com>
In-Reply-To: <82dfb75a-e743-e8db-df6f-22b768f7c112@gmail.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Fri, 22 Nov 2019 13:31:06 +0200
Message-ID: <CAHp75VcHf94QWYsyRg7hYqGK4JCRSxxLZ_ziiF2rjqcKR8rPEA@mail.gmail.com>
Subject: Re: Bug Report - Kernel Branch 4.4.y - asus-wmi.c
To:     Bob Funk <bobfunk11@gmail.com>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Jo=C3=A3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

+Cc: Kristian, Jo=C3=A3o, Hans

It seems Kristian reported same (?)  / similar issue.

On Fri, Nov 22, 2019 at 5:16 AM Bob Funk <bobfunk11@gmail.com> wrote:
>
> Hello,
>
> My apologies if you are receiving a duplicate of this message. I
> attempted to email this earlier but was sent a delivery failure status
> reply due to html content. I will attempt to resend it as plain text.
>
> Original Email:
>
> The 2019-01-26 commit to the asus-wmi.c driver code in the 4.4 kernel
> branch has introduced a bug with several known models of EeePC netbooks.
>
> Description of Problem:
> The bug occurs during boot, where the screen (possibly backlight?) will
> shut off and display hotkeys are unable to bring it back on. The problem
> is present on all kernels
> since the 2019-01-26 commit. There have been several reports of the
> issue in the slackware forum at linuxquestions.org
>
> Corrective actions taken so far:
> Appending acpi_osi=3DLinux will circumvent the issue and keep the screen
> on, but this causes several error messages
> in the boot log about eeepc_wmi "failing to load both WMI and and legacy
> ATKD devices", and warns not to use acpi_osi=3DLinux.
>
> Appending acpi_backlight=3Dvendor also prevents the screen from shutting
> off during boot. However, pressing the brightness hotkeys
> causes the system to hang.
>
> Reversing the asus-wmi.c patch that was committed on 2019-01-26 and
> rebuilding the 4.4 series module also fixes the problem, and brightness
> hotkeys work normally. The commit in question is
> 0c4a25cc6f2934f3aa99a0bbfd20b71949bcad25
>
> Model I have tested this on: ASUS EeePC 1000H (Slackware 14.2, kernels
> 4.4.201, 4.4.202)
> Additional models reporting this issue: ASUS Eee PC 1005HAB, ASUS Eee PC
> 1225b, ASUS Eee PC 1025c (Slackware 14.2, various kernels from 4.4.172
> and higher)
>
> Additional Notes:
> This problem seems to have been corrected in the 4.19 kernel branch, as
> reported by several users in the slackware forum.
> I attempted to test some of the fixes from the 4.19 code as patches to
> the 4.4 code but had no success. There have been multiple
> changes in that branch and I am unsure what exactly has corrected the
> bug in that version.
>
> If there is any additional information that I can provide, please let me
> know.
>
> Regards,
>
> Bob Funk



--
With Best Regards,
Andy Shevchenko
