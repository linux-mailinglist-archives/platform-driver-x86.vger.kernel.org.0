Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0A19121217B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  2 Jul 2020 12:44:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726483AbgGBKoy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 2 Jul 2020 06:44:54 -0400
Received: from mail1.bemta24.messagelabs.com ([67.219.250.1]:31065 "EHLO
        mail1.bemta24.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725954AbgGBKoy (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 2 Jul 2020 06:44:54 -0400
Received: from [100.112.128.254] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-a.us-west-2.aws.symcld.net id 50/25-27697-3AABDFE5; Thu, 02 Jul 2020 10:44:51 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpgleJIrShJLcpLzFFi42JJl3vFrrt4198
  4g3+LeS1eTjjMaPFgbrrF7MM2FnOerWW0WL3nBbMDq8fOWXfZPX4fYPTYveAzk8f7fVfZPD5v
  kgtgjWLNzEvKr0hgzbi48T1jwWfpigOTJjM1MLaJdjFycQgJ/GeUeHe5jRHCucco0fJ4FWsXI
  weHsEC8xNWZ4l2M7BwiAvoS+8tAKpgFupkk9s3YxgRRPotR4tDiTpYuRk4ONgFtiS1bfrGB2L
  wCthInz2xgBbFZBFQkvs6fAFYjKhAjse7je1aIGkGJkzOfsICs4hQIlOh7LgUSZhawkJg5/zw
  jhC0ucevJfCYIW15i+9s5zCDlEkD2kcZ4kLCEQILEspd3mCcwCs5CMnQWkkmzkEyahWTSAkaW
  VYzmSUWZ6RkluYmZObqGBga6hoZGuobGhrqWhnqJVbqJeqXFuuWpxSW6RnqJ5cV6xZW5yTkpe
  nmpJZsYgRGTUtAcvYPxyOsPeocYJTmYlER5xTb+jRPiS8pPqcxILM6ILyrNSS0+xCjDwaEkwb
  ttB1BOsCg1PbUiLTMHGL0waQkOHiUR3sCdQGne4oLE3OLMdIjUKUZFKXHeDyB9AiCJjNI8uDZ
  YwrjEKCslzMvIwMAgxFOQWpSbWYIq/4pRnINRSZhXFmQ8T2ZeCdz0V0CLmYAWX9P6BbK4JBEh
  JdXAlDYtRNnwVlDkgdbZc7ZKPj2hu2rHCxe+sBPRcl8OcX1y7PlX3xfhka6x2TTRy/Tz08bMc
  h3jAvudUcLvXhi+dDy2avf3qRH5U9+zvXEUvH2Sa76zyzdZs293f22Q2aig2+CyWqjw4RQ/74
  eTsw7Uf5U8t9O1ZPbJRSES+083K9zZ0B3Om2XeW/gnsiimYHLVuUdG6398apv/L5EtrTg802y
  C5N0js29FBert5gp4Jd59eWeB/rtZv6de7Vx38oUk28Hub3t1fJUUr4SXrpZe4tF8teCt3SuX
  yuDfq1qXp56L4MsrlBfhZI/4N1nTevrqSXNmuzXG6nDErilmrLKezjHBsLKhrfEfq0TcltxtS
  izFGYmGWsxFxYkAfuBtU5MDAAA=
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-27.tower-326.messagelabs.com!1593686689!54162!1
X-Originating-IP: [103.30.234.7]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 27193 invoked from network); 2 Jul 2020 10:44:50 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.7)
  by server-27.tower-326.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 2 Jul 2020 10:44:50 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id AFA7445D712633EC2B59;
        Thu,  2 Jul 2020 18:44:47 +0800 (CST)
Received: from [10.38.58.26] (10.38.58.26) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Thu, 2 Jul 2020
 03:44:45 -0700
Subject: Re: [External] Re: [PATCH v4] platform/x86: thinkpad_acpi: lap or
 desk mode interface
To:     Andy Shevchenko <andy.shevchenko@gmail.com>
CC:     Henrique de Moraes Holschuh <ibm-acpi@hmh.eng.br>,
        Thinkpad-acpi devel ML <ibm-acpi-devel@lists.sourceforge.net>,
        Platform Driver <platform-driver-x86@vger.kernel.org>,
        <bnocera@redhat.com>, Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
