Return-Path: <platform-driver-x86+bounces-4779-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [147.75.199.223])
	by mail.lfdr.de (Postfix) with ESMTPS id 856D494F678
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 20:15:29 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id B25641C21C83
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2024 18:15:28 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCC52189B88;
	Mon, 12 Aug 2024 18:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ikHm/+pG"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DD7A189B8C
	for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2024 18:14:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723486480; cv=fail; b=llLUpClBCUkG1Cp4x4YGK3iXEp/OfZlo+/QXN4/dvv5Y/lp18Qdm1ellh4DumJ8yGKh2JeNw3KXw7DXBNfcoPefhgz5AIIBGwvMJ4V7QFzDDuzrgQ/X+OIDTOwiq4ynfRDN5a52R7eSvKweUFEfKjP8GmEWnJoWmrzya6aMwMIk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723486480; c=relaxed/simple;
	bh=SFmKnPkpKqTVdG4UQj9sXmY8ao4OlvDJuGjxrpB4d8w=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=W5pGN1UmTJf8kNHEVWp38oHC4qbrR3/3NmciuX3cduBT3396WTTxoEOhia6BbT0LsYSawE+3ifkC/vzmtMotXamEiKs422ZE1BxV2bNX+EYtNoEdtcV67GxPJADwgdHxx1rjg40vU5Q+CLZJcWwzTSnrmucANLa54uJPaUjyWYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ikHm/+pG; arc=fail smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723486479; x=1755022479;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=SFmKnPkpKqTVdG4UQj9sXmY8ao4OlvDJuGjxrpB4d8w=;
  b=ikHm/+pG4ltrDAUStHSxyGA/iehpKQ7uHHxe0UUHz0mrNub1luV4Azwz
   dYgR1/Zjf7vb6rWcEp3tFgyBL8Ltf0kPaWgXnb/A4EY1uylc69pjf0c25
   MxwtiHu5BjECF7FvNkPXJxRSkin2B8rmzyy2FQfyq69fkVHtHU3VTB/qI
   z7PtEJW61Dx6Rxbeored+9L63DaVdjZBY5XFKEI3aCVc8nb3y3Z/fqXlv
   Evw1VIXCKoRG3IgIj0E+rjm1cE2neluaDsMrjexzZ5ispLhCO+QjVjud/
   84sHAtBe03h/6d+Mp1mlQnSGy5P01bQRiO8G6tpZva0c/yIbZ+SMeqlom
   w==;
X-CSE-ConnectionGUID: bDaem429TJKildRNW+2+bw==
X-CSE-MsgGUID: TSok+hB6TyyZ51Zn0k7rIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11162"; a="21757708"
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="21757708"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2024 11:14:37 -0700
X-CSE-ConnectionGUID: mkXzzfDbQOy9eyTbVnrY8Q==
X-CSE-MsgGUID: kbigckCaTradSiOiqC6J+Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,283,1716274800"; 
   d="scan'208";a="58292244"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 12 Aug 2024 11:14:37 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 11:14:35 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 12 Aug 2024 11:14:35 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 12 Aug 2024 11:14:35 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (104.47.57.40) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 12 Aug 2024 11:14:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Wj0peO7sRaQEGYboKUiucvmX6PhBidASlxGGwumVriypuiYfimKpPT5kNRmcyf8NI4D0zHI1KMJinoTuG+iwC/kCSN/uqYeGkKdDXTOpyfd5kTWmoMczBo8Frk6x2GGq7ah91jptB1+v7wN1Il+rOs3/7EEvldOi2ACJvRRXHpDKfTaaH+tCbeMS3mXhO3QqVcgOVy3flg7zrF1ucCpMWbzJLtkyVcwoAHlOQfcMNhHCLgZfC8MLUGiuDZ6d2WZR/+n6a7d/LSeMEFGHd98ce4weo+7k46DzPrs0gUQLunG7eLdAJsAOUpwYby2AOPTVIkfvEd1TPqrK8eeeS/zyEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SFmKnPkpKqTVdG4UQj9sXmY8ao4OlvDJuGjxrpB4d8w=;
 b=F44MX8SFy1r72mZDG3WBxQSjoZ8PtDRCfaZitxe7JoyUReTIY2h0p8PAgU0rxnlBosYzOZTXNwsTOQqB/9r9hIoqYPj24JYHEYrzy1a7cWBK0BSKed2oghkahk6KT/WXhk8RPJ5H2gAXSzRB5yRLwVyOn86GvW5htNEQOokvES/NydFo4E+8JJG8jjFx2vHwgYnlaXBznKjixCqsMkrgN2FMsh7a/yN4MFhcIdVZCVCZsltTIDQZyKUyqNKdb9Z/truSP+vuBJRWr48IDukXJ0F9+pV4MSxmjigg8VTiU/T60cUD/17C9HOI74gst0b/fQMXc+v0Kymw4cTBh8n1Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from IA1PR11MB6418.namprd11.prod.outlook.com (2603:10b6:208:3aa::18)
 by DM4PR11MB6502.namprd11.prod.outlook.com (2603:10b6:8:89::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7828.32; Mon, 12 Aug 2024 18:14:32 +0000
Received: from IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83]) by IA1PR11MB6418.namprd11.prod.outlook.com
 ([fe80::68b8:5391:865e:a83%7]) with mapi id 15.20.7828.031; Mon, 12 Aug 2024
 18:14:31 +0000
From: "Ruhl, Michael J" <michael.j.ruhl@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>,
	"david.e.box@linux.intel.com" <david.e.box@linux.intel.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "Brost,
 Matthew" <matthew.brost@intel.com>, "andriy.shevchenko@linux.intel.com"
	<andriy.shevchenko@linux.intel.com>, "hdegoede@redhat.com"
	<hdegoede@redhat.com>
