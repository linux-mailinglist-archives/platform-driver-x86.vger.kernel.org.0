Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id ECA7391880
	for <lists+platform-driver-x86@lfdr.de>; Sun, 18 Aug 2019 19:55:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726097AbfHRRzd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 18 Aug 2019 13:55:33 -0400
Received: from mga09.intel.com ([134.134.136.24]:11362 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726089AbfHRRzd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 18 Aug 2019 13:55:33 -0400
X-Amp-Result: UNSCANNABLE
X-Amp-File-Uploaded: False
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga102.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 18 Aug 2019 10:55:32 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,401,1559545200"; 
   d="scan'208";a="182671204"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga006.jf.intel.com with ESMTP; 18 Aug 2019 10:55:30 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hzPOq-0008Vy-NY; Sun, 18 Aug 2019 20:55:28 +0300
Date:   Sun, 18 Aug 2019 20:55:28 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Maxim Mikityanskiy <maxtram95@gmail.com>
Subject: Re: [PATCH] platform: x86: vgpio: Pass irqchip when adding gpiochip
Message-ID: <20190818175528.GV30120@smile.fi.intel.com>
References: <20190812135335.10104-1-linus.walleij@linaro.org>
 <9cfe5abe-244a-e606-7b59-6832c053ea73@redhat.com>
 <20190818132433.GT30120@smile.fi.intel.com>
 <770d9bfa-aaad-1107-58f6-594cc95ffdb3@redhat.com>
 <20190818140419.GU30120@smile.fi.intel.com>
 <9d455011-bbe2-4a8c-0441-4291fc9e0d7b@redhat.com>
 <f24156f0-c8da-b0b6-c3d3-2f1e1b8f94e3@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f24156f0-c8da-b0b6-c3d3-2f1e1b8f94e3@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 18, 2019 at 06:26:38PM +0200, Hans de Goede wrote:
> On 18-08-19 18:19, Hans de Goede wrote:
> > On 18-08-19 16:04, Andy Shevchenko wrote:

> > Thanks for the context, so for testing I need a Bay Trail device which
> > uses a GPIO interrupt line with a "Interrupt" descriptor, like this:
> > 
> >                          Interrupt (ResourceConsumer, Level, ActiveHigh, Exclusiv
> >                          {
> >                              0x00000045,
> >                          }
> > 
> > Instead of the more modern GpioInt descriptors. My Asus T100TA is in my
> > storage-bin at the localhackerspace ATM, but I have a T200TA here which
> > is the same wrt touchscreen IRQ routing.
> > 
> > I'm currently charging it because its battery was very dead TM, but in
> > the mean time I've been looking at the code and I can already tell
> > that a kernel with the 2e65e0fad935f578e998656d3e7be5a26e072b0e
> > ("pinctrl: intel: baytrail: Pass irqchip when adding gpiochip")
> > is not going to boot, that commit moves the call to
> > byt_gpio_irq_init_hw() to before the call to devm_gpiochip_add_data().
> > 
> > devm_gpiochip_add_data() allocs gpio_chip.irq.valid_mask and
> > byt_gpio_irq_init_hw() does:
> > 
> >                  if (value & BYT_DIRECT_IRQ_EN) {
> >                          clear_bit(i, gc->irq.valid_mask);
> > 
> > Which means it will trigger a NULL deref after the
> > "pinctrl: intel: baytrail: Pass irqchip when adding gpiochip"
> > commit, sine now byt_gpio_irq_init_hw() runs before
> > devm_gpiochip_add_data().
> > 
> > Note that the gpio_chip structure already has a init_valid_mask
> > callback which runs after gpiochip_irqchip_init_valid_mask wich
> > allocs gpio_chip.irq.valid_mask, so we might use that, but:
> > 
> > That is intended to setup the valid_mask for the pins, not for
> > the IRQs, which would mean we are abusing it a bit and it runs
> > after gpiochip_add_irqchip(), which might be too late I guess.
> > 
> > So it looks like we need a gpio_chip.irq.init_valid_mask callback
> > to fix this ordering problem and until this is fixed we should revert
> > 2e65e0fad935f578e998656d3e7be5a26e072b0e.
> 
> So thinking a bit more about this, I think a better fix would be to
> export gpiochip_irqchip_init_valid_mask and make it proof against
> multiple calls. Then drivers which need this before
> devm_gpiochip_add_data() time can simply call it in advance.
> 
> Maybe (not sure if this is a good idea) we can eventually even
> drop gpio_chip.irq.need_valid_mask and simply have all users of
> the valid_mask explictly call gpiochip_irqchip_init_valid_mask.
> If this second bit is a good idea depends on how much users there
> are I guess and what the changes to those users would look like.

Thank you, Hans, very much!
I will simple drop the changes from all drivers which need a valid mask.

Linus, JFYI ^^^, It also makes your cherrivew RFC commented as no go.

-- 
With Best Regards,
Andy Shevchenko


