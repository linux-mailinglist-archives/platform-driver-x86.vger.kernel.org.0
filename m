Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 952D169B33
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Jul 2019 21:12:01 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729525AbfGOTLZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Jul 2019 15:11:25 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:34922 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729432AbfGOTLZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Jul 2019 15:11:25 -0400
Received: by mail-ed1-f68.google.com with SMTP id w20so16518656edd.2
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Jul 2019 12:11:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rZ3XbJ3vO7+s1ZW42UKXro4p0M2GhlRNqkmKy9Kee7o=;
        b=AS++UnAZZDHugdcthdfv3rXops+zn1jgg0HJmj/zdbSGzKMLj9zK8e/tfci1i5IC8J
         XXUdOBSn0xRqKATYYEPGeHWlxmMMel+Uu9EYwDWfSa553ae7pJWVET4z4qzu5dez2LDU
         0xIrOgYSxkNJRll3xzAnnr8Ov1KPNv4+/VATNQjdmKb+7sP3idBog5rsOXp8n9h6gmNP
         yUGqsFq6zmVYxRc6e54sM0ipKWa4qIBave80x6VquOWb2GVsEGYGVny5TQ2wGzLJLZRm
         vTMoBH3Buv7JWexjoYpH1jLSn8rLE+rXEok6GVz7uADU5K10Ek+cliq0xHmI8MuUGr6h
         vhaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rZ3XbJ3vO7+s1ZW42UKXro4p0M2GhlRNqkmKy9Kee7o=;
        b=oYDPaF/ONz2iVSxknJWegDrYSSKW60jLu/WSQzsMqeO8gmnO0KjD3YsQqSjcbApTda
         n0nw19f3S2Hh6KZkCzP1iplmuEvrQKcUYmcXvpcpGzJm7uPmA0BPouDt4Zqs8Goc8I1/
         oyGhEbj6dBOhrH6Kka9pADsyGKOURkK4ehfJ2Uotuatr8DFrs+dpshOl57rBLLzjL1HR
         g+U2gGulQLCaeelabneXntJmU6ZueZkmFgfpfCFHVqFQSCJ+H3LsxPD0ksXeQesqspwy
         PiPBu0J+STgBuIlbymjkWsXg1BY5wTr+vejK8DT9/qEPs31+YwjvRFgX6jeMoEYcZw9y
         LyRQ==
X-Gm-Message-State: APjAAAXnQxrkKOjN2PGFu/nANAxcNAhUettbOeBx7UEVjWb/5jB0xX4+
        Q6ReyNMrQVS5iRLLSO0cbGK2hV6r
X-Google-Smtp-Source: APXvYqw3U7XVpnzQvJHg2qGA189IF5URbfoLAwMP8b5BJ4LFpdNnheT+wwJ3jLF6nyo9cyuu5Gmc0g==
X-Received: by 2002:a17:906:3919:: with SMTP id f25mr21511408eje.243.1563217883957;
        Mon, 15 Jul 2019 12:11:23 -0700 (PDT)
Received: from [192.168.20.141] ([194.99.104.18])
        by smtp.gmail.com with ESMTPSA id z9sm5577563edd.53.2019.07.15.12.11.22
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jul 2019 12:11:23 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: asus: Rename "fan mode" to "fan boost mode"
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Daniel Drake <drake@endlessm.com>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Upstreaming Team <linux@endlessm.com>
References: <20190715064104.4514-1-drake@endlessm.com>
 <CAHp75Ve1oV5urnZOth-99qiWZO54ehBQhP6u54oumqHs8F8pzQ@mail.gmail.com>
From:   Yurii Pavlovskyi <yurii.pavlovskyi@gmail.com>
Message-ID: <de877e84-a758-1b28-bfa9-ba2e621fc321@gmail.com>
Date:   Mon, 15 Jul 2019 21:11:18 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve1oV5urnZOth-99qiWZO54ehBQhP6u54oumqHs8F8pzQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

it is reasonable that this should be renamed to "fan boost mode" if there is
some other functionality that causes / will cause name conflict. It is
definitely called so by the vendor. The reason I shortened it was to save typing
as I thought that the extra word was for marketing purposes only.

Thanks,
Yurii

On 15.07.19 11:48, Andy Shevchenko wrote:
> On Mon, Jul 15, 2019 at 9:41 AM Daniel Drake <drake@endlessm.com> wrote:
>>
>> The Asus WMI spec indicates that the function being controlled here
>> is called "Fan Boost Mode". The spec uses the term "fan mode" is used to
>> refer to other things, including functionality expected to appear on
>> future products.
>>
>> Rename "fan mode" to "fan boost mode" to improve consistency with the
>> spec and to avoid a future naming conflict.
>>
>> There is no interface breakage here since this has yet to be included
>> in an official kernel release. I also updated the kernel version listed
>> under ABI accordingly.
> 
> I would like to see if you have a consensus on this with Yurii. And by
> some reason I didn't hear Corentin for some time.
> 
>> Please consider for Linux-5.3, otherwise we'd have an official released
>> kernel using the "fan_mode" name which would be more controversial to
>> change later.
> 
> I am wondering why no one commented on this before...
> 
>> -What:          /sys/devices/platform/<platform>/fan_mode
>> +What:          /sys/devices/platform/<platform>/fan_boost_mode
> 
>>  Date:          Apr 2019
>> -KernelVersion: 5.2
>> +KernelVersion: 5.3
> 
> Probably date should be changed as well.
> 