CC: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>
Subject: RE: [PATCH v10] drm/xe/vsec: Support BMG devices
Thread-Topic: [PATCH v10] drm/xe/vsec: Support BMG devices
Thread-Index: AQHa7OK5sWnRZTehmU+RngNqJPn6ELIj7NXQ
Date: Mon, 12 Aug 2024 18:14:31 +0000
Message-ID: <IA1PR11MB64186207DB7E251BF2C688A4C1852@IA1PR11MB6418.namprd11.prod.outlook.com>
References: <20240812180836.227727-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240812180836.227727-1-michael.j.ruhl@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: IA1PR11MB6418:EE_|DM4PR11MB6502:EE_
x-ms-office365-filtering-correlation-id: 1f9685b8-ba2d-4227-a4c6-08dcbafa9d0d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?ZHlSakNxVU5RTlhVRmltZE5qSWRXdnk3SXY3dG5HZS9aTGcyMFFaaHc1UWFr?=
 =?utf-8?B?TzRRWjdLbTRSSmlTS0JseUd0akU2NTZQTzdhNDNORE9HMFlCelRUS3VjaVJV?=
 =?utf-8?B?OE9ld0pOMzVxOGUxZU9pNzE5dHBqMzd4L1ArSTEyL3Z4Yi9NclM4NjdDaXVG?=
 =?utf-8?B?Sks4SWVMWHJqTTFiRGNVM3FKemN3bllVWXNuZTBuU0d2VThPMGpwK3pVejN0?=
 =?utf-8?B?blV6dlRxdmV4OThGai9JN0tsVS9JelEyK1VxMVZTUHA4d2RrdXhIR2xtenZN?=
 =?utf-8?B?SCtiWEtaZDBFS2ZJdXIxbWdtdGc2QXZ6U1B6Tk5oSXdOb3oxandCejR4bTNl?=
 =?utf-8?B?YWRSZFdQUll6RFc3Uk56aUJrT1dUcU8yNTQxc1lYSDhpTDQrTWw0V3F3Wmww?=
 =?utf-8?B?NjNiNGlFOEZYZ0pMaTBPeUtNOUVDVDlYSFhheW5NUVFTdXlMTXgvZkhIcHNS?=
 =?utf-8?B?ajFrMEdRc2d6VDFxVGFzYUJyU3ZZMmdjS05tcVV6RThwdWlDUDNUNkJvNE5S?=
 =?utf-8?B?Wjl5ZmZWbTgzME9mZ0hFR2kzY0pRQTBFTmtaSHdYbWorR3FtWFJEZkpBa2ky?=
 =?utf-8?B?MFdBUURjd3dDUlRpNVZ4UU1iejZXNkdsZ1kra3VxZ0M5MUNCaEI5TEFPeUox?=
 =?utf-8?B?VHB6VDJiTHB6QUdGMFFqNjlTV082b054aVMrNjVmYWNNbjl4c21yeGlpVnpG?=
 =?utf-8?B?RXZjaUdDQXVCZW1LVld0cHdNUTlKRExERklCNWtmZDg0cWlDbDRvMDNSalV1?=
 =?utf-8?B?R3hHRW90UUtPTDZNR3phNE9UbHRtb1Z4ZnNGOHNsdkVMaDhxY2o3cHgvRS9M?=
 =?utf-8?B?NWwzWDNVLzFsSk9Da1A2NWZrOWRtTU00NVRnRWk1elBkMmNWU1Y3MkcvazN2?=
 =?utf-8?B?cjBkYnBnZzlGbVZRRGNPbTl2TVo3WSt4ektDTWx2N1kzRDZZVis4UEpFM0c2?=
 =?utf-8?B?aVd6SzZPSENNVzNFb3dYenE1b3ZXMkxCc2RnbVVsWmIyOTdtb3FhakFaZFoy?=
 =?utf-8?B?YUhPWGtxTHliTW1uRGJyY1ZXZEp3cVlLQzNhUVh5dzRXUDJ6ZXhCTGVXUHhv?=
 =?utf-8?B?ZjFmWkRCY3hwTVhUS25mNU5VVEtURDZUVUdBUXArTldpUGZVMXhtRTJ4em4r?=
 =?utf-8?B?WW9GRUUvcEFzSWFwcGwyNEJ0eXFNWEJ1aGdKSVkxWTVsb1FFRDl6ek83ZzE3?=
 =?utf-8?B?a0lHTTZhUUY1SWlVZzJFdExEbFJ6bEdCUSticCtXNFowb2xvZGhTWkdnajFt?=
 =?utf-8?B?SGQ0TG5OYTJLRGVaMEMzS2xJNUlrVlhKVzlDT3RJclBoUmtZalZDU1pqVHN0?=
 =?utf-8?B?SysvV1JocXFjMU9ReldoR1V5WUpXZWszOS9WOXI4cm5TcUZ3YWJiVFF4Mmwr?=
 =?utf-8?B?NExFTkxoOFQvSFNnY2RNVTMvTEd6M0R0OEZpYUl0WFlCQkZOM1VIUEJFejBE?=
 =?utf-8?B?d1lqSlVJOE5RYlFHb3lhVzVLY1Q0dWZNMmN2bUVpeG0yN0QrbzVoOHNUcFBO?=
 =?utf-8?B?ZXJqSzRFazVobnd5OGpKakwyZXRBR21MRElNZStKeEJFUVNreVY1alNCM2R1?=
 =?utf-8?B?Q1ZZTUVHUE5NTFpSZFhSWmU0WTFwMXdwbXRpQmxNUzlpYUJRV0N1Z3VBS1FN?=
 =?utf-8?B?eVl5NXlXU2haeHFLMVFsVmhPNFViUzVuaVlrTHQzZWRsbGlleS9kSWV4cUZp?=
 =?utf-8?B?S0Q0YTZGaVNveTJqTnloTUdKamhrNnJsK2tDMVJmVkZlK2xqeXNuZlB6N2w3?=
 =?utf-8?B?bEdET0R2YzEzRG5QdTdFUVVJeTZISW9WREVHMlJpVXExY05hUi9hMUIxTkcz?=
 =?utf-8?B?RDlJaDU1SkdtQjBlbXZicTVLUndvQ1JXbHlnMlM2T2RYbkVHQytueE9HYmlj?=
 =?utf-8?B?ajdZcFZjbnI5UXVGZU9IZ1dZRWduQ3hkNjBQbytlY3VlVGc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR11MB6418.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUhWeUxhVmVKS3N6eXhPRTNSRExaWDBYdXJCdk1ORTJMU05oNFI2K09JSXZ6?=
 =?utf-8?B?cCtJOHhtWVF0MGpXTzRHMTU1T1BzbXJ6NVg1M1gxL1I3ZU5FcCtONjh6S1pl?=
 =?utf-8?B?UmJYdHJjWDBIdkZEbktiN21BcUlvTVNQclFPV2hFc2xOeExBdHZOaVlpdHJK?=
 =?utf-8?B?ZWRlUW5KNm9OVFVjMkFIWUpWc3Jsd1p3ZjJ3cXRlaEJkT0ljQ1BLeG1DS1gr?=
 =?utf-8?B?WEFRUTNEdzd0VnpPMnlaNjZZM1VaYVZ1azV4dFQvQXBhVWROUVpVSTZSVkh4?=
 =?utf-8?B?UDgzWlhhTEtMKytxWURqQmFJVlR6UEtvRlloR0lLbURyd3J6MjlPYkIwTmIw?=
 =?utf-8?B?NCtlQy9CU0tHdndtYTREVU4veDc4UTlxbkpvb05NQXVpcE5aQlAyUDdIZEpo?=
 =?utf-8?B?aVNuK2YwVU1DRi95R2xEK2sxcmlLcks0WlgrU0lLRXhMV0pvOGRlWmt6STVL?=
 =?utf-8?B?WWlCMVlQUWlMbGVMTjY0NmtCMDlyeURBRC82dW5DQXlHYW5rVjN1MDZpVXh1?=
 =?utf-8?B?S29OQ3VnYUhHSHpaRGlsS2N2TytOY0dYd0JKazRFM2daU2hBSG9tenhQQmxt?=
 =?utf-8?B?RDlCQ0daMTNJekpGR0dUK1VJTC8yclNVMzF5Um1kRTdvK0pxaE1ScGhoMm44?=
 =?utf-8?B?VG1paGFSd05EbWN1OEcvbkZBMGhxNVFjNWZpL3BGdnlHbFB0UW5paE1FOWtU?=
 =?utf-8?B?RHRCUXlCekFGekxod01GSVpBZkNzN2RjQ2Q5cWh5UXpoRjBqd3VsaUh4a1ox?=
 =?utf-8?B?VHJ6b1lLRkRIK2lTSTdjbG51Q3VuV2RXM2NnTGx6NUVyRlhrZFpGSk96RDM2?=
 =?utf-8?B?U1NQc09rcktnUzgrR3R0VU9KQnlsVDhBMWhBV0dKL3FDaHcvWkk2a0s0RmN5?=
 =?utf-8?B?UytUVmRsK1pWZlZhcTY4YTU1ekRReGhEYVhFVkk2eXczcXdlQUFWVkJ3MWxv?=
 =?utf-8?B?ZWhuTk1iWlZaY2Jib2FybFpsVXdyREpaL0o1ZUtJd2Q4UkFpbjNrcnF5SHJT?=
 =?utf-8?B?L0taN1RrZHRiTHBQc0NxcFNLRFFTeWkyMjBzdXBERGVKTGFRSHJDSFAvZHlB?=
 =?utf-8?B?YUpJeWFqTlU5akhXY1VQbFlYb3NOR1FXdnJLNy9sRVBySWxqNVNveDVCZHRx?=
 =?utf-8?B?d3lvM0pJdWJWemc2NDZPcEw1SmtURGlhSnZFQzk0T1IzcGhuUCsxUVFlUzlR?=
 =?utf-8?B?dWY1SCtVQm5YYVQ4YkQzciswMlE4alZtRHY1NVpMcEFkR1BxdWNCbXhnSHph?=
 =?utf-8?B?ZUhTMEdTU2pUeklIL3lwK3RMOVhOMTVnR1Fya0RkVC9PZkNNVkpiSndDbDJB?=
 =?utf-8?B?NFBpWVlGWU1QaVR6N0RhSEM0THljVXkxdHlQYUJLNnRmU0x0Q3hibDhBTUFK?=
 =?utf-8?B?QzdTMlpka1psOUdNQklQaW1HZ0JDZStsSm9lclEyY056UXdLS0VpNW53N1FV?=
 =?utf-8?B?QlhpQ1ZJUEprVDhlU3g4ZXpvOVJob0o4SU9VQUVjVVJhYXRGNlFlZ2JOQmhV?=
 =?utf-8?B?NzlNU2NONERhamVhSzFVTEV1c216ZStXRFlFZGJlRmdmWDB4OUZsbkR6TUtZ?=
 =?utf-8?B?SUFsSE5wS3laTW5DbG5OU0kxcWlMYW1CM2dEbE03SzNiZFFTSjhFSzdwR0w1?=
 =?utf-8?B?dE1PUVYrU2MrbzBvN1NzZ09oYjg4cHdNYjB5ei9XVEtzZnh0aEVQSGo5QXI5?=
 =?utf-8?B?ekprZ1lNMGVmUTNwZU91K01yLzZ3bnNuYUhaYzcyL0ZrempvaXRwUEpqSmhZ?=
 =?utf-8?B?OGtZNGRoY0ZIcjcxQlBWTVM2Q1lPOU9qS0Z3YzhTRkJiR1BYS2htT05PMDFG?=
 =?utf-8?B?b2MrVGZ5Q3RRc3FYM3JPTHV3WXRVL0lRYUF3VGFUWm9xOEpaMGpLaUNsQi8y?=
 =?utf-8?B?VU9HanpTNHVHRk1ZQllqNjFEU3ZRRUhVUWQwS2Z6UFJEN3F1Z045VkZJU2oy?=
 =?utf-8?B?UFJkaHFZbThYZVZLaXd3U2JBa09SdFFUVEVELy9FbE1uaDNHN2hHUHZDb0t2?=
 =?utf-8?B?dWFIWnhCNTBaK1I0WEN4WnUvR0ZwWVhUUWtYMTFPeXdlL0ZzZHllUUhMRFgr?=
 =?utf-8?B?OWZ2cXVMUG9DTExMaDFYbmtKS3B2dTJFQXNRUG12NTEva29tTnFBZGZqd3VE?=
 =?utf-8?Q?D07nE4EvsbnPdMstdk9vOl4/C?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6418.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f9685b8-ba2d-4227-a4c6-08dcbafa9d0d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Aug 2024 18:14:31.9231
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: yiAHb9HlvkQu3rjK0wsZfB3LCtMlUi2hHDprV6Lx3UlLpqMZLbXPFToMnWSGkYr4kBIV6cdvLDvgiiLggu3SzCoSPwy8onLk9Bn09HSQRCs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6502
X-OriginatorOrg: intel.com

