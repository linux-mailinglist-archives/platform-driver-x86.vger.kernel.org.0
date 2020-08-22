Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 15D4824E477
	for <lists+platform-driver-x86@lfdr.de>; Sat, 22 Aug 2020 03:31:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725903AbgHVBbz (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 21:31:55 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:28567 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725883AbgHVBby (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 21:31:54 -0400
Received: from [100.112.6.216] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id 7A/AD-10081-785704F5; Sat, 22 Aug 2020 01:31:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpkleJIrShJLcpLzFFi42JJl3vFptte6hB
  vMGOVisWDuekWsw/bWMx5tpbRoqmzic1i9Z4XzA6sHpNmzmD2+H2A0WP3gs9MHu/3XWXz+LxJ
  LoA1ijUzLym/IoE14+9LxYJGiYoNE9cwNjDuEO5i5OIQEvjPKDHvXTszhHOfUaKh+yVrFyMnh
  7BAvMT/JwvYQWwRAVOJX/OmsIMUMQvMYZLYcesdI0THJmaJpwuvsoFUsQloS2zZ8gvI5uDgFb
  CV6NnABBJmEVCVeNuzkBHEFhWIlVg+9Q/YAl4BQYmTM5+wgNicQPF93xcxg9jMAhYSM+efZ4S
  wxSVuPZnPBGHLS2x/OwesRgLIfvH6FCOEnSCx7OUd5gmMgrOQjJ2FZNQsJKNmIRm1gJFlFaNp
  UlFmekZJbmJmjq6hgYGuoaGRromusYleYpVusl5psW5qYnGJrqFeYnmxXnFlbnJOil5easkmR
  mDMpBSwKO1gbH7zQe8QoyQHk5Iob2egQ7wQX1J+SmVGYnFGfFFpTmrxIUYZDg4lCd4JxUA5wa
  LU9NSKtMwcYPzCpCU4eJREeC+WAKV5iwsSc4sz0yFSpxgVpcR594EkBEASGaV5cG2wlHGJUVZ
  KmJeRgYFBiKcgtSg3swRV/hWjOAejkjDvWpApPJl5JXDTXwEtZgJabJ1rC7K4JBEhJdXA5MaY
  dk/yX09JC8P03KDr/KzBJ9/cmfe14WnZxePPZR5pdJ/Is2yoNwgPW+W24HGLgLLMmimXtHNq7
  zzffDSozOKsV0ebjPoijllx+YF3rUoE92n+kT34RmkST+8kccV9G+8eufOqvnGPpLxT6dJMMe
  aSMCOzeelSUr3XnrMde3aoYINP88p0jd9ZyUm1G7QilkTYez/l1Z/FkhvEu0umftqjrt/rS/I
  bJHZW+zdeyGc2UHmV0SFctoX/XL3mp+//Z33PvfJj1p9GzzwJiUe5Eyy5b/p1X9mgJt7gvE2L
  0ePVXI8E87WuWxvXKEYY/nXb06zw87HXle2TkraJzlPIqTkZYcA/RfLgRuOtD32VWIozEg21m
  IuKEwFHh4nylAMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-14.tower-415.messagelabs.com!1598059909!576670!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20093 invoked from network); 22 Aug 2020 01:31:51 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-14.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Aug 2020 01:31:51 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id A2216321A69E31BFDA08;
        Sat, 22 Aug 2020 09:31:47 +0800 (CST)
Received: from [10.46.49.59] (10.46.49.59) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 21 Aug
 2020 18:31:43 -0700
Subject: Re: [External] RE: [PATCH v2] platform/x86: thinkpad_acpi:
 performance mode interface
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>
CC:     "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
References: <markpearson@lenovo.com>
 <20200821175310.335873-1-markpearson@lenovo.com>
 <DM6PR19MB2636F1CFCE1E386D6E793E25FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <1806c4ec-6788-bcc7-7e09-8e5274d2b9d5@lenovo.com>
 <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
 <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
 <DM6PR19MB263621A07F59D91C8E2F7205FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <52fc84b9-f87d-c91d-4d24-1db768c5c812@lenovo.com>
Date:   Fri, 21 Aug 2020 21:31:42 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB263621A07F59D91C8E2F7205FA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.49.59]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 8/21/2020 4:43 PM, Limonciello, Mario wrote:
>> -----Original Message----- From: Mark Pearson 
>> <markpearson@lenovo.com> Sent: Friday, August 21, 2020 15:06
>> 
>> On 8/21/2020 4:00 PM, Limonciello, Mario wrote: <snip>
>>>>>> + +The sysfs entry provides the ability to return the 
>>>>>> current status and to set the +desired mode. For example::
>>>>>>  + +        echo H > 
>>>>>> /sys/devices/platform/thinkpad_acpi/dytc_perfmode + echo M
>>>>>>> /sys/devices/platform/thinkpad_acpi/dytc_perfmode + echo
>>>>>> L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode +
>>>>> 
>>>>> I was thinking about this some more, do you actually want 
>>>>> another mode that "disables" this feature?   IE "O" turns it
>>>>>  off an calls DYTC_DISABLE_CQL.
>>>>> 
>>>>> For example if a user wanted to test the recently landed code
>>>>> in thermald 2.3 and compare performance between the two it
>>>>> seems like this and that "might" fight. As an outsider 
>>>>> looking in - I of course may be wrong too here.
>>>>> 
>>>>> If at some point in the future thermald does a better job 
>>>>> than this implementation you might also want an "out" to let
>>>>>  thermald or another piece of userland turn this off if it's
>>>>>  in the picture.
>>>>> 
>>>> I'm still digging into this one. Right now I haven't found a 
>>>> good clean way of just disabling the firmware. Currently when 
>>>> thermald goes in and tweaks the CPU power registers it has the
>>>>  effect of overriding the FW anyway - but I appreciate that's 
>>>> not quite the same as actually doing it explicitly.
>>>> 
>>> 
>>> What about a modprobe parameter to disable at least?  That would
>>>  at least make it pretty easy to make a change, reboot and 
>>> compare with thermald (or other software) without disabling the 
>>> rest of the functionality of the thinkpad_acpi driver.
>>> 
>> The problem is I don't have a good way to disable the firmware 
>> (that I know of yet) so a modprobe parameter wouldn't really do 
>> much. I guess it could skip providing the sysfs entry points - but
>>  the FW will still be there doing it's thing, so I'm not sure I see
>>  the benefit of that. At least the sysfs entry point gives a bit 
>> more insight into what is going on. Let me know if I'm missing 
>> something obvious.
>> 
> 
> Oh so it's not actually the driver loading tells the firmware it's 
> supposed to work this way.  The firmware actually detects "I'm 
> running on Linux, so I'll do this differently"?
> 
Right. This patch is just providing a more friendly interface so user 
space can see what is going on and be able to do control of the 
different modes without the need for hotkeys.

Afraid I don't have much insight into the nitty gritty details of 
exactly how that works - I believe it's related to detecting the use of 
DPTF but the details aren't shared with me because of NDA's. As a 
thought it's quite possible (probable?) that if thermald is using DPTF 
the firmware will automatically disable itself. Proving that might be 
tricky - I'll see if the firmware team have any ideas.

Mark
