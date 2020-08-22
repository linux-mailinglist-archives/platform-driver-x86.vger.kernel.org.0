Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1866124E62D
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Aug 2020 09:52:46 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727818AbgHVHwp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 22 Aug 2020 03:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727103AbgHVHwo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 22 Aug 2020 03:52:44 -0400
X-Greylist: delayed 1349 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 22 Aug 2020 00:52:43 PDT
Received: from ganesha.gnumonks.org (ganesha.gnumonks.org [IPv6:2001:780:45:1d:225:90ff:fe52:c662])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BADFAC061573;
        Sat, 22 Aug 2020 00:52:43 -0700 (PDT)
Received: from uucp by ganesha.gnumonks.org with local-bsmtp (Exim 4.89)
        (envelope-from <laforge@gnumonks.org>)
        id 1k9NyW-0001MY-7W; Sat, 22 Aug 2020 09:30:04 +0200
Received: from laforge by localhost.localdomain with local (Exim 4.94)
        (envelope-from <laforge@gnumonks.org>)
        id 1k9NyH-00Ftt6-AZ; Sat, 22 Aug 2020 09:29:49 +0200
Date:   Sat, 22 Aug 2020 09:29:49 +0200
From:   Harald Welte <laforge@gnumonks.org>
To:     Kenneth Chan <kenneth.t.chan@gmail.com>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/9] platform/x86: panasonic-laptop: add optical drive,
 brightness and battery charging threshold
Message-ID: <20200822072949.GR3544863@nataraja>
References: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200821181433.17653-1-kenneth.t.chan@gmail.com>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Dear Keneth and Linux kernel developers,

as I have discontinued maintenance of the panasonic-laptop driver (and
recently sent a related MAINTAINERS update to that fact), I would like
to suggest Kenneth as the new maintainer for this driver.

Regards,
	Harald
-- 
- Harald Welte <laforge@gnumonks.org>           http://laforge.gnumonks.org/
============================================================================
"Privacy in residential applications is a desirable marketing option."
                                                  (ETSI EN 300 175-7 Ch. A6)
