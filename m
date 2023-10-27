Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 5E65F7D998B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 Oct 2023 15:17:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345889AbjJ0NRm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 27 Oct 2023 09:17:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39320 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345916AbjJ0NRh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2023 09:17:37 -0400
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0C0F6D7A
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 06:17:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698412644; x=1729948644;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=RkmTOlCL9kBfe/Y3L6fYLFQ8NfWfDZp8TJllaFNhbvA=;
  b=XiEpe7RH8hKsIFp5T9cFLAuh04bqqcYHAs8kKXvlAl6/9C1c7HEq8Tjb
   lHEJEHqHZrHHVSpH1OWfgWpusp3aQfVDhoLG5doETeVkwPWeaiFVs4Zez
   FiuqdvSsDAS0aELZFEW+G8u5l2Om9bkYBAjl2OUVVOp0bqEifLbZtWRQu
   YSI2oT3h5lEHmruXuAjjoSW+xB+Ja+bzs4MYWX0SzsvE+EsI9kDEoodNN
   V5d8iU6Bzyslf2Imje7L4AeINBcez+zS4N7fCGEnbDxfX+ndzYElQbTL9
   coFVkWhBPJ3Z6ZTrz+y84beWuKrEL+02R35Hug5sZG8G0Zh21Fsul9xKG
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="474012375"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="474012375"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:17:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10875"; a="1090924271"
X-IronPort-AV: E=Sophos;i="6.03,256,1694761200"; 
   d="scan'208";a="1090924271"
Received: from amyachev-mobl3.ccr.corp.intel.com (HELO localhost) ([10.252.49.46])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2023 06:17:20 -0700
From:   =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Hans de Goede <hdegoede@redhat.com>,
        Olli Asikainen <olli.asikainen@gmail.com>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
In-Reply-To: <20231024190922.2742-1-olli.asikainen@gmail.com>
References: <20231024190922.2742-1-olli.asikainen@gmail.com>
Subject: Re: [PATCH] platform/x86: thinkpad_acpi: Add battery quirk for
 Thinkpad X120e
Message-Id: <169841262967.11233.13412167476769105831.b4-ty@linux.intel.com>
Date:   Fri, 27 Oct 2023 16:17:09 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        SPF_HELO_NONE,SPF_NONE,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 24 Oct 2023 22:09:21 +0300, Olli Asikainen wrote:

> Thinkpad X120e also needs this battery quirk.
> 
> 


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

Once I've run some tests on the review-ilpo branch the patches
there will be added to the platform-drivers-x86/for-next branch
and eventually will be included in the pdx86 pull-request to
Linus for the next merge-window.

The list of commits applied:
[1/1] platform/x86: thinkpad_acpi: Add battery quirk for Thinkpad X120e
      commit: 916646758aea81a143ce89103910f715ed923346

--
 i.

