Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C1A13A3F55
	for <lists+platform-driver-x86@lfdr.de>; Fri, 11 Jun 2021 11:45:22 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230303AbhFKJrT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 11 Jun 2021 05:47:19 -0400
Received: from mga05.intel.com ([192.55.52.43]:40419 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231532AbhFKJrS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 11 Jun 2021 05:47:18 -0400
IronPort-SDR: dev4gg3fgLnqutq95FzQzQbYr2dTjbmKkqmTNhTwmihWmhcdGUR77hF7PeIxl8/jPVMYSmD4VP
 qQ22g1vnQ98A==
X-IronPort-AV: E=McAfee;i="6200,9189,10011"; a="291127883"
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="291127883"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2021 02:45:20 -0700
IronPort-SDR: bG58l2CE/gjDQTl+CEX1PuZECNbOFRTfUwPJZwHTaMp10noUFk1L8stFzdVe6y0v32rZxZGRRQ
 El6z6ViUqOwA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.83,265,1616482800"; 
   d="scan'208";a="402966947"
Received: from intel-tiger-lake-client-platform.iind.intel.com ([10.224.178.120])
  by orsmga006.jf.intel.com with ESMTP; 11 Jun 2021 02:45:18 -0700
From:   Shravan S <s.shravan@intel.com>
To:     hdegoede@redhat.com, mgross@linux.intel.com,
        platform-driver-x86@vger.kernel.org
Cc:     sudhakar.an@intel.com
Subject: [PATCH 0/1] [x86] BIOS SAR Driver for M.2 Intel Modems 
Date:   Wed, 28 Apr 2021 08:52:23 +0530
Message-Id: <20210428032224.8299-1-s.shravan@intel.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

SAR (Specific Absorption Rate) driver is a host driver implemented for Linux
or chrome platform to limit the exposure of human body to RF frequency by informing
the Intel M.2 modem to regulate the RF power based on SAR data obtained from the sensors
captured in the BIOS. ACPI interface exposes this data from the BIOS to SAR driver. The
front end application in userspace ( eg: Modem Manager) will interact with SAR driver 
to obtain information like the device mode (Example: tablets, laptops, etx), Antenna index,
baseband index, SAR table index and use available communication like MBIM interface to enable
data communication to modem for RF power regulation.

The BIOS gets notified about device mode changes through Sensor Driver. This information is 
given to a (newly created) WWAN ACPI function driver when there is a device mode change. 
The driver then uses a _DSM method to retrieve the required information from BIOS. 
This information is then forwarded/multicast to the User-space using the NETLINK interface.
A lookup table is maintained inside the BIOS which suggests the SAR Table index and Antenna 
Tuner Table Index values for individual device modes.

The SAR parameters to be used on the Modem differs for each Regulatory Mode like FCC, CE and ISED.
Hence, the SAR parameters are stored separately in the SMBIOS table in the OEM BIOS, 
for each of the Regulatory mode. Regulatory modes will be different based on the region and network
available in that region.

Hence the entire SAR functionality handling is divided into 2 parts:

•	A ACPI function driver implemented that uses a dedicated ACPI node for WWAN device. 
    sends notifications whenever there is change in Device Mode. (each OEM has different mechanism
    of updating this DEVICE Mode info). This is notified to User-space applications using 
    the RT-NETLINK interface.
•	WWAN Device Service listens for RT-NETLINK messages and routes them to Modem using MBIM. 

Shravan S (1):
  [x86]: BIOS Dynamic SAR driver for Intel M.2 Modem

 drivers/platform/x86/Kconfig                |  12 +
 drivers/platform/x86/Makefile               |   1 +
 drivers/platform/x86/intel-sar.c            | 589 ++++++++++++++++++++
 include/linux/platform_data/x86/intel-sar.h | 118 ++++
 4 files changed, 720 insertions(+)
 create mode 100644 drivers/platform/x86/intel-sar.c
 create mode 100644 include/linux/platform_data/x86/intel-sar.h


base-commit: cd1245d75ce93b8fd206f4b34eb58bcfe156d5e9
-- 
2.17.1

