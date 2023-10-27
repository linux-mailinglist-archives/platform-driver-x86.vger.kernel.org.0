Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C78187D9C48
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 Oct 2023 16:55:58 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1345833AbjJ0Oz6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 27 Oct 2023 10:55:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35046 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345845AbjJ0Oz5 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 Oct 2023 10:55:57 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7102110E
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 07:55:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1698418513;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=7GcgtRljqp8I6+SbcnMUmqHUR4tncRi9vmDfTIxBtlw=;
        b=XFEbk2vSTA6RPgiuF6r2OOnvLbh3HJZ9QATpk/COrp03skGQVBBs7D331YMiQ3qOVQwSOa
        uu0xZ7KjucqYVguy+b4Rb1XWcerZPFprmeGCyElTfZH/wbBbZY6C2fDoD8UbryW5pGfCmr
        LLNzy5X+hW4Si/Pi9mYASbxvWF9kGkU=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-xKjEKA2oP12fI4AefV6NHA-1; Fri, 27 Oct 2023 10:55:12 -0400
X-MC-Unique: xKjEKA2oP12fI4AefV6NHA-1
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-53e26bbbc63so1615262a12.3
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 Oct 2023 07:55:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698418511; x=1699023311;
        h=content-transfer-encoding:content-language:cc:to:subject:from
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=7GcgtRljqp8I6+SbcnMUmqHUR4tncRi9vmDfTIxBtlw=;
        b=F+WcDXtFiG9sBjx/jgynDy11yskdKGu2H60duqmoc0C9Hb2DQNTP3CB1slGkMlEPIy
         VClK8OLqjE+eesBQj8QEeQuoLayiB/rWYY6G96QUkjXin/ykaQRyUuO88etSo5rUj07p
         nOJfBy4dOEjhW4M6DLopNUJEe72UfcEQeB1MSGTHOu7sVpWH7IO0g71DczMWHWmY/PiO
         a2PaJRPAPUZ/9MtaHHwKU/SLVT0iaaggfqoANnimI3RJcjsDCS44V4Z6xcg6XOEsgie+
         6yjVUOE/ty/swvWMC4WyluYgjb0drTBgBw/VYi1vQPOl0iBix+jOmfC6eRTDwfEPcPTD
         rBEw==
X-Gm-Message-State: AOJu0Yw7WRfv8tHtu9zAzm67YryVbj5DYy2eUInMSWmpzl00AjT0II3D
        S2bX531SuYY2ddhNTZgMbVTAue1/4/ccqD/Gnyr5b1Io9U76MmuIBA//trapsnA9AGda3CiJWRi
        21khTDjiOw3bQkSVlaQWTIWxTVpO6OJiXmQ==
X-Received: by 2002:a17:907:7f8c:b0:9b8:b683:5854 with SMTP id qk12-20020a1709077f8c00b009b8b6835854mr3108900ejc.61.1698418510939;
        Fri, 27 Oct 2023 07:55:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBLB+7mAs+KwOKlv3cy3r8ss/FeYSMLZK3aFqu+TIHhymj+Pn9FNh4CszMk/hjBCRVHuAd9A==
X-Received: by 2002:a17:907:7f8c:b0:9b8:b683:5854 with SMTP id qk12-20020a1709077f8c00b009b8b6835854mr3108887ejc.61.1698418510654;
        Fri, 27 Oct 2023 07:55:10 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id u27-20020a1709063b9b00b0099bcb44493fsm1325920ejf.147.2023.10.27.07.55.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Oct 2023 07:55:10 -0700 (PDT)
Message-ID: <00ebd650-72c1-0901-27bc-ae18867ed4b4@redhat.com>
Date:   Fri, 27 Oct 2023 16:55:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] platform-drivers-x86 for 6.6-6
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org,
        =?UTF-8?Q?Ilpo_J=c3=a4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        David Lazar <dlazar@gmail.com>,
        Mario Limonciello <mario.limonciello@amd.com>,
        Mark Pearson <mpearson-lenovo@squebb.ca>
Content-Language: en-US, nl
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Linus,

Sorry for the somewhat last minute pull-request. This pull contains
a single patch to extend the AMD PMC driver DMI quirk list for laptops
which need special handling to avoid NVME s2idle suspend/resume errors.

The chance of this causing regressions should be close to 0 since it
just extends a list of DMI quirks.

I decided to send this in at the last minute because together with
"x86/i8259: Skip probing when ACPI/MADT advertises PCAT compatibility"
which is pending in tip x86/urgent this fixes a whole group of 9 Lenovo
AMD Mendocino Soc based laptop models from being unusable with Linux
to them working fine with Linux.

Regards,

Hans



The following changes since commit 99c09c985e5973c8f0ad976ebae069548dd86f12:

  platform/mellanox: mlxbf-tmfifo: Fix a warning message (2023-10-18 15:38:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-v6.6-6

for you to fetch changes up to 3bde7ec13c971445faade32172cb0b4370b841d9:

  platform/x86: Add s2idle quirk for more Lenovo laptops (2023-10-27 16:42:12 +0200)

----------------------------------------------------------------
platform-drivers-x86 for v6.6-6

A single patch to extend the AMD PMC driver DMI quirk list for laptops
which need special handling to avoid NVME s2idle suspend/resume errors.

----------------------------------------------------------------
David Lazar (1):
      platform/x86: Add s2idle quirk for more Lenovo laptops

 drivers/platform/x86/amd/pmc/pmc-quirks.c | 73 +++++++++++++++++++++++++++++++
 1 file changed, 73 insertions(+)

