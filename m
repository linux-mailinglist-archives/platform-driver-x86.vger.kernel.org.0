Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5660822A024
	for <lists+platform-driver-x86@lfdr.de>; Wed, 22 Jul 2020 21:29:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726462AbgGVT3b (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 22 Jul 2020 15:29:31 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.5]:42213 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726322AbgGVT3a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 22 Jul 2020 15:29:30 -0400
Received: from [100.112.3.165] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-b.us-east-1.aws.symcld.net id 10/06-31766-793981F5; Wed, 22 Jul 2020 19:29:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupgleJIrShJLcpLzFFi42LJePGQR3f6ZIl
  4g7e3VS32X5eweDA33WL2YRuLOc/WMlo0dTaxWaze84LZgc1j0swZzB6/DzB67F7wmcnj/b6r
  bB6fN8kFsEaxZuYl5VcksGbMmfCFseCtZsWfZ9MZGxivKnYxcnEICfxnlFg37SMjhPOQUWLuj
  ANADieHsECMxP1F89lAbBEBU4lf86awgxQxCxxhkrh47A4LRMdyRoktJ6Yyg1SxCWhLbNnyC6
  yDV8BWYmfvL3YQm0VAVeLTqkYWEFtUIFbiV/tBZogaQYmTM5+AxTmB4me+z2cFsZkFLCRmzj/
  PCGGLS9x6Mp8JwpaX2P52DlivhICCRPvFXSwQdoLEspd3mCcwCs5CMnYWklGzkIyahWTUAkaW
  VYxmSUWZ6RkluYmZObqGBga6hoZGuga6RkZGeolVukl6pcW6qYnFJbqGeonlxXrFlbnJOSl6e
  aklmxiBEZRSwHBvB+Of1x/0DjFKcjApifLea5eIF+JLyk+pzEgszogvKs1JLT7EKMPBoSTB2z
  ERKCdYlJqeWpGWmQOMZpi0BAePkghvBEiat7ggMbc4Mx0idYpRUUqctxckIQCSyCjNg2uDJZB
  LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5RUGm8GTmlcBNfwW0mAlosfJdUZDFJYkIKakG
  pupFyVWrg75M/MmxvsHh5jf+2bIX+CRO2r6cMVPatu55RJLd5Qc/dGSdGALedx3a9Knt3eZpW
  31v7N5p1rNxB+/6Kav2PLj9+SXnq5p5G3p5RXi7nJJkyuYma5RLTfT6Wd56pyBmS9v2gkMlHr
  faln6ZIP6r8KZB5H6pnVPelkdvqLmeflcgZ/cfV5lVcYLsSer3K//PdPki+KDfqFgyJTBk+oP
  Tp595yrZEC3icT5lZcexKg9nBC/MqGKprn2cVztmkWJ/XnHjmy5+qf90Zaw0lG676dlczfJb+
  f+fQF6szIVOzl3IF3XYLvcq11Xaxxe0tbTOPfXn3/WzjldoNakyHLTvUppY+3BlZV11sckWJp
  Tgj0VCLuag4EQBcyTeXmwMAAA==
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-35.tower-395.messagelabs.com!1595446167!2707425!1
X-Originating-IP: [104.232.225.12]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9533 invoked from network); 22 Jul 2020 19:29:27 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.12)
  by server-35.tower-395.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 22 Jul 2020 19:29:27 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 6737FB5C7A6F2D6B47C8;
        Wed, 22 Jul 2020 15:29:27 -0400 (EDT)
Received: from [10.38.96.128] (10.38.96.128) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Wed, 22 Jul
 2020 12:29:26 -0700
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
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <b79e0359-536d-f496-a01e-fe4c4b7796cc@lenovo.com>
Date:   Wed, 22 Jul 2020 15:29:25 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <DM6PR19MB263650F7DC4B6680A5EFC5DAFA790@DM6PR19MB2636.namprd19.prod.outlook.com>
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

Hi Mario

On 7/22/2020 2:46 PM, Limonciello, Mario wrote:
<snip>
>>
>> +DYTC Thermal mode status and control
>> +------------------------------------
>> +
>> +sysfs: dytc_perfmode
>> +
>> +Lenovo Thinkpad platforms with DYTC version 5 and newer have enhanced
>> firmware to
>> +provide improved performance control.
>> +
>> +The firmware can be controlled by hotkeys (FN+H, FN+M, FN+L) to switch the
>> +operating mode between three different modes. This sysfs node provide a
>> better
>> +interface for user space to use
> 
> So is userspace also notified in some way when you use the hotkey to change, or
> is the event usurped by the EC?  Is this by the event TP_HKEY_EV_THM_CSM_COMPLETED?
> 
I haven't added that yet - my aim with this patch was to get the sysfs 
API available. I'll look at adding the notification.

