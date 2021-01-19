Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2CECB2FC012
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Jan 2021 20:34:39 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728033AbhASTdw convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 19 Jan 2021 14:33:52 -0500
Received: from mail.kernel.org ([198.145.29.99]:46828 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728501AbhASTdm (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jan 2021 14:33:42 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 53E6D2310C
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2021 19:33:00 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id 4FDB8815C5; Tue, 19 Jan 2021 19:33:00 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 211117] dma_mmap_coherent() - garbage sound output with
 mem_encrypt on Ryzen platform
Date:   Tue, 19 Jan 2021 19:33:00 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: high
X-Bugzilla-Who: thomas.lendacky@amd.com
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: cc
Message-ID: <bug-211117-215701-Am6NIQ8Vem@https.bugzilla.kernel.org/>
In-Reply-To: <bug-211117-215701@https.bugzilla.kernel.org/>
References: <bug-211117-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=211117

thomas.lendacky@amd.com changed:

           What    |Removed                     |Added
----------------------------------------------------------------------------
                 CC|                            |thomas.lendacky@amd.com

--- Comment #17 from thomas.lendacky@amd.com ---
This sounds like a mismatch between the encryption bit in the kernel and the
encryption bit in userspace. It looks like that should be taken care of by the
dma_pgprot() call in dma_mmap_attrs() or in iommu_dma_mmap(). But maybe the
force_dma_unencrypted() in arch/x86/mm/mem_encrypt.c needs to understand if the
IOMMU is doing the mapping. Since, even if the device doesn't support 48-bit or
higher DMA, it will still done encrypted because of the IOMMU. I don't see any
dmesg output, is the IOMMU enabled? What happens if you do iommu=pt on the
kernel command line?

Alternatively, if you want memory encryption for your bare-metal system, you
can see if the BIOS supports TSME (Transparent SME). Then you can remove
mem_encrypt=on or add mem_encrypt=off (if enabled by default), and still get
memory encryption.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
