Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E767D1B5FFB
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Apr 2020 17:55:42 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729072AbgDWPzm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Apr 2020 11:55:42 -0400
Received: from sonic309-13.consmr.mail.bf2.yahoo.com ([74.6.129.123]:42773
        "EHLO sonic309-13.consmr.mail.bf2.yahoo.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728865AbgDWPzl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Apr 2020 11:55:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s2048; t=1587657340; bh=96K1UucBEhFg2CABZvqKA7D2Zcoh2lxS41HjN/YfhXw=; h=Date:From:To:Cc:In-Reply-To:References:Subject:From:Subject; b=mZG3zrFrf3SlFseb6VPsyVTexkZRnJeIJAtmmmaJ2WGfS+yWk7e9UkXaycucbRbygKZ9j0ukUi5xMpqFpzJJWIFZ6S1icIwoWQ8vsj1PgZhXGkl2w5QMk8+bhO4qYrhg/Uk8CbQHjf8Frfze1z8ac1fnBRsp9M81xLGL2MpWAnvOKPSbUJIdkXUW2BKvvpOsz4NxM3wQTPZculo2k51FZrFmenYKa3yz2cm1TKAatPfsbDNSO3ULg0DkvIyVhaz+e8SYsGbWamBQ0OIVkQKHqhPiy2/T1XvkzTbNckuxJKizmQ1LZMuzUBax0gDvjK/VHmU11NJA0DWg7FVxHJRklA==
X-YMail-OSG: ADYA46wVM1lUmYbboRhS2oTsmy7wPHWJjDR7v7goKXysuPDTFSDvzEWQdco20aM
 X2QQj2jcdQcPk2Q0p_AP_D4hUYq1_Nz5KX.GUNo3Cd_HFVu2fM3E82PXmG4G8hNtSwT5vVxvtGYG
 I1LMYecMR3J6CYwuH26k7JzTsnK2NgBAsDROYZ2NSmbU6N4aliS6K1NB81rV0glhY3_lcQe7d2Ct
 .2y9SHAnW2DsjtWvP0Wm5vIG9VvvFs5mdN9MnvbN2hLj8lRPGJjPVN5Fh6DAWE9a35AzSgMLCHTM
 57XVfuM70LgB_b6e6UQL2GZH9pBRTFsKHHYzxO.B11r6rJ3MsdXH7FmbmwF.t7eOZ15cbyw2VQS.
 3O3hkIHlIS866DZ.xOf4D6quYepiEfytvq0kpfjD.Jk5SiZiLFwm6jQM3pN63Co0tT3_ds1RMz2n
 PyXxmrBZPBLeCYwnYJSXmpXA3sSVk2pB3KzF3ohz6cNqWJ6vMHUHrYsY31BVfaJ5H1Dw1s0.51Ur
 7cQwvymhhbOvB1kIQSLRKjYz9EWemJ0mXOoH2jkNExUgrJ6l5n3ghpGAXwxO0pYAru04IDEgm0yB
 FBgwA7voTzDISwFGBgopZXCIKGtTFi2zMYlRunIGdRvIQWtBIBIBP.fuaeK5Mc8ikShpAwS0yP48
 63wlK33KmHsvF_1w_6wIfnVbhMGw_QtCbzOfZ4EXseMi3svNut9DtQ.NbipChD8yE86BKqdWiq6C
 EoBxgkyXCwgSpDD91dV0TjCff4cd26W4vyR6yITbtu8b11EKkqpKDUQ5wpNTCA7l59CJNouTCuLC
 Jbx9KpGlM1t5r44d8epgVgx36Zy_MJdnZ4ep6YtZrAXvxioAfse3dzP9OSQf6ohD.p9RfxkrlpUB
 bgPsOitz2slcfXUJsPv0F5oPo9UmMuWTvj8zW_jUoTwnCf.bdl6FaEkRXnYy7edH7gCnL7D1DqXG
 U7a75Uwyob9kEVSbTxIP74IyS5vEaYyFZV2vFpp3u2LX9cNB7iIGeQumzMxE5XvnFE0AqFVgytLU
 YX5p.2yzRu.sLtKlaaBAdjU5EbfVxqp7_BpKP9kgNH4ANlO7ZjZofRCWZxuRGj4UH9.L.Uhg2mF5
 iegqSJ9umdyXHkQEP7aA0WAhMtxsXZKTZO3aWTNHiaZcnLQRs7fPSxQficfUQpfGcjmeulljyoWv
 rT4O1kYF3ixAr_QtKmPHsf4_W7.4KwW_7Gom8HzxO4T2r3DxzMzaE1o5UrlCQZBR4SV4XTUdbx.2
 zOHtLCeqfuwIyXpRTtfiuFvNGu2zCK0EjN6N.w3VCABWAa1cbKnhDLScG0EuUzI3hXcOLwpOWWcH
 GtBfJ10OHwws13y4F2n.7HsJcdQmlVtb76MkwMYfE1w--
Received: from sonic.gate.mail.ne1.yahoo.com by sonic309.consmr.mail.bf2.yahoo.com with HTTP; Thu, 23 Apr 2020 15:55:40 +0000
Date:   Thu, 23 Apr 2020 15:55:39 +0000 (UTC)
From:   "larsh@apache.org" <larsh@apache.org>
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Kevin Slagle <kjslag@gmail.com>,
        =?UTF-8?Q?Sebastian_D=C3=B6rner?= <bastidoerner@gmail.com>,
        Dario Messina <nanodario@gmail.com>,
        Alexander Kappner <agk@godking.net>,
        Marc Burkhardt <marc@osknowledge.org>,
        Stefan Assmann <sassmann@kpanic.de>
Cc:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
Message-ID: <448981066.251725.1587657339572@mail.yahoo.com>
In-Reply-To: <6d354a53-2de7-ba18-4d30-82f2cad207fa@kpanic.de>
References: <20200417201426.24033-1-larsh@apache.org> <CAHp75VexAMt3yM+p7HeXdyO51BfB5FOuoEjq9xTUi+tR-jj4JA@mail.gmail.com> <6d354a53-2de7-ba18-4d30-82f2cad207fa@kpanic.de>
Subject: Re: [PATCH v2] thinkpad_acpi: Add support for dual fan control on
 select models
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Mailer: WebService/1.1.15756 YMailNorrin Mozilla/5.0 (X11; Fedora; Linux x86_64; rv:75.0) Gecko/20100101 Firefox/75.0
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

I agree. Lemme amend the patch. I was confused about function of TPACPI_Q_L=
NV and TPACPI_Q_LNV3.


On Wednesday, April 22, 2020, 7:28:51 AM PDT, Stefan Assmann <sassmann@kpan=
ic.de> wrote:=20





On 22.04.20 15:50, Andy Shevchenko wrote:
> +Cc: people who lately involved in 2nd fan discussions here and there
>=20
> Lars, also one question regarding the code below.
>=20
> On Fri, Apr 17, 2020 at 11:15 PM Lars <larsh@apache.org> wrote:
>>
>> This patch allows controlling multiple fans as if they were a single fan=
.
>>
>> This adds P52, P72, X1E, and X1E gen2 to dual fan quirks. Both fans are =
controlled together.
>>
>> Tested on an X1 Extreme Gen2.
>>
>> The patch is defensive, it adds only specific supported machines, and fa=
lls back to the old behavior if both fans cannot be controlled.
>> However, it does attempt single fan control for all previously white-lis=
ted Thinkpads.
>>
>> Background:
>> I tested the BIOS default behavior on my X1E gen2 and both fans are alwa=
ys changed together.
>> So rather than adding controls for each fan, this controls both fans tog=
ether as the BIOS would do.
>>
>> This was inspired by a discussion on dual fan support for the thinkfan t=
ool (https://github.com/vmatare/thinkfan/issues/58).
>> (Thanks to Github users voidworker, and civic9.)
>>
>> The BIOS ids for P52/P72 and X1E are taken from there. The X1E gen2 id i=
s verified on my machine.
>>
>> (In the first version my mail client botched the white-spacing - my apol=
ogies, this is my first Kernel patch. Used git send-email and gmail this ti=
me.)
>>
>> Signed-off-by: Lars <larsh@apache.org>
>> ---
>>=C2=A0 drivers/platform/x86/thinkpad_acpi.c | 33 +++++++++++++++++++++++-=
----
>>=C2=A0 1 file changed, 27 insertions(+), 6 deletions(-)
>>
>> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86=
/thinkpad_acpi.c
>> index 8eaadbaf8ffa..cbc0e85d89d2 100644

[...]

>> @@ -8771,6 +8790,9 @@ static const struct tpacpi_quirk fan_quirk_table[]=
 __initconst =3D {
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_IBM('7', '0', TPACPI_FAN_Q1),
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_QEC_LNV('7', 'M', TPACPI_FAN_2FAN),
>>=C2=A0 =C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV('N', '1', TPACPI_FAN_2FAN),
>> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'C', TPACPI_FAN_2FAN),=C2=
=A0 /* P52 / P72 */
>> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'E', TPACPI_FAN_2FAN),=C2=
=A0 /* X1 Extreme (1st gen) */
>> +=C2=A0 =C2=A0 =C2=A0 TPACPI_Q_LNV3('N', '2', 'O', TPACPI_FAN_2FAN),=C2=
=A0 /* X1 Extreme (2nd gen) */

Please add
TPACPI_Q_LNV3('N', '1', 'E', TPACPI_FAN_2FAN), /* P50 */
for the P50 in the next revision. I've tested the P50 today.

Thanks!


=C2=A0 Stefan

