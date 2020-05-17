Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BEECC1D67AD
	for <lists+platform-driver-x86@lfdr.de>; Sun, 17 May 2020 13:24:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727868AbgEQLYB (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 17 May 2020 07:24:01 -0400
Received: from mail.cock.li ([37.120.193.124]:58200 "EHLO mail.cock.li"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727858AbgEQLYB (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 17 May 2020 07:24:01 -0400
X-Greylist: delayed 368 seconds by postgrey-1.27 at vger.kernel.org; Sun, 17 May 2020 07:24:01 EDT
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=cock.li; s=mail;
        t=1589714271; bh=Ria4gfi4a5qFMR08fjDOHtAdwB0OmTEqv35lMVQNMm0=;
        h=Date:From:To:Subject:From;
        b=xHFCn1QwwX9WG39lpwYLOgFbgK1O1w9Zb2YTfTRqzVDxg8fcyNVFaIM/n+ES6zLrI
         6ZDODypL1uFD/8i9WN/ICED+PYgTpxB6zjIm6WU/avNPxZk51PyebiBvUWxoJ2xk/u
         n449lLZzhSAcwOoHUSYs8NbZUGo+Jan9Cfs5nCnmw2pj7kXm5hBH6n9gjWxmBpSnvt
         F/YXKODS6rhXZG+ppmfl5Jgp2bQHKCdfQM8ggCg/c/eTQ5DBJSpAG55pX1Bx0KMv4S
         eWA+UMkl4cugjFWpLY2T8vQXN4YMaJGA1sG6KgRhKKgbDYvD7voNcAxPOK5kqjK4kO
         dKb9oaisST8bg==
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Sun, 17 May 2020 13:17:47 +0200
From:   thestroyer@cock.li
To:     platform-driver-x86@vger.kernel.org
Subject: HP Zbook studio G5 Brightness and mic mute keys give same scancode
Message-ID: <d2753cb4ca4d0d819d5a76b0a076e281@cock.li>
X-Sender: thestroyer@cock.li
User-Agent: Roundcube Webmail/1.3.10
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,
On my HP Zbook studio G5 a few keys on my keyboard give the same 
scancodes. Most notably, the brightness and mute function keys all give 
the scan code sequence 0xe0 0x20 0xe0 0xa0 as reported by showkey 
--scancodes. It only produces a scancode when pressed, not when 
released. I found another very similar issue in this mailing list found 
in https://www.spinics.net/lists/platform-driver-x86/msg16791.html. The 
issue in that mail was solved by a bios update. I'm running the latest 
bios, but I still have the issue.
I tried the kernels: Manjaro 5.7rc4-1, Manjaro 5.6.11-1 and Manjaro 
5.4.39-1
I also tried a few other distributions, but they all have the same 
issue.
I'm happy to provide more information about this issue if needed.

Thanks,

Friso
