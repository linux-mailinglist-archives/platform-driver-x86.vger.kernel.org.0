Return-Path: <platform-driver-x86+bounces-10276-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ADE4A657B5
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Mar 2025 17:16:35 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id E1B1B3A8182
	for <lists+platform-driver-x86@lfdr.de>; Mon, 17 Mar 2025 16:16:21 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DCF17191F6A;
	Mon, 17 Mar 2025 16:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="rKb5DeEB"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2043.outbound.protection.outlook.com [40.107.243.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0342917A306
	for <platform-driver-x86@vger.kernel.org>; Mon, 17 Mar 2025 16:16:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742228189; cv=fail; b=C4mww0Wf2RiJTef8pZ64oE+MdXJ/Doay+ZBozxHRrZFSI+Nb230XgycTbPrqDePmQ1O2YVJGe3U+PYky+Y59dO063Lq+L1g96kRdrnRd7PY84GJqBRihqBpUb2oGRd4Cb1gGSPShizO/9ahcuMy2SjAEJYAc56Gv59OSU/Q570k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742228189; c=relaxed/simple;
	bh=CykLJGbhkyC0f9/4SB8xfeFyemdjIzi3z7+DMoKkv0Y=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Olp8pj02IZNhfbbAGDW+FJFsiu69ld5hDDGX9bxFX3YVZwzTynY4Bo79Sthyztb6XglMj/9yZgSgHPm93cwEQ3i4tPk4IQ3PX95PGP0qXDcyMcW0cbJbeOxcmZsE76lQLO1ZG+SFhIDoWcmAIU8ULqELkADcsy9ccBOM7ehS/Rw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=rKb5DeEB; arc=fail smtp.client-ip=40.107.243.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BEYH72h7Gsk8HBnNfIHZy4+zonAcP6zK9Jrbh6XbcYtL7NAW8txNte9ldnF36TYUdAuQBpgxccHgShbDKpgMIdeHOcyTvir8/1RHSyk8QNCKVc1Fltn3c4TQ5QDoZtG9n58Lc40chFDeTaWUcsjrRXpqZNmx3nAMQQG/Bo15lzud1aSmb1MYNt2O62v5lsDbQYifrVpnT1P6m3t7h5mzMUMW6qpJ8+DB5hl73+i54sBI8Oewh0Zv5kOWO1L9f/lquX4MLf03cwSZ+gQaViIVGQODhbaUaHIzQkYGPK3qzY+4Cdj/Nv374d71PKvtMcQ3kcn0NBEYdlK1PXKr+S+HqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CykLJGbhkyC0f9/4SB8xfeFyemdjIzi3z7+DMoKkv0Y=;
 b=m7EQUIoxEcv2gj5XY9JeeXSPRUFjC0lkjLIzfsld6iZ8a24hOPl6Pu/eTB6CEtd2PYQHW02TX0MG3etRTPjfcNd3X4hIe/GmWh0xeqNICRw9c9ykhPMljZyLF+QUkAztqvvREKj+DJSx2FZc1n7FpxHMWa1W4MM3mE/A60OTh9FpTokV9J+1ZgzznoiTKsX5MG8MsanOifJjG9EDmD6+gShUxwIdlyJC+6k/M9xViv6CsZPU7QHwc+p59e+MnIT78XzDvBUj/66eE4zuZ3QiPZnn1Y+j38BiyIsscbqa2ElC2uNkd63HA5wNlx1LSN+MT8Db+iR34BpB3J8LJ5p46w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CykLJGbhkyC0f9/4SB8xfeFyemdjIzi3z7+DMoKkv0Y=;
 b=rKb5DeEBhoQAoL1jJbW0EvvYiW49dDlIlfCDADPv8Z1HZX5zMBgHG3axKIb46jssHQOv1aFvkE4jfmocOTG3hav0Vfzm8vhsP8/pKA8HOSWNrohHq8HI4wRwSiP3qD+WDIim5+ahvHFJvg4nlNdV54XzL7bXExcgvRCZdbsdU6+FQdiDU444DwmQ+QY4qijBHKRp6ZNIhAlZKJgwg/sOze/ZKBM1RP4iAbLFc55rIietCFoX+QR7hAXVodEi8VplVsGokiqesoURkoEeoPdq0vDxMQOwA78/JCHETf9FWAG8yOGv5Rw6L7WzvTjjV5GFSlC8Zjo8N4S3xDBe/B3KPg==
Received: from PH7PR12MB6668.namprd12.prod.outlook.com (2603:10b6:510:1aa::12)
 by DS0PR12MB7928.namprd12.prod.outlook.com (2603:10b6:8:14c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8534.33; Mon, 17 Mar
 2025 16:16:24 +0000
Received: from PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6]) by PH7PR12MB6668.namprd12.prod.outlook.com
 ([fe80::6d5b:2553:adc8:b6a6%7]) with mapi id 15.20.8534.031; Mon, 17 Mar 2025
 16:16:24 +0000
