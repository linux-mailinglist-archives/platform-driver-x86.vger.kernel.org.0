Return-Path: <platform-driver-x86+bounces-5424-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 38A8297CDCC
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Sep 2024 20:45:06 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 8BC69B22801
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Sep 2024 18:45:03 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 973D9200AF;
	Thu, 19 Sep 2024 18:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eYWhcHZw"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD03C36B11
	for <platform-driver-x86@vger.kernel.org>; Thu, 19 Sep 2024 18:44:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726771486; cv=none; b=i1DWnQa+HNME1nSgqXZXeBtsYfCnxdvAQn8o6YB5AkNXDmSjIpMBJZNSK3aulrBBdCcVTq72jkbkWmc3Y0m9tAbop3cUqU+O288V1MVE+E1t6dHuekY4++CzGP5rphpfbShKQVpdRyah6bEWEvVCcdEuuXbwkV5CVwknWWVC+OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726771486; c=relaxed/simple;
	bh=CwyXT3kyniWMZ7meqV9Ihpin7fobMEusJDY3ir0XJ84=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=bknczLug0E2rGVD1XnIYeofgrb0AcPmmEWRomWN988hNeBLT4mRgESq6e9PTTE/ScSM0OG7etd2YPc2SAft+TYd5l/Sp7AUd+0mXV4UAWPMpI7N7WU8oeCWnHY790gEnmQEyDcFBbGEcmC29m7s9b+JBq5DctxpHeslGWvKEl7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eYWhcHZw; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726771485; x=1758307485;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=CwyXT3kyniWMZ7meqV9Ihpin7fobMEusJDY3ir0XJ84=;
  b=eYWhcHZwxeknY4Vsfis22lf5AKDDAbMquqPBDje8+Gc8UEsUv7w3aGWk
   2Qm5V0VGvi84qcTW8sccFqUttzAn7AxMHRH8EZRhaUTeCchMFnNqOSkBr
   fpFzGdAens8us+DuzqkFUrGQ7t23nI3z2FxsjPuLBAl4jcJvuwGagQLQQ
   IXYd1ri4eu3oDCGqpfNtFyD/2Y7EpdxoUdDhaLca6YmhlBVjJecEDo0z7
   AXysqjxjFPcTNDxuFJiFfRPhmy0oR74HhEta2JG8SbF7KWVXc3vNQksEa
   K4nuPNTfZUBrf+kmg4egEZ31MaihJ5MOZx4QX9RAXqoKIIyOi9yZWOOso
   A==;
X-CSE-ConnectionGUID: AlHDfiteQUeVQ4JQI/VvOQ==
X-CSE-MsgGUID: l875AOqmSTCOHgmvUGFJVw==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="37135524"
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="37135524"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 11:44:44 -0700
X-CSE-ConnectionGUID: FnMKzT+pRvaO+KO837NFbA==
X-CSE-MsgGUID: r11V2dQJT+yClMH4wdgM7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,242,1719903600"; 
   d="scan'208";a="69633286"
Received: from dgramcko-desk.amr.corp.intel.com (HELO [10.124.223.88]) ([10.124.223.88])
  by fmviesa007-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2024 11:44:43 -0700
Message-ID: <8c8267e5695c8e1b0a0b0c52050c43e22359c915.camel@linux.intel.com>
Subject: Re: [PATCH v2] platform/x86: ISST: Fix the KASAN report
 slab-out-of-bounds bug
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Zach Wade <zachwade.k@gmail.com>, hdegoede@redhat.com, 
	ilpo.jarvinen@linux.intel.com
Cc: platform-driver-x86@vger.kernel.org
Date: Thu, 19 Sep 2024 14:44:42 -0400
In-Reply-To: <20240919163713.3126-1-zachwade.k@gmail.com>
References: <c9f3758e027e06aaf5776904d6e7a0de0bf916c2.camel@linux.intel.com>
	 <20240919163713.3126-1-zachwade.k@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2024-09-20 at 00:37 +0800, Zach Wade wrote:
> Attaching SST PCI device to VM causes
You are not attaching SST PCI device to VM. It seems some hard drives
emulates same PCI vendor/device ID.

But replacing with topology_logical_package_id() is fine.

Let's find out what are those devices.

Thanks,
Srinivas

