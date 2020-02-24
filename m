Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 68361169B96
	for <lists+platform-driver-x86@lfdr.de>; Mon, 24 Feb 2020 02:10:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727180AbgBXBKT (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 23 Feb 2020 20:10:19 -0500
Received: from mail.kernel.org ([198.145.29.99]:46226 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727167AbgBXBKS (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 23 Feb 2020 20:10:18 -0500
Received: from localhost (unknown [137.135.114.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C5207208C4;
        Mon, 24 Feb 2020 01:10:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1582506618;
        bh=bNmnhRvLAHHShiho3id6NWFT/f7CDbpbOjyUuNDByJk=;
        h=Date:From:To:To:To:Cc:Cc:Cc:Subject:In-Reply-To:References:From;
        b=ivPx5O9U5t2uyz3x2J4ct2/nehP+SP6xj6t4ebZB8ae01QhWZ2H8NizE9/u62VvI/
         HdFo0pi/K/kBbK9mMD2x36bCQtMouvEK3KruIVqeNf20Rse7l7CYOhJLROpH1kSKv+
         CqGYP8FTjc7P3636PBmWorUAl4gGSzb8UZ2RCmrw=
Date:   Mon, 24 Feb 2020 01:10:17 +0000
From:   Sasha Levin <sashal@kernel.org>
To:     Sasha Levin <sashal@kernel.org>
To:     Kristian Klausen <kristian@klausen.dk>
To:     platform-driver-x86@vger.kernel.org
Cc:     Kristian Klausen <kristian@klausen.dk>, stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Cc:     stable@vger.kernel.org
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support laptops where the first battery is named BATT
In-Reply-To: <20200223181832.17131-1-kristian@klausen.dk>
References: <20200223181832.17131-1-kristian@klausen.dk>
Message-Id: <20200224011017.C5207208C4@mail.kernel.org>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

[This is an automated email]

This commit has been processed because it contains a -stable tag.
The stable tag indicates that it's relevant for the following trees: all

The bot has tested the following trees: v5.5.5, v5.4.21, v4.19.105, v4.14.171, v4.9.214, v4.4.214.

v5.5.5: Build OK!
v5.4.21: Build OK!
v4.19.105: Failed to apply! Possible dependencies:
    11e87702be65 ("PCI: pciehp: Differentiate between surprise and safe removal")
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    80696f991424 ("PCI: pciehp: Tolerate Presence Detect hardwired to zero")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    eee6e273843d ("PCI: pciehp: Drop hotplug_slot_ops wrappers")

v4.14.171: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    4aed1cd6fb95 ("PCI: pciehp: Document struct slot and struct controller")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    c7abb2352c29 ("PCI: Remove unnecessary messages for memory allocation failures")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")

v4.9.214: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    4aed1cd6fb95 ("PCI: pciehp: Document struct slot and struct controller")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    5790a9c78e78 ("PCI: pciehp: Unify controller and slot structs")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    81c4b5bf30de ("PCI: hotplug: Constify hotplug_slot_ops")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    c7abb2352c29 ("PCI: Remove unnecessary messages for memory allocation failures")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")

v4.4.214: Failed to apply! Possible dependencies:
    125450f81441 ("PCI: hotplug: Embed hotplug_slot")
    2ac83cccabbc ("PCI: hotplug: Use list_for_each_entry() to simplify code")
    51bbf9bee34f ("PCI: hotplug: Demidlayer registration with the core")
    66725152fb9f ("PCI/hotplug: PowerPC PowerNV PCI hotplug driver")
    7973353e92ee ("platform/x86: asus-wmi: Refactor charge threshold to use the battery hooking API")
    89379f165a1b ("PCI/hotplug: pnv_php: export symbols and move struct types needed by cxl")
    97c6f25d5828 ("PCI/hotplug: ppc: correct a php_slot usage after free")
    a7da21613c4e ("PCI: hotplug: Drop hotplug_slot_info")
    b096f626a682 ("platform/x86: asus-wmi: Switch fan boost mode")
    dbb3d78f61ba ("platform/x86: asus-wmi: Call led hw_changed API on kbd brightness change")
    ed99d29b2b15 ("platform/x86: asus-wmi: Add keyboard backlight toggle support")
    ef69b03dfd32 ("MAINTAINERS: Add powerpc drivers to the powerpc section")
    ff3ce480e8b5 ("PCI: Fix all whitespace issues")


NOTE: The patch will not be queued to stable trees until it is upstream.

How should we proceed with this patch?

-- 
Thanks,
Sasha
