Return-Path: <platform-driver-x86+bounces-4136-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id DF55291C43E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Jun 2024 18:57:15 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 98539287E35
	for <lists+platform-driver-x86@lfdr.de>; Fri, 28 Jun 2024 16:57:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7C7BA1C9ED4;
	Fri, 28 Jun 2024 16:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h/iXUpZk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E7EE1E532
	for <platform-driver-x86@vger.kernel.org>; Fri, 28 Jun 2024 16:57:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.21
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719593831; cv=fail; b=hQg1E1fvplL5bKHM+60QpGFZhzcGRnasn0Weqs4sjHoZu96+VmeP7hhlz41YXf5zjH/xyShag1ipM8a1xz/B66xiKOHCv8MpZ30k/s700IO4SKuqzA0XGuETYMchKW5nYKNg9fuzWEx3jnwf1iFGGim1VPUZlIH3XLdPqaI+DkM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719593831; c=relaxed/simple;
	bh=ABGIn0VlUC2+wI8anFZ/v/e3iG6MPC44Vw0epm4YaPc=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=POA9u8GBxHkibTtegL8e4dpiSwBfvYNHk4Wzxr9E9MHlAD5zGVYayvnqOt+aBo9g4qklZG89vUdc9Uu8C0I8t64jL4eYj0XKqnE7Sl4IGTRMydwo34sKq9PSr8r2jsszJCWayGFDh2sy8MTpBfbC/u5VNkJehR7/ESxH94zL7Ls=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h/iXUpZk; arc=fail smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719593830; x=1751129830;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=ABGIn0VlUC2+wI8anFZ/v/e3iG6MPC44Vw0epm4YaPc=;
  b=h/iXUpZkXeoMGVP0AmowCqpi4wG/xLdrexaGf275i1fNN6awOy4fmOgy
   ++oL9Fwa0cUHpKYNzVeLKHBVVtWFibmHl6n1uzdMVj4XghGGbPjuK0nA/
   hAIU+pcsM/f3TINEdta/z5kX30eUypB9NQ2UdLVJv5nVu0j3ZxDzAWrtI
   uHbztbHhCA5uIPn7hk5taq5YuX5AQ9wgDU2JCSEz13L64/uHllwTlg+Xc
   sFbfWMr0iK2f173AwwkjPUvTNranE1F+5pFN/8X9Cfp1a4P9CuOV0uRK8
   VAJfGQv9lXWD8SP5bGhQ8oMkzoAS3rzrzzMDwz6gr3GJD8lDSVBVZ1Aa8
   w==;
X-CSE-ConnectionGUID: ZQWL8RcJRBKQ4L5S/GOAPQ==
X-CSE-MsgGUID: Kq8hemBvSMCA4GrSCaycCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16740697"
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="16740697"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jun 2024 09:57:09 -0700
X-CSE-ConnectionGUID: /lhEq/cORoeETStpkJ8bbw==
X-CSE-MsgGUID: dTIfpi+JTKek+cT3L6+FMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,169,1716274800"; 
   d="scan'208";a="44777587"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
  by fmviesa008.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 28 Jun 2024 09:57:09 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:57:08 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 09:57:08 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 09:57:08 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.40) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 09:57:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mkCFtrneIZtMff7g5QUxggfMgRATFWVh4NzshrcKJ80yrflTK7/FSp5JPIZkR0cmZMIUb0N1OOFkfeoW4JOIKvmPhvJgcY0XYFBoS3ftBtc0tGG9NrfwBUgKmvTSuw7Tj54+jUhJc+cgggS7+zP8wJAV1V5HcpnDI9yCAuSI4t2L8T7brNsP/+xV1hHI/3BY2Pu2Y0Pjgdg88OjI8jLWJaCd6zlBnOy3MssQERYbKY4BaJ9ZTIdQQRQVEl03XlU0Ny61/zEjCykOYZDAOATQWJQyvJ1i9VN9SP5XBvFkIEuP//hsLSmKWgIQqE1uPd8/uNBEaAoAYDRbTcLti7s/Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ABGIn0VlUC2+wI8anFZ/v/e3iG6MPC44Vw0epm4YaPc=;
 b=Bl5QvxRKPsTxzN8nH1en+2d4zYSW0SyebDsDTYSW1prXW7mi5xjjf5wNHSVoecy7hIgK2y8LG+aCTg0qsnI9oy3r/u+Q1Xu5VH4zaVI+J/kSyjEnfZltdN+H7rUQHs7knA8IJs8Cua6tDs0xKzPb8bZnZdWfP+IJnziXH9PgXwbfuoW+Kgf8JoOQ4XgVeBMSzytg8I9OxBA5prv5OdIkXbHnE4kSyPxPFPX+rpsSm9EXjJx1/svReM1Wsp9lVtmgDP27j0U8+IVxZXoxtwY2hro6R5czsrzvtb4HojJEDnG6MmymLlqasleevmVyMyCreSwIuvYg1R0qRSN/7AOx4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6414.namprd11.prod.outlook.com (2603:10b6:930:36::19)
 by CH0PR11MB5283.namprd11.prod.outlook.com (2603:10b6:610:be::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 16:57:05 +0000
Received: from CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::d2f:c95d:f974:d1d2]) by CY5PR11MB6414.namprd11.prod.outlook.com
 ([fe80::d2f:c95d:f974:d1d2%3]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 16:57:05 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>
Subject: RE: [PATCH v4 4/6] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v4 4/6] drm/xe/vsec: Support BMG devices
Thread-Index: AQHayW1mamkutaWNqUeJUBQ2WN9ALLHdUTAAgAAQ6TA=
Date: Fri, 28 Jun 2024 16:57:05 +0000
Message-ID: <CY5PR11MB6414667715EB156B34565A1AC1D02@CY5PR11MB6414.namprd11.prod.outlook.com>
References: <20240628150945.3363575-1-michael.j.ruhl@intel.com>
 <20240628150945.3363575-5-michael.j.ruhl@intel.com>
 <Zn7aTAWKfmATGQnV@DUT025-TGLU.fm.intel.com>
