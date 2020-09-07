Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D040B2602FB
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Sep 2020 19:40:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729503AbgIGRkZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Sep 2020 13:40:25 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:34403 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729462AbgIGRi4 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Sep 2020 13:38:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599500332;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=U2OI+G2SU9SAlutwCguJEetLvkbBNOTBWhjMdDpCXMs=;
        b=gWL8W81Pa45r1XgUQ2zKPGqi/K0C8dk0pa/vm0HCd+2fLzavmxHB4aLF9+YCTDvLt2smbW
        ikuXoVDwZxwkaa0g/rlx/T7myBqBfc0zNCwiz7KKpLl5B0c6TL1biw2KZeD+yz2nFBhkUM
        QbmNUuCFnzMb+E5GaQRJFa+R32OV7u8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-495-EwpZXBhWP9W0Xojn7QXVTQ-1; Mon, 07 Sep 2020 13:38:51 -0400
X-MC-Unique: EwpZXBhWP9W0Xojn7QXVTQ-1
Received: by mail-ed1-f69.google.com with SMTP id c3so1866054eds.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2020 10:38:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=U2OI+G2SU9SAlutwCguJEetLvkbBNOTBWhjMdDpCXMs=;
        b=r+UiFdANL27bbof+AGBnayZAf+/N3XGjvlMTWXTplbpVw8WIyxHbDT2NVvl3xWbcfS
         Lbw6p29BqafY9qEmAYck8D75mmR/SL8P6ppkyJe96aAxAaZwgJDYRyN6032Ahg0jo39j
         fnCjJOTRoiY+V5Qm9u7mv4VjjZXbFdZ9N1XbRzlZpHM2fyRmv/8vIno8U2A5AOSFodT8
         UmCxKGsHfBEz+nLf9bHc2FVlTc8WT+gxVuToHKV7zHTFaLZqIGBy8Bj6etScboIiPtob
         +2l64SsY0HSzOltEkCQG8SbBWS/EIm2KB+HcyMCBweteXExPM0DduXHrxyvKxY2s6gJ9
         a6TQ==
X-Gm-Message-State: AOAM53371pYQljuhlvgUuRlPvn8jO20Zuegqr/p7Ml5rr9NC5bvzXgVS
        HC3nH1rCusgI9Dk1SaOFgQiitgfyYiJgQq0d61kP9ZyE8pDTQubwXjklgmcQRltk2iZaNeVPCJo
        7ifYL0JKk8+Z7lwDuLjxfel7hfPUF+mltiw==
X-Received: by 2002:a17:906:4951:: with SMTP id f17mr4854068ejt.29.1599500330035;
        Mon, 07 Sep 2020 10:38:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0sHKzDMj3U/mZJuGMEPN/PyU36V74zpW3pdG/e8oYgUHq6p+kRss6X6ZUBWgStFtJH7so5A==
X-Received: by 2002:a17:906:4951:: with SMTP id f17mr4854052ejt.29.1599500329789;
        Mon, 07 Sep 2020 10:38:49 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id ks21sm5514999ejb.63.2020.09.07.10.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 10:38:49 -0700 (PDT)
Subject: Re: [PATCH 2/2] platform/x86: system76_acpi: Add input driver
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>
Cc:     Jeremy Soller <jeremy@system76.com>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Bj=c3=b6rn_Lindfors?= <productdev@system76.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
 <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
 <BAH8gRbpLk_cHH1yK9d7JrKitwVru-ZNmQ2D_wvEOr4SavRgSBRAsnLBlf1mq6r89xYcZhUk3bEAYNCeBq464tUO85CfK6A20rGWtwVHjVg=@protonmail.com>
 <05e95ba0-3d39-1df6-62d4-901f8d43ed05@redhat.com>
 <Eb7GE4vQo_kiCbFqDdX4Hxv_i8g5MQmW1zVjb47lgYCZy3g5J7AywqGCtDKtr1xWTaufDHI0uIUAHSbv8n_hTr6dr-vGv1rAbdEVMwzQJ4g=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <348b0ff2-b1e2-4c9a-5ebe-cc467e8df81c@redhat.com>
