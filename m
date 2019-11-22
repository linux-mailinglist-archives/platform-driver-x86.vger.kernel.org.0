Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2383810794E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Nov 2019 21:13:23 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726952AbfKVUNW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 22 Nov 2019 15:13:22 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:37258 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726568AbfKVUNW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 22 Nov 2019 15:13:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1574453600;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=jILQpxXhvq27WfP/rD50ZUGDRcoN9XNDzE6oWorCIIQ=;
        b=WPdLQjIQy2BC0+49aqJXyViEYOkNd4leoDodve1G8beyuto+dknT61cRJaa6qZBgdTcZ5U
        LBB+filBEMerjiEiv4rQoArLVmQZlHpDpWOC3RqZtIA32FWdfWIhhPHlI72k1PjIz1xLu7
        IlSa6OBa/q3ar7k9PI470pLkYpb3Opw=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-75-be2bmblMNYW6-bnrW75Wbw-1; Fri, 22 Nov 2019 15:13:19 -0500
Received: by mail-wr1-f69.google.com with SMTP id m17so4325070wrn.23
        for <platform-driver-x86@vger.kernel.org>; Fri, 22 Nov 2019 12:13:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MdUD/Y+Dy/3zf5C+IMCOXgNmvV+Aj8dFqxA2tJ53grc=;
        b=Z+bMfI5fbEhWeDQ6pjQEbWSDdeQmhqUGjdeKEwFDMdVbZ3uGSpFuUM8cjrVfC9i5cR
         jzAsQOrp4cVEbckhQAEBnB0Pw03MLk6SchKj0r+mi0MI+JPnwWq2EcIuG3HVvYgaiNxY
         P2z08OXVzDBLe8NGGYP/T7oKJQrqdEAYinm/62+RiIWur13Q7GJKdrVBSBoH+moNN3Tt
         Ofm3U9OhRgG85iENVyCOQJn6FRuP+vKocubCpTnSiyeM7l7NrPPX+I8xJHGJHFU8ywzY
         cwLoijKs+z9xXr+hUy422CjmWVl7SnyoIvwuhR7/KKkCTsknYUkqJfeobpS+QCazNhOA
         fnzA==
X-Gm-Message-State: APjAAAUKxw72KtN04XrDA8uTVkGfRC/rNqqJc0SHvMsWqfjwWBDjBHzV
        uFTHN/V1u7R+1nw3gsjno2q1WEbqhJI2dYe7grviCw8DRCrburq5zqYz5MlHnIuEjluDCL5I36m
        qHLSf4c/1ng8vtNGXPehZzFGRLIB9iSAEgQ==
X-Received: by 2002:a7b:c8c6:: with SMTP id f6mr974536wml.13.1574453597645;
        Fri, 22 Nov 2019 12:13:17 -0800 (PST)
X-Google-Smtp-Source: APXvYqyxnCyVbBdHUGyJWf8cc0K/YniPZyhuT65K39O8SZdS1l0ueW3xW7JkP7MwCKgQPCgQu5plKA==
X-Received: by 2002:a7b:c8c6:: with SMTP id f6mr974515wml.13.1574453597424;
        Fri, 22 Nov 2019 12:13:17 -0800 (PST)
Received: from dhcp-44-196.space.revspace.nl ([2a0e:5700:4:11:6eb:1143:b8be:2b8])
        by smtp.gmail.com with ESMTPSA id b2sm8705213wrr.76.2019.11.22.12.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 Nov 2019 12:13:16 -0800 (PST)
Subject: Re: Bug Report - Kernel Branch 4.4.y - asus-wmi.c
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Bob Funk <bobfunk11@gmail.com>,
        Kristian Angelov <kristiana2000@abv.bg>
Cc:     Corentin Chary <corentin.chary@gmail.com>,
        acpi4asus-user <acpi4asus-user@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@gmail.com>
References: <82dfb75a-e743-e8db-df6f-22b768f7c112@gmail.com>
 <CAHp75VcHf94QWYsyRg7hYqGK4JCRSxxLZ_ziiF2rjqcKR8rPEA@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <7535264f-b8c9-7ba7-47b5-bd7415f109b3@redhat.com>
Date:   Fri, 22 Nov 2019 21:13:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VcHf94QWYsyRg7hYqGK4JCRSxxLZ_ziiF2rjqcKR8rPEA@mail.gmail.com>
Content-Language: en-US
X-MC-Unique: be2bmblMNYW6-bnrW75Wbw-1
X-Mimecast-Spam-Score: 0
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/22/19 12:31 PM, Andy Shevchenko wrote:
> +Cc: Kristian, Jo=C3=A3o, Hans
>=20
> It seems Kristian reported same (?)  / similar issue.

If some patch added to 4.4.x as a fix is causing issues it should IMHO
be reverted, for which you (Bob) should talk to the 4.4.x maintainer.

4.4.x is quite old and if the problem does not reproduce with mainline
kernels then I have little interest in debugging this.

Regards,

Hans



>=20
> On Fri, Nov 22, 2019 at 5:16 AM Bob Funk <bobfunk11@gmail.com> wrote:
>>
>> Hello,
>>
>> My apologies if you are receiving a duplicate of this message. I
>> attempted to email this earlier but was sent a delivery failure status
>> reply due to html content. I will attempt to resend it as plain text.
>>
>> Original Email:
>>
>> The 2019-01-26 commit to the asus-wmi.c driver code in the 4.4 kernel
>> branch has introduced a bug with several known models of EeePC netbooks.
>>
>> Description of Problem:
>> The bug occurs during boot, where the screen (possibly backlight?) will
>> shut off and display hotkeys are unable to bring it back on. The problem
>> is present on all kernels
>> since the 2019-01-26 commit. There have been several reports of the
>> issue in the slackware forum at linuxquestions.org
>>
>> Corrective actions taken so far:
>> Appending acpi_osi=3DLinux will circumvent the issue and keep the screen
>> on, but this causes several error messages
>> in the boot log about eeepc_wmi "failing to load both WMI and and legacy
>> ATKD devices", and warns not to use acpi_osi=3DLinux.
>>
>> Appending acpi_backlight=3Dvendor also prevents the screen from shutting
>> off during boot. However, pressing the brightness hotkeys
>> causes the system to hang.
>>
>> Reversing the asus-wmi.c patch that was committed on 2019-01-26 and
>> rebuilding the 4.4 series module also fixes the problem, and brightness
>> hotkeys work normally. The commit in question is
>> 0c4a25cc6f2934f3aa99a0bbfd20b71949bcad25
>>
>> Model I have tested this on: ASUS EeePC 1000H (Slackware 14.2, kernels
>> 4.4.201, 4.4.202)
>> Additional models reporting this issue: ASUS Eee PC 1005HAB, ASUS Eee PC
>> 1225b, ASUS Eee PC 1025c (Slackware 14.2, various kernels from 4.4.172
>> and higher)
>>
>> Additional Notes:
>> This problem seems to have been corrected in the 4.19 kernel branch, as
>> reported by several users in the slackware forum.
>> I attempted to test some of the fixes from the 4.19 code as patches to
>> the 4.4 code but had no success. There have been multiple
>> changes in that branch and I am unsure what exactly has corrected the
>> bug in that version.
>>
>> If there is any additional information that I can provide, please let me
>> know.
>>
>> Regards,
>>
>> Bob Funk
>=20
>=20
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20

