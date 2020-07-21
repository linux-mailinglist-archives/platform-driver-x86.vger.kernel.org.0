Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AF902227925
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jul 2020 09:01:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726985AbgGUHBC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jul 2020 03:01:02 -0400
Received: from mx3.molgen.mpg.de ([141.14.17.11]:43991 "EHLO mx1.molgen.mpg.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726510AbgGUHBC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jul 2020 03:01:02 -0400
Received: from [192.168.0.2] (ip5f5af2a6.dynamic.kabel-deutschland.de [95.90.242.166])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: pmenzel)
        by mx.molgen.mpg.de (Postfix) with ESMTPSA id 0F6DA206466DE;
        Tue, 21 Jul 2020 09:01:00 +0200 (CEST)
Subject: Re: Fn + F8 to switch display/monitor configuration/output gives
 KEY_P
From:   Paul Menzel <pmenzel@molgen.mpg.de>
To:     Matthew Garrett <mjg59@srcf.ucam.org>,
        =?UTF-8?Q?Pali_Roh=c3=a1r?= <pali@kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
References: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
Message-ID: <d938f501-425d-00f4-6a3a-487ecddff478@molgen.mpg.de>
Date:   Tue, 21 Jul 2020 09:00:59 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Linux folks,


Am 21.07.20 um 08:58 schrieb Paul Menzel:

> On the Dell Latitude E7250 running Debian Sid/unstable with Linux 5.7.6, 
> pressing Fn + F8 to switch the display/monitor configuration does not 
> work. It only prints a *p*.
> 
>      $ sudo libinput debug-events --show-keycodes
>      […]
>      -event0   DEVICE_ADDED     AT Translated Set 2 keyboard      seat0 default group9  cap:k
>      […]
>      -event0   KEYBOARD_KEY     +3.636s    KEY_LEFTMETA (125) pressed
>       event0   KEYBOARD_KEY     +18.565s    KEY_P (25) pressed
>       event0   KEYBOARD_KEY     +18.704s    KEY_P (25) released
>       event0   KEYBOARD_KEY     +4.727s    KEY_LEFTMETA (125) released

I forgot to mention, that the display is not changed, and `acpi_listen` 
also does no show anything.

> Is this a known problem? Do you think it can be fixed? Please find the 
> output of `dmesg` attached.


Kind regards,

Paul