In-Reply-To: <Zn7aTAWKfmATGQnV@DUT025-TGLU.fm.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6414:EE_|CH0PR11MB5283:EE_
x-ms-office365-filtering-correlation-id: 8526a29c-49d4-4b73-f5f8-08dc979356e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|376014|366016|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?QmdLM2VZMUdVWjdGUGpjcGs0VUhiaTNaZ004cEJMeTdiR05yd1BCdlJ1MTln?=
 =?utf-8?B?bEl5Y2Z5Sk8vbXg1dEwzRlN3NnpTeDJOeEM1ZDJDd2poeTlWMjNGVmFUWE9Z?=
 =?utf-8?B?ODE0Unp0NU8rcXl0VmxrR0toWlZQd2g2dk9yYzZMalpHZEFVT1pNT2REYy9Z?=
 =?utf-8?B?U3c5dFI1NVJtb3pqUFRUTm1teFNGYTAyblhMOWY3eTlBWmxhcFFYTUNRVmZj?=
 =?utf-8?B?bUhJWVNjak1XRS82Z0pIL0VJTWYweE1WWUpEbzB4SEhUbW45ZUlaY0xGSlRN?=
 =?utf-8?B?SlIwVW9YWCtldkY3MDN2U211RStGR2VPZG5tUlU0RGdEWDRFa0U0a3ZWR3Iw?=
 =?utf-8?B?UGUzUFJqbGtsVzU3cWlZelNvRS8zZDhyVzlzNEVBajM0Z2ZkTWw3Wng1Ukpk?=
 =?utf-8?B?QlVheGxwMzVXZVZGaHY3UFA3cFNzN0JBTXdtWStya1dkVE5iZ3dGZHZHOFMw?=
 =?utf-8?B?RUJXaGhvVStiMUlWUSt2MVJvclZkekFDUDFIL2dqbngxQVJSRUE1U2dFWjRs?=
 =?utf-8?B?MmZNMjJOTGdLMy9KMThORk4waGVxOEJDSDRjeFZYNUFDVnlpenFUWkN6aytm?=
 =?utf-8?B?cHhiR1JzQUY4WTZUSUxXd05MdG90QzNvKzJQQUJMUEJMKzBGbHlNREc4Y1JT?=
 =?utf-8?B?ei9CWW9DZDVFTHBLQkRmNmRydVNpeFRqM0ZpSUZ1Wks1L3BLRjlwNE9ibS81?=
 =?utf-8?B?ZjhZUmh2Z28rYTNURm41L0lxYSt0ckcvU095Z3hLS1BRUlhHNzFVM0ZvKzhi?=
 =?utf-8?B?TGtWSE1wR0FXZG5TWENFVW11NEdHK1YrY2FzRlhDWHRzdFVIbXNmTEVPOWVo?=
 =?utf-8?B?SW5kc2Q3NHJJdGxPM0pKUEFUdWxyc1E2dUVyQWg4V3ZOSW5qSS9SV3VsTm1q?=
 =?utf-8?B?MjlRQ0V5SVM4dmZWZlAwMG84eC9CZVl6TlllanY2UUNyZnJoQks4ZlVtZWJ6?=
 =?utf-8?B?K2RtaFVWWVBUM3k2UEV4Rll3Y0s0bmVOZFg2Um5VeEV4WFpBVjlVUGJZZTVl?=
 =?utf-8?B?SnIyT2ZzVURIVEd5Mmw2d2F5S1YvK1JZUFo2eE9WNjR0ZUpnTlg3Q1d3YnNG?=
 =?utf-8?B?dU5ZNHNTMEUrNFJNdDBIRnA5aVk3MndoRFM0UWRMMHpDOUxMbEs1TFFyYmtU?=
 =?utf-8?B?eko4QkpMV0FwZFQ0Vy9GQ0F5TGtyZ3QxYTBpRmZVemFxVFpROWt0a1lGeTNj?=
 =?utf-8?B?QmhoM21aS200K2lDTC9VOXhpRmV1WkszZndtYkk0c0FWR0hQelBMYUJRdkIy?=
 =?utf-8?B?N2N4TTFabWdreXZYRndhcGJUekUwMXR2VThpU2RCZG0wVVh1MmljUVRHcU9W?=
 =?utf-8?B?eUZiWGdVNjVZOXVVZWY2eG44aUgrV1IvSlpyZ0FSWWlJU3BEV0xIU0lIRWI4?=
 =?utf-8?B?T1hObG0vVE82bWk3NGg0YUptOW1KMmM4WHJ5SXZUeWthdGpIWWN6TnVqLzVL?=
 =?utf-8?B?TkljY0tsZCtUTXBRSE5rN2ZsK3FwdHAzS1k5UjhuUGNzcmxwU3ZCRXdzZUNk?=
 =?utf-8?B?WVBuQzVhTFFzSVRydlMvQS96SnM5a1pMbFBHOUFUL0tXZGRGVEdIN1R5cFhW?=
 =?utf-8?B?VjhIa0syVU85RW1wZWkycHpWR0Jpd3BOdGl6b1VGd01GOHBKMC91Tk1vZmRv?=
 =?utf-8?B?Y3o0TElCN1BMU3IxdGQ0dnVWVEgxU3M1T2YxOWxHbjF6TnJWLzdSSHdtK09E?=
 =?utf-8?B?dFBYUjBqMkZJTWZTSzZPU1Evdmg4VmN6RGNZeFQrTjdXdVpQWHB0K2F0d09s?=
 =?utf-8?B?WXA0S0JISldUNWNKZjQydjFVMDgwUStWdTVSVzFJMDZnNHpOSjdPM1U3ZDk3?=
 =?utf-8?B?L2oyQW5aaTVUbVNYK1d1c2oxUUFpM252eFovNHVoQjh1MUwyYVVFZ2tld3dq?=
 =?utf-8?B?cjdjOXVHeGxWS3FRODF2cE56UnJEWWluZmpMMDFPZmY2V3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6414.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?M3Q4NFZzMjdHVFhYZ25JSEMzSGUzSkJrSUxkZ1UvRnRBZThsYXRnM2t2ckxC?=
 =?utf-8?B?aVRtRVFta0g1T3BQVzB4cGhqdnJoOCtUNit2cDE3NDJ3THlVekZRMEhqSVpt?=
 =?utf-8?B?ZHBpcFo5c1ZiaUxLZDI3SUd6SlNWUFozYmlCbUVCcmhBNEdicU53azZWK1lO?=
 =?utf-8?B?RDdMSUQzR056aEVFQUdoUlhBWTlYSFdEaUtxWlFOQlFtNkRBbXFxRlQycnNL?=
 =?utf-8?B?eWhjMGJRR1pqTHM2ajZaWlNJMGFJZGlkRXlhM2I4QVBEbVVqQ0pzK3JRa2E1?=
 =?utf-8?B?YTRncm9ZSmtYdTJRRWlOUGZaREhVYWE3R2FYZW9lMzBCVFJKRU9VRzRkTEp6?=
 =?utf-8?B?VDZaMXlzK0tOblBoUUI1SmN5VnpVNStncGo2Q0tEVVZjcC9vRFdBN2ttc0hu?=
 =?utf-8?B?UVk1Umd0ZTVKOHlncWdMUGc4dnNSTTFvN0N5WFhZbzRUc3dYeUZrQktNV0pI?=
 =?utf-8?B?K0VRZFBkci9iYXJ1VUhNUGNqOU1mVlkwWVFlNDNOY1ZMSjY1QW5TeEkzbWVV?=
 =?utf-8?B?VHBxVllNSlVQQ1greXk5MWVybXNPWFZRZUtYZk8raWk5N0VxVHpRd0ZZLyt0?=
 =?utf-8?B?R2lEYjFjK0VkaXFabEw4aU1kTVdETDB2NXdid0o2azdwNmx3V05hNG1Ya1pm?=
 =?utf-8?B?dGduclVySUFacUVXM3JKZEE4ZlNGK2lyYWplQW1pTDA5c0p1WWdhazBQVlN3?=
 =?utf-8?B?ZWl2Uk5PL3pWbzNPYWxEUE55UTQyTXBtN2ZWZGpFVi9qLzJoOWRaVnR5YitB?=
 =?utf-8?B?aDBvUHZNM01xQkI3T2ZIWEVRTG5LeUlML0JqbVVjdWZnblN0MmRsMTlUYnJM?=
 =?utf-8?B?L0VVS3J1MEJxNkprcWJIbm1FV3FMU1NtVUM1eDIxelZpdGQvbk5UaWJIOWJ6?=
 =?utf-8?B?VnlCZnd0YVNKWVRqQUxBb1ltSm50N3pUaitrY3Vmd293MTh6RW1ndnRIU2tz?=
 =?utf-8?B?S1pDYlVXM0cvVDNtYzBPS3VYd01GV2R4L1NscGZaSW9UdkRFdVRQbGlsTDFl?=
 =?utf-8?B?ZzJ0N3N3VU5aRWcxeDk5bURoanM4QmZlZld2ZmgyaTdGVnNSTXBqbVJXc1I4?=
 =?utf-8?B?OTlCUUZJRjBmeHpLOWZNLzg0K0V5YUp1Z0NTWjUyQW9KUlQzbFBoazZHRW5y?=
 =?utf-8?B?NkN0MTZjZFNYK3h3V2JCc0pNNGZHOWRFTmZtbjdCNkZ6OXE3bDhHeFArajZK?=
 =?utf-8?B?bHhNcWwwWDlFMzk5WUNLaWNJYmx0Ym8wZjlSaTF3RHVxUDRqQkJvajl6dy96?=
 =?utf-8?B?MnRSeHBXeEIwd0NnV0JtZEZvYmNKYzV0NXY2bGFYakE1RkxQdkJUOEFMdnRC?=
 =?utf-8?B?SVBXRlNZb3U0TWNXV29TclUrb1lPTzRtVjVhMVhrbk4wYUhxa0hQZW5icDlj?=
 =?utf-8?B?a0tXRVBCL3E1VEJjdUtuc25Dc2ZmeVNkM3pPTEtDNXo2MjZ0UktYY3RldmFx?=
 =?utf-8?B?QkhvdEpXMVh6OUZXb2dBSjUvdy9TQ293QUthRVBFYS9VRXZRQXVZUndEZ0xX?=
 =?utf-8?B?R0h0N1RvMjl6S1V6aTlLVlJlTnpVdFpkT3VOeCtMYTlBd2d2S09yWFVvOGQ2?=
 =?utf-8?B?N0sxMDFBRG1zSUtibkgyYmh5R3o0Vk11bUxCczIwc3loMjRyeW5Rc04yZVh0?=
 =?utf-8?B?V2FhNzlkZkZXY1ZhRmJNVGtmd2ZXTmRvaXpZSVVScTk2WFAxSmZVcjExNEs0?=
 =?utf-8?B?b3ZRVVkvbEovTHcrT1pjc0k5NHpOZHhkMWtpQ0dnejJKbmN1VnFFMGVWNXF1?=
 =?utf-8?B?RktPd0lOd3BvZXlJZWJ4TjBLbzZUeHFCWTlxbC9KVlNMN3NSak05blYxY2o0?=
 =?utf-8?B?OW9NYWdkeGFqVUpMaGJqNlM1TFYyTmg3NUc3Rk1sTWpUaERRSkkxSDA3VUxV?=
 =?utf-8?B?TzdDdFZzV21YYldEcFNXbjNPa1lKdXFXKzh3N2lrOFNBU2haUS9PZDNyd1Fj?=
 =?utf-8?B?VTFxYUV1L3pUNk9aYXJvaUlySjlycXJWNGlyRWJUUlRyMjZjdWt6VWRFeVlk?=
 =?utf-8?B?ZzVKLzlXeWJEemovbkxGbTEybkhOM2xzOWxkRUM2Ym1RT0ZFcnlpajl5R1Fh?=
 =?utf-8?B?alI3Nmt0eHFUWVYxWlh4blJpaUsvODFDZUNpdnFpQ0NqYytoRXg1cVJmays2?=
 =?utf-8?Q?rrkbv3PiMM7b3G1Yx7nmtzwfF?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6414.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8526a29c-49d4-4b73-f5f8-08dc979356e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jun 2024 16:57:05.3503
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jiHeeWm9o7MoKg7ghbyHb/0EkLPduB66O7+V8rCVCf9TB+avvn2NrJ35pAcOk6yZzmbKMN9RAplbw+Cs3/0IAe5hGANtd/TD4hQy5uPbmvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5283
X-OriginatorOrg: intel.com

