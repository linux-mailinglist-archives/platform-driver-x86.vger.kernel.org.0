Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 215A291726
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 16:05:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbfHROEu (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Aug 2019 10:04:50 -0400
Received: from mga06.intel.com ([134.134.136.31]:6544 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727026AbfHROEs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Aug 2019 10:04:48 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Aug 2019 07:04:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,401,1559545200"; 
   d="scan'208";a="189286527"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga002.jf.intel.com with ESMTP; 18 Aug 2019 07:04:21 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hzLn9-0005AT-Ag; Sun, 18 Aug 2019 17:04:19 +0300
Date:   Sun, 18 Aug 2019 17:04:19 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
Message-ID: <20190818140419.GU30120@smile.fi.intel.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 18, 2019 at 03:38:17PM +0200, Hans de Goede wrote:
> On 18-08-19 15:24, Andy Shevchenko wrote:
> > On Fri, Aug 16, 2019 at 11:18:22AM +0200, Hans de Goede wrote:
> > > On 12-08-19 15:53, Linus Walleij wrote:
> > 
> > > Anyways, this will need to be fixed before we can merge this.
> > 
> > It might affect the behaviour of pinctrl-baytrail as well.
> > 
> > Hans, do you have any Baytrail at hand to test latest linux-next, or take my
> > for-next branch from
> > git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git?
> 
> Given all the hw-enablement work I've done for BYT/CHT I have a whole
> stack of Bay Trail devices. Is there anything specific you want me to
> test?  Or should I just take the first one of the stack which uses a
> GPIO from the SoC as IRQ for something and then test that something?

From the thread I got that it should be one which uses GPIO for GPE.
Given that we have a fix there against misconfigured pins by firmware [1, 2],
which utilizes need_valid_mask, probably ASUS T100TA is a good candidate.

[1]: https://www.spinics.net/lists/linux-gpio/msg18842.html
[2]: commit 49c03096263871a68c9dea3e86b7d1e163d2fba8

> 
> > Linus, shall I postpone Baytrail patch as well?
> 
> Unlike the INT0002 virtual GPIO driver changes this one does not seem
> to move anything to a later point in time...

-- 
With Best Regards,
Andy Shevchenko


