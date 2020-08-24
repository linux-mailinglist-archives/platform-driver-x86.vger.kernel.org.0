Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE0B624F467
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Aug 2020 10:36:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726972AbgHXIgC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 04:36:02 -0400
Received: from mga05.intel.com ([192.55.52.43]:11034 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728196AbgHXIgA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 04:36:00 -0400
IronPort-SDR: 0VlQH2Jjfz+SJH7bQI2sqnofnCFeGJytIz/M5t9jhkH9hvo7kVGDEU1Ive2JfQ6KrahcnFgVmZ
 N4rMlj/c+DQQ==
X-IronPort-AV: E=McAfee;i="6000,8403,9722"; a="240680348"
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="240680348"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2020 01:35:59 -0700
IronPort-SDR: lSHbtAakYc8UUFpI7BMZin9omnaMbxXpPMnzbq/C1PpHoVyVODZ5tQwlzWbVUN90l9/CV/bTLO
 J2rZM1YhgVYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.76,347,1592895600"; 
   d="scan'208";a="328418417"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga008.jf.intel.com with ESMTP; 24 Aug 2020 01:35:57 -0700
Received: from andy by smile with local (Exim 4.94)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1kA7mn-00Azow-2Z; Mon, 24 Aug 2020 11:25:01 +0300
Date:   Mon, 24 Aug 2020 11:25:01 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Marius Iacob <themariusus@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org,
        =?iso-8859-1?Q?Jo=E3o?= Paulo Rechi Vita <jprvita@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: [asus-nb-wmi] i8042 optional dependecy?
Message-ID: <20200824082501.GB1891694@smile.fi.intel.com>
References: <20200823175835.bed5psv7vdm64csb@archer>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200823175835.bed5psv7vdm64csb@archer>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Aug 23, 2020 at 08:58:35PM +0300, Marius Iacob wrote:

> I have an ASUS T103HAF and while trying to load asus-nb-wmi module it fails because it has i8042 as dependecy and that module does not load on my device.

Can you be more specific, why that module is not loaded?

> I see that i8042 is used in asus-nb-wmi for a quirk, so it's not necessary all the time. How can I make it an optional dependecy?
> 
> Sorry if you are not the right person for this question, and if so can you redirect me to the right person.

The rule of thumb is to use mailing list that more people can see this.
Nevertheless, I Cc'ed this to mailing list and people who worked on this driver
lately.

-- 
With Best Regards,
Andy Shevchenko


