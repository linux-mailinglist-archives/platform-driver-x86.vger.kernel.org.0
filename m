Return-Path: <platform-driver-x86+bounces-9912-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 581D8A4E455
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Mar 2025 16:53:37 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id E6DDC19C3CAF
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Mar 2025 15:46:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B214A24C084;
	Tue,  4 Mar 2025 15:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Qa1RqyLZ"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D889124C09D
	for <platform-driver-x86@vger.kernel.org>; Tue,  4 Mar 2025 15:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741102358; cv=none; b=ZPVTe9Qzg9Fkpoq6SLZs24iCpxsYXZxzoNvogUqqGIseyL7r+p9NaZsn+3VQffQrV4lZ8IQpU2/KpsLYZQ1vFSAq5ftHKsBwTurujs6UMxm6P95jVUW/SW309Rf8tPhQWqD2RsPJig0AKx/HIhQvBLTqLhWTPf7dk43kjrQyl8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741102358; c=relaxed/simple;
	bh=M+njBEclXHnHTgQpy9yLvgD30SKfIb1HvssDAFyzQ7A=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=lGugFx0856fQ/7aI2T5/qjf0GaeZehaPEjD2O/PfCoAaOQWJoDPFFwHXyVR0U8Zo4wzy9AzOFDOKyWS7gLkVHte7Inj7XKSEeINp79gmV+oeLK/F5uXcmA2MZY19AfRxwXSh5m+Dxk0wuJXLXGZjxNg83CYmLVuhgzLa/G1TTT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Qa1RqyLZ; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741102357; x=1772638357;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=M+njBEclXHnHTgQpy9yLvgD30SKfIb1HvssDAFyzQ7A=;
  b=Qa1RqyLZRmIWmkIhgHkZ2B7CtDoxOrQ5XWHFQT2HoxPRMf/8L3nnh0UJ
   NhPFvW6qNaxFncxmkMOVmCnX87K3Xliwvj+hMo7S+ZJRS/irpLXdshnPX
   i/efoeu/25xWA4sQPm2lu1JagjsTvjiMCt1G7rYpN5oSpK2F54S5M/LAm
   0JwI/A49idVOpJafQof9uoxI4wcx5hosbfZMreS9R2is7CjTj+ugGXl1u
   nstjlpcj4IYk+DvxHROwnLK6tDVBgShqUnd528csC3IR0pPQsBMfBWSE8
   Xg5pxmKacbnJ1rc7qt9tVzshrPTL+mqPttM5NM425PlG+r7rBcpO+YsnS
   Q==;
X-CSE-ConnectionGUID: jYcOLNS2TBusbL4fD8sl3g==
X-CSE-MsgGUID: XYHAG3jlR7mpmWXyOcaCLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="67394009"
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="67394009"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:32:36 -0800
X-CSE-ConnectionGUID: IaH6ToF/R6SVpGJJhGjdjA==
X-CSE-MsgGUID: rW8x5U4mSBqwb+ki8s9Y4A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,220,1736841600"; 
   d="scan'208";a="118898586"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.220])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 07:32:33 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 4 Mar 2025 17:32:30 +0200 (EET)
To: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
cc: Hans de Goede <hdegoede@redhat.com>, platform-driver-x86@vger.kernel.org, 
    Patil.Reddy@amd.com, mario.limonciello@amd.com
Subject: Re: [PATCH v2 2/2] platform/x86/amd/pmf: Update PMF Driver for
 Compatibility with new PMF-TA
In-Reply-To: <9e8b2f14-6454-4958-8ac9-4f8dfc8745d2@amd.com>
Message-ID: <a32a5daf-9719-ba6c-c6a1-6c2e79760b11@linux.intel.com>
References: <20250218120625.1718196-1-Shyam-sundar.S-k@amd.com> <20250218120625.1718196-2-Shyam-sundar.S-k@amd.com> <85237940-b9a2-0b19-44de-058a35e2089f@linux.intel.com> <9e8b2f14-6454-4958-8ac9-4f8dfc8745d2@amd.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="8323328-445977133-1741102350=:931"

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--8323328-445977133-1741102350=:931
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: QUOTED-PRINTABLE