From: Vadim Pasternak <vadimp@nvidia.com>
To: =?utf-8?B?SWxwbyBKw6RydmluZW4=?= <ilpo.jarvinen@linux.intel.com>
CC: Hans de Goede <hdegoede@redhat.com>, Michael Shych <michaelsh@nvidia.com>,
	Ciju Rajan K <crajank@nvidia.com>, Felix Radensky <fradensky@nvidia.com>,
	Oleksandr Shamray <oleksandrs@nvidia.com>,
	"platform-driver-x86@vger.kernel.org" <platform-driver-x86@vger.kernel.org>
Subject: RE: [PATCH v6 2/9] platform/mellanox mlxreg-hotplug: Add support for
 new flavor of capability registers
Thread-Topic: [PATCH v6 2/9] platform/mellanox mlxreg-hotplug: Add support for
 new flavor of capability registers
Thread-Index: AQHbfGYhMPAtLy7neUu6wXlpUv/CjLNjGQiAgAIRDrA=
Date: Mon, 17 Mar 2025 16:16:24 +0000
Message-ID:
 <PH7PR12MB6668F2222BF6B37D826A6A55AFDF2@PH7PR12MB6668.namprd12.prod.outlook.com>
References: <20250211091912.36787-1-vadimp@nvidia.com>
 <20250211091912.36787-3-vadimp@nvidia.com>
 <ba50e0b6-dbb5-4444-e291-0259b23f64ab@linux.intel.com>
