Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4C28524F60
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 May 2019 14:56:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728190AbfEUM4j (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 May 2019 08:56:39 -0400
Received: from ampleforth.srv.alexanderweb.de ([37.187.38.226]:53584 "EHLO
        ampleforth.srv.alexanderweb.de" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726692AbfEUM4j (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 May 2019 08:56:39 -0400
Received: from aftr-37-201-227-26.unity-media.net ([37.201.227.26] helo=[192.168.1.16])
        by ampleforth.srv.alexanderweb.de with esmtpsa (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.89)
        (envelope-from <alex@alexanderweb.de>)
        id 1hT4Jn-0005i6-RP; Tue, 21 May 2019 14:56:35 +0200
Subject: Re: [PATCH] Add Lenovo PrivacyGuard feature found in T480s, T490,
 T490s
To:     Andy Shevchenko <andy@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>
References: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net>
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
From:   Alexander Schremmer <alex@alexanderweb.de>
X-Tagtoolbar-Keys: D20190521145634718
Openpgp: preference=signencrypt
Autocrypt: addr=alex@alexanderweb.de; prefer-encrypt=mutual; keydata=
 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 HPY=
Message-ID: <3756fda2-7270-e3b2-fac8-3c0c0be633fa@alexanderweb.de>
Date:   Tue, 21 May 2019 14:56:35 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <E1hSOxT-00005q-An@tuxpaddy.alexanderweb.homeip.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-GB
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I wonder whether you have received my kernel patch, referenced below. It
might have been caught by the spam filter.

Best,
Alex

I wrote on 2019-05-19 at 18:46:
> From 6bfe30cae2be3f4fbe9f9990a4e83302569ff7e9 Mon Sep 17 00:00:00 2001
> From: Alexander Schremmer <alex@alexanderweb.de>
> Date: Sun, 19 May 2019 18:13:05 +0200
> Subject: [PATCH] platform/x86: Add Lenovo ThinkPad PrivacyGuard.
>
> This feature is found optionally in T480s, T490, T490s.
>
> The feature is called lcdshadow and visible via
> /proc/acpi/ibm/lcdshadow.
>
> The ACPI methods \_SB.PCI0.LPCB.EC.HKEY.{GSSS,SSSS,TSSS,CSSS} are
> available in these machines. They get, set, toggle or change the state
> apparently.
>
> The patch was tested on a 5.0 series kernel on a T480s.
>
> Signed-off-by: Alexander Schremmer <alex@alexanderweb.de>
> ---
[...]
