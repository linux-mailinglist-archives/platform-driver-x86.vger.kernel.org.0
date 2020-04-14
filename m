Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3D8351A7DDB
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 Apr 2020 15:26:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731755AbgDNN0P (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 Apr 2020 09:26:15 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27481 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2502868AbgDNNQA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 Apr 2020 09:16:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1586870158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fkgBK9xnpU8Tu3dZHUSNLZnfPluOMQrIKm9bQ1t2jqg=;
        b=HA6Nx853pb8P07galFP65dKs/lF9lq4+WZgvvyv/uuQE2aYZCcqdWFiRua07KqsYszNbLF
        f8A8Al+LKNB/9wM05iTgZ4hQ4beAhCGh4EnDiI9wVu6Pgr8+4YmhcE4eVyrNNPrnuV3UB6
        qmKi7CIuSnMlYiFwslAMbrH9Bm3tOgA=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-288-92C1H2jiPcSMzJ9Y3oQAgQ-1; Tue, 14 Apr 2020 09:15:57 -0400
X-MC-Unique: 92C1H2jiPcSMzJ9Y3oQAgQ-1
Received: by mail-wr1-f72.google.com with SMTP id r17so8657113wrg.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 Apr 2020 06:15:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=fkgBK9xnpU8Tu3dZHUSNLZnfPluOMQrIKm9bQ1t2jqg=;
        b=SOw8tw81Wi65nV55Ceb7uvoxCK0GtvGsB3r3gqMQOlh59FRNRGYtsnvw1L14BI1r/d
         FpHMVNa8XdnEo37iswGJWfMd/MeyQ5sGmZ+8ruUTLFIhvIx04TT48Y/gZLrjvSEqY4he
         A58XTRyQZa2S7nJucIBYsbzg10gIrrphiCN13GHzAEp5WiA71SGNAV0IYO6xtArpJ5Ii
         4meQJo5EUT1sh3BCwAirvjTmrzQBu1oTXFGld6jj1omERDnoufh3Rork5IHfk3xSImh+
         cPlJSPMnfwOig+4m+5aOWioiKyhgu1O5JricXX+dg5DfVf29s0tsdvxGBij/Ww7yURsr
         3etA==
X-Gm-Message-State: AGi0PuZIen3N093sJrGqxWWmXGrc+4sbOzflD33lDjfT7O/k3WMtzbrt
        L2IK5MVD2vu4atWJm8ZtGesq0IXyU+LrF5T3NDQmooEUy0jxytJxCOLalD7eBHJ86fPk0bYySHc
        XjOgqLbi5rQEVTVk2pLnOpMGaH4KDFijx8w==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr3671367wrt.126.1586870155637;
        Tue, 14 Apr 2020 06:15:55 -0700 (PDT)
X-Google-Smtp-Source: APiQypIYnGXCmimjktgJ31Rsn05nuM82C4sRRSEJSiXVM+BE/3APQErQB0fwpedAZZG7kleviTPIyA==
X-Received: by 2002:a5d:6145:: with SMTP id y5mr3671335wrt.126.1586870155233;
        Tue, 14 Apr 2020 06:15:55 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id y15sm19420635wro.68.2020.04.14.06.15.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 14 Apr 2020 06:15:54 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: intel_int0002_vgpio: Only bind to the
 INT0002 dev when using s2idle
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
Cc:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        "Rafael J . Wysocki" <rjw@rjwysocki.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Maxim Mikityanskiy <maxtram95@gmail.com>,
        "5 . 3+" <stable@vger.kernel.org>
References: <20200407213058.62870-1-hdegoede@redhat.com>
 <cfd3171a-94fb-7382-28e1-a236cb6759cc@redhat.com>
 <CAHp75VdqQnHbMSSeoDESMgywH-1VxBTT=Uo_GLV1aycmg=MXtA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <32d57d33-5278-aead-1545-fac1ab936fbd@redhat.com>
Date:   Tue, 14 Apr 2020 15:15:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.6.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VdqQnHbMSSeoDESMgywH-1VxBTT=Uo_GLV1aycmg=MXtA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 4/8/20 12:26 AM, Andy Shevchenko wrote:
> On Wed, Apr 8, 2020 at 1:24 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi all,
>>
>> I just realized that I should have added a cover letter to this
>> patch to discuss how to merge it.
>>
>> Rafael has already queued up the
>> "[PATCH v3 2/2] platform/x86: intel_int0002_vgpio: Use acpi_register_wakeup_handler()"
>> in his tree. Looking at both patches the parts of the file the
>> touch are different enough that that should not be a problem though.
>>
>> So I guess this can go through platform/x86 as usual, or
>> (assuming everyone is ok with the change itself) alternatively
>> Rafael can take it to make sure there will be no conflicts?
> 
> You will need different patches for v5.7 and the rest.
> In v5.7 new CPU macros are in use.

I see, I will send out a v2 rebased on top of 5.7-rc1.

Regards,

Hans

