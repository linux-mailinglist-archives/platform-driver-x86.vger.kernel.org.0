Return-Path: <platform-driver-x86+bounces-7715-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id C14B59ED5D5
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 20:08:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 6411C169FF9
	for <lists+platform-driver-x86@lfdr.de>; Wed, 11 Dec 2024 19:07:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DF6CF254EA0;
	Wed, 11 Dec 2024 18:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nIVHxg2i"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5DC5254E99;
	Wed, 11 Dec 2024 18:54:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733943247; cv=none; b=XUyB9B6fnQl8+fJep6lJy9i6RY9ILKzA1XlLrBY9I3DvN/Qp7LVJPub8DBNlRenZfPk3B6KDTpf40N828BqTSfqZMnTI6SvpeMO/YBgGf+SfoOXBekDu4sCsSJV6uTlwJVw6HIAFqSwZFyO8cDp4MQ28BqkV1URvl/8cvJ3G7Gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733943247; c=relaxed/simple;
	bh=7ozMWDrtDMO5SKBOtF4GA6VAsjKod8+uLX4ouEbOVZo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=BUqFwk2E8r0J38hh9t46EcA+xglwyw8QG3xyzXRiCpYngEVCncv1biKoRlkC6bHqjfrtiTvJy/W1Ar70IpUSI5Zlfr8VerZ3srHT3l+nvts0iBoN7mSVs0vY3X5rgGyniRCjujSbDDdPPfXJ6t6wleV3rfQhjjC7ufn3KtkSh2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nIVHxg2i; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F7F5C4CEE0;
	Wed, 11 Dec 2024 18:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733943247;
	bh=7ozMWDrtDMO5SKBOtF4GA6VAsjKod8+uLX4ouEbOVZo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nIVHxg2iK7G54CwHsNbo3H3EB2QfX7J1GJ7vPoH6h2bPT0g48UfrPGW39/Ks4mbHx
	 3c1cpCdbB5KABoakmNEQnXoWZwjes0tfqDZJBG0HxYaWvqSbzLe+z07l75BmQv0bII
	 isBocO2qLDWb2wTyjRQlwHHru7f5GQyLbnLMqoEB6fWWypra7TMm6qWJYZmgwCCIi7
	 GjbJt2JH5Z+9GDWxalkc3HA9RVfrugEwMSPldV5K7KjVWf6kz/9hB7MAPYEchSp96/
	 9D+u8kTIRbXUfRyik0ukIAJeUGWoj33tprX5WHUpCEhcinWbuh8dgkTUvFlY7vaudM
	 a/WgqX/K42lmQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Armin Wolf <W_Armin@gmx.de>,
	Pau Espin Pedrol <pespin@espeweb.net>,
	Hans de Goede <hdegoede@redhat.com>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Sasha Levin <sashal@kernel.org>,
	corentin.chary@gmail.com,
	luke@ljones.dev,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH AUTOSEL 5.15 06/10] platform/x86: asus-nb-wmi: Ignore unknown event 0xCF
Date: Wed, 11 Dec 2024 13:53:47 -0500
Message-ID: <20241211185355.3842902-6-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241211185355.3842902-1-sashal@kernel.org>
References: <20241211185355.3842902-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 5.15.173
Content-Transfer-Encoding: 8bit

From: Armin Wolf <W_Armin@gmx.de>

[ Upstream commit e9fba20c29e27dc99e55e1c550573a114561bf8c ]

On the Asus X541UAK an unknown event 0xCF is emited when the charger
is plugged in. This is caused by the following AML code:

    If (ACPS ())
    {
        ACPF = One
        Local0 = 0x58
        If (ATKP)
        {
            ^^^^ATKD.IANE (0xCF)
        }
    }
    Else
    {
        ACPF = Zero
        Local0 = 0x57
    }

    Notify (AC0, 0x80) // Status Change
    If (ATKP)
    {
        ^^^^ATKD.IANE (Local0)
    }

    Sleep (0x64)
    PNOT ()
    Sleep (0x0A)
    NBAT (0x80)

Ignore the 0xCF event to silence the unknown event warning.

Reported-by: Pau Espin Pedrol <pespin@espeweb.net>
Closes: https://lore.kernel.org/platform-driver-x86/54d4860b-ec9c-4992-acf6-db3f90388293@espeweb.net
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Link: https://lore.kernel.org/r/20241123224700.18530-1-W_Armin@gmx.de
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/asus-nb-wmi.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
index 49505939352ae..224c1f1c271bc 100644
--- a/drivers/platform/x86/asus-nb-wmi.c
+++ b/drivers/platform/x86/asus-nb-wmi.c
@@ -574,6 +574,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
 	{ KE_KEY, 0xC4, { KEY_KBDILLUMUP } },
 	{ KE_KEY, 0xC5, { KEY_KBDILLUMDOWN } },
 	{ KE_IGNORE, 0xC6, },  /* Ambient Light Sensor notification */
+	{ KE_IGNORE, 0xCF, },	/* AC mode */
 	{ KE_KEY, 0xFA, { KEY_PROG2 } },           /* Lid flip action */
 	{ KE_KEY, 0xBD, { KEY_PROG2 } },           /* Lid flip action on ROG xflow laptops */
 	{ KE_END, 0},
-- 
2.43.0


