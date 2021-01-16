Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C09FF2F8F3A
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Jan 2021 21:35:31 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726903AbhAPUfP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Jan 2021 15:35:15 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:53263 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbhAPUfO (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 15:35:14 -0500
Date:   Sat, 16 Jan 2021 20:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610829272;
        bh=sOFM2phcRU+uFnUsL1+vBxKM8nH+luEkkB4+C7/Gc9o=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=IUlxr6yU9efrX39RmsJ3yUHImZw3Sgu3Sj+Jr0MljzYta+SEaNNPu9O3Zys0+jtP/
         P+4oiV/t7QyivO+iZXIeH+31bG7di5XsreRj1q6dGrEEgi/e30rb2OFKMpN7J8IXhg
         kNZcmy64ed8qmTq8Y0ycZ5egtx1EV6ojyjsLp7+E=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 07/24] platform/x86: ideapad-laptop: use dev_{err,warn} or appropriate variant to display log messages
Message-ID: <xOz_6Hj0TZSyCFbqlSs7eCqC-z6d7ayRd425T6w2A_aZ02Y4KoUDTXMSXZWr08SGO3msoWaW91uKT9fJODw5QD257jNRxl7yd-gTBdAwdWo=@protonmail.com>
In-Reply-To: <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
References: <20210113182016.166049-1-pobrn@protonmail.com> <20210113182016.166049-8-pobrn@protonmail.com> <CAHp75VfjDCAqPpPsaDiRCBDrq7VwyiZpOMpr-VvebPe+3b3w9A@mail.gmail.com>
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


2021. janu=C3=A1r 16., szombat 20:46 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:22 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > Having the device name in the log message makes it easier to determine =
in
> > the context of which device the message was printed, so utilize the
> > appropriate variants of dev_{err,warn,...} when printing log messages.
>
> This doesn't explain transitions like pr_err() -> dev_warn() or
> pr_info() -> dev_warn().
> Care to elaborate in the commit message?
> [...]

Thanks for the review, and thanks for pointing this out. I don't recall int=
endeding
to promote/demote any of the log messages when I was making these changes. =
I will
revisit my them and modify the commit and commit message accordingly.


Thanks,
Barnab=C3=A1s P=C5=91cze
