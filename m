Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B6FF66BD967
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Mar 2023 20:39:32 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229436AbjCPTjb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Mar 2023 15:39:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229802AbjCPTj3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Mar 2023 15:39:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D84226854
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 12:38:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1678995521;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=DrsdexTuopIeTtA+lpl9gElJgaVgw+CXQW9dVCSQk58=;
        b=jEA1M216MY7FpDtwGPgUBQ0wlcRYb7ipDeYUo7Go+7M+gbzLn5OzuQkq8G59TuNsjmZZgm
        hMLTEfC9RjFRBdhoc0zGq8d/DCIHuKJcHM2l+eT3BW/vvL1MXy1xsJ/prW8rIlkTwe3mPL
        smRAx+zPhEjXhc5zm4Wr/OM1luECmDY=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-219-7KMb99ePPp2LCPmMVtrf8g-1; Thu, 16 Mar 2023 15:38:39 -0400
X-MC-Unique: 7KMb99ePPp2LCPmMVtrf8g-1
Received: by mail-ed1-f70.google.com with SMTP id r19-20020a50aad3000000b005002e950cd3so4540289edc.11
        for <platform-driver-x86@vger.kernel.org>; Thu, 16 Mar 2023 12:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678995518;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DrsdexTuopIeTtA+lpl9gElJgaVgw+CXQW9dVCSQk58=;
        b=29YHlbCw+sWPjau79Xcxsia6A1gKDJtLrrVdrcWbhYkq0xCCOrSdMF8cZ6CJL6Gaz0
         VH1Fm/OpGaVZ3ojQFAxSyeURoU/qK2P2uLWdvbKxgP3WBHfL4yDQt0GTR76E7t0PH3Fr
         RBxobsyAHTYoZmQzX9k5B1OqKSUfZrbuFO2JEkNgYHE+rg3+SeYP1Vm8c/kS7S3PyXQS
         xo3Fw0GlrPni3/ZNzPcvjh/yI7tNaeUpkN8LzomcugseZjCOZ/w1QmGu+TfSJ5bqfsar
         eH7raGqntvkfmv1tGOMJWmncvGm3zt8pGFPHW7X3P6Hey1DU+HuZxcO+EXBefHLnYb4v
         D+Qg==
X-Gm-Message-State: AO0yUKUZV6x1g9szadh3gJlXeEhQLJxcz+xHz9bodHhvP0P4WnhHgP4C
        5Ehp48bXLissEoM/P2K0Endq+NbswexEP4unalPDaI5khwWhrSyQavwrbxzw2L6/hzlnlXwwQjE
        QV0+8XXCBTAYPx3t39cAF46COFEXgol+vIw==
X-Received: by 2002:aa7:cc8a:0:b0:4af:63a7:7474 with SMTP id p10-20020aa7cc8a000000b004af63a77474mr606975edt.17.1678995518608;
        Thu, 16 Mar 2023 12:38:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set99UEbPnuuTZmnOQukCyTBgTS+9LWWoyV4B/2IRIykoUnefR3TeHe9TGUH2J/cTDbErBabowQ==
X-Received: by 2002:aa7:cc8a:0:b0:4af:63a7:7474 with SMTP id p10-20020aa7cc8a000000b004af63a77474mr606964edt.17.1678995518350;
        Thu, 16 Mar 2023 12:38:38 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u20-20020a50a414000000b004fd1ee3f723sm166227edb.67.2023.03.16.12.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 12:38:37 -0700 (PDT)
Message-ID: <bafe3301-7a22-7944-ec80-9c64beb13a49@redhat.com>
Date:   Thu, 16 Mar 2023 20:38:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v3 6/8] platform/x86/intel/ifs: Implement Array BIST test
Content-Language: en-US, nl
To:     "Joseph, Jithu" <jithu.joseph@intel.com>, markgross@kernel.org
Cc:     tglx@linutronix.de, mingo@redhat.com, bp@alien8.de,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        gregkh@linuxfoundation.org, rostedt@goodmis.org,
        ashok.raj@intel.com, tony.luck@intel.com,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        patches@lists.linux.dev, ravi.v.shankar@intel.com,
        thiago.macieira@intel.com, athenas.jimenez.gonzalez@intel.com,
        sohil.mehta@intel.com
References: <20230214234426.344960-1-jithu.joseph@intel.com>
 <20230301015942.462799-1-jithu.joseph@intel.com>
 <20230301015942.462799-7-jithu.joseph@intel.com>
 <628e092c-793e-96ce-71f5-80392ad69569@redhat.com>
 <9dde72aa-a28d-2b0e-7b90-6b1996dbf202@intel.com>
 <f45c26ae-865b-b7b6-0f2a-5906d9c0a349@redhat.com>
 <74058e98-2bbc-3f36-7e3d-538fc2323264@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <74058e98-2bbc-3f36-7e3d-538fc2323264@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/16/23 19:11, Joseph, Jithu wrote:
> 
> 
> On 3/16/2023 2:59 AM, Hans de Goede wrote:
> 
>>
>> After taking a closer look I do see one unrelated issue with this patch
>> sysfs.c: run_test_store() does:
>>
>>         if (!ifsd->loaded)
>>                 rc = -EPERM;
>>         else
>>                 rc = do_core_test(cpu, dev);
>>
>> But AFAICT the loaded check really only applies to the first (intel_ifs_0 device) test type and the 
>> Array BIST test should work fine when loaded is false.
>>
>> So I think that the if (!ifsd->loaded) error check should be moved to 
>> ifs_test_core() ?
>>
> 
> It is possible that I misinterpreted your comment in my earlier reply. (Thanks Tony for pointing it out)

No you were right I was looking at the current code, not the code after this patch-set is applied.

> Yes I think moving the load check into ifs_test_core() is better than doing it in run_test_store()

Ack, doing that is still a cleaner way of dealing with this.

Regards,

Hans



