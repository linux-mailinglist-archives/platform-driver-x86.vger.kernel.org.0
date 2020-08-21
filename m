Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5E59024E1D0
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Aug 2020 22:06:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725834AbgHUUGO (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 21 Aug 2020 16:06:14 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.112]:35104 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725801AbgHUUGN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 21 Aug 2020 16:06:13 -0400
Received: from [100.112.4.225] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-c.us-east-1.aws.symcld.net id 5F/E1-04232-339204F5; Fri, 21 Aug 2020 20:06:11 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmleJIrShJLcpLzFFi42JJl3vFrmuk6RB
  vsPabusWDuekWsw/bWMx5tpbRoqmzic1i9Z4XzA6sHpNmzmD2+H2A0WP3gs9MHu/3XWXz+LxJ
  LoA1ijUzLym/IoE148en0+wFr/krGh7uZW1gfMbTxcjFISTwn1HiyJ+LzBDOQ0aJ5hcXGLsYO
  TmEBeIl/j9ZwA5iiwiYSvyaN4UdpIhZYA6TxI5b7xghOtYyScxacp4NpIpNQFtiy5ZfQDYHB6
  +ArcSmuf4gYRYBVYmWLVdYQGxRgViJ5VP/sILYvAKCEidnPgGLcwLFv95qAVvMLGAhMXP+eSh
  bXOLWk/lMELa8xPa3c5hBbAkBBYkZF+YxQdgJEste3mGewCg4C8nYWUhGzUIyahaSUQsYWVYx
  miUVZaZnlOQmZuboGhoY6BoaGuma6xpaGOslVukm65UW66YmFpfoGuollhfrFVfmJuek6OWll
  mxiBMZNSgH79h2MC9980DvEKMnBpCTKO1fIIV6ILyk/pTIjsTgjvqg0J7X4EKMMB4eSBK+0Cl
  BOsCg1PbUiLTMHGMMwaQkOHiUR3l8gad7igsTc4sx0iNQpRkUpcV53daCEAEgiozQPrg2WNi4
  xykoJ8zIyMDAI8RSkFuVmlqDKv2IU52BUEuYtBpnCk5lXAjf9FdBiJqDF1rm2IItLEhFSUg1M
  t6wWHHSYv2+d0cSbxl4KnxVnTfK7cMm2cWdhs+ayB2nMZ69PqdsSUiery5N67nn7/8tR9qXLh
  H537Dxbs71quuxGjy2FvYcSfiqZlb9y9r28o3pnqGXCkru/d6Se36M4485Jp/MRn/srH2469P
  IV8+tDRd6rdzucbW/4W3iwZVXkad2Z223avO4YlPJ42Wv43704p3/F5TuP3dfP94g782d/YvK
  U9sZ9/qY2vyp67in3SijyX+lrz5+5ZXqO6gODZ791O778vhLovMxV4kCMW7/uet91pjE9fLeW
  ztqzKjQiOOnCnoPaDTWvkhvXvXh/yuafoFvFq0YZHvVdQS1cYrpr160JY7NyZmKo2l2Xq8RSn
  JFoqMVcVJwIAFvUYEeWAwAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-4.tower-415.messagelabs.com!1598040368!1186248!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 2232 invoked from network); 21 Aug 2020 20:06:10 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-4.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 21 Aug 2020 20:06:10 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id AD13EB5BE4FE05DF0E42;
        Sat, 22 Aug 2020 04:06:06 +0800 (CST)
Received: from [10.46.48.149] (10.46.48.149) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 21 Aug
 2020 13:06:03 -0700
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
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <9e0c14a9-3b24-4b64-6d9e-b312d28dfd44@lenovo.com>
Date:   Fri, 21 Aug 2020 16:06:02 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26369308415B8235B3C9997EFA5B0@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.46.48.149]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 8/21/2020 4:00 PM, Limonciello, Mario wrote:
<snip>
>>>> + +The sysfs entry provides the ability to return the current
>>>> status and to set
>>>> the +desired mode. For example:: + +        echo H >
>>>> /sys/devices/platform/thinkpad_acpi/dytc_perfmode +        echo
>>>> M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode +
>>>> echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode +
>>> 
>>> I was thinking about this some more, do you actually want another
>>> mode that "disables"
>>> this feature?   IE "O" turns it off an calls DYTC_DISABLE_CQL.
>>> 
>>> For example if a user wanted to test the recently landed code in
>>> thermald 2.3
>>> and compare performance between the two it seems like this and
>>> that "might" fight.
>>> As an outsider looking in - I of course may be wrong too here.
>>> 
>>> If at some point in the future thermald does a better job than
>>> this implementation you
>>> might also want an "out" to let thermald or another piece of
>>> userland turn this off if it's in the picture.
>>> 
>> I'm still digging into this one. Right now I haven't found a good
>> clean way of just disabling the firmware. Currently when thermald
>> goes in and tweaks the CPU power registers it has the effect of
>> overriding the FW anyway - but I appreciate that's not quite the
>> same as actually doing it explicitly.
>> 
> 
> What about a modprobe parameter to disable at least?  That would at
> least make it pretty easy to make a change, reboot and compare with
> thermald (or other software) without disabling the rest of the
> functionality of the thinkpad_acpi driver.
> 
The problem is I don't have a good way to disable the firmware (that I 
know of yet) so a modprobe parameter wouldn't really do much. I guess it 
could skip providing the sysfs entry points - but the FW will still be 
there doing it's thing, so I'm not sure I see the benefit of that. At 
least the sysfs entry point gives a bit more insight into what is going on.
Let me know if I'm missing something obvious.

Mark
