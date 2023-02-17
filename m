Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 76A2169B3EA
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Feb 2023 21:28:04 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229530AbjBQU2D (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Feb 2023 15:28:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56358 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjBQU2C (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Feb 2023 15:28:02 -0500
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 85DA325951
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Feb 2023 12:28:00 -0800 (PST)
Received: from [192.168.1.155] ([95.114.119.171]) by mrelayeu.kundenserver.de
 (mreue012 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MVrXh-1p1FBp311x-00RoqG; Fri, 17 Feb 2023 21:27:48 +0100
Message-ID: <0126d03d-893d-3df4-67d8-586c73426f36@metux.net>
Date:   Fri, 17 Feb 2023 21:27:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.0
Subject: Re: [PATCH V3 1/1] platform/x86: Add BIOS Dynamic SAR driver for
 Intel M.2 Modem
Content-Language: tl
To:     Hans de Goede <hdegoede@redhat.com>,
        Shravan S <s.shravan@intel.com>, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
References: <20210602050149.6230-1-s.shravan@intel.com>
 <20210602050149.6230-2-s.shravan@intel.com>
 <76868eb4-02c4-93dc-8cb7-2257be8ade8d@redhat.com>
From:   "Enrico Weigelt, metux IT consult" <lkml@metux.net>
In-Reply-To: <76868eb4-02c4-93dc-8cb7-2257be8ade8d@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:bLffOk+OoSnHU5o3Zx8fmNb/FFbZjjXuriOA5W8cv3+YJFLqZdc
 CAM5FfC53Xcp77Z7k8FL0e5Gzf86ZP74hDyNI/S8Buy/XA4kHu/VCGeGIS1FKijeRiAfWGj
 e3qo/fMzbmblcf/8elTQChb/AbTCOCrHyp/NdQs/IpUfn8wCTyIoNzT9MQLoTewtIOAZCOt
 kqJeQ1zx25hmVQZTctQ2A==
UI-OutboundReport: notjunk:1;M01:P0:nYzgqtMIRFY=;TptMlNmtbOBWxHM7qsD6xUnXm+S
 3mZULzVRavfQO2L2nuTAdUDFigpNsCVRdg/yZcA7z5lHfrZnCaawSii4K/y1OlmqljuzJHNFq
 ikN5GSohtYULout4y32W4i9UC1qmJK26bLXbezJ3O5Uasphlt+n54Z5g1Acj5JSh8NacgLu3U
 dsi2bc98KYwFjhw0+qdH94koW0cbHJQQ1/y7hSi//BKQsGk8OlVV5IedOFy24bAe7moWWaJ5h
 fzuxiArsBdPDWI2Fgirdlr9U7GujGRug+roer/lAsJVQbu+aGEtOt0uyN15b+3XTJoKoEEDmm
 4LPWt3OGtUn84WojM0dL80h7e/Zfbn2ff6XMxR+xEFhq5fxF+Rw/Add5JMnyx1BWdpt/M6jmu
 gNzCyUsMBDrcZQbrfpedNgXR429d2E80PrcdA4on1mupV7hxXr65cAwhaXaUeqGk/wLobP5eW
 bvN519M55HdHsk1NbfzLrBjxDjO0pWTsBNoDledDYkzzN8YSYB7grewgsqN2aQGVPehJJnxyz
 Px15x9/42ZuSudQdTN8ezy7BCVug2kednaWY6R2GiVVe7CKI3HSGHSX7KpQytNv78grm15u0L
 qW93XnOSAEsU5ynyq3FGC7yT24TqycryyMkh+NyriW3Heqhbw95M1bNU8HHVlfDo60+rwal+U
 SCTSPfAR1PLdKvvfgCYpVzDV7r8GfF4hYO57DlfJ9g==
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 02.08.21 10:59, Hans de Goede wrote:

<snip>

> The driver itself does not limit the tx strength, it only provides information
> which is used by other software to determine the max safe tx strength, please
> update the description to reflect this.

Also missing specification of the actual meaning of this data, and how
to calculate max safe tx from that.

I hightly doubt we want proprietary / largely undocumented userland
abi's in the kernel. The general rule for userland abi is that once
introduced, shouldn't get any breaking changes, and should be applicable
to all devices of the same class (independent from hw vendor/model)


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
