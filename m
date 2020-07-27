Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id CC52522F8FE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 21:25:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbgG0TZf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 15:25:35 -0400
Received: from mail-40132.protonmail.ch ([185.70.40.132]:60097 "EHLO
        mail-40132.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbgG0TZe (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 15:25:34 -0400
Date:   Mon, 27 Jul 2020 19:25:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1595877932;
        bh=y/19vzX6pRw8sJmC4rXY3Net5Q5+JBql9xzGN2P3Uek=;
        h=Date:To:From:Cc:Reply-To:Subject:In-Reply-To:References:From;
        b=O7ht8kuNgmRS7GYCMhdboFyZBOnEw7+9K2UhdQbLefNyZlobyWIy2vP9Rm6fgefwe
         qjGS/Eo0RdKgzuRN2eg9JZ+kqkGx8R1KRYWApiePJhGb82fc5dBBlto2wBTU2pCVhD
         xyVsy80OxJXchBBmEvUbchSjTxZlDVQxdQkGcbwY=
To:     =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: Re: [PATCH v2] docs/admin-guide/thinkpad-acpi: add section for battery charge control
Message-ID: <CCrM5p9SZlXPCk_r31tHprp_8y24qZt1904fvjtG-2zQBSPAFOoca8GcY8pHa6m8bLTiKX3_3p1JDGtmipxd14dkW-XOsDEOifpWPYzMaEU=@protonmail.com>
In-Reply-To: <QMrVZuZNCFAbIPTNcpoa_mYs--kCZx_hjTGXsA6WY4xPnBNVPCIAXnIL3cbphM8nyueZR9TEmqwrGJunSuZ2p0zpG7GvLnbF14hV6vIDqwc=@protonmail.com>
References: <QMrVZuZNCFAbIPTNcpoa_mYs--kCZx_hjTGXsA6WY4xPnBNVPCIAXnIL3cbphM8nyueZR9TEmqwrGJunSuZ2p0zpG7GvLnbF14hV6vIDqwc=@protonmail.com>
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

Please ignore v2 of the patch.


