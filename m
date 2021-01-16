Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 41ECF2F8FC8
	for <lists+platform-driver-x86@lfdr.de>; Sat, 16 Jan 2021 23:59:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726831AbhAPW7V (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 16 Jan 2021 17:59:21 -0500
Received: from mail-40131.protonmail.ch ([185.70.40.131]:59250 "EHLO
        mail-40131.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbhAPW7U (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 16 Jan 2021 17:59:20 -0500
Date:   Sat, 16 Jan 2021 22:58:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1610837917;
        bh=3YQiSk/UtF2JeQKibaRgI72C6qQoItCZjbbau3RbIqQ=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=NRoe3pt9As3LaMb+rv6M9IeNS4DcPeLfzeBkkuctWIGEPJjGbxgrIZe/nm00uhNa3
         eKmaBes1qAbykhdN0mMcCp5MekTBwnYxUPLaPa3NXnNHMMms+zDC9syGJCEsy8eCUg
         ksw24nqphxhmLdfdTdOgM8M1RrbZA6Q3ElR+xNRc=
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Ike Panhc <ike.pan@canonical.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2 23/24] Documentation/ABI: sysfs-platform-ideapad-laptop: update device attribute paths
Message-ID: <uaRWzbXLCtfIvyAplzL4R6WPbWDp2vxeODkljsKlaRVLoduXUrRFlW6oFqbZltiZ6YJv6fm2goGUEpCJuglx8ytLGETou1ZPehILoepF2_I=@protonmail.com>
In-Reply-To: <CAHp75Ve8DO+DufJ=ApDonLjqdrOaRa4L-Tpeg8YWGNKvCBY_Eg@mail.gmail.com>
References: <20210113182016.166049-24-pobrn@protonmail.com> <CAHp75Ve8DO+DufJ=ApDonLjqdrOaRa4L-Tpeg8YWGNKvCBY_Eg@mail.gmail.com>
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


Thanks for the review.

2021. janu=C3=A1r 16., szombat 21:10 keltez=C3=A9ssel, Andy Shevchenko =
=C3=ADrta:

> On Wed, Jan 13, 2021 at 8:25 PM Barnab=C3=A1s P=C5=91cze wrote:
> >
> > The documentation referred to non-existent device attributes under a no=
n-existent
> > platform device. Update it with the current location of the attributes.
>
> Fixes tag, please?
>

I'm not sure which commit (if any) should be referenced. Do you think
the patch that removed the platform device - hence making the documented pa=
ths
incorrect - would be OK to reference here?


Thanks,
Barnab=C3=A1s P=C5=91cze
