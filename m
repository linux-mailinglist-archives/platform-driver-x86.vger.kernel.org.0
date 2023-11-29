Return-Path: <platform-driver-x86+bounces-150-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id DB46B7FDF30
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 19:17:16 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7DBECB20FD9
	for <lists+platform-driver-x86@lfdr.de>; Wed, 29 Nov 2023 18:17:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E69245C3DE;
	Wed, 29 Nov 2023 18:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="UsWayn0H"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6593B9;
	Wed, 29 Nov 2023 10:17:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.de; s=s31663417;
	t=1701281817; x=1701886617; i=w_armin@gmx.de;
	bh=SkykkrdVMyo+wYmWI6AvKsqQ/Fs+Iqad5hnFwSp9bDk=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date;
	b=UsWayn0HDDWIqHwAFeST8UwvF+omAcvkAw85MDwwW0xDewCRhmpiFkhmdPm5t1MY
	 tbrqSz7I2BvBtg2hf9So0QIkj/0YMZNB3HJcQLYwFRncKSppyDFW7KatJw5GUZ8rb
	 Dq2E36l3A6S7QzjFh+LCC3xhAc62pEQrRQSRnmzUPig+4PuKSBAh/kUvX1XK8ptuG
	 VQv5TEGk2FPavfxqbtVxhILUd68ZAeHYC4vEX3hny+aJMj3VGnBlPGBWGcITTEdMq
	 aB3ZmsE/Ewvjm25No7b/4HAsiUJIqYuLYarIukneglmfTyrgzQCuXIIYNxanIVyT4
	 0TatbiMOna024jCUrA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.users.agdsn.de ([141.30.226.129]) by mail.gmx.net
 (mrgmx104 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1MlNtF-1rZXTI2uzN-00ln8L; Wed, 29 Nov 2023 19:16:57 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] platform/x86: wmi: Skip blocks with zero instances
Date: Wed, 29 Nov 2023 19:16:54 +0100
Message-Id: <20231129181654.5800-1-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:+NBnaTf+YFwq+J7+NUSzfy6sIp2qeoca0FjRagB64jV2JaaEM8z
 j0MrzkGBG8YLJeXnrhsspmKTAxuO+04jJJg4Qqxmz8N2yioVa9zGTu2rT+ybyiIRMEmNCQP
 T6QQp7Oqah1I/AyNUmAos5SEOXNDudfjFV9CUikh8Iv2Vh3TrWv059+uZRYlB2c//TV2uHA
 QQUaATXThtsnUgLjIEw2g==
UI-OutboundReport: notjunk:1;M01:P0:+26yQg5Xt+A=;eDNGmFqhrDPmadpeJ2urwSOuS8y
 q6QemUkR6BSvVtgPhqsvQJhf76ZGzZAjqzZcR4UOn9AypIZO79sQD4kULD4TzYmwpk5eZt80I
 xoUsCqA97g9Lwq8qNjCtq5cNWF0xWzh46K95O38e1APlPyAQY7mCUmDBjgyz18D8ZsivQC8cT
 k/3VQcgPDKsQXUh6wVfe42dVQ/z1PpdlYlJV0ttckGu5HrwMVhM8H4zN7qw6uRMj7dyO7J73h
 g4fNL585W5VrkpbgEIbpchMwmCtzoMZVwzz1DqRwyU+NWU75Dfto8kuvxbffd524MXfjW8aUP
 eyIReWDfARiMDY1QN0cmW0EJvd6dS+qxlmJnsNwN8TIjCU/ijRvYz8161jBOJLsUAFN5PjP/k
 HY1Idu3h4stYGU9F7cyN06YiiFHKIDB2+2QWfYtAOYTu3OHQ26OFpGX7D2StIRL/+1zQUQboE
 FK6Xr/sdxX6EKkZvqVP3WPgIBHQtrp/IIQtHROjP8ZgIQB7q+Mq93kLB42rTQdMckVIetwiq2
 jXpzJInTBKTfvJcrPmKUn99b92iQCsbT7k/BDRK+91b9EnTv3u1HfN4LisxZts0hNP0ArYV79
 P4BCoU0cLhggleQf2B2tGJJhKwUri1lEfghk7TRdqRB3BhhhBcDTVLGGN6KnszzIU7342SC6f
 j3y+w/BwAUDax44Kl9f4IqwIq0OGCoOnnVdgRnZnfLsOH0hD3d1gjLVCJhhLr87pWiwXwf2ai
 X8fIV4DBSdbZWzN4HKgt7GB+p81yThkHugbB4NXYfnBqTMD3Aj8O8YDygl8DvAInBjxJtY1lF
 1oxcfYqZ2dYdQgZg6OlIqssF2XiB6K/RcWeGjGKhUSBBPMQlp+Q4s50WyCb8xVC6Ii9RG7dFV
 axgfz6I2hamv3i/K0gy+rLZP/R4yZhhP64Y+EgGAd+3WBpWL/DRvT/S77E4KnzW7zEXFSEKNo
 JnTqv660c8PiMEkBhEvSEAB0iF0=

Some machines like the HP Omen 17 ck2000nf contain WMI blocks
with zero instances, so any WMI driver which tries to handle the
associated WMI device will fail.
Skip such WMI blocks to avoid confusing any WMI drivers.

Reported-by: Alexis Belmonte <alexbelm48@gmail.com>
Closes: https://bugzilla.kernel.org/show_bug.cgi?id=3D218188
Fixes: bff431e49ff5 ("ACPI: WMI: Add ACPI-WMI mapping driver")
Tested-by: Alexis Belmonte <alexbelm48@gmail.com>
Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
Changes since v2:
- add Fixes tag
=2D--
 drivers/platform/x86/wmi.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index cb7e74f2b009..4f94e4b117f1 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -1346,6 +1346,11 @@ static int parse_wdg(struct device *wmi_bus_dev, st=
ruct platform_device *pdev)
 		if (debug_dump_wdg)
 			wmi_dump_wdg(&gblock[i]);

+		if (!gblock[i].instance_count) {
+			dev_info(wmi_bus_dev, FW_INFO "%pUL has zero instances\n", &gblock[i].=
guid);
+			continue;
+		}
+
 		if (guid_already_parsed_for_legacy(device, &gblock[i].guid))
 			continue;

=2D-
2.39.2


