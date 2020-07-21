Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 209F5227AD7
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Jul 2020 10:37:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726607AbgGUIh5 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Jul 2020 04:37:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726089AbgGUIh5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Jul 2020 04:37:57 -0400
X-Greylist: delayed 2703 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Tue, 21 Jul 2020 01:37:57 PDT
Received: from cavan.codon.org.uk (cavan.codon.org.uk [IPv6:2a00:1098:0:80:1000:c:0:1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 563F0C061794
        for <platform-driver-x86@vger.kernel.org>; Tue, 21 Jul 2020 01:37:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=codon.org.uk; s=63138784; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=/iwEaLuTvti2atIfZL/bniSgWI+3QfF5rV+W6OlcyXA=; b=pKB9Z1oNj2gmmOwNeVskZKVMz
        PSuAJWyY/OD9COwvZ52uuZ6hfX4nrSzBHV5CpzUtLdqEiHc2z9wZ29sDE3ye4gUzrx0QM/yl/SIB6
        znfaBJQ6FCNZImBqCos72fIKBlfWbzipRwilc5yIKwghEwvXJUdx+WvKKKH9qMmfJZC18=;
Received: from mjg59 by cavan.codon.org.uk with local (Exim 4.89)
        (envelope-from <mjg59@cavan.codon.org.uk>)
        id 1jxn4v-0002eq-Fl; Tue, 21 Jul 2020 08:52:45 +0100
Date:   Tue, 21 Jul 2020 08:52:45 +0100
From:   Matthew Garrett <mjg59@srcf.ucam.org>
To:     Paul Menzel <pmenzel@molgen.mpg.de>
Cc:     Pali =?iso-8859-1?Q?Roh=E1r?= <pali@kernel.org>,
        Mario Limonciello <mario.limonciello@dell.com>,
        platform-driver-x86@vger.kernel.org,
        Hans de Goede <hdegoede@redhat.com>
Subject: Re: Fn + F8 to switch display/monitor configuration/output gives
 KEY_P
Message-ID: <20200721075245.s3qettml4xd2m34g@srcf.ucam.org>
References: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f5e31855-0f24-7edb-95e1-06fcbb2812c8@molgen.mpg.de>
User-Agent: NeoMutt/20170113 (1.7.2)
X-SA-Exim-Connect-IP: <locally generated>
X-SA-Exim-Mail-From: mjg59@cavan.codon.org.uk
X-SA-Exim-Scanned: No (on cavan.codon.org.uk); SAEximRunCond expanded to false
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Jul 21, 2020 at 08:58:51AM +0200, Paul Menzel wrote:

> On the Dell Latitude E7250 running Debian Sid/unstable with Linux 5.7.6,
> pressing Fn + F8 to switch the display/monitor configuration does not work.
> It only prints a *p*.

https://mjg59.livejournal.com/121851.html - so, sadly, there's no way to 
easily fix this other than having your desktop environment catch 
windows+p and interpret that as a display switch event.

-- 
Matthew Garrett | mjg59@srcf.ucam.org
