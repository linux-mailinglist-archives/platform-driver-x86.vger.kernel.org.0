Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 713B2E2065
	for <lists+platform-driver-x86@lfdr.de>; Wed, 23 Oct 2019 18:19:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404695AbfJWQS4 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 23 Oct 2019 12:18:56 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:56157 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S2404623AbfJWQSy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 23 Oct 2019 12:18:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1571847534;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=42dR9KjvWxTtpNo0xdhv7ZprPq7NaqJV9H6bwrJzSyY=;
        b=GpmnREGCGWto0DqVMQl3aBfNJHTB1Cpa9cvHRrNaDbLzbOwjR5Fxh1VjQNeKdZXrClaoif
        h9XCdvUZVsYRoqollhCYnVcIoICPYRgsxFLt3ohb1FZFQW2cXdHlz/BLSjWry3dy7YyuT8
        BK3rUDFpFs/AeMLWeQNIgx8iQcqcYlE=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-147-ZlgdbHj7MmiBb4U-NfqOFQ-1; Wed, 23 Oct 2019 12:18:50 -0400
Received: by mail-wr1-f71.google.com with SMTP id j14so10936444wrm.6
        for <platform-driver-x86@vger.kernel.org>; Wed, 23 Oct 2019 09:18:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tOBGfSTF1KhMQpx4CgtoYn86qXiufMDfXR3BQXzAiZU=;
        b=X3ABCh63k8QirfkiG7kloa/qrJwSsGF8i3/IF0sIY9SJycq3BcshF2sHuscKdyTJ5k
         ki6TouJLTUU10+TTq0LCVZ8Ncd60btiiwAURfGEqZ/pyXYPix8yDEJJg7jBJ1bI/6MlI
         stdDNTRT3hbR0HPNXbIfi4+5CNzMH2MDBO10wFZUlv6Mzvz4zoYTG8teFeqagOws9TEW
         nTAZuZYT0nVVwq6b/TGymDoAOKSVQgBGwoFfBYvhL2oGTxwgt+6wwZBbOdHsbWvr/c1h
         aapWTYdJDNA0t33i5Wq68Vn89tQlaxupLxqKuVdgKwEsD9lg/QoszeBC8HV15WM5bDrn
         im/g==
X-Gm-Message-State: APjAAAXnaDwUpd8LeYA/KajUbwVOk2h7fMfP4JuBP4phkn9S2mlBkolF
        37Y8ewIcQp+9A+sl41ggf0kx/dad6IvXR0eK8q5tsOKY2oXIF3i5a2l3i6p37oOzyQvtgdbooCw
        NLMkzd3TZiHJzkwEBcCspCV1n0JLvC51SWQ==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr752678wmk.28.1571847529565;
        Wed, 23 Oct 2019 09:18:49 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwYz1HPlsDwZXRMQfmrsug6VYnNhIgU6zeDVTcRhDmNybUK9nIvatCeNxKFr3IjmW++iM0D8A==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr752660wmk.28.1571847529404;
        Wed, 23 Oct 2019 09:18:49 -0700 (PDT)
Received: from shalem.localdomain (2001-1c00-0c14-2800-ec23-a060-24d5-2453.cable.dynamic.v6.ziggo.nl. [2001:1c00:c14:2800:ec23:a060:24d5:2453])
        by smtp.gmail.com with ESMTPSA id x12sm12712262wru.93.2019.10.23.09.18.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2019 09:18:48 -0700 (PDT)
Subject: Re: [PATCH] Add touchscreen platform data for the Schneider SCT101CTM
 tablet
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Daniel Gorbea Ainz <danielgorbea@hotmail.com>,
        "dvhart@infradead.org" <dvhart@infradead.org>,
        "andy@infradead.org" <andy@infradead.org>,
        "linux-input@vger.kernel.org" <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <VI1PR10MB2574F4636A90613136ACF4BED86B0@VI1PR10MB2574.EURPRD10.PROD.OUTLOOK.COM>
 <05eec4e5-927c-fdd6-037b-71520e149d5b@redhat.com>
 <CAHp75VeoUCxLt9YFPBpS3d8zOpXb7B4UbpPaiNLWAv0tm4zPHA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <d18ca285-9a45-286f-3f61-c02059b2f9a6@redhat.com>
Date:   Wed, 23 Oct 2019 18:18:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VeoUCxLt9YFPBpS3d8zOpXb7B4UbpPaiNLWAv0tm4zPHA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: ZlgdbHj7MmiBb4U-NfqOFQ-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 23-10-2019 18:15, Andy Shevchenko wrote:
> On Wed, Oct 23, 2019 at 7:08 PM Hans de Goede <hdegoede@redhat.com> wrote=
:
>> On 23-10-2019 17:23, Daniel Gorbea Ainz wrote:
>>> Add touchscreen platform data for the Schneider SCT101CTM tablet
>>>
>>> Signed-off-by: Daniel Gorbea <danielgorbea@hotmail.com>
>>
>> Patch looks good to me:
>>
>> Reviewed-by: Hans de Goede <hdegoede@redhat.com>
>>
>> Daniel, I received your patch just fine, shall I resend
>> it to the list for you ?
>=20
> What list? Everything seems okay to me.
> I don't see it in patchwork, though.

Right, Daniel replied that vger@kernel.org did not like his email/patch
so it makes sense that patchwork has not picked it up.

Regards,

Hans

