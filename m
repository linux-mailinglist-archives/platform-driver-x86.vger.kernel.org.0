Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2885326876B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 14 Sep 2020 10:45:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726110AbgINIpK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 14 Sep 2020 04:45:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:23154 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726070AbgINIpJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 14 Sep 2020 04:45:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1600073106;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pW/vk94WsYEDRmXNshGA+k0R8rAa7yyDn4jRtsj9CG8=;
        b=Gnsy7hs0q+6AOQ5RUetgcdaWsJuYS62nl5EgdHIfkAPC0PZtSW+kAg/IFMYrbUYtO8BiO7
        YUlu6vf78mwjsZIt8cBbyHPSBKSCLTR2Nc70fuz+popE9hAdMRjf+k/5qJEmgt8jNTiEsO
        WpkcjhX7zPL6Z7fNp9NyUntTX3d5KRU=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-582-Ns4-XvEVP8qVeXpWsycPcg-1; Mon, 14 Sep 2020 04:45:05 -0400
X-MC-Unique: Ns4-XvEVP8qVeXpWsycPcg-1
Received: by mail-ed1-f71.google.com with SMTP id r19so8969489edq.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 14 Sep 2020 01:45:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pW/vk94WsYEDRmXNshGA+k0R8rAa7yyDn4jRtsj9CG8=;
        b=gy5dU6jMzxPqBBrXTvpM3leb47v0ACxdYU3fALbKd3wnhAB0dlw7OpO4dlpLQGcIdg
         vlNXiWSCD/6Z4OsSY7OXLCcv96LoeU4Qq94hemawIhl7PjsReePv/ovgspMmZeltM2XD
         JhRUYYE0A/4chnS1w9O5QTipOCE1d9S3RpA6BvorVflaWwBhrT8635yDktWxU8xe5aRm
         w1YM343nEcv6q4qbeFNwIhIm5OkpVez3KdPz/07v2ujhzaEM2zY8RBmk/07HFlZYLLx0
         33X/KZjb3t3e2j8WeWvE/SjcktWiHDnQsCEurp0AOv+/1Pops6kVTi2GA287zMq+fBCD
         +W9w==
X-Gm-Message-State: AOAM531rzB4KmAyBV/JGiCEKzPUZW9j8s7MJAySUGk5SufRqegG0STSO
        rwPWeu5ySDVO1wqC8A9i7KN5DUeBtQgvRx/j63LKBQcsDtTCmcAre+Xnj8XjCGeWTbK2mJgXnok
        sVgvWNstWvV7gu2JuAofZfsJA8xCTVuVRSA==
X-Received: by 2002:a17:907:408d:: with SMTP id nt21mr13288572ejb.355.1600073103718;
        Mon, 14 Sep 2020 01:45:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxqpFgAK/K/xz5l1UvFiBdC94iD63utdCj8DMpAFZ8VvVN87Ixvtwhq6KbisXo7mWn4AYgV+Q==
X-Received: by 2002:a17:907:408d:: with SMTP id nt21mr13288561ejb.355.1600073103520;
        Mon, 14 Sep 2020 01:45:03 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id p17sm1537912edw.10.2020.09.14.01.45.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2020 01:45:02 -0700 (PDT)
Subject: Re: [PATCH] Introduce support for Systems Management Driver over WMI
 for Dell Systems
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>,
        Divya Bharathi <divya27392@gmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "Bharathi, Divya" <Divya.Bharathi@Dell.com>,
        "Ksr, Prasanth" <Prasanth.Ksr@dell.com>
References: <20200730143122.10237-1-divya_bharathi@dell.com>
 <aa23d8b8-6c6b-b6f2-e916-1defff8a9b26@redhat.com>
 <DM6PR19MB26362B2A2CDFE73BE167FD34FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c5a6e340-66ec-e03b-a9a8-9c61b9f388d5@redhat.com>
Date:   Mon, 14 Sep 2020 10:45:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26362B2A2CDFE73BE167FD34FA2E0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

Sorry for being slow with getting back to you on this.

