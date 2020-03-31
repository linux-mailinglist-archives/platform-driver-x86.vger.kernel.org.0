Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 26CF419992A
	for <lists+platform-driver-x86@lfdr.de>; Tue, 31 Mar 2020 17:05:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgCaPF3 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 31 Mar 2020 11:05:29 -0400
Received: from mga07.intel.com ([134.134.136.100]:57957 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730408AbgCaPF3 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 31 Mar 2020 11:05:29 -0400
IronPort-SDR: ANV/le9oWwpJkxswQXZwEZ4SUfLgT8MMaP/ue3Nndy71hebSoNeDpgtxv6Wqe6HVcuO76xNYju
 bn/vuCWSiPeA==
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Mar 2020 08:05:28 -0700
IronPort-SDR: z5R1onWewQDfiFOkTpXPLO9fV3T9QIsteecqXQ5XQ1NeFRW1JnGqMUUQiZRqyd6QA/ygaaYU35
 3u9JY3Z9Q16w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.72,328,1580803200"; 
   d="scan'208";a="294952685"
Received: from linux.intel.com ([10.54.29.200])
  by FMSMGA003.fm.intel.com with ESMTP; 31 Mar 2020 08:05:27 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.7.201.137])
        by linux.intel.com (Postfix) with ESMTP id 173CA580565;
        Tue, 31 Mar 2020 08:05:27 -0700 (PDT)
Message-ID: <2f8fefde2a1fb2771c9de6d8a2cfa20e2c611824.camel@linux.intel.com>
Subject: Re: Intel telemetry debugfs doesn't work
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Kai-Heng Feng <kai.heng.feng@canonical.com>, andy@infradead.org
Cc:     platform-driver-x86@vger.kernel.org,
        Anthony Wong <anthony.wong@canonical.com>
Date:   Tue, 31 Mar 2020 08:05:26 -0700
In-Reply-To: <20A25709-8BA2-4036-AB13-4DC6BB1C0E84@canonical.com>
References: <20A25709-8BA2-4036-AB13-4DC6BB1C0E84@canonical.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.3 (3.34.3-1.fc31) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Kai-Heng,

This is likely because the system you are using is missing the ACPI
data that exposes the IPC device used to access telemetry. To be sure,
file a bugzilla and add the ACPI dump and we can confirm. Thanks.

David

On Mon, 2020-03-09 at 21:35 +0800, Kai-Heng Feng wrote:
> Hi,
> 
> I am trying to find a way to make a Gemini Lake system successfully
> use intel_telemetry_debugfs.
> 
> However, telemetry_pltconfig_valid() in telemetry_debugfs_init()
> never succeeds.
> This is due to telemetry_pltdrv_probe() never gets called, so
> telemetry_set_pltdata() has never set the pltconfig.
> 
> I am not sure why the module gets loaded but probe was never called,
> so I wonder if you guys know how to make this work.
> 
> Kai-Heng
> 

