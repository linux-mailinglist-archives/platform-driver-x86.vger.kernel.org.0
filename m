Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 2EDCF5675D9
	for <lists+platform-driver-x86@lfdr.de>; Tue,  5 Jul 2022 19:35:24 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiGERfW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 Jul 2022 13:35:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbiGERfV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Jul 2022 13:35:21 -0400
Received: from mail-yw1-x1129.google.com (mail-yw1-x1129.google.com [IPv6:2607:f8b0:4864:20::1129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D3F51BEA7
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Jul 2022 10:35:20 -0700 (PDT)
Received: by mail-yw1-x1129.google.com with SMTP id 00721157ae682-2ef5380669cso116231907b3.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Jul 2022 10:35:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=eclypsium.com; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=N1RVv8GLah3jMA4qO6jppLWYR2xCPjLlybVcMFi9TkA=;
        b=XbUoFpk32JL+JGxIDO7PVWAY8WdDSLRS1iq3ntXuQM+1PWdVu30+UFGLgZ63ajxHMh
         l6CxkOFMRyYI85VpaVmv/O4B5HAi/wCgn/0pXNd+yjx+1+o4WA1lGl/38pLCNIVc7LgX
         s2+VolMOZXiNOaDOn31Y6AWXId+uhJmbj9+rpqKTX9Z0YRjjWgHNuqqBwmlZTKBVieVF
         Vw/ZD0Pv8fBHt9NIrvvnh/GFpTwzKY9QvStEHBluThfy9s0lFfam7fjTUNuXaD6A4AKq
         tMUmhaUdZFbapqU9oSdl3gjDgfoeCeKyrIOYQUqVBtsLNBQAeat1Oh/pU/a9nJGe78D+
         r3VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=N1RVv8GLah3jMA4qO6jppLWYR2xCPjLlybVcMFi9TkA=;
        b=RhHbZ7WGpxc24MpnlZ/fNS4qHlqQp9qq3G/0HJvqRryMsCHIZGpNx4DiDrxmxXOiWT
         Qi6St4Iobq3dhBO7m+p1YvNUvxCkzt81SIMHazyG7ZSRfPtDs3McFPeF1x/fioRPMAYc
         EFRlgy4veJG0tQ00Kd2Nsms3BuppJ8QaAOCt/4atFGH+XVTOhdgCeN4oDE51bu2q73Iq
         rKJLmHtutMsrlwZrn3fT4u31drtPXmYlgcJyloiHy//0kS/RIgvXb6qTJhtujSsORUpt
         KV1F5L6rq7l2T8hm90QKMvWvoHONdfXPimVROaMMOtFgjMQRiQncsQxkslqBK7fmcl8m
         qCEQ==
X-Gm-Message-State: AJIora+7IHpnfpJTdvfJMPMmcxCCahUA0xrd24KTcdCsXdOvQ6zPAcA2
        pC8yE9ezH8Hcgwb/t2UiOPhrkmWWvISJxDiw/WHPaQ==
X-Google-Smtp-Source: AGRyM1slzBuJVxbvk6YiQUttWqqnmkJPffeEwA+zeKfyrL6oTKEeCyul8ggbc1OS1eYwXXU9UdtHEhFAX11lTJVPIzk=
X-Received: by 2002:a0d:ca93:0:b0:31b:ac58:1047 with SMTP id
 m141-20020a0dca93000000b0031bac581047mr39435104ywd.323.1657042519381; Tue, 05
 Jul 2022 10:35:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0d:f944:0:0:0:0:0 with HTTP; Tue, 5 Jul 2022 10:35:18 -0700 (PDT)
In-Reply-To: <YsL6XCWmgiIeLKJ9@kroah.com>
References: <20220704135833.1496303-1-martin.fernandez@eclypsium.com>
 <20220704135833.1496303-10-martin.fernandez@eclypsium.com> <YsL6XCWmgiIeLKJ9@kroah.com>
From:   Martin Fernandez <martin.fernandez@eclypsium.com>
Date:   Tue, 5 Jul 2022 14:35:18 -0300
Message-ID: <CAKgze5aD3vJwMQwzJ1syzAKvSvPgYDFvtapDea_zBki5taoFEQ@mail.gmail.com>
Subject: Re: [PATCH v9 9/9] drivers/node: Show in sysfs node's crypto capabilities
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     linux-kernel@vger.kernel.org, linux-efi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-mm@kvack.org,
        kunit-dev@googlegroups.com, linux-kselftest@vger.kernel.org,
        tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        ardb@kernel.org, dvhart@infradead.org, andy@infradead.org,
        rafael@kernel.org, rppt@kernel.org, akpm@linux-foundation.org,
        daniel.gutson@eclypsium.com, hughsient@gmail.com,
        alex.bazhaniuk@eclypsium.com, alison.schofield@intel.com,
        keescook@chromium.org
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

On 7/4/22, Greg KH <gregkh@linuxfoundation.org> wrote:
> On Mon, Jul 04, 2022 at 10:58:33AM -0300, Martin Fernandez wrote:
>> Show in each node in sysfs if its memory is able to do be encrypted by
>> the CPU; on EFI systems: if all its memory is marked with
>> EFI_MEMORY_CPU_CRYPTO in the EFI memory map.
>>
>> Signed-off-by: Martin Fernandez <martin.fernandez@eclypsium.com>
>> ---
>>  Documentation/ABI/testing/sysfs-devices-node | 10 ++++++++++
>>  drivers/base/node.c                          | 10 ++++++++++
>>  2 files changed, 20 insertions(+)
>>  create mode 100644 Documentation/ABI/testing/sysfs-devices-node
>>
>> diff --git a/Documentation/ABI/testing/sysfs-devices-node
>> b/Documentation/ABI/testing/sysfs-devices-node
>> new file mode 100644
>> index 000000000000..0e95420bd7c5
>> --- /dev/null
>> +++ b/Documentation/ABI/testing/sysfs-devices-node
>> @@ -0,0 +1,10 @@
>> +What:		/sys/devices/system/node/nodeX/crypto_capable
>> +Date:		April 2022
>> +Contact:	Martin Fernandez <martin.fernandez@eclypsium.com>
>> +Users:		fwupd (https://fwupd.org)
>> +Description:
>> +		This value is 1 if all system memory in this node is
>> +		capable of being protected with the CPU's memory
>> +		cryptographic capabilities.  It is 0 otherwise.
>> +		On EFI systems the node will be marked with
>> +		EFI_MEMORY_CPU_CRYPTO.
>
> Where will such a node be "marked"?  I do not understand this last
> sentence, sorry, can you please reword this?

What I meant is that if all the memory regions in a given node are
flagged with EFI_MEMORY_CPU_CRYPTO then that file will hold a 1.

Maybe it's a little confusing if you don't know what
EFI_MEMORY_CPU_CRYPTO is.

> And why is EFI an issue here at all?

Checking for EFI_MEMORY_CPU_CRYPTO is the way to know if a memory
region is able to be encrypted by the CPU on EFI platforms. It's not
really an issue and it's currently the only implementation for this
file.

Is it clearer here?

  This value is 1 if the memory in this node is capable of being
  protected with the CPU's memory cryptographic capabilities.  It is 0
  otherwise.
  On EFI systems this means that all the memory regions of the node
  have the EFI_MEMORY_CPU_CRYPTO attribute set.

> thanks,
>
> greg k-h
>