References: <markpearson@lenovo.com>
 <20200629191748.3859-1-markpearson@lenovo.com>
 <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <7d0e1dcc-7285-71e1-7125-604cb2630595@lenovo.com>
Date:   Thu, 2 Jul 2020 06:44:44 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <CAHp75VeO5SzYs=kRh+BV_vydO7PTPLkmu8aiYXvSJFTewSTYwA@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.58.26]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Thanks Andy

On 7/2/2020 5:29 AM, Andy Shevchenko wrote:
> On Mon, Jun 29, 2020 at 10:23 PM Mark Pearson <markpearson@lenovo.com> wrote:
> 
> Thanks for the patch, my comments below.
> 
>>    Newer Lenovo Thinkpad platforms have support to identify whether the
>>    system is on-lap or not using an ACPI DYTC event from the firmware.
>>
>>    This patch provides the ability to retrieve the current mode via sysfs
>>    entrypoints and will be used by userspace for thermal mode and WWAN
>>    functionality
> 
> Please use proper indentation (no need to have spaces) and punctuation
> (like period at the end of sentences).
Ack
> 
> ...
> 
>>   drivers/platform/x86/thinkpad_acpi.c | 111 ++++++++++++++++++++++++++-
>>   1 file changed, 109 insertions(+), 2 deletions(-)
> 
> You specifically added a new ABI, where is documentation? It's a show stopper.
Ah - my apologies I didn't know that was a requirement.

Any pointers on where to add it? I looked in Documentation/ABI and I 
couldn't find anything around thinkpad_acpi to add this to.
Should there be a sysfs-devices-platform-thinkpad_acpi file?

If that's the case I'm happy to look at creating that but as a first 
time kernel contributor would you object if I took that on as a separate 
exercise rather than as part of this patch. I'm guessing it would need 
more time, care and reviewers from other contributors to the 
thinkpad_acpi.c driver
> 
> ...
> 
>> +       sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>> +                       "dytc_lapmode");
> 
> One line?
Ack
> 
> ...
> 
>> +       int output;
>> +
>> +       output = dytc_command(DYTC_CMD_GET);
> 
>> +       if ((output == -ENODEV) || (output == -EIO))
>> +               return output;
> 
> Why not simple
> 
>   if (output < 0)
>     return output;
Agreed. I'll fix

> 
> Btw, how will this survive the 31st bit (if some method would like to use it)?
Hmmm - good point. I'll revisit this.

> 
> I think your prototype should be
> 
> int foo(cmd, *output);
Looking at it again - I agree.

> 
> ...
> 
>> +       new_state = dytc_lapmode_get();
>> +       if ((new_state == -ENODEV) || (new_state == -EIO) || (new_state == dytc_lapmode))
>> +               return;
> 
> What about other errors?
> What about MSB being set?
Ack - this needs fixing

> 
> ...
> 
>> +       dytc_lapmode = dytc_lapmode_get();
>> +
>> +       if (dytc_lapmode < 0 && dytc_lapmode != -ENODEV)
>> +               return dytc_lapmode;
> 
>> +       res = sysfs_create_group(&tpacpi_pdev->dev.kobj,
>> +                               &dytc_attr_group);
>> +
>> +       return res;
> 
> return ...(...);
> 
> So, we create a group for all possible error cases but ENODEV. Why?
There seemed a good reason when I originally wrote it - but now I'm 
wondering why too.
I specifically was catching the ENODEV because of concerns around 
creating the group on platforms that didn't have the support for this 
feature - but I think in doing that I missed the obvious of all errors.

I'll revisit and fix.

> 
>> +}
> 
> ...
> 
>> +       sysfs_remove_group(&tpacpi_pdev->dev.kobj,
>> +                       &dytc_attr_group);
> 
> One line?
Ack.
As a minor note I think these all arose because of getting checkpatch to 
run cleanly. I prefer one line too and if that's your preference it 
works for me.

> 
> ...
> 
>> +static struct ibm_struct dytc_driver_data = {
>> +       .name = "dytc",
>> +       .exit = dytc_exit
> 
> Comma is missed.
Ack

> 
>> +};
> 
I'll work on these and get an updated version out for review. Thank you 
for your time looking at these.

Mark
