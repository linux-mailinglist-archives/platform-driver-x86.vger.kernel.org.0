Return-Path: <platform-driver-x86+bounces-6043-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id B97A79A3C0F
	for <lists+platform-driver-x86@lfdr.de>; Fri, 18 Oct 2024 12:51:20 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 554D8281B72
	for <lists+platform-driver-x86@lfdr.de>; Fri, 18 Oct 2024 10:51:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2058F201266;
	Fri, 18 Oct 2024 10:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KaXCl6QT"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7091A18628F;
	Fri, 18 Oct 2024 10:50:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729248608; cv=none; b=R5JRCmmJveHwGTodGDgNX9b6BbIoLF888qkW53McaPk5pJkXraBcGw4bRhYEquhnoBu5BoDXBM1g/VNIoM/sQu+Rcx0LcOCocNN8d4ydei+VHD6sUELhk4uey5wyoqgfEzRhdIIVXhcyyZhbSxj+hGgEhqcO29mgu5pQ/hA/RQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729248608; c=relaxed/simple;
	bh=qTEtMkNOTglNBXFTE6PMl5Ef9Oun75bf5CKFIMBPfwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=iR1wBj7lNgez9WDCA4OKnbpYKaH471Kk0BAKKWFGU2RX85vlx2ngEkN7GUeDGLXutbXGMIKzxSjRKwJ4y8K1NXm7Ww+iw+DLdN7rRDFfXMzjSLzJ0I31zE9VMaViMd7+AjKqI/L6+SUpuAe7zqszILFAL8b2BBuN8vLF9H6mRUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KaXCl6QT; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-20cdb889222so20384175ad.3;
        Fri, 18 Oct 2024 03:50:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729248606; x=1729853406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=phEOxOK/iCtP9A7/5XuMk31jGNhl1/M/9+lyS06WlZM=;
        b=KaXCl6QTllJsAvpPtgtaLFycYc8+THW3VsAuej7fWdRz3MWrB8wU4+AxvDzcWApVOJ
         fyh4fKp12lXaPX5tqgpFujlE28p5aoSPdJUEs4+n/6FUZ+RBnw/6svRxLxiVpGRH6QO5
         XkD0cwblZHyxANvq5U2265x3boBcwLvSWeG9PPAxUS65o39DcnCQHq1V22aFaOp/ivx0
         NKrxoqVwG93nSeEoMIW9D3xrCdXtihqawZWcYF8OSSR/nyLTrdFgFiXjzvZ7ZWrR6l+C
         TRmCQn/RCddvgQL3DLEpuQsynBnLfaaq0Xl3+hhWbL1ZRTFfMs0sps83az8tmFm1Ah2i
         06uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729248606; x=1729853406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=phEOxOK/iCtP9A7/5XuMk31jGNhl1/M/9+lyS06WlZM=;
        b=ugJwMB7u0PT4ev1oOuVTJr2DDFX4x0MvXAIoWrj6QPKVL0EjVXYH5mgoJonaUmJnPg
         6MbGP/5lknfJoSgFV4uB5ZMtdOulMUml+amk+aXJPav+ZC91ZcB3iwW/jbykWslKX03a
         9ZWWAcc6NLugHMGyW3NXiQ6i1/8JU56sBknsCjbNtyI6tGUv6SP6xnjWPg3x8XnUEohC
         C+yrf2QDQ7E39eUPm2b3SkdwfBEeb9U8m2RkIT6gagIQeXyEsX7mhZDSrzKp/WBptj1w
         1QG9FzryY0TfxsYu2RQHVp2bCkeuSCxddBziLxRrYZs9cYGpudAMTkjjeTFrznGUBb1s
         ju6Q==
X-Forwarded-Encrypted: i=1; AJvYcCU7IZ8QKEsf2L27hoRpr2/eDE0GZm7lkmRkkpHZ32kVu4tjRNoQqvgwSvmMXV2Vy/asIHrFYaZ4WSK2boU=@vger.kernel.org, AJvYcCVJaPrBMRAPRBCwBzySChT2mu79rCfPTfUZcvbPuQeAvMAACu339LHQ6LT+eUnGQrfqLpnsrIGPF1ZRg+6ovjCsKgtunQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YylR01d4QQcNzrVFJBHU39xPkeYjMYCgLw80FFNqYVblQyliYVq
	6ZEAlm3KPjREMTyWnhYogmDwoSH2qdaxHy8i7RpVPH7/BHhd5AoG
X-Google-Smtp-Source: AGHT+IEChllyGbyJfXb1BeuSV9sMgBgwaAY7BNJiACdiG0Htv8UjjmJ3s+hkF1zqv39uGDLIza5VSw==
X-Received: by 2002:a17:902:e80c:b0:20b:b5d5:8072 with SMTP id d9443c01a7336-20e5a70d652mr27672085ad.2.1729248605252;
        Fri, 18 Oct 2024 03:50:05 -0700 (PDT)
