Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id BE0AC25FE0D
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Sep 2020 18:05:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729915AbgIGQFj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Sep 2020 12:05:39 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:54687 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729823AbgIGOqX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Sep 2020 10:46:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1599489964;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=YztFdEqGlty6uJ6DHnv728nfxZeOyHWmtt3Ki77/cgM=;
        b=ihQ87hrKI+kmzT5o1Xv676laWTLTJLWuAsIyL7UVAuv1KKQekjRn1QZncJxws48DoZa78q
        C21CSGJflUzuI/UfrIoMuuKwIvgbu8OJdbT8jD3anrmL6iDbBAT17NGIo7nxlLqBoHuHv2
        WQAF12h5sVe2MUawL10S3QpCXyr4zwQ=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-328-nUNvNUhUPSqMziEvwKjbvQ-1; Mon, 07 Sep 2020 10:46:02 -0400
X-MC-Unique: nUNvNUhUPSqMziEvwKjbvQ-1
Received: by mail-wm1-f72.google.com with SMTP id d22so1822969wmd.6
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Sep 2020 07:46:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=YztFdEqGlty6uJ6DHnv728nfxZeOyHWmtt3Ki77/cgM=;
        b=GmtnHXdZ0fNW+z7EcIppm+cOw3i5G4Xjb9W60akX5yyyg6rdJmu0/vXMuHCJJIUZhn
         GqsTCi+jv6m3eYJbJgS00SECvsNmxXO0DNj1hpBM7iJDZOEgGCZbYOdhSqCWlZUMXQX6
         9AALGocEa2ovN89dI/VFywq1xf6OEiRD81g47I74s/HpK0O0A48vbVSnmCj4REkN1Kkc
         tcMUZXW3dmtZ0RdpYgiyuGRuc58+EsHvvLeArdaHd+JFkc2Zg8zT/3Cz1c4be4/K5F0W
         tOFNzBuEyp9qULVgF9dPtuZP2YrKNjC6JuS6qoTDWsua+5FYMR6GHs0lZO1LmiswC2ir
         OaTA==
X-Gm-Message-State: AOAM531FmJza8RcR4WYYvGcobvlasAScaxAx0K4dXU4UlkeFdQShP6X4
        4Apt2gcMf7srIKx/dvzRJpuDiTy+gsBGQgiLgJdJEOdHG17/Py2ONbQOZZdd78tY0N9kW2+zAde
        au0sKkV23r5O0xz56TFNbMvHKMaSncVuRNg==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr23595206wrx.251.1599489961765;
        Mon, 07 Sep 2020 07:46:01 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzeJGAr2oTt1TYRXcrTOgjmIDwKByN9qHkLkEtJPOPkUi1vbCexd0+uANdQJ12oUYquT/ZXeQ==
X-Received: by 2002:a05:6000:1282:: with SMTP id f2mr23595189wrx.251.1599489961602;
        Mon, 07 Sep 2020 07:46:01 -0700 (PDT)
Received: from x1.localdomain ([78.108.130.193])
        by smtp.gmail.com with ESMTPSA id k6sm23312028wmf.30.2020.09.07.07.46.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Sep 2020 07:46:01 -0700 (PDT)
Subject: Re: [PATCH 2/2] platform/x86: system76_acpi: Add input driver
To:     =?UTF-8?Q?Barnab=c3=a1s_P=c5=91cze?= <pobrn@protonmail.com>,
        Jeremy Soller <jeremy@system76.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Bj=c3=b6rn_Lindfors?= <productdev@system76.com>
References: <aec7591c-80de-4f7b-b8f2-95da5ac1847e@www.fastmail.com>
 <179d3595-dda8-4c50-84e3-5f447ef5e34b@www.fastmail.com>
 <BAH8gRbpLk_cHH1yK9d7JrKitwVru-ZNmQ2D_wvEOr4SavRgSBRAsnLBlf1mq6r89xYcZhUk3bEAYNCeBq464tUO85CfK6A20rGWtwVHjVg=@protonmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <05e95ba0-3d39-1df6-62d4-901f8d43ed05@redhat.com>
Date:   Mon, 7 Sep 2020 16:46:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <BAH8gRbpLk_cHH1yK9d7JrKitwVru-ZNmQ2D_wvEOr4SavRgSBRAsnLBlf1mq6r89xYcZhUk3bEAYNCeBq464tUO85CfK6A20rGWtwVHjVg=@protonmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/4/20 8:20 PM, Barnabás Pőcze wrote:
>> [...]
>> +static void input_key(struct system76_data *data, unsigned int code)
>> +{
>> +	input_report_key(data->input, code, 1);
>> +	input_sync(data->input);
>> +
>> +	input_report_key(data->input, code, 0);
>> +	input_sync(data->input);
>> +}
>> +
>>   // Handle ACPI notification
>>   static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>>   {
>> @@ -459,6 +470,9 @@ static void system76_notify(struct acpi_device *acpi_dev, u32 event)
>>   	case 0x84:
>>   		kb_led_hotkey_color(data);
>>   		break;
>> +	case 0x85:
>> +		input_key(data, KEY_SCREENLOCK);
>> +		break;
>>   	}
>>   }
>>
>> @@ -524,6 +538,21 @@ static int system76_add(struct acpi_device *acpi_dev)
>>   	if (IS_ERR(data->therm))
>>   		return PTR_ERR(data->therm);
>>
>> +	data->input = devm_input_allocate_device(&acpi_dev->dev);
>> +	if (!data->input)
>> +		return -ENOMEM;
>> +	data->input->name = "System76 ACPI Hotkeys";
>> +	data->input->phys = "system76_acpi/input0";
>> +	data->input->id.bustype = BUS_HOST;
>> +	data->input->dev.parent = &acpi_dev->dev;
>> +	set_bit(EV_KEY, data->input->evbit);
>> +	set_bit(KEY_SCREENLOCK, data->input->keybit);
>> +	err = input_register_device(data->input);
>> +	if (err) {
>> +		input_free_device(data->input);
>> +		return err;
>> +	}
>> +
>>   	return 0;
>>   }
> 
> Hi,
> 
> wouldn't sparse_keymap be a better choice here?

Since none of the notify events are actually keys;
and since there is only one keycode involved atm, that
seems like a bit of overkill to me.

Regards,

Hans

