Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C9E8669DD7F
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Feb 2023 10:59:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234079AbjBUJ7B (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Feb 2023 04:59:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234063AbjBUJ7B (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Feb 2023 04:59:01 -0500
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E04C227BD
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Feb 2023 01:58:59 -0800 (PST)
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="360060511"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="360060511"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2023 01:58:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10627"; a="795466604"
X-IronPort-AV: E=Sophos;i="5.97,315,1669104000"; 
   d="scan'208";a="795466604"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 21 Feb 2023 01:58:57 -0800
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1pUPQG-009uUp-1d;
        Tue, 21 Feb 2023 11:58:56 +0200
Date:   Tue, 21 Feb 2023 11:58:56 +0200
From:   Andy Shevchenko <andy@kernel.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 4/9] platform/x86: x86-android-tablets: Move shared
 power-supply fw-nodes to a separate file
Message-ID: <Y/SV4Jfslvdpv+0t@smile.fi.intel.com>
References: <20230220221212.196009-1-hdegoede@redhat.com>
 <20230220221212.196009-5-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230220221212.196009-5-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
X-Spam-Status: No, score=-3.5 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_SOFTFAIL
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Feb 20, 2023 at 11:12:07PM +0100, Hans de Goede wrote:
> Move the shared power-supply fw-nodes and related files to
> a new separate shared-psy-info.c file.

...

> +#ifndef __SHARED_PSY_INFO_H
> +#define __SHARED_PSY_INFO_H

For all headers in this folder. Can we have them prefixed with PDX86
or similar?

-- 
With Best Regards,
Andy Shevchenko


