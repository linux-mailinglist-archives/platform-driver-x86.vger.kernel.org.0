Return-Path: <platform-driver-x86+bounces-5386-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E6CFA97B3E0
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Sep 2024 20:04:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9E0451F23D27
	for <lists+platform-driver-x86@lfdr.de>; Tue, 17 Sep 2024 18:04:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 6906245BEC;
	Tue, 17 Sep 2024 18:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jgeZdr4c"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pg1-f194.google.com (mail-pg1-f194.google.com [209.85.215.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C37B838FA1
	for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 18:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726596248; cv=none; b=O8f0zF/qQomaxhKsjXFgIlraGlb+1X1EBEECEjvzDc8+7yG3Jv3aT52VUkvDNWfur/n9VxMPJ0blUKacRotgB9KUrP9DZcy37LLIDqgFPO0zwEHw298dCasEeqx2yWrsyKgR5IqHwTdl1xROwcxQhTnQo5vBPvtn/zuQIMFQE2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726596248; c=relaxed/simple;
	bh=afgJMi13Wthu4nuk263kTKWPAPk94lskrTNeYD/qe5M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qpg8GP6emtpJM6P4uiSI7I3qz2A2RzxRMcbPjSX3vqPEy/Z8FUa0nP8bOZ+iXwzISfnkBxMrSd0oStCmkqnVj1vMOA4u+ozZcaWCaH0cM/To8twK89GqwxX6WPbMzsZ5jVtQEECYYWsgt95qhHLFiY3bsB5Dh/kK3DR8oI1vb08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jgeZdr4c; arc=none smtp.client-ip=209.85.215.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f194.google.com with SMTP id 41be03b00d2f7-7db53a20d1fso2106602a12.0
        for <platform-driver-x86@vger.kernel.org>; Tue, 17 Sep 2024 11:04:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1726596246; x=1727201046; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=uOvsW/RZHkNIlLResbhZYDXZprxDM+PLskFpSN8WmnM=;
        b=jgeZdr4c7VSnLRpXVoceZPGFUhwGFzBcxfz3YB3A9Z6wuUutq82XzXM1JqzKyyWIsS
         RGd5FpjCgx98XmPuctF7eGWAzVqqGxOgjFJp8VaTTh00cRKT3ev2ZfH7NAhQTaAOJlV7
         8EMlg+k/d4j6mtup3emtMbib6fpcN68NcDRYNkWE4E/YSuN4JjndczFgkGO3XOSFaTFJ
         aqDb0popMjVVRgbV2HZIP74RpcGhDsfTG6i4DddLJAPs1qo1onZwID8SnvqM+wVU7dW4
         vYqfatkKBFtm5zACyXQkJ+X/J/fOebam/blvoLgndntBv2NgbHgsGQDnqhc0DYCAmc2C
         PDqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726596246; x=1727201046;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uOvsW/RZHkNIlLResbhZYDXZprxDM+PLskFpSN8WmnM=;
        b=XP9PzwltIjmuwN3N5Te5gqOCfJtyVrEMcyTbzs2S2tPozAloqt120MhUWHhq0LFx+O
         5TtxRIs5EZRYlpwyjYMxKSOyw1tAnN+LNLidiI+IeZCJtxVVn07+wMANraJJ+L523oCc
         VTr94CkwCdmtEoLrFBpcEIO85Y6ObYpGW/DQ/9BC4rCzr2ST4MUXNDaUhvxZ6Kquw/sj
         WNO0R8Aj2M45faZ04Ocuxc8AzGxeZmSwL90L4Ce2kCAq75tzwKcL0RxOTF1ZIvs7xCib
         gYPCcbwweXixSs1SpN7tZCwoSR8GSNtd09lQ/3cxQaHrNj7MUal2VK+XZd5MuqdHM9Ta
         ntLA==
X-Gm-Message-State: AOJu0YzQaWw9XhwYMFkj5lE3Nk9B6IyGW0htNxikil4c1lLFDvatGKDI
	t2eOU5jS+Y51hl1PfMZ+CpvGUR1MbTEhTcYJ80GwdHMaZy5VGjqa
X-Google-Smtp-Source: AGHT+IGquGaaEdWVcfutYNtmY5Mi5iK1S52j6pl3vVcbJeX1JPynYTK48d43Hy4+j/TQsV0kJLSFdw==
X-Received: by 2002:a05:6a21:164a:b0:1d2:efe7:22e with SMTP id adf61e73a8af0-1d2efe703b5mr399568637.17.1726596245905;
        Tue, 17 Sep 2024 11:04:05 -0700 (PDT)
Received: from localhost.localdomain.localdomain (n220246094186.netvigator.com. [220.246.94.186])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71944b9ac28sm5627214b3a.172.2024.09.17.11.04.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Sep 2024 11:04:05 -0700 (PDT)
From: Zach Wade <zachwade.k@gmail.com>
To: srinivas.pandruvada@linux.intel.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org,
	Zach Wade <zachwade.k@gmail.com>
Subject: [PATCH] platform/x86: ISST: Fix the KASAN report slab-out-of-bounds bug
Date: Wed, 18 Sep 2024 02:03:50 +0800
Message-ID: <20240917180350.4061-1-zachwade.k@gmail.com>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In my vmware virtualization environment, after loading the 
isst_if_common and isst_if_mbox_msr modules on the 64 core, the kasan 
report was triggered.
After consulting the kernel manual (Documentation/arch/x86/topology.rst),
I think in _isst_if_get_pci_dev, topology_physical_package_id should be
replaced with topology_logical_package_id.

