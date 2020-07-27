Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 23BA222E6DD
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Jul 2020 09:45:37 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727041AbgG0Hpg (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Jul 2020 03:45:36 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:36920 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726853AbgG0Hpf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Jul 2020 03:45:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1595835934;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=oMBVeCMrmTVhEtBWGjsG1unFoTQ5DrgjjzDJ6NMzZfs=;
        b=NcBw8XlUZ5Cm435c7oC2aPpbyvaDE5705DciVpP6XPz/UkpRwmBOen3ixcP1zz4k0TRwmI
        xpV2STdRyYnaAZQSK8RlqogxwxxWcLhTMhok4TgcCHHng5QBynPI5npJca8dYfKNfnsSNR
        TNxKEZUTTRdkkhvoh/81Y6fpIAeWm9o=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-228-aeig8CavO324t4v1JAknUA-1; Mon, 27 Jul 2020 03:45:32 -0400
X-MC-Unique: aeig8CavO324t4v1JAknUA-1
Received: by mail-ed1-f70.google.com with SMTP id b23so3002161edj.14
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Jul 2020 00:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=oMBVeCMrmTVhEtBWGjsG1unFoTQ5DrgjjzDJ6NMzZfs=;
        b=el22T25y2XhumERESS7iIIl20ui2FzY8ylLyuZhh4gX1Eq/1SFVPLU1/LIfCrr0lMu
         ehxc2zYjwNu90ZJRRz+wlctZxozxPNGph10/KJsbP2eNbHdQykCGQ/7DhLlZPRo/EK7g
         OCy9HCelmcJP5ALuB6x2w5bkLIzdJMu36HI4Kh4QrjcNHeIT9leGTS1WgqK3VnwEv/MJ
         sBeOKPJGgWfLIJfu31/oaB2B1ZNVviTSE1DOj93Qnc5wKNxGghlNR2nQ8RPwdIAyeXTP
         2nJ5cbIKYgzc+TrkLmoah6m/Pk3WrTH5sBSNERs5Vwo7grZKaS+vLNrwCpkuUwaNCdVM
         3b+w==
X-Gm-Message-State: AOAM5328gMQhj/2EhBJh6loY7TDhldqfe94HC3dtx8QoH9xkqi25EvZT
        ndk7I+tljyMmXPq82dyyI9O8fXSUv338Mis4v2E3vw88c+FXWlMJktYL3mHTe9+FD34YXCUyl8o
        3JYuElGcvtdfIr+6HLjHiOxTxGuiZSpaPxw==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2115103ejz.223.1595835931532;
        Mon, 27 Jul 2020 00:45:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxfnpzm5w2mw/jNUlDtxiqUY/d9iJ0u0qln5b8dW/aH3LeubhQN1b6Sy5Yno4zk+7u2dQ26dw==
X-Received: by 2002:a17:906:b294:: with SMTP id q20mr2115093ejz.223.1595835931381;
        Mon, 27 Jul 2020 00:45:31 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id r25sm5659889edy.93.2020.07.27.00.45.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2020 00:45:30 -0700 (PDT)
Subject: Re: [PATCH 0/3] Add 3 new keycodes and use them for 3 new hotkeys on
 new Lenovo Thinkpads
To:     Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc:     Darren Hart <dvhart@infradead.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andy@infradead.org>,
        linux-input@vger.kernel.org,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Mark Pearson <mpearson@lenovo.com>,
        Christian Kellner <ckellner@redhat.com>,
        Benjamin Berg <bberg@redhat.com>,
        ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20200717114155.56222-1-hdegoede@redhat.com>
 <20200719225649.GA4341@khazad-dum.debian.net>
 <20200722054144.GQ1665100@dtor-ws>
 <20200727005049.GA10254@khazad-dum.debian.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <f67ede61-c9d4-6abc-9b59-a5b2b615d1b6@redhat.com>
Date:   Mon, 27 Jul 2020 09:45:29 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200727005049.GA10254@khazad-dum.debian.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 7/27/20 2:50 AM, Henrique de Moraes Holschuh wrote:
> On Tue, 21 Jul 2020, Dmitry Torokhov wrote:
>> On Sun, Jul 19, 2020 at 07:56:49PM -0300, Henrique de Moraes Holschuh wrote:
>>> On Fri, 17 Jul 2020, Hans de Goede wrote:
>>>> This is a simple patch-series adding support for 3 new hotkeys found
>>>> on various new Lenovo Thinkpad models.
>>>
>>> For all three patches, pending an ack for the new keycodes by the input
>>> maintainers:
>>>
>>> Acked-by: Henrique de Moraes Holschuh <hmh@hmh.eng.br>
>>
>> Do you want me to merge all 3 through input tree?
> 
> Hans, Daren, Andy, what do you prefer?

Taking all this upstream through Dmitry's input tree is fine with
me, but this really is up to Andy and/or Daren.

Regards,

Hans

