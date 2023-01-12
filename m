Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 8F8D7667D3B
	for <lists+platform-driver-x86@lfdr.de>; Thu, 12 Jan 2023 19:01:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235408AbjALSBi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 12 Jan 2023 13:01:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39948 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231969AbjALSAq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 12 Jan 2023 13:00:46 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3068D12A9C;
        Thu, 12 Jan 2023 09:21:50 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id DF834B81F02;
        Thu, 12 Jan 2023 17:21:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 882A3C433D2;
        Thu, 12 Jan 2023 17:21:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1673544107;
        bh=o7rPePvZaQDhl2ZpAhDIh2cz7WD2ro08e3IDoDoypXU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=g1SdsksPV8I4OGhRFfJFW2e7Mfe7i/6SaB8a3aA6go7HS8htWAPK+bO/7ykzUP3Y0
         ywxqRA6azp8u4YUy9EXLmyYTAypEC7bHG0tnOMYEJco4Q93DekkiTn6AVIIVFj3eNL
         hZJBsJutqWf4ciswJ16ZSBsLpfoFi+4OudDBYzTdJS1z2qRHMeiL1/Fulwplch4g2I
         BJqEE8BUMB/CiY0NeXbeHq7kcqs0emD/FDL30zhHFkaqsHpp/NUDtozFo5cWlXPzn3
         uIxIqRCFgOC7RwYPHn3o8anIXSFABOY+khRVV3sC4SiDoZzxVkdvK6BeLgR2+AIVba
         SRkQA3LfoxDIQ==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan@kernel.org>)
        id 1pG1H0-0004pA-IB; Thu, 12 Jan 2023 18:21:55 +0100
Date:   Thu, 12 Jan 2023 18:21:54 +0100
From:   Johan Hovold <johan@kernel.org>
To:     Thomas Gleixner <tglx@linutronix.de>
Cc:     Johan Hovold <johan+linaro@kernel.org>,
        Marc Zyngier <maz@kernel.org>, x86@kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 19/19] irqdomain: Switch to per-domain locking
Message-ID: <Y8BBsid+Jaul3RDr@hovoldconsulting.com>
References: <20221209140150.1453-1-johan+linaro@kernel.org>
 <20221209140150.1453-20-johan+linaro@kernel.org>
 <87mt7sbtf9.ffs@tglx>
 <Y5c6z3t+sV/kIMjF@hovoldconsulting.com>
 <878rjcbnp8.ffs@tglx>
 <871qo1hqng.ffs@tglx>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <871qo1hqng.ffs@tglx>
X-Spam-Status: No, score=-7.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jan 11, 2023 at 07:28:35PM +0100, Thomas Gleixner wrote:
> On Mon, Dec 12 2022 at 17:18, Thomas Gleixner wrote:
> > On Mon, Dec 12 2022 at 15:29, Johan Hovold wrote:
> >> I added to irq_domain_set_mapping() and which is is called for each
> >> (inner) domain in a hierarchy when allocating an IRQ.
> >
> > Hmm. Indeed that should do the trick.
> >
> > Some comments would be appreciated as the rules around domain->root are
> > far from obvious.
> 
> Any update on this one?

Sorry about the delay. I'll take a look at this tomorrow.

Johan
