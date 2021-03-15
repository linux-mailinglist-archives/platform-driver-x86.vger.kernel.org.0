Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 3FE9433C50E
	for <lists+platform-driver-x86@lfdr.de>; Mon, 15 Mar 2021 19:01:56 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232518AbhCOSBY (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 15 Mar 2021 14:01:24 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:44515 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231330AbhCOSBS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 15 Mar 2021 14:01:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615831277;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=rO4WnttqKTSClNqzHyruAvqwrBD8yA+dJKnk+r72YSw=;
        b=Xw6p1wtv0lndn8D8/T0KXPq2McIUgeZX6Mj4OF896MUY5g1zNwXG6j8w4T5cUcTnuc0QRm
        n4ErfEVsIOq5ITskz3dA6p/fTLxy/kRGu1tASuSYahEV83BCRUANg2mc2j4qpdS9W37+xB
        NESWXxBA6dCxw8wpu2L8htowMCfrvjQ=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-207-gyufpYLBPcKTwsRWM-tSVQ-1; Mon, 15 Mar 2021 14:01:16 -0400
X-MC-Unique: gyufpYLBPcKTwsRWM-tSVQ-1
Received: by mail-ej1-f71.google.com with SMTP id sa29so12393975ejb.4
        for <platform-driver-x86@vger.kernel.org>; Mon, 15 Mar 2021 11:01:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rO4WnttqKTSClNqzHyruAvqwrBD8yA+dJKnk+r72YSw=;
        b=XgKG1SZAsCzzMjv2NJy2beN/2dnp1TX1WQI+MTsFW4bXOWSibWSe0svRlWdQfzCfKK
         6/HTXmk7B8HnzSo8jf0HH5BXQNia1/zXkdB7zYXBWcUDLOt//XnW6EbzGhOu29iBtMqf
         XhVvv3m9cFgNUD8cONUewmeaPxb/FcpJ15KL8RjvvXlQWRL1sAa2uPovdTu+heADPGr4
         Ch9EXYvteYw11CHJM/p10ayUTxyoeDdosAhB9jTiXQ8QOGmXUJXjLbhVQO5ymmc8Qtyz
         k4FaXwxTMBIgeaqIH4Y6YghvvRDbrPOdqG2mpTymODQiaBysDwDt41kGjY86nyBGv3/5
         5Upg==
X-Gm-Message-State: AOAM530aF+KjfSk0JfYftf4ZTeY9eTdI/46yvsOUQfGGTOprgtGZM/EL
        T/VuzxEjpnjT9vgzu4OZHfNAAc5NFDrUCqcRzaHl70+xZcCJvkqMlzzKf5Fq0y8plP3mVkcOXoI
        gU+nqsbU/yetmzyB6SNoKuPIW5rl2OJg5/w==
X-Received: by 2002:a17:906:3952:: with SMTP id g18mr9307096eje.104.1615831275129;
        Mon, 15 Mar 2021 11:01:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzLdx2zZjrbsM/fWD1BnX6ufS5L2NcyCE30kglf/8Lw0oEXCJztk9scunvrYV/zLLdX6czSfA==
X-Received: by 2002:a17:906:3952:: with SMTP id g18mr9307057eje.104.1615831274884;
        Mon, 15 Mar 2021 11:01:14 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id q26sm7883367eja.45.2021.03.15.11.01.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Mar 2021 11:01:14 -0700 (PDT)
Subject: Re: [PATCH] platform/x86: pmc_atom: use callback for all dmi quirk
 entries
To:     Henning Schild <henning.schild@siemens.com>
Cc:     linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        linux-watchdog@vger.kernel.org,
        Srikanth Krishnakar <skrishnakar@gmail.com>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Gerd Haeussler <gerd.haeussler.ext@siemens.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Mark Gross <mgross@linux.intel.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
References: <ef5fe493-285d-145c-8d05-7f9bd0cb47c5@redhat.com>
 <20210315145855.17174-1-henning.schild@siemens.com>
 <8577f3a8-c5e4-3752-1bc1-5937ee164217@redhat.com>
 <20210315180011.6a3f60b0@md1za8fc.ad001.siemens.net>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <43841119-4839-09d2-b606-7dd40cad4b89@redhat.com>
Date:   Mon, 15 Mar 2021 19:01:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210315180011.6a3f60b0@md1za8fc.ad001.siemens.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/15/21 6:00 PM, Henning Schild wrote:
> Am Mon, 15 Mar 2021 17:31:49 +0100
> schrieb Hans de Goede <hdegoede@redhat.com>:
> 
>> Hi,
>>
>> On 3/15/21 3:58 PM, Henning Schild wrote:
>>> Introduce a global variable to remember the matching entry for later
>>> printing. Also having a callback allows to stop matching after the
>>> first hit.
>>>
>>> Signed-off-by: Henning Schild <henning.schild@siemens.com>
>>> ---
>>>  drivers/platform/x86/pmc_atom.c | 26 ++++++++++++++++++++------
>>>  1 file changed, 20 insertions(+), 6 deletions(-)
>>>
>>> diff --git a/drivers/platform/x86/pmc_atom.c
>>> b/drivers/platform/x86/pmc_atom.c index 38542d547f29..d0f74856cd8b
>>> 100644 --- a/drivers/platform/x86/pmc_atom.c
>>> +++ b/drivers/platform/x86/pmc_atom.c
>>> @@ -364,8 +364,16 @@ static void pmc_dbgfs_register(struct pmc_dev
>>> *pmc) #endif /* CONFIG_DEBUG_FS */
>>>  
>>>  static bool pmc_clk_is_critical = true;
>>> +static const struct dmi_system_id *dmi_critical;
>>>  
>>> -static int siemens_clk_is_critical(const struct dmi_system_id *d)
>>> +static int dmi_callback(const struct dmi_system_id *d)
>>> +{
>>> +	dmi_critical = d;  
>>
>> Don't introduce a global variable for this please. Instead just
>> directly print the ident of the matching dmi_system_id here.
> 
> Sorry, missed that part. Result looks nice and clean, thanks. I think i
> will squash it into 4/4 in v3 and not follow up here for now.

Ack, that sounds good to me.

Regards,

Hans


>>> +
>>> +	return 1;
>>> +}
>>> +
>>> +static int dmi_callback_siemens(const struct dmi_system_id *d)
>>>  {
>>>  	u32 st_id;
>>>  
>>> @@ -373,7 +381,7 @@ static int siemens_clk_is_critical(const struct
>>> dmi_system_id *d) goto out;
>>>  
>>>  	if (st_id == SIMATIC_IPC_IPC227E || st_id ==
>>> SIMATIC_IPC_IPC277E)
>>> -		return 1;
>>> +		return dmi_callback(d);
>>>  
>>>  out:
>>>  	pmc_clk_is_critical = false;
>>> @@ -388,6 +396,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk0 is used for an external HSIC USB
>>> HUB */ .ident = "MPL CEC1x",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "MPL AG"),
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "CEC10
>>> Family"), @@ -396,6 +405,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk0 - 3 are used for the 4 ethernet
>>> controllers */ .ident = "Lex 3I380D",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "3I380D"),
>>> @@ -404,6 +414,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk* - are used for ethernet
>>> controllers */ .ident = "Lex 2I385SW",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Lex BayTrail"),
>>>  			DMI_MATCH(DMI_PRODUCT_NAME, "2I385SW"),
>>> @@ -412,6 +423,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk* - are used for ethernet
>>> controllers */ .ident = "Beckhoff CB3163",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB3163"),
>>> @@ -420,6 +432,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk* - are used for ethernet
>>> controllers */ .ident = "Beckhoff CB4063",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB4063"),
>>> @@ -428,6 +441,7 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk* - are used for ethernet
>>> controllers */ .ident = "Beckhoff CB6263",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB6263"),
>>> @@ -436,13 +450,14 @@ static const struct dmi_system_id
>>> critclk_systems[] = { {
>>>  		/* pmc_plt_clk* - are used for ethernet
>>> controllers */ .ident = "Beckhoff CB6363",
>>> +		.callback = dmi_callback,
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "Beckhoff
>>> Automation"), DMI_MATCH(DMI_BOARD_NAME, "CB6363"),
>>>  		},
>>>  	},
>>>  	{
>>> -		.callback = siemens_clk_is_critical,
>>> +		.callback = dmi_callback_siemens,
>>>  		.ident = "SIEMENS AG",
>>>  		.matches = {
>>>  			DMI_MATCH(DMI_SYS_VENDOR, "SIEMENS AG"),
>>> @@ -457,7 +472,6 @@ static int pmc_setup_clks(struct pci_dev *pdev,
>>> void __iomem *pmc_regmap, {
>>>  	struct platform_device *clkdev;
>>>  	struct pmc_clk_data *clk_data;
>>> -	const struct dmi_system_id *d;
>>>  
>>>  	clk_data = kzalloc(sizeof(*clk_data), GFP_KERNEL);
>>>  	if (!clk_data)
>>> @@ -468,8 +482,8 @@ static int pmc_setup_clks(struct pci_dev *pdev,
>>> void __iomem *pmc_regmap, if (dmi_check_system(critclk_systems)) {
>>>  		clk_data->critical = pmc_clk_is_critical;
>>>  		if (clk_data->critical) {
>>> -			d = dmi_first_match(critclk_systems);
>>> -			pr_info("%s critclks quirk enabled\n",
>>> d->ident);
>>> +			pr_info("%s critclks quirk enabled\n",
>>> +				dmi_critical->ident);
>>>  		}
>>>  	}
>>>  
>>>   
>>
> 

