Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E51B169AC0B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 14:01:16 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229445AbjBQNBP (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 08:01:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60588 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229960AbjBQNBP (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 08:01:15 -0500
X-Greylist: delayed 1722 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 17 Feb 2023 05:01:05 PST
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3896867822
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 05:01:05 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1N62mG-1oVcK80zvs-016OIC; Fri, 17 Feb 2023 14:00:40 +0100
Message-ID: <9eca5063-1f71-e114-9ac1-d508d3e1ef95@metux.net>
Date:   Fri, 17 Feb 2023 14:00:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH v4 1/2] x86: Support APU5 & APU6 in PCEngines platform
 driver
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Philip Prindeville <philipp@redfish-solutions.com>,
        platform-driver-x86@vger.kernel.org,
        "Enrico Weigelt, metux IT consult" <info@metux.net>
Cc:     Ed Wildgoose <lists@wildgooses.com>,
        Andres Salomon <dilinger@queued.net>,
        Andreas Eberlein <foodeas@aeberlein.de>,
        Paul Spooren <paul@spooren.de>
References: <20230113231139.436956-1-philipp@redfish-solutions.com>
 <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <00b4cd69-14ce-ce1f-2bec-83ecbb928cbc@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:y73Gscj8UBYI0JcLRaLb2cu3I3ESK85LVceZDBnM2l936rIbT7U
 I3DWBVxmcpuQumF1QO6fZqoQFmdyE6uMEa5UFWNan65BwBMqU+ivqAIpJTrCI/4H+YylK30
 X/zk05gorqj1wL5iYixugnwfSxB0PSPDufG9hoUwLGQEl226a2Gptiz3TIaXXdbtaMEhKL8
 BG5ydwvx1dKKEN3ymv5fA==
UI-OutboundReport: notjunk:1;M01:P0:XTBlfJk3tP0=;PoHetlHdeF2pFj5tIV4oLSxy4oO
 PSBOXiWQ63tVhi2ZIp0bg+XaAIHOCIph9STIKSziE8kC8xzV0ViHbJpTIi8OKlb8GaB//zdGO
 lftzDk/w/eIqewLSQb/Xil2Clt8YkLXWYNnmyUGHzrtupWQFINFC3lTaJ4/A8Wh+NqFxVGp8B
 1cEoEGBf0a439GMdA6jOz8DTQ8WOP1ZDssxp+xn75gznmDkXXr3/dL8pe+FxT1b/UTocxN5JY
 ZcIz+Y44cc7TOAMPC8AjZO8h7QKhg71J42ia2RDP6PqeFX5Ogxk1UaSTwGCRq7H18H1QE6b5x
 cJvmtlgaDQlGQ11Jz/Odt86iDv7NXBEsC/7HbA4w1Y5LGJ75Mt1UnHd7ZJqW+fypt1SMdr1X+
 0tSS8YyrecYeXHrZjCsXo+cwDbcXtWCg+z9O5emsuQWm3gvsY+1Xu2SNMPpF1Y94vYv5GhPAN
 jCelORIjGD8lYK+yzPMMA2l9BkmlhrJrxo3UR1Z2W23SXYBFy6iw1r3o5pxYMiR8upAFTqyTN
 95kljbeO9yKLEfMikBm6CB9eEEIvvD5Me0LNb/J9ieiVsz3TOXhCX+oVtIUfecTxR8ZYPQg2J
 zFAHk8G7jrmOISMDrC6hjz2XS8spwssGqg36OoBmcgMXZb53DgcE+7iVD5Ug9JVH4K1lVMwbX
 i0MriGeg5H05ZgVjT7/v34o7Ir7RaAlG8K2o5KnLBQ==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 19.01.23 11:22, Hans de Goede wrote:

Hi,

> I'm not entirely sure how these GPIOs are supposed to be
> consumed / used by userspace. But since they are not used
> directly in this driver I assume userspace is supposed to
> use either the (deprecated) sysfs GPIO API or the new ioctl
> based GPIO API to toggle say "simswap" if it needs to.

Exactly. There are existing applications relying on this in the field
(remote places). And the whole purpose of this here is letting the
device reset it's baseband in case of errors, so there's no need to send
specialized technicans by helicopter when the baseband is bitchy again.

> I guess that means adding a new apu6_gpio_names[]
> array for APU6, that is fine.

Yes, if the gpio configuration is different, then there has to be an
own array for that. KISS.

> Note you can still do the "MPCIE2" -> "RESETM1" defines
> if you want, to allow reusing the defines and the apu2_gpio_regs[]
> array. But in order to not brake uAPI you must:
> 
> 1. Not change the order of the pins
> 2. Keep the "mpcie2_reset" and "mpcie3_reset" names for the
>     already supported models.

Correct. But then I wonder about the practical purpose of renaming
the defines, which then become inconsistent with the names.

> Also can you please split this patch into 2 patches,
> 1 adding the APU5 support and one adding the APU6 support
> (not necessarily in that order) ?

ACK.


--mtx

-- 
---
Hinweis: unverschlüsselte E-Mails können leicht abgehört und manipuliert
werden ! Für eine vertrauliche Kommunikation senden Sie bitte ihren
GPG/PGP-Schlüssel zu.
---
Enrico Weigelt, metux IT consult
Free software and Linux embedded engineering
info@metux.net -- +49-151-27565287
