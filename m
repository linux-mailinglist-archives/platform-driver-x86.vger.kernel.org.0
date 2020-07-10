Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2C41A21B50B
	for <lists+platform-driver-x86@lfdr.de>; Fri, 10 Jul 2020 14:28:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726867AbgGJM21 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 10 Jul 2020 08:28:27 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:50388 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726725AbgGJM20 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 10 Jul 2020 08:28:26 -0400
Received: from [100.112.131.194] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id 27/02-15041-7EE580F5; Fri, 10 Jul 2020 12:28:23 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmleJIrShJLcpLzFFi42JJl3vFpvs8jiP
  e4NQDFouXEw4zWjyYm27x5vh0JovZh20s5jxby2ixes8LZgc2j52z7rJ7/D7A6LF7wWcmj/f7
  rrJ5fN4kF8AaxZqZl5RfkcCasfXQdvaCJoGKl6+XszcwfuHpYuTiEBL4zyjRtXs3E4TzkFFia
  vttIIeTQ1ggXuL/gWZmEFtEIFSi/edVVpAiZoFZTBLTTk9kgeiYwiTxcOpFNpAqNgFtiS1bfo
  HZvAK2EscnXwOzWQRUJbrndLGA2KICsRK/2g8yQ9QISpyc+QQszikQKHH+7DNWEJtZwEJi5vz
  zjBC2uMStJ/OZIGx5ie1v54D1SggoSFzc1s8GYSdILHt5h3kCo+AsJGNnIRk1C8moWUhGLWBk
  WcVokVSUmZ5RkpuYmaNraGCga2hopGtobKhrZGiml1ilm6hXWqxbnlpcomukl1herFdcmZuck
  6KXl1qyiREYRykFzTd2MM5680HvEKMkB5OSKO+0j+zxQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lC
  R4C2M54oUEi1LTUyvSMnOAMQ2TluDgURLh3RQDlOYtLkjMLc5Mh0idYlSUEueVAOkTAElklOb
  BtcHSyCVGWSlhXkYGBgYhnoLUotzMElT5V4ziHIxKwryXQMbzZOaVwE1/BbSYCWjxUQ42kMUl
  iQgpqQamXT57Fy63Mmbb0l0Zlabec9OrfbbPjKctR9U5ZCtvbdtZkCdYefAin9HxPZrVt5gcP
  qeWx8/5d5Fd8wp3Vva+O7dnPGM77ml05gzvBK2LTH9qJu8RmbTzjL5KYcin3KAXx4JMq2MN12
  0XvJ7+fpPk3vLYoofMTMYbd+lwP5yl+2rFm8ZzLg6aKzh33tC7surjO9aQye9PvLg+wWO1xP0
  7LzKa7KsXHM5Ld98o3HtrwYdz8X9a99acXXxSZkV9S/4Gtto1u4Wbdwr/PqqRpSL2TeRD581t
  jwQiAh59lArT7DgT11b9tNAmdm6Z388Zgny7/eIc11wSnC93dhProfPRp/8rRU7ufOnVbK9x2
  VqzXImlOCPRUIu5qDgRAP+Jj7OeAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-27.tower-326.messagelabs.com!1594384100!58578!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24716 invoked from network); 10 Jul 2020 12:28:22 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-27.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 10 Jul 2020 12:28:22 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id DB020BC103158074BEEF;
        Fri, 10 Jul 2020 20:28:18 +0800 (CST)
Received: from [10.38.58.247] (10.38.58.247) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 10 Jul
 2020 05:28:16 -0700
Subject: Re: [External] Re: [PATCH v5] platform/x86: thinkpad_acpi: lap or
 desk mode interface
To:     Andy Shevchenko <andy.shevchenko@gmail.com>,
        Hans de Goede <hdegoede@redhat.com>
CC:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        Bastien Nocera <bnocera@redhat.com>
References: <markpearson@lenovo.com>
 <20200703012353.26413-1-markpearson@lenovo.com>
 <CAHp75Vcs15wGCzwW8Pq7AXyqQnvnopNdFP1nDE0nf+ZTz=9zFw@mail.gmail.com>
 <7c1698a6-ebd6-553d-a686-d9bd4e5a5e99@redhat.com>
 <CAHp75Ve-qOs8VosoxEaHH1EnK-r16Sx0ki3uj14yZJWyuwC88w@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <fbbaa036-2bd5-b1cc-862e-f006e9fbefde@lenovo.com>
Date:   Fri, 10 Jul 2020 08:28:15 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CAHp75Ve-qOs8VosoxEaHH1EnK-r16Sx0ki3uj14yZJWyuwC88w@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.58.247]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org



On 7/10/2020 8:20 AM, Andy Shevchenko wrote:
> On Fri, Jul 10, 2020 at 11:00 AM Hans de Goede <hdegoede@redhat.com> wrote:
>>
>> Hi,
>>
>> On 7/9/20 8:02 PM, Andy Shevchenko wrote:
>>> On Fri, Jul 3, 2020 at 4:24 AM Mark Pearson <markpearson@lenovo.com> wrote:
>>>>
>>>> Newer Lenovo Thinkpad platforms have support to identify whether the
>>>> system is on-lap or not using an ACPI DYTC event from the firmware.
>>>>
>>>> This patch provides the ability to retrieve the current mode via sysfs
>>>> entrypoints and will be used by userspace for thermal mode and WWAN
>>>> functionality
>>>
>>> Hans, do you think it's good to have custom ABI for this? I think you
>>> may be know better what types of ABI we already have for such thing.
>>
>> Actually, Mark asked me the same question before submitting his
>> patch upstream. I'm never a fan of custom ABI for this. But for now
>> the solution Lenovo has chosen to deal with thermal management
>> issues on modern hw is unique to Lenovo and we do not have anything
>> like this anywhere else.
>>
>> So for now I believe that a custom ABI is best.
>>
>> If we see this becoming a common feature on more platforms then we can
>> design a generic API for it once we have a better idea how this would
>> look like when implemented by others and then thinkpad_acpi can easily
>> add support for the new generic interface, while keeping its own
>> custom interface for backward compatibility.
> 
> Thank you very much for the elaborative comment, appreciated!
> 
Yes, thanks Hans from me too.

Just to note, I'm very happy to work on or contribute to a generic 
framework if that makes sense in the future. I'd likely need some help & 
guidance on the best way to do it but if you see a need let me know.

Andy - let me know if you need anything else for this patch. I have a 
follow on patch for a similar sensor that I'll send up once this one is 
approved - I figured we should learn from our mistakes on this one 
before duplicating the errors.

Thanks all for the support, reviews and guidance

Mark

