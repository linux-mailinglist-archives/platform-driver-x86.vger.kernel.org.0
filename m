Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id D537151AC06
	for <lists+platform-driver-x86@lfdr.de>; Wed,  4 May 2022 20:00:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1376804AbiEDSEb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 4 May 2022 14:04:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354203AbiEDSDj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 4 May 2022 14:03:39 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA54067D0D
        for <platform-driver-x86@vger.kernel.org>; Wed,  4 May 2022 10:18:31 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2f7c57ee6feso23134867b3.2
        for <platform-driver-x86@vger.kernel.org>; Wed, 04 May 2022 10:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=KpAOxxOf7dU4bz8u2U7bfhJXhIQjrXtTa2p/W0o7V3Y=;
        b=coBaUgZ8nAbhXF75cSRyU/lfmoIyr1FUM46WAH6fhjtBUXT/Nx8Wf7MV8Dkh8xh9oK
         X8dtKhwAxw1EvyVSgDqRhnWfwYnP70rdyajaB20fsCPMOY3lDeCvLMUSi5bOMKP9CYc8
         kJmVraTaif4Gm8PiIZDP5Mtbedu7YE+PK9rDpgY5aLIOmsUkbbo3MaDj6S5fFUFlRE16
         bz+y6H0we9f0u70e1e/TTPl8L21b+xD8IIXg9rE0Wg3yRpdSJElYRj9sMCaFT8XmINNF
         nKHUqHXJlSI7aRuFyBrCcUmmSxL15dIdU76ZffLWHdnK79t7Yhd+fhqvMDLsPiFsPQug
         1dJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=KpAOxxOf7dU4bz8u2U7bfhJXhIQjrXtTa2p/W0o7V3Y=;
        b=Br44uzMB1bNW5MCNSh6OnMMv4QuyeuTDDLjarhKQivDxg+S0bX4YzKG/1KyoSzqeg0
         hYmjNnIqoV83fzu0bpolqU7zptHM6SMOBv8MIpJUZLqgI+cGCd/9Pc1+tPPAT5bwfueI
         xdfIuUc4i7EYhpuJDBf9lvl3slnToPH1oNyEyV/LN2SirKAsUH9WQbX7S0HnXyxRB4mj
         rY8rcTnYXcPUKMlv4X48DJxDs/fPm3GVfWycTZUS2M3Gv7B0/6pkAUSkjsHltxATPF0c
         akO/5FUo1gZQKzO6BmyOl+jx4jbY5m7/2SmpICyE1gmSr7hmVXa+W++PvR+/XztA/1jt
         2K9Q==
X-Gm-Message-State: AOAM530y90oy5TsjEXLcjuxgM42vGvZWBZShg3WnwZwqnEV16DSde+6N
        jDHgnF+njeGTANm/6ZvLKYtV5mH8Mj5pKOlyJ4mwSg==
X-Google-Smtp-Source: ABdhPJxj+owUt6AMy/MB/Z+aRoj7N/0E+jAUcqThp2az4JwzbWnd6PCSs6wI5f+Eju46sPuKqYdXySzwau+YXOo+daM=
X-Received: by 2002:a81:cf02:0:b0:2d0:b68c:cf30 with SMTP id
 u2-20020a81cf02000000b002d0b68ccf30mr21128156ywi.510.1651684711003; Wed, 04
 May 2022 10:18:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a81:10a:0:0:0:0:0 with HTTP; Wed, 4 May 2022 10:18:30 -0700 (PDT)
In-Reply-To: <YnKr+aMf4PspDpHZ@zn.tnic>
References: <20220429201717.1946178-1-martin.fernandez@eclypsium.com> <YnKr+aMf4PspDpHZ@zn.tnic>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Wed, 4 May 2022 14:18:30 -0300
Message-ID: <CAKgze5YDD02AsrF0yESv2sptZ4qxyTMgCDmnOKcbQWjKQsJRsw@mail.gmail.com>
Subject: Re: [PATCH v8 0/8] x86: Show in sysfs if a memory node is able to do encryption
To:     Borislav Petkov <bp@alien8.de>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        tglx@linutronix.de, mingo@redhat.com, dave.hansen@linux.intel.com,
        x86@kernel.org, hpa@zytor.com, ardb@kernel.org,
        dvhart@infradead.org, andy@infradead.org,
        gregkh@linuxfoundation.org, rafael@kernel.org, rppt@kernel.org,
        akpm@linux-foundation.org, daniel.gutson@eclypsium.com,
        hughsient@gmail.com, alex.bazhaniuk@eclypsium.com,
        alison.schofield@intel.com, keescook@chromium.org
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 5/4/22, Borislav Petkov <bp@alien8.de> wrote:
> On Fri, Apr 29, 2022 at 05:17:09PM -0300, Martin Fernandez wrote:
>> Show for each node if every memory descriptor in that node has the
>> EFI_MEMORY_CPU_CRYPTO attribute.
>>
>> fwupd project plans to use it as part of a check to see if the users
>> have properly configured memory hardware encryption
>> capabilities. fwupd's people have seen cases where it seems like there
>> is memory encryption because all the hardware is capable of doing it,
>> but on a closer look there is not, either because of system firmware
>> or because some component requires updating to enable the feature.
>
> Hm, so in the sysfs patch you have:
>
> +               This value is 1 if all system memory in this node is
> +               capable of being protected with the CPU's memory
> +               cryptographic capabilities.
>
> So this says the node is capable - so what is fwupd going to report -
> that the memory is capable?
>
> From your previous paragraph above it sounds to me like you wanna
> say whether memory encryption is active or not, not that the node is
> capable.
>
> Or what is the use case?

The use case is to know if a user is using hardware encryption or
not. This new sysfs file plus knowing if tme/sev is active you can be
pretty sure about that.

>> It's planned to make it part of a specification that can be passed to
>> people purchasing hardware
>
> So people are supposed to run that fwupd on that new hw to check whether
> they can use memory encryption?

Yes

>> These checks will run at every boot. The specification is called Host
>> Security ID: https://fwupd.github.io/libfwupdplugin/hsi.html.
>>
>> We choosed to do it a per-node basis because although an ABI that
>> shows that the whole system memory is capable of encryption would be
>> useful for the fwupd use case, doing it in a per-node basis gives also
>> the capability to the user to target allocations from applications to
>> NUMA nodes which have encryption capabilities.
>
> That's another hmmm: what systems do not do full system memory
> encryption and do only per-node?
>
> From those I know, you encrypt the whole memory on the whole system and
> that's it. Even if it is a hypervisor which runs a lot of guests, you
> still want the hypervisor itself to run encrypted, i.e., what's called
> SME in AMD's variant.

Dave Hansen pointed those out in a previuos patch serie, here is the
quote:

> CXL devices will have normal RAM on them, be exposed as "System RAM" and
> they won't have encryption capabilities.  I think these devices were
> probably the main motivation for EFI_MEMORY_CPU_CRYPTO.
