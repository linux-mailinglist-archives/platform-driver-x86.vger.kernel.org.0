Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 33232330AB8
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Mar 2021 10:59:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231342AbhCHJ6e (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 8 Mar 2021 04:58:34 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34075 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231362AbhCHJ6L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 8 Mar 2021 04:58:11 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1615197490;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=lHjTxRwBzXntJjnY0Ab0qNZeR7P16kUC/t+zvNtECvA=;
        b=FjaSRQGNW7S+wHv9tqdqeESYZxEeuyN0pIk7RtXVPeu14q1CZ2EeFTucHBMVPzyb/Jubv3
        7Z7t3J+M4nmYs4mI3axnwADu01TJMye9Zql6v3/IqR0DrAdYKoMmSDlH23DXbanZ1AOQIx
        18rxxvk2QOURV9gRpU0M08fiFI2Pf80=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387-OiaJ3B1jNmKYpLk_M2csvA-1; Mon, 08 Mar 2021 04:58:08 -0500
X-MC-Unique: OiaJ3B1jNmKYpLk_M2csvA-1
Received: by mail-ej1-f70.google.com with SMTP id e13so3826148ejd.21
        for <platform-driver-x86@vger.kernel.org>; Mon, 08 Mar 2021 01:58:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lHjTxRwBzXntJjnY0Ab0qNZeR7P16kUC/t+zvNtECvA=;
        b=enRfVa0DRKhN1e/2hxwhAn/TuXutMdQvzCWsRvhHFQ3Y/F1rQdjVfOfDxc7N4t8KvE
         9+XUNXMbZlO99bMi4eCan2I1o03AnBnKuQGi+gpe80e/WR8NxAFWQsnhrQ9kEk/hD4MW
         YjD9OOnwmiu82nL7/r0K42ZQIN7SnjFWBFpvnOYfjqhHWKkXw3hmWm8kazCwTWijvUpz
         foG7/p2hTn53SJS9g31CG7YLt1JUxKGQ9M/P093LVvSOqHsp91EuPf43pNkjhKNPm76+
         NkikATuYai4hlduhM4q9BhIPINTVExhdDoFzb363G2kDfAjjT91no0Od53dkjUQgQAIH
         Vc+Q==
X-Gm-Message-State: AOAM530xDuka4gnBmPIG7oIIP4+J7hZxZhXZCgdMVHmO0e0KEMjHUMiA
        +KhzF+6t6Lly9FuVJEM9MvWqeifT02LYs/mEuY3gaKrwb+jIeDa6n1KWjU8M7r2yPIs4ZtM5JQZ
        tBKkZ6YAVsA254d+2B/CykkP+Mh8WGtoEsA==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr2161721edb.189.1615197487650;
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwZ6fQefjQyWn03VsnOaZl1Am51qstz49gLS1yCwyNiMnlnimfXdBtL7FsXaaQ/90rp9JZYFg==
X-Received: by 2002:a05:6402:254f:: with SMTP id l15mr2161713edb.189.1615197487533;
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id b6sm6075855ejb.8.2021.03.08.01.58.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Mar 2021 01:58:07 -0800 (PST)
Subject: Re: [RFC PATCH v2 2/8] MAINTAINERS: Add entry for devm helpers
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>,
        mazziesaccount@gmail.com
Cc:     MyungJoo Ham <myungjoo.ham@samsung.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Mark Gross <mgross@linux.intel.com>,
        Sebastian Reichel <sre@kernel.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Mark Brown <broonie@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-hwmon@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, linux-pm@vger.kernel.org,
        linux-watchdog@vger.kernel.org
References: <cover.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
 <c9119c0a8d4daebff0221c67830b54314fc9e0f6.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <c40d1454-836d-cbf2-d2de-232e5b39b9e9@redhat.com>
Date:   Mon, 8 Mar 2021 10:58:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <c9119c0a8d4daebff0221c67830b54314fc9e0f6.1615187284.git.matti.vaittinen@fi.rohmeurope.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 3/8/21 9:14 AM, Matti Vaittinen wrote:
> Devm helper header containing small inline helpers was added.
> Hans promised to maintain it.

Yes I did promise that, didn't I?  FWIW going this route is still
fine by me, assuming that having someone else maintain this makes
this easier on / more acceptable to Greg.

This is still going to need an Ack from Greg though.

Regards,

Hans



> 
> Add Hans as maintainer and myself as designated reviewer.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> ---
>  MAINTAINERS | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index d92f85ca831d..ffcb00006e14 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -5169,6 +5169,12 @@ M:	Torben Mathiasen <device@lanana.org>
>  S:	Maintained
>  W:	http://lanana.org/docs/device-list/index.html
>  
> +DEVICE RESOURCE MANAGEMENT HELPERS
> +M:	Hans de Goede <hdegoede@redhat.com>
> +R:	Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> +S:	Maintained
> +F:	include/linux/devm-helpers.h
> +
>  DEVICE-MAPPER  (LVM)
>  M:	Alasdair Kergon <agk@redhat.com>
>  M:	Mike Snitzer <snitzer@redhat.com>
> 

