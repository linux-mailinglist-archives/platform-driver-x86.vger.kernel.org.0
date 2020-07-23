Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 415C122A3B8
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jul 2020 02:35:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387418AbgGWAfG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 20:35:06 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.1]:10583 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729198AbgGWAfF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 20:35:05 -0400
Received: from [100.112.0.190] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-1.bemta.az-b.us-east-1.aws.symcld.net id 3D/CE-59917-63BD81F5; Thu, 23 Jul 2020 00:35:02 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBKsWRWlGSWpSXmKPExsWSLveKTdf0tkS
  8wbVOHYv91yUsHsxNt5h92MZizrO1jBZNnU1sFqv3vGB2YPOYNHMGs8fvA4weuxd8ZvJ4v+8q
  m8fnTXIBrFGsmXlJ+RUJrBk7lnewFDQ4V/QsesvewLjYrIuRk0NI4D+jxNXtyhD2Q0aJpZP4Q
  GxhgRiJ+4vms4HYIgKmEr/mTWHvYuTiYBY4wiRx8dgdFhBHSGANk8SMGUvAqtgEtCW2bPkFZv
  MK2EpMXbufGcRmEVCVmDvnEpgtKhAr8av9IDNEjaDEyZlPWEBsTqD4qwPzwHqZBSwkZs4/zwh
  hi0vcejKfCcKWl9j+dg5Yr4SAgkT7xV0sEHaCxLKXd5gnMArOQjJ2FpJRs5CMmoVk1AJGllWM
  ZklFmekZJbmJmTm6hgYGuoaGRrpGuoZGxnqJVbpJeqXFuqmJxSW6hnqJ5cV6xZW5yTkpenmpJ
  ZsYgdGTUsBUvYPxx6sPeocYJTmYlER5m69IxAvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4F14ES
  gnWJSanlqRlpkDjGSYtAQHj5II76SbQGne4oLE3OLMdIjUKUZjju2r5y1i5tg8d+kiZiGWvPy
  8VClxXttbQKUCIKUZpXlwg2AJ5hKjrJQwLyMDA4MQT0FqUW5mCar8K0ZxDkYlYd47IAt5MvNK
  4Pa9AjqFCegU5buiIKeUJCKkpBqYuD9f1UoyvtEme2B73a3pyhobdl2N6Njt+N4t+fTl5RtDH
  lyNUs6w3ie5/caj7Mu/zb1kc2JPvQ4uYE/X5AjyPyveedJ7R/GhaJ1S19xJ9yckrtzafXiG+u
  J/tza/nFkrJziFx7T4VZWO7zv+j7PM5jRFOnAe9PdfZRrmFRpSbfvgovaTqbynxNk3BWRuVdh
  f4c79rPqlmX5AeoSVYd6FJaFx59st/J/qZ2b9Wrp8W+V5zWDrRc83VQhcaixy14ywV9wbt25F
  zUW13NCXQRpaL58+O/KdvW4Nw629tRusJrecl+SpLJG6d6L02hEf/RR1pZnmpep3l7tmtoknl
  DEL7mPRYpv9+6lw7bPJnYuVWIozEg21mIuKEwEX62pPqwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-19.tower-395.messagelabs.com!1595464499!2722653!1
X-Originating-IP: [103.30.234.6]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 31916 invoked from network); 23 Jul 2020 00:35:01 -0000
Received: from unknown (HELO lenovo.com) (103.30.234.6)
  by server-19.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 23 Jul 2020 00:35:01 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 6EBB6AFD356FD3622207;
        Thu, 23 Jul 2020 08:34:57 +0800 (CST)
Received: from [10.38.96.128] (10.38.96.128) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Wed, 22 Jul
 2020 17:34:54 -0700
Subject: Re: [External] RE: [PATCH] platform/x86: thinkpad_acpi: performance
 mode interface
To:     "Limonciello, Mario" <Mario.Limonciello@dell.com>
CC:     "ibm-acpi@hmh.eng.br" <ibm-acpi@hmh.eng.br>,
        "ibm-acpi-devel@lists.sourceforge.net" 
        <ibm-acpi-devel@lists.sourceforge.net>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "bnocera@redhat.com" <bnocera@redhat.com>,
        "bberg@redhat.com" <bberg@redhat.com>,
        Nitin Joshi <njoshi1@lenovo.com>
