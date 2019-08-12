Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 49D2F8A7D8
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 22:05:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727297AbfHLUFS (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 16:05:18 -0400
Received: from mail.klausen.dk ([174.138.9.187]:54654 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727291AbfHLUFR (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 16:05:17 -0400
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1565640315;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YVDBFcFZDEu/qrRwZcpyRkEUmojDyRVuYOTPGzngDLs=;
        b=FUzgbR6xpoA0DkSgHAYa1ewI0MOrzcIYPSDq6HGaue9VB8/K7b7+JV5pqBwv76LMSYq5EI
        eaSDPU4lffz2z4Dy5HVhtm10Cq1TAX0SLEkJgs0u1xY7k897Pm5oXzwQaTKX4HqoYBJpNv
        neB53F9bAjQYpJ42uBUel6h04ezpaNQ=
From:   Kristian Klausen <kristian@klausen.dk>
To:     Daniel Drake <drake@endlessm.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190808195532.14220-1-kristian@klausen.dk>
 <CAD8Lp47ouXSj_kZggoL2JJzOUmi38k0jjLK=M+8c3YE=YNe+QA@mail.gmail.com>
 <67efc453-4286-774b-72ad-f3d494f44f7a@klausen.dk>
Message-ID: <5cbfc3f3-38c8-d9e3-bf20-d91a9b5de24e@klausen.dk>
Date:   Mon, 12 Aug 2019 22:05:14 +0200
MIME-Version: 1.0
In-Reply-To: <67efc453-4286-774b-72ad-f3d494f44f7a@klausen.dk>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 12.08.2019 14.57, Kristian Klausen wrote:
>> https://www.asus.com/us/support/FAQ/1032726/ doesn't really help us
>> here, looks like it was not written by a native English speaker.
>>
>> maximum_charging_percentage is a bit long, but how about
>> max_battery_charge or max_charge ?
> Maybe battery_max_charge to follow the same pattern as the LG/Samsumg 
> modules (battery_care_limit/battery_life_extender).
>
> What do you think?
I've done some more research. We should probably use the new battery 
hooking API[1], in a way similar to the the thinkpad_acpi module[2]. 
Naming wise we should use the recently added official charge control 
knobs[3].


[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=fa93854f7a7ed63d054405bf3779247d5300edd3
[2] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=2801b9683f740012863f7f0b1f0bc770c417fe72
[3] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=813cab8f3994250e136819ae48fbd1c95d980466
