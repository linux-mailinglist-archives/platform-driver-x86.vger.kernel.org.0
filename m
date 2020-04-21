Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id EE5CF1B1EC4
	for <lists+platform-driver-x86@lfdr.de>; Tue, 21 Apr 2020 08:29:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725904AbgDUG3O convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 21 Apr 2020 02:29:14 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:43599 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725831AbgDUG3N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 21 Apr 2020 02:29:13 -0400
Received: from mail-pg1-f197.google.com ([209.85.215.197])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jQmP9-0004vv-CF
        for platform-driver-x86@vger.kernel.org; Tue, 21 Apr 2020 06:29:11 +0000
Received: by mail-pg1-f197.google.com with SMTP id 35so12210147pgw.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 20 Apr 2020 23:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=dwwMBDomxjYomSwY9WDiz7BymnYlfvN1mFls8ltcKNo=;
        b=sUN7op6FCauMWfyA504yEDWQ2w6qMq4zt2IInNXjt0L3Z9JOdLhoKtq7WzoKRfMppb
         4Llwkosjv22uPFUfeNg43fxiN2BtlHxeXJGNiQXrfY3Bv7NxLKfCT0Hw9wft/uT4afF1
         A3VUsGaNZBO+UnLfWlZNXF8Fr717C5HPqZUXIZvlMrSWUICo1xXsOCqn/8mjPZQmxpeg
         Z7MPPJo0ef/v2Cp9ve3vCRSHi2v8kajRrMztEDG5pFnobhRsntl4tDcRpHGtmBjnRm5o
         yuPTZCGMmYotAMn5NHBocimxXlzw9qysCiPBJYe5iERN4obYSM255Z6q59bqtJtExuk0
         48xQ==
X-Gm-Message-State: AGi0PuZiLz+aqPMz4lqHEkimjEIyxOYAFKfOIMOUy4/qQiCT2ERovwTO
        EjXvrh7R53CXFDCk3jHqEBM/28GVXfogMURVeqzFJxvA9x/ZdHacJ+nvKJi2MScbtEcYHsk8X0u
        A18SipGoiAdqaLly7kBYd6YYtJDe/BKRBF3SwfxgxRM4fUpMAukI=
X-Received: by 2002:a17:902:444:: with SMTP id 62mr20262771ple.109.1587450549860;
        Mon, 20 Apr 2020 23:29:09 -0700 (PDT)
X-Google-Smtp-Source: APiQypJABpjwqskbscsn03rGylli9q30YqvtaculN0idrLVvFP5N9E/p5E1OO1B3CX4DmhoS2WiJaQ==
X-Received: by 2002:a17:902:444:: with SMTP id 62mr20262748ple.109.1587450549523;
        Mon, 20 Apr 2020 23:29:09 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id p2sm506325pgh.25.2020.04.20.23.29.08
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 20 Apr 2020 23:29:09 -0700 (PDT)
Content-Type: text/plain;
        charset=us-ascii
Mime-Version: 1.0 (Mac OS X Mail 13.4 \(3608.80.23.2.2\))
Subject: Re: Intel telemetry debugfs doesn't work
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
In-Reply-To: <2f8fefde2a1fb2771c9de6d8a2cfa20e2c611824.camel@linux.intel.com>
Date:   Tue, 21 Apr 2020 14:29:06 +0800
Cc:     andy@infradead.org, platform-driver-x86@vger.kernel.org,
        Anthony Wong <anthony.wong@canonical.com>
Content-Transfer-Encoding: 8BIT
Message-Id: <5CBE4757-A982-436E-8050-0B43798F77EF@canonical.com>
References: <20A25709-8BA2-4036-AB13-4DC6BB1C0E84@canonical.com>
 <2f8fefde2a1fb2771c9de6d8a2cfa20e2c611824.camel@linux.intel.com>
To:     david.e.box@linux.intel.com
X-Mailer: Apple Mail (2.3608.80.23.2.2)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi David,

> On Mar 31, 2020, at 23:05, David E. Box <david.e.box@linux.intel.com> wrote:
> 
> Hi Kai-Heng,
> 
> This is likely because the system you are using is missing the ACPI
> data that exposes the IPC device used to access telemetry. To be sure,
> file a bugzilla and add the ACPI dump and we can confirm. Thanks.

Filed on here:
https://bugzilla.kernel.org/show_bug.cgi?id=207381

Kai-Heng

> 
> David
> 
> On Mon, 2020-03-09 at 21:35 +0800, Kai-Heng Feng wrote:
>> Hi,
>> 
>> I am trying to find a way to make a Gemini Lake system successfully
>> use intel_telemetry_debugfs.
>> 
>> However, telemetry_pltconfig_valid() in telemetry_debugfs_init()
>> never succeeds.
>> This is due to telemetry_pltdrv_probe() never gets called, so
>> telemetry_set_pltdata() has never set the pltconfig.
>> 
>> I am not sure why the module gets loaded but probe was never called,
>> so I wonder if you guys know how to make this work.
>> 
>> Kai-Heng
>> 
> 

