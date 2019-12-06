Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 228FE1154D4
	for <lists+platform-driver-x86@lfdr.de>; Fri,  6 Dec 2019 17:05:37 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726287AbfLFQFg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 6 Dec 2019 11:05:36 -0500
Received: from mout.kundenserver.de ([212.227.126.133]:58395 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726258AbfLFQFg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 6 Dec 2019 11:05:36 -0500
Received: from [192.168.1.155] ([95.117.69.190]) by mrelayeu.kundenserver.de
 (mreue010 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MZkd5-1iHxoU3iSN-00Wour; Fri, 06 Dec 2019 17:05:29 +0100
Subject: Re: [PATCH V2 1/7] platform/x86: lg-laptop.c: Add module version and
 fix whitespace
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Matan Ziv-Av <matan@svgalib.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Andy Shevchenko <andy@infradead.org>
References: <cover.1575103866.git.matan@svgalib.org>
 <61c52c2146085859728f496388d886581b877c41.1575103866.git.matan@svgalib.org>
 <b65e75e2-1036-8a4e-f72b-a70c3a390e83@metux.net>
 <CAHp75VdoiFyg+n0e42i3zJigX_=EwmH-qZxXf8pQTS49P0k2MA@mail.gmail.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Message-ID: <6a260e8c-2de6-657c-c1ec-13b653f3d036@metux.net>
Date:   Fri, 6 Dec 2019 17:05:03 +0100
User-Agent: Mozilla/5.0 (X11; Linux i686 on x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdoiFyg+n0e42i3zJigX_=EwmH-qZxXf8pQTS49P0k2MA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: tl
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:/D1GdMGZpQi0DuFE5MNl3+coTu5v6WtOJHxHhlZVlCDIF5B52U0
 q/uJ5BzE5ZmvnN0GZiOZZH7B4Wx9MuiwjtlSSUMLUKjW1ZAOWksp7fIdKABOW+jaEp2q7xd
 cF5Mihp26+Y6M83jcWjWmAcgnioWIzGEJZCTMQQbIxJy5QDx+HXS1In7lu9Z8A8TklVGIzc
 WeT2ERHhtceWX2McV2rEQ==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:SGuG71GcfBU=:dG1yO5cXPFNY+Y57w92NXO
 fOz3l2ARh8iqCDk1TAMuffmEPBGPdYvxsIp7vxZkjBRhhEymG7A39IIxMUT+nZIDPSe7heIpb
 tvHyEGsXfmIG6mBjgdoaYkiSJFUj6w2JUnAqGYhQ3vmeI1H2UQbhcLRD8JaFoHdkm7Gh1nCbB
 PoI07CNtWi5TUj7SiSGOXtG2OzBe6sYXPaw8fznqiWJsx5rPXCmxOdhK9dleXuJ2FMPUpeuwG
 5DtczdhUZ0Db8gMB5DMo9oMmUH3hYEhJ5+X1KNgiNXG5FCuH7h1kxtWcIKD7I88aNcSMjYGOX
 /hIeHZFKgZKId5qerkw/VMq655c9RQzXLVU1M4lIQjXBxrJdsbFT09lcgGwRZXpym9AbNnQyf
 TMIqDuos/9p0Im0tU5V+52+ipxSWHrZQXUMssMtymyjV37OmlB4SLqJsh1dcSvm1AssY9SkDE
 2E2xj3FP7T+DVAueihbX4m9F2Bzn3/pJGvp/7pLjgXdjzMAI+3uwGh05WOKPd9chb0eFtkGwI
 R64HvvsoYiBTRToeMBf6aS9AtcTCH/2bdNT9LodN7vkzBmVKMvDThaLdrl6XynVN0mR3S14io
 qHioafvjsQxw4P05w2atFrHGhyGRdfSt8asT/4+zUXs3JX6fc3Cc4juTiuldYV5yo4sXF+YP8
 o39toGNjLlJQul1njyV8rST1csJNONFVj/1quE3Zfge2tjl9wF7+DjV+AZWFoQuSKYjMV/+01
 t0BBY/QXYfP55Vv4B4XtjBZWJHBgC7lm25JuS9rSecu4H8pdfZkTrWDxNmceH7c5leiOHFMbz
 zzb3OS7207gNsj14XT9tehWkCtQlFfxZa1T5+0KZefFQDlXuhPgHAZjHa1gTMFwYiZ5cxMcmZ
 cQaAbYQKbMncdKJJyaaw==
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 05.12.19 13:32, Andy Shevchenko wrote:

Hi,

>> Does MODULE_VERSION() really make sense ?
>> What's the exact semantics behind those version numbers (in relation to
>> kernel version) - when do they get increased ?
> 
> It makes no sense. The module version is equal to the kernel version
> (SHA ID in custom cases).

Maybe I've completely misunderstood the whole idea, but here we IMHO
declare a module version that's completely orthogonal to / independent
of the kernel version (whats seen in /proc/version). Some modules
have it, others don't. Pretty confusing to me :(


--mtx

-- 
Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/öffenen,
selbst wenn diese von vermeintlich vertrauenswürdigen Absendern zu
stammen scheinen. Andernfalls droht Totalschaden.
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
