Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 88B6417E14A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  9 Mar 2020 14:35:17 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbgCINfQ convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 9 Mar 2020 09:35:16 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:55486 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726427AbgCINfQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 9 Mar 2020 09:35:16 -0400
Received: from mail-pl1-f200.google.com ([209.85.214.200])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <kai.heng.feng@canonical.com>)
        id 1jBIYr-00078z-UU
        for platform-driver-x86@vger.kernel.org; Mon, 09 Mar 2020 13:35:14 +0000
Received: by mail-pl1-f200.google.com with SMTP id y4so1127691plk.3
        for <platform-driver-x86@vger.kernel.org>; Mon, 09 Mar 2020 06:35:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:content-transfer-encoding:mime-version
         :subject:message-id:date:cc:to;
        bh=oTtroT8mE+qB8LAwGZyahI3DgvWrXAp3NEs3u6g/GXk=;
        b=On1T2NtNMjqQiBNpNF8OQGL3Ub1w0M8GW681hMHC6KJKRnilUOf1r3TpAadHtOatoe
         45HM9/MP5r+4EvooF894ZYeniSneVXlYBOr1cZNbd16NCQDlA1zkw/muk5qsXNbmnXjv
         FL8hIsPM8zSwQw8r/i1ra97KSsMG37GlYVlkekhqW6WMAdzvd2yKL9ja3hfGyzXxnrjY
         hSIWm/yty6jKHyFJKVYpwyouCWpknN3TxAs2fexsnPCutBy5r9tC+Oswu64pqyJnhiKT
         0vK0pJS5PVcVZ7yYP48a7o7Lj2zzPrOEJ/anqt0+h2FQcm7EUAHm1YTpMZB82msQU/Kv
         KtyA==
X-Gm-Message-State: ANhLgQ2MdaCIkQcDJjpbFgiEcy+EB/XKMQPopA4O9qI4SczXyuxc140l
        Iux6Yf426wyO1DXmmvkwvEtgIX+BT38XOAcX0RnO4zn7oXPxkjcVvDqKcJYrBwPFxXUAP1ghZXm
        PXNne3+IfWJgoRTOI57uhiHdcZKolILCczMlTf6Oz6w04mWV0lsU=
X-Received: by 2002:a65:488d:: with SMTP id n13mr16089768pgs.91.1583760912467;
        Mon, 09 Mar 2020 06:35:12 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvcffLSE+eOR9FcWy3PtEfUmgrGHQYcaMAJr9O49b9guO+pH6qG7cKEaDl6D3giFFKlYz8xzQ==
X-Received: by 2002:a65:488d:: with SMTP id n13mr16089745pgs.91.1583760912182;
        Mon, 09 Mar 2020 06:35:12 -0700 (PDT)
Received: from [192.168.1.208] (220-133-187-190.HINET-IP.hinet.net. [220.133.187.190])
        by smtp.gmail.com with ESMTPSA id g11sm16478926pfo.184.2020.03.09.06.35.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 09 Mar 2020 06:35:11 -0700 (PDT)
From:   Kai-Heng Feng <kai.heng.feng@canonical.com>
Content-Type: text/plain;
        charset=us-ascii
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0 (Mac OS X Mail 13.0 \(3608.60.0.2.5\))
Subject: Intel telemetry debugfs doesn't work
Message-Id: <20A25709-8BA2-4036-AB13-4DC6BB1C0E84@canonical.com>
Date:   Mon, 9 Mar 2020 21:35:08 +0800
Cc:     platform-driver-x86@vger.kernel.org,
        Anthony Wong <anthony.wong@canonical.com>
To:     Rajneesh Bhardwaj <rajneesh.bhardwaj@linux.intel.com>,
        david.e.box@linux.intel.com, andy@infradead.org
X-Mailer: Apple Mail (2.3608.60.0.2.5)
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I am trying to find a way to make a Gemini Lake system successfully use intel_telemetry_debugfs.

However, telemetry_pltconfig_valid() in telemetry_debugfs_init() never succeeds.
This is due to telemetry_pltdrv_probe() never gets called, so telemetry_set_pltdata() has never set the pltconfig.

I am not sure why the module gets loaded but probe was never called, so I wonder if you guys know how to make this work.

Kai-Heng