kasan bug report:
[   19.411889] ==================================================================
[   19.413702] BUG: KASAN: slab-out-of-bounds in _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
[   19.415634] Read of size 8 at addr ffff888829e65200 by task cpuhp/16/113
[   19.417368]
[   19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G            E      6.9.0 #10
[   19.420435] Hardware name: VMware, Inc. VMware20,1/440BX Desktop Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713 07/28/2022
[   19.422687] Call Trace:
[   19.424091]  <TASK>
[   19.425448]  dump_stack_lvl+0x5d/0x80
[   19.426963]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
[   19.428694]  print_report+0x19d/0x52e
[   19.430206]  ? __pfx__raw_spin_lock_irqsave+0x10/0x10
[   19.431837]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
[   19.433539]  kasan_report+0xf0/0x170
[   19.435019]  ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
[   19.436709]  _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
[   19.438379]  ? __pfx_sched_clock_cpu+0x10/0x10
[   19.439910]  isst_if_cpu_online+0x406/0x58f [isst_if_common]
[   19.441573]  ? __pfx_isst_if_cpu_online+0x10/0x10 [isst_if_common]
[   19.443263]  ? ttwu_queue_wakelist+0x2c1/0x360
[   19.444797]  cpuhp_invoke_callback+0x221/0xec0
[   19.446337]  cpuhp_thread_fun+0x21b/0x610
[   19.447814]  ? __pfx_cpuhp_thread_fun+0x10/0x10
[   19.449354]  smpboot_thread_fn+0x2e7/0x6e0
[   19.450859]  ? __pfx_smpboot_thread_fn+0x10/0x10
[   19.452405]  kthread+0x29c/0x350
[   19.453817]  ? __pfx_kthread+0x10/0x10
[   19.455253]  ret_from_fork+0x31/0x70
[   19.456685]  ? __pfx_kthread+0x10/0x10
[   19.458114]  ret_from_fork_asm+0x1a/0x30
[   19.459573]  </TASK>
[   19.460853]
[   19.462055] Allocated by task 1198:
[   19.463410]  kasan_save_stack+0x30/0x50
[   19.464788]  kasan_save_track+0x14/0x30
[   19.466139]  __kasan_kmalloc+0xaa/0xb0
[   19.467465]  __kmalloc+0x1cd/0x470
[   19.468748]  isst_if_cdev_register+0x1da/0x350 [isst_if_common]
[   19.470233]  isst_if_mbox_init+0x108/0xff0 [isst_if_mbox_msr]
[   19.471670]  do_one_initcall+0xa4/0x380
[   19.472903]  do_init_module+0x238/0x760
[   19.474105]  load_module+0x5239/0x6f00
[   19.475285]  init_module_from_file+0xd1/0x130
[   19.476506]  idempotent_init_module+0x23b/0x650
[   19.477725]  __x64_sys_finit_module+0xbe/0x130
[   19.476506]  idempotent_init_module+0x23b/0x650
[   19.477725]  __x64_sys_finit_module+0xbe/0x130
[   19.478920]  do_syscall_64+0x82/0x160
[   19.480036]  entry_SYSCALL_64_after_hwframe+0x76/0x7e
[   19.481292]
[   19.482205] The buggy address belongs to the object at ffff888829e65000
 which belongs to the cache kmalloc-512 of size 512
[   19.484818] The buggy address is located 0 bytes to the right of
 allocated 512-byte region [ffff888829e65000, ffff888829e65200)
[   19.487447]
[   19.488328] The buggy address belongs to the physical page:
[   19.489569] page: refcount:1 mapcount:0 mapping:0000000000000000 index:0xffff888829e60c00 pfn:0x829e60
[   19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
[   19.492466] anon flags: 0x57ffffc0000840(slab|head|node=1|zone=2|lastcpupid=0x1fffff)
[   19.493914] page_type: 0xffffffff()
[   19.494988] raw: 0057ffffc0000840 ffff88810004cc80 0000000000000000 0000000000000001
[   19.496451] raw: ffff888829e60c00 0000000080200018 00000001ffffffff 0000000000000000
[   19.497906] head: 0057ffffc0000840 ffff88810004cc80 0000000000000000 0000000000000001
[   19.499379] head: ffff888829e60c00 0000000080200018 00000001ffffffff 0000000000000000
[   19.500844] head: 0057ffffc0000003 ffffea0020a79801 ffffea0020a79848 00000000ffffffff
[   19.502316] head: 0000000800000000 0000000000000000 00000000ffffffff 0000000000000000
[   19.503784] page dumped because: kasan: bad access detected
[   19.505058]
[   19.505970] Memory state around the buggy address:
[   19.507172]  ffff888829e65100: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   19.508599]  ffff888829e65180: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
[   19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   19.510014]                    ^
[   19.510016]  ffff888829e65280: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   19.510018]  ffff888829e65300: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
[   19.515367] ==================================================================

Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with Sub-NUMA clustering")
Signed-off-by: Zach Wade <zachwade.k@gmail.com>
---
 drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
index 10e21563fa46..80654aacd5bd 100644
--- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
+++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
@@ -316,7 +316,7 @@ static struct pci_dev *_isst_if_get_pci_dev(int cpu, int bus_no, int dev, int fn
 	    cpu >= nr_cpu_ids || cpu >= num_possible_cpus())
 		return NULL;
 
-	pkg_id = topology_physical_package_id(cpu);
+	pkg_id = topology_logical_package_id(cpu);
 
 	bus_number = isst_cpu_info[cpu].bus_info[bus_no];
 	if (bus_number < 0)
-- 
2.46.0