References: <markpearson@lenovo.com>
 <20200722171108.65185-1-markpearson@lenovo.com>
 <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
 <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
 <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <e14aa227-493b-4206-eaef-81874512166f@lenovo.com>
Date:   Wed, 22 Jul 2020 20:34:52 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB26360DE8FCA56BC132644F98FA790@DM6PR19MB2636.namprd19.prod.outlook.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.96.128]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On 7/22/2020 3:46 PM, Limonciello, Mario wrote:
>>
>> On 7/22/2020 2:46 PM, Limonciello, Mario wrote:
>> <snip>
>>>>
>>>> +DYTC Thermal mode status and control
>>>> +------------------------------------
>>>> +
>>>> +sysfs: dytc_perfmode
>>>> +
>>>> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
>>>> firmware to
>>>> +provide improved performance control.
>>>> +
>>>> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
>>>> +operating mode between three different modes. This sysfs node provide a
>>>> better
>>>> +interface for user space to use
>>>
>>> So is userspace also notified in some way when you use the hotkey to change,
>> or
>>> is the event usurped by the EC?  Is this by the event
>> TP_HKEY_EV_THM_CSM_COMPLETED?
>>>
>> I haven't added that yet - my aim with this patch was to get the sysfs
>> API available. I'll look at adding the notification.
> 
> Yeah I just think touch the kernel/user ABI as atomically as possible
> to avoid userspace to have to know 5.9 behaves this way and you need to poll for a value
> and 5.10 you get a notification etc.
> 
OK - fair point. I'll look into implementing that as well.

>>
>>> You might consider to mention what other interfaces will conflict with this
>>> and document them and/or artificially block them when this is loaded to
>> prevent
>>> such a conflict.
>> I'm afraid I don't know what other interface will be conflicted with. Is
>> there anything in particular I should be looking for? What did you have
>> in mind?
> 
> Since it's not mentioned I can only guess your firmware implementation associated
> with this code.  I would think for example that touching some PLx related MSR or
> possibly RAPL interface might cause unexpected behaviors.
> 
> Assuming that's right kernel lockdown might prevent some of the MSR, but if you really
> want user fully in control of this decision by one knob, you shouldn't let common
> userspace tools like thermald, tuned, tlp or the like touch the related objects.
> 
Hmmm - I think I disagree here.

I don't think this should control what other userspace tools (like 
thermald) want to do with the CPU registers. Adding hooks into those 
other pieces of code also seems to me to be complicated and unnecessary 
in the kernel (and way beyond the scope of this patch). As an aside - my 
experience from testing is that thermald will override what the firmware 
is doing anyway.

I can see the value of adding a feature to *disable* the Lenovo firmware 
implementation as that doesn't currently exist. I will talk to the 
firmware team and see what can be done and take that on as a separate 
task. If there's a mechanism to do that already in a safe way then I'll 
add that to this.

>>
>> The firmware is operating by default and this patch is just providing
>> user space with a way of determining the current mode and changing it by
>> an alternate mechanism than hotkeys (I know some people dislike the
>> hotkeys...)
> 
> In which case if the firmware preference is that it's user control, I think all
> the more reason to block out those other things while offering this interface.
Covered above
> 
>>
>>>
>> <snip>
>>>> +
>>>> +The sysfs entry provides the ability to return the current status and to
>> set
>>>> the
>>>> +desired mode. For example::
>>>> +
>>>> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>>>> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>>>> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>>>
>>> Doesn't this need ABI documentation submitted as part of the patch?
>> OK - I'll need some help here as I'm not sure what I missed. Isn't that
>> what this part of the patch is covering? If you can give me some
>> pointers for what I should be putting where I'll do that.
> 
> I think it's common to document how your sysfs attributes work in a file in
> Documentation/ABI/testing.  You can look at the format for some others
> for examples.
Ah - that was new to me. Thanks. I'm guessing I need to add a new 
sysfs-devices-platform-thinkpad_acpi file there. Strange there's not one 
already :)

