Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2064741EEE
	for <lists+platform-driver-x86@lfdr.de>; Wed, 12 Jun 2019 10:21:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730954AbfFLIV6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 12 Jun 2019 04:21:58 -0400
Received: from mga06.intel.com ([134.134.136.31]:15075 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730126AbfFLIV6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 12 Jun 2019 04:21:58 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 12 Jun 2019 01:21:57 -0700
X-ExtLoop1: 1
Received: from mylly.fi.intel.com (HELO [10.237.72.79]) ([10.237.72.79])
  by orsmga003.jf.intel.com with ESMTP; 12 Jun 2019 01:21:55 -0700
Subject: Re: [PATCH 1/2] x86/platform/intel-mid: Create pinctrl platform
 device at later initcall
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>
References: <20190611103330.21306-1-jarkko.nikula@linux.intel.com>
 <CAHp75VdaafccAkuOnkh2M3LaOKT56FbMfRo1HWKnqcvm8W4Vcg@mail.gmail.com>
From:   Jarkko Nikula <jarkko.nikula@linux.intel.com>
Message-ID: <1363fbdd-30a8-240c-b242-b6018998979a@linux.intel.com>
Date:   Wed, 12 Jun 2019 11:21:54 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdaafccAkuOnkh2M3LaOKT56FbMfRo1HWKnqcvm8W4Vcg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 6/11/19 3:58 PM, Andy Shevchenko wrote:
>> Andy: I'm not sure is this with the next patch the right fix or would it be
>> possible to just delete this "pinctrl-merrifield" initialization filei? I
>> went to this path since I don't know are there platforms without
>> "INTC1002" in their ACPI tables or do some users want to run non-ACPI
>> kernels.
> 
> I have locally one hack with another approach, i.e. check for SFI
> availability like the rest of the files in this folder works, with few
> exceptions as this one.
> 
> So, something like
> 
> if (sfi_disabled)
>    return -EINVAL.
> 
> If you have time, you can split and submit the
> https://github.com/andy-shev/linux/commit/7a0cb10387a437f5811435b9c790043c64816d08
> 
Seems to accomplish the same. Are you planning to send it out and do you 
think are my patches needed after it? If you think they are needed I can 
rebase my patches on top of yours and resend.

-- 
Jarkko
