Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EBFB46945CE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Feb 2023 13:32:43 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230121AbjBMMcm (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Feb 2023 07:32:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43554 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjBMMcl (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Feb 2023 07:32:41 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C84D46A0
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:31:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676291515;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zBZ75M4Yenbhu3faYe+Enj0ytlfjFVpVLTtBOwzZfDs=;
        b=QkfSSI90JjaCd7GjYkSj72e+g/j5Eujr6sKPaIVofpWRTzBqNHkP3ytGmUUIt3UVqdHlJR
        LwYzkLAubgwmJiPQN6e4wJzZm3TJ9T24BURWQgCj5x9foZQ0Tp9yPpVqXU7Kv1SbujQ448
        efx7xlQtvAVWfg9ZEN+iHxQMzaCt11g=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-520-t0Ff0t5IPtqqTQeQHQ3fMg-1; Mon, 13 Feb 2023 07:31:54 -0500
X-MC-Unique: t0Ff0t5IPtqqTQeQHQ3fMg-1
Received: by mail-ed1-f69.google.com with SMTP id fi21-20020a056402551500b004acb5c6e52bso3435835edb.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 13 Feb 2023 04:31:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zBZ75M4Yenbhu3faYe+Enj0ytlfjFVpVLTtBOwzZfDs=;
        b=ZptdelY17SZAvo6L6vhmUJo7T8AgF2jQQETYVQxvzGDqLNRKpRPCSERAdWQvJMD5WA
         KF20HpOSMO3UvWz8YEKfRrmC7mqTgzgKEH77tbOV14BxxAcxBOlPyMYNX50wqcB3YZvt
         hzSfmwJ0VN/qlYYNE7pt9dJONGJoArNW+Bhpxe9QCdfbsZz2rQdUJaqpeHD5u6wQjNGi
         KkHsHTccp+BOIsCzc47CLqQ+Dj1NWpycHsfBACiPxUPrVUtfPCBPHFznKCsrk8ZldUXE
         cmqtBNku5wOPkfmPnHcPNvf0qXpJgo9eSMrk5BvdcMsJtJSwT6HPK5k6oSseo7NXn0/S
         zSvg==
X-Gm-Message-State: AO0yUKVyDh5OqnASJ//Y5wSXMLlaiWhkv1aI8iLmDdjpepp9+MDNc+cE
        7+HueANY6gpPVrZY69bZbEcGMx0BrtVABa3pSxnY6ZvCJmWC2yeaWNuJO5rQ/LHUOyYeuU5ypYs
        thZNFDLXCqxlhOea01u1OuD54wHU4JbXp9g==
X-Received: by 2002:a17:906:4b0f:b0:886:ec6e:4c1 with SMTP id y15-20020a1709064b0f00b00886ec6e04c1mr23614041eju.59.1676291513085;
        Mon, 13 Feb 2023 04:31:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9p5DtT123vpTJkVDqIwud9hwK6Y1HV0n1Q3xwdJBhiSNzZJanBsXflTd+NNYTbVa0PedCLRA==
X-Received: by 2002:a17:906:4b0f:b0:886:ec6e:4c1 with SMTP id y15-20020a1709064b0f00b00886ec6e04c1mr23614032eju.59.1676291512889;
        Mon, 13 Feb 2023 04:31:52 -0800 (PST)
Received: from [10.40.98.142] ([78.108.130.194])
        by smtp.gmail.com with ESMTPSA id g25-20020a170906349900b0088519b92074sm6728969ejb.128.2023.02.13.04.31.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 04:31:52 -0800 (PST)
Message-ID: <233344ca-5df1-abd9-6fb6-c04634f1b401@redhat.com>
Date:   Mon, 13 Feb 2023 13:31:51 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: RFI: Tablet mode support on HP Pro x360 435 G9 w/ AMD Ryzen 7
 5825U
Content-Language: en-US
To:     Carsten Hatger <xmb8dsv4@gmail.com>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org,
        Jorge Lopez <jorgealtxwork@gmail.com>
Cc:     mario.limonciello@amd.com, Shyam-sundar.S-k@amd.com
References: <CACp=KFQN79Rz0CHP-5kwP9Y5Y9bEAoN0eJzoOpSejg6aF9qnpw@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACp=KFQN79Rz0CHP-5kwP9Y5Y9bEAoN0eJzoOpSejg6aF9qnpw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.4 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Carsten,

On 2/13/23 11:43, Carsten Hatger wrote:
> Dear all,
> 
> I'd like to have tablet mode support on my system, probably by means
> an linux input device such as implemented in the intel platform
> specific driver drivers/platform/x86/intel/vbtn.c [0]
> 
> In the end I hope GNOME eventually to rotate the systems display and
> to show some virtual keyboard (upon users request), cf. for [3]
> 
> It appears there has already been a patch proposed  by the chromium
> team to support device PNP0C60 [1] but not merged to [5].
> 
> Since the system of interest is a HP Probook, there is already a
> driver providing virtual buttons,namely hp-wmi [6]. However, the
> driver loads probes and loads successfully but doesn't provide any
> additional functionality plus some non critical errors on incorrect
> ACPI method calls.
> 
> I've noticed AMD has started to provide platform specific driver(s)
> such as pmf [2]. To my knowledge there is no support for CEZANNE/green
> sardine based systems (yet).
> 
> What would be recommended practice and subsystem/folder to provide
> such capability by means of a (platform specific) driver? At least the
> CID PNP0C60 seems to be held by Microsoft [4] and thus be common to
> both amd and intel platforms [4]. However, HID INT33D6 is held by
> Intel and HID AMDI0081 by AMD. Yet I'm not quite sure if
> iio-sensor-proxy [7] needs to be involved, too.

The first thing to do here is to figure out which (ACPI) device
is the right device to get the SW_TABLET_MODE events from on this
device.

Maybe Jorge (added to the Cc) can help with this ?

Regards,

Hans




> [0] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/intel/vbtn.c?h=v6.2-rc8
> [1] https://lore.kernel.org/lkml/1472628817-3145-1-git-send-email-wnhuang@google.com/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/amd/pmf?h=v6.2-rc8
> [3] https://gitlab.gnome.org/GNOME/mutter/-/issues/1760
> [4] https://learn.microsoft.com/en-us/windows-hardware/drivers/gpiobtn/button-implementation
> [5] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/acpi/button.c?h=v6.2-rc8
> [6] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/platform/x86/hp/hp-wmi.c?h=v6.2-rc8
> [7] https://gitlab.freedesktop.org/hadess/iio-sensor-proxy/
> 

