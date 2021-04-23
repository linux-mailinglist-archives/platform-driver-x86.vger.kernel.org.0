Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ACA2F368F97
	for <lists+platform-driver-x86@lfdr.de>; Fri, 23 Apr 2021 11:42:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230006AbhDWJn0 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 23 Apr 2021 05:43:26 -0400
Received: from moo.tau.tal.de ([195.8.233.46]:60308 "EHLO moo.tau.tal.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241896AbhDWJnZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 23 Apr 2021 05:43:25 -0400
X-Greylist: delayed 304 seconds by postgrey-1.27 at vger.kernel.org; Fri, 23 Apr 2021 05:43:24 EDT
Received: from point.localnet (dslb-092-072-143-124.092.072.pools.vodafone-ip.de [92.72.143.124])
        (Authenticated sender: ib@wtal.de)
        by smtp.tal.de (Postfix) with ESMTPA id 9A52E80EFE88
        for <platform-driver-x86@vger.kernel.org>; Fri, 23 Apr 2021 11:37:42 +0200 (CEST)
Received: from ib by point.localnet with local (masqmail 0.2.30) id
 1lZsFq-0mI-00 for <platform-driver-x86@vger.kernel.org>; Fri, 23 Apr
 2021 11:37:42 +0200
Message-ID: <60829505.48d22883.bm000@wupperonline.de>
From:   =?ISO-8859-1?Q?Ingo=20Br=FCckl?= <ib@wupperonline.de>
To:     platform-driver-x86@vger.kernel.org
Subject: acer-wmi: WiFi key detection for the Acer TravelMate B1?
Date:   Fri, 23 Apr 2021 11:36:01 +0200
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset=ISO-8859-1
X-Mailer: blueMail/Linux 1.5
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I have an Acer TravelMate B1, model TMB118-M-P98A.

The acer_wmi module loads and all Fn keys except the Fn+F3 WiFi
key (Airplane mode, turn on/off the network devices) work one way
or another (either out of the box or they are recognized as XF86 keys).

Fn+F3, however, only generates the following kernel message:

  acer_wmi: Unknown function number - 2 - 1

Is there a chance to treat this function number in the driver as
WMID_HOTKEY_EVENT for KEY_WLAN and KEY_BLUETOOTH? (By the way, the
touchpad toggle Fn+F7 already works out of the box).

If allowed, I can post my DSDT. I can also test possible patches.
