Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 1956F653E66
	for <lists+platform-driver-x86@lfdr.de>; Thu, 22 Dec 2022 11:38:35 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235060AbiLVKic (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 22 Dec 2022 05:38:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45024 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234894AbiLVKia (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 22 Dec 2022 05:38:30 -0500
X-Greylist: delayed 62 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 22 Dec 2022 02:38:28 PST
Received: from mta-64-225.siemens.flowmailer.net (mta-64-225.siemens.flowmailer.net [185.136.64.225])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 367636454
        for <platform-driver-x86@vger.kernel.org>; Thu, 22 Dec 2022 02:38:28 -0800 (PST)
Received: by mta-64-225.siemens.flowmailer.net with ESMTPSA id 20221222103723cf9d0b521d1d482a34
        for <platform-driver-x86@vger.kernel.org>;
        Thu, 22 Dec 2022 11:37:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=henning.schild@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=RF9ZpOE8SWGWDtXJyShVdQFyHXCRMKVuoqlEzBw0PXU=;
 b=RymjsJabARv6Ccub+hPVYpKtmT22Y932yKX1Hv+V6TqRDGC9E58tmu8vgUKoWH68QHiX7q
 rB6LRBY8Y8KfSvank/P2BnwMtp2kJxxBSbIIT83lwwb9lfPUBcgQRYtV4VrrmwHu9Yyca0yC
 aneGbADhqUZfduWDLMnGw+adIS2F0=;
From:   Henning Schild <henning.schild@siemens.com>
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Henning Schild <henning.schild@siemens.com>
Subject: [PATCH 0/2] simatic-ipc: enable one more board
Date:   Thu, 22 Dec 2022 11:37:18 +0100
Message-Id: <20221222103720.8546-1-henning.schild@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-52304:519-21489:flowmailer
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_MSPIKE_H2,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This series is rather trivial. It renames a few variables to use the
product names as known by end users and enables the current driver
to pick up on a board they also work for.

Henning Schild (2):
  platform/x86: simatic-ipc: correct name of a model
  platform/x86: simatic-ipc: add another model

 drivers/platform/x86/simatic-ipc.c            | 3 ++-
 include/linux/platform_data/x86/simatic-ipc.h | 3 ++-
 2 files changed, 4 insertions(+), 2 deletions(-)

-- 
2.38.2