>  "BUG: KASAN: slab-out-of-bounds".
> kasan report:
> [=C2=A0=C2=A0 19.411889]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> [=C2=A0=C2=A0 19.413702] BUG: KASAN: slab-out-of-bounds in
> _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_common]
> [=C2=A0=C2=A0 19.415634] Read of size 8 at addr ffff888829e65200 by task
> cpuhp/16/113
> [=C2=A0=C2=A0 19.417368]
> [=C2=A0=C2=A0 19.418627] CPU: 16 PID: 113 Comm: cpuhp/16 Tainted: G=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0
> E=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 6.9.0 #10
> [=C2=A0=C2=A0 19.420435] Hardware name: VMware, Inc. VMware20,1/440BX Des=
ktop
> Reference Platform, BIOS VMW201.00V.20192059.B64.2207280713
> 07/28/2022
> [=C2=A0=C2=A0 19.422687] Call Trace:
> [=C2=A0=C2=A0 19.424091]=C2=A0 <TASK>
> [=C2=A0=C2=A0 19.425448]=C2=A0 dump_stack_lvl+0x5d/0x80
> [=C2=A0=C2=A0 19.426963]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.428694]=C2=A0 print_report+0x19d/0x52e
> [=C2=A0=C2=A0 19.430206]=C2=A0 ? __pfx__raw_spin_lock_irqsave+0x10/0x10
> [=C2=A0=C2=A0 19.431837]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.433539]=C2=A0 kasan_report+0xf0/0x170
> [=C2=A0=C2=A0 19.435019]=C2=A0 ? _isst_if_get_pci_dev+0x3d5/0x400 [isst_i=
f_common]
> [=C2=A0=C2=A0 19.436709]=C2=A0 _isst_if_get_pci_dev+0x3d5/0x400 [isst_if_=
common]
> [=C2=A0=C2=A0 19.438379]=C2=A0 ? __pfx_sched_clock_cpu+0x10/0x10
> [=C2=A0=C2=A0 19.439910]=C2=A0 isst_if_cpu_online+0x406/0x58f [isst_if_co=
mmon]
> [=C2=A0=C2=A0 19.441573]=C2=A0 ? __pfx_isst_if_cpu_online+0x10/0x10 [isst=
_if_common]
> [=C2=A0=C2=A0 19.443263]=C2=A0 ? ttwu_queue_wakelist+0x2c1/0x360
> [=C2=A0=C2=A0 19.444797]=C2=A0 cpuhp_invoke_callback+0x221/0xec0
> [=C2=A0=C2=A0 19.446337]=C2=A0 cpuhp_thread_fun+0x21b/0x610
> [=C2=A0=C2=A0 19.447814]=C2=A0 ? __pfx_cpuhp_thread_fun+0x10/0x10
> [=C2=A0=C2=A0 19.449354]=C2=A0 smpboot_thread_fn+0x2e7/0x6e0
> [=C2=A0=C2=A0 19.450859]=C2=A0 ? __pfx_smpboot_thread_fn+0x10/0x10
> [=C2=A0=C2=A0 19.452405]=C2=A0 kthread+0x29c/0x350
> [=C2=A0=C2=A0 19.453817]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 19.455253]=C2=A0 ret_from_fork+0x31/0x70
> [=C2=A0=C2=A0 19.456685]=C2=A0 ? __pfx_kthread+0x10/0x10
> [=C2=A0=C2=A0 19.458114]=C2=A0 ret_from_fork_asm+0x1a/0x30
> [=C2=A0=C2=A0 19.459573]=C2=A0 </TASK>
> [=C2=A0=C2=A0 19.460853]
> [=C2=A0=C2=A0 19.462055] Allocated by task 1198:
> [=C2=A0=C2=A0 19.463410]=C2=A0 kasan_save_stack+0x30/0x50
> [=C2=A0=C2=A0 19.464788]=C2=A0 kasan_save_track+0x14/0x30
> [=C2=A0=C2=A0 19.466139]=C2=A0 __kasan_kmalloc+0xaa/0xb0
> [=C2=A0=C2=A0 19.467465]=C2=A0 __kmalloc+0x1cd/0x470
> [=C2=A0=C2=A0 19.468748]=C2=A0 isst_if_cdev_register+0x1da/0x350 [isst_if=
_common]
> [=C2=A0=C2=A0 19.470233]=C2=A0 isst_if_mbox_init+0x108/0xff0 [isst_if_mbo=
x_msr]
> [=C2=A0=C2=A0 19.471670]=C2=A0 do_one_initcall+0xa4/0x380
> [=C2=A0=C2=A0 19.472903]=C2=A0 do_init_module+0x238/0x760
> [=C2=A0=C2=A0 19.474105]=C2=A0 load_module+0x5239/0x6f00
> [=C2=A0=C2=A0 19.475285]=C2=A0 init_module_from_file+0xd1/0x130
> [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> [=C2=A0=C2=A0 19.476506]=C2=A0 idempotent_init_module+0x23b/0x650
> [=C2=A0=C2=A0 19.477725]=C2=A0 __x64_sys_finit_module+0xbe/0x130
> [=C2=A0=C2=A0 19.478920]=C2=A0 do_syscall_64+0x82/0x160
> [=C2=A0=C2=A0 19.480036]=C2=A0 entry_SYSCALL_64_after_hwframe+0x76/0x7e
> [=C2=A0=C2=A0 19.481292]
> [=C2=A0=C2=A0 19.482205] The buggy address belongs to the object at
> ffff888829e65000
> =C2=A0which belongs to the cache kmalloc-512 of size 512
> [=C2=A0=C2=A0 19.484818] The buggy address is located 0 bytes to the righ=
t of
> =C2=A0allocated 512-byte region [ffff888829e65000, ffff888829e65200)
> [=C2=A0=C2=A0 19.487447]
> [=C2=A0=C2=A0 19.488328] The buggy address belongs to the physical page:
> [=C2=A0=C2=A0 19.489569] page: refcount:1 mapcount:0 mapping:000000000000=
0000
> index:0xffff888829e60c00 pfn:0x829e60
> [=C2=A0=C2=A0 19.491140] head: order:3 entire_mapcount:0 nr_pages_mapped:=
0
> pincount:0
> [=C2=A0=C2=A0 19.492466] anon flags:
> 0x57ffffc0000840(slab|head|node=3D1|zone=3D2|lastcpupid=3D0x1fffff)
> [=C2=A0=C2=A0 19.493914] page_type: 0xffffffff()
> [=C2=A0=C2=A0 19.494988] raw: 0057ffffc0000840 ffff88810004cc80
> 0000000000000000 0000000000000001
> [=C2=A0=C2=A0 19.496451] raw: ffff888829e60c00 0000000080200018
> 00000001ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.497906] head: 0057ffffc0000840 ffff88810004cc80
> 0000000000000000 0000000000000001
> [=C2=A0=C2=A0 19.499379] head: ffff888829e60c00 0000000080200018
> 00000001ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.500844] head: 0057ffffc0000003 ffffea0020a79801
> ffffea0020a79848 00000000ffffffff
> [=C2=A0=C2=A0 19.502316] head: 0000000800000000 0000000000000000
> 00000000ffffffff 0000000000000000
> [=C2=A0=C2=A0 19.503784] page dumped because: kasan: bad access detected
> [=C2=A0=C2=A0 19.505058]
> [=C2=A0=C2=A0 19.505970] Memory state around the buggy address:
> [=C2=A0=C2=A0 19.507172]=C2=A0 ffff888829e65100: 00 00 00 00 00 00 00 00 =
00 00 00 00
> 00 00 00 00
> [=C2=A0=C2=A0 19.508599]=C2=A0 ffff888829e65180: 00 00 00 00 00 00 00 00 =
00 00 00 00
> 00 00 00 00
> [=C2=A0=C2=A0 19.510013] >ffff888829e65200: fc fc fc fc fc fc fc fc fc fc=
 fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.510014]=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^