Received: from fedora.. ([2405:201:d007:50c2:4888:86b4:6f32:9ae])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a747474sm10191915ad.66.2024.10.18.03.50.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Oct 2024 03:50:04 -0700 (PDT)
From: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
To: irenic.rajneesh@gmail.com,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	david.e.box@linux.intel.com
Cc: skhan@linuxfoundation.org,
	platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3] platform/x86/intel/pmc: Fix pmc_core_iounmap to call iounmap for valid addresses
Date: Fri, 18 Oct 2024 16:19:58 +0530
Message-ID: <20241018104958.14195-1-vamsikrishna.brahmajosyula@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

50c6dbdfd introduced a WARN when adrress ranges of iounmap are
invalid. On Thinkpad P1 Gen 7 (Meteor Lake-P) this caused the
following warning to appear.

WARNING: CPU: 7 PID: 713 at arch/x86/mm/ioremap.c:461 iounmap+0x58/0x1f0
Modules linked in: rfkill(+) snd_timer(+) fjes(+) snd soundcore intel_pmc_core(+)
int3403_thermal(+) int340x_thermal_zone intel_vsec pmt_telemetry acpi_pad pmt_class
acpi_tad int3400_thermal acpi_thermal_rel joydev loop nfnetlink zram xe drm_suballoc_helper
nouveau i915 mxm_wmi drm_ttm_helper gpu_sched drm_gpuvm drm_exec drm_buddy i2c_algo_bit
crct10dif_pclmul crc32_pclmul ttm crc32c_intel polyval_clmulni rtsx_pci_sdmmc ucsi_acpi
polyval_generic mmc_core hid_multitouch drm_display_helper ghash_clmulni_intel typec_ucsi
nvme sha512_ssse3 video sha256_ssse3 nvme_core intel_vpu sha1_ssse3 rtsx_pci cec typec
nvme_auth i2c_hid_acpi i2c_hid wmi pinctrl_meteorlake serio_raw ip6_tables ip_tables fuse
CPU: 7 UID: 0 PID: 713 Comm: (udev-worker) Not tainted 6.12.0-rc2iounmap+ #42
Hardware name: LENOVO 21KWCTO1WW/21KWCTO1WW, BIOS N48ET19W (1.06 ) 07/18/2024
RIP: 0010:iounmap+0x58/0x1f0
Code: 85 6a 01 00 00 48 8b 05 e6 e2 28 04 48 39 c5 72 19 eb 26 cc cc cc 48 ba 00 00 00 00 00 00 32 00 48 8d 44 02 ff 48 39 c5 72 23 <0f> 0b 48 83 c4 08 5b 5d 41 5c c3 cc cc cc cc 48 ba 00 00 00 00 00
RSP: 0018:ffff888131eff038 EFLAGS: 00010207
RAX: ffffc90000000000 RBX: 0000000000000000 RCX: ffff888e33b80000
RDX: dffffc0000000000 RSI: ffff888e33bc29c0 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffff8881598a8000 R09: ffff888e2ccedc10
R10: 0000000000000003 R11: ffffffffb3367634 R12: 00000000fe000000
R13: ffff888101d0da28 R14: ffffffffc2e437e0 R15: ffff888110b03b28
FS:  00007f3c1d4b3980(0000) GS:ffff888e33b80000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00005651cfc93578 CR3: 0000000124e4c002 CR4: 0000000000f70ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000ffff07f0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
<TASK>
? __warn.cold+0xb6/0x176
? iounmap+0x58/0x1f0
? report_bug+0x1f4/0x2b0
? handle_bug+0x58/0x90
? exc_invalid_op+0x17/0x40
? asm_exc_invalid_op+0x1a/0x20
? iounmap+0x58/0x1f0
pmc_core_ssram_get_pmc+0x477/0x6c0 [intel_pmc_core]
? __pfx_pmc_core_ssram_get_pmc+0x10/0x10 [intel_pmc_core]
? __pfx_do_pci_enable_device+0x10/0x10
? pci_wait_for_pending+0x60/0x110
? pci_enable_device_flags+0x1e3/0x2e0
? __pfx_mtl_core_init+0x10/0x10 [intel_pmc_core]
pmc_core_ssram_init+0x7f/0x110 [intel_pmc_core]
mtl_core_init+0xda/0x130 [intel_pmc_core]
? __mutex_init+0xb9/0x130
pmc_core_probe+0x27e/0x10b0 [intel_pmc_core]
? _raw_spin_lock_irqsave+0x96/0xf0
? __pfx_pmc_core_probe+0x10/0x10 [intel_pmc_core]
? __pfx_mutex_unlock+0x10/0x10
? __pfx_mutex_lock+0x10/0x10
? device_pm_check_callbacks+0x82/0x370
? acpi_dev_pm_attach+0x234/0x2b0
platform_probe+0x9f/0x150
really_probe+0x1e0/0x8a0
__driver_probe_device+0x18c/0x370
? __pfx___driver_attach+0x10/0x10
driver_probe_device+0x4a/0x120
__driver_attach+0x190/0x4a0
? __pfx___driver_attach+0x10/0x10
bus_for_each_dev+0x103/0x180
? __pfx_bus_for_each_dev+0x10/0x10
? klist_add_tail+0x136/0x270
bus_add_driver+0x2fc/0x540
driver_register+0x1a5/0x360
? __pfx_pmc_core_driver_init+0x10/0x10 [intel_pmc_core]
do_one_initcall+0xa4/0x380
? __pfx_do_one_initcall+0x10/0x10
? kasan_unpoison+0x44/0x70
do_init_module+0x296/0x800
load_module+0x5090/0x6ce0
? __pfx_load_module+0x10/0x10
? ima_post_read_file+0x193/0x200
? __pfx_ima_post_read_file+0x10/0x10
? rw_verify_area+0x152/0x4c0
? kernel_read_file+0x257/0x750
? __pfx_kernel_read_file+0x10/0x10
? __pfx_filemap_get_read_batch+0x10/0x10
? init_module_from_file+0xd1/0x130
init_module_from_file+0xd1/0x130
? __pfx_init_module_from_file+0x10/0x10
? __pfx__raw_spin_lock+0x10/0x10
? __pfx_cred_has_capability.isra.0+0x10/0x10
idempotent_init_module+0x236/0x770
? __pfx_idempotent_init_module+0x10/0x10
? fdget+0x58/0x3f0
? security_capable+0x7d/0x110
__x64_sys_finit_module+0xbe/0x130
do_syscall_64+0x82/0x160
? __pfx_filemap_read+0x10/0x10
? __pfx___fsnotify_parent+0x10/0x10
? vfs_read+0x3a6/0xa30
? vfs_read+0x3a6/0xa30
? __seccomp_filter+0x175/0xc60
? __pfx___seccomp_filter+0x10/0x10
? fdget_pos+0x1ce/0x500
? syscall_exit_to_user_mode_prepare+0x149/0x170
? syscall_exit_to_user_mode+0x10/0x210
? do_syscall_64+0x8e/0x160
? switch_fpu_return+0xe3/0x1f0
? syscall_exit_to_user_mode+0x1d5/0x210
? do_syscall_64+0x8e/0x160
? exc_page_fault+0x76/0xf0
entry_SYSCALL_64_after_hwframe+0x76/0x7e
RIP: 0033:0x7f3c1d6d155d
Code: ff c3 66 2e 0f 1f 84 00 00 00 00 00 90 f3 0f 1e fa 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 8b 0d 83 58 0f 00 f7 d8 64 89 01 48
RSP: 002b:00007ffe6309db38 EFLAGS: 00000246 ORIG_RAX: 0000000000000139
RAX: ffffffffffffffda RBX: 0000557c212550a0 RCX: 00007f3c1d6d155d
RDX: 0000000000000000 RSI: 00007f3c1cd943bd RDI: 0000000000000025
RBP: 00007ffe6309dbf0 R08: 00007f3c1d7c7b20 R09: 00007ffe6309db80
R10: 0000557c21255270 R11: 0000000000000246 R12: 00007f3c1cd943bd
R13: 0000000000020000 R14: 0000557c21255c80 R15: 0000557c21255240
</TASK>

