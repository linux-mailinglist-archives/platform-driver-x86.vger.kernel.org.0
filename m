Return-Path: <platform-driver-x86+bounces-8206-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 6616CA001E2
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Jan 2025 00:54:17 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 3E5003A25E7
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jan 2025 23:54:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 962301B87C4;
	Thu,  2 Jan 2025 23:54:12 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7865A43173;
	Thu,  2 Jan 2025 23:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735862052; cv=none; b=ihghFaCrWbFVY4hxp6kI5z523/ObeLIA/OVZvLuQoFLSsWFOf8QtMpgyUdziWO8qihQqMcmvjaPsbWQzBsPFgAHrKNz/lwDIMQQHOLsL0JqA9XAT6HGI2UOswYQlqU5KWEQ4lDXfAK/ZCWfOvjBQypKOZaDkvR7ZujV2pOq714M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735862052; c=relaxed/simple;
	bh=TJLpBe1qyp9D3/GA7BLfHrnLYXFFy9yOiQcxiy7lhbk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=CC/QXP/Sz+p/tAyUMEmw0cfI7M6XogAF+jQfKyMuEM+AtyBlkvdeou5Nw5Z9pCbVfuOwY4fCAFY39Vqdx44mIaeez2iqicpT2Mb6A34D3FpTbX6+wKSSbxroWH4SitsOaIoxbmwMON632anW9KJguoVYWplvu7ucFHT2V/Vd+TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70FFC4CED0;
	Thu,  2 Jan 2025 23:54:11 +0000 (UTC)
Received: by mercury (Postfix, from userid 1000)
	id 75E51106034B; Fri, 03 Jan 2025 00:54:08 +0100 (CET)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org
In-Reply-To: <20241221125140.345776-1-hdegoede@redhat.com>
References: <20241221125140.345776-1-hdegoede@redhat.com>
Subject: Re: [PATCH v5 0/1] power: supply: Add new "charge_types" property
Message-Id: <173586204840.766364.5459496006730327189.b4-ty@collabora.com>
Date: Fri, 03 Jan 2025 00:54:08 +0100
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2


On Sat, 21 Dec 2024 13:51:39 +0100, Hans de Goede wrote:
> Here is v5 of my "charge_types" property series, most of this series
> has already been merged, leaving only the dell-laptop patch.
> 
> Changes in v5:
> - Drop patches 1-3 (already merged)
> - dell-laptop: Return ENOENT instead of EIO in charge_types_store() when
>   the requested mode was accepted by power_supply_charge_types_parse() but
>   for some reason is not found in the battery_modes[] array
> 
> [...]

Applied, thanks!

[1/1] platform/x86: dell-laptop: Use power_supply_charge_types_show/_parse() helpers
      commit: a3a8799165ff83bb764fd800c6559c3cba0ddac3

Best regards,
-- 
Sebastian Reichel <sebastian.reichel@collabora.com>


