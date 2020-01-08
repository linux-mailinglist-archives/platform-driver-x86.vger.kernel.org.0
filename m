Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ED253134355
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Jan 2020 14:05:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726683AbgAHNF5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Jan 2020 08:05:57 -0500
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:34085 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726672AbgAHNF4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Jan 2020 08:05:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578488755;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=4ZyNWhxAqEND9gNENO394kM2pqYdc/AHJLcS0vI9DMM=;
        b=V0rsKkqxMPD34JQ7SEAWZ7S0anxhp62DfBSB9fFGnhXUtFsXRqXpUfszw4cacxPWbkZP8N
        VRBESF5r3k/OTzVwoLjeSz7ceU4XJdM/C4y0DdEgiWbmBbqaJjsqsbuO+FP9ohL3qJLKiY
        AjrPQbkRhjpQFOBEfcFhVunaHFgirbo=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-410-MM3oB5xbOpGhmysGNT3AtA-1; Wed, 08 Jan 2020 08:05:54 -0500
X-MC-Unique: MM3oB5xbOpGhmysGNT3AtA-1
Received: by mail-wm1-f69.google.com with SMTP id q26so382584wmq.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Jan 2020 05:05:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=4ZyNWhxAqEND9gNENO394kM2pqYdc/AHJLcS0vI9DMM=;
        b=ixFZ+1PX6/W/WwmZD5nXzyjAxqhxx+96mzPea4bbaKD2EbtWoTg4EBehY3+R1yBtPZ
         5pdqvw8Ge6jhB9YOQjFqlDWCJ1vFsm9dVaDwQ+aimKrr60LS4N0h0ObVl2qP5S2254Xd
         aRLH1zhADxMQiAYnPAWgGYVovUvZjV+PACtCo5JOaUJle+NCzfl7lNbiU867QhNKlgtp
         h1EhV6qeGkwEfHPXVOW/0XoidPguDYTJcldgoKY7qNxD06rwH6nWcM4k24R7Gj01Pn94
         j+NDQ9kJoAoJxfunOMLmh7NwrK3tj8uOhxJtOZyjBZ/CV9tcR/eCmXasoYTVQe/DZC55
         i0Xg==
X-Gm-Message-State: APjAAAUMfh1uCKOGr7iUbwnkFMWEbht8jXH7P2uIVZD2p+xaehiOB8yU
        r43MU/iDoHqXtLx1Mo6T/xJrAZ41kLnIoFuYkCmF+86Nd7zBBV0/9lOa5TDj+UWBWsFHfJUPy60
        mrMMbUl5kFDS4bTXNx20MwzRr4GwPiqCwGw==
X-Received: by 2002:adf:9104:: with SMTP id j4mr4487911wrj.221.1578488752746;
        Wed, 08 Jan 2020 05:05:52 -0800 (PST)
X-Google-Smtp-Source: APXvYqwt6raJ7XXDO0y1F3AZXYQAKrwGE7wlqeRaiMVFND1I9TfQEzmcWJEIWeRKIEM6yMULuh+dcQ==
X-Received: by 2002:adf:9104:: with SMTP id j4mr4487891wrj.221.1578488752529;
        Wed, 08 Jan 2020 05:05:52 -0800 (PST)
Received: from shalem.localdomain (2001-1c00-0c0c-fe00-7e79-4dac-39d0-9c14.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:7e79:4dac:39d0:9c14])
        by smtp.gmail.com with ESMTPSA id g9sm4245246wro.67.2020.01.08.05.05.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 08 Jan 2020 05:05:50 -0800 (PST)
Subject: Re: [PATCH 2/2] platform/x86: GPD pocket fan: Allow somewhat
 lower/higher temperature limits
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Jason Anderson <jasona.594@gmail.com>
References: <20200106144219.525215-1-hdegoede@redhat.com>
 <20200106144219.525215-2-hdegoede@redhat.com>
 <CAHp75Ve5XF-UZw6D-OUCkgOPMYH0DgT1L5uVNGRuLmZ6Cjd1KA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2df70a79-10e1-ea9e-0425-dcc46c1e28bc@redhat.com>
Date:   Wed, 8 Jan 2020 14:05:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.3.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve5XF-UZw6D-OUCkgOPMYH0DgT1L5uVNGRuLmZ6Cjd1KA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 08-01-2020 13:23, Andy Shevchenko wrote:
> On Mon, Jan 6, 2020 at 4:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Allow the user to configure the fan to turn on / speed-up at lower
>> thresholds then before (20 degrees Celcius as minimum instead of 40) and
>> likewise also allow the user to delay the fan speeding-up till the
>> temperature hits 90 degrees Celcius (was 70).
>>
>> Cc: Jason Anderson <jasona.594@gmail.com>
> 
>> Reported-by: Jason Anderson <jasona.594@gmail.com>
> 
> My understanding of this tag that the report assumes a bug to fix
> followed up with a corresponding Fixes tag.

Well in a way the old min/max for the limits being to strict a bug
and Jason pointed this out so I want to give him credit for that.

OTHO Fixes: feels a little bit to strong, even without a Cc: stable
tag, commits with Fixes: in there are almost guaranteed to be picked
up for the stable series and in this case that seems unnecessary to me.

If you do want to add a Fixes: tag then adding the one from patch 1/2
makes the most sense.

Regards,

Hans



> 
>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>> ---
>>   drivers/platform/x86/gpd-pocket-fan.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/platform/x86/gpd-pocket-fan.c b/drivers/platform/x86/gpd-pocket-fan.c
>> index 1e6a42f2ea8a..0ffcbf9bc18e 100644
>> --- a/drivers/platform/x86/gpd-pocket-fan.c
>> +++ b/drivers/platform/x86/gpd-pocket-fan.c
>> @@ -126,7 +126,7 @@ static int gpd_pocket_fan_probe(struct platform_device *pdev)
>>          int i;
>>
>>          for (i = 0; i < ARRAY_SIZE(temp_limits); i++) {
>> -               if (temp_limits[i] < 40000 || temp_limits[i] > 70000) {
>> +               if (temp_limits[i] < 20000 || temp_limits[i] > 90000) {
>>                          dev_err(&pdev->dev, "Invalid temp-limit %d (must be between 40000 and 70000)\n",
>>                                  temp_limits[i]);
>>                          temp_limits[0] = TEMP_LIMIT0_DEFAULT;
>> --
>> 2.24.1
>>
> 
> 

