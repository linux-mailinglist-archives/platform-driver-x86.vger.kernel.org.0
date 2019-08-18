Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3882D916C7
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 15:24:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfHRNYi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Aug 2019 09:24:38 -0400
Received: from mga07.intel.com ([134.134.136.100]:48209 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725786AbfHRNYi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Aug 2019 09:24:38 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Aug 2019 06:24:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,401,1559545200"; 
   d="scan'208";a="182637846"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 18 Aug 2019 06:24:35 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hzLAf-0004S4-Dc; Sun, 18 Aug 2019 16:24:33 +0300
Date:   Sun, 18 Aug 2019 16:24:33 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
Message-ID: <20190818132433.GT30120@smile.fi.intel.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 16, 2019 at 11:18:22AM +0200, Hans de Goede wrote:
> On 12-08-19 15:53, Linus Walleij wrote:

> Anyways, this will need to be fixed before we can merge this.

It might affect the behaviour of pinctrl-baytrail as well.

Hans, do you have any Baytrail at hand to test latest linux-next, or take my
for-next branch from
git://git.kernel.org/pub/scm/linux/kernel/git/pinctrl/intel.git?

Linus, shall I postpone Baytrail patch as well?

-- 
With Best Regards,
Andy Shevchenko


