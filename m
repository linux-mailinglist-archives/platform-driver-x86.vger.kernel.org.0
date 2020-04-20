Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id E6A241B10A3
	for <lists+platform-driver-x86@lfdr.de>; Mon, 20 Apr 2020 17:46:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729459AbgDTPq2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 20 Apr 2020 11:46:28 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:59796 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726931AbgDTPq2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 20 Apr 2020 11:46:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1587397586;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=gLHxi4Hu3j2YEIGoVcQy6We5qDF7KD9rRyHKv+349FQ=;
        b=OCqw2sMwRdfLVdskuvqLVErs5gf+iMgquTvMewKtgLNSfBw8TV+sRtt3UTA0Vs98oc9hhs
        Y8eG6JaDy7iIitBbPnK0yCwWMBGinZS7cwxnNPK4YtlGk9Te2txXhySfcmoX7a0pW8F4Jk
        Zfj24DRUOQTHkEaS7zhmppxGXitB9Cg=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-198-gsSmE16sNaKdWoPpOPtrAQ-1; Mon, 20 Apr 2020 11:46:21 -0400
X-MC-Unique: gsSmE16sNaKdWoPpOPtrAQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 32D4213F9;
        Mon, 20 Apr 2020 15:46:20 +0000 (UTC)
Received: from prarit.bos.redhat.com (prarit-guest.7a2m.lab.eng.bos.redhat.com [10.16.222.26])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 6C8BF5C1B2;
        Mon, 20 Apr 2020 15:46:19 +0000 (UTC)
Subject: Re: [PATCH] intel-speed-select: Fix speed-select-base-freq-properties
 output on CLX-N
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20200420141054.26173-1-prarit@redhat.com>
 <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
From:   Prarit Bhargava <prarit@redhat.com>
Message-ID: <d0bfcbfe-4834-624f-b590-1aa93970e5a4@redhat.com>
Date:   Mon, 20 Apr 2020 11:46:18 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <CAHp75VfKCuX1CNMaVLeghdoP9-KHh3+1yuFVgU8qhRbKi69JNQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 4/20/20 11:43 AM, Andy Shevchenko wrote:
> On Mon, Apr 20, 2020 at 6:11 PM Prarit Bhargava <prarit@redhat.com> wrote:
>>
>> On CLX-N, the perf-profile-level's output is terminated before the
>> speed-select-base-freq-properties are output which results in a corrupt
>> json file.
>>
>> Adjust the output of speed-select-base-freq-properties by one on CLX-N.
>>
> 
> Thanks for the patch, it will be pulled from Srinivas' tree whenever
> he sends a PR to PDx86 mailing list.

Srinivas, OOC do you want these patches to be sent somewhere else?  FWIW, I'm
running get_maintainers.pl to get the mailing list and cc.

P.

> 
> 
>> Signed-off-by: Prarit Bhargava <prarit@redhat.com>
>> Cc: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
>> Cc: platform-driver-x86@vger.kernel.org
>> ---
>>  tools/power/x86/intel-speed-select/isst-display.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/tools/power/x86/intel-speed-select/isst-display.c b/tools/power/x86/intel-speed-select/isst-display.c
>> index 51dbaa5f02ec..f6e2ce181123 100644
>> --- a/tools/power/x86/intel-speed-select/isst-display.c
>> +++ b/tools/power/x86/intel-speed-select/isst-display.c
>> @@ -470,7 +470,7 @@ void isst_ctdp_display_information(int cpu, FILE *outf, int tdp_level,
>>                                 _isst_pbf_display_information(cpu, outf,
>>                                                               tdp_level,
>>                                                           &ctdp_level->pbf_info,
>> -                                                             level + 1);
>> +                                                             level + 2);
>>                         continue;
>>                 }
>>
>> --
>> 2.18.2
>>
> 
> 