In-Reply-To: <ba50e0b6-dbb5-4444-e291-0259b23f64ab@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB6668:EE_|DS0PR12MB7928:EE_
x-ms-office365-filtering-correlation-id: b3a57ffd-b4fa-4f8d-28dd-08dd656f102b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?Z3d2VVdIWUgzcGNFV0lldjhWSUxIaHhaVldwQ1REYmtQTFRaR096bkEySzAv?=
 =?utf-8?B?V2YyakRqUy9zRHd1QmMyY2RjRjh4WHdYRTVmZStsL2JlcHJva1ZEUnN1ZEc5?=
 =?utf-8?B?bDUvdmNhRUdBTDI3bjdxcGVQU2NyWEwyWGpQUGdEVjJDTEJ0UXpQeTl0ZytH?=
 =?utf-8?B?ekpmREJlSHA4aXNna1lFblVuREx5WEE0bm81dXFHaS9DQ0krSXdKZndmUlJu?=
 =?utf-8?B?S0ZOaUYvWXRzWnhQNEMzbVU1dGFQeXRMNTVNLzZmNkhRWjZLUHNjS0V5WEFV?=
 =?utf-8?B?T09RL2c3UmlhMDVSYTJwdDJSa3VjVlNyKytPSUZSSW5vdHdPSGNUTFhualJv?=
 =?utf-8?B?NFRRWkZkelZMczd3djdraHJHZ1pVdEEvZENEZkdtMml5ekpFL0pkeG1yT3pL?=
 =?utf-8?B?SWhHc3N5TDluSm5mazhZYmdXNG5jbGNVZDMyZEorWGFlUUtRUXlwRHNkU0pa?=
 =?utf-8?B?dlJzUlhqckxOa3Y1ZU5pa1JwM0F0YVBXalBwaExJRzhoTmdMdXN4eXlRK0ZU?=
 =?utf-8?B?eGUyQWZOMlRybkE5cWM1bktzdGNMRXhyNUdqWU85bWRyUlMzS2Z4bWhNUnFi?=
 =?utf-8?B?QlYxTFVyc1pWckFhQ1dRN0tmdG5Kdjh4c0hTS2M4VCtnMlV3ajB2Z1BBeHFt?=
 =?utf-8?B?enJ0QkhFTklyK3ZlVDAvUTBxcmtsdXdsVFZWVmpPcEQ2dktkZ3IxSkU4NW13?=
 =?utf-8?B?c0hObkJjMUd0dzQxdDNtZk5KMm50MjlDK3NlLy9lcURoV2pLOVZFU01HWGNH?=
 =?utf-8?B?bEtRYndrZVRwLy9JQUVTSGk1NHRNUzBlNU5seGFWNFB0NVYxREFJeFo3cSs3?=
 =?utf-8?B?cnVwY0k2WXZYUXFJTXVZTU42R3ZtZzRmeTNEY3lWbEhhaVhQV2RLRGJVRkR0?=
 =?utf-8?B?M3JqV1BSK1Y5Z3NadGo4TG1zdWpxTkhKMk9Hd3RlN1VzbXRxQm5pUXB3cXZZ?=
 =?utf-8?B?WEZwcDN5Q0lGRHBaR2lNb1NBbUY2TTRoRFhBRlE1UURjb004aDFneUY0SHdr?=
 =?utf-8?B?cjIwUGNidDdlblFScWloSHlmK1luZDJpUk0yeEtZSmVWdnMrYnd1cjFORlly?=
 =?utf-8?B?L2IrTUdVcWdlcHNjK3NtZmFvZ2RxYTRkbVVYejVDUGNlL0xXaUJXZHhsTUtE?=
 =?utf-8?B?UHNLeGxlRThkVnhFRGlaRGk5MExjUWhKOXF3NFBHSUZ0ZzVMa1dOM0tyWDFB?=
 =?utf-8?B?QmhPcHdNL0lpQUhoWURFUFQzT2NOekRuSG9zbXp3cndLeTRwakdrNXBkUzFR?=
 =?utf-8?B?QVhUdkNqL0xUNjZybWZjWXhYYTJFSCs2LzFGMDg3Y29odG1SWWhFM2VkSm8y?=
 =?utf-8?B?WFROZmkvbTUxQjBFSHI1M09samc4bXROckQvVzUrL21DRGRXeEZ2Rk5QcGhL?=
 =?utf-8?B?b2ozYnlqZXZqa3p2WU9TYjlVQWZ0ZDE4MjhtaG1OZTlGdm52cE5abjRyZUpz?=
 =?utf-8?B?SU9sYjJWd3NPWU1aMUpCaEZBNlRTSUh0cmltMzg1RXlGdDRyQkk3S1o3NUdY?=
 =?utf-8?B?K081SjFERlJMUjk2Q1oyZVNqajMvbThlN1ZXVGF1NnkvaG1lcDJ6UEtudEwx?=
 =?utf-8?B?MnFDOVN5cThxUTZFWnFrZXAwdGhPbEpvc2FRYk56MzRKT2d5eExMLzZnY0Z2?=
 =?utf-8?B?MlBYQkx2MmNXdzlsN3lObkNkTWVtcmZlWUxKOFh2eTlkMldSRzdHYUVjWkpj?=
 =?utf-8?B?NjVlSnF6QlhZNTFtK09OcjBCNm5vYW9PY3pDNDRZSnlBcitGNmRKcVI4bkNv?=
 =?utf-8?B?WE9pYS82aEVtYlRyNFhVVnZkd2FpOU9tMkd3SnRZT2llaVdyZ3pyQ0hvTlBJ?=
 =?utf-8?B?eVdOWFhWeXFSNE5nTTd2NXNhZFBpTkdXWk9tWEx3U214eVFERjNmNVh0ZTF3?=
 =?utf-8?B?UDFqRUlYVThhbzZXNlJEMXJMR2dMeUtDelgxWnhSK0dFTnRFdDZoNm8rSTVX?=
 =?utf-8?Q?5zeUwIEfQ2fRPNVYvIhRdJwEk1c1dkB+?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH7PR12MB6668.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?eWJsNFFnQ0ZqTkhWYTVQQUFwWmFlWmVEK2tDWkY5YXVMbHlkTjZtY1JiTnRM?=
 =?utf-8?B?WTI2bDZlVEVxLzJDMjNRaWZjRVlNZTZ4eFZ4ZFkyU2tRaG96SVBOZ1h3SkFP?=
 =?utf-8?B?aE1VOGV5OTZOWHIxcXBRTUZHaUlMNlVLNHZrZFMzT2RNQmlObUh2TGljN0Fi?=
 =?utf-8?B?ZnZEc0ZaTFdCbjAzWCtxUzJyVWxTS1lsSjBMM01ubldpb2E3Mmttb2plZWQ3?=
 =?utf-8?B?NTNOc0J5c0o2ZmJqeUk0cGJkZkgvVUlLQy93N3F2ckJTekFCL05ZaXhjTFN3?=
 =?utf-8?B?Z3FmeDlwcVp3R25CaHpuMnZpQzMremdOS2kycHpPQnRFTmROQTdCZXorVUNU?=
 =?utf-8?B?YjdVSHV0a2VoRzF6NkNlUUFScnlVMWYrdnRaSjU4WFNiRDI1WUJ3WitteVBm?=
 =?utf-8?B?RytmS20zOE5nUWFjSjJIUWtWVmphZmxLNkY0VVBna2pOWm9DNkZzUmNBNGxh?=
 =?utf-8?B?OHlCcWVHY0NwdUxsNkQ5clBCRjluVURwbzJXajJ6Nm9BY3MzaUNJTUNNeXV0?=
 =?utf-8?B?dVhMU3Ircm5OWWdQWTdrZHlFaXpTdC9NYWhXTmU3OXVZUVdMZTc0b0E1eTly?=
 =?utf-8?B?Z0lTOWhjQXg0dGY2V2p3eHRnU2l0SUJpUUFuV2xWYmMvbEMyQllnTS9GOW4v?=
 =?utf-8?B?V0cxbVZtbE9aWGptNDkvUXAxdytjNU93eDZUTS9DS292aDNBbHhaSHgyRCsw?=
 =?utf-8?B?SjIzQ3g0MmlRbW0rS2praHJJckdzREtGVDB4bkd5SWxrMDVGZEt0Q0ZGKzdS?=
 =?utf-8?B?NWhScGErVTJJNDB0WnQxSVRFWWxselZUaml1SDZ3ZERZUEk3ci9BQUtXdktZ?=
 =?utf-8?B?TnhoTmY1Vm5CRGVSakpmZEF6NFBqRXBSZGIraVc2SjlGYkc3cURPMEJEUzRV?=
 =?utf-8?B?aHJRV1VJaElRSmxSdXB5TlJVZ1RpNjNmdUFLdi9pckFnN2ZzUk05S053UEFl?=
 =?utf-8?B?N3VHNU9sLzJnQWN0eVJKYnFIenpNZ2dVUUpreTJLNmZJek1XekRKVFVRNGh1?=
 =?utf-8?B?b0ExVkcyWjV4UFQ1UktVUUR3c3Z0OXI2YTFLYStvYUhHdHB6UXBXbWdXNkZ5?=
 =?utf-8?B?eWxReGdObnBSVjFCeGJOTWcxZUtETndNUk9GSUhXZDJMN3FFc05KZHJVSndY?=
 =?utf-8?B?eE9nYmZNOGtobERaR0ZUNVI2enp6Ulc4aks4TWtRQ0JYME4zOE8vY2FpcVJT?=
 =?utf-8?B?aTRCRWx4Rm9Dd2FWLzZ2TGlEbXd0dVNjZ3M2d0ZhbXNhYnhIQWZtQW85RlF5?=
 =?utf-8?B?djlQMFRlQTZoc05MTzAxVzNuNjVqMXlZZkRBUXJ0K040bUxYd2lVOXduaVgx?=
 =?utf-8?B?TFlZS2xJdlc3ZDBWNzNFNlFIaUYvVGVrdTJ2cUtvV0FIQWJpdUNJWUx1OE5l?=
 =?utf-8?B?SldBVEQxMGVqaHJsR0d2dk9WYktGOVNFa2tGMHIxc1ZHTkwzREcvcEpNNnc1?=
 =?utf-8?B?bzBQMWVOSWtsVGkyMUJnZ25IeUI5SzR1VENUMk5rbTRhb25LSFpDaU1BSWNn?=
 =?utf-8?B?NEsydVRyVzBvTjFWNmNpVy9tOElra0NrcWFoUFdGY01GQThHWm94L25ZVk5Y?=
 =?utf-8?B?SGJDWExiRFRvWFRYNk0zVlpCWXZlVllONkJYdWI3amVuR2JpZGRJdGNTdThy?=
 =?utf-8?B?VXJMS0JoK01rZEV0eFg4bGpmcCszVGJGcVZSYWxGbVd6ZzFiNkI5bnJrY0s1?=
 =?utf-8?B?NjZUeXM1cFVQalFWUVJBc0JETTJNcWFWd3RmRFY2dWFZRU1ZbGdjaVo0Um1Y?=
 =?utf-8?B?SFgzMHBUZi85dTFicjV0ay9YTzRLVVppTkdOV1ZzRytJZ2d6dHNXMDlPSTN0?=
 =?utf-8?B?clozTENWR01MdUR0cHdlcXltWnc0ZEhiZ1E2dXlCTnFyUndLZlBJRTVncjdu?=
 =?utf-8?B?ZUpXajJydzhXYksrNklTb1p4T0VvL0FJMlo4VWdydEhKZ3N2dzFncEZQYk8y?=
 =?utf-8?B?dytmLzdkWGVGMnJib1hsL0FLbTR3MlpnZFJUbFZ6ZHJENjBDYm8rcXRjbjRY?=
 =?utf-8?B?eDFKbC9TRTdJSnh4VkpsOU5FMUlBbG0yQ0JDYldpSmF3SHhzOW5FYWNkZEpN?=
 =?utf-8?B?WnI0VnJJOGpaZXZwYTBzVWRYcXpOMXArdWMvaTExL21YNThXNTlpRzBIVWZy?=
 =?utf-8?Q?xn2nxSPKPL2hEdKxXRCyIpOpn?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB6668.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3a57ffd-b4fa-4f8d-28dd-08dd656f102b
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Mar 2025 16:16:24.3383
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 518OKW5l0XcYDF3DO2AUDNbtCguFCIXBFYxqzW6dZbRvze/4quyprB5zup14giOGg727y2epYVHEZucWDyUvNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7928

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogSWxwbyBKw6RydmluZW4g
PGlscG8uamFydmluZW5AbGludXguaW50ZWwuY29tPg0KPiBTZW50OiBUdWVzZGF5LCA0IE1hcmNo
IDIwMjUgMTU6MjYNCj4gVG86IFZhZGltIFBhc3Rlcm5hayA8dmFkaW1wQG52aWRpYS5jb20+DQo+
IENjOiBIYW5zIGRlIEdvZWRlIDxoZGVnb2VkZUByZWRoYXQuY29tPjsgTWljaGFlbCBTaHljaA0K
PiA8bWljaGFlbHNoQG52aWRpYS5jb20+OyBDaWp1IFJhamFuIEsgPGNyYWphbmtAbnZpZGlhLmNv
bT47IEZlbGl4DQo+IFJhZGVuc2t5IDxmcmFkZW5za3lAbnZpZGlhLmNvbT47IE9sZWtzYW5kciBT
aGFtcmF5DQo+IDxvbGVrc2FuZHJzQG52aWRpYS5jb20+OyBwbGF0Zm9ybS1kcml2ZXIteDg2QHZn
ZXIua2VybmVsLm9yZw0KPiBTdWJqZWN0OiBSZTogW1BBVENIIHY2IDIvOV0gcGxhdGZvcm0vbWVs
bGFub3ggbWx4cmVnLWhvdHBsdWc6IEFkZCBzdXBwb3J0DQo+IGZvciBuZXcgZmxhdm9yIG9mIGNh
cGFiaWxpdHkgcmVnaXN0ZXJzDQo+IA0KPiBPbiBUdWUsIDExIEZlYiAyMDI1LCBWYWRpbSBQYXN0
ZXJuYWsgd3JvdGU6DQo+IA0KPiBIaSBWYWRpbSwNCj4gDQo+ID4gSG90cGx1ZyBwbGF0Zm9ybSBk
YXRhIGlzIGNvbW1vbiBhY3Jvc3MgdGhlIHZhcmlvdXMgc3lzdGVtcywgd2hpbGUNCj4gPiBob3Rw
bHVnIGRyaXZlciBzaG91bGQgYmUgYWJsZSB0byBjb25maWd1cmUgb25seSB0aGUgaW5zdGFuY2Vz
IHJlbGV2YW50DQo+ID4gdG8gc3BlY2lmaWMgc3lzdGVtLg0KPiA+DQo+ID4gRm9yIGV4YW1wbGUs
IHBsYXRmb3JtIGhvcHRwbHVnIGRhdGEgbWlnaHQgY29udGFpbiBkZXNjcmlwdGlvbnMgZm9yDQo+
ID4gZmFuMSwNCj4gDQo+IGhvdHBsdWcNCj4gDQo+ID4gZmFuMiwgLi4uLCBmYW57bn0sIHdoaWxl
IHNvbWUgc3lzdGVtcyBlcXVpcHBlZCB3aXRoIGFsbCAnbicgZmFucywNCj4gPiBvdGhlcnMgd2l0
aCBsZXNzLiBTYW1lIGZvciBwb3dlciB1bml0cywgcG93ZXIgY29udHJvbGxlcnMsIEFTSUNzIGFu
ZA0KPiA+IHNvIG9uLg0KPiA+DQo+ID4gTmV3ICdjYXBhYmlsaXR5X21hc2snIGlzIGludHJvZHVj
ZWQgdG8gYWxsb3cgc2hhcmluZyBvZiBzYW1lIGhvcHRwbHVnDQo+ID4gc3RydWN0dXJlIGJldHdl
ZW4gZGlmZmVyZW50IHN5c3RlbXMsIGVxdWlwcGVkIHdpdGggZGlmZmVyZW50IG51bWJlciBvZg0K
PiA+IGhvdHBsdWcgZGV2aWNlcy4gSXQgY29udGFpbnMgc3VwZXJzZXQgbWFzayBmb3IgYWxsIHN5
c3RlbXMgc2hhcmluZyB0aGUNCj4gPiBzYW1lIGNvbmZpZ3VyYXRpb24uDQo+ID4NCj4gPiBUaGUg
cHVycG9zZSBpcyB0byByZWR1Y2UgdW5uZWNlc3NhcnkgZHVwbGljYXRpb24gb2YgaG9wdHBsdWcN
Cj4gPiBzdHJ1Y3R1cmVzDQo+IA0KPiBob3RwbHVnDQo+IA0KPiA+IGJldHdlZW4gZGlmZmVyZW50
IHN5c3RlbXMgLSBzYW1lIHN0cnVjdHVyZSBpcyB0byBiZSB1c2VkIGZvciBleGFtcGxlDQo+ID4g
Zm9yIHN5c3RlbSBlcXVpcHBlZCBmaXIgZm9yIDQsIDYgb3IgOCBmYW5zLg0KPiA+DQo+ID4gRm9y
IGRldGVjdGlvbiBvZiB0aGUgcmVhbCBudW1iZXIgb2YgZXF1aXBwZWQgZGV2aWNlcyBjYXBhYmls
aXR5DQo+ID4gcmVnaXN0ZXJzIGFyZSB1c2VkLiBUaGVzZSByZWdpc3RlcnMgdXNlZCB0byBpbmRp
Y2F0ZSBwcmVzZW5jZSBvZg0KPiA+IGhvdHBsdWcgZGV2aWNlcy4gT24gc29tZSBzeXN0ZW1zIHBy
ZXNlbmNlIGlzIHBvcnZpZGVkIHRocm91Z2ggdGhlDQo+IA0KPiBwcm92aWRlZA0KPiANCj4gPiBi
aXRtYXAuIEZvciBzb21lIG5ldyBiaWcgbW9kdWxhciBzeXN0ZW1zLCB0aGVzZSByZWdpc3RlcnMg
d2lsbCBwcm92aWRlDQo+ID4gcHJlc2VuY2UgYnkgY291bnRlcnMuIFVzZSBzbG90IHBhcmFtZXRl
ciB0byBkZXRlcm1pbmUgd2hldGhlcg0KPiA+IGNhcGFiaWxpdHkgcmVnaXN0ZXIgY29udGFpbnMg
Yml0bWFzayBvciBjb3VudGVyLg0KPiA+DQo+ID4gUmV2aWV3ZWQtYnk6IEZlbGl4IFJhZGVuc2t5
IDxmcmFkZW5za3lAbnZpZGlhLmNvbT4NCj4gPiBTaWduZWQtb2ZmLWJ5OiBWYWRpbSBQYXN0ZXJu
YWsgPHZhZGltcEBudmlkaWEuY29tPg0KPiA+IC0tLQ0KPiA+IHY1LT52Ng0KPiA+IFJldmlzZWQg
YWZ0ZXIgY29tbWVudHMgcG9pbnRlZCBvdXQgYnkgSWxwbzoNCj4gPiAtIERyb3AgJ2NhcGFiaWxp
dHlfYml0JyBmcm9tIHN0cnVjdHVyZSAnbWx4cmVnX2NvcmVfZGF0YScsIHNpbmNlIGl0IGlzDQo+
ID4gICBub3QgdXNlZC4NCj4gPiAtLS0NCj4gPiAgZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9t
bHhyZWctaG90cGx1Zy5jIHwgMjUNCj4gPiArKysrKysrKysrKysrKysrKysrKy0tDQo+ID4gIDEg
ZmlsZSBjaGFuZ2VkLCAyMyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiA+DQo+ID4g
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0vbWVsbGFub3gvbWx4cmVnLWhvdHBsdWcuYw0K
PiA+IGIvZHJpdmVycy9wbGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gaW5k
ZXggMGNlOWZmZjFmN2Q0Li45M2JkZDIwZmQ3MWEgMTAwNjQ0DQo+ID4gLS0tIGEvZHJpdmVycy9w
bGF0Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gKysrIGIvZHJpdmVycy9wbGF0
Zm9ybS9tZWxsYW5veC9tbHhyZWctaG90cGx1Zy5jDQo+ID4gQEAgLTI3NCw2ICsyNzQsMTYgQEAg
c3RhdGljIGludCBtbHhyZWdfaG90cGx1Z19hdHRyX2luaXQoc3RydWN0DQo+IG1seHJlZ19ob3Rw
bHVnX3ByaXZfZGF0YSAqcHJpdikNCj4gPiAgCQkJaWYgKHJldCkNCj4gPiAgCQkJCXJldHVybiBy
ZXQ7DQo+ID4NCj4gPiArCQkJaWYgKCFyZWd2YWwpDQo+ID4gKwkJCQljb250aW51ZTsNCj4gPiAr
DQo+ID4gKwkJCS8qDQo+ID4gKwkJCSAqIFJlbW92ZSBub24tcmVsZXZhbnQgYml0czogJ3JlZ3Zh
bCcgY29udGFpbnMNCj4gYml0bWFzayBvZiBhdHRyaWJ1dGVzIG9yDQo+ID4gKwkJCSAqIG51bWJl
ciBvZiBhdHRyaWJ1dHRlcywgd2hpY2ggc2hvdWxkIGJlIGhhbmRsZWQuDQo+IFdoaWxlICdjYXBh
YmlsaXR5IG1hc2snDQo+IA0KPiBhdHRyaWJ1dGVzDQo+IA0KPiA+ICsJCQkgKiBpcyBzdXBlcnNl
dCBtYXNrLg0KPiA+ICsJCQkgKi8NCj4gPiArCQkJaWYgKGl0ZW0tPmNhcGFiaWxpdHlfbWFzaykN
Cj4gPiArCQkJCXJlZ3ZhbCA9IChyZWd2YWwgJiBpdGVtLT5jYXBhYmlsaXR5X21hc2spOw0KPiA+
ICAJCQlpdGVtLT5tYXNrID0gR0VOTUFTSygocmVndmFsICYgaXRlbS0+bWFzaykgLSAxLA0KPiAw
KTsNCj4gDQo+IEkgc3RpbGwgZG9uJ3QgdW5kZXJzdGFuZCBob3cgdGhpcyBjYW4gYmUgY29ycmVj
dC4NCj4gDQo+IEFzIGEgbGFzdCBzdGVwLCB0aGUgY29kZSBoZXJlIGlzIHRha2luZyBHRU5NQVNL
KDxudW1fb2ZfYml0cz4tMSwgMCkgSQ0KPiBhc3N1bWUuIFRoYXQgd291bGQgbWVhbiByZWd2YWwg
aGFzIGEgZmllbGQgdGhhdCBpcyBpbmRpY2F0ZWQgYnkgaXRlbS0+bWFzaw0KPiB0aGF0IHRoZSBu
dW1iZXIgb2YgYml0cyAob3IgIm51bWJlciBvZiBhdHRyaWJ1dGVzIiBhcyBtZW50aW9uZWQgaW4g
dGhlDQo+IGNvbW1lbnQpLiBJcyB0aGF0IGNvcnJlY3Q/DQo+IA0KPiBOb3csIGluIHlvdXIgY29t
bWVudCBhbmQgdGhlIGNvbW1pdCBtZXNzYWdlLCB5b3UgYWxzbyBzYXkgJ3JlZ3ZhbCcNCj4gbWln
aHQgY29udGFpbiAiYml0bWFzayBvZiBhdHRyaWJ1dGVzJyBhbmQgeW91IG1hc2sgcGFydCBvZiB0
aGUgYml0cyBhd2F5DQo+IGZyb20gd2hhdCBJIGFzc3VtZSBpcyBhIGJpdG1hc2sgaW4gdGhlIG5l
d2x5IGludHJvZHVjZWQgY29kZS4gQSBiaXRtYXNrLA0KPiBob3dldmVyLCBpcyBub3Qgc29tZXRo
aW5nIHRoYXQgc2VlbXMgZGlyZWN0bHkgY29tcGF0aWJsZSB3aXRoIEdFTk1BU0soKQ0KPiB0aGF0
IGlucHV0cyBiaXQgX2luZGV4ZXNfLCBzbyBob3cgY2FuIHRoYXQgYmUgcGFzc2VkIGRpcmVjdGx5
IGludG8gR0VOTUFTSw0KPiB3aXRob3V0IGFueXRoaW5nIHRvIGNvbnZlcnQgaXQgaW50byBudW1i
ZXIgb2YgYml0cy9iaXQgaW5kZXggZmlyc3Q/Pz8NCg0KSGkgSWxwbyENCg0KQXBvbG9naXplIGZv
ciB0aGUgZGVsYXkuDQoNClNvcnJ5LCBJIHByb3ZpZGVkIG1pc2xlYWRpbmcgZGVzY3JpcHRpb24g
YW5kIGNvbW1lbnQuDQoNCkl0IGlzIHRydWUsIHRoYXQgY2FwYWJpbGl0eSByZWdpc3RlcnMgY2Fu
IGNvbnRhaW4gYml0bWFzayBvciBjb3VudC4NCkJ1dCBmb3IgJ2hvdHBsdWcnIGRyaXZlciwgd2hl
biAnY2FwYWJpbGl0eScgcmVnaXN0ZXIgaXMgc3BlY2lmaWVkIGluIGNvbmZpZ3VyYXRpb24gLSBp
dA0KaXMgYWx3YXlzIHRoZSBudW1iZXIgb2YgZWxlbWVudHMuDQoNCkZvciBleGFtcGxlLCAnY2Fw
YWJpbGl0eSdyZWdpc3RlciBpcyAyIGFuZCBpdGVtIG1hc2sgaXMgMTExMSAxMTExLg0KVGhlbg0K
CWl0ZW0tPm1hc2sgPSBHRU5NQVNLKChyZWd2YWwgJiBpdGVtLT5tYXNrKSAtIDEsIDApOyB3aWxs
IGJlIEdFTk1BU0soMSwgMCkNCklmICdjYXBhYmlsaXR5JyByZWdpc3RlciBpcyA2IGFuZCBpdGVt
IG1hc2sgaXMgMTExMSAxMTExLg0KCWl0ZW0tPm1hc2sgPSBHRU5NQVNLKChyZWd2YWwgJiBpdGVt
LT5tYXNrKSAtIDEsIDApOyB3aWxsIGJlIEdFTk1BU0soNSwgMCkNCg0KQWxsIHJlZ2lzdGVycyBh
cmUgb2YgOCBiaXRzIHNpemUuDQpWYWx1ZSBpbiBjYXBhYmlsaXR5IHJlZ2lzdGVyIGNhbiBiZSBm
LmUuIDEyIGZvciAxMiBlbGVtZW50cyAgKGZhbnMsIHBvd2VyIGNvbnRyb2xsZXJzIG9yIGFueXRo
aW5nIGVsc2UpLiANCkluIHN1Y2ggY2FzZSB0aGUgZmlyc3QgOCBlbGVtZW50cyB3aWxsIGJlIHBy
b3ZpZGVkIHRocm91Z2ggcmVnaXN0ZXIgIkEiLCA0IG90aGVycyB0aHJvdWdoIHRoZSByZWdpc3Rl
ciAiQiIuDQoNCkZvciBBIGl0ZW0tPm1hc2sgc2hvdWxkIGJlIHNldCAxMTExIDExMTEsIGZvciBC
IDAwMDAgMTExMS4NCg0KQWxvbmcgd2l0aCBpdCwgaW50ZW50aW9uIHRvIHVzZSBzYW1lIGNvZGUg
Zm9yIGV4YW1wbGUgdGhlcmUgYXJlIDE0IGVsZW1lbnRzIChBIDExMTEgMTExMSwgZm9yIEIgMDAx
MSAxMTExKQ0Kb3IgMTYgZWxlbWVudHMgKEEgMTExMSAxMTExLCBmb3IgQiAxMTExIDExMTEpDQoN
ClNvLCBpdGVtLT5tYXNrIHdpbGwgYmUgY29uZmlndXJlZCAweGZmIGZvciByZWdpc3RlciBBIGFu
ZCBmb3IgcmVnaXN0ZXIgQiBhbmQgdGhlbiB3aWxsIGJlIGN1dCBvZmYNCmFjY29yZGluZyB0byB0
aGUgdmFsdWUgb2YgJ2NhcGFiaWxpdHknIHJlZ2lzdGVyLg0KDQpQYXRjaCBhZGRzICdjYXBhYmls
aXR5X21hc2snIGFuZCB0cmVhdGVkIGl0IGFzOg0KCWlmIChpdGVtLT5jYXBhYmlsaXR5X21hc2sp
DQoJCXJlZ3ZhbCA9IChyZWd2YWwgJiBpdGVtLT5jYXBhYmlsaXR5X21hc2spOw0KDQpJdCBzZWVt
cyB0aGF0IHdlIG5lZWQgaGVyZSBqdXN0IHRvIGNoYW5nZQ0KCWl0ZW0tPm1hc2sgPSBHRU5NQVNL
KChyZWd2YWwgJiBpdGVtLT5tYXNrKSAtIDEsIDApOw0KdG8NCglpdGVtLT5tYXNrID0gR0VOTUFT
SygoKHJlZ3ZhbCAlIDgpICYgaXRlbS0+bWFzaykgLSAxLCAwKTsNCg0KQW5kIGRyb3AgaXRlbS0+
Y2FwYWJpbGl0eV9tYXNrLg0KDQo+IA0KPiAtLQ0KPiAgaS4NCj4gDQo+ID4gIAkJfQ0KPiA+DQo+
ID4gQEAgLTI5NCw3ICszMDQsMTggQEAgc3RhdGljIGludCBtbHhyZWdfaG90cGx1Z19hdHRyX2lu
aXQoc3RydWN0DQo+IG1seHJlZ19ob3RwbHVnX3ByaXZfZGF0YSAqcHJpdikNCj4gPiAgCQkJCWlm
IChyZXQpDQo+ID4gIAkJCQkJcmV0dXJuIHJldDsNCj4gPg0KPiA+IC0JCQkJaWYgKCEocmVndmFs
ICYgZGF0YS0+Yml0KSkgew0KPiA+ICsJCQkJaWYgKGRhdGEtPmNhcGFiaWxpdHlfbWFzaykNCj4g
PiArCQkJCQlyZWd2YWwgPSAocmVndmFsICYgZGF0YS0NCj4gPmNhcGFiaWxpdHlfbWFzayk7DQo+
ID4gKw0KPiA+ICsJCQkJLyoNCj4gPiArCQkJCSAqIEluIGNhc2Ugc2xvdCBmaWVsZCBpcyBwcm92
aWRlZCwgY2FwYWJpbGl0eQ0KPiByZWdpc3RlciBjb250YWlucw0KPiA+ICsJCQkJICogY291bnRl
ciwgb3RoZXJ3aXNlIGJpdG1hc2suIFNraXAgbm9uLQ0KPiByZWxldmFudCBlbnRyaWVzIGlmIHNs
b3QNCj4gPiArCQkJCSAqIGlzIHNldCBhbmQgZXhjZWVkcyBjb3VudGVyLiBPdGhld2lzZQ0KPiB2
YWxpZGF0ZSBlbnRyeSBieSBtYXRjaGluZw0KPiA+ICsJCQkJICogYml0bWFzay4NCj4gPiArCQkJ
CSAqLw0KPiA+ICsJCQkJaWYgKGRhdGEtPnNsb3QgPiByZWd2YWwpDQo+ID4gKwkJCQkJYnJlYWs7
DQo+ID4gKwkJCQlpZiAoIShyZWd2YWwgJiBkYXRhLT5iaXQpICYmICFkYXRhLT5zbG90KSB7DQo+
ID4gIAkJCQkJZGF0YSsrOw0KPiA+ICAJCQkJCWNvbnRpbnVlOw0KPiA+ICAJCQkJfQ0KPiA+IEBA
IC02MTEsNyArNjMyLDcgQEAgc3RhdGljIGludCBtbHhyZWdfaG90cGx1Z19zZXRfaXJxKHN0cnVj
dA0KPiBtbHhyZWdfaG90cGx1Z19wcml2X2RhdGEgKnByaXYpDQo+ID4gIAkJCQlpZiAocmV0KQ0K
PiA+ICAJCQkJCWdvdG8gb3V0Ow0KPiA+DQo+ID4gLQkJCQlpZiAoIShyZWd2YWwgJiBkYXRhLT5i
aXQpKQ0KPiA+ICsJCQkJaWYgKCEocmVndmFsICYgZGF0YS0+Yml0KSAmJiAhZGF0YS0+c2xvdCkN
Cj4gPiAgCQkJCQlpdGVtLT5tYXNrICY9IH5CSVQoaik7DQo+ID4gIAkJCX0NCj4gPiAgCQl9DQo+
ID4NCg==

