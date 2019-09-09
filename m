Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9AB2EAD7EE
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Sep 2019 13:30:28 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390878AbfIILa1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Sep 2019 07:30:27 -0400
Received: from mga11.intel.com ([192.55.52.93]:37465 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2390515AbfIILa1 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Sep 2019 07:30:27 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Sep 2019 04:30:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,484,1559545200"; 
   d="scan'208";a="196168897"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by orsmga002.jf.intel.com with ESMTP; 09 Sep 2019 04:30:19 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1i7Hs8-0007c3-NP; Mon, 09 Sep 2019 14:30:16 +0300
Date:   Mon, 9 Sep 2019 14:30:16 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Daniel Drake <drake@endlessm.com>,
        Ognjen =?utf-8?B?R2FsacSH?= <smclt30p@gmail.com>,
        "Wysocki, Rafael J" <rafael.j.wysocki@intel.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: Re: [PATCH v3] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
Message-ID: <20190909113016.GW2680@smile.fi.intel.com>
References: <20190813003023.6748-1-kristian@klausen.dk>
 <CAD8Lp47pSr-0VWqSBTAAJe3Ny5gW2XMXXYxmiH5-EOk42MhvHw@mail.gmail.com>
 <a5f6bd92-076b-57be-75d8-7509b86b5fea@klausen.dk>
 <CAHp75Vek0Ti1jB8J+M09w2LxKpfq9SH8KZkzPwrtXzZr5Krr3w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAHp75Vek0Ti1jB8J+M09w2LxKpfq9SH8KZkzPwrtXzZr5Krr3w@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sat, Sep 07, 2019 at 08:49:27PM +0300, Andy Shevchenko wrote:
> On Mon, Aug 26, 2019 at 10:09 PM Kristian Klausen <kristian@klausen.dk> wrote:
> > On 15.08.2019 05.28, Daniel Drake wrote:

> > I did notice that V1 of this patch has been merged into the for-next
> > branch by Andy[1].
> > Was that a mistake Andy? and how do you want me to proceed? Should I
> > create a refactoring patch? V1 really isn't the proper way to do this.
> 
> Oh, I see. Can it be fixed quickly? Then refactoring patch on top of
> the branch is preferred.
> Otherwise I will remove the original from the tree. Just tell me which
> one is more solid.

Okay, there are a lot of patches on top right now. And we are at last week
before merge window. So, send me a followup fix on top of our for-next branch.

Sorry for inconvenience.

-- 
With Best Regards,
Andy Shevchenko


