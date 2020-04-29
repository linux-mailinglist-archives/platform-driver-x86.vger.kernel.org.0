Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5D0FD1BD456
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Apr 2020 08:01:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726353AbgD2GBv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 Apr 2020 02:01:51 -0400
Received: from mout.kundenserver.de ([212.227.17.24]:35843 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725861AbgD2GBv (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 Apr 2020 02:01:51 -0400
Received: from [192.168.0.7] ([217.83.103.112]) by mrelayeu.kundenserver.de
 (mreue108 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1Md6ZB-1iutKT01AJ-00aBgx; Wed, 29 Apr 2020 08:01:22 +0200
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
To:     "larsh@apache.org" <larsh@apache.org>,
        Dario Messina <nanodario@gmail.com>, civic9 <civic9@gmail.com>
Cc:     agk@godking.net, kjslag@gmail.com, bastidoerner@gmail.com,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org, arc@osknowledge.org
References: <20200423165457.54388-1-larsh@apache.org>
 <20200423215709.72993-1-larsh@apache.org> <11041815.WYjWQN8m1R@lenovodario>
 <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
 <1605997626.1278142.1588119634625@mail.yahoo.com>
From:   Stefan Assmann <sassmann@kpanic.de>
Message-ID: <91feeffa-1f48-347a-fb90-7bf733647476@kpanic.de>
Date:   Wed, 29 Apr 2020 08:01:21 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1605997626.1278142.1588119634625@mail.yahoo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/KEIsLpo66y+ruMPNxyuuKp6Ej9MxRSr9ayO0phV+MTauaF1SLS
 OS5QEpz6YnF+aa3j8ji/E2cj8U2AT3wyOGp0rw6J0mnHN142e6cIpNQje0mF1TH6OBBWl1G
 /JxsJLoy1iOXrZm8oh2MnBSm1wDrFeXiH3IXVNtCBV1QPCxakbULh49XGg0LpSHUj2ExGKY
 kTZikjcNBhdIQztcqOkYg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:RP/73mCzkGs=:ac+fxQ6ReG7vT6Q/RYwUjd
 MFgqffR6f/thH9uwi33yGL7SmeeFEMPyjKILUCWKI6TKwafuOl6vgMTG2IzIw0bU4qsb0NqcL
 sw5/T+o+gJ2Ge9OSfzTTYgwoErQHcoG/b5nZEuAdqJ7BBhqdHkM/lOoU6aVjlVOG2BSJ/zG2c
 jMgFJYx6KtjSLzz8msgE15tRdMozv/3vRwhqKRJSE+rkl2mOd+Z0bQir1ywdQfrMZfy3UZRE5
 ndLLi4I/sPgd0SKR09y56I1FVuX+K//4iKU48j6P76RO4lCLJLU9zqw/z6fRPjSBE0DWhDIQx
 o/Id6R0Gb9ZD1O94V76KxnyddBWqyJ9osjJRUtWXMv6HFu8FVViJomF2CyL7V64dO9Zxn9RJ6
 YcKjVNCukICQO+WUqQ77vpz+31cpZ8obMLQxcjG1bUaoXy/1ZivVtD6bWaIC7QCJZWAskymP9
 BswNih/ZZRmNyABnVs9FgdgPh+sc9QZF4eGjNbdXvCA1UlnW5qg96mBS+c57Ud8Get9CHGrfu
 79sOMJ7CcP5z7aFdPZtB5hAL/uvuL2kMfo2u0uaaM65JPFbTAFAOWYr+wQmLs1KccZ8/YxvS8
 4Vi+54Hg8p6MM8zvTM9n4ssjxz5bjv+E6TFng8pVnBCzD3R6Rp0XegL+L1S6fnACS8f/d48SK
 uMgaJ89m2ytbAMamkvzUxTdgmouwtQ9ZkzikrOvKyqxAzuslIkVdGQ7gjiwRJPXg54Xy9FnZb
 Z9bUbWZdtW4BnhuKF9pTFkujy1Zy6hqygjWZO9nUDldeMwx65j2L7IM+9H8IMTpuk0dN00q0b
 WtFRmh7t2+va06aQTHPpQR2yGz7VBiyMfon9hFoxre3rK6GmMzTkd0n+G+U1GfWP1qNEhO/
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 29.04.20 02:20, larsh@apache.org wrote:
> Do you have a use case for that behavior?
> 
> The previous patch broke the /proc interface, didn't not work with the current version of thinkfan
> (but a a version with multi-fan support is in the works), and it had hard to track internal mutable state.
> 
> The proposed change is clean on all these fronts.
> 
> I'm not a fan of surprising the user with unnecessarily complex behavior (but perhaps this can be added as an option in the future.)

I concur to keep the patch as is. Any additional functionality could be
added later on, if deemed necessary.

  Stefan

> -- Lars
> 
> On Tuesday, April 28, 2020, 2:18:42 PM PDT, civic9 <civic9@gmail.com> wrote: 
> 
> 
> 
> 
> 
> pon., 27 kwi 2020 o 20:41 Dario Messina <nanodario@gmail.com> napisał(a):
>>
>> On Thu, Apr 23, 2020 at 23:57:59 CEST, Lars <larsh@apache.org> wrote:
>>> This adds dual fan control for the following models:
>>> P50, P51, P52, P70, P71, P72, P1 gen1, X1E gen1, P2 gen2, and X1E gen2.
>>>
>>> Both fans are controlled together as if they were a single fan.
>>> [...]
>>> Background:
>>> I tested the BIOS default behavior on my X1E gen2 and both fans are always
>>> changed together. So rather than adding controls for each fan, this controls
>>> both fans together as the BIOS would do.
>> Hi Lars, why have you chosen to control multiple fans in this way?
>> I know that BIOS controls both fans together, but the EC has the capabilities
>> to control both fans independently, so maybe it can be convenient to expose
>> this feature.
> 
> +1
> Previous version of the patch [1] allows to control both fans independently.
> However some software like thinkfan is not ready to control two fans.
> But I also think this feature should be at least optionally exposed.
> 
> 
> [1] 
> https://github.com/civic9/thinkpad_acpi.2ndfan.patch/blob/master/thinkpad_acpi.2ndfan.patch/thinkpad_acpi.2ndfan.patch
> 