Pi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+RnJvbTogQnJvc3QsIE1hdHRoZXcgPG1hdHRo
ZXcuYnJvc3RAaW50ZWwuY29tPg0KPlNlbnQ6IEZyaWRheSwgSnVuZSAyOCwgMjAyNCAxMTo0NCBB
TQ0KPlRvOiBSdWhsLCBNaWNoYWVsIEogPG1pY2hhZWwuai5ydWhsQGludGVsLmNvbT4NCj5DYzog
aW50ZWwteGVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnOyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZnZXIu
a2VybmVsLm9yZzsNCj5kYXZpZC5lLmJveEBsaW51eC5pbnRlbC5jb207IGlscG8uamFydmluZW5A
bGludXguaW50ZWwuY29tDQo+U3ViamVjdDogUmU6IFtQQVRDSCB2NCA0LzZdIGRybS94ZS92c2Vj
OiBTdXBwb3J0IEJNRyBkZXZpY2VzDQo+DQo+T24gRnJpLCBKdW4gMjgsIDIwMjQgYXQgMTE6MDk6
NDJBTSAtMDQwMCwgTWljaGFlbCBKLiBSdWhsIHdyb3RlOg0KPj4gVXRpbGl6ZSB0aGUgUE1UIGNh
bGxiYWNrIEFQSSB0byBhZGQgc3VwcG9ydCBmb3IgdGhlIEJNRw0KPj4gZGV2aWNlcy4NCj4+DQo+
DQo+SSBkb24ndCByZWFsbHkga25vdyB3aGF0IHRoaXMgZmVhdHVyZSBpcyBkb2luZywgc28gbXkg
Y29tbWVudHMgYXJlDQo+cHVyZWx5IGZvY3VzaW5nIG9uIHN0eWxlIC8gY29kZSBzdHJ1Y3R1cmUu
DQoNCkkgYW0gZW5hYmxpbmcgYWNjZXNzIHRvIHRoZSBQTVQgKHRlbGVtZXRyeSkgaGFyZHdhcmUg
b24gdGhlIHNwZWNpZmllZCBkZXZpY2VzLiAgTm9ybWFsbHkNCnRoaXMgd291bGQgYmUgYSBQQ0kg
ZW5kcG9pbnQsIGJ1dCBmb3IgdmFyaW91cyBkZXZpY2VzLCB0aGUgZW5kcG9pbnQgaXMgbm90IGF2
YWlsYWJsZS4NCg0KU2hvdWxkIEkgY29tbWVudCBvbiB0aGF0IGluIHRoZSBjb21taXQgbWVzc2Fn
ZT8NCg0KVGhhbmsgeW91IGZvciB5b3VyIGNvbW1lbnRzLiDwn5iKDQoNCj4+IFNpZ25lZC1vZmYt
Ynk6IE1pY2hhZWwgSi4gUnVobCA8bWljaGFlbC5qLnJ1aGxAaW50ZWwuY29tPg0KPj4gLS0tDQo+
PiAgZHJpdmVycy9ncHUvZHJtL3hlL01ha2VmaWxlICAgICAgICAgIHwgICAxICsNCj4+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMgICAgICAgfCAgIDUgKw0KPj4gIGRyaXZlcnMvZ3B1
L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8ICAgNiArDQo+PiAgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZzZWMuYyAgICAgICAgIHwgMjE0ICsrKysrKysrKysrKysrKysrKysrKysrKysrKw0KPj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmggICAgICAgICB8ICAxMyArKw0KPj4gIDUgZmls
ZXMgY2hhbmdlZCwgMjM5IGluc2VydGlvbnMoKykNCj4+ICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5oDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPj4gaW5kZXggYjFl
MDNiZmU0YTY4Li41ODYwZDZkYjE1OTggMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUvTWFrZWZpbGUNCj4+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPj4gQEAg
LTEyOSw2ICsxMjksNyBAQCB4ZS15ICs9IHhlX2JiLm8gXA0KPj4gIAl4ZV92bS5vIFwNCj4+ICAJ
eGVfdnJhbS5vIFwNCj4+ICAJeGVfdnJhbV9mcmVxLm8gXA0KPj4gKwl4ZV92c2VjLm8gXA0KPj4g
IAl4ZV93YWl0X3VzZXJfZmVuY2UubyBcDQo+PiAgCXhlX3dhLm8gXA0KPj4gIAl4ZV93b3BjbS5v
DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+Yi9kcml2
ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4+IGluZGV4IGNmZGE3Y2I1ZGYyYy4uMDVhNjY2
YzdiYmI3IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+
PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4+IEBAIC01Myw2ICs1Myw3
IEBADQo+PiAgI2luY2x1ZGUgInhlX3R0bV9zeXNfbWdyLmgiDQo+PiAgI2luY2x1ZGUgInhlX3Zt
LmgiDQo+PiAgI2luY2x1ZGUgInhlX3ZyYW0uaCINCj4+ICsjaW5jbHVkZSAieGVfdnNlYy5oIg0K
Pj4gICNpbmNsdWRlICJ4ZV93YWl0X3VzZXJfZmVuY2UuaCINCj4+DQo+PiAgc3RhdGljIGludCB4
ZV9maWxlX29wZW4oc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxl
KQ0KPj4gQEAgLTMxNyw2ICszMTgsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfY3Jl
YXRlKHN0cnVjdCBwY2lfZGV2DQo+KnBkZXYsDQo+PiAgCQlnb3RvIGVycjsNCj4+ICAJfQ0KPj4N
Cj4+ICsJZHJtbV9tdXRleF9pbml0KCZ4ZS0+ZHJtLCAmeGUtPnBtdC5sb2NrKTsNCj4+ICsNCj4+
ICAJZXJyID0geGVfZGlzcGxheV9jcmVhdGUoeGUpOw0KPj4gIAlpZiAoV0FSTl9PTihlcnIpKQ0K
Pj4gIAkJZ290byBlcnI7DQo+PiBAQCAtNjkyLDYgKzY5NSw4IEBAIGludCB4ZV9kZXZpY2VfcHJv
YmUoc3RydWN0IHhlX2RldmljZSAqeGUpDQo+PiAgCWZvcl9lYWNoX2d0KGd0LCB4ZSwgaWQpDQo+
PiAgCQl4ZV9ndF9zYW5pdGl6ZV9mcmVxKGd0KTsNCj4+DQo+PiArCXhlX3ZzZWNfaW5pdCh4ZSk7
DQo+PiArDQo+PiAgCXJldHVybiBkZXZtX2FkZF9hY3Rpb25fb3JfcmVzZXQoeGUtPmRybS5kZXYs
IHhlX2RldmljZV9zYW5pdGl6ZSwNCj54ZSk7DQo+Pg0KPj4gIGVycl9maW5pX2Rpc3BsYXk6DQo+
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZV90eXBlcy5oDQo+Yi9k
cml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4+IGluZGV4IGMzN2JlNDcxZDEx
Yy4uMTE1MTNkOGYzYThiIDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2Rl
dmljZV90eXBlcy5oDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmgNCj4+IEBAIC00NTEsNiArNDUxLDEyIEBAIHN0cnVjdCB4ZV9kZXZpY2Ugew0KPj4gIAkJc3Ry
dWN0IG11dGV4IGxvY2s7DQo+PiAgCX0gZDNjb2xkOw0KPj4NCj4+ICsJLyoqIEBwbXQ6IFN1cHBv
cnQgdGhlIFBNVCBkcml2ZXIgY2FsbGJhY2sgaW50ZXJmYWNlICovDQo+PiArCXN0cnVjdCB7DQo+
PiArCQkvKiogQHBtdC5sb2NrOiBwcm90ZWN0IGFjY2VzcyBmb3IgdGVsZW1ldHJ5IGRhdGEgKi8N
Cj4+ICsJCXN0cnVjdCBtdXRleCBsb2NrOw0KPj4gKwl9IHBtdDsNCj4+ICsNCj4+ICAJLyoqDQo+
PiAgCSAqIEBwbV9jYWxsYmFja190YXNrOiBUcmFjayB0aGUgYWN0aXZlIHRhc2sgdGhhdCBpcyBy
dW5uaW5nIGluIGVpdGhlcg0KPj4gIAkgKiB0aGUgcnVudGltZV9zdXNwZW5kIG9yIHJ1bnRpbWVf
cmVzdW1lIGNhbGxiYWNrcy4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUveGVf
dnNlYy5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPj4gbmV3IGZpbGUgbW9kZSAx
MDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uN2RiMTYyNGEzMzVmDQo+PiAtLS0gL2Rldi9u
dWxsDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+PiBAQCAtMCwwICsx
LDIxNCBAQA0KPj4gKy8vIFNQRFgtTGljZW5zZS1JZGVudGlmaWVyOiBHUEwtMi4wDQo+PiArLyoN
Cj4+ICsgKiBDb3B5cmlnaHQgwqkgMjAyMiAtIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24NCj4+ICsg
Ki8NCj4+ICsjaW5jbHVkZSA8bGludXgvaW50ZWxfdnNlYy5oPg0KPj4gKyNpbmNsdWRlIDxsaW51
eC9wY2kuaD4NCj4+ICsNCj4+ICsjaW5jbHVkZSAieGVfZGV2aWNlLmgiDQo+PiArI2luY2x1ZGUg
InhlX2RldmljZV90eXBlcy5oIg0KPj4gKyNpbmNsdWRlICJ4ZV9kcnYuaCINCj4+ICsjaW5jbHVk
ZSAieGVfbW1pby5oIg0KPj4gKyNpbmNsdWRlICJ4ZV9wbGF0Zm9ybV90eXBlcy5oIg0KPj4gKyNp
bmNsdWRlICJ4ZV9wbS5oIg0KPj4gKyNpbmNsdWRlICJ4ZV92c2VjLmgiDQo+PiArDQo+PiArI2Rl
ZmluZSBTT0NfQkFTRQkJMHgyODAwMDANCj4+ICsNCj4+ICsjZGVmaW5lIEJNR19QTVRfQkFTRQkJ
MHhEQjAwMA0KPj4gKyNkZWZpbmUgQk1HX0RJU0NPVkVSWV9PRkZTRVQJKFNPQ19CQVNFICsgQk1H
X1BNVF9CQVNFKQ0KPj4gKw0KPj4gKyNkZWZpbmUgQk1HX1RFTEVNRVRSWV9CQVNFCTB4RTAwMDAN
Cj4+ICsjZGVmaW5lIEJNR19URUxFTUVUUllfT0ZGU0VUCShTT0NfQkFTRSArIEJNR19URUxFTUVU
UllfQkFTRSkNCj4+ICsNCj4+ICsjZGVmaW5lIEdGWF9CQVIJCQkwDQo+PiArDQo+PiArI2RlZmlu
ZSBTR19SRU1BUF9JTkRFWDEJCVhFX1JFRyhTT0NfQkFTRSArIDB4MDgpDQo+PiArI2RlZmluZSBT
R19SRU1BUF9BQ0NFU1MoX21lbSkJKChfbWVtKSA8PCAyNCkNCj4+ICsjZGVmaW5lIFNHX1JFTUFQ
X0JJVFMJCUdFTk1BU0soMzEsIDI0KQ0KPj4gKw0KPj4gK3N0YXRpYyBzdHJ1Y3QgaW50ZWxfdnNl
Y19oZWFkZXIgYm1nX3RlbGVtZXRyeSA9IHsNCj4+ICsJLmxlbmd0aCA9IDB4MTAsDQo+PiArCS5p
ZCA9IFZTRUNfSURfVEVMRU1FVFJZLA0KPj4gKwkubnVtX2VudHJpZXMgPSAyLA0KPj4gKwkuZW50
cnlfc2l6ZSA9IDQsDQo+PiArCS50YmlyID0gR0ZYX0JBUiwNCj4+ICsJLm9mZnNldCA9IEJNR19E
SVNDT1ZFUllfT0ZGU0VULA0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIHN0cnVjdCBpbnRlbF92
c2VjX2hlYWRlciAqYm1nX2NhcGFiaWxpdGllc1tdID0gew0KPj4gKwkmYm1nX3RlbGVtZXRyeSwN
Cj4+ICsJTlVMTA0KPj4gK307DQo+PiArDQo+PiArZW51bSB4ZV92c2VjIHsNCj4+ICsJWEVfVlNF
Q19VTktOT1dOID0gMCwNCj4+ICsJWEVfVlNFQ19CTUcsDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0
aWMgc3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1faW5mbyB4ZV92c2VjX2luZm9bXSA9IHsNCj4+
ICsJW1hFX1ZTRUNfQk1HXSA9IHsNCj4+ICsJCS5jYXBzID0gVlNFQ19DQVBfVEVMRU1FVFJZLA0K
Pj4gKwkJLmhlYWRlcnMgPSBibWdfY2FwYWJpbGl0aWVzLA0KPj4gKwl9LA0KPj4gKwl7IH0NCj4+
ICt9Ow0KPj4gKw0KPj4gKy8qIEdVSUQgRGVjb2RlIGluZm9ybWF0aW9uICovDQo+PiArI2RlZmlu
ZSBHVUlEX1RFTEVNX0lURVJBVElPTiBHRU5NQVNLKDMsIDApDQo+PiArI2RlZmluZSBHVUlEX1NF
R01FTlQgR0VOTUFTSyg3LCA0KQ0KPj4gKyNkZWZpbmUgR1VJRF9TT0NfU0tVIEdFTk1BU0soMTEs
IDgpDQo+PiArI2RlZmluZSBHVUlEX0RFVklDRV9JRCBHRU5NQVNLKDI3LCAxMikNCj4+ICsjZGVm
aW5lIEdVSURfQ0FQX1RZUEUgR0VOTUFTSygyOSwgMjgpDQo+PiArI2RlZmluZSBHVUlEX1JFQ09S
RF9JRCBHRU5NQVNLKDMxLCAzMCkNCj4+ICsNCj4+ICtlbnVtIHJlY29yZF9pZCB7DQo+PiArCVBV
TklULA0KPj4gKwlPT0JNU01fMCwNCj4+ICsJT09CTVNNXzENCj4+ICt9Ow0KPj4gKw0KPj4gK2Vu
dW0gY2FwYWJpbGl0eSB7DQo+PiArCUNSQVNITE9HLA0KPj4gKwlURUxFTUVUUlksDQo+PiArCVdB
VENIRVINCj4+ICt9Ow0KPj4gKw0KPj4gKy8qDQo+PiArICogVGhlIEdVSUQgd2lsbCBoYXZlIHRo
ZSBmb2xsb3dpbmcgYml0cyB0byBkZWNvZGUgKGhpZ2ggYml0cyBmaXJzdCk6DQo+PiArICoNCj4+
ICsgKiBYKDJiaXRzKSAtIFJlY29yZC1JRCAoMC1QVU5JVCwgMS1PT0JNU01fMCwgMi1PT0JNU01f
MSkNCj4+ICsgKiBYKDJiaXRzKSAtIENhcGFiaWxpdHkgVHlwZSAoQ3Jhc2hsb2ctMCwgVGVsZW1l
dHJ5IEFnZ3JlZ2F0b3ItMSwgV2F0Y2hlci0NCj4yKQ0KPj4gKyAqIFhYWFgoMTZiaXRzKeKAkyBE
ZXZpY2UgSUQg4oCTIGNoYW5nZXMgZm9yIGVhY2ggZG93biBiaW4gU0tV4oCZcyAoMHhFMkY4IGZv
cg0KPkJNRykNCj4+ICsgKiBYKDRiaXRzKSAtIFNPQ19TS1UgKFNLVV9JTkRFUEVOREVOVC0wLCBY
My0xLCBYMi0yLCBHMzEtMyksDQo+PiArICogWCg0Yml0cykgLSBTZWdtZW50IChTRUdNRU5UX0lO
REVQRU5ERU5ULTAsIENsaWVudC0xLCBTZXJ2ZXItMikNCj4+ICsgKiBYKDRiaXRzKSAtIHtUZWxl
bWV0cnkgc3BhY2UgaXRlcmF0aW9uIG51bWJlciAoMCwxLC4uKX0NCj4+ICsgKg0KPj4gKyAqLw0K
Pj4gK3N0YXRpYyBpbnQgZ3VpZF9kZWNvZGUodTMyIGd1aWQsIGludCAqaW5kZXgsIHUzMiAqb2Zm
c2V0KQ0KPj4gK3sNCj4+ICsJdTMyIHJlY29yZF9pZCA9IChndWlkICYgR1VJRF9SRUNPUkRfSUQp
ID4+IDMwOw0KPj4gKwl1MzIgY2FwX3R5cGUgID0gKGd1aWQgJiBHVUlEX0NBUF9UWVBFKSA+PiAy
ODsNCj4+ICsJdTMyIGRldmljZV9pZCA9IChndWlkICYgR1VJRF9ERVZJQ0VfSUQpID4+IDEyOw0K
Pg0KPkZJRUxEX0dFVChtYXNrLCBndWlkKTsNCg0KR29vZCBwb2ludC4gIEkgd2lsbCB1cGRhdGUu
DQoNCj4+ICsNCj4+ICsJaWYgKGRldmljZV9pZCAhPSAweEUyRjgpDQo+DQo+TWFnaWMgbnVtYmVy
ICgweEUyRjgpPyBDYW4gdGhpcyBub3QgYmUgYSBkZWZpbmU/DQoNClllcyBpdCBjYW4uICBJIHdp
bGwgdXBkYXRlLg0KDQo+PiArCQlyZXR1cm4gLUVOT0RFVjsNCj4+ICsNCj4+ICsJaWYgKHJlY29y
ZF9pZCA+IE9PQk1TTV8xIHx8IGNhcF90eXBlID4gV0FUQ0hFUikNCj4+ICsJCXJldHVybiAtRUlO
VkFMOw0KPj4gKw0KPj4gKwkqb2Zmc2V0ID0gMDsNCj4+ICsNCj4+ICsJaWYgKGNhcF90eXBlID09
IENSQVNITE9HKSB7DQo+PiArCQkqaW5kZXggPSByZWNvcmRfaWQgPT0gUFVOSVQgPyAyIDogNDsN
Cj4+ICsJCXJldHVybiAwOw0KPj4gKwl9DQo+PiArDQo+PiArCXN3aXRjaCAocmVjb3JkX2lkKSB7
DQo+PiArCWNhc2UgUFVOSVQ6DQo+PiArCQkqaW5kZXggPSAwOw0KPj4gKwkJaWYgKGNhcF90eXBl
ID09IFRFTEVNRVRSWSkNCj4+ICsJCQkqb2Zmc2V0ID0gMHgwMjAwOw0KPg0KPlNhbWUgY29tbWVu
dCBoZXJlIGZvciBtYWdpYyBudW1iZXJzLg0KDQpJIHdpbGwgdXBkYXRlLg0KDQo+PiArCQllbHNl
IC8qIGlmIChjYXBfdHlwZSA9PSBXQVRDSEVSKSAqLw0KPj4gKwkJCSpvZmZzZXQgPSAweDE0QTA7
DQo+PiArCQlicmVhazsNCj4+ICsNCj4+ICsJY2FzZSBPT0JNU01fMDoNCj4+ICsJCSppbmRleCA9
IDE7DQo+PiArCQlpZiAoY2FwX3R5cGUgPT0gV0FUQ0hFUikNCj4+ICsJCQkqb2Zmc2V0ID0gMHgx
OEQ4Ow0KPj4gKwkJYnJlYWs7DQo+PiArDQo+PiArCWNhc2UgT09CTVNNXzE6DQo+PiArCQkqaW5k
ZXggPSAxOw0KPj4gKwkJaWYgKGNhcF90eXBlID09IFRFTEVNRVRSWSkNCj4+ICsJCQkqb2Zmc2V0
ID0gMHgxMDAwOw0KPj4gKwkJYnJlYWs7DQo+PiArCX0NCj4+ICsNCj4+ICsJcmV0dXJuIDA7DQo+
PiArfQ0KPj4gKw0KPj4gK3N0YXRpYyBpbnQgeGVfcG10X3RlbGVtX3JlYWQodm9pZCAqYXJncywg
dTMyIGd1aWQsIHU2NCAqZGF0YSwgdTMyIGNvdW50KQ0KPj4gK3sNCj4+ICsJc3RydWN0IHhlX2Rl
dmljZSAqeGUgPSBwZGV2X3RvX3hlX2RldmljZSgoc3RydWN0IHBjaV9kZXYgKilhcmdzKTsNCj4+
ICsJdm9pZCBfX2lvbWVtICp0ZWxlbV9hZGRyID0geGUtPnRpbGVzWzBdLm1taW8ucmVncyArDQo+
Qk1HX1RFTEVNRVRSWV9PRkZTRVQ7DQo+DQo+QmFzZWQgb24gJ3RpbGVzWzBdJyB0aGlzIGZldHVy
ZSBvbmx5IHdvcmtzIG9uIGEgc2luZ2xlIHRpbGU/IE9yIGlzIHRoZQ0KPm11bHRpLUdUIHN1cHBv
cnQgbWlzc2luZz8NCg0KSG1tLi4uVGhhdCBpcyBhIGdvb2QgcXVlc3Rpb24uICBJIGJlbGlldmUg
dGhhdCB0aGUgYWNjZXNzIGlzIGJhc2VkIG9uIHRoZSBkZXZpY2UuICBUaWxlIGluZm8gbWF5IG5v
dCBiZSByZWxldmFudC4NCg0KSSB3aWxsIGlucXVpcmUuDQoNClVtLCBzaW5jZSB0aGlzIGlzIGEg
KGN1cnJlbnRseSkgZGV2aWNlIGJhc2VkLCBpcyB0aGVyZSBhICJiZXR0ZXIiIHdheSB0byBjYWxj
dWxhdGUgdGhhdCBvZmZzZXQ/DQoNClRoYW5rcyENCg0KTWlrZQ0KDQo+TWF0dA0KPg0KPj4gKwl1
MzIgbWVtX3JlZ2lvbjsNCj4+ICsJdTMyIG9mZnNldDsNCj4+ICsJaW50IHJldDsNCj4+ICsNCj4+
ICsJcmV0ID0gZ3VpZF9kZWNvZGUoZ3VpZCwgJm1lbV9yZWdpb24sICZvZmZzZXQpOw0KPj4gKwlp
ZiAocmV0KQ0KPj4gKwkJcmV0dXJuIHJldDsNCj4+ICsNCj4+ICsJdGVsZW1fYWRkciArPSBvZmZz
ZXQ7DQo+PiArDQo+PiArCW11dGV4X2xvY2soJnhlLT5wbXQubG9jayk7DQo+PiArDQo+PiArCS8q
IGluZGljYXRlIHRoYXQgd2UgYXJlIG5vdCBhdCBhbiBhcHByb3ByaWF0ZSBwb3dlciBsZXZlbCAq
Lw0KPj4gKwlyZXQgPSAtRU5PREFUQTsNCj4+ICsJaWYgKHhlX3BtX3J1bnRpbWVfZ2V0X2lmX2Fj
dGl2ZSh4ZSkgPiAwKSB7DQo+PiArCQkvKiBzZXQgU29DIHJlLW1hcHBlciBpbmRleCByZWdpc3Rl
ciBiYXNlZCBvbiBndWlkIG1lbW9yeQ0KPnJlZ2lvbiAqLw0KPj4gKwkJeGVfbW1pb19ybXczMih4
ZS0+dGlsZXNbMF0ucHJpbWFyeV9ndCwgU0dfUkVNQVBfSU5ERVgxLA0KPlNHX1JFTUFQX0JJVFMs
DQo+PiArCQkJICAgICAgU0dfUkVNQVBfQUNDRVNTKG1lbV9yZWdpb24pKTsNCj4+ICsNCj4+ICsJ
CW1lbWNweV9mcm9taW8oZGF0YSwgdGVsZW1fYWRkciwgY291bnQpOw0KPj4gKwkJcmV0ID0gY291
bnQ7DQo+PiArCQl4ZV9wbV9ydW50aW1lX3B1dCh4ZSk7DQo+PiArCX0NCj4+ICsJbXV0ZXhfdW5s
b2NrKCZ4ZS0+cG10LmxvY2spOw0KPj4gKw0KPj4gKwlyZXR1cm4gcmV0Ow0KPj4gK30NCj4+ICsN
Cj4+ICtzdHJ1Y3QgcG10X2NhbGxiYWNrcyB4ZV9wbXRfY2IgPSB7DQo+PiArCS5yZWFkX3RlbGVt
ID0geGVfcG10X3RlbGVtX3JlYWQsDQo+PiArfTsNCj4+ICsNCj4+ICtzdGF0aWMgY29uc3QgaW50
IHZzZWNfcGxhdGZvcm1zW10gPSB7DQo+PiArCVtYRV9CQVRUTEVNQUdFXSA9IFhFX1ZTRUNfQk1H
LA0KPj4gK307DQo+PiArDQo+PiArc3RhdGljIGVudW0geGVfdnNlYyBnZXRfcGxhdGZvcm1faW5m
byhzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4+ICt7DQo+PiArCWlmICh4ZS0+aW5mby5wbGF0Zm9y
bSA+IFhFX0JBVFRMRU1BR0UpDQo+PiArCQlyZXR1cm4gWEVfVlNFQ19VTktOT1dOOw0KPj4gKw0K
Pj4gKwlyZXR1cm4gdnNlY19wbGF0Zm9ybXNbeGUtPmluZm8ucGxhdGZvcm1dOw0KPj4gK30NCj4+
ICsNCj4+ICsvKioNCj4+ICsgKiB4ZV92c2VjX2luaXQgLSBJbml0aWFsaXplIHJlc291cmNlcyBh
bmQgYWRkIGludGVsX3ZzZWMgYXV4aWxpYXJ5DQo+PiArICogaW50ZXJmYWNlDQo+PiArICogQHhl
OiB2YWxpZCB4ZSBpbnN0YW5jZQ0KPj4gKyAqLw0KPj4gK3ZvaWQgeGVfdnNlY19pbml0KHN0cnVj
dCB4ZV9kZXZpY2UgKnhlKQ0KPj4gK3sNCj4+ICsJc3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1f
aW5mbyAqaW5mbzsNCj4+ICsJc3RydWN0IGRldmljZSAqZGV2ID0geGUtPmRybS5kZXY7DQo+PiAr
CXN0cnVjdCBwY2lfZGV2ICpwZGV2ID0gdG9fcGNpX2RldihkZXYpOw0KPj4gKwllbnVtIHhlX3Zz
ZWMgcGxhdGZvcm07DQo+PiArDQo+PiArCXBsYXRmb3JtID0gZ2V0X3BsYXRmb3JtX2luZm8oeGUp
Ow0KPj4gKwlpZiAocGxhdGZvcm0gPT0gWEVfVlNFQ19VTktOT1dOKQ0KPj4gKwkJcmV0dXJuOw0K
Pj4gKw0KPj4gKwlpbmZvID0gJnhlX3ZzZWNfaW5mb1twbGF0Zm9ybV07DQo+PiArCWlmICghaW5m
by0+aGVhZGVycykNCj4+ICsJCXJldHVybjsNCj4+ICsNCj4+ICsJc3dpdGNoIChwbGF0Zm9ybSkg
ew0KPj4gKwljYXNlIFhFX1ZTRUNfQk1HOg0KPj4gKwkJaW5mby0+cHJpdl9kYXRhID0gJnhlX3Bt
dF9jYjsNCj4+ICsJCWJyZWFrOw0KPj4gKwlkZWZhdWx0Og0KPj4gKwkJYnJlYWs7DQo+PiArCX0N
Cj4+ICsNCj4+ICsJLyoNCj4+ICsJICogUmVnaXN0ZXIgYSBWU0VDLiBDbGVhbnVwIGlzIGhhbmRs
ZWQgdXNpbmcgZGV2aWNlIG1hbmFnZWQNCj4+ICsJICogcmVzb3VyY2VzLg0KPj4gKwkgKi8NCj4+
ICsJaW50ZWxfdnNlY19yZWdpc3RlcihwZGV2LCBpbmZvKTsNCj4+ICt9DQo+PiArTU9EVUxFX0lN
UE9SVF9OUyhJTlRFTF9WU0VDKTsNCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfdnNlYy5oIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuaA0KPj4gbmV3IGZpbGUgbW9k
ZSAxMDA2NDQNCj4+IGluZGV4IDAwMDAwMDAwMDAwMC4uM2ZkMjlhMjFjYWQ2DQo+PiAtLS0gL2Rl
di9udWxsDQo+PiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5oDQo+PiBAQCAtMCww
ICsxLDEzIEBADQo+PiArLyogU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjAgKi8NCj4+
ICsvKg0KPj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIC0gMjAyNCBJbnRlbCBDb3Jwb3JhdGlvbg0K
Pj4gKyAqLw0KPj4gKw0KPj4gKyNpZm5kZWYgX1hFX1ZTRUNfSF8NCj4+ICsjZGVmaW5lIF9YRV9W
U0VDX0hfDQo+PiArDQo+PiArc3RydWN0IHhlX2RldmljZTsNCj4+ICsNCj4+ICt2b2lkIHhlX3Zz
ZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+PiArDQo+PiArI2VuZGlmDQo+PiAtLQ0K
Pj4gMi40NC4wDQo+Pg0K

