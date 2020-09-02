Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9497625AA8F
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Sep 2020 13:52:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgIBLwe (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 2 Sep 2020 07:52:34 -0400
Received: from us-smtp-1.mimecast.com ([207.211.31.81]:47971 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726323AbgIBLw1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Sep 2020 07:52:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599047545;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=/9wZw2QS26CdeFeKK3QxLNjMCxnyIXlCV1if01FWWtI=;
        b=diiJxQfsLASW9FRWaLjH0xEDMKn3wVd2n0Feh2g4fUVAnwzfxBgZIQgdu2RTL1DUWCH2Rs
        2DDprn8yWsO8M1iK2XHag8qS1MJPU0dfo/AtVnHEJZGsi3tFrKaiE/XJZa936hEfd/kSSr
        ztSz2R9ztVjYpZXb98NGcJiMPmq21Ao=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-163-IG-gVz5APQSXmBH2mKWysw-1; Wed, 02 Sep 2020 07:52:15 -0400
X-MC-Unique: IG-gVz5APQSXmBH2mKWysw-1
Received: by mail-ej1-f70.google.com with SMTP id r26so2080107ejz.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 02 Sep 2020 04:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/9wZw2QS26CdeFeKK3QxLNjMCxnyIXlCV1if01FWWtI=;
        b=iPmYZ8GKg1+Guw0FF88JBZTd4vo9OqYTojBaQN/KOXWmvmFi7g1Fn1YMZ5HOkcOOFE
         8kQknrMk7ez5WRndxWIZqn5STttvWzt6AKMoMd+9/GUdBd3b+O7ZSoU3xXVTJFfUN+zk
         43eNNZ3q9CzhXtcYh9n4guiw63mZsT+q5dxpur9LK45l44KsIvf/GZyHjhLFmM1JI3fz
         +BdsANkZEbZRH71ix1OlyTEEYtXk6ifZcJAgbWuoAi9nkF9pRpS+FXX48/wHEH9fNG7e
         0+rKJiAosJVjj8ORnklY5TXbylliH078J/L/LAwmd9szmEkn0tfORsuk+9nfXtK4j/k4
         tsJw==
X-Gm-Message-State: AOAM533irlStgpqRox97lSRfOWQsLbTnw7Q1ybOWoqH+QRRnmnmLHboy
        A8oYniz3WKTwBTUcVgfg3ZJ+jdU4yr7C4eov76+vc5IQEDvYX02QBzcrRnhK8oIX8UVmVCrKqgA
        z1gkZv1PhS2MDBFXBLps7/95ngkfCUtUJAg==
X-Received: by 2002:a17:906:15c4:: with SMTP id l4mr1600389ejd.78.1599047534642;
        Wed, 02 Sep 2020 04:52:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxl4Y2iojx4kqjwurHEbI/+x4/1/6BP0WWtHAvy+wsYRn2Klg6mnQsyZ8GT6oWnIh7Nex05uw==
X-Received: by 2002:a17:906:15c4:: with SMTP id l4mr1600370ejd.78.1599047534384;
        Wed, 02 Sep 2020 04:52:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id t14sm3720198edc.7.2020.09.02.04.52.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2020 04:52:13 -0700 (PDT)
Subject: Re: platform/x86: asus-wmi: SW_TABLET_MODE is always 1 on some
 devices
To:     =?UTF-8?Q?Samuel_=c4=8cavoj?= <samuel@cavoj.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Corentin Chary <corentin.chary@gmail.com>
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200901215536.qcouepovmfxje4n5@fastboi.localdomain>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <0f7302c9-b508-a078-8c62-5ad5a03d92c2@redhat.com>
Date:   Wed, 2 Sep 2020 13:52:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200901215536.qcouepovmfxje4n5@fastboi.localdomain>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/1/20 11:55 PM, Samuel Čavoj wrote:
> Hello!
> 
> A bug was introduced with the following commit[1]:
> 
>      b0dbd97de: platform/x86: asus-wmi: Add support for SW_TABLET_MODE
> 
> The SW_TABLET_MODE switch seems to be always 1 on some devices,
> including my UX360CA and a UX390UAK[2].
> 
> This can be seen in the output of evtest:
> 
>      # evtest /dev/input/by-path/platform-asus-nb-wmi-event
>      Input driver version is 1.0.1
>      Input device ID: bus 0x19 vendor 0x0 product 0x0 version 0x0
>      Input device name: "Asus WMI hotkeys"
>      Supported events:
>        (...)
>        Event type 5 (EV_SW)
>          Event code 1 (SW_TABLET_MODE) state 1
> 
> And directly results in libinput disabling the trackpad and keyboard via
> its tablet-mode mechanism, rendering X.org and Wayland unusable (not even
> switching to VT works without sysrq+r):
> 
>      # libinput debug-events
>      (...)
>      -event8   DEVICE_ADDED     Asus WMI hotkeys     seat0 default group10 cap:kS
>       event8   SWITCH_TOGGLE    +0.000s	switch tablet-mode state 1
>      (...)
> 
> I have been using the following workaround to get my input working
> again:
> 
>      # cat /usr/share/libinput/50-system-asus.quirks
>      (...)
>      [Asus WMI hotkeys]
>      MatchName=*Asus WMI hotkeys*
>      ModelTabletModeSwitchUnreliable=1
> 
> Another option would be to rmmod asus_nb_wmi and blacklist it for now.
> 
> I am not sure what the solution would be as I am not acquainted with the
> WMI module. However, I can provide some information about my hardware:
> 
> The UX360CA fully disables the keyboard in hardware(firmware?) when the
> lid is flipped beyond 180 degrees (tablet mode). The trackpad is not
> disabled. A KEY_PROG2 event is generated by the same "Asus WMI hotkeys"
> input device at this moment, it however does not carry the actual state
> -- a 1 is sent and a 0 follows immediately[3]. The same KEY_PROG2
> sequence is generated when the lid is returned back to laptop position.
> The SW_TABLET_MODE switch does not change state at all during this.
> Thank you.

Thank you for your detailed bug report.

I have only tested the new TABLET_MODE support on Bay Trail and
Cherry Trail based devices. So one possible solution would be to
limit the support based on cpu-id.

But I would rather try to figure out a better way. Can you
create an acpidump, by as root running:

acpidump -o acpidump.asus-UX360CA

And then send me a direct (so without including the list)
email with the generated acpidump.asus-UX360CA file attached please?

Also, if necessary are you capable of building your own
kernel with a (test)patch applied ?

Regards,

Hans