Date:   Mon, 7 Sep 2020 19:38:48 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <Eb7GE4vQo_kiCbFqDdX4Hxv_i8g5MQmW1zVjb47lgYCZy3g5J7AywqGCtDKtr1xWTaufDHI0uIUAHSbv8n_hTr6dr-vGv1rAbdEVMwzQJ4g=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/7/20 5:49 PM, Barnabás Pőcze wrote:
> Hi,
> 
> thanks for the feedback.
> 
>> [...]
>>>> +static void input_key(struct system76_data *data, unsigned int code)
>>>> +{
>>>> +	input_report_key(data->input, code, 1);
>>>> +	input_sync(data->input);
>>>> +
>>>> +	input_report_key(data->input, code, 0);
>>>> +	input_sync(data->input);
>>>> +}
>>>> +
>>>>    // Handle ACPI notification
>>>>    static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>>>>    {
>>>> @@ -459,6 +470,9 @@ static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>>>>    	case 0x84:
>>>>    		kb_led_hotkey_color(data);
>>>>    		break;
>>>> +	case 0x85:
>>>> +		input_key(data, KEY_SCREENLOCK);
>>>> +		break;
>>>>    	}
>>>>    }
>>>>
>>>> @@ -524,6 +538,21 @@ static int system76_add(struct acpi_device *acpi_dev)
>>>>    	if (IS_ERR(data->therm))
>>>>    		return PTR_ERR(data->therm);
>>>>
>>>> +	data->input = devm_input_allocate_device(&acpi_dev->dev);
>>>> +	if (!data->input)
>>>> +		return -ENOMEM;
>>>> +	data->input->name = "System76 ACPI Hotkeys";
>>>> +	data->input->phys = "system76_acpi/input0";
>>>> +	data->input->id.bustype = BUS_HOST;
>>>> +	data->input->dev.parent = &acpi_dev->dev;
>>>> +	set_bit(EV_KEY, data->input->evbit);
>>>> +	set_bit(KEY_SCREENLOCK, data->input->keybit);
>>>> +	err = input_register_device(data->input);
>>>> +	if (err) {
>>>> +		input_free_device(data->input);
>>>> +		return err;
>>>> +	}
>>>> +
>>>>    	return 0;
>>>>    }
>>>
>>> Hi,
>>>
>>> wouldn't sparse_keymap be a better choice here?
>>
>> Since none of the notify events are actually keys;
> 
> I'm not sure I understand what you mean, could you please clarify?

What I meant to say (but didn't) is:

"Since none of the notify events are _currently_ actually keys"

Currently, as in before this patch:

static void system76_notify(struct acpi_device *acpi_dev, u32 event)
{
         struct system76_data *data;

         data = acpi_driver_data(acpi_dev);
         switch (event) {
         case 0x80:
                 kb_led_hotkey_hardware(data);
                 break;
         case 0x81:
                 kb_led_hotkey_toggle(data);
                 break;
         case 0x82:
                 kb_led_hotkey_down(data);
                 break;
         case 0x83:
                 kb_led_hotkey_up(data);
                 break;
         case 0x84:
                 kb_led_hotkey_color(data);
                 break;
         }
}

So we cannot just take the event code and feed it to the
sparse_keymap code since events 0x80-0x84 are not
key events (they are related to the LEDs on the kbd).

>> and since there is only one keycode involved atm, that
>> seems like a bit of overkill to me.
> 
> Indeed, it might be an overkill, but I'd still vote for that since
>   - it is an ε effort investment to convert the current code, and
>   - the number of keys is expected to grow (at least that's my assumption), and
>   - it avoids code duplication, the resulting code is simple and short.

If Jeremy is ok with adding sparse_keymap support to the next version, that
is fine with me. But IMHO it is not really necessary for adding just this
single key.

Regards,

Hans

