Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BA3681C098F
	for <lists+platform-driver-x86@lfdr.de>; Thu, 30 Apr 2020 23:40:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726548AbgD3Vkv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 30 Apr 2020 17:40:51 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:46101 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726447AbgD3Vku (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 30 Apr 2020 17:40:50 -0400
Received: from compute7.internal (compute7.nyi.internal [10.202.2.47])
        by mailout.west.internal (Postfix) with ESMTP id 41E5D568;
        Thu, 30 Apr 2020 17:40:49 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute7.internal (MEProxy); Thu, 30 Apr 2020 17:40:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hmh.eng.br; h=
        date:from:to:cc:subject:message-id:references:mime-version
        :content-type:in-reply-to; s=fm2; bh=0yUYdz8c3bH2r9ZO6rfQXpu5XtO
        QdyW42KYK6xwoPeY=; b=nCxt5anRioZjaIsw2Yn1r1LL+IlNLIuSEGflo7xg9mo
        L4UaAsi5VgQvxl6DIm76mkibdVEiZUqT41VSexrOTfRdbEKp09Mcp60iNxV/DzNH
        SWXk9x7k5++JrtbXKxWUODxv5QHpB8APOOuYtR6PdkT+wKuSdNYlJrLlaWsUEThm
        Aaxga7+rj9GuWbUbh5UZd9ktBBoRyDQmXkx+gNjydruDHB9dLDo0/2c3R9yK4Nis
        O8sYr1sAkJedbPCDUNa60tFgQm3HsN6isc+s1CUSyvePcXBRZ9ZmKnikrl49gZWF
        CpcIz5brcb6AKFiOxLfty3gYgLxvMYULGBbPtGZGzDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-type:date:from:in-reply-to
        :message-id:mime-version:references:subject:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=0yUYdz
        8c3bH2r9ZO6rfQXpu5XtOQdyW42KYK6xwoPeY=; b=SSV4Lvh/vX+QEtIpt3FqnU
        gNq6+Rzmte/p12USH8GrM4temHwCKB4AcaRnXPq07Ejr9ibzbIQnJbPUAthDsX3N
        wuMVTdfRfSotrp8od9uuEsHFRKWEtosZfV2I5VcyfoY/Nvi10aohXdDGXO4yMDSW
        K2BwxZQErAcMW5SQ7V5mJbwefK37jDXxGh4S93Xibn0VIY5C4qYVBA+TzGdngGb3
        JpCT5El0YRFZ2ejC8QZdrX9HI663+xCjrtu3vrKDDY+5nGc4e1r6Z+1QljIrNF2f
        c/lacto29vuuU1RHA2Tgl/S9C8QYE6XyHUA7yzsBbOCy7He3uDu5Exy+vDxxCX3Q
        ==
X-ME-Sender: <xms:30WrXjregZPEbmv6rx4hiAT1u0daBCuhf-oQw14E3FxoVX06IlPKMg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduhedrieeiucetufdoteggodetrfdotffvucfrrh
    hofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvffukfhfgggtuggjfgesthdttddttdervdenucfhrhhomhepjfgvnhhrihhquhgv
    ucguvgcuofhorhgrvghsucfjohhlshgthhhuhhcuoehhmhhhsehhmhhhrdgvnhhgrdgsrh
    eqnecuggftrfgrthhtvghrnhepveduteejgeeiudefuefgieehleejkeefudfhjeefgeek
    heekvddvheehleegveeinecukfhppedujeejrdduleegrdejrdefvdenucevlhhushhtvg
    hrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehhmhhhsehhmhhhrdgvnhhg
    rdgsrh
X-ME-Proxy: <xmx:30WrXlGyPVcBKa1tKpu01G2VqLqoHaV8Wv80fEanybKFxQMb73xcPQ>
    <xmx:30WrXtm6o2gdaKdAjZNpCa1-F1ExRmoeViSC44Md-nBdUy_UtTT5pQ>
    <xmx:30WrXgkIbP56HuFBRaozPZNpnmOTySOQ3lQGZkxCocSp4KDEakwbow>
    <xmx:4EWrXvcbAdnO5UjVrip7avki8BE6cwJ-Pcebu1jz3VQ6NFbZ1SS2FA>
Received: from khazad-dum.debian.net (unknown [177.194.7.32])
        by mail.messagingengine.com (Postfix) with ESMTPA id AD99A328005D;
        Thu, 30 Apr 2020 17:40:47 -0400 (EDT)
Received: from localhost (localhost [127.0.0.1])
        by localhost.khazad-dum.debian.net (Postfix) with ESMTP id C7C8A3400175;
        Thu, 30 Apr 2020 18:40:44 -0300 (-03)
X-Virus-Scanned: Debian amavisd-new at khazad-dum.debian.net
Received: from khazad-dum.debian.net ([127.0.0.1])
        by localhost (khazad-dum2.khazad-dum.debian.net [127.0.0.1]) (amavisd-new, port 10024)
        with LMTP id thsmCbieLRRK; Thu, 30 Apr 2020 18:40:43 -0300 (-03)
Received: by khazad-dum.debian.net (Postfix, from userid 1000)
        id 93FD43400174; Thu, 30 Apr 2020 18:40:41 -0300 (-03)
Date:   Thu, 30 Apr 2020 18:40:41 -0300
From:   Henrique de Moraes Holschuh <hmh@hmh.eng.br>
To:     Stefan Assmann <sassmann@kpanic.de>
Cc:     "larsh@apache.org" <larsh@apache.org>,
        Dario Messina <nanodario@gmail.com>, civic9 <civic9@gmail.com>,
        agk@godking.net, kjslag@gmail.com, bastidoerner@gmail.com,
        ibm-acpi-devel@lists.sourceforge.net, ibm-acpi@hmh.eng.br,
        platform-driver-x86@vger.kernel.org, arc@osknowledge.org
Subject: Re: [ibm-acpi-devel] [PATCH v4] thinkpad_acpi: Add support for dual
 fan control on select models
Message-ID: <20200430214041.GA28186@khazad-dum.debian.net>
References: <20200423165457.54388-1-larsh@apache.org>
 <20200423215709.72993-1-larsh@apache.org>
 <11041815.WYjWQN8m1R@lenovodario>
 <CAM_y6qhV6r9BVE6Uibn=xpDZRYuhZDBBgfHT8fMECNS1DyaQwQ@mail.gmail.com>
 <1605997626.1278142.1588119634625@mail.yahoo.com>
 <91feeffa-1f48-347a-fb90-7bf733647476@kpanic.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <91feeffa-1f48-347a-fb90-7bf733647476@kpanic.de>
X-GPG-Fingerprint1: 4096R/0x0BD9E81139CB4807: C467 A717 507B BAFE D3C1  6092
 0BD9 E811 39CB 4807
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, 29 Apr 2020, Stefan Assmann wrote:
> On 29.04.20 02:20, larsh@apache.org wrote:
> > Do you have a use case for that behavior?
> > 
> > The previous patch broke the /proc interface, didn't not work with the current version of thinkfan
> > (but a a version with multi-fan support is in the works), and it had hard to track internal mutable state.
> > 
> > The proposed change is clean on all these fronts.
> > 
> > I'm not a fan of surprising the user with unnecessarily complex behavior (but perhaps this can be added as an option in the future.)
> 
> I concur to keep the patch as is. Any additional functionality could be
> added later on, if deemed necessary.

Yes, but let's avoid changing exposed APIs as much as possible...

Anyway, the correct interface *when exposing both fans* is:

1. Use the "hwmon" sysfs interface to expose each fan separately, and
control them separately.

1a. it is quite acceptable to control them in group by default, and have
a module parameter to select grouped, or separate behavior.

2. /proc/acpi/ibm/fan shall control both of them at the same time, and
report data from the first fan.  THIS INTERFACE IS FROZEN, LET'S NOT
MESS WITH IT.

Also, "fail-safe" for this is to have the two fans on automatic, and to
enable both fans.

All of that said, *it is very much acceptable* to merge a first set of
patches that controls both fans simultaneously and exposes the fan group
as if it were just the main fan, and later improve on the patch to
expose the second fan separately (provided safe group behavior is
maintained, see above).

-- 
  Henrique Holschuh
