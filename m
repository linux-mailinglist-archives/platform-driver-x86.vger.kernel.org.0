Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1A42523512C
	for <lists+platform-driver-x86@lfdr.de>; Sat,  1 Aug 2020 10:37:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725997AbgHAIht (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 1 Aug 2020 04:37:49 -0400
Received: from mga03.intel.com ([134.134.136.65]:16502 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725931AbgHAIhs (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 1 Aug 2020 04:37:48 -0400
IronPort-SDR: R1iFPdgJBQq8TS7Sv5buFBqdc0QdTVogWBnOKvEG++dn0KaR4uK/+hCDv4e4Bhim0Jfc4Vw8fh
 mBD0GixQEymA==
X-IronPort-AV: E=McAfee;i="6000,8403,9699"; a="151885370"
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; 
   d="scan'208";a="151885370"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Aug 2020 01:37:48 -0700
IronPort-SDR: 3rIhv1RTDGof2gdk7vtoKxsmN5ZmrWZlx8LzoOfE/xErds9IIESqEgaFh1buDNDeDep81weoAD
 tfidI26tF+bQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.75,420,1589266800"; 
   d="scan'208";a="273471456"
Received: from lkp-server01.sh.intel.com (HELO e21119890065) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 01 Aug 2020 01:37:46 -0700
Received: from kbuild by e21119890065 with local (Exim 4.92)
        (envelope-from <lkp@intel.com>)
        id 1k1n1V-0000Nr-Mn; Sat, 01 Aug 2020 08:37:45 +0000
Date:   Sat, 1 Aug 2020 16:36:54 +0800
From:   kernel test robot <lkp@intel.com>
To:     Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc:     kbuild-all@lists.01.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Darren Hart <dvhart@infradead.org>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [RFC PATCH linux-next] platform/x86: thinkpad_acpi:
 dev_attr_charge_start_threshold can be static
Message-ID: <20200801083654.GA31368@144836a6079b>
References: <202008011649.b8CEYWIz%lkp@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202008011649.b8CEYWIz%lkp@intel.com>
X-Patchwork-Hint: ignore
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


Fixes: e33929537b76 ("platform/x86: thinkpad_acpi: use standard charge control attribute names")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 thinkpad_acpi.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
index 9eda2f84a3cf98..4864a5c189d464 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9633,13 +9633,13 @@ static ssize_t charge_control_end_threshold_store(struct device *dev,
 
 static DEVICE_ATTR_RW(charge_control_start_threshold);
 static DEVICE_ATTR_RW(charge_control_end_threshold);
-struct device_attribute dev_attr_charge_start_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_start_threshold = __ATTR(
 	charge_start_threshold,
 	0644,
 	charge_control_start_threshold_show,
 	charge_control_start_threshold_store
 );
-struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
+static struct device_attribute dev_attr_charge_stop_threshold = __ATTR(
 	charge_stop_threshold,
 	0644,
 	charge_control_end_threshold_show,
