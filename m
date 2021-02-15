Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C2D9731B844
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Feb 2021 12:46:18 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229945AbhBOLph (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Feb 2021 06:45:37 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:31504 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229979AbhBOLpY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Feb 2021 06:45:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1613389431;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NyLZvu3C9gxrD7BWsY94nLA5hwIfWLctPM6LAQPWhHE=;
        b=DnfkB6k0KYLqYg2lHsolEUlGMyATj1e76Nl+N5NgyGYYVJT1HIf+O53s0K6upw9zjlylaO
        MYWT/hvQcCwOPgWOzjZK0d4v+ypV7s2nmsWY5IeKnHZ3hCVhb/57fOw1gq9zhWn2GW7D9p
        uJDja4oVVJbvbe3jlIq68Z94I8U0A6A=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-599-RjVqYtIXMYaHUlTXUG0T4A-1; Mon, 15 Feb 2021 06:43:49 -0500
X-MC-Unique: RjVqYtIXMYaHUlTXUG0T4A-1
Received: by mail-ed1-f69.google.com with SMTP id g5so223290eds.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Feb 2021 03:43:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=NyLZvu3C9gxrD7BWsY94nLA5hwIfWLctPM6LAQPWhHE=;
        b=nvZpZgbty+W/N+jYY+bqvpCq4J+ijeanzSoj92yLkMc4a7TcM/873RiqQsiMAueLTW
         FJICp8KPuhCc9T8FFk6Ns6DRoycagC1an+L4oCnjIpvGzrszGZ1SWlffJj73UvCNzHVL
         +f+tgfY63IocALE5BHsTH20sMGmeHdQRpJKnY7u+SsSuYGAuP1jYJBLo0Qbm5AmtOqUR
         ObdKZtT6EIu8cvW+gJV9LTeUWW5RJCnfj1V6Y6tXWgUyaGMswBMwyuqurqvNPbRrtSjM
         1+Xb97iBGo8mNlIuQlAZNuMMAxsgiVwaVuWusbOzN9D1Q93k+hmk5nqq2/YDfrRAE4Er
         zp9Q==
X-Gm-Message-State: AOAM530PZ6mUwUs4cdHJjDX+nUuK0Y5kXA6nL2srJW11K5BLRsjfEMsj
        YWRcicriQoaQPYw9dwDhspFQwkPfRIiVCPU6gyR3mQxLS+62DhKrZVtoLecFMPEtGPd4ZW+RT76
        0dZj+73a68x/zKHV2Ksd89xIEbHKWhYvpBQ==
X-Received: by 2002:a17:906:2e43:: with SMTP id r3mr6862795eji.279.1613389428732;
        Mon, 15 Feb 2021 03:43:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwhwJ5khStYq3Vqinasnp+W4Qh6cW9Jw9bGQdGQqj903lJ0uEA4CJ3iVvkdAwWRIqbSeBHiyQ==
X-Received: by 2002:a17:906:2e43:: with SMTP id r3mr6862782eji.279.1613389428553;
        Mon, 15 Feb 2021 03:43:48 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id u18sm10278200ejc.76.2021.02.15.03.43.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Feb 2021 03:43:48 -0800 (PST)
Subject: Re: [RFC PATCH 1/7] drivers: base: Add resource managed version of
 delayed work init
To:     "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>
Cc:     "Vaittinen, Matti" <Matti.Vaittinen@fi.rohmeurope.com>,
        "linux@roeck-us.net" <linux@roeck-us.net>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
        "bgolaszewski@baylibre.com" <bgolaszewski@baylibre.com>,
        "dan.j.williams@intel.com" <dan.j.williams@intel.com>,
        "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
        "sre@kernel.org" <sre@kernel.org>,
        "linux-arm-msm@vger.kernel.org" <linux-arm-msm@vger.kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jdelvare@suse.com" <jdelvare@suse.com>,
        "mgross@linux.intel.com" <mgross@linux.intel.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "lgirdwood@gmail.com" <lgirdwood@gmail.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "wens@csie.org" <wens@csie.org>,
        "saravanak@google.com" <saravanak@google.com>,
        "heikki.krogerus@linux.intel.com" <heikki.krogerus@linux.intel.com>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "rafael@kernel.org" <rafael@kernel.org>,
        "myungjoo.ham@samsung.com" <myungjoo.ham@samsung.com>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "agross@kernel.org" <agross@kernel.org>,
        "cw00.choi@samsung.com" <cw00.choi@samsung.com>
References: <cover.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <1230b0d2ba99ad546d72ab079e76cb1b3df32afb.1613216412.git.matti.vaittinen@fi.rohmeurope.com>
 <2fb4b305-a93f-f91e-3001-dab5057e39cc@redhat.com>
 <084893a3-0071-13e9-5ce6-b7b027e6cd2a@roeck-us.net>
 <16140f5b-c504-1c07-9f0c-3813d686d157@redhat.com>
 <74ec29cb5780e93cca3d4cdec221c65e764c8a3e.camel@fi.rohmeurope.com>
 <400d3e82-a76e-136c-0e03-ed7e40608e2a@redhat.com>
 <YCpbit8W3xsvb37Q@kroah.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <a1e74f7c-06d3-dfd0-c467-ea68af6f081f@redhat.com>
Date:   Mon, 15 Feb 2021 12:43:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <YCpbit8W3xsvb37Q@kroah.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 2/15/21 12:31 PM, gregkh@linuxfoundation.org wrote:
> On Mon, Feb 15, 2021 at 11:37:26AM +0100, Hans de Goede wrote:
>> Hi,
>>
>> On 2/15/21 8:22 AM, Vaittinen, Matti wrote:
>>>
>>> On Sat, 2021-02-13 at 16:59 +0100, Hans de Goede wrote:
>>>> Hi,
>>>>
>>>> On 2/13/21 4:27 PM, Guenter Roeck wrote:
>>>>> On 2/13/21 7:03 AM, Hans de Goede wrote:
>>>>> [ ... ]
>>>>>> I think something like this should work:
>>>>>>
>>>>>> static int devm_delayed_work_autocancel(struct device *dev,
>>>>>> struct delayed_work *w,
>>>>>> 					void (*worker)(struct
>>>>>> work_struct *work)) {
>>>>>> 	INIT_DELAYED_WORK(w, worker);
>>>>>> 	return devm_add_action(dev, (void (*action)(void
>>>>>> *))cancel_delayed_work_sync, w);
>>>>>> }
>>>>>>
>>>>>> I'm not sure about the cast, that may need something like this
>>>>>> instead:
>>>>>>
>>>>>> typedef void (*devm_action_func)(void *);
>>>>>>
>>>>>> static int devm_delayed_work_autocancel(struct device *dev,
>>>>>> struct delayed_work *w,
>>>>>> 					void (*worker)(struct
>>>>>> work_struct *work)) {
>>>>>> 	INIT_DELAYED_WORK(w, worker);
>>>>>> 	return devm_add_action(dev,
>>>>>> (devm_action_func)cancel_delayed_work_sync, w);
>>>>>
>>>>> Unfortunately, you can not type cast function pointers in C. It is
>>>>> against the C ABI.
>>>>> I am sure it is done in a few places in the kernel anyway, but
>>>>> those are wrong.
>>>>
>>>> I see, bummer.
>>>
>>> I think using devm_add_action() is still a good idea.
>>
>> Yes, we could also just have a 1 line static inline function to do
>> the function-cast. Like this:
>>
>> static inline void devm_delayed_work_autocancel_func(void *work)
>> {
>> 	cancel_delayed_work_sync(work);
>> }
>>
>> static inline int devm_delayed_work_autocancel(struct device *dev, struct delayed_work *w, void (*worker)(struct work_struct *work))
>> {
>> 	INIT_DELAYED_WORK(w, worker);
>> 	return devm_add_action(dev, devm_delayed_work_autocancel_func, w);
>> }
>>
>> Both functions will then simply be compiled out in files which do not
>> use them.
>>
>>>> If we add a devm_clk_prepare_enable() helper that should probably be
>>>> added
>>>> to drivers/clk/clk-devres.c and not to drivers/base/devres.c .
>>>>
>>>> I also still wonder if we cannot find a better place for this new
>>>> devm_delayed_work_autocancel() helper but nothing comes to mind.
>>>
>>> I don't like the idea of including device.h from workqueue.h - and I
>>> think this would be necessary if we added
>>> devm_delayed_work_autocancel() as inline in workqueue.h, right?
>>
>> Yes.
>>
>>> I also see strong objection towards the devm managed clean-ups.
>>
>> Yes it seems that there are some people who don't like this, where as
>> others do like them.
>>
>>> How about adding some devm-helpers.c in drivers/base - where we could
>>> collect devm-based helpers - and which could be enabled by own CONFIG -
>>> and left out by those who dislike it?
>>
>> I would make this something configurable through Kconfig, but if

Clarification I meant to write: "I would NOT make this something configurable through Kconfig".

>> go the static inline route, which I'm in favor of then we could just
>> have a:
>>
>> include/linux/devm-cleanup-helpers.h
>>
>> And put everything (including kdoc texts) there.
>>
>> This way the functionality is 100% opt-in (by explicitly including
>> the header if you want the helpers) which hopefully makes this a
>> bit more acceptable to people who don't like this style of cleanups.
>>
>> I would be even happy to act as the upstream maintainer for such a
>> include/linux/devm-cleanup-helpers.h file, I can maintain it as part
>> of the platform-drivers-x86 tree (with its own MAINTAINERS entry).
>>
>> Greg, would this be an acceptable solution to you ?
> 
> I don't know, sorry, let's revisit this after 5.12-rc1 is out, with a
> patch set that I can review again, and we can go from there as I can't
> do anything until then...

Ok.

Regards,

Hans