On Tue, 4 Mar 2025, Shyam Sundar S K wrote:
> On 3/4/2025 19:16, Ilpo J=C3=A4rvinen wrote:
> > On Tue, 18 Feb 2025, Shyam Sundar S K wrote:
> >=20
> >> The PMF driver allocates a shared memory buffer using
> >> tee_shm_alloc_kernel_buf() for communication with the PMF-TA.
> >>
> >> The latest PMF-TA version introduces new structures with OEM debug
> >> information and additional policy input conditions for evaluating the
> >> policy binary. Consequently, the shared memory size must be increased =
to
> >> ensure compatibility between the PMF driver and the updated PMF-TA.
> >>
> >> To do so, introduce the new PMF-TA UUID and update the PMF shared memo=
ry
> >> configuration to ensure compatibility with the latest PMF-TA version.
> >> Additionally, export the TA UUID.
> >>
> >> These updates will result in modifications to the prototypes of
> >> amd_pmf_tee_init() and amd_pmf_ta_open_session().
> >>
> >> Link: https://lore.kernel.org/all/55ac865f-b1c7-fa81-51c4-d211c7963e7e=
@linux.intel.com/
> >> Co-developed-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Patil Rajesh Reddy <Patil.Reddy@amd.com>
> >> Signed-off-by: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
> >> ---
> >>  drivers/platform/x86/amd/pmf/pmf.h    |  5 ++-
> >>  drivers/platform/x86/amd/pmf/tee-if.c | 50 +++++++++++++++++++-------=
-
> >>  2 files changed, 40 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/platform/x86/amd/pmf/pmf.h b/drivers/platform/x86=
/amd/pmf/pmf.h
> >> index 41b2b91b8fdc..e6bdee68ccf3 100644
> >> --- a/drivers/platform/x86/amd/pmf/pmf.h
> >> +++ b/drivers/platform/x86/amd/pmf/pmf.h
> >> @@ -106,9 +106,12 @@ struct cookie_header {
> >>  #define PMF_TA_IF_VERSION_MAJOR=09=09=09=091
> >>  #define TA_PMF_ACTION_MAX=09=09=09=09=0932
> >>  #define TA_PMF_UNDO_MAX=09=09=09=09=09=098
> >> -#define TA_OUTPUT_RESERVED_MEM=09=09=09=09906
> >> +#define TA_OUTPUT_RESERVED_MEM=09=09=09=09922
> >>  #define MAX_OPERATION_PARAMS=09=09=09=09=094
> >> =20
> >> +#define TA_ERROR_CRYPTO_INVALID_PARAM=09=09=09=090x20002
> >> +#define TA_ERROR_CRYPTO_BIN_TOO_LARGE=09=09=09=090x2000d
> >> +
> >>  #define PMF_IF_V1=09=091
> >>  #define PMF_IF_V2=09=092
> >> =20
> >> diff --git a/drivers/platform/x86/amd/pmf/tee-if.c b/drivers/platform/=
x86/amd/pmf/tee-if.c
> >> index b404764550c4..a81c661abd7e 100644
> >> --- a/drivers/platform/x86/amd/pmf/tee-if.c
> >> +++ b/drivers/platform/x86/amd/pmf/tee-if.c
> >> @@ -27,8 +27,11 @@ module_param(pb_side_load, bool, 0444);
> >>  MODULE_PARM_DESC(pb_side_load, "Sideload policy binaries debug policy=
 failures");
> >>  #endif
> >> =20
> >> -static const uuid_t amd_pmf_ta_uuid =3D UUID_INIT(0x6fd93b77, 0x3fb8,=
 0x524d,
> >> -=09=09=09=09=09=090xb1, 0x2d, 0xc5, 0x29, 0xb1, 0x3d, 0x85, 0x43);
> >> +static const uuid_t amd_pmf_ta_uuid[] =3D { UUID_INIT(0xd9b39bf2, 0x6=
6bd, 0x4154, 0xaf, 0xb8, 0x8a,
> >> +=09=09=09=09=09=09    0xcc, 0x2b, 0x2b, 0x60, 0xd6),
> >> +=09=09=09=09=09  UUID_INIT(0x6fd93b77, 0x3fb8, 0x524d, 0xb1, 0x2d, 0x=
c5,
> >> +=09=09=09=09=09=09    0x29, 0xb1, 0x3d, 0x85, 0x43),
> >> +=09=09=09=09=09};
> >> =20
> >>  static const char *amd_pmf_uevent_as_str(unsigned int state)
> >>  {
> >> @@ -321,7 +324,7 @@ static int amd_pmf_start_policy_engine(struct amd_=
pmf_dev *dev)
> >>  =09=09 */
> >>  =09=09schedule_delayed_work(&dev->pb_work, msecs_to_jiffies(pb_action=
s_ms * 3));
> >>  =09} else {
> >> -=09=09dev_err(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> >> +=09=09dev_dbg(dev->dev, "ta invoke cmd init failed err: %x\n", res);
> >>  =09=09dev->smart_pc_enabled =3D false;
> >>  =09=09return res;
> >>  =09}
> >> @@ -390,12 +393,12 @@ static int amd_pmf_amdtee_ta_match(struct tee_io=
ctl_version_data *ver, const voi
> >>  =09return ver->impl_id =3D=3D TEE_IMPL_ID_AMDTEE;
> >>  }
> >> =20
> >> -static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id)
> >> +static int amd_pmf_ta_open_session(struct tee_context *ctx, u32 *id, =
int index)
> >>  {
> >>  =09struct tee_ioctl_open_session_arg sess_arg =3D {};
> >>  =09int rc;
> >> =20
> >> -=09export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid);
> >> +=09export_uuid(sess_arg.uuid, &amd_pmf_ta_uuid[index]);
> >>  =09sess_arg.clnt_login =3D TEE_IOCTL_LOGIN_PUBLIC;
> >>  =09sess_arg.num_params =3D 0;
> >> =20
> >> @@ -434,7 +437,7 @@ static int amd_pmf_register_input_device(struct am=
d_pmf_dev *dev)
> >>  =09return 0;
> >>  }
> >> =20
> >> -static int amd_pmf_tee_init(struct amd_pmf_dev *dev)
> >> +static int amd_pmf_tee_init(struct amd_pmf_dev *dev, int index)
> >>  {
> >>  =09u32 size;
> >>  =09int ret;
> >> @@ -445,7 +448,7 @@ static int amd_pmf_tee_init(struct amd_pmf_dev *de=
v)
> >>  =09=09return PTR_ERR(dev->tee_ctx);
> >>  =09}
> >> =20
> >> -=09ret =3D amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id);
> >> +=09ret =3D amd_pmf_ta_open_session(dev->tee_ctx, &dev->session_id, in=
dex);
> >>  =09if (ret) {
> >>  =09=09dev_err(dev->dev, "Failed to open TA session (%d)\n", ret);
> >>  =09=09ret =3D -EINVAL;
> >> @@ -489,7 +492,8 @@ static void amd_pmf_tee_deinit(struct amd_pmf_dev =
*dev)
> >> =20
> >>  int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev)
> >>  {
> >> -=09int ret;
> >> +=09bool status;
> >> +=09int ret, i;
> >> =20
> >>  =09ret =3D apmf_check_smart_pc(dev);
> >>  =09if (ret) {
> >> @@ -502,10 +506,6 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev=
)
> >>  =09=09return -ENODEV;
> >>  =09}
> >> =20
> >> -=09ret =3D amd_pmf_tee_init(dev);
> >> -=09if (ret)
> >> -=09=09return ret;
> >> -
> >>  =09INIT_DELAYED_WORK(&dev->pb_work, amd_pmf_invoke_cmd);
> >> =20
> >>  =09ret =3D amd_pmf_set_dram_addr(dev, true);
> >> @@ -534,8 +534,30 @@ int amd_pmf_init_smart_pc(struct amd_pmf_dev *dev=
)
> >>  =09=09goto error;
> >>  =09}
> >> =20
> >> -=09ret =3D amd_pmf_start_policy_engine(dev);
> >> -=09if (ret)
> >> +=09for (i =3D 0; i < ARRAY_SIZE(amd_pmf_ta_uuid); i++) {
> >> +=09=09ret =3D amd_pmf_tee_init(dev, i);
> >=20
> > Any reason why you just pass the uuid pointer as it seems more obvious =
as=20
> > a parameter than something as vague as "index"?
> >=20
>=20
> The objective is to select the appropriate Trusted Application (TA)
> binary from the /lib/firmware/amdtee/ directory. This selection is
> determined by the UUIDs listed in the amd_pmf_ta_uuid[].
>=20
> Typically, the most recent TA version should be located at the first
> index, with the next most recent version at the second index, and so on.
>=20
> All these had to be done so that we don't end up in the version
> compatibility issues we had encountered last time.

I'm sorry, my editing messed the meaning of that comment up (I forgot to=20
add the "not" word there). I only meant that you could pass uuid pointer in=
stead
of the index.

> > I assume this change in general is to unbreak the case "3." from the li=
nk?
>=20
> Yes. that's right.

Thanks.

--=20
 i.

--8323328-445977133-1741102350=:931--