> 
>>>
>> <snip>
>>
>>>> +
>>>> +	if (perfmode == DYTC_MODE_BALANCE) {
>>>> +		/* To get back to balance mode we just issue a reset command */
>>>> +		err = dytc_command(DYTC_CMD_RESET, &output);
>>>> +		if (err)
>>>> +			return err;
>>>> +	} else {
>>>> +		/* Determine if we are in CQL mode. This alters the commands we do
>>>> */
>>>> +		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
>>>> +		if (err)
>>>> +			return err;
>>>> +
>>>> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
>>>> +			/* To set the mode we need to disable CQL first*/
>>>> +			err = dytc_command(0x000F1001 /*Disable CQL*/, &output);
>>>
>>> Why not put 0x000F1001 and 0x001F1001 as defines at the top?
>> Fair point - I will fix that.
>>
>>>
>> <snip>
>>
>>>> +
>>>> +	switch (perfmode) {
>>>> +	case DYTC_MODE_PERFORM:
>>>> +		/* High performance is only available in deskmode */
>>>> +		if (funcmode == DYTC_FUNCTION_CQL)
>>>> +			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode
>>>> active)\n");
>>>> +		else
>>>> +			return snprintf(buf, PAGE_SIZE, "High\n");
>>>> +	case DYTC_MODE_QUIET:
>>>> +		return snprintf(buf, PAGE_SIZE, "Low\n");
>>>> +	case DYTC_MODE_BALANCE:
>>>> +		return snprintf(buf, PAGE_SIZE, "Medium\n");
>>>> +	default:
>>>> +		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
>>>> +	}
>>>> +}
>>>
>>> I think it's pretty confusing that you write "H/M/L" into this file, but you
>>> get back a full string.
>> The main reason here for the string is the need to let the user know
>> they are operating in medium mode even though high has been configured -
>> because the device is on their lap.
>> My thinking was you can parse the first letter to get H/M/L but more
>> information is available for the subtleties.
>> I considered another letter but couldn't determine something that was
>> obvious to a user (Lower case 'h' is my best candidate?) and decided a
>> string was nicer.
>>
>> I'd appreciate input from others as to the best thing to provide here.
> 
> My own personal opinion (and there may be others that offer different view
> so don't take it authoritative):
> 
> If you're offering High/Medium/Low, you should accept an input of High/Medium/Low.
> If you offer H/M/L you should accept H/M/L.
> 
> A good way to indicate the reduced mode would be to add an asterisk for medium.
> So it could be:
> Write: H/M/L
> Read: H/M*/M/L

I like this. Unless someone jumps in and says otherwise I'm good to 
switch to this.
> 
> The actual decoding of the information can be placed in that Documentation file
> I mentioned above.  In general a userspace tool will be making this pretty and
> translated I would guess, so no need to do High versus high or Foo (bar) when
> it could be Foo*
Ack

>>
>>>
>>>> +
>>>> +static ssize_t dytc_perfmode_store(struct device *dev,
>>>> +				   struct device_attribute *attr,
>>>> +				   const char *buf, size_t count)
>>>> +{
>>>> +	int err;
>>>> +
>>>> +	switch (buf[0]) {
>>>> +	case 'l':
>>>> +	case 'L':
>>>> +		err = dytc_perfmode_set(DYTC_MODE_QUIET);
>>>> +		break;
>>>> +	case 'm':
>>>> +	case 'M':
>>>> +		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
>>>> +		break;
>>>> +	case 'h':
>>>> +	case 'H':
>>>> +		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
>>>> +		break;
>>>> +	default:
>>>> +		err = -EINVAL;
>>>> +		pr_err("Unknown operating mode. Ignoring\n");
>>>
>>> Shouldn't this be dev_err?
>> Ack - I will correct
>>
>> <snip>
>>>>
>>>> +	/* Check DYTC is enabled and supports mode setting */
>>>> +	dytc_mode_available = false;
>>>> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
>>>> +		/* Only DYTC v5.0 and later has this feature. */
>>>> +		int dytc_version;
>>>> +
>>>> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>>>> +		if (dytc_version >= 5) {
>>>> +			pr_info("DYTC thermal mode configuration available\n");
>>>
>>> I would argue this isn't useful to most people.
>>> 1) You should decrease this to debug for use with dynamic debugging
>>> 2) Output in the log what integer value you returned back in case of a need
>>> to identify future firmware bugs.
>> Agreed on both fronts. I will fix.
> 
> Similar to the pr_err vs dev_err, make sure you use the dev_dbg here instead of
> pr_dbg.
> 
>>
>>>
>>>> +			dytc_mode_available = true;
>>>
>>> I think you shouldn't set this flag until after the group is actually
>> created.
>>>
>> Agreed. I will fix
>>
>> Thanks for the feedback - very much appreciated.
> 
> Sure thing.
> 