> [=C2=A0=C2=A0 19.510016]=C2=A0 ffff888829e65280: fc fc fc fc fc fc fc fc =
fc fc fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.510018]=C2=A0 ffff888829e65300: fc fc fc fc fc fc fc fc =
fc fc fc fc
> fc fc fc fc
> [=C2=A0=C2=A0 19.515367]
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> The reason for this error is physical_package_ids assigned by VMM
> have
> holes. This will cause value returned by
> topology_physical_package_id()
> to be more than topology_max_packages(). The allocation uses
> topology_max_packages() to allocate memory. topology_max_packages()
> returns maximum logical package IDs. Hence use
> topology_logical_package_id() instead of
> topology_physical_package_id().
>=20
> Fixes: 9a1aac8a96dc ("platform/x86: ISST: PUNIT device mapping with
> Sub-NUMA clustering")
> Signed-off-by: Zach Wade <zachwade.k@gmail.com>
> ---
> =C2=A0drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 4 +++=
-
> =C2=A01 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git
> a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index 10e21563fa46..030c33070b84 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -316,7 +316,9 @@ static struct pci_dev *_isst_if_get_pci_dev(int
> cpu, int bus_no, int dev, int fn
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 cpu >=
=3D nr_cpu_ids || cpu >=3D num_possible_cpus())
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> =C2=A0
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_physical_p=
ackage_id(cpu);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0pkg_id =3D topology_logical_pa=
ckage_id(cpu);
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (pkg_id >=3D topology_max_p=
ackages())
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0return NULL;
> =C2=A0
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0bus_number =3D isst_cpu_i=
nfo[cpu].bus_info[bus_no];
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (bus_number < 0)


