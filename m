Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 554FA8A409
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 19:11:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726453AbfHLRLL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 13:11:11 -0400
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45873 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726263AbfHLRLL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 13:11:11 -0400
Received: by mail-wr1-f67.google.com with SMTP id q12so14968973wrj.12
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2019 10:11:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=jFnuJZVQFPQyazcjhYDCZNSIR8govzD11YyaXFhq9aQ=;
        b=W4yg0U09E7a7qU0WdlN3basVtMvavnyXww/SA28RredN9E8CLYsBCeRY16TavT0N4h
         cQoBMIr+IXsayj8KfpRY1a/rsCApBXsFNcmimXPar2boTd8v8bTtZfRfMm1S4CNGG/hN
         /lm9a6O0u9RQrBEDsAfj5r6vf0D33OYNk2kx4jIgeIGO1Cj7mMn+S8bXP+aZj0/UoVSC
         v6j2xX8QTWm1sh06BzEA3yh5q42Chz6beuESWVxmfXfzitQA2Cq3jJ1f5ioFhhGIJmIw
         59Ga9vHCqIlY7QRX1YsAMz827Lhwt9NzWG8lWNHSSeT9OG4evQm40MIqwrCcNNS9ukMw
         zzQQ==
X-Gm-Message-State: APjAAAXxvX3RxulVxApj8I0rNhEozfU/d6/rGl6qojKkJNctihYy10fp
        +QW1NlgDyTGyWLodvF4xBXc66w==
X-Google-Smtp-Source: APXvYqxzL49EWA/fgCz3RkTf2I1ICChJvJhQBDiqrRxJ0qWq26yZtdpRgea5sWN2rfqltVbdlm3eXA==
X-Received: by 2002:adf:da4d:: with SMTP id r13mr43485095wrl.281.1565629868822;
        Mon, 12 Aug 2019 10:11:08 -0700 (PDT)
Received: from shalem.localdomain (84-106-84-65.cable.dynamic.v4.ziggo.nl. [84.106.84.65])
        by smtp.gmail.com with ESMTPSA id m7sm176021wmi.18.2019.08.12.10.11.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Mon, 12 Aug 2019 10:11:08 -0700 (PDT)
Subject: Re: [PATCH v2] platform/x86/intel_cht_int33fe: Split code to microUSB
 and TypeC variants
To:     Yauhen Kharuzhy <jekhor@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andy@infradead.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
References: <20190808215559.2029-1-jekhor@gmail.com>
 <20190808215559.2029-2-jekhor@gmail.com>
 <e7913031-4a0a-bcd9-2149-8e718b876a0e@redhat.com>
 <20190809145135.GC30248@jeknote.loshitsa1.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <13391bf6-b8d2-83ce-2bca-1c359829938f@redhat.com>
Date:   Mon, 12 Aug 2019 19:11:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190809145135.GC30248@jeknote.loshitsa1.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 09-08-19 16:51, Yauhen Kharuzhy wrote:
> On Fri, Aug 09, 2019 at 12:49:27PM +0200, Hans de Goede wrote:
>> Hi,
>>
>> Overall this looks good, thank you for your work on this.
>>
>> I have some small remarks inline / below:
>>> +EXPORT_SYMBOL_GPL(cht_int33fe_check_hw_compatible);
>>> +
>>> +MODULE_DESCRIPTION("Intel Cherry Trail ACPI INT33FE pseudo device driver (common part)");
>>> +MODULE_AUTHOR("Yauhen Kharuzhy <jekhor@gmail.com>");
>>> +MODULE_LICENSE("GPL v2");
>>
>> I see from the Makefile changes that you are linking the common code
>> into both intel_cht_int33fe_typec.ko and into intel_cht_int33fe_musb.ko, that is fine
>> since it is tiny and not worth the trouble of creating its own .ko file for.
> 
> No, this Makefile fragment adds two targets for every config variables,
> and intel_cht_int33fe_common.c compiles into one .ko file even if it was
> added twice

Ah right, I misread it. But adding a new ko file just for the one helper function
seems like massive overkill, the overhead will be quite big and on most systems
all 3 .ko files will end up getting loaded anyways, so we should probably try to
reduce the number of ko files here.

>> I do wonder what happens if you set the Kconfig value for both modules to Y,
>> since that will like put the common code twice in the builtin.a file, I guess / hope
>> ar is smart enough to only add it once, but I'm not sure... can you please give
>> this a try?
> 
> For both Y it should be OK, but for one M and one Y... OK, it need to be
> corrected.

How about moving the entire helper function into intel_cht_int33fe_common.h as
static inline ... then both remaining .ko files get a private copy but since it is
small that is fine. This nicely solves the need for a third .ko file and also
problems with one of the Kconfig options being builtin and the other being modular.

Regards,

Hans

