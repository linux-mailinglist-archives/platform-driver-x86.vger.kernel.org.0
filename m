Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 18FFD56CF5F
	for <lists+platform-driver-x86@lfdr.de>; Sun, 10 Jul 2022 16:13:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229536AbiGJON3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 10 Jul 2022 10:13:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38404 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbiGJON2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 10 Jul 2022 10:13:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4158FDFD5
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 07:13:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id D1BD661242
        for <platform-driver-x86@vger.kernel.org>; Sun, 10 Jul 2022 14:13:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FEE0C3411E;
        Sun, 10 Jul 2022 14:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1657462407;
        bh=bvH9iW+qBfgmcIpTi5+lR5HzRXmzYJ76G/75ui+eg8w=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=tjiyqniN2IomJo6cNzabUCr4GNu7Bd+f0nNUp6yyz2Uo/qem/gg4K+9tzaKmIdlxv
         aaxWsMkpyA8wVtniXswRlyquYsqz1lI+5F6CVxy9GpjyVVXnBEmvjKJBGz0OhkoD4I
         gJxOr8wlC1pN1ws5d/HLeiiaVHFtf61eZCP9+3oA=
Date:   Sun, 10 Jul 2022 16:13:24 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Jithu Joseph <jithu.joseph@intel.com>,
        Ashok Raj <ashok.raj@intel.com>,
        Tony Luck <tony.luck@intel.com>
Subject: Re: [PATCH] platform/x86/intel/ifs: Mark as BROKEN
Message-ID: <YsrehKoFluIym/hJ@kroah.com>
References: <20220710140736.6492-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220710140736.6492-1-hdegoede@redhat.com>
X-Spam-Status: No, score=-7.7 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_HI,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, Jul 10, 2022 at 04:07:36PM +0200, Hans de Goede wrote:
> A recent suggested change to the IFS code has shown that the userspace
> API needs a bit more work, see:
> https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/
> 
> Mark it as BROKEN before 5.19 ships, to give ourselves one more
> kernel-devel cycle to get the userspace API right.
> 
> Link: https://lore.kernel.org/platform-driver-x86/20220708151938.986530-1-jithu.joseph@intel.com/
> Cc: Jithu Joseph <jithu.joseph@intel.com>
> Cc: Ashok Raj <ashok.raj@intel.com>
> Cc: Tony Luck <tony.luck@intel.com>
> Suggested-by: Greg KH <gregkh@linuxfoundation.org>
> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
> ---
>  drivers/platform/x86/intel/ifs/Kconfig | 3 +++
>  1 file changed, 3 insertions(+)

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
