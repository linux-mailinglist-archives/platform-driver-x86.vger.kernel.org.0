Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id B557F75BAA2
	for <lists+platform-driver-x86@lfdr.de>; Fri, 21 Jul 2023 00:30:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229652AbjGTWab (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 20 Jul 2023 18:30:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54870 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229589AbjGTWaa (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 20 Jul 2023 18:30:30 -0400
Received: from out2-smtp.messagingengine.com (out2-smtp.messagingengine.com [66.111.4.26])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 642F410FC
        for <platform-driver-x86@vger.kernel.org>; Thu, 20 Jul 2023 15:30:29 -0700 (PDT)
Received: from compute1.internal (compute1.nyi.internal [10.202.2.41])
        by mailout.nyi.internal (Postfix) with ESMTP id D4BE35C01B7;
        Thu, 20 Jul 2023 18:30:28 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute1.internal (MEProxy); Thu, 20 Jul 2023 18:30:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ljones.dev; h=cc
        :cc:content-type:content-type:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm1; t=1689892228; x=1689978628; bh=Wc
        tNg4gxw0VtRbL35WYiHcOPsplNdfJ0g3Vlw40YNhs=; b=kEqBB3bIPi8T2ywli2
        3pZ2iWOPndn7ZmW9B26ybRhRKTARa87vEQXQnthdRjhbGrTEINdYq4L9MRP3/O4m
        ts1h8zyakwTmo4ZFJQlYKmn4P7kDQuSlDs3ZWWM47TeoNtwOJQrh5QOqovV2mq0l
        Wpqoc2w8paL5WEqDyFFeA2T1fwg552fhfeYHLWgAFypWWD4PalhMPDK4mezsqcje
        7tJVoGTFQHC77oXiU82lIckYXbbJL+h70/r8Dkmqx/HWwTHcu8607HJHdk04E9Di
        dMlvzF+uXyB5ijw3b8JHRwlwccdXoz9Jxvb9xzM8PV2HDdknlBZISSHbImacz6SN
        +QEg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:content-type:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; t=1689892228; x=1689978628; bh=WctNg4gxw0VtR
        bL35WYiHcOPsplNdfJ0g3Vlw40YNhs=; b=yh2q4DJFPFHnbZvOcsP3fyRP3K8AU
        THy2gZFUABcNVf2rnsP5NQsqj45L8+Ei8pwgEOLXFNRuDPchsCXNZGBBMGAOtaAO
        /oESZzozDM2gI5x+uZOrA+3BdsitUF7YIhqsxZRfEfroSEMbAnXpx3PfNjEsBMqb
        FCzGo70cIg5cqsVWlDgksXWt1uEU2A9DemhKUOaFEtoqasTLn5s9dbGKwU8ZM6CS
        GfF7WrTc6+64LjixY02rO19v1ZPSjPr15W0Lg/4FxIZ0/EH9BxoBCJxjJ0wVW0be
        ZGETi9xKF15SSUUhWmMv5s7DrO7wldkBKwghnMZIiUKLsVGF8NtQU9c0w==
X-ME-Sender: <xms:hLW5ZJUiB92f3cSKn6_tGjCkGeKqhkX2vSeJtjI9me1joRDjeLHeKA>
    <xme:hLW5ZJmzbeQ7fcneNTA8Cx6Jzis0tA0LeLApozdpm1jelu0DuGEAmOv_YPf4ohKLG
    27qnuz-Hgw1Cm4XkPs>
X-ME-Received: <xmr:hLW5ZFZGfQikRxeWwC9jtiIcfi4A3_maHo0yMFtuODEGV1JDghkuoZdTHLIx8WP89es5yA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedviedrhedugddutdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpeffhffuvfevkfgjfhfogggtsehttdertdertddvnecuhfhrohhmpefnuhhkvgcu
    lfhonhgvshcuoehluhhkvgeslhhjohhnvghsrdguvghvqeenucggtffrrghtthgvrhhnpe
    fhieegtdevfeejueekteefkedtfeeffeetkeefffeiieetieeghefhuddtiedtheenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomheplhhukhgvsehljhhonhgvshdruggvvh
X-ME-Proxy: <xmx:hLW5ZMWis9qSEndtyI1umw8n9HIM4Kpt-LoNW_4N613UYWbaevP4yQ>
    <xmx:hLW5ZDkQmaI4aH__FZBljAPArACPhuKUZumkEcW-RWiP46xVakZSRg>
    <xmx:hLW5ZJe6MaOCPuJkkiEzVmOyS-6fMcghtxVRe8v4oKJUxg4iNFCMLg>
    <xmx:hLW5ZCuYkKNvlaN0gsPhOWNpsp-ku8kaiLS4CLTB_EdTC3DPrP2K3g>
Feedback-ID: i5ec1447f:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 20 Jul 2023 18:30:25 -0400 (EDT)
Date:   Fri, 21 Jul 2023 10:30:12 +1200
From:   Luke Jones <luke@ljones.dev>
Subject: Re: [PATCH V3] platform/x86: asus-wmi: Fix setting RGB mode on some
 TUF laptops
To:     Kristian Angelov <kristiana2000@abv.bg>
Cc:     hdegoede@redhat.com, platform-driver-x86@vger.kernel.org
Message-Id: <C694YR.K5DWX6WG90S31@ljones.dev>
In-Reply-To: <ZLlS7o6UdTUBkyqa@wyvern.localdomain>
References: <ZLlS7o6UdTUBkyqa@wyvern.localdomain>
X-Mailer: geary/44.0
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_BLOCKED,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_PASS,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Looks good to me.

Reviewed-by: Luke D. Jones <luke@ljones.dev>

On Thu, Jul 20 2023 at 18:29:50 +03:00:00, Kristian Angelov 
<kristiana2000@abv.bg> wrote:
> This patch fixes setting the cmd values to 0xb3 and 0xb4.
> This is necessary on some TUF laptops in order to set the RGB mode.
> 
> Closes: 
> https://lore.kernel.org/platform-driver-x86/443078148.491022.1677576298133@nm83.abv.bg
> Signed-off-by: Kristian Angelov <kristiana2000@abv.bg>
> ---
>  V1 -> V2. Make setting 0xb3 and 0xb4 the default logic
>  V2 -> V3. Defualt to -EINVAL to match the rest of asus-wmi.
> 
>  drivers/platform/x86/asus-wmi.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/asus-wmi.c 
> b/drivers/platform/x86/asus-wmi.c
> index 1038dfdcdd32..8bef66a2f0ce 100644
> --- a/drivers/platform/x86/asus-wmi.c
> +++ b/drivers/platform/x86/asus-wmi.c
> @@ -738,13 +738,23 @@ static ssize_t kbd_rgb_mode_store(struct device 
> *dev,
>  				 struct device_attribute *attr,
>  				 const char *buf, size_t count)
>  {
> -	u32 cmd, mode, r, g,  b,  speed;
> +	u32 cmd, mode, r, g, b, speed;
>  	int err;
> 
>  	if (sscanf(buf, "%d %d %d %d %d %d", &cmd, &mode, &r, &g, &b, 
> &speed) != 6)
>  		return -EINVAL;
> 
> -	cmd = !!cmd;
> +	/* B3 is set and B4 is save to BIOS */
> +	switch (cmd) {
> +	case 0:
> +		cmd = 0xb3;
> +		break;
> +	case 1:
> +		cmd = 0xb4;
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> 
>  	/* These are the known usable modes across all TUF/ROG */
>  	if (mode >= 12 || mode == 9)
> --
> 2.40.0
> 


