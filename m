Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B5D9F5FAB3
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Jul 2019 17:12:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbfGDPMz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Jul 2019 11:12:55 -0400
Received: from fallback17.m.smailru.net ([94.100.176.130]:42980 "EHLO
        fallback17.mail.ru" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726822AbfGDPMz (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Jul 2019 11:12:55 -0400
X-Greylist: delayed 3785 seconds by postgrey-1.27 at vger.kernel.org; Thu, 04 Jul 2019 11:12:53 EDT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Zpu76KlxHVuzu8qNevrDIIFdTusvisYj9/Uanm5uUzo=;
        b=rop3PmBhs5lhNmlsBlWYCtSgkcVkJZWiy5mvWsgOhkKH6e0/oesKAnkAgci+35beCPUbnKzXAACJs2UjDWG9YtuZWkC74GO5LD2qLe8obGL4r+TyqhyEv9e/3jvuHs0XGQDns/mqpv69wYk0r6BO0lDcM7G/PIAQ2wNOt8VeryE=;
Received: from [10.161.76.74] (port=34036 helo=smtp15.mail.ru)
        by fallback17.m.smailru.net with esmtp (envelope-from <Nemcev_Aleksey@inbox.ru>)
        id 1hj2Qn-0000dw-1y
        for platform-driver-x86@vger.kernel.org; Thu, 04 Jul 2019 17:09:49 +0300
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=inbox.ru; s=mail;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject; bh=Zpu76KlxHVuzu8qNevrDIIFdTusvisYj9/Uanm5uUzo=;
        b=rop3PmBhs5lhNmlsBlWYCtSgkcVkJZWiy5mvWsgOhkKH6e0/oesKAnkAgci+35beCPUbnKzXAACJs2UjDWG9YtuZWkC74GO5LD2qLe8obGL4r+TyqhyEv9e/3jvuHs0XGQDns/mqpv69wYk0r6BO0lDcM7G/PIAQ2wNOt8VeryE=;
Received: by smtp15.mail.ru with esmtpa (envelope-from <Nemcev_Aleksey@inbox.ru>)
        id 1hj2Qk-0002Yd-TT; Thu, 04 Jul 2019 17:09:47 +0300
Subject: Re: [PATCH 2/4] platform/x86: asus-nb-wmi: Add Asus FX705GE support
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190703154102.20002-1-Nemcev_Aleksey@inbox.ru>
 <20190703154102.20002-2-Nemcev_Aleksey@inbox.ru>
 <CAHp75Ve5N0uxrxMydB-kcWv=ZRhsBFmmENc4PNPPJZqwusYP6A@mail.gmail.com>
From:   Nemcev Aleksey <Nemcev_Aleksey@inbox.ru>
Message-ID: <9f5ace8d-ccc3-743b-044d-eedc7de1b05e@inbox.ru>
Date:   Thu, 4 Jul 2019 17:09:41 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.1
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve5N0uxrxMydB-kcWv=ZRhsBFmmENc4PNPPJZqwusYP6A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-77F55803: 689590B63E0A4B015A78504BD2AC294157156E7B421BD16D1A56418E564169F3B63D8C04866B842A5AA271CADB3EEE39
X-7FA49CB5: 0D63561A33F958A5986496218D4DDD5EC3BBAE40F652C7CC9F0320BA4015CF128941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC8364767815B9869FA544D8D32BA5DBAC0009BE9E8FC8737B5C2249E232F00D8D26902CD81D268191BDAD3DBD4B6F7A4D31EC0B5563AC4C43EF3CD7090A508E0FED6299176DF2183F8FC7C0098B145E00970258B3661434B16C20AC93541453170D46FCAAAE862A0553A39223F8577A6DFFEA7C8BE15277C371E98A70A8B1E6A6F1CAC3EFF80C71ABB335746BA297DBC24807EA27F269C8F02392CDBB05166615B404773C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-Mailru-Sender: 00097D31F91C944B9B30D0F7E40C4ACF1A754CDF123C2419B5BC41EA791E3C737374B0F4E741CE9C34915EAF49CC4078BE96CC90913223B28141B1B0B1FAE8F2B1D210AF280BDE3A90E1A63FA06EF59E02DB81B281332CC1AE208404248635DF
X-Mras: OK
X-77F55803: 6AF0DA0BABFA9FDB7F9F52485CB584D7271FD7DF62800FDC3BE1934B8127AE29E8D1A4712F6C4DEAFB98CFCDF21EEF7118BE3B92EB1A08D1
X-7FA49CB5: 0D63561A33F958A50424EE58F2DB6859F5BDB75F08115FA1C6760889C11D398B8941B15DA834481FA18204E546F3947C1D471462564A2E19F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8B2EE5AD8F952D28FBA471835C12D1D977C4224003CC836476C0CAF46E325F83A50BF2EBBBDD9D6B0F2EF91E2201DEA5EC574AF45C6390F7469DAA53EE0834AAEE
X-Mailru-Sender: A5480F10D64C9005690A5AAFAD0F9BCB9017C3EC2B030FFEE8D1A4712F6C4DEA490970484213A17C937B03147C9FB1C7DDBB79867CC2C1EC8FBF9CDAF219B22883CE97D6EC8C31C50E14EF3F621F2B87EAB4BC95F72C04283CDA0F3B3F5B9367
X-Mras: OK
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thank You for reply, I will split this patch.
Should I then resend whole patch set, or only resulting two patches?
I'm not very familiar with this process yet.

04.07.2019 16:47, Andy Shevchenko wrote:
> On Wed, Jul 3, 2019 at 6:41 PM <Nemcev_Aleksey@inbox.ru> wrote:
>> From: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
>>
>> This model has an AURA RGB backlight,
>> so wmi_needs_3_args quirk is required
> Thanks for the patch.
> Though it does two logical things, i.e. new module support and new key bindings.
> Please, split it to two changes and justify key bindings.
>
> P.S. To all your patches, please use punctuation, like period at the
> end of sentences and so on.
>
>> Signed-off-by: Aleksey Nemcev <Nemcev_Aleksey@inbox.ru>
>> ---
>>   drivers/platform/x86/asus-nb-wmi.c | 12 ++++++++++++
>>   1 file changed, 12 insertions(+)
>>
>> diff --git a/drivers/platform/x86/asus-nb-wmi.c b/drivers/platform/x86/asus-nb-wmi.c
>> index 4bed95357a32..bf937321f42e 100644
>> --- a/drivers/platform/x86/asus-nb-wmi.c
>> +++ b/drivers/platform/x86/asus-nb-wmi.c
>> @@ -406,6 +406,16 @@ static const struct dmi_system_id asus_quirks[] = {
>>                  },
>>                  .driver_data = &quirk_asus_forceals,
>>          },
>> +       {
>> +               .callback = dmi_matched,
>> +               .ident = "ASUSTeK COMPUTER INC. FX705GE",
>> +               .matches = {
>> +                       DMI_MATCH(DMI_SYS_VENDOR, "ASUSTeK COMPUTER INC."),
>> +                       DMI_MATCH(DMI_PRODUCT_NAME,
>> +                                 "TUF Gaming FX705GE_FX705GE"),
>> +               },
>> +               .driver_data = &quirk_asus_wmi_needs_3_args,
>> +       },
>>          {},
>>   };
>>
>> @@ -441,6 +451,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>          { KE_KEY, 0x30, { KEY_VOLUMEUP } },
>>          { KE_KEY, 0x31, { KEY_VOLUMEDOWN } },
>>          { KE_KEY, 0x32, { KEY_MUTE } },
>> +       { KE_KEY, 0x33, { KEY_BRIGHTNESS_MIN } },
>>          { KE_KEY, 0x35, { KEY_SCREENLOCK } },
>>          { KE_KEY, 0x40, { KEY_PREVIOUSSONG } },
>>          { KE_KEY, 0x41, { KEY_NEXTSONG } },
>> @@ -467,6 +478,7 @@ static const struct key_entry asus_nb_wmi_keymap[] = {
>>          { KE_KEY, 0x6B, { KEY_TOUCHPAD_TOGGLE } },
>>          { KE_IGNORE, 0x6E, },  /* Low Battery notification */
>>          { KE_KEY, 0x7a, { KEY_ALS_TOGGLE } }, /* Ambient Light Sensor Toggle */
>> +       { KE_KEY, 0x7C, { KEY_MICMUTE } },
>>          { KE_KEY, 0x7D, { KEY_BLUETOOTH } }, /* Bluetooth Enable */
>>          { KE_KEY, 0x7E, { KEY_BLUETOOTH } }, /* Bluetooth Disable */
>>          { KE_KEY, 0x82, { KEY_CAMERA } },
>> --
>> 2.20.1
>>
>

