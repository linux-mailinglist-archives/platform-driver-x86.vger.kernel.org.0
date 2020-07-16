Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3EDD222C7B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Jul 2020 22:08:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729136AbgGPUIz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Jul 2020 16:08:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729048AbgGPUIz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Jul 2020 16:08:55 -0400
Received: from mail.klausen.dk (mail.klausen.dk [IPv6:2001:470:1f0b:1730::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 355BCC061755
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Jul 2020 13:08:55 -0700 (PDT)
Subject: Re: A problem regarding asus-wmi and charging thresholds
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1594930132;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fg3gDRXZtn9EQDvEsPXVWUHVE0VGmkm+pEBTvL7xVU8=;
        b=bfnGozeKe0gd79KCsxxFl0u1ajiYxYL6ziHHIlN18OiB/E1nmTakQxwHfpN3e7WmB5JGT6
        P7soDfqn/21Z+q9Yd+H7vrow+Q9lhKXunByvpBaw1qf1tUzak01oPNXqSPH93qC491b49j
        TxJCIQ6N4S4E9VfE9jpY2jqn6SrE6uE=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Mark Enriquez <bugmenot.oss@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Cc:     Andy Shevchenko <andy@infradead.org>,
        Corentin Chary <corentin.chary@gmail.com>
References: <CALLB5ZuOCTftvp32TG9y=peMqJn1w_FSNKWmVYU6pJ-imWO4Ug@mail.gmail.com>
 <CAHp75Vc0G5nN64+5RtFwgV5V9GZGvwYEg+-yLOTUwEuJZDkyLw@mail.gmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <4ee2240f-b036-87f2-cf3b-0ed090093020@klausen.dk>
Date:   Thu, 16 Jul 2020 22:08:50 +0200
MIME-Version: 1.0
In-Reply-To: <CAHp75Vc0G5nN64+5RtFwgV5V9GZGvwYEg+-yLOTUwEuJZDkyLw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 15.07.2020 07.33, Andy Shevchenko wrote:
> +Cc: PDx86 mailing list
>
> On Wed, Jul 15, 2020 at 5:40 AM Mark Enriquez <bugmenot.oss@gmail.com> wrote:
>> TL;DR; On some "newer" asus laptops, the first battery is listed as BAT1 as if using the 1-index of counting, rather than "BATT", which prevents having a "charge_control_end_threshold" file present.

It was also reported here: 
https://gist.github.com/klausenbusk/643f15320ae8997427155c38be13e445#gistcomment-3307147

> I believe we have a fix for this
> http://git.infradead.org/linux-platform-drivers-x86.git/commit/a6146ab8a57b6a84e3643398605ec6f897a69365

I did consider sending a patch, but adding every battery name isn't 
scalable. Maybe we should just remove the check? The purpose of the 
logic is to ensure "charge_control_end_threshold" is only added for the 
primary battery, but assuming a laptop have two batteries they are 
probably named BAT0 and BAT1 (+ I've never heard of ASUS laptops with 
more than one battery).

Another option, would be changing the logic so the knob is only added 
the first time the add_battery hook is called (a global boolean?)

>> Good day,
>>  From this commit
>> /6b3586d45bba14f6912f37488090c37a3710e7b4 "platform/x86: asus-wmi: Support laptops where the first battery is named BATT"
>>
>> I also have seen that on a "newer" asus laptop (vivobook x571gt) the first battery is "BAT1" rather than "BATT".
>>
>> Yet, the "charge_control_end_threshold" file does also work on the system ... well, after recompiling the kernel with this additional case in.
>>
>> Writing to this file does limit the RSOC of the battery and stops charging at the set threshold, albeit with the status "Unknown" instead of "Not Charging" but that's for another case.
>>
>> The corresponding bugzilla report is in https://bugzilla.kernel.org/show_bug.cgi?id=208385.
>>
>> Thank you.
>
>

