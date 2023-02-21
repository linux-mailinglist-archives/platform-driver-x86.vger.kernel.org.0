Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 9688869DD7C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Feb 2023 10:57:09 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234058AbjBUJ5H (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Feb 2023 04:57:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234094AbjBUJ5G (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 04:57:06 -0500
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 04F471BF4
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 01:57:05 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="397278297"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="397278297"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:57:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="814445299"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="814445299"
Received: from smile.fi.intel.com ([10.237.72.54])
  by fmsmga001.fm.intel.com with ESMTP; 21 Feb 2023 01:57:04 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUPOR-009uSj-0G;
        Tue, 21 Feb 2023 11:57:03 +0200
Date:   Tue, 21 Feb 2023 11:57:02 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 3/9] platform/x86: x86-android-tablets: Move DMI match
 table into its own dmi.c file
Message-ID: <Y/SVbkWsBFVwIIqS@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-4-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220221212.196009-4-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        SPF_HELO_NONE,SPF_SOFTFAIL autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 20, 2023 at 11:12:06PM +0100, Hans de Goede wrote:
> In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
> splitting the board descriptions into multiple files, add a new separate
> file for the DMI match table.

...

> + * In order to have a single MODULE_DEVICE_TABLE(dmi, ...), while allowing
> + * splitting the board descriptions into multiple files, add extern declarations
> + * of the x86_dev_info structs here.

But why this can't be simply done in the local header? Does it not compile?

-- 
With Best Regards,
Andy Shevchenko


