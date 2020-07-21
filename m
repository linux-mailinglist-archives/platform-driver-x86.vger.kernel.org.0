Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 61A8922799B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jul 2020 09:40:13 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGUHkN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jul 2020 03:40:13 -0400
Received: from mail.kernel.org ([198.145.29.99]:48148 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726199AbgGUHkM (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jul 2020 03:40:12 -0400
Received: from pali.im (pali.im [31.31.79.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 4F23E21702;
        Tue, 21 Jul 2020 07:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595317212;
        bh=iO6sFPHMh+ndrDfe/ToSw0CRnvcs3cYw+SQNbN7uOek=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=SAZGuIuCMUOf5EaVsw5Q+CKBUTZ4ldV4B93IleVzJfdFRAEIP12loYkAPakut9+/Q
         2My7dSh2Vl5F5OmBkII9NTwenpp7n87kG0yGY7LfjfSdzthrni5TDoflZ4ZpBWdHdy
         GoOIyuIQlTbBIAeIetaBbqaWis5GVOgBYFslkdSE=
Received: by pali.im (Postfix)
        id 610EC830; Tue, 21 Jul 2020 09:40:10 +0200 (CEST)
Date:   Tue, 21 Jul 2020 09:40:10 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Matthew Garrett <mjg59@srcf.ucam.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: Fn + F8 to switch display/monitor configuration/output gives
 KEY_P
Message-ID: <20200721074010.baupznj6mstjuw4w@pali>
References: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
User-Agent: NeoMutt/20180716
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tuesday 21 July 2020 08:58:51 Paul Menzel wrote:
> Dear Linux folks,
> 
> 
> On the Dell Latitude E7250 running Debian Sid/unstable with Linux 5.7.6,
> pressing Fn + F8 to switch the display/monitor configuration does not work.
> It only prints a *p*.
> 
>     $ sudo libinput debug-events --show-keycodes
>     […]
>     -event0   DEVICE_ADDED     AT Translated Set 2 keyboard      seat0
> default group9  cap:k
>     […]
>     -event0   KEYBOARD_KEY     +3.636s	KEY_LEFTMETA (125) pressed
>      event0   KEYBOARD_KEY     +18.565s	KEY_P (25) pressed
>      event0   KEYBOARD_KEY     +18.704s	KEY_P (25) released
>      event0   KEYBOARD_KEY     +4.727s	KEY_LEFTMETA (125) released
> 
> Is this a known problem? Do you think it can be fixed? Please find the
> output of `dmesg` attached.

I think this is known feature of all machines certificated for Windows
systems. That monitor switch short key generates sequence: winkey + P.
And not single key press.

Maybe Mario could help if there is some way how to switch Dell EC to
really generate just one key press for monitor switch shortkey.
