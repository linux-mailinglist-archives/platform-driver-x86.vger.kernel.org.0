Return-Path: <platform-driver-x86+bounces-10133-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id AE280A5D150
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Mar 2025 22:03:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 6C1EE189D0B0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Mar 2025 21:03:09 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5717D224B12;
	Tue, 11 Mar 2025 21:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c00NDFiW"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F42B1F4CA8;
	Tue, 11 Mar 2025 21:02:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741726976; cv=none; b=elroSyycBfcgHvhEm+oUDeFrGhs7e8Hodr3e+jZNJvDdNePVOrqQRORDhZl/t24MmWVDPAwYa87VN2+lH8zVmORsg9Hc3xadDrc7L1ugTk3r7at1H2mwQ0TnjCEXJMv/8PhIUd3HxinM6cGyKH/g3omoGSt7znmV3jQyxA/eZoo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741726976; c=relaxed/simple;
	bh=dauZLe2IF0Uqx8VNd0GXSeLcVh6IJgXTUntHRkfqoAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bejsIV72xGmq9iZIh8AtORGYPaLqSj3Qu46ud/0dp8QSb2KAxnidAzjpDV2rtpD7OpQE0wpCIIM3QK5eZEMndRuIzU5Xf0cc/0slbW9HEitARVYDTIZXGeFd3p8Ane0vVp4YyRc9YMrGkZa0t/NhP0wtVuubiz/loexGTMpchWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c00NDFiW; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E0C9C4CEE9;
	Tue, 11 Mar 2025 21:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741726972;
	bh=dauZLe2IF0Uqx8VNd0GXSeLcVh6IJgXTUntHRkfqoAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c00NDFiWwIzMK0gzhd2kQDuy4DBcJKzXefjAzPjh08qQoiHlKM8SJhk697phwuue0
	 U7mBPhw4IfDHh++CflvTAbxECdei3e6abJHMCL9/dl5lpKxG/ZUjtPOgP+MbWHuWKB
	 IYaQVztobCyIxbutMr2rV5Mgm4i5YUhUQZ0zQxlW7yOKOaiUNDNrdZndgr1nprocVU
	 6Zanx2Kia81zdPVCWLK6rWk3UTC55N1t9kwioYyNxuWWZQmtYxT6aaI0eN9gr+wLCA
	 Mzg2UXJ/L8Q+kLaNKHxuDSLIlnoxD4tchl3Lx6NqV7iei1HluL2SjaKEaTAhMs5YrI
	 qR+ICks1ZXFng==
Received: by pali.im (Postfix)
	id C1E5A80E; Tue, 11 Mar 2025 22:02:38 +0100 (CET)
Date: Tue, 11 Mar 2025 22:02:38 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To: Armin Wolf <W_Armin@gmx.de>
Cc: "linux@weissschuh.net" <linux@weissschuh.net>,
	Kurt Borja <kuurtb@gmail.com>, akpm@linux-foundation.org,
	mcgrof@kernel.org, russ.weight@linux.dev, dakr@kernel.org,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>
Subject: Re: In-kernel parser for the BMOF format used by WMI-ACPI
Message-ID: <20250311210238.fjv4ssohn2l2qzih@pali>
References: <a18f2f93-c8ee-47af-9446-97e3714fc275@gmx.de>
 <20250311201357.tyldll7j2eogmryw@pali>
 <f5d3ef28-7321-4bb1-955a-8f9b53b13c2a@gmx.de>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f5d3ef28-7321-4bb1-955a-8f9b53b13c2a@gmx.de>
User-Agent: NeoMutt/20180716

On Tuesday 11 March 2025 21:59:29 Armin Wolf wrote:
> Am 11.03.25 um 21:13 schrieb Pali Rohár:
> 
> > On Tuesday 11 March 2025 21:06:16 Armin Wolf wrote:
> > >   - Is there any way to check whether the Doublespace compression algorithm is still encumbered by patents?
> > Linux kernel 2.2 or 2.4 had full read/write support for doublespace
> > compression algorithm in mainline kernel and it was connected with fat
> > driver. IIRC it was dropped for kernel 2.6 because nobody ported that
> > vfat code to new fs API and hence doublespace in-kernel compression
> > algorithm was not needed/used anymore. But I do not remember details.
> > 
> > So IMHO it should not be a problem to reintroduce same code into kernel
> > again if there is a new need for it.
> > 
> > And in my project I reused the doublespace compression code from old
> > Linux kernel.
> 
> AFAIK only the CVF code used by the dmsdos driver was inside the mainline kernel,
> but not the dmsdos driver itself.

Ok, probably I remember it incorrectly. It is too long ago.

