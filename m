Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4F61E112978
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 Dec 2019 11:46:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727445AbfLDKqC (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 4 Dec 2019 05:46:02 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:41995 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727331AbfLDKqC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 Dec 2019 05:46:02 -0500
Received: from [192.168.1.155] ([77.9.37.28]) by mrelayeu.kundenserver.de
 (mreue106 [212.227.15.183]) with ESMTPSA (Nemesis) id
 1M2OIy-1iczKn3h1y-003yzC; Wed, 04 Dec 2019 11:45:56 +0100
Subject: Re: [PATCH V2 1/7] platform/x86: lg-laptop.c: Add module version and
 fix whitespace
To:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
References: <cover.1575103866.git.matan@svgalib.org>
 <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <b65e75e2-1036-8a4e-f72b-a70c3a390e83@metux.net>
Date:   Wed, 4 Dec 2019 11:45:27 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:cz7iI9ILsBicTSi12C195SLT90dFmcJSNzCdR+MH2MIJ8X6vd9W
 qo1fgqu6qDVrgdV48F1R7yUag+uuHcvQ8202i2F5Jzkg/EflRAOzTiKrSxD2uMJPZTm09tk
 iDuWhMmPkuUEv1/vtNveU5Zr722EdL8tDwi4GbclJmrBOVy2qU0hgRDmvC0M1lCaKPXScee
 nDgME8KIDQWPFHTmBcKPw==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:HLjaDoZzl4E=:ECp7g772km6ZnzB4NEHeH4
 lnv5jl6DtAO2Mih+RGokRJolcFq9qF9lPlGv9GwjFh+aSeUt+qv5baFQH1qR01jdyJSCo5eF6
 rTZZ109KxMN1WrlH4tQXHVP2emMyUX8RhuBKFGekobhVPbWMxcLsySpb5qccUNyhRfrPx82TD
 qH81vVjwbXXs1LKZheOqTby8WthpazdDY89TbcZgOLtoENMX/GOvIOywFw0J3Gw4saY5OEHJH
 S8bgLuevRnUBISTa3g6Bd8aAy/lOu5rsLPKGVjWLeRz9mfu+VS0mxLWOm0yhfOSTl8r+r67oh
 MHZZKqC3jGBqWAJWg4xdcvwTceDmqH7D/ZbQlyTyZKlNBIByiLM0hJP/bRcIXK9xauELCGso1
 QuAh/c4pFtr+7wmF7PV2xih9CjO2kSFXh0iET+1A2Z0vfIiBa5olj5NLF1Aa0jZUoW4+rKs7p
 ZJLPoMT+l8mhVyXdMJMb8/4TDPJ8UJ+W4udeSgbmc10YMPQNyaqa2xrDn6dPWH5Hn879R3xOk
 hNlzgDMY3Gv5UupLXocV9oAdTTLFq1UgjLOO3ILclcKXbkGqUjK+WjBSA/1v8P9est7XaTe2e
 iKIL8kxp4cRFMhGEymd9njlpVTr++1h61S5UuTXaWeWBWwpS5Rz4qb/LrmUkjXaHs1TU+4lnM
 1UMfMfOiICVXjEeD+LS8tD3h+hkjhXig/AGGc9SfojOlS5Xckml0UCg3PMVvRWT1qiX4dH6XR
 ckuZnRqV8mNozc4hrf3criif+q37zKXjaMpojXnQL8BeXoyqANUIjpEEycjf4gmvlCQz7GjiF
 9F4wYTEf+nLI1QUnS3QPOtv3PMpmtGWh6qxa+EvZOLGzxkJJ3dBvws9MJIsnsFUJy3w7Udvaw
 HacXfhgKvSXMnMmApgUw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 30.11.19 09:40, Matan Ziv-Av wrote:
> Add module version and fix a small whitespace discrepancy.
> 
> Signed-off-by: Matan Ziv-Av <matan@svgalib.org>
> ---
>  drivers/platform/x86/lg-laptop.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/lg-laptop.c b/drivers/platform/x86/lg-laptop.c
> index c0bb1f864dfe..78d3e3d2e51a 100644
> --- a/drivers/platform/x86/lg-laptop.c
> +++ b/drivers/platform/x86/lg-laptop.c
> @@ -26,6 +26,7 @@
>  MODULE_AUTHOR("Matan Ziv-Av");
>  MODULE_DESCRIPTION("LG WMI Hotkey Driver");
>  MODULE_LICENSE("GPL");
> +MODULE_VERSION("1.1");

Does MODULE_VERSION() really make sense ?
What's the exact semantics behind those version numbers (in relation to
kernel version) - when do they get increased ?


--mtx

---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
