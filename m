Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id D75D04498F1
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Nov 2021 17:02:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241178AbhKHQCJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Nov 2021 11:02:09 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:38716 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S241150AbhKHQCD (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Nov 2021 11:02:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636387158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0FX33YX3/KEHbRU3d7P7kXufc5u/aEPzAlj6z3nAH7Y=;
        b=OA/OVwsvnjEs/9wJlkUk6Tmuvemh7MgG3GGAoB2t3jFoeVi/mMHSF7AH0XpKOs7A+67Qoa
        kX+y+ew94jGo3JcrGoVW3jlhPM0G6qdCRknKP+zENgxoWfHNlIkYXZ5gdB/dZr36chbP79
        unXlGaWqlEA9HPuen0a+6vrFrhdKq64=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-343-LolgdH3jM2WQbA9NujzjwQ-1; Mon, 08 Nov 2021 10:59:16 -0500
X-MC-Unique: LolgdH3jM2WQbA9NujzjwQ-1
Received: by mail-ed1-f71.google.com with SMTP id f20-20020a0564021e9400b003e2ad3eae74so15258470edf.5
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Nov 2021 07:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0FX33YX3/KEHbRU3d7P7kXufc5u/aEPzAlj6z3nAH7Y=;
        b=xrpLbr6ESy2DgXEgiAT+vnMNmQahpCJUTIZZ96iEMDcD9Ls4uL8KjRwK92sZBWpis5
         JK6rU73g/7N++cixJ8NPeczKPwj8DPkc28dEsAN7XDZJfgdbloVzjDpPbxD+bFAvXa3e
         ll0cd1fJg66lFBhYmJl+704pG8gcaHH+gMll2S8P19lNzCtzZQ3NZBXrNCXPHA9TA91E
         SyuC14z2Vv2wncUljOjNCES0Nznb1CaiPJQxekPFIElOqfgeE6J7zm7CZuH67dO9XBNf
         r+Gd7zew2kOZtDPrGTl2dO3NQYV5bMhC6XEYYTKINmJc+/tF4N8As6S+ZX042uBNK+r0
         gADQ==
X-Gm-Message-State: AOAM531pHYsSoYCTKnXwk5Abz9PhQcpyWgEnvYaQYUptaLYnQ0RCajRI
        T27DgH9aEzKNC7AVCBbDikUWRFvVIuti8Lw3u0wAyL8KtV5EtDKqUfBbkSKNLEzNELQuE58gquM
        v+cTe3rgmOHZExKZsbkse9HwQigvstohfkA==
X-Received: by 2002:a17:906:ce2a:: with SMTP id sd10mr446124ejb.154.1636387155365;
        Mon, 08 Nov 2021 07:59:15 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzM+ps60VfZ94gEqS5fzeul9kwGKMKVeKZIAnSvvogw3JjAS/vRJ5dtMKHz5XSx9gQP8MDeNw==
X-Received: by 2002:a17:906:ce2a:: with SMTP id sd10mr446099ejb.154.1636387155187;
        Mon, 08 Nov 2021 07:59:15 -0800 (PST)
Received: from [10.40.1.223] ([81.30.35.201])
        by smtp.gmail.com with ESMTPSA id r7sm7446410edd.5.2021.11.08.07.59.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Nov 2021 07:59:14 -0800 (PST)
Message-ID: <5413cf06-6058-647a-0bf5-b7ae5cdd793a@redhat.com>
Date:   Mon, 8 Nov 2021 16:59:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 09/13] power: supply: bq25890: Add bq25890_set_otg_cfg()
 helper
Content-Language: en-US
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@infradead.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Sebastian Reichel <sre@kernel.org>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Ard Biesheuvel <ardb@kernel.org>,
        Yauhen Kharuzhy <jekhor@gmail.com>,
        Tsuchiya Yuto <kitakar@gmail.com>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-efi <linux-efi@vger.kernel.org>
References: <20211030182813.116672-1-hdegoede@redhat.com>
 <20211030182813.116672-10-hdegoede@redhat.com>
 <CAHp75Vf=ff840YD8_4QJpir_u__Rr_aN_0C-sqQOkt7PboWpww@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CAHp75Vf=ff840YD8_4QJpir_u__Rr_aN_0C-sqQOkt7PboWpww@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/31/21 00:10, Andy Shevchenko wrote:
> On Sat, Oct 30, 2021 at 9:28 PM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Add a bq25890_set_otg_cfg() helper function, this is a preparation
>> patch for adding regulator support.
> 
> ...
> 
>>         switch (bq->usb_event) {
>>         case USB_EVENT_ID:
>>                 /* Enable boost mode */
>> -               ret = bq25890_field_write(bq, F_OTG_CFG, 1);
>> -               if (ret < 0)
>> -                       goto error;
>> +               bq25890_set_otg_cfg(bq, 1);
>>                 break;
>>
>>         case USB_EVENT_NONE:
>>                 /* Disable boost mode */
>> -               ret = bq25890_field_write(bq, F_OTG_CFG, 0);
>> -               if (ret < 0)
>> -                       goto error;
>> -
>> -               power_supply_changed(bq->charger);
>> +               ret = bq25890_set_otg_cfg(bq, 0);
>> +               if (ret == 0)
>> +                       power_supply_changed(bq->charger);
>>                 break;
>>         }
> 
> While at it,
> 
> default:
>  break;

bq->usb_event is not an enum, so there is no need for this.

Regards,

Hans

