Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1CC1E250B6D
	for <lists+platform-driver-x86@lfdr.de>; Tue, 25 Aug 2020 00:10:36 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726664AbgHXWKf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 24 Aug 2020 18:10:35 -0400
Received: from ms.lwn.net ([45.79.88.28]:56776 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726365AbgHXWKf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 24 Aug 2020 18:10:35 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id AE9A460C;
        Mon, 24 Aug 2020 22:10:34 +0000 (UTC)
Date:   Mon, 24 Aug 2020 16:10:33 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        ibm-acpi-devel@lists.sourceforge.net,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Documentation: laptops: thinkpad-acpi: fix underline
 length build warning
Message-ID: <20200824161033.0448f327@lwn.net>
In-Reply-To: <7b2ecef9-dfb7-808a-7c05-4e4f44b363c4@infradead.org>
References: <7b2ecef9-dfb7-808a-7c05-4e4f44b363c4@infradead.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Sun, 23 Aug 2020 15:55:16 -0700
Randy Dunlap <rdunlap@infradead.org> wrote:

> From: Randy Dunlap <rdunlap@infradead.org>
> 
> Fix underline length build warning in thinkpad-acpi.rst documentation:
> 
> Documentation/admin-guide/laptops/thinkpad-acpi.rst:1437: WARNING: Title underline too short.
> DYTC Lapmode sensor
> ------------------
> 
> Fixes: acf7f4a59114 ("platform/x86: thinkpad_acpi: lap or desk mode interface")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Nitin Joshi <njoshi1@lenovo.com>
> Cc: Sugumaran <slacshiminar@lenovo.com>
> Cc: Bastien Nocera <bnocera@redhat.com>
> Cc: Mark Pearson <markpearson@lenovo.com>
> Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> Cc: Darren Hart <dvhart@infradead.org>
> Cc: Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
> Cc: ibm-acpi-devel@lists.sourceforge.net
> Cc: platform-driver-x86@vger.kernel.org
> ---
>  Documentation/admin-guide/laptops/thinkpad-acpi.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Applied, thanks.

jon
