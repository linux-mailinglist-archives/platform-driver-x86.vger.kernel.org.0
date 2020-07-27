Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 83B8B22F550
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 18:30:34 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731303AbgG0Qa2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 12:30:28 -0400
Received: from mail4.protonmail.ch ([185.70.40.27]:16150 "EHLO
        mail4.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730408AbgG0Qa2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 12:30:28 -0400
Date:   Mon, 27 Jul 2020 16:30:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595867426;
        bh=LRPr0b8KA9Ck+CMiaL+EyrNzUyJlOUJA4AcH0o70Ci4=;
        h=Date:To:From:Reply-To:Subject:From;
        b=HBntedreaQnfWz0bdv6NZcMyi+zHoYD3ZV93jqzAR+gmJqBJ1zOtKzRxN0FtdTG6S
         bwyxlbN51CyfYHRBqrzD6wZ/SPjGdAAt/vZa37W6gosakVeGCpwL3VgS+tzbc2vy1K
         cm1azSZyFAnvljsqkCYui4fCz8gTbBH5HTrgiG0c=
To:     Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [PATCH] Documentation/admin-guide/laptops/thinkpad-acpi: add section for battery charge control
Message-ID: <Gl7L5UPD3AkLt73nhH5L6xDn_6cvzWt-O2zsa5q9XRIEonNjzwNbES8BaEbqr7YGo7odtCDCMFSuWPmXpKWThFHn6sdNPzSJU2Ki24aIibU=@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=7.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on mail.protonmail.ch
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Signed-off-by: Barnab=C3=A1s P=C5=91cze <pobrn@protonmail.com>
---
 .../admin-guide/laptops/thinkpad-acpi.rst       | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/Documentation/admin-guide/laptops/thinkpad-acpi.rst b/Document=
ation/admin-guide/laptops/thinkpad-acpi.rst
index 822907dcc845..46217d0c3dd1 100644
--- a/Documentation/admin-guide/laptops/thinkpad-acpi.rst
+++ b/Documentation/admin-guide/laptops/thinkpad-acpi.rst
@@ -1470,6 +1470,23 @@ For more details about which buttons will appear dep=
ending on the mode, please
 review the laptop's user guide:
 http://www.lenovo.com/shop/americas/content/user_guides/x1carbon_2_ug_en.p=
df

+Battery charge control
+----------------------
+
+sysfs attributes:
+/sys/class/power_supply/BAT*/charge_control_{start,end}_threshold
+
+These two attributes are created for those batteries that are supported by=
 the
+driver. They enable the user to control the battery charge thresholds of t=
he
+given battery. Both values may be read and set. `charge_control_start_thre=
shold`
+accepts an integer between 0 and 99 (inclusive); this value represents a b=
attery
+percentage level, below which charging will begin. `charge_control_end_thr=
eshold`
+accepts an integer between 1 and 100 (inclusive); this value represents a =
battery
+percentage level, above which charging will stop.
+
+The exact semantics of the attributes may be found in
+Documentation/ABI/testing/sysfs-class-power.
+
 Multiple Commands, Module Parameters
 ------------------------------------

--
2.27.0

