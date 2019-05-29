Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 5573F2D909
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 May 2019 11:29:19 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726012AbfE2J3P (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 29 May 2019 05:29:15 -0400
Received: from mail-ed1-f65.google.com ([209.85.208.65]:41846 "EHLO
        mail-ed1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725914AbfE2J3O (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 29 May 2019 05:29:14 -0400
Received: by mail-ed1-f65.google.com with SMTP id m4so2683230edd.8
        for <platform-driver-x86@vger.kernel.org>; Wed, 29 May 2019 02:29:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6F5livGj4UyxTZEUtna3VZI7Zcp0JQNFjAQCsV6Sw70=;
        b=glLA9YQGzPvBsCBLpFBf0dIZC/kM+VCq4S3DwyMYRS0AvCTSTx0Q4TcMHuiX/IkkIU
         r9pZJnRfQjF0FAV7W0qXuJ/SgNvzPwqKYf8kEuQLaJOnBLj46eX+IbYP3cwjiCPXuR6+
         C2F4b/i9HbzspzpqA3gGD1LqpMVYwe5/oDERvUY8YhKGzZ5NOb0Bl9nK2GIakBs/+uTO
         75e1M4Y0bklu1s8bb0BziA2F0YZOZDqwsvEdNC54ClPwrwdPsKIu5gRwgVJ6wfqkjcGx
         sS8POctM8kCl62ySORim4xPUbWYk6N4T0e6wAwUfyoZ2r87eBvAdvDgXLMaB/qxTwR3B
         5FlA==
X-Gm-Message-State: APjAAAXxWGpSo2vwZpiBr3WpNPsyEg5/oQlR7CJ7tsB1hRKqr5Yd9njV
        ei319YvkdZ7MjXpxf+C4Kp3SdK3doEg=
X-Google-Smtp-Source: APXvYqyx7oJt3oeytHlo4YUghphdLsZZR4EforRPatuGOa92OU8FNKgo91Kd+vmXlx22CbsU/hQZJA==
X-Received: by 2002:a17:906:a843:: with SMTP id dx3mr35633499ejb.64.1559122152841;
        Wed, 29 May 2019 02:29:12 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id j23sm452331ejc.21.2019.05.29.02.29.11
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 May 2019 02:29:12 -0700 (PDT)
Subject: Re: [PATCH v4 00/16] Software fwnode references
To:     Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Andy Shevchenko <andy@infradead.org>,
        linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <eb63bdfe-e863-2041-9b90-81b423f92baa@redhat.com>
Date:   Wed, 29 May 2019 11:29:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190522105113.11153-1-heikki.krogerus@linux.intel.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/22/19 12:50 PM, Heikki Krogerus wrote:
> Hi,
> 
> I'm not splitting this series in two after all. After thinking about
> this for some time, I decided to add support for static software
> nodes. I did not want to support them because I don't want to make it
> easy to maintain board files, but in end they make the use of the
> software nodes so much more easier compared to if we always had to
> dynamically allocate them that it's a no-brainer. The references can
> now be also described statically. Actually, those can now only be
> described statically.
> 
> Hans! I applied (hopefully) all of the fixes you proposed in v3. I
> hope you have time to test these.

I've just ran various tests with the entire series applied and
everything (superspeed host, superspeed device, DP over Type-C,
PD charging) seems to work fin, so you can add my:

Tested-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

I've 2 very minor nitpicks about the intel_cht_int33fe patches,
with those fixed, you can also add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the intel_cht_int33fe patches. I will reply to the
2 individual patches for which I've some remarks
separately.

Regards,

Hans
