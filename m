Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2FAFF30C21B
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Feb 2021 15:42:33 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234624AbhBBOm2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Feb 2021 09:42:28 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:60418 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234696AbhBBOhY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Feb 2021 09:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1612276557;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=yuioLk+QBKsBksw92DnH4UnwQxafZS+S4qY6HXlBF3g=;
        b=a+2Uhu9fQAHaRQOo9pvpQdqkKW/OnC2yTkWy2Cq6mIe8ONvz8ogPSZLkfZCfeZd4/d5YSG
        uh120LQgHNgO1g0aAOXCpmbYgZWNEOiQInPZKNbt4oSbRApxnSolKUcpAMQd0SOGhmhnxn
        TK15vIPR8pxqMhcccn8lL8Xl+Vhsaj0=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-474-sQxgQXdPPJ2fY6U1EDFyow-1; Tue, 02 Feb 2021 09:35:55 -0500
X-MC-Unique: sQxgQXdPPJ2fY6U1EDFyow-1
Received: by mail-ej1-f69.google.com with SMTP id h4so10128703eja.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Feb 2021 06:35:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=yuioLk+QBKsBksw92DnH4UnwQxafZS+S4qY6HXlBF3g=;
        b=qJHU2w1yKRaRLXFGsvP/J5cCLofV1ubU0K3bceh0AgCM0srWU+M5q7BeDLpQfAKSmj
         mVhrAmf5bTFrF1oCeYbUZkSZ2ttkJh2YYqj5z9/fUgccUiL78X61GIbQzVgJihRSbb0f
         5rp5/3Qf6QHHmuuY2aJY62ECz/o4pWQw57gsGcdGa/nl2oFoAjemmanGQDdfVJeHtsR0
         BILbkKyHhJAHa0PrS/q1F8GGqT3R3+2vNn9rjWwDjEi0W7yHk5UQqvuk+4ZpXkuAzExx
         V8PdpucHNhb/ryy8g+3ll61YCdjaz5I3w0zTR0ReeFAHrAbduw7+VY0IPRfpDyLL7f9z
         c20A==
X-Gm-Message-State: AOAM5302GxENkI7bT+Y7ul7Bknt7wUbPuT0F+RcbDz5Aqj5Dshctfuxv
        VpU9z/CAvdAQEVoLGrGtPEIBjSaHLeijEOuTEHRV1BKbFaDpNqAPxqfGfhLSou8dyJrJpzUnw5n
        6SmbISl1d/IBdbNSnhefCMihCzDnPtqc9mUurIjpsHGjHE9KEGALfXm1m0Mjbtu1ohzu9F2aL7y
        +n0KrZqvCvOw==
X-Received: by 2002:a17:906:8555:: with SMTP id h21mr13769679ejy.403.1612276553550;
        Tue, 02 Feb 2021 06:35:53 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzX376850pRzW8rhJndm8qGoRK4hnvatMT4A3h6h/V51T3FYCBdyNuksIIYpZES05LFx/deHQ==
X-Received: by 2002:a17:906:8555:: with SMTP id h21mr13769660ejy.403.1612276553364;
        Tue, 02 Feb 2021 06:35:53 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-37a3-353b-be90-1238.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:37a3:353b:be90:1238])
        by smtp.gmail.com with ESMTPSA id dm6sm9232402ejc.32.2021.02.02.06.35.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Feb 2021 06:35:52 -0800 (PST)
Subject: Re: How to detect Cherry Trail vs Brasswell inside the kernel ?
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Andy Shevchenko <andy@infradead.org>, linux-acpi@vger.kernel.org,
        x86@kernel.org,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
References: <37906985-e026-48d3-cda8-6e63696e72aa@redhat.com>
 <X/XQak3+YtbyeAqM@hirez.programming.kicks-ass.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2d5b3911-b4b0-70bd-6ac0-c418fef0c682@redhat.com>
Date:   Tue, 2 Feb 2021 15:35:52 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.1
MIME-Version: 1.0
In-Reply-To: <X/XQak3+YtbyeAqM@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/6/21 3:59 PM, Peter Zijlstra wrote:
> On Wed, Jan 06, 2021 at 01:31:46PM +0100, Hans de Goede wrote:
>> Hi All,
>>
>> I've 2 different kernel bugs where the fix requires differentiating between
>> Cherry Trail vs Brasswell, just checking the CPU model does not allow to
>> differentiate between these 2 since they are both using Airmont cores.
>>
>> I have the same issue with the Bay Trail laptop SoCs vs the
>> Bay Trail-T tablet SoCs, but for now lets focus on
>> Cherry Trail vs Brasswell since that is less confusing:
>>
>> https://ark.intel.com/content/www/us/en/ark/products/codename/46629/cherry-trail.html
>> https://ark.intel.com/content/www/us/en/ark/products/codename/66094/braswell.html
>>
>> So I see a number of possible solutions here:
>>
>> 1) Do a (substring) check on the CPU model-name checking for "x5-Z8" and "x7-Z8"
>> 2) Check for presence of some embedded peripheral which is present on one but not the
>> other. E.g. The Braswell devices have HDA audio where as the Cherry Trail devices
>> use the "Low Power Engine (LPE) Audio Controller"
>> 3) Check for acpi_gbl_reduced_hardware, but I'm not sure if that is a reliable
>> indicator of running on the tablet versions of the SoCs.
>>
>> 1 and 2 will work but neither is very pretty, I guess I could try to spend some
>> more time investigating 3. But I only have limited access to the non tablet versions
>> of the Bay Trail and I'm not sure if I have any Braswell devices at all. 
>>
>> So I was wondering if anyone else has any better ideas here?
> 
> Does MSR_PLATFORM_ID (0x17) bits 50-52 work to differentiate these?

Thank you, that is (was) a good idea.

So since you send this email I've added a debug print to the kernel for these
bits and collected the output of that debug print on various devices.

Unfortunately these bits always read 0 on all Bay Trail / Bay Trail-T /
Cherry Trail devices which I've tested, so these bits do not help.

Regards,

Hans

