Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 84AE286B14
	for <lists+platform-driver-x86@lfdr.de>; Thu,  8 Aug 2019 22:06:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404145AbfHHUGH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 8 Aug 2019 16:06:07 -0400
Received: from mail.klausen.dk ([174.138.9.187]:60040 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2404070AbfHHUGH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 8 Aug 2019 16:06:07 -0400
Subject: Re: [PATCH] platform/x86: asus-wmi: Add support for charge threshold
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1565294765;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1YlRSS7OJeLQMQ80Gzdat7UuHg2Sdlq8P5WZLVE6aJk=;
        b=M/4yeu1T/OirSuvao12+EsCSdKvOPZoqLaxwmCkq3WeSlagHA3EHQTguaoV65as8XLKfDn
        epcyFZ4XHOzzo0GxG84dQArntaafBoI0KKFIflaEB+iCWBf/NX+QztcVH10nOQm2PMY2V9
        j2oiQnmOqElurMQ7+YtRaetXUHXpC1M=
To:     Daniel Drake <drake@endlessm.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190805192305.9692-1-kristian@klausen.dk>
 <CAD8Lp44GEJTgxf+S6v8gZu0kABQodhGNuTz=TA-xwzuzkPWHwA@mail.gmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <e277f0fb-fc59-209a-1f47-297a6f62f4e0@klausen.dk>
Date:   Thu, 8 Aug 2019 22:06:03 +0200
MIME-Version: 1.0
In-Reply-To: <CAD8Lp44GEJTgxf+S6v8gZu0kABQodhGNuTz=TA-xwzuzkPWHwA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 08.08.2019 10.13, Daniel Drake wrote:
> On Tue, Aug 6, 2019 at 3:23 AM Kristian Klausen <kristian@klausen.dk> wrote:
>> Most newer ASUS laptops supports limiting the battery charge level, which
>> help prolonging the battery life.
>>
>> Tested on a Zenbook UX430UNR.
>>
>> Signed-off-by: Kristian Klausen <kristian@klausen.dk>
>> ---
>> I'm not sure what to call it, is charge threshold good enough or do you
>> have any better ideas?
> The spec calls it "Maximum Charging Percentage". I think something
> along those lines would be clearer.
I just sent a V2 patch.
I'm using "maximum charging percentage" in the documentation/commit 
message, but the knob is still named "charge_threshold".
> It would be good to have a one line explanatory comment against where
> you introduce the variable, so that it's clear from glancing at the
> code (not just the commit message) what this functionality actually
> is.documentation
Ack
> Also you need a Documentation/ entry for this new file where you can
> describe it a little more verbosely.
Ack
> The 0x00120057 device is officially called "Relative state of charge",
> not sure if you want to somehow follow a similar naming scheme there,
> I don't have a real preference.
The same name is used in ASUS online documentation. I change it.
https://www.asus.com/us/support/FAQ/1032726/
The current name also seems to lack DEVID.
>>   /* Misc */
>>   #define ASUS_WMI_DEVID_CAMERA          0x00060013
>> +#define ASUS_WMI_CHARGE_THRESHOLD      0x00120057
> Please keep the devices ordered numerically by their ID
Ack

Kristian
