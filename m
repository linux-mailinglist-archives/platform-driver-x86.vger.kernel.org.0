Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 0AAC57A6BC
	for <lists+platform-driver-x86@lfdr.de>; Tue, 30 Jul 2019 13:18:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728980AbfG3LSy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 30 Jul 2019 07:18:54 -0400
Received: from mga11.intel.com ([192.55.52.93]:58454 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728967AbfG3LSy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 30 Jul 2019 07:18:54 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 30 Jul 2019 04:18:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,326,1559545200"; 
   d="scan'208";a="370914708"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by fmsmga005.fm.intel.com with ESMTP; 30 Jul 2019 04:18:51 -0700
Received: from andy by smile with local (Exim 4.92)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hsQ9b-0002Yh-BU; Tue, 30 Jul 2019 14:18:51 +0300
Date:   Tue, 30 Jul 2019 14:18:51 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        platform-driver-x86@vger.kernel.org,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>
Subject: Re: [PATCH v1] platform/x86: i2c-multi-instantiate: Use
 struct_size() helper
Message-ID: <20190730111851.GL23480@smile.fi.intel.com>
References: <20190725190550.63184-1-andriy.shevchenko@linux.intel.com>
 <5f1ee0af-1ebb-a0fd-fcc0-9099f9f746dd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5f1ee0af-1ebb-a0fd-fcc0-9099f9f746dd@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Jul 29, 2019 at 05:53:51PM +0200, Hans de Goede wrote:
> Hi,
> 
> On 25-07-19 21:05, Andy Shevchenko wrote:
> > One of the more common cases of allocation size calculations is finding
> > the size of a structure that has a zero-sized array at the end, along
> > with memory for some number of elements for that array.
> > 
> > Make use of the struct_size() helper instead of an open-coded version
> > in order to avoid any potential type mistakes.
> > 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> 
> Looks good to me:
> 
> Reviewed-by: Hans de Goede <hdegoede@redhat.com>

Pushed to my review and testing queue, thanks!

> 
> 
> > ---
> >   drivers/platform/x86/i2c-multi-instantiate.c | 4 +---
> >   1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/i2c-multi-instantiate.c b/drivers/platform/x86/i2c-multi-instantiate.c
> > index 197d8a192721..61fe341a85aa 100644
> > --- a/drivers/platform/x86/i2c-multi-instantiate.c
> > +++ b/drivers/platform/x86/i2c-multi-instantiate.c
> > @@ -81,9 +81,7 @@ static int i2c_multi_inst_probe(struct platform_device *pdev)
> >   	if (ret < 0)
> >   		return ret;
> > -	multi = devm_kmalloc(dev,
> > -			offsetof(struct i2c_multi_inst_data, clients[ret]),
> > -			GFP_KERNEL);
> > +	multi = devm_kmalloc(dev, struct_size(multi, clients, ret), GFP_KERNEL);
> >   	if (!multi)
> >   		return -ENOMEM;
> > 

-- 
With Best Regards,
Andy Shevchenko


