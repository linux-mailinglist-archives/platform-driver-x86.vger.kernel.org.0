Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3377C5A262F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 26 Aug 2022 12:54:40 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343938AbiHZKyf (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 26 Aug 2022 06:54:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343723AbiHZKyf (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 26 Aug 2022 06:54:35 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F23F0578A6
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 03:54:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661511272;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=EQ1zneK9DxbiINAMLJbVkqYItLnLRxocRocpFZJXiBQ=;
        b=LdwJdE1IK2cgTTJMznXMNG7oUKLKZEZtxBJiDd0acYYzRtYNEAFqbmTtqAMGo4+VbLSXzT
        HhTiJ3OaRvtkkVBto/j1AMO2DLQeNLKs4iEIzplpNGxZpL3qvELX5FDZuwAXg+x4TRgtkT
        6CwIrdsBuk+C/4ZaESHPk+6s/lLA7xI=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-625-mfFx7Q2mNfSrqTGwuVD0_A-1; Fri, 26 Aug 2022 06:54:31 -0400
X-MC-Unique: mfFx7Q2mNfSrqTGwuVD0_A-1
Received: by mail-ed1-f69.google.com with SMTP id i6-20020a05640242c600b00447c00a776aso902854edc.20
        for <platform-driver-x86@vger.kernel.org>; Fri, 26 Aug 2022 03:54:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=EQ1zneK9DxbiINAMLJbVkqYItLnLRxocRocpFZJXiBQ=;
        b=RTedMXlmciWmjpt3DNgqaYAQ2wAjd16AvS/HeZ7cJB2xsYTR3BQHKVXYnSQN9w7Y7L
         ljWM9qi2GhH6qzlEl87TR0+llQKIKbKflKuQjuRkeTEK8IN0s/vjdt3vBerMrNSgFpDE
         okO6pWFIeTDQajy/MsInZDuJCPveVS1gDEm9Zqg2dcwBHq9sWD+8kMAKyp4yMTCmmdta
         qxYdknwZMEmq333ooXziibvlb9RblKuQdPhPXdG9l0kIp2xlzWkTiReW8G32+cRr8tWZ
         SggIPGQPH3NyYg+N/C6XpiGhOgAnafrjWaip5MPXuLlxfcOZxzZ2g7mNBXQst6faMbVn
         w4yg==
X-Gm-Message-State: ACgBeo3fqIOmj2BN0AJNgM5/pDXJlMJIin1uzt3SdhP316UVAifjtk0w
        WAtrRq56RhOX+ZZHTluTdz2WC0j2JWbsdZPDbTyrHHTQiLhGTQ38044KBoi1E3I3jxjFbL9tDpx
        udeHPyaQ/xp1Ec53AqYgi2ophlV++OqrmSA==
X-Received: by 2002:a17:907:c24:b0:73d:7c20:cc45 with SMTP id ga36-20020a1709070c2400b0073d7c20cc45mr5307338ejc.294.1661511270503;
        Fri, 26 Aug 2022 03:54:30 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7Zahy8UbiX83PS8DajnrtZl2IMzDHutGMmSOQzE0/tOlE1bRATGqzyd6HBr9SlnmlJ9Wv8FQ==
X-Received: by 2002:a17:907:c24:b0:73d:7c20:cc45 with SMTP id ga36-20020a1709070c2400b0073d7c20cc45mr5307323ejc.294.1661511270291;
        Fri, 26 Aug 2022 03:54:30 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id eq23-20020a170907291700b0073d234e994csm738434ejc.185.2022.08.26.03.54.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Aug 2022 03:54:29 -0700 (PDT)
Message-ID: <8f54d308-7db1-d7d2-abd7-c57c028a28b8@redhat.com>
Date:   Fri, 26 Aug 2022 12:54:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v2] platform/x86: thinkpad_acpi: Explicitly set to
 balanced mode on startup
Content-Language: en-US
To:     Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Henrique de Moraes Holschuh <hmh@hmh.eng.br>,
        Mark Gross <markgross@kernel.org>
Cc:     madcatx@atlas.cz, ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220819180101.6383-1-mario.limonciello@amd.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220819180101.6383-1-mario.limonciello@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 8/19/22 20:01, Mario Limonciello wrote:
> It was observed that on a Thinkpad T14 Gen1 (AMD) that the platform
> profile is starting up in 'low-power' mode after refreshing what the
> firmware had.  This is most likely a firmware bug, but as a harmless
> workaround set the default profile to 'balanced' at thinkpad_acpi startup.
> 
> Reported-by: madcatx@atlas.cz
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=216347
> Signed-off-by: Mario Limonciello <mario.limonciello@amd.com>
> ---
> v1->v2
>  * Only run on AMD systems (PSC mode)

Thank you for your patch, I've applied this patch to my review-hans 
branch:
https://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git/log/?h=review-hans

Note I will also add this to the fixes branch and I will
include this in the next fixes pull-req for 6.0 .

Once I've run some tests on this branch the patches there will be
added to the platform-drivers-x86/for-next branch and eventually
will be included in the pdx86 pull-request to Linus for the next
merge-window.

Regards,

Hans

> 
>  drivers/platform/x86/thinkpad_acpi.c | 7 +++----
>  1 file changed, 3 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/thinkpad_acpi.c
> index 22d4e8633e30..2dbb9fc011a7 100644
> --- a/drivers/platform/x86/thinkpad_acpi.c
> +++ b/drivers/platform/x86/thinkpad_acpi.c
> @@ -10592,10 +10592,9 @@ static int tpacpi_dytc_profile_init(struct ibm_init_struct *iibm)
>  	/* Ensure initial values are correct */
>  	dytc_profile_refresh();
>  
> -	/* Set AMT correctly now we know current profile */
> -	if ((dytc_capabilities & BIT(DYTC_FC_PSC)) &&
> -	    (dytc_capabilities & BIT(DYTC_FC_AMT)))
> -	    dytc_control_amt(dytc_current_profile == PLATFORM_PROFILE_BALANCED);
> +	/* Workaround for https://bugzilla.kernel.org/show_bug.cgi?id=216347 */
> +	if (dytc_capabilities & BIT(DYTC_FC_PSC))
> +		dytc_profile_set(NULL, PLATFORM_PROFILE_BALANCED);
>  
>  	return 0;
>  }

