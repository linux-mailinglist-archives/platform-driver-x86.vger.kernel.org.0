Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id DCCA64062A7
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Sep 2021 02:45:12 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233769AbhIJAqH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 9 Sep 2021 20:46:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:48982 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234518AbhIJAXd (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 9 Sep 2021 20:23:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 625A4604DC;
        Fri, 10 Sep 2021 00:22:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1631233343;
        bh=OOlkE/5wn5cX1UCFaQILnONAsv24eb8TbOKobIjrxkc=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=qQjCprsuPxDCFN0vl2ji1PSmwPWqJB/DXIQTLMD8tE1nTsVZ9YX6wKMUAAMoz62TA
         ltgPNoDe72oIt2k3nYqPn2T8UwtIxwvlBH2rpfFuI4BeLFelVyQKVSkbRslmbuTH6Y
         XV8j1dqnfQSWFtM2E4TQDpHSERU1cqJTmf0BBPY2/JvHefbvu0OHM9pkIQFjgQDRzF
         JmI8sMyTCLvEzgjN7szCDSDDFT3W4BLS3hdIGChtgJIxudRrqExl4JcDRZoiVKnVWs
         RaVut8J/UE+FcijWnqfAPtllSV+aAJoQ6R/FU6Rd0WIguh4LhOLYexFq2SrDMTYc6J
         jj+FBKm7cIu1w==
From:   Sasha Levin <sashal@kernel.org>
To:     linux-kernel@vger.kernel.org, stable@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Mario Limonciello <mario.limonciello@dell.com>,
        =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>, Dell.Client.Kernel@dell.com,
        platform-driver-x86@vger.kernel.org,
        Andy Lavr <andy.lavr@gmail.com>,
        Sasha Levin <sashal@kernel.org>
Subject: [PATCH AUTOSEL 5.4 30/37] platform/x86: dell-smbios-wmi: Avoid false-positive memcpy() warning
Date:   Thu,  9 Sep 2021 20:21:35 -0400
Message-Id: <20210910002143.175731-30-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910002143.175731-1-sashal@kernel.org>
References: <20210910002143.175731-1-sashal@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Kees Cook <keescook@chromium.org>

[ Upstream commit fb49d9946f96081f9a05d8f305b3f40285afe4a9 ]

In preparation for FORTIFY_SOURCE performing compile-time and run-time
field bounds checking for memcpy(), memmove(), and memset(), avoid
intentionally writing across neighboring fields.

Since all the size checking has already happened, use input.pointer
(void *) so memcpy() doesn't get confused about how much is being
written.

Avoids this false-positive warning when run-time memcpy() strict
bounds checking is enabled:

memcpy: detected field-spanning write (size 4096) of single field (size 36)
WARNING: CPU: 0 PID: 357 at drivers/platform/x86/dell/dell-smbios-wmi.c:74 run_smbios_call+0x110/0x1e0 [dell_smbios]

Cc: Hans de Goede <hdegoede@redhat.com>
Cc: Mark Gross <mgross@linux.intel.com>
Cc: Mario Limonciello <mario.limonciello@dell.com>
Cc: "Pali Rohár" <pali@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: "Uwe Kleine-König" <u.kleine-koenig@pengutronix.de>
Cc: Dell.Client.Kernel@dell.com
Cc: platform-driver-x86@vger.kernel.org
Reported-by: Andy Lavr <andy.lavr@gmail.com>
Signed-off-by: Kees Cook <keescook@chromium.org>
Link: https://lore.kernel.org/r/20210825160749.3891090-1-keescook@chromium.org
Reviewed-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/platform/x86/dell-smbios-wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/dell-smbios-wmi.c b/drivers/platform/x86/dell-smbios-wmi.c
index c97bd4a45242..32e8c4715d53 100644
--- a/drivers/platform/x86/dell-smbios-wmi.c
+++ b/drivers/platform/x86/dell-smbios-wmi.c
@@ -71,7 +71,7 @@ static int run_smbios_call(struct wmi_device *wdev)
 				obj->integer.value);
 		return -EIO;
 	}
-	memcpy(&priv->buf->std, obj->buffer.pointer, obj->buffer.length);
+	memcpy(input.pointer, obj->buffer.pointer, obj->buffer.length);
 	dev_dbg(&wdev->dev, "result: [%08x,%08x,%08x,%08x]\n",
 		priv->buf->std.output[0], priv->buf->std.output[1],
 		priv->buf->std.output[2], priv->buf->std.output[3]);
-- 
2.30.2

