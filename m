Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9DF5E22DEC1
	for <lists+platform-driver-x86@lfdr.de>; Sun, 26 Jul 2020 13:44:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725972AbgGZLoq (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 26 Jul 2020 07:44:46 -0400
Received: from mail-40130.protonmail.ch ([185.70.40.130]:41100 "EHLO
        mail-40130.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725794AbgGZLoq (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 26 Jul 2020 07:44:46 -0400
Date:   Sun, 26 Jul 2020 11:38:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595763538;
        bh=WZerw/5gZ8THlKUTkiAXShrTfKKNmxVFkriK7idtxCw=;
        h=Date:To:From:Reply-To:Subject:From;
        b=fqfU9Vf34z6J18H8Whc9KOTpuIpOEWPPcsh+3WyRNu6iA2ki7pDIYKlWF3rtYVtiF
         QOHa4EM7lbsSyUceOB7IFmhZ4aaIeysooIwOImg04HXonViiAfNUJumaSZlooGxVNQ
         0ynJOJX0iRe6hrMoHrB29Tmyp7OHJhGSjSwUMFWI=
To:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        Ognjen Galic <smclt30p@gmail.com>,
        Kristian Klausen <kristian@klausen.dk>,
        Ayman Bagabas <ayman.bagabas@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: platform/x86: asus-wmi, huawei-wmi, thinkpad_acpi: inconsistent battery charge threshold attribute names
Message-ID: <vtiHxEss03uciUomJSQ3Cf-m8xxvUUxqsaPRimyVrrMG7e9QItw2SngGu6b6tJ3N8PXOnMBwIys3BliV6rXJqEwaQguEp0pVpl5BmoCAzz4=@protonmail.com>
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

Hello all,

The asus-wmi, huawei-wmi, and thinkpad_acpi drivers all utilize the battery=
 hooking system provided by the acpi/battery driver to provide functionalit=
y to specify the battery charge limits.

The first two drivers create the following attributes for the battery to ac=
hieve the functionality:
- charge_control_start_threshold (only huawei-wmi)
- charge_control_end_threshold,

while thinkpad_acpi uses the following names:
- charge_start_threshold
- charge_stop_threshold.

The userspace utility TLP looks for the attributes defined by the thinkpad_=
acpi driver. In my opinion this inconsistency should be promptly resolved a=
nd the preferred names documented.

A further detail that's worth documenting is the accepted range of values. =
thinkpad_acpi accepts [0, 99] for the start value, and [1, 100] for the sto=
p value. On the other hand asus-wmi, and huawei-wmi accept [0, 100] for the=
 stop value, and huawei-wmi accepts [0, 100] for the start value. (asus-wmi=
 does not support specifying a start value).

I am in the process of writing a platform driver which provides this exact =
functionality, that is why I would like both of the aforementioned details =
to be set down. I'd prefer the names used by TLP and thinkpad_acpi, but it'=
s really not important, I just want them to be the same for all drivers, an=
d that these names be documented.

Secondly, one thing I can imagine is having two another attributes: charge_=
start_threshold_range and charge_stop_threshold_range, that contain two int=
egers "a b", which means the valid range of values is [a, b]. Then I guess =
there needs to be another value that is handled, something like "off", whic=
h restores the platform defaults. This is, of course, requires more complex=
 implementation, but is quite flexible. Although I am not sure this flexibi=
lity is worth the complexity.

Or a simpler option is accepting [0, 100] for both attributes and returning=
 -EINVAL if the provided value is out of range or the driver cannot set it =
on that particular machine due to hardware limitations or something. Altern=
atively thinkpad_acpi behavior could be adopted as well ([0, 99] for start,=
 and [1, 100] for stop).

In both of the previous cases the behavior of the edge cases should be agre=
ed upon: for example, what does 0 for charge_stop_threshold mean? Does it r=
estore the default, or does it really stop charging at 0%, keeping the batt=
ery empty? And so on.

What do you think?


Thank you for your attention

Barnab=C3=A1s P=C5=91cze