SG1tLA0KDQpUaGlzIGlzIHdoYXQgdGhlIGNvbW1pdCBtZXNzYWdlIGxvb2tlZCBsaWtlIHdoZW4g
SSBzZW50IGl0Og0KDQpUaGUgQmF0dGxlbWFnZSAoQk1HKSBkaXNjcmV0ZSBncmFwaGljcyBjYXJk
IHN1cHBvcnRzDQp0aGUgUGxhdGZvcm0sID4gTW9uaXRvcmluZyBUZWNobm9sb2d5IChQTVQpIGZl
YXR1cmUNCmRpcmVjdGx5IG9uIHRoZSBwcmltYXJ5IFBDSSBkZXZpY2UuDQoNClV0aWxpemUgdGhl
IFBNVCBjYWxsYmFjayBBUEkgdG8gYWRkIHN1cHBvcnQgZm9yIHRoZSBCTUcNCmRldmljZXMuDQoN
Ck5vdCBzdXJlIHdoeSBpdCBlbmRlZCB1cCBoZXJlIHdpdGhvdXQgdGhlIDxjcj5zPw0KDQpNDQoN
Cj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogUnVobCwgTWljaGFlbCBKIDxt
aWNoYWVsLmoucnVobEBpbnRlbC5jb20+DQo+IFNlbnQ6IE1vbmRheSwgQXVndXN0IDEyLCAyMDI0
IDI6MDkgUE0NCj4gVG86IGludGVsLXhlQGxpc3RzLmZyZWVkZXNrdG9wLm9yZzsgcGxhdGZvcm0t
ZHJpdmVyLXg4NkB2Z2VyLmtlcm5lbC5vcmc7DQo+IGRhdmlkLmUuYm94QGxpbnV4LmludGVsLmNv
bTsgaWxwby5qYXJ2aW5lbkBsaW51eC5pbnRlbC5jb207IEJyb3N0LCBNYXR0aGV3DQo+IDxtYXR0
aGV3LmJyb3N0QGludGVsLmNvbT47IGFuZHJpeS5zaGV2Y2hlbmtvQGxpbnV4LmludGVsLmNvbTsN
Cj4gaGRlZ29lZGVAcmVkaGF0LmNvbQ0KPiBDYzogUnVobCwgTWljaGFlbCBKIDxtaWNoYWVsLmou
cnVobEBpbnRlbC5jb20+OyBWaXZpLCBSb2RyaWdvDQo+IDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiBTdWJqZWN0OiBbUEFUQ0ggdjEwXSBkcm0veGUvdnNlYzogU3VwcG9ydCBCTUcgZGV2aWNl
cw0KPiANCj4gVGhlIEJhdHRsZW1hZ2UgKEJNRykgZGlzY3JldGUgZ3JhcGhpY3MgY2FyZCBzdXBw
b3J0cyB0aGUgUGxhdGZvcm0sDQo+IE1vbml0b3JpbmcgVGVjaG5vbG9neSAoUE1UKSBmZWF0dXJl
IGRpcmVjdGx5IG9uIHRoZSBwcmltYXJ5IFBDSSBkZXZpY2UuDQo+IA0KPiBVdGlsaXplIHRoZSBQ
TVQgY2FsbGJhY2sgQVBJIHRvIGFkZCBzdXBwb3J0IGZvciB0aGUgQk1HIGRldmljZXMuDQo+IA0K
PiBSZXZpZXdlZC1ieTogSWxwbyBKw6RydmluZW4gPGlscG8uamFydmluZW5AbGludXguaW50ZWwu
Y29tPg0KPiBSZXZpZXdlZC1ieTogUm9kcmlnbyBWaXZpIDxyb2RyaWdvLnZpdmlAaW50ZWwuY29t
Pg0KPiBTaWduZWQtb2ZmLWJ5OiBNaWNoYWVsIEouIFJ1aGwgPG1pY2hhZWwuai5ydWhsQGludGVs
LmNvbT4NCj4gLS0tDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUvTWFrZWZpbGUgICAgICAgICAgfCAg
IDEgKw0KPiAgZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jICAgICAgIHwgICA1ICsNCj4g
IGRyaXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaCB8ICAgNiArDQo+ICBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdnNlYy5jICAgICAgICAgfCAyMjEgKysrKysrKysrKysrKysrKysrKysr
KysrKysrDQo+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5oICAgICAgICAgfCAgMTMgKysN
Cj4gIDUgZmlsZXMgY2hhbmdlZCwgMjQ2IGluc2VydGlvbnMoKykNCj4gIGNyZWF0ZSBtb2RlIDEw
MDY0NCBkcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jICBjcmVhdGUgbW9kZSAxMDA2NDQNCj4g
ZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuaA0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS9NYWtlZmlsZSBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZSBpbmRleA0K
PiA2MjhjMjQ1YzQ4MjIuLmY0YzY3NjFkYzJlNyAxMDA2NDQNCj4gLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL3hlL01ha2VmaWxlDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS9NYWtlZmlsZQ0KPiBA
QCAtMTI5LDYgKzEyOSw3IEBAIHhlLXkgKz0geGVfYmIubyBcDQo+ICAJeGVfdm0ubyBcDQo+ICAJ
eGVfdnJhbS5vIFwNCj4gIAl4ZV92cmFtX2ZyZXEubyBcDQo+ICsJeGVfdnNlYy5vIFwNCj4gIAl4
ZV93YWl0X3VzZXJfZmVuY2UubyBcDQo+ICAJeGVfd2EubyBcDQo+ICAJeGVfd29wY20ubw0KPiBk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jIGIvZHJpdmVycy9ncHUv
ZHJtL3hlL3hlX2RldmljZS5jDQo+IGluZGV4IDc2MTA5NDE1ZWJhNi4uYTdjNzU5Yzk4NTYwIDEw
MDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlLmMNCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2RldmljZS5jDQo+IEBAIC01Myw2ICs1Myw3IEBADQo+ICAjaW5j
bHVkZSAieGVfdHRtX3N5c19tZ3IuaCINCj4gICNpbmNsdWRlICJ4ZV92bS5oIg0KPiAgI2luY2x1
ZGUgInhlX3ZyYW0uaCINCj4gKyNpbmNsdWRlICJ4ZV92c2VjLmgiDQo+ICAjaW5jbHVkZSAieGVf
d2FpdF91c2VyX2ZlbmNlLmgiDQo+IA0KPiAgc3RhdGljIGludCB4ZV9maWxlX29wZW4oc3RydWN0
IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRybV9maWxlICpmaWxlKSBAQCAtDQo+IDMxNyw2ICsz
MTgsOCBAQCBzdHJ1Y3QgeGVfZGV2aWNlICp4ZV9kZXZpY2VfY3JlYXRlKHN0cnVjdCBwY2lfZGV2
ICpwZGV2LA0KPiAgCQlnb3RvIGVycjsNCj4gIAl9DQo+IA0KPiArCWRybW1fbXV0ZXhfaW5pdCgm
eGUtPmRybSwgJnhlLT5wbXQubG9jayk7DQo+ICsNCj4gIAllcnIgPSB4ZV9kaXNwbGF5X2NyZWF0
ZSh4ZSk7DQo+ICAJaWYgKFdBUk5fT04oZXJyKSkNCj4gIAkJZ290byBlcnI7DQo+IEBAIC02OTIs
NiArNjk1LDggQEAgaW50IHhlX2RldmljZV9wcm9iZShzdHJ1Y3QgeGVfZGV2aWNlICp4ZSkNCj4g
IAlmb3JfZWFjaF9ndChndCwgeGUsIGlkKQ0KPiAgCQl4ZV9ndF9zYW5pdGl6ZV9mcmVxKGd0KTsN
Cj4gDQo+ICsJeGVfdnNlY19pbml0KHhlKTsNCj4gKw0KPiAgCXJldHVybiBkZXZtX2FkZF9hY3Rp
b25fb3JfcmVzZXQoeGUtPmRybS5kZXYsIHhlX2RldmljZV9zYW5pdGl6ZSwNCj4geGUpOw0KPiAN
Cj4gIGVycl9maW5pX2Rpc3BsYXk6DQo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0veGUv
eGVfZGV2aWNlX3R5cGVzLmgNCj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZGV2aWNlX3R5cGVz
LmgNCj4gaW5kZXggM2JjYTZkMzQ0NzQ0Li40NDhhOTIxNDgwODEgMTAwNjQ0DQo+IC0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS94ZS94ZV9kZXZpY2VfdHlwZXMuaA0KPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0veGUveGVfZGV2aWNlX3R5cGVzLmgNCj4gQEAgLTQ1MSw2ICs0NTEsMTIgQEAgc3RydWN0IHhl
X2RldmljZSB7DQo+ICAJCXN0cnVjdCBtdXRleCBsb2NrOw0KPiAgCX0gZDNjb2xkOw0KPiANCj4g
KwkvKiogQHBtdDogU3VwcG9ydCB0aGUgUE1UIGRyaXZlciBjYWxsYmFjayBpbnRlcmZhY2UgKi8N
Cj4gKwlzdHJ1Y3Qgew0KPiArCQkvKiogQHBtdC5sb2NrOiBwcm90ZWN0IGFjY2VzcyBmb3IgdGVs
ZW1ldHJ5IGRhdGEgKi8NCj4gKwkJc3RydWN0IG11dGV4IGxvY2s7DQo+ICsJfSBwbXQ7DQo+ICsN
Cj4gIAkvKioNCj4gIAkgKiBAcG1fY2FsbGJhY2tfdGFzazogVHJhY2sgdGhlIGFjdGl2ZSB0YXNr
IHRoYXQgaXMgcnVubmluZyBpbiBlaXRoZXINCj4gIAkgKiB0aGUgcnVudGltZV9zdXNwZW5kIG9y
IHJ1bnRpbWVfcmVzdW1lIGNhbGxiYWNrcy4NCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92c2VjLmMgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfdnNlYy5jDQo+IG5ldyBmaWxl
IG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4uYTA0NmQ4NTBkYTgyDQo+IC0tLSAvZGV2
L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZzZWMuYw0KPiBAQCAtMCwwICsx
LDIyMSBAQA0KPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50aWZpZXI6IEdQTC0yLjANCj4gKy8qDQo+
ICsgKiBDb3B5cmlnaHQgwqkgMjAyMiAtIDIwMjQgSW50ZWwgQ29ycG9yYXRpb24gICovICNpbmNs
dWRlDQo+ICs8bGludXgvYml0ZmllbGQuaD4gI2luY2x1ZGUgPGxpbnV4L2JpdHMuaD4gI2luY2x1
ZGUNCj4gKzxsaW51eC9pbnRlbF92c2VjLmg+ICNpbmNsdWRlIDxsaW51eC9tb2R1bGUuaD4gI2lu
Y2x1ZGUgPGxpbnV4L211dGV4Lmg+DQo+ICsjaW5jbHVkZSA8bGludXgvcGNpLmg+DQo+ICsNCj4g
KyNpbmNsdWRlICJ4ZV9kZXZpY2UuaCINCj4gKyNpbmNsdWRlICJ4ZV9kZXZpY2VfdHlwZXMuaCIN
Cj4gKyNpbmNsdWRlICJ4ZV9kcnYuaCINCj4gKyNpbmNsdWRlICJ4ZV9tbWlvLmgiDQo+ICsjaW5j
bHVkZSAieGVfcGxhdGZvcm1fdHlwZXMuaCINCj4gKyNpbmNsdWRlICJ4ZV9wbS5oIg0KPiArI2lu
Y2x1ZGUgInhlX3ZzZWMuaCINCj4gKw0KPiArI2RlZmluZSBTT0NfQkFTRQkJMHgyODAwMDANCj4g
Kw0KPiArI2RlZmluZSBCTUdfUE1UX0JBU0UJCTB4REIwMDANCj4gKyNkZWZpbmUgQk1HX0RJU0NP
VkVSWV9PRkZTRVQJKFNPQ19CQVNFICsgQk1HX1BNVF9CQVNFKQ0KPiArDQo+ICsjZGVmaW5lIEJN
R19URUxFTUVUUllfQkFTRQkweEUwMDAwDQo+ICsjZGVmaW5lIEJNR19URUxFTUVUUllfT0ZGU0VU
CShTT0NfQkFTRSArIEJNR19URUxFTUVUUllfQkFTRSkNCj4gKw0KPiArI2RlZmluZSBCTUdfREVW
SUNFX0lEIDB4RTJGOA0KPiArDQo+ICsjZGVmaW5lIEdGWF9CQVIJCQkwDQo+ICsNCj4gKyNkZWZp
bmUgU0dfUkVNQVBfSU5ERVgxCQlYRV9SRUcoU09DX0JBU0UgKyAweDA4KQ0KPiArI2RlZmluZSBT
R19SRU1BUF9CSVRTCQlHRU5NQVNLKDMxLCAyNCkNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBpbnRl
bF92c2VjX2hlYWRlciBibWdfdGVsZW1ldHJ5ID0gew0KPiArCS5sZW5ndGggPSAweDEwLA0KPiAr
CS5pZCA9IFZTRUNfSURfVEVMRU1FVFJZLA0KPiArCS5udW1fZW50cmllcyA9IDIsDQo+ICsJLmVu
dHJ5X3NpemUgPSA0LA0KPiArCS50YmlyID0gR0ZYX0JBUiwNCj4gKwkub2Zmc2V0ID0gQk1HX0RJ
U0NPVkVSWV9PRkZTRVQsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgc3RydWN0IGludGVsX3ZzZWNf
aGVhZGVyICpibWdfY2FwYWJpbGl0aWVzW10gPSB7DQo+ICsJJmJtZ190ZWxlbWV0cnksDQo+ICsJ
TlVMTA0KPiArfTsNCj4gKw0KPiArZW51bSB4ZV92c2VjIHsNCj4gKwlYRV9WU0VDX1VOS05PV04g
PSAwLA0KPiArCVhFX1ZTRUNfQk1HLA0KPiArfTsNCj4gKw0KPiArc3RhdGljIHN0cnVjdCBpbnRl
bF92c2VjX3BsYXRmb3JtX2luZm8geGVfdnNlY19pbmZvW10gPSB7DQo+ICsJW1hFX1ZTRUNfQk1H
XSA9IHsNCj4gKwkJLmNhcHMgPSBWU0VDX0NBUF9URUxFTUVUUlksDQo+ICsJCS5oZWFkZXJzID0g
Ym1nX2NhcGFiaWxpdGllcywNCj4gKwl9LA0KPiArCXsgfQ0KPiArfTsNCj4gKw0KPiArLyoNCj4g
KyAqIFRoZSBHVUlEIHdpbGwgaGF2ZSB0aGUgZm9sbG93aW5nIGJpdHMgdG8gZGVjb2RlOg0KPiAr
ICoNCj4gKyAqIFgoNGJpdHMpIC0ge1RlbGVtZXRyeSBzcGFjZSBpdGVyYXRpb24gbnVtYmVyICgw
LDEsLi4pfQ0KPiArICogWCg0Yml0cykgLSBTZWdtZW50IChTRUdNRU5UX0lOREVQRU5ERU5ULTAs
IENsaWVudC0xLCBTZXJ2ZXItMikNCj4gKyAqIFgoNGJpdHMpIC0gU09DX1NLVQ0KPiArICogWFhY
WCgxNmJpdHMp4oCTIERldmljZSBJRCDigJMgY2hhbmdlcyBmb3IgZWFjaCBkb3duIGJpbiBTS1Xi
gJlzDQo+ICsgKiBYKDJiaXRzKSAtIENhcGFiaWxpdHkgVHlwZSAoQ3Jhc2hsb2ctMCwgVGVsZW1l
dHJ5IEFnZ3JlZ2F0b3ItMSwNCj4gK1dhdGNoZXItMikNCj4gKyAqIFgoMmJpdHMpIC0gUmVjb3Jk
LUlEICgwLVBVTklULCAxLU9PQk1TTV8wLCAyLU9PQk1TTV8xKSAgKi8NCj4gKyNkZWZpbmUgR1VJ
RF9URUxFTV9JVEVSQVRJT04JR0VOTUFTSygzLCAwKQ0KPiArI2RlZmluZSBHVUlEX1NFR01FTlQJ
CUdFTk1BU0soNywgNCkNCj4gKyNkZWZpbmUgR1VJRF9TT0NfU0tVCQlHRU5NQVNLKDExLCA4KQ0K
PiArI2RlZmluZSBHVUlEX0RFVklDRV9JRAkJR0VOTUFTSygyNywgMTIpDQo+ICsjZGVmaW5lIEdV
SURfQ0FQX1RZUEUJCUdFTk1BU0soMjksIDI4KQ0KPiArI2RlZmluZSBHVUlEX1JFQ09SRF9JRAkJ
R0VOTUFTSygzMSwgMzApDQo+ICsNCj4gKyNkZWZpbmUgUFVOSVRfVEVMRU1FVFJZX09GRlNFVAkJ
MHgwMjAwDQo+ICsjZGVmaW5lIFBVTklUX1dBVENIRVJfT0ZGU0VUCQkweDE0QTANCj4gKyNkZWZp
bmUgT09CTVNNXzBfV0FUQ0hFUl9PRkZTRVQJCTB4MThEOA0KPiArI2RlZmluZSBPT0JNU01fMV9U
RUxFTUVUUllfT0ZGU0VUCTB4MTAwMA0KPiArDQo+ICtlbnVtIHJlY29yZF9pZCB7DQo+ICsJUFVO
SVQsDQo+ICsJT09CTVNNXzAsDQo+ICsJT09CTVNNXzENCj4gK307DQo+ICsNCj4gK2VudW0gY2Fw
YWJpbGl0eSB7DQo+ICsJQ1JBU0hMT0csDQo+ICsJVEVMRU1FVFJZLA0KPiArCVdBVENIRVINCj4g
K307DQo+ICsNCj4gK3N0YXRpYyBpbnQgZ3VpZF9kZWNvZGUodTMyIGd1aWQsIGludCAqaW5kZXgs
IHUzMiAqb2Zmc2V0KSB7DQo+ICsJdTMyIHJlY29yZF9pZCA9IEZJRUxEX0dFVChHVUlEX1JFQ09S
RF9JRCwgZ3VpZCk7DQo+ICsJdTMyIGNhcF90eXBlICA9IEZJRUxEX0dFVChHVUlEX0NBUF9UWVBF
LCBndWlkKTsNCj4gKwl1MzIgZGV2aWNlX2lkID0gRklFTERfR0VUKEdVSURfREVWSUNFX0lELCBn
dWlkKTsNCj4gKw0KPiArCWlmIChkZXZpY2VfaWQgIT0gQk1HX0RFVklDRV9JRCkNCj4gKwkJcmV0
dXJuIC1FTk9ERVY7DQo+ICsNCj4gKwlpZiAocmVjb3JkX2lkID4gT09CTVNNXzEgfHwgY2FwX3R5
cGUgPiBXQVRDSEVSKQ0KPiArCQlyZXR1cm4gLUVJTlZBTDsNCj4gKw0KPiArCSpvZmZzZXQgPSAw
Ow0KPiArDQo+ICsJaWYgKGNhcF90eXBlID09IENSQVNITE9HKSB7DQo+ICsJCSppbmRleCA9IHJl
Y29yZF9pZCA9PSBQVU5JVCA/IDIgOiA0Ow0KPiArCQlyZXR1cm4gMDsNCj4gKwl9DQo+ICsNCj4g
Kwlzd2l0Y2ggKHJlY29yZF9pZCkgew0KPiArCWNhc2UgUFVOSVQ6DQo+ICsJCSppbmRleCA9IDA7
DQo+ICsJCWlmIChjYXBfdHlwZSA9PSBURUxFTUVUUlkpDQo+ICsJCQkqb2Zmc2V0ID0gUFVOSVRf
VEVMRU1FVFJZX09GRlNFVDsNCj4gKwkJZWxzZQ0KPiArCQkJKm9mZnNldCA9IFBVTklUX1dBVENI
RVJfT0ZGU0VUOw0KPiArCQlicmVhazsNCj4gKw0KPiArCWNhc2UgT09CTVNNXzA6DQo+ICsJCSpp
bmRleCA9IDE7DQo+ICsJCWlmIChjYXBfdHlwZSA9PSBXQVRDSEVSKQ0KPiArCQkJKm9mZnNldCA9
IE9PQk1TTV8wX1dBVENIRVJfT0ZGU0VUOw0KPiArCQlicmVhazsNCj4gKw0KPiArCWNhc2UgT09C
TVNNXzE6DQo+ICsJCSppbmRleCA9IDE7DQo+ICsJCWlmIChjYXBfdHlwZSA9PSBURUxFTUVUUlkp
DQo+ICsJCQkqb2Zmc2V0ID0gT09CTVNNXzFfVEVMRU1FVFJZX09GRlNFVDsNCj4gKwkJYnJlYWs7
DQo+ICsJfQ0KPiArDQo+ICsJcmV0dXJuIDA7DQo+ICt9DQo+ICsNCj4gK3N0YXRpYyBpbnQgeGVf
cG10X3RlbGVtX3JlYWQoc3RydWN0IHBjaV9kZXYgKnBkZXYsIHUzMiBndWlkLCB1NjQgKmRhdGEs
DQo+ICt1MzIgY291bnQpIHsNCj4gKwlzdHJ1Y3QgeGVfZGV2aWNlICp4ZSA9IHBkZXZfdG9feGVf
ZGV2aWNlKHBkZXYpOw0KPiArCXZvaWQgX19pb21lbSAqdGVsZW1fYWRkciA9IHhlLT5tbWlvLnJl
Z3MgKw0KPiBCTUdfVEVMRU1FVFJZX09GRlNFVDsNCj4gKwl1MzIgbWVtX3JlZ2lvbjsNCj4gKwl1
MzIgb2Zmc2V0Ow0KPiArCWludCByZXQ7DQo+ICsNCj4gKwlyZXQgPSBndWlkX2RlY29kZShndWlk
LCAmbWVtX3JlZ2lvbiwgJm9mZnNldCk7DQo+ICsJaWYgKHJldCkNCj4gKwkJcmV0dXJuIHJldDsN
Cj4gKw0KPiArCXRlbGVtX2FkZHIgKz0gb2Zmc2V0Ow0KPiArDQo+ICsJZ3VhcmQobXV0ZXgpKCZ4
ZS0+cG10LmxvY2spOw0KPiArDQo+ICsJLyogaW5kaWNhdGUgdGhhdCB3ZSBhcmUgbm90IGF0IGFu
IGFwcHJvcHJpYXRlIHBvd2VyIGxldmVsICovDQo+ICsJaWYgKCF4ZV9wbV9ydW50aW1lX2dldF9p
Zl9hY3RpdmUoeGUpKQ0KPiArCQlyZXR1cm4gLUVOT0RBVEE7DQo+ICsNCj4gKwkvKiBzZXQgU29D
IHJlLW1hcHBlciBpbmRleCByZWdpc3RlciBiYXNlZCBvbiBHVUlEIG1lbW9yeSByZWdpb24gKi8N
Cj4gKwl4ZV9tbWlvX3JtdzMyKHhlLT50aWxlc1swXS5wcmltYXJ5X2d0LCBTR19SRU1BUF9JTkRF
WDEsDQo+IFNHX1JFTUFQX0JJVFMsDQo+ICsJCSAgICAgIEZJRUxEX1BSRVAoU0dfUkVNQVBfQklU
UywgbWVtX3JlZ2lvbikpOw0KPiArDQo+ICsJbWVtY3B5X2Zyb21pbyhkYXRhLCB0ZWxlbV9hZGRy
LCBjb3VudCk7DQo+ICsJcmV0ID0gY291bnQ7DQo+ICsJeGVfcG1fcnVudGltZV9wdXQoeGUpOw0K
PiArDQo+ICsJcmV0dXJuIHJldDsNCj4gK30NCj4gKw0KPiArc3RydWN0IHBtdF9jYWxsYmFja3Mg
eGVfcG10X2NiID0gew0KPiArCS5yZWFkX3RlbGVtID0geGVfcG10X3RlbGVtX3JlYWQsDQo+ICt9
Ow0KPiArDQo+ICtzdGF0aWMgY29uc3QgaW50IHZzZWNfcGxhdGZvcm1zW10gPSB7DQo+ICsJW1hF
X0JBVFRMRU1BR0VdID0gWEVfVlNFQ19CTUcsDQo+ICt9Ow0KPiArDQo+ICtzdGF0aWMgZW51bSB4
ZV92c2VjIGdldF9wbGF0Zm9ybV9pbmZvKHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7DQo+ICsJaWYg
KHhlLT5pbmZvLnBsYXRmb3JtID4gWEVfQkFUVExFTUFHRSkNCj4gKwkJcmV0dXJuIFhFX1ZTRUNf
VU5LTk9XTjsNCj4gKw0KPiArCXJldHVybiB2c2VjX3BsYXRmb3Jtc1t4ZS0+aW5mby5wbGF0Zm9y
bV07DQo+ICt9DQo+ICsNCj4gKy8qKg0KPiArICogeGVfdnNlY19pbml0IC0gSW5pdGlhbGl6ZSBy
ZXNvdXJjZXMgYW5kIGFkZCBpbnRlbF92c2VjIGF1eGlsaWFyeQ0KPiArICogaW50ZXJmYWNlDQo+
ICsgKiBAeGU6IHZhbGlkIHhlIGluc3RhbmNlDQo+ICsgKi8NCj4gK3ZvaWQgeGVfdnNlY19pbml0
KHN0cnVjdCB4ZV9kZXZpY2UgKnhlKSB7DQo+ICsJc3RydWN0IGludGVsX3ZzZWNfcGxhdGZvcm1f
aW5mbyAqaW5mbzsNCj4gKwlzdHJ1Y3QgZGV2aWNlICpkZXYgPSB4ZS0+ZHJtLmRldjsNCj4gKwlz
dHJ1Y3QgcGNpX2RldiAqcGRldiA9IHRvX3BjaV9kZXYoZGV2KTsNCj4gKwllbnVtIHhlX3ZzZWMg
cGxhdGZvcm07DQo+ICsNCj4gKwlwbGF0Zm9ybSA9IGdldF9wbGF0Zm9ybV9pbmZvKHhlKTsNCj4g
KwlpZiAocGxhdGZvcm0gPT0gWEVfVlNFQ19VTktOT1dOKQ0KPiArCQlyZXR1cm47DQo+ICsNCj4g
KwlpbmZvID0gJnhlX3ZzZWNfaW5mb1twbGF0Zm9ybV07DQo+ICsJaWYgKCFpbmZvLT5oZWFkZXJz
KQ0KPiArCQlyZXR1cm47DQo+ICsNCj4gKwlzd2l0Y2ggKHBsYXRmb3JtKSB7DQo+ICsJY2FzZSBY
RV9WU0VDX0JNRzoNCj4gKwkJaW5mby0+cHJpdl9kYXRhID0gJnhlX3BtdF9jYjsNCj4gKwkJYnJl
YWs7DQo+ICsJZGVmYXVsdDoNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiArDQo+ICsJLyoNCj4gKwkg
KiBSZWdpc3RlciBhIFZTRUMuIENsZWFudXAgaXMgaGFuZGxlZCB1c2luZyBkZXZpY2UgbWFuYWdl
ZA0KPiArCSAqIHJlc291cmNlcy4NCj4gKwkgKi8NCj4gKwlpbnRlbF92c2VjX3JlZ2lzdGVyKHBk
ZXYsIGluZm8pOw0KPiArfQ0KPiArTU9EVUxFX0lNUE9SVF9OUyhJTlRFTF9WU0VDKTsNCj4gZGlm
ZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92c2VjLmggYi9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfdnNlYy5oDQo+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0IGluZGV4IDAwMDAwMDAwMDAwMC4u
M2ZkMjlhMjFjYWQ2DQo+IC0tLSAvZGV2L251bGwNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hl
L3hlX3ZzZWMuaA0KPiBAQCAtMCwwICsxLDEzIEBADQo+ICsvKiBTUERYLUxpY2Vuc2UtSWRlbnRp
ZmllcjogR1BMLTIuMCAqLw0KPiArLyoNCj4gKyAqIENvcHlyaWdodCDCqSAyMDIyIC0gMjAyNCBJ
bnRlbCBDb3Jwb3JhdGlvbiAgKi8NCj4gKw0KPiArI2lmbmRlZiBfWEVfVlNFQ19IXw0KPiArI2Rl
ZmluZSBfWEVfVlNFQ19IXw0KPiArDQo+ICtzdHJ1Y3QgeGVfZGV2aWNlOw0KPiArDQo+ICt2b2lk
IHhlX3ZzZWNfaW5pdChzdHJ1Y3QgeGVfZGV2aWNlICp4ZSk7DQo+ICsNCj4gKyNlbmRpZg0KPiAt
LQ0KPiAyLjQ0LjANCg0K