> You might consider to mention what other interfaces will conflict with this
> and document them and/or artificially block them when this is loaded to prevent
> such a conflict.
I'm afraid I don't know what other interface will be conflicted with. Is 
there anything in particular I should be looking for? What did you have 
in mind?

The firmware is operating by default and this patch is just providing 
user space with a way of determining the current mode and changing it by 
an alternate mechanism than hotkeys (I know some people dislike the 
hotkeys...)

> 
<snip>
>> +
>> +The sysfs entry provides the ability to return the current status and to set
>> the
>> +desired mode. For example::
>> +
>> +        echo H > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>> +        echo M > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
>> +        echo L > /sys/devices/platform/thinkpad_acpi/dytc_perfmode
> 
> Doesn't this need ABI documentation submitted as part of the patch?
OK - I'll need some help here as I'm not sure what I missed. Isn't that 
what this part of the patch is covering? If you can give me some 
pointers for what I should be putting where I'll do that.
> 
<snip>

>> +
>> +	if (perfmode == DYTC_MODE_BALANCE) {
>> +		/* To get back to balance mode we just issue a reset command */
>> +		err = dytc_command(DYTC_CMD_RESET, &output);
>> +		if (err)
>> +			return err;
>> +	} else {
>> +		/* Determine if we are in CQL mode. This alters the commands we do
>> */
>> +		err = dytc_perfmode_get(&cur_perfmode, &cur_funcmode);
>> +		if (err)
>> +			return err;
>> +
>> +		if (cur_funcmode == DYTC_FUNCTION_CQL) {
>> +			/* To set the mode we need to disable CQL first*/
>> +			err = dytc_command(0x000F1001 /*Disable CQL*/, &output);
> 
> Why not put 0x000F1001 and 0x001F1001 as defines at the top?
Fair point - I will fix that.

> 
<snip>

>> +
>> +	switch (perfmode) {
>> +	case DYTC_MODE_PERFORM:
>> +		/* High performance is only available in deskmode */
>> +		if (funcmode == DYTC_FUNCTION_CQL)
>> +			return snprintf(buf, PAGE_SIZE, "Medium (Reduced as lapmode
>> active)\n");
>> +		else
>> +			return snprintf(buf, PAGE_SIZE, "High\n");
>> +	case DYTC_MODE_QUIET:
>> +		return snprintf(buf, PAGE_SIZE, "Low\n");
>> +	case DYTC_MODE_BALANCE:
>> +		return snprintf(buf, PAGE_SIZE, "Medium\n");
>> +	default:
>> +		return snprintf(buf, PAGE_SIZE, "Unknown (%d)\n", perfmode);
>> +	}
>> +}
> 
> I think it's pretty confusing that you write "H/M/L" into this file, but you
> get back a full string.
The main reason here for the string is the need to let the user know 
they are operating in medium mode even though high has been configured - 
because the device is on their lap.
My thinking was you can parse the first letter to get H/M/L but more 
information is available for the subtleties.
I considered another letter but couldn't determine something that was 
obvious to a user (Lower case 'h' is my best candidate?) and decided a 
string was nicer.

I'd appreciate input from others as to the best thing to provide here.

> 
>> +
>> +static ssize_t dytc_perfmode_store(struct device *dev,
>> +				   struct device_attribute *attr,
>> +				   const char *buf, size_t count)
>> +{
>> +	int err;
>> +
>> +	switch (buf[0]) {
>> +	case 'l':
>> +	case 'L':
>> +		err = dytc_perfmode_set(DYTC_MODE_QUIET);
>> +		break;
>> +	case 'm':
>> +	case 'M':
>> +		err = dytc_perfmode_set(DYTC_MODE_BALANCE);
>> +		break;
>> +	case 'h':
>> +	case 'H':
>> +		err = dytc_perfmode_set(DYTC_MODE_PERFORM);
>> +		break;
>> +	default:
>> +		err = -EINVAL;
>> +		pr_err("Unknown operating mode. Ignoring\n");
> 
> Shouldn't this be dev_err?
Ack - I will correct

<snip>
>>
>> +	/* Check DYTC is enabled and supports mode setting */
>> +	dytc_mode_available = false;
>> +	if (output & BIT(DYTC_QUERY_ENABLE_BIT)) {
>> +		/* Only DYTC v5.0 and later has this feature. */
>> +		int dytc_version;
>> +
>> +		dytc_version = (output >> DYTC_QUERY_REV_BIT) & 0xF;
>> +		if (dytc_version >= 5) {
>> +			pr_info("DYTC thermal mode configuration available\n");
> 
> I would argue this isn't useful to most people.
> 1) You should decrease this to debug for use with dynamic debugging
> 2) Output in the log what integer value you returned back in case of a need
> to identify future firmware bugs.
Agreed on both fronts. I will fix.

> 
>> +			dytc_mode_available = true;
> 
> I think you shouldn't set this flag until after the group is actually created.
> 
Agreed. I will fix

Thanks for the feedback - very much appreciated.

Mark
