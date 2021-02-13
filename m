Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8337731ACCD
	for <lists+platform-driver-x86@lfdr.de>; Sat, 13 Feb 2021 17:01:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229584AbhBMQBN (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 13 Feb 2021 11:01:13 -0500
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:30138 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229625AbhBMQBH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 13 Feb 2021 11:01:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613231981;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=FXggbj+8y1Ofgfpz7InHjYBqltBMGpvkXr1bSLy2fGA=;
        b=jBqId1N4QCUxFAi2nLbA8tK0NUXKhYSsbeXLFP5+1gYS7NZmEaHuYH5nKu6y601RoqOhSe
        zSybmvlnecN14sa8w+6gZ+UlBImfZEg4Y/iN3d+QAiplP1vP0Z4WTnmKJ03xe6FGgJXxO7
        xTTmO9dJ1/czlU6jJAmxUy0RsRUsqb8=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-454-VZLpqntqNGCHDOwSLaP1gA-1; Sat, 13 Feb 2021 10:59:39 -0500
X-MC-Unique: VZLpqntqNGCHDOwSLaP1gA-1
Received: by mail-ed1-f71.google.com with SMTP id m16so2256477edd.21
        for <platform-driver-x86@vger.kernel.org>; Sat, 13 Feb 2021 07:59:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=FXggbj+8y1Ofgfpz7InHjYBqltBMGpvkXr1bSLy2fGA=;
        b=WxCW5SGSRYxXf2kp6i9IEdwduEdJYJO+Umgo+ia+eBsLAAWbtHHiwBzZxkc+5Eg9LP
         fkQwHyXHNanUfqrN/lP2hUrXJLLfkB9jUCEXxcHl9zWio/pr5tLGRj+sJtbj+JuXnfPy
         8OI3P78qeLNwfw8yh7uc17JYkC5fvK/C7J7EXdnbLV0jAGtjdzE9AELYUUd9XCxJkurN
         JjIRxCaZrTBY/wBglpJcoQ32MCAUfnzEbWLbPWKoUczX9WH3mLZIWdyOlWl4NI3kGpso
         eD0NZHLoRTOuJYnD9+Qu3HQGmjO7kLu43cAIAkhtIjcuuFi3Lg0st2WbMzjKcs0PC1jp
         qJDQ==
X-Gm-Message-State: AOAM530vW5UoCHHd1gjOQWLmcqK7ACRQPSSEEiPQulI86s4rHK+9Vnnq
        rWAkH7XzvNTG0xaukk/p6/6gP3f6TeDxL8jyFIkh0qspifEq9FWClIPvIWZq6t2SH69pFYQT5SG
        h0OC/tF+w+v2tmgR1lfd0t7Pm/SjfMojF+A==
X-Received: by 2002:a17:906:fac4:: with SMTP id lu4mr6945485ejb.202.1613231977876;
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxxUwxZNF6Wq4CzD+FidZQWOwT5L2B4wwIuDjp/31XIy7RZk7xNBf2bDkl7iDK6Vm+5g+/bFw==
X-Received: by 2002:a17:906:fac4:: with SMTP id lu4mr6945464ejb.202.1613231977649;
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z13sm7322713edc.73.2021.02.13.07.59.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 13 Feb 2021 07:59:37 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     Guenter Roeck <linux@roeck-us.net>,
        Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Saravana Kannan <saravanak@google.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Joerg Roedel <jroedel@suse.de>,
        Dan Williams <dan.j.williams@intel.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <2fb4b305-a93f-f91e-3001-dab5057e39cc@redhat.com>
 <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <16140f5b-c504-1c07-9f0c-3813d686d157@redhat.com>
Date:   Sat, 13 Feb 2021 16:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/13/21 4:27 PM, Guenter Roeck wrote:
> On 2/13/21 7:03 AM, Hans de Goede wrote:
> [ ... ]
>>
>> I think something like this should work:
>>
>> static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
>> 					void (*worker)(struct work_struct *work)) {
>> 	INIT_DELAYED_WORK(w, worker);
>> 	return devm_add_action(dev, (void (*action)(void *))cancel_delayed_work_sync, w);
>> }
>>
>> I'm not sure about the cast, that may need something like this instead:
>>
>> typedef void (*devm_action_func)(void *);
>>
>> static int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w,
>> 					void (*worker)(struct work_struct *work)) {
>> 	INIT_DELAYED_WORK(w, worker);
>> 	return devm_add_action(dev, (devm_action_func)cancel_delayed_work_sync, w);
> 
> Unfortunately, you can not type cast function pointers in C. It is against the C ABI.
> I am sure it is done in a few places in the kernel anyway, but those are wrong.

I see, bummer.

> This is the reason why many calls to devm_add_action() point to functions such as
> 
> static void visconti_clk_disable_unprepare(void *data)
> {
>         clk_disable_unprepare(data);
> }
> 
> which could otherwise be handled using typecasts.

Hmm, wouldn't something like this be a candidate for adding a:

devm_clk_prepare_enable() helper?

This seems better then having the driver(s) make + error check separate
clk_prepare_enable() + devm_add_action_or_reset() calls ?

I must admit I'm guilty myself of just using devm_add_action() sometimes
when a specific devm helper is missing, but this whole discussion makes
me think that it would be good to have some extra devm helpers for
common cases / driver cleanup patterns.

If we add a devm_clk_prepare_enable() helper that should probably be added
to drivers/clk/clk-devres.c and not to drivers/base/devres.c .

I also still wonder if we cannot find a better place for this new
devm_delayed_work_autocancel() helper but nothing comes to mind.

Regards,

Hans

