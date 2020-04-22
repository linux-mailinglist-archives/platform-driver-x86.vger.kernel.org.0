Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E4C941B4752
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Apr 2020 16:28:49 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726419AbgDVO2q (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Apr 2020 10:28:46 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:47409 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726080AbgDVO2q (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Apr 2020 10:28:46 -0400
Received: from [192.168.0.7] ([217.83.103.112]) by mrelayeu.kundenserver.de
 (mreue011 [212.227.15.167]) with ESMTPSA (Nemesis) id
 1MaInF-1jfmWZ1UCT-00WBYo; Wed, 22 Apr 2020 16:28:14 +0200
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual fan control on
 select models
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Lars <larsh@apache.org>, Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=c3=b6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20200417201426.24033-1-larsh@apache.org>
 <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
From:   Stefan Assmann <sassmann@kpanic.de>
Message-ID: <6d354a53-2de7-ba18-4d30-82f2cad207fa@kpanic.de>
Date:   Wed, 22 Apr 2020 16:28:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: de-DE
Content-Transfer-Encoding: 7bit
X-Provags-ID: V03:K1:VaJsuFN0wN96S1n42CsPDqgkV98nVOl6F+wppLaA+O6pv5ojkWf
 GbpuD7dQhidxomPqG/xdZkveBm6TX/vnzvmrFDeIGH5Z2qUlyrXA6rV1bTOP5AMmjcyvk3k
 MjY4/y5xqYhAZDXCjMPEn8kwecWf7qY/qPIyDelrMSj92/x5NhqvXW2vOQ/LEmjYCh8VACs
 FlwlXI+U+ur1m4KzD9rsg==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:2XYEMDeTGRU=:Ve2SPvfx1CZ7oqx+4U2T3P
 kEZuqTCAgi5hMViPwo2ac3rGYJd+qkp5BrGM4sdQSjZ84Q9hKPGOOwydHA/97/YB1M+8SIYdC
 MLIZSexNZFerkZ66iWt9bHLQ8qD2Ni1NGmGZ2S4iSqsffKJIAwXCCUX6N670/F8zwFCCxzD+e
 dza5AJI7Ib2CwjKCdd05D9XgzqFwRUUzhRHW/TPgshzshjnC0S03uXAtsw2UDgmPwChcWHKRP
 tL9tfLX04KYOfPxD/N7YERR+vbm+Z1LU0VReydcO5yTmfamF1QeWmIwSiVeg450ECTvn1cQlB
 VAdA1gsHEljLM+QBEMjMsEqEKRxYLdhqK12seks30XgQjFxEPh89PH1gipPU8kF7+rSFQdAeE
 fQ+L3eSBUU/59l28WZ+CBlL6QKuxbK0ll9FC2ToMhaoQjeoP9FB9TdiVsL+xbCGoYxv4gfGp1
 DK8/Ql1NKXmTdWhyHbke2bm2KwbllxuR2Rt8iAxaaCgP7Q7y6L9xadqQn2xTcH+1rTQogTvfH
 McSRuAHtuhFMl2ozwaDxmjKzm1UJDpyRMETzAnjcapVYeDUeDjn7Fkim83nqkiU0nyQsiH0Dt
 /ztsN+2R/SRi0WRXky+Ob/Cjjiw0j65CtqHwuKyCk4qRoJY6JFOfiAyEVuKnIFwHJyPXvnZ++
 wXDmOBmm5H36rjfhyXko7EdoOK+yS4JNcRNXsjvPTCHjPKC/aVsBvRjfDgdJHoFoq8c5SMbZi
 waMGnf8W+vN5nzlqExsSuhhfbODYYtM62accHVccUbzLRk2OKUHowPqcEVuHwGLdzoB9wHsxR
 f3+vxsz2XNt/gPdzbxYjNTu3htbBhtu7drIQT1jImi3J25UX0/vwsKyB4U7SIp1VNPgvOmj
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 22.04.20 15:50, Andy Shevchenko wrote:
> +Cc: people who lately involved in 2nd fan discussions here and there
> 
> Lars, also one question regarding the code below.
> 
> On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh@apache.org> wrote:
>>
>> This patch allows controlling multiple fans as if they were a single fan.
>>
>> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are controlled together.
>>
>> Tested on an X1 Extreme Gen2.
>>
>> The patch is defensive, it adds only specific supported machines, and falls back to the old behavior if both fans cannot be controlled.
>> However, it does attempt single fan control for all previously white-listed Thinkpads.
>>
>> Background:
>> I tested the BIOS default behavior on my X1E gen2 and both fans are always changed together.
>> So rather than adding controls for each fan, this controls both fans together as the BIOS would do.
>>
>> This was inspired by a discussion on dual fan support for the thinkfan tool (https://github.com/vmatare/thinkfan/issues/58).
>> (Thanks to Github users voidworker, and civic9.)
>>
>> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id is verified on my machine.
>>
>> (In the first version my mail client botched the white-spacing - my apologies, this is my first Kernel patch. Used git send-email and gmail this time.)
>>
>> Signed-off-by: Lars <larsh@apache.org>
>> ---
>>  drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++-----
>>  1 file changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
>> index 8eaadbaf8ffa..cbc0e85d89d2 100644

[...]

>> @@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[] __initconst = {
>>         TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>>         TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>>         TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
>> +       TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),  /* P52 / P72 */
>> +       TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),  /* X1 Extreme (1st gen) */
>> +       TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),  /* X1 Extreme (2nd gen) */

Please add
TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2FAN), /* P50 */
for the P50 in the next revision. I've tested the P50 today.
Thanks!

  Stefan
