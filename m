Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 84C045EC61B
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Sep 2022 16:30:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232521AbiI0Oag (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 27 Sep 2022 10:30:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230202AbiI0OaL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Sep 2022 10:30:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03A479E10E
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:30:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1664289001;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=3uRuuRVYQPLT+MslzRnqQghQMFwXG1xwpNvF+0tAnoc=;
        b=Z078ygnMSFTpAPqS4F5UksFfVb4k0/tQraKludtZijDQrN4dXg303IPJXYLZW/P4xV1ROm
        gNj0PzyGpWjBbXCPXB4IvrO4rLZMX+zhPEnS9/ROTmiT7GAHrN7dVLrYmQOz+d7Fc//Tz+
        CLoYGiIWm3HzPQ+Fw2zjleGjF2YRXI4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-134-UH3Fv9I1PbC2qOtVburF6A-1; Tue, 27 Sep 2022 10:29:59 -0400
X-MC-Unique: UH3Fv9I1PbC2qOtVburF6A-1
Received: by mail-ej1-f70.google.com with SMTP id sb34-20020a1709076da200b00783a5f786easo2853193ejc.22
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Sep 2022 07:29:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=3uRuuRVYQPLT+MslzRnqQghQMFwXG1xwpNvF+0tAnoc=;
        b=ysnSF1JFBB+7zxsG1YqmjnG2EzWOlC5rYrgYpb5iovuCqFPbaexDpfOHx3yoDdra1h
         O4j29UZtsEP6dtIRxNSqbLx/rnzTr3eOJ+8ka2fjJCJX7b9cyRk4xCdfz3/DLm7g5Vna
         flFsoiCJnwBcTYYuWAJJjlUNN0GraiCitfYC2R07bZKgXI1ji928fJnml1uVLm+W6/6K
         F1gFhpJ8MbUlwBTOIggoHQJEOj358Avr4fO6k3rY1DyDorjddeVgQ8nrwjqLMMcntxAg
         pu+H367weF5INk3rOaqueiJeH65NCfdoyL6zhlr977M5u+f/dq31/w2Sl9LK8DqdMfWQ
         fHgQ==
X-Gm-Message-State: ACrzQf1r+I6IMApfvk59IjcvDENzWc8EeDLG0vnWf8SIE2Q6yRuLivru
        sAkYdvLN9a57nKynanZWkROetzvq9o3tjIXB5QCnLh+dVed9onr+LmVEogf2vu2OrL9ws0nKeRC
        QBWL/svu5wc/7UubvUl7RlA78iMF9U/ftrg==
X-Received: by 2002:a17:907:1dcc:b0:77a:c5f3:708b with SMTP id og12-20020a1709071dcc00b0077ac5f3708bmr23278260ejc.331.1664288998231;
        Tue, 27 Sep 2022 07:29:58 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7oaN+oJNzgoKfTucQ5HgkrI0cpFFC7w+y2x3V1IlKbboxXQKgc1ZkJCZioVwRKc/L5CwFSIw==
X-Received: by 2002:a17:907:1dcc:b0:77a:c5f3:708b with SMTP id og12-20020a1709071dcc00b0077ac5f3708bmr23278245ejc.331.1664288998021;
        Tue, 27 Sep 2022 07:29:58 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id r17-20020a17090609d100b00781d411a63csm854954eje.151.2022.09.27.07.29.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 07:29:57 -0700 (PDT)
Message-ID: <471449b3-cced-d75d-e349-6bec950b0bc1@redhat.com>
Date:   Tue, 27 Sep 2022 16:29:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Subject: Re: [PATCH 1/5] ACPI: battery: Do not unload battery hooks on single
 error
Content-Language: en-US
To:     Armin Wolf <W_Armin@gmx.de>,
        "Rafael J. Wysocki" <rafael@kernel.org>
Cc:     Mark Gross <markgross@kernel.org>, Len Brown <lenb@kernel.org>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Matan Ziv-Av <matan@svgalib.org>,
        Corentin Chary <corentin.chary@gmail.com>,
        Jeremy Soller <jeremy@system76.com>, productdev@system76.com,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        ACPI Devel Maling List <linux-acpi@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20220912125342.7395-1-W_Armin@gmx.de>
 <20220912125342.7395-2-W_Armin@gmx.de>
 <f8fa6d10-6eb1-7fa7-80eb-ea190d29ba4a@redhat.com>
 <CAJZ5v0jWVMMTjc+KtBRS86f8kYpbPcDCH9JV2ZgeN4f-MSO8rQ@mail.gmail.com>
 <f2af5d01-a2cd-ae96-24c7-d61f5f0d0bc3@gmx.de>
 <f0b17ba6-3d3c-cbc1-ec0d-ec59c73f06f6@gmx.de>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <f0b17ba6-3d3c-cbc1-ec0d-ec59c73f06f6@gmx.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-4.5 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/19/22 22:35, Armin Wolf wrote:
> Am 19.09.22 um 21:12 schrieb Armin Wolf:
> 
>> Am 19.09.22 um 18:27 schrieb Rafael J. Wysocki:
>>
>>> On Mon, Sep 19, 2022 at 12:42 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>>> Hi,
>>>>
>>>> On 9/12/22 13:53, Armin Wolf wrote:
>>>>> Currently, battery hooks are being unloaded if they return
>>>>> an error when adding a single battery.
>>>>> This however also causes the removal of successfully added
>>>>> hooks if they return -ENODEV for a single unsupported
>>>>> battery.
>>>>>
>>>>> Do not unload battery hooks in such cases since the hook
>>>>> handles any cleanup actions.
>>>>>
>>>>> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
>>>> Maybe instead of removing all error checking, allow -ENODEV
>>>> and behave as before when the error is not -ENODEV ?
>>>>
>>>> Otherwise we should probably make the add / remove callbacks
>>>> void to indicate that any errors are ignored.
>>>>
>>>> Rafael, do you have any opinion on this?
>>> IMV this is not a completely safe change, because things may simply
>>> not work in the cases in which an error is returned.
>>>
>>> It would be somewhat better to use a special error code to indicate
>>> "no support" (eg. -ENOTSUPP) and ignore that one only.
>>
>> I would favor -ENODEV then, since it is already used by quiet a few drivers
>> to indicate a unsupported battery.
>>
>> Armin Wolf
>>
> While checking all instances where the battery hook mechanism is currently used,
> i found out that all but a single battery hook return -ENODEV for all errors they
> encounter, the exception being the huawei-wmi driver.

Right, so this means that using -ENODEV to not automatically unload the
extension on error will result in a behavior change for those drivers,
with possibly unwanted side-effects.

As such I believe that using -ENOTSUP for the case where the extension
does not work for 1 battery but should still be used for the other
batter{y|ies} would be better as this preserves the existing behavior
for existing drivers.

> I do not know the reason for this, but i fear unloading the extension on for
> example -ENOTSUP will result in similar behavior by hooks wanting to avoid being
> unloaded on harmless errors.

I am not sure what you are trying to say here. The whole idea is
to add new behavior for -ENOTSUP to allow drivers to opt out of
getting their extension unregistered when they return this.

Although I wonder why not just have extensions return 0 when
they don't want to register any sysfs attr and that not considered
an error. If it is not considered an error the hook can just
return 0, which would not require any ACPI battery code changes
at all. So maybe just returning 0 is the easiest (which is
also often the best) answer here?

> However, i agree that when ignoring all errors, battery extensions which provide
> similar attributes may currently delete each others attributes.

AFAIK there are no cases where more then 1 extension driver gets loaded,
since all the extension drivers are tied to a specific vendor's interfaces
so we won't e.g. see the thinkpad_acpi driver load on the same laptop as
where toshiba_acpi also loads.

IOW I think you are trying to solve a problem which does not exist here.

Regards,

Hans




> 
> Any idea on how to solve this?
> 
> Armin Wolf
> 
>>>>> ---
>>>>>   drivers/acpi/battery.c | 24 +++---------------------
>>>>>   1 file changed, 3 insertions(+), 21 deletions(-)
>>>>>
>>>>> diff --git a/drivers/acpi/battery.c b/drivers/acpi/battery.c
>>>>> index 306513fec1e1..e59c261c7c59 100644
>>>>> --- a/drivers/acpi/battery.c
>>>>> +++ b/drivers/acpi/battery.c
>>>>> @@ -724,20 +724,10 @@ void battery_hook_register(struct acpi_battery_hook *hook)
>>>>>         * its attributes.
>>>>>         */
>>>>>        list_for_each_entry(battery, &acpi_battery_list, list) {
>>>>> -             if (hook->add_battery(battery->bat)) {
>>>>> -                     /*
>>>>> -                      * If a add-battery returns non-zero,
>>>>> -                      * the registration of the extension has failed,
>>>>> -                      * and we will not add it to the list of loaded
>>>>> -                      * hooks.
>>>>> -                      */
>>>>> -                     pr_err("extension failed to load: %s", hook->name);
>>>>> -                     __battery_hook_unregister(hook, 0);
>>>>> -                     goto end;
>>>>> -             }
>>>>> +             hook->add_battery(battery->bat);
>>>>>        }
>>>>>        pr_info("new extension: %s\n", hook->name);
>>>>> -end:
>>>>> +
>>>>>        mutex_unlock(&hook_mutex);
>>>>>   }
>>>>>   EXPORT_SYMBOL_GPL(battery_hook_register);
>>>>> @@ -762,15 +752,7 @@ static void battery_hook_add_battery(struct acpi_battery *battery)
>>>>>         * during the battery module initialization.
>>>>>         */
>>>>>        list_for_each_entry_safe(hook_node, tmp, &battery_hook_list, list) {
>>>>> -             if (hook_node->add_battery(battery->bat)) {
>>>>> -                     /*
>>>>> -                      * The notification of the extensions has failed, to
>>>>> -                      * prevent further errors we will unload the extension.
>>>>> -                      */
>>>>> -                     pr_err("error in extension, unloading: %s",
>>>>> -                                     hook_node->name);
>>>>> -                     __battery_hook_unregister(hook_node, 0);
>>>>> -             }
>>>>> +             hook_node->add_battery(battery->bat);
>>>>>        }
>>>>>        mutex_unlock(&hook_mutex);
>>>>>   }
>>>>> -- 
>>>>> 2.30.2
>>>>>

