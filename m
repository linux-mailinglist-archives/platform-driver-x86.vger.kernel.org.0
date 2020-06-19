Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 63E482014F5
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Jun 2020 18:22:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391181AbgFSQP6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Jun 2020 12:15:58 -0400
Received: from mail1.bemta23.messagelabs.com ([67.219.246.116]:23839 "EHLO
        mail1.bemta23.messagelabs.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2390983AbgFSPDV (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jun 2020 11:03:21 -0400
Received: from [100.112.6.42] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
        by server-5.bemta.az-c.us-east-1.aws.symcld.net id B1/BB-14069-7B3DCEE5; Fri, 19 Jun 2020 15:03:19 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrBIsWRWlGSWpSXmKPExsWS8eIhr+72y2/
  iDBb85bN4MDfdYvZhG4s5z9YyWqze84LZgcXj9wFGj90LPjN5vN93lc3j8ya5AJYo1sy8pPyK
  BNaME98usBRMkql49e8uWwPjH7EuRi4OIYH/jBLr+l6zQDiPGSU+TJrH3sXIySEskCZx7sAnM
  FtEQF3iS+c0RpAiZoGNjBJ7/35iheiYyiix9OZENpAqNgFtiS1bfoHZvAK2Ekvn9YJ1swioSl
  za38YMYosKxEis+/ieFaJGUOLkzCdAqzk4OAW8JdpXSYOEmQUsJGbOP88IYYtL3HoynwnClpf
  Y/nYO2BgJAUWJy63roewEiWUv7zBPYBSchWTqLCSjZiEZNQvJqAWMLKsYTZOKMtMzSnITM3N0
  DQ0MdA0NjXRNdI1N9BKrdJP1Sot1UxOLS3QN9RLLi/WKK3OTc1L08lJLNjECIySlgEVpB2Pzm
  w96hxglOZiURHmNT72JE+JLyk+pzEgszogvKs1JLT7EKMPBoSTB230RKCdYlJqeWpGWmQOMVp
  i0BAePkgjvDJA0b3FBYm5xZjpE6hSjopQ4b+kloIQASCKjNA+uDZYgLjHKSgnzMjIwMAjxFKQ
  W5WaWoMq/YhTnYFQS5m0BmcKTmVcCN/0V0GImoMVa4a9AFpckIqSkGpikDm+RfPNTkeE0e2bp
  ERXL4rgXAgbTsu23dT9/wWeWnqPqfinzUs7M9Pcpb15HazM5Tn/BLdwlu13mYcaZODvjhuT1h
  0+3VbDHNJu0ZS09JxgRIHZZ0qKtZ8qbjryopNrnjRWrJX71BK25rrfS8eKiuR0rfFslVyqtd0
  /NrtkgExrd2LrsuJxt/U2HYLv97ol3n+k+Vjp+YfGGbhar+oDrzIUOve4VWy01z7+11ZHOfqL
  4NC2Lb42MUGjEgjOZszki416slWK8NPm9abjFmWULI7LtUwSKgi/kvloza9aa3x32T668aQjg
  3VJZ3qeRP/nH42qOzhVqcxwOrXiSuvHC2++v+BR02vUb52z5pMRSnJFoqMVcVJwIAOK57oaLA
  wAA
X-Env-Sender: markpearson@lenovo.com
X-Msg-Ref: server-9.tower-415.messagelabs.com!1592578999!945082!1
X-Originating-IP: [104.232.225.13]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.50.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 22095 invoked from network); 19 Jun 2020 15:03:19 -0000
Received: from unknown (HELO lenovo.com) (104.232.225.13)
  by server-9.tower-415.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 19 Jun 2020 15:03:19 -0000
Received: from reswpmail04.lenovo.com (unknown [10.62.32.23])
        (using TLSv1.2 with cipher AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by Forcepoint Email with ESMTPS id 0BBD3127CCE16DD236FD;
        Fri, 19 Jun 2020 11:03:19 -0400 (EDT)
Received: from [10.38.106.204] (10.38.106.204) by reswpmail04.lenovo.com
 (10.62.32.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.1.1913.5; Fri, 19 Jun
 2020 08:02:58 -0700
Subject: Re: [External] Re: [RESEND PATCH v2] platform/x86: thinkpad_acpi: lap
 or desk mode interface
To:     Bastien Nocera <bnocera@redhat.com>
CC:     <ibm-acpi@hmh.eng.br>, <ibm-acpi-devel@lists.sourceforge.net>,
        <platform-driver-x86@vger.kernel.org>,
        Nitin Joshi <njoshi1@lenovo.com>,
        Sugumaran <slacshiminar@lenovo.com>
References: <markpearson@lenovo.com>
 <20200617180937.14949-1-markpearson@lenovo.com>
 <1905013469.24563660.1592574774373.JavaMail.zimbra@redhat.com>
From:   Mark Pearson <markpearson@lenovo.com>
Message-ID: <89c38303-9463-d671-1f86-e0c6a433748c@lenovo.com>
Date:   Fri, 19 Jun 2020 11:02:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <1905013469.24563660.1592574774373.JavaMail.zimbra@redhat.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.38.106.204]
X-ClientProxiedBy: reswpmail04.lenovo.com (10.62.32.23) To
 reswpmail04.lenovo.com (10.62.32.23)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Bastien

On 6/19/2020 9:52 AM, Bastien Nocera wrote:
> Hey Mark,
> 
> ----- Original Message -----
<snip>
>>   
>> +/*************************************************************************
>> + * DYTC subdriver, for the Lenovo performace mode feature
>> + */
> 
> I don't think this should mention the performance mode, as it's a lap/table
> detection mode. Do we need to call that "DYTC"? "lapmode"? "lap_detection"?
> Or does the DYTC interface offer more functionality that we'd export in the
> future?
> 
I've just noticed that I can't spell performance either which is
embarrassing :)

Originally I developed this code for a thermal modes feature - but
this portion of it is also needed for WWAN so we pulled out just this
piece as the first bit to get in. Having WWAN available for users is
more important than the thermal mode interface (there are a lot of users
who want WWAN working properly on our laptops).

So...yes, DYTC does offer more functionality and I'm planning on
proposing the thermal patch as soon as this one makes it through, but I
agree that in the context of this patch the comment is misleading. I
will clean that up for this version.

>> +
>> +#define DYTC_CMD_GET      2 /*To get current IC function and mode*/
> 
> For this comment and all the ones below, space after "/*" and before "*/"
> 
Ack

>> +#define DYTC_GET_ENABLE_MASK  0x1 /*0 = disabled, 1 = enabled*/
> 
> Is that necessary?
> 
Another hangover in that the other fields used for the thermal mode have
more interesting masks and this fitted in with that. I can remove for
now if it's really a problem.

>> +#define DYTC_GET_LAPMODE_SHIFT 17
> 
> You'd probably want to call this "bit" rather than shift. We shift it to read
> the value, but 17 is the bit's position. (See BIT() usage in the driver)
> 
Ack
> Do you want to add a comment here? Is there anything else that could be
> documented (the other bits, which versions of firmware would have that, if
> there's a publicly available version, or which hardware if publicly available)
> 
So what is the preference normally? More pieces will definitely be made
public when I release the thermal mode updates but I assumed we kept
things related only to the code used. I can add more detail here if that
helps. Not trying to hide anything :)

>> +static int  dytc_lapmode;
>> +static void dytc_lapmode_notify_change(void)
>> +{
>> +	sysfs_notify(&tpacpi_pdev->dev.kobj, NULL,
>> +			"dytc_lapmode");
>> +}
>> +
>> +static int dytc_command(int command)
>> +{
>> +	acpi_handle dytc_handle;
>> +	int output;
>> +
>> +	if (ACPI_FAILURE(acpi_get_handle(hkey_handle, "DYTC", &dytc_handle))) {
>> +		/*Platform doesn't support DYTC*/
>> +		return -ENODEV;
>> +	}
>> +	if (!acpi_evalf(dytc_handle, &output, NULL, "dd", command))
>> +		return -EIO;
>> +	return output;
>> +}
>> +
>> +static int dytc_lapmode_get(void)
>> +{
>> +	int output;
>> +
>> +	output = dytc_command(DYTC_CMD_GET);
>> +	if ((output == -ENODEV) || (output == -EIO))
>> +		return output;
>> +
>> +	return ((output >> DYTC_GET_LAPMODE_SHIFT) &
>> +				DYTC_GET_ENABLE_MASK);
> 
> Use BIT() instead? eg.
> return (output & BIT(DYTC_GET_LAPMODE_SHIFT));
> 
Ack
>> +}
>> +
>> +static void dytc_lapmode_refresh(void)
>> +{
>> +	int new_state;
>> +
>> +	new_state = dytc_lapmode_get();
>> +	if ((new_state == -ENODEV) || (new_state == -EIO))
>> +		return;
> 
> You could also return early if "dytc_lapmode == new_state".
> 
Good point.

> Rest looks good to me.
> 
Great - thanks for the review. I'll prepare the updates and if there's
any feedback on the questions above please let me know

Mark
