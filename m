Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B1CD668F49C
	for <lists+platform-driver-x86@lfdr.de>; Wed,  8 Feb 2023 18:32:52 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231386AbjBHRcv (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 8 Feb 2023 12:32:51 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230482AbjBHRcu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 8 Feb 2023 12:32:50 -0500
Received: from mail-qt1-x82a.google.com (mail-qt1-x82a.google.com [IPv6:2607:f8b0:4864:20::82a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B89493251B
        for <platform-driver-x86@vger.kernel.org>; Wed,  8 Feb 2023 09:32:48 -0800 (PST)
Received: by mail-qt1-x82a.google.com with SMTP id c2so21600131qtw.5
        for <platform-driver-x86@vger.kernel.org>; Wed, 08 Feb 2023 09:32:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=FoON82ixmMh4wf6hd3B5074OoNR5ywgtJWVa45FcoT8=;
        b=RDzbtyrt9T3qG+Blrdjcn1pUvTeKY9w8YRWzJnCMwhiodn2pV/gNuYtbMNIAxE+Z3t
         jMUBeuHv5igjEOPhbttsJY4os/eqg0iry7xbDI89FVfu/ep/Wpen8EE4Iu4NVNsHG4Sz
         pnSDMxbM6AT63/Injb5+5sQsVhbPBvugONldb+imL9LN36O3t6/FxWDzD1tXnQCtaOjj
         5PECypqXKBj+8NFS85P0FNrJKTennHultSyfuKo8w1cL1vMAd8vV6MCq8kB9bVmfP+Rk
         vFRy9Mzfbg4r9eqwkMj2FnfriO4ymIxf8Z950B1JEJ98eWH0DaZ6EkkWnbHMR47wEO4x
         zoDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FoON82ixmMh4wf6hd3B5074OoNR5ywgtJWVa45FcoT8=;
        b=B5GRGnaAU7UVkEJrBQeLiasXJjRVZjdFv75qnYyUZC5tdZJcTWHDJSjSPpFwI/t11p
         2a1vhnL0qTjY/aETF4siIcTsgD+UePq6S2b/1ztARxG95TDj/r5jK35VHsFae+Nrj6Mb
         MOPUpbdZ+T6mVcmRkj/pN2/xHYMH7698hCOohhxknDbqYM6LwzUEVyxlRdM6NNUxCMBc
         6VGasJiivMvRdx8bnPKFKhpUx8YZ0cmvvviwwwKI+SU3caBGubTkLa/KZdaoA2saaFic
         9twq3Lq1Ar21r1vctal8DV6zMZO09Hgid7lcPkzJInx66AigjQUY6QbPIPz/vUNiYoDe
         edrg==
X-Gm-Message-State: AO0yUKXVxhTv4GYWbcxna+evezHnOQB9U8ogJG8B0UcSZf5F234TwpZV
        UsWSA91X/nFiFLSdRcG3YyzOBkIZYIFGa8FzCzg=
X-Google-Smtp-Source: AK7set+3XPGh6xkOV+UCn/CWsUTcFHKUpU9qoiy9wUs1+ev0o7ElqtyyymCZacBZK/+WFBXpM61t+50AT0/tEcu7saA=
X-Received: by 2002:ac8:5b90:0:b0:3b8:409b:799e with SMTP id
 a16-20020ac85b90000000b003b8409b799emr2034748qta.340.1675877567826; Wed, 08
 Feb 2023 09:32:47 -0800 (PST)
MIME-Version: 1.0
References: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
In-Reply-To: <Y+JbBiMJw+VLo2Nr@mail.gmail.com>
From:   Richard Hughes <hughsient@gmail.com>
Date:   Wed, 8 Feb 2023 17:32:37 +0000
Message-ID: <CAD2FfiGLH87H6CVbHimXUfz7ESUKwO8k1ABCgKU9L2SnfGanTA@mail.gmail.com>
Subject: Re: Firmware upgrade broke SW_TABLET_MODE on HP Dragonfly G2
To:     Maxim Mikityanskiy <maxtram95@gmail.com>
Cc:     Jorge Lopez <jorge.lopez2@hp.com>, Alex Hung <alexhung@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <markgross@kernel.org>,
        platform-driver-x86@vger.kernel.org,
        Kai-Heng Feng <kai.heng.feng@canonical.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        =?UTF-8?B?QmFybmFiw6FzIFDFkWN6ZQ==?= <pobrn@protonmail.com>,
        Rishit Bansal <rishitbansal0@gmail.com>,
        Enver Balalic <balalic.enver@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 7 Feb 2023 at 14:18, Maxim Mikityanskiy <maxtram95@gmail.com> wrote:
> If Jorge (or anyone else on the
> mailing list) could give me some contact of a person responsible for
> firmware on LVFS or the proper way to file a bug report, I would highly
> appreciate it.

You can open an issue here:
https://github.com/fwupd/missing-firmware-hp/issues -- but for this
kind of thing I'm happy to demote builds out of the stable remote
myself as firmware updates should *never* intentionally break things.
Jorge, have you contacted the correct people or do you want me to
demote the firmware for you?

Richard
