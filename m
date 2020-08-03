Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id AEE5923A861
	for <lists+platform-driver-x86@lfdr.de>; Mon,  3 Aug 2020 16:27:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727846AbgHCO1F (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 3 Aug 2020 10:27:05 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.5]:29822 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726358AbgHCO1E (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 3 Aug 2020 10:27:04 -0400
Received: from [100.112.130.41] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-a.us-west-2.aws.symcld.net id 17/4F-15041-6BE182F5; Mon, 03 Aug 2020 14:27:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupkleJIrShJLcpLzFFi42LJePGQV3ernEa
  8Qet2I4uXEw4zWjyYm25x/NtMdovZh20s5jxby2ixes8LZgc2j52z7rJ7/D7A6LF7wWcmj/f7
  rrJ5fN4kF8AaxZqZl5RfkcCacX1TP3vBW96K51c62RoY53B3MXJxCAn8Z5R4tXEJE4TzgFHi2
  sk/QA4nh7BAgcSVZ5uAbA4OEQF1ic1dKSA1zAI/GCU+zjzKBtEwjVFi/4udrCANbALaElu2/G
  IDsXkFbCVOtdxgBWlmEVCR2PReESQsKhArsXzqH1aIEkGJkzOfsIDYnAKBEmu2HwPbyyxgITF
  z/nlGCFtc4taT+VBxeYnmrbOZQWwJAQWJlr4NrBB2gsSyl3eYJzAKzkIydhaSUbOQjJqFZNQC
  RpZVjBZJRZnpGSW5iZk5uoYGBrqGhka6hkYWuoYW5nqJVbqJeqXFuuWpxSW6RnqJ5cV6xZW5y
  TkpenmpJZsYgTGUUtCwewfjy9cf9A4xSnIwKYnydoppxAvxJeWnVGYkFmfEF5XmpBYfYpTh4F
  CS4C2WBcoJFqWmp1akZeYA4xkmLcHBoyTCew0kzVtckJhbnJkOkTrFqCglznsWJCEAksgozYN
  rg6WQS4yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeStApvBk5pXATX8FtJgJaLHNBlWQxSWJ
  CCmpBiY5scps+8OclpP2cvtwe+S83LbG1X9fTLnacx09BT+lwtcLgi9fvLqjvMzS2u+cwvGOw
  DtObkwZfzu25c7q6BQJuNDr/nCO1Bs5Rd7JmcJO9xfJ7/3kyK6984h9acWc9ZF2VsfYr8teZ6
  nbMW3ZLtnorXvqDYXOfI6avtNR1kKv6uKJx08lGpQKis7d3SM/we7B4zveM91cN356N2ci05W
  HK03dVXXCmqK8mtet0TBtP2V90nbH5tjev71uB+b7XX+k9dlsk2OQ1o2lPjfuRf0WWDFhesfc
  IJ4j1o45fb7/Elb8XR9cdEL6xOmyY5/ZxdKTVXousbZaHpjDf8uWP67BL2QP8+Q0uzeTZ2poe
  CmxFGckGmoxFxUnAgCISpFDnAMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-336.messagelabs.com!1596464820!377!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 26824 invoked from network); 3 Aug 2020 14:27:01 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-9.tower-336.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 3 Aug 2020 14:27:01 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 00066D6763664E50F8C5;
        Mon,  3 Aug 2020 10:26:59 -0400 (EDT)
Received: from [10.38.102.51] (10.38.102.51) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Mon, 3 Aug 2020
 07:26:58 -0700
Subject: Re: [External] Re: [ibm-acpi-devel] [PATCH v5] platform/x86:
 thinkpad_acpi: lap or desk mode interface
To:     Elvis Stansvik <elvstone@gmail.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>, <andy.shevchenko@gmail.com>,
        "Nitin Joshi" <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>,
        "Bastien Nocera" <bnocera@redhat.com>
References: <CAHms=eZm3LY-Z4p+TkfZ+vyxGd_7XKPBsSEM_Mvnx2s-GO2c9w@mail.gmail.com>
 <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <0e462361-a3bc-a7b8-bacd-85f32b575bac@lenovo.com>
Date:   Mon, 3 Aug 2020 10:26:45 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <CAHms=eYpcy__Km_9O4MUtLxpasH1sAgQEmcapOhV79j01twhow@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.38.102.51]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Elvis,

On 8/3/2020 9:20 AM, Elvis Stansvik wrote:
> 
> Den sön 2 aug. 2020 kl 23:10 skrev Elvis Stansvik 
> <elvstone@gmail.com>:
>> 
>> (Apologies in advance for missing In-Reply-To header in this
>> reply. I subscribed to the list just now.)
>> 
>> Den fre 3 juli 2020 kl 01:24 skrev Mark Pearson 
>> <markpearson@lenovo.com>:
>>> Newer Lenovo Thinkpad platforms have support to identify whether 
>>> the system is on-lap or not using an ACPI DYTC event from the 
>>> firmware.
>>> 
>>> This patch provides the ability to retrieve the current mode via 
>>> sysfs entrypoints and will be used by userspace for thermal mode 
>>> and WWAN functionality
>> 
>> I tried the patch out on my X1C6 (20KH007BMX), running Lenovo 
>> firmware version 0.1.49.
>> 
>> The sysfs path /sys/devices/platform/thinkpad_acpi/dytc_lapmode is 
>> showing up, but it's reporting 0 regardless if the laptop is in my 
>> lap or on a desk.
>> 
>> I tested this by having the laptop in my lap for five minutes, and 
>> then on a desk for five minutes. The value reported through 
>> /sys/devices/platform/thinkpad_acpi/dytc_lapmode was always 0.
>> 
Thanks for the update.
The X1C6 doesn't have support for the new thermal mode implementation so 
I'm wondering if the lapmode being available could be related to the 
version of DYTC is available. I'll check with the firmware team and get 
back to you on that - they hadn't listed it to me as a limitation 
previously and unfortunately I don't have an X1C6 so didn't test on that 
platform.

As a note - the lapmode is primarily for the thermal modes (it is also 
being used for WWAN power control but that is not supported for Linux on 
the X1C6 either for other reasons). I'm afraid the interface is of 
limited use to you anyway....

Mark
