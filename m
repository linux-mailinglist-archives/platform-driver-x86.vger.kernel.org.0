Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AA2CD2CC707
	for <lists+platform-driver-x86@lfdr.de>; Wed,  2 Dec 2020 20:53:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731082AbgLBTwQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 2 Dec 2020 14:52:16 -0500
Received: from mx2.suse.de ([195.135.220.15]:35828 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728477AbgLBTwQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 2 Dec 2020 14:52:16 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id A3606AC65;
        Wed,  2 Dec 2020 19:51:34 +0000 (UTC)
Date:   Wed, 2 Dec 2020 20:51:31 +0100
From:   Borislav Petkov <bp@suse.de>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Justin Ernst <justin.ernst@hpe.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Steve Wahl <steve.wahl@hpe.com>,
        platform-driver-x86@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] x86/platform/uv: Fix an error code in uv_hubs_init()
Message-ID: <20201202195131.GD25881@zn.tnic>
References: <X8eoN/jMAJb3H3iv@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <X8eoN/jMAJb3H3iv@mwanda>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Dec 02, 2020 at 05:44:07PM +0300, Dan Carpenter wrote:
> Return -ENOMEM on allocation failure instead of returning success.

s/success/random stack memory contents/

-- 
Regards/Gruss,
    Boris.

SUSE Software Solutions Germany GmbH, GF: Felix Imendörffer, HRB 36809, AG Nürnberg
