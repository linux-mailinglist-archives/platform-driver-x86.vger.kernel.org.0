Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 70F5C415A72
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Sep 2021 11:00:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239137AbhIWJBo (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Sep 2021 05:01:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:31373 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240005AbhIWJBn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Sep 2021 05:01:43 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1632387611;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=I5GYGTvvka1UPwhF7BsxGakIQMmjnL36mOMAL/QT/0I=;
        b=RpNyqe4beE/QrkkoHzeBMP/RQZIhkzrRVdHIQTAca1VfbLMcyKZ8JD6Zl0JVCb6vy9kxaU
        1GfA3dMpU730EwBlP03chyHLR3yWoUagp+2F/uJr9xz9KHr4FJoqp+/mLZwiIYjcTEzIFG
        EWGihIhmk/FuMuBkDVPIx5o6douttNA=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-602-Vf1SHmp7OaGRexVdm9xAwQ-1; Thu, 23 Sep 2021 05:00:10 -0400
X-MC-Unique: Vf1SHmp7OaGRexVdm9xAwQ-1
Received: by mail-ed1-f70.google.com with SMTP id m30-20020a50999e000000b003cdd7680c8cso6100456edb.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Sep 2021 02:00:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=I5GYGTvvka1UPwhF7BsxGakIQMmjnL36mOMAL/QT/0I=;
        b=PZ8fsalWW+iui9ldWX0fwxjQKc83ZF7A/uJTOf8mSdmB8ISfZD35mY/QG77SCJCoUJ
         4zD3cmIFPmEt+ZiTIxOhL2EMjxv/21+CPAp/mR+MRAX6sQDbGbth791ghoDlF31exvpk
         inwG/GxZCkX3gZ12E5ATZd6vzFmqrhEff+HguBtxkohIBrrhVL+hcqYz7vzVi3CsBolW
         uoyEMdPVF6CLDdUrpY9VxlVmHbRjPVw+uq2sRZJcPPXZlgrrw8YRnSmTUvU0Z7UiSj9L
         dKAWa4E44y0CjWWsb6VoLvRAU/OBBq02PyYLBK1PirlyNGQ7qamje769eyc/vRamYHyU
         m7Tw==
X-Gm-Message-State: AOAM532tbraG/FYoCrFKKanSmhH+bSRagJP/vz1SmkcOl+3OharyuMCv
        DOVRlo87rGev9j46QAHpAohdjcmjOBu3tXleortMBE05u6BoHmXCIxFPskXxZdXCV70jLNwHYnN
        6O2YFRtIY7398mE5O0Jioo4bgQpN6vUjB0KZhPx5Z8zK5VOPVMeNJ6yk5vdIxbcsBow7M1c0oQT
        ZSK+mHuYwxvQ==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr4057222edj.203.1632387609096;
        Thu, 23 Sep 2021 02:00:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJY0wT/lcKZkuHohO2pW8YJ/lj0ZFTT+q5XWmrHN8cDUoTeID2fUnNzfAK8MKr9XC3KQk0qQ==
X-Received: by 2002:a50:d84c:: with SMTP id v12mr4057195edj.203.1632387608783;
        Thu, 23 Sep 2021 02:00:08 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id z18sm2941088edq.29.2021.09.23.02.00.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 23 Sep 2021 02:00:07 -0700 (PDT)
Subject: Re: Touchpad stickiness on Dell Inspiron/XPS
To:     Andrea Ippolito <andrea.ippo@gmail.com>, dmitry.torokhov@gmail.com,
        Alex Hung <alex.hung@canonical.com>
Cc:     linux-i2c@vger.kernel.org, linux-input@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <CAGhUXvBw4rzCQrqttyyS=Psxmhppk79c6fDoxPbV91jE7fO_9A@mail.gmail.com>
 <CAGhUXvDNj2v3O==+wWWKPYVzej8Vq+WNiBtPwmYxSQ2dTuLb9Q@mail.gmail.com>
 <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <70cbe360-6385-2536-32bd-ae803517d2b2@redhat.com>
Date:   Thu, 23 Sep 2021 11:00:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <CAGhUXvC8eHfxEKzkGN06VvRU6Z0ko7MJ9hF6uXNq+PxRZSbEmQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Andrea,

On 9/23/21 10:47 AM, Andrea Ippolito wrote:
> Hello,
> 
> has anyone had a chance to have a look at this report, and can help
> making some progress on the investigation?
> 
> Please let me know if there are more suitable channels for this, since
> most of the things I see in these mailing lists are patches and code
> reviews, not really reports and discussions around ongoing issues.

Right, bugs are usually discussed in bugzila, you could consider
filing a bug here:

https://bugzilla.kernel.org/enter_bug.cgi?product=Drivers

But I must be honest here, I don't see much progress being made
on this until someone with a significant amount of kernel / hw-enablement
experience gets it hands on one of these models. Either because some
company wants to run Linux on an affected model and ends up paying
someone to look at this, or because someone with the necessary
skills happens to buy one and then gets annoyed enough by this to sink
enough time into the issue to figure things out.

This hw is still relatively new, so with some luck someone accidentally
fixes this while fixing another issue, which happens to have the
same root cause.

Short of one of these 2 happening I don't see this getting resolved
anytime soon. By all means, do file a bug for this, I just want to
set expectations about the (un)likelyness of this getting fixed
(or the bug getting much attention in general) beforehand.

Regards,

Hans



> 
> Thanks a lot in advance.
> 
> Regards,
> Andrea IPPOLITO
> 
> Il giorno ven 27 ago 2021 alle ore 08:57 Andrea Ippolito
> <andrea.ippo@gmail.com> ha scritto:
>>
>> (resending as plain text)
>>
>> Hello everyone,
>>
>> I hope I find you well.
>>
>> I am writing this to report a touchpad issue faced by me and several
>> other DELL users across several different distros (HW defect has been
>> ruled out by people unable to reproduce on Windows).
>>
>> First thing that came to mind was to report this to the libinput
>> project, which I did here:
>>
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618
>>
>> A similar report by another user followed shortly after:
>>
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/636 (will be
>> closed as dupe eventually, so please keep #618 as reference)
>>
>> Issue has been also reported by yet another user on reddit:
>>
>> https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5ddy07/
>> and https://www.reddit.com/r/linuxhardware/comments/ofbzg3/dell_xps_15_9510_experience/h5zjwc8/?utm_source=reddit&utm_medium=web2x&context=3
>>
>> And finally, I have reported it on the DELL user forums (no help
>> whatsoever from DELL):
>>
>> https://www.dell.com/community/Inspiron/Tiger-Lake-DELL-Inspiron-Touchpad-Cursor-temporarily-drops/m-p/8021753#M126292
>>
>> The investigation on the libinput side appears to be complete, as
>> maintainers didn't spot anything weird there (also, the issue is also
>> reproducible with the synaptics lib, suggesting that this might be
>> lower level).
>>
>> Robert Martin suggested to raise this to you now, as per comment:
>>
>> https://gitlab.freedesktop.org/libinput/libinput/-/issues/618#note_1042277
>>
>> I'm kind of new to Linux mailing lists and bug reporting, so please
>> forgive me if I'm violating some rules or etiquette, I'd be glad to
>> rectify if that's the case.
>>
>> I also don't know what is the best way to keep the conversation going,
>> e.g. if there's an issue tracker or instead mailing lists are the
>> preferred choice.
>>
>> You should find some interesting data in the above mentioned reports
>> already, if not, please don't hesitate to let me know or chime in on
>> libinput issue #618 directly.
>>
>> Thanks a lot in advance.
>>
>> Kind regards,
>> Andrea IPPOLITO
> 