On 9/1/20 4:22 PM, Limonciello, Mario wrote:
>>
>> "A read-only attribute enumerating if a reboot is pending on any BIOS attribute
>> change."
>> does not really seem to make much sense. I guess what this is trying to say is:
>>
>> "This read-only attribute reads 1 if a reboot is necessary to apply pending BIOS
>> attribute changes"?
>>
>>                0:      All BIOS attributes setting are current
>>                1:      A reboot is necessary to get pending pending BIOS attribute
>> changes applied
>>
>> Or some such. I'm not really happy with my own text either, but I think it
>> better explains
>> what this attribute is about then the original text, right ?
> 
> I think that text does read better, Divya and team will reword it.
> 
> <snip>
> 
>>> +           display_name_language_code:     A file that can be read to obtain
>>> +           the language code corresponding to the "display_name" of the <attr>
>>
>> This needs to be specified better, e.g. this needs to say that this is an
>> ISO 639‑1 language code (or some other language-code specification)
> 
> Ack.
> 
>>
>>
>>> +
>>> +           modifier:       A file that can be read to obtain attribute-level
>>> +           dependency rule which has to be met to configure <attr>
>>
>> What is the difference between modifier and value_modifier ? Also this need to
>> be specified in more detail.
> 
> Ack.
> 
>>
>>> +
>>> +           possible_value: A file that can be read to obtain the possible
>>> +           value of the <attr>
>>
>> This is an enum, so possible value_s_ ?  I assume that for a enum this will list
>> all possible values, this also needs to specify how the possible values will be
>> separated (e.g. using semi-colons or newlines or ...).
> 
> Yes correct.
> 
>>
>>
>>> +
>>> +           value_modifier: A file that can be read to obtain value-level
>>> +           dependency on a possible value which has to be met to configure
>> <attr>
>>> +
>>> +What:              /sys/devices/platform/dell-wmi-
>> sysman/attributes/integer/<attr>/
>>> +Date:              October 2020
>>> +KernelVersion:     5.9
>>> +Contact:   Divya Bharathi <Divya.Bharathi@Dell.com>,
>>> +           Mario Limonciello <mario.limonciello@dell.com>,
>>> +           Prasanth KSR <prasanth.ksr@dell.com>
>>> +Description:
>>> +           This directory exposes interfaces for interaction with
>>> +           BIOS integer attributes.
>>> +
>>> +           Integer attributes are settings that accept a range of
>>> +           numerical values for inputs. Each BIOS integer has a
>>> +           lower bound and an upper bound on the values that it can take.
>>> +
>>> +           current_value:  A file that can be read to obtain the current
>>> +           value of the <attr>
>>> +
>>> +           This file can also be written to in order to update
>>> +           the value of an <attr>.
>>> +
>>> +           default_value:  A file that can be read to obtain the default
>>> +           value of the <attr>
>>> +
>>> +           display_name:   A file that can be read to obtain a user friendly
>>> +           description of the at <attr>
>>> +
>>> +           display_name_language_code:     A file that can be read to obtain
>>> +           the language code corresponding to the "display_name" of the <attr>
>>> +
>>> +           lower_bound:    A file that can be read to obtain the lower
>>> +           bound value of the <attr>
>>> +
>>> +           modifier:       A file that can be read to obtain attribute-level
>>> +           dependency rule which has to be met to configure <attr>
>>> +
>>> +           scalar_increment:       A file that can be read to obtain the
>>> +           resolution of the incremental value this attribute accepts.
>>> +
>>> +           upper_bound:    A file that can be read to obtain the upper
>>> +           bound value of the <attr>
>>
>> Are these integers or also possibly floats? I guess possibly also floats, right?
>> Then at a minimum this should specify which decimal-separator is used (I assume
>> we will go with the usual '.' as decimal separator).
> 
> In practice they're integers, but I don't see why they couldn't be floats.

Hmm, that is a bit hand-wavy, for an userspace ABI we really need to define
this clearly. Either it is integers (which is fine), or it is floats and we need
to define a decimal-separator as part of the ABI.

Note the reason why I started wondering about this in the first place is the
scalar_increment attribute. I think that can use some clarification too.

Regards,

Hans