no_free_ptr(tmp_ssram) sets tmp_ssram NULL while assigning ssram.
pmc_core_iounmap calls iounmap unconditionally causing the above
warning to appear during boot.

Fix it by checking for a valid address before calling iounmap.

Also in the function pmc_core_ssram_get_pmc return -ENOMEM when
ioremap fails similar to other instances in the file.

Fixes: a01486dc4bb1 ("platform/x86/intel/pmc: Cleanup SSRAM discovery")
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
Reviewed-by: David E. Box <david.e.box@linux.intel.com>
Signed-off-by: Vamsi Krishna Brahmajosyula <vamsikrishna.brahmajosyula@gmail.com>
---
v3: Added Reviewed-by received in v1
v2: Updated commit message based on review comments (David E. Box)
---
 drivers/platform/x86/intel/pmc/core_ssram.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/intel/pmc/core_ssram.c b/drivers/platform/x86/intel/pmc/core_ssram.c
index c259c96b7dfd..8504154b649f 100644
--- a/drivers/platform/x86/intel/pmc/core_ssram.c
+++ b/drivers/platform/x86/intel/pmc/core_ssram.c
@@ -29,7 +29,7 @@
 #define LPM_REG_COUNT		28
 #define LPM_MODE_OFFSET		1

-DEFINE_FREE(pmc_core_iounmap, void __iomem *, iounmap(_T));
+DEFINE_FREE(pmc_core_iounmap, void __iomem *, if (_T) iounmap(_T))

 static u32 pmc_core_find_guid(struct pmc_info *list, const struct pmc_reg_map *map)
 {
@@ -262,6 +262,8 @@ pmc_core_ssram_get_pmc(struct pmc_dev *pmcdev, int pmc_idx, u32 offset)

 	ssram_base = ssram_pcidev->resource[0].start;
 	tmp_ssram = ioremap(ssram_base, SSRAM_HDR_SIZE);
+	if (!tmp_ssram)
+		return -ENOMEM;

 	if (pmc_idx != PMC_IDX_MAIN) {
 		/*

base-commit: 4d939780b70592e0f4bc6c397e52e518f8fb7916
--
2.47.0

