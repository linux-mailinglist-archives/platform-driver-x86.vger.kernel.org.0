Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C72194088CB
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Sep 2021 12:09:43 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238891AbhIMKK6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Sep 2021 06:10:58 -0400
Received: from mail-0301.mail-europe.com ([188.165.51.139]:41447 "EHLO
        mail-0301.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238876AbhIMKK5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Sep 2021 06:10:57 -0400
Date:   Mon, 13 Sep 2021 10:09:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1631527779;
        bh=/sYgqggOURd58J2iN28TwTtUKOTC90IKsE8DYFFHBR0=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=qcQckdlOyXxUBImMoLUUvOCDoj+fScdfwKUGGNCvY4466weloZGWPLF23Dw8LAJCs
         UEpIgbdEwnE8GUgbZ7drKtdNShHdxQBWX0l7z7N20dyCXNdSaNtb7/m76jKI52WXqv
         bvLgJ/BfBGGN6zlOd/43zotSKJax9ep5e2CZY7aU=
To:     Hans de Goede <hdegoede@redhat.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [RFC PATCH v1 13/30] platform/x86: wmi: use dynamic debug to print data about events
Message-ID: <bh-WuyQoOPt-bn0_bhN86zDXoltPaAI1BQ-jNRsDv_MApIiYNNhTQOslgbbiRv2KzcRq_m-N9ZtXvel-qu22r2W6m5UzUgXOLCBHPCENscE=@protonmail.com>
In-Reply-To: <cca079b3-1a55-845b-3cfc-1b0a1879484e@redhat.com>
References: <20210904175450.156801-14-pobrn@protonmail.com> <cca079b3-1a55-845b-3cfc-1b0a1879484e@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi


2021. szeptember 13., h=C3=A9tf=C5=91 11:43 keltez=C3=A9ssel, Hans de Goede=
 =C3=ADrta:
> > -=09if (debug_event)
> > -=09=09pr_info("DEBUG Event GUID: %pUL\n", wblock->gblock.guid);
> > +=09dev_dbg(&wblock->dev.dev, "event 0x%02X\n", event);
>
> The debug_event value gets set by a module-parameter and several WMI rela=
ted
> howto-s and forum threads on the web refer to this. At one point in time =
even:
> https://wiki.ubuntu.com/Hotkeys/Troubleshooting
>
> Used to refer to this, but they seem to have dropped this.
>
> Either way this changes makes users have to also deal with dyndbg stuff t=
o
> get the same info which before they could get with just the debug_event m=
odule
> param, which makes debugging harder, so I'm going to drop this patch from=
 the
> series.

Would you consider accepting a patch that changes it to:

  if (debug_event)
    dev_info(&wblock->dev.dev, "event 0x%02X\n", event);

?


Regards,
Barnab=C3=A1s P=C5=91cze
