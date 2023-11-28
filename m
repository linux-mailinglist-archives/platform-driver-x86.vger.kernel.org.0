Return-Path: <platform-driver-x86+bounces-113-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CECA7FBB55
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 14:21:18 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 10017B21ABE
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Nov 2023 13:21:16 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9F55813B;
	Tue, 28 Nov 2023 13:21:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gvo7FWXD"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A61DDA;
	Tue, 28 Nov 2023 05:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701177668; x=1732713668;
  h=from:to:cc:in-reply-to:references:subject:message-id:
   date:mime-version:content-transfer-encoding;
  bh=q8LFbcF8XIOorZjKnJKfcMWLygjGPUyZvF6azgdLJzc=;
  b=gvo7FWXDxhAFc8tRzZ1Zz7FHWB3LP5XsBc94smGcmXvep0nmrq6N4jSQ
   Cvqb77plH9SuqlimpEgknjaQFE5BNNXkY/+8rL7asCNWfpDtQGGOK9NT1
   yQ2DS4K9l8ezz/558Lf8AyMsTIH/LjMi6w5IwUWUUZbpe6NBGSSoUaJfG
   Ek0e3i/SSx5oBg3251m4tIitHCjMV74S9O9bLBKFlUKpkhx3i/biWoOZ9
   fZDuSZs4VVxfhmoITYr09wkA0DVqslnD+Vnq934sSZHg4wW61Qw1zQo2l
   pwFOOHOwzQsNiyNSU+8Qng4N3IIITdPgxvYn6S08fWy12J2IGByNFOvko
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10907"; a="11618512"
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="11618512"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:21:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,233,1695711600"; 
   d="scan'208";a="16625071"
Received: from mvafin-mobl2.ger.corp.intel.com (HELO localhost) ([10.252.43.98])
  by smtpauth.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2023 05:21:06 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
To: hdegoede@redhat.com, "Luke D. Jones" <luke@ljones.dev>
Cc: corentin.chary@gmail.com, platform-driver-x86@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <20231126230521.125708-1-luke@ljones.dev>
References: <20231126230521.125708-1-luke@ljones.dev>
Subject: Re: [PATCH v2 0/1] platform/x86: asus-wmi: disable USB0 hub on ROG
 Ally before suspend
Message-Id: <170117767063.1996.14540015573395714093.b4-ty@linux.intel.com>
Date: Tue, 28 Nov 2023 15:21:10 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.12.3

On Mon, 27 Nov 2023 12:05:20 +1300, Luke D. Jones wrote:

> This is a fix for the ROG Ally not being able to use the N-Key device after a suspend/resume cycle.
> 
> The root of the issue is that ASUS changed the MCU firmware to dfisconnect the USB0 hub when the
> screen is switched off during the s2idle suspend path. I tried many many different tactics to try
> and get this s2idle part to work but it seems there are races between this and other subsystems.
> 
> What has so far been reliable and consistent is a manual call to the CSEE method that is called in
> ACPI by the Microsoft DSM screen off path followed by a short sleep in asus-wmi. The PM prepare
> hook looks to be the earliest possible place. A sleep that is too long ends up with USB subsystem
> registering a disconnect, and thus on resume the device paths change. Too short and it is unreliable.
> 
> [...]


Thank you for your contribution, it has been applied to my local
review-ilpo branch. Note it will show up in the public
platform-drivers-x86/review-ilpo branch only once I've pushed my
local branch there, which might take a while.

The list of commits applied:
[1/1] platform/x86: asus-wmi: disable USB0 hub on ROG Ally before suspend
      commit: e0894ff038d86f30614ec16ec26dacb88c8d2bd4

--
 i.


