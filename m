Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 85CDC400C4F
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Sep 2021 19:55:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237237AbhIDR4G (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 4 Sep 2021 13:56:06 -0400
Received: from mail-4322.protonmail.ch ([185.70.43.22]:31957 "EHLO
        mail-4322.protonmail.ch" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231181AbhIDR4F (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 4 Sep 2021 13:56:05 -0400
Date:   Sat, 04 Sep 2021 17:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1630778102;
        bh=hGlARYLMDWEvCt+iTa0uRBcG6ID4jKfIEv+EEGdXiJo=;
        h=Date:To:From:Reply-To:Subject:From;
        b=xCJ0eVWHVN3etS7hu+2F120mVY/gDVuw0HQsp7iEohTNUBDrvRNeq3TqBC4D65mgf
         sd4gs6OCyIsGkpIy4NbhuUanHo/MFb3ljzXB9dVo80Ezn6m75rExljRV03GkkKx/3D
         +mMCdF1knGsqovMYceMH+CcFn1ZNwN4Qt45jP9vk=
To:     Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        platform-driver-x86@vger.kernel.org
From:   =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Reply-To: =?utf-8?Q?Barnab=C3=A1s_P=C5=91cze?= <pobrn@protonmail.com>
Subject: [RFC PATCH v1 00/30] platform/x86: wmi: minor improvements
Message-ID: <20210904175450.156801-1-pobrn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.2 required=10.0 tests=ALL_TRUSTED,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM shortcircuit=no
        autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on
        mailout.protonmail.ch
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series contains minor changes in the WMI bus, which
aim to remove unnecessary code, get rid of duplication, and
various style changes.

Most of the patches should have no observable effect on the behaviour.

Barnab=C3=A1s P=C5=91cze (30):
  platform/x86: wmi: fix kernel doc
  platform/x86: wmi: fix checkpatch warnings
  platform/x86: wmi: remove commas
  platform/x86: wmi: remove unnecessary initialization
  platform/x86: wmi: remove unnecessary initializations
  platform/x86: wmi: remove unnecessary variable
  platform/x86: wmi: remove unnecessary argument
  platform/x86: wmi: remove unnecessary casts
  platform/x86: wmi: remove stray empty line
  platform/x86: wmi: remove unnecessary checks
  platform/x86: wmi: use BIT() macro
  platform/x86: wmi: use bool instead of int
  platform/x86: wmi: use dynamic debug to print data about events
  platform/x86: wmi: use guid_t and guid_equal()
  platform/x86: wmi: make GUID block packed
  platform/x86: wmi: use sysfs_emit()
  platform/x86: wmi: use sizeof() instead of hard-coding
  platform/x86: wmi: use !p to check for NULL
  platform/x86: wmi: use sizeof(*p) in allocation
  platform/x86: wmi: remove variable
  platform/x86: wmi: move variables
  platform/x86: wmi: align arguments of functions
  platform/x86: wmi: improve debug messages
  platform/x86: wmi: do not fail if disabling fails
  platform/x86: wmi: simplify error handling logic
  platform/x86: wmi: introduce helper to convert driver to WMI driver
  platform/x86: wmi: introduce helper to generate method names
  platform/x86: wmi: introduce helper to determine type
  platform/x86: wmi: introduce helper to retrieve event data
  platform/x86: wmi: more detailed error reporting in find_guid()

 drivers/platform/x86/wmi.c | 378 +++++++++++++++++++------------------
 1 file changed, 197 insertions(+), 181 deletions(-)

--
2.33.0


