Return-Path: <platform-driver-x86+bounces-15018-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id AD7D3C16127
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Oct 2025 18:12:54 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id 2B5D44E69D6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 28 Oct 2025 17:12:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7D40334678A;
	Tue, 28 Oct 2025 17:12:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="E6oIYqre"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013052.outbound.protection.outlook.com [40.93.196.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77E0934A3D2
	for <platform-driver-x86@vger.kernel.org>; Tue, 28 Oct 2025 17:12:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761671538; cv=fail; b=b7e4kPn6uEYQQwKegGl1ntbxJ3GqdKLmw6zVDelmaCSDRjowwuw83DFZ7Mx/nk+ULvSoOcyakqEC0AHFPGmqzPuG4K97vy2wDyfPrvEAZNhEz7gUJrVioQTFUzMEksjEF/9ybJZ/Z/DQ+BCFfKswfyCzvhYbtBCSXGjbxhQMHXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761671538; c=relaxed/simple;
	bh=wi4imBqla72QYIFvavhMcoLD0kuSyDz0CXebAgeZUj0=;
	h=Content-Type:Message-ID:Date:Subject:To:Cc:References:From:
	 In-Reply-To:MIME-Version; b=HHyVkKYDJmloJjokQ77sh/ck+oc39ASVo5PoIbdjBDh2SShXS7XaVZas+c51hmfO4C0w/vK4Ls+ecWLZl+zNktGqzJc2ikMFKoHIj0DlZR6HHU3lj7/kkxbTKsLqulvC/BfjS8MYD+ck4RgGLjGbZG5SXYklR3YHIzsuhHIxuk0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=E6oIYqre; arc=fail smtp.client-ip=40.93.196.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uEeMWb0osldIqF+GmDU6BZCHWIp6JC0xukK2RwKh+VAzY0dykJM5lMBECLbeqDDi0ECl6hpIRkgIZNojKs+agtzOOmKMZ/0aAH4LF//EpA61foxlbGR7M+HeGgFSK6t11G8Z9VA0H69yNzUGiP1vEKUGQjbMN6ypZOjVJFTtIuFRLeTKEn+43hCeTVGpocXpjf4ye+q/sNP5BhQqF1jbtzcdrzEuqvtI1KSewPfhdNkmHu9wH+sTOkHiGGJYQaTyXf5wj6bEGubZu/UdPbF+Mu6giUI+/6S2i55VDVuUSYAjpT9O27mJh2qjTWMJEcjrMRXCTqGdltrcwja96lnU9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zHcUQXq2tuaSelJnN+gn8L2UV8CBV1K5/9v3ciEqt50=;
 b=Nu/v4bydKOrf1Pt9Dg2jOcbu7i5v/Q5n9W4bJVQ73zMQwYNZX5XurI0VaQ8LRBwo+zCg3TTrSham8klRjJaLip3ayHC8wFWFUJZkLxGGWa5ogJBJmv6VNhtuZ7SBPcWBC0nUbjkt2He9DXcPhPGYqwn/kP8z2dVLDq5afyHDX/43pbkXhFwtwj0NTwh9023GBwMiEkjPKwHVeg8OmglqilTQR+dbn1tFfOure8RS+G9Lkp3snEbK8bWe03SmUJf1OTLKhvNP6wgtVSLYBOlG2uImjqL8HT1QXvghEl4b9KN9noS7gOvcL8uYcUL1byjFLl6kA/VaP3r67IR8zF3CMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zHcUQXq2tuaSelJnN+gn8L2UV8CBV1K5/9v3ciEqt50=;
 b=E6oIYqreWJmKWPBoZjD496zKMJo3ldbpm7Xq4ITpKtI0AHUXe1abDxqwcPikoIJCFNEJoLeZiO6BqdTmTwHBnRXhZlZqRoU0zJsNZuWi9NqMy3uhsc1CWwhbVPJcsm1dNEQFDFN2jjbbRizf5WK01vWSoqqO9D7fp+eaVCyD38s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5176.namprd12.prod.outlook.com (2603:10b6:208:311::19)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.19; Tue, 28 Oct
 2025 17:12:12 +0000
Received: from BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4]) by BL1PR12MB5176.namprd12.prod.outlook.com
 ([fe80::ed5b:dd2f:995a:bcf4%6]) with mapi id 15.20.9275.013; Tue, 28 Oct 2025
 17:12:12 +0000
Content-Type: multipart/mixed; boundary="------------6aRVamsBn2NU0uMW8xXcLGkw"
Message-ID: <089b2cca-4c84-47b0-a96a-0363ffd642d7@amd.com>
Date: Tue, 28 Oct 2025 22:42:05 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: AMD PMF: CCP PSP fails to reinitialize after hibernation causing
 TEE errors
To: Lars Francke <lars.francke@gmail.com>,
 Mario Limonciello <superm1@kernel.org>
Cc: Tom Lendacky <thomas.lendacky@amd.com>, John Allen <john.allen@amd.com>,
 platform-driver-x86@vger.kernel.org, Patil Rajesh <Patil.Reddy@amd.com>
References: <CAD-Ua_gfJnQSo8ucS_7ZwzuhoBRJ14zXP7s8b-zX3ZcxcyWePw@mail.gmail.com>
 <92785bc4-e8e6-40b4-8ca6-43ef32c0b965@amd.com>
 <CAD-Ua_imV_eB3uYAbZV=AWaVMPMM4CpqzmYFDN7AvJs5q1yg_g@mail.gmail.com>
 <099ba5b9-600f-4604-94c4-781d4d91b091@amd.com>
 <84d6bd41-64ff-4380-ad87-54cfbb5bc1a0@gmail.com>
 <CAD-Ua_iHZtBJFXjBytXEhBwS9tJ79JUA7EB911hUZ0=OyoyLDQ@mail.gmail.com>
 <29af4c8f-e93b-49da-ad22-f5641f0046bb@kernel.org>
 <CAD-Ua_hYxHWa_rQWC6-2kMw4pXWt1fkdJT06AWeTZUbBFT-HDA@mail.gmail.com>
 <98d440b0-92b5-45aa-a42b-89dd5a243bae@kernel.org>
 <CAD-Ua_g+ifUOoJORoBiypgk3v4ynTjw=nvmoK6DJg2h-e7aXEQ@mail.gmail.com>
 <b6462189-5de6-4297-8d10-fce795c38ceb@amd.com>
 <2146bd06-a1ef-4668-ab34-f00172257424@kernel.org>
 <CAD-Ua_ixbf1ApMPMMSner28-fRg7BuhTu3QSw1U=ozqgS9fUjQ@mail.gmail.com>
 <6f81529b-7ae6-4d63-b0f3-7787a668698e@kernel.org>
 <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
Content-Language: en-US
From: Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
In-Reply-To: <CAD-Ua_hAxj5PskiFdiEA7Qt1bWEhKRvCNAyQj0BQmZ2vDnV4aQ@mail.gmail.com>
X-ClientProxiedBy: MA5P287CA0166.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::9) To BL1PR12MB5176.namprd12.prod.outlook.com
 (2603:10b6:208:311::19)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5176:EE_|SA3PR12MB9157:EE_
X-MS-Office365-Filtering-Correlation-Id: 261c6e1b-5530-43e1-00a1-08de164521f8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c0ZSREdrU3RDQm8rQXpwVUU4OGJrOXFPT0RXMHdRNzVKZk9LdFNPUUt4Znpk?=
 =?utf-8?B?a2JPOUpWamxzUllWMEFWMDE4S0s0WUl5OFZMUDFOay92ZnhaNFp6K2pkWGU0?=
 =?utf-8?B?NTFvOWxYTEt5Qk9JWlFlb2dWVjEyY01PQzdtaDZoR1dFSG4wdWo4VExmOGZV?=
 =?utf-8?B?bWk0Q08rNVczbzZCQUZXQTBuK05jaHNIdytKOGpvZkVPRVF6ZnhFcXdSdFh6?=
 =?utf-8?B?Tm1uUDRZblo0MldRQ0doM2ZmdklWTDU0Uk1jUUI0am5oWVBuWHdWNUFCaUtl?=
 =?utf-8?B?RCtMN2szOGxPU25XdUFLZEFjNGtSUDRTaWRlYjYxUktEeURSaytOdlhvWkhD?=
 =?utf-8?B?bi9jY2xUdG0vTWU2ZmJVVkNsRC9vbm0vbW01RERuay9hUWpZYk15NjRBckZ3?=
 =?utf-8?B?b05zemhyUlVGd1ZCMldFRGlLdndNYm5RSmQxRnd2L1A1S3NjWURCZStzbG91?=
 =?utf-8?B?b2J5MXh4elhvYXdJclNWYXZXWkk2Y0tKaFEyZnJIVmdtSlBWMm9GQ2pIUlpo?=
 =?utf-8?B?K3lJUDc0MkVDZzFOdnExOWI4dnU2d2lia0Y3U3ZCVEFNYXJLNXJpd3V3OCtY?=
 =?utf-8?B?NVZKUGpyazM3MVNDOExhM1Z4cVVjbGRTaVJnMkNyZHdTNExrN3FCaXY1ZnVw?=
 =?utf-8?B?UU1aMnVRNWRWbUViYUVtUm8wbFdHRDQ1eWRzMHN3RTE2QU5jblQvVElkTDlo?=
 =?utf-8?B?aGdEUnI1NUx2dlZHb3orMUZPNTErU2hpbEZxQXRFVUcxeGhERzBzdWVxUUw1?=
 =?utf-8?B?VmM5Z1JVUXRCSWpob01wQk14Ny9YSWYvTDBMNjBocy85Y2poemNaTmZKcWJn?=
 =?utf-8?B?Q2MvZTBKdVVTcndraDdiVDdNREE0WVZ5YWhRbzRLV3FCL2RIdHBpVHptdHZt?=
 =?utf-8?B?clk5SldsWVRzQmdlQ0dhQlhzaW0zWm1VZU5NdmdjTWIzMUhjUUt6eGoxTWZq?=
 =?utf-8?B?RTdveDB1UEVMaWwvMmdYVVFIOWpTTEZ3WGZid25iRHAyWXM1NnBlWS9RU095?=
 =?utf-8?B?SUI2VC9Dc3R1U1N3dDZvMG1EeXo0YnE1d2JRVGprTjhTd3hkODlLWnU4UGo4?=
 =?utf-8?B?Zk5ySytwdCtIVWpHTXJjVEhkWEZ4TGZQdUhVM01GQS91Q2R0ZW1XNE9BRmov?=
 =?utf-8?B?WlZ1RStKb1M0REt6Zm55Z3k2SExIY0YyM041ZlZ6NEZEeW1ESjJvaGxRd1ht?=
 =?utf-8?B?Z0tNdFplVUFlYS9SSEhyeTFTUXNNWVlSclNGNE1iR2ZMYjVhZVloTFBnblVT?=
 =?utf-8?B?UTNQVi9nUEpmbWZaOW9WVE5NWUZnYVEzZTJOY3RnQUFuQTBBQXRmR2ZmTXEz?=
 =?utf-8?B?dTZBNUxZd2VhaHBVQ0N4L2dnaVJaMXR5bkZrcDA3ZjVBQ3NOeWNVYjNOWS9y?=
 =?utf-8?B?L2t3VHFSUGdabko2ZSsvbzBQVUdEVmp1SXBIOFd1QUhYN2pnVjhKdVYxY3pO?=
 =?utf-8?B?MnFlYzJmaE5ZblFPeFkxUnZtc0NZVklzQUs4NlZ0U1phUmZvM2YyOGpDd0o1?=
 =?utf-8?B?dUwyeUF2UTdZSHVma2RwQnd5RVVHd0RNc1VjZ0xXcDBEOVh2RWE5Yy8vODgx?=
 =?utf-8?B?ZUFFU1h2blZBYkt4bXZmRUNhanpKdkZ4ejRGRGErK1FISVp0WHUrYmM1cmZC?=
 =?utf-8?B?MTVFU2lzTUcwNW41WDJLa2N1M0RyYlNxdEVSSnpoVkkxRldxOHZweXN5U1Fp?=
 =?utf-8?B?MUo3U1Vic2V0dm96M2xkYUJISzIxS0pXbG1lYzVMUWFuQzA5cVgyTVlPamdF?=
 =?utf-8?B?bm82aGlXc3lWQTNyeEtuczZveXE5Z3JqOGRManZGODNESzNMOGJyRWc2djhS?=
 =?utf-8?B?R25Td0hyMHdUK25yQkJLT3BQS0hDVGg2eGw2ZEdKNTdRQ2NtZFJES2d0WWI4?=
 =?utf-8?B?Qml6T2ZjVlRKWmJMQ1RWZG5EUjIrMVNzREp6clQ0U2FnaWVDSjNZRldHQ1lU?=
 =?utf-8?B?QUM2SmNnRHFXYllmeW00cVpERFhkVVd1VkRwMzg5WWpHai9raVNMRUZya0hY?=
 =?utf-8?B?TERmdzBMcmZRPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5176.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHhxTEZuSHdRWVU3NkYxd3RUTnlWb3dybG9RRjJlejd6VElNN2NwdHBqcGNZ?=
 =?utf-8?B?WU1BR0drK245MnJXT25ISk1ISXFPSDB6WFBTQjBDZHg2L1dQbmZiaXdVaFY4?=
 =?utf-8?B?dlIzRFVJTldWeXVhUys1bmVxejRlM01WL1IxSERTRXdTSngvL1ZVMWprU2F6?=
 =?utf-8?B?RCtVdVFlT0ROTndHVVU4RTNqaWtWbk1ma0g5cGRWZnNNc3ROMGhCb2NOM1Zw?=
 =?utf-8?B?M0lva05vUitlNXgzcnZocDVrNUFxRTB4U1R2TzVOc3c0WWwyZGdoSWlTM1Rv?=
 =?utf-8?B?bXN3cUtLUjYyZmpaR0NyYzJEeldmTWNxK2pEeENUS3p1Vlp3RHh3dzFDRE5a?=
 =?utf-8?B?aG5qL1crclNjVTdzQ3JEVkF0MzZUUEFLL0ZjaDU4Sk0xT25kRzZKaTg4UkF0?=
 =?utf-8?B?RWU5RURGcFNIaER6VHdxbnF1eTBlYU1zYzk5elA4aEpnenNYWmF1a2c5d2h2?=
 =?utf-8?B?NGxwMGlsQk56dU9HS3ZBbG1nYUVKOXY0VkV6R3ZhV0E1NTQvREU2MDFtYSsx?=
 =?utf-8?B?Q0N2cGZ1SGZ3QVR1aVQ2WWFrNTRLNTFybURoTzA1VS8xblZ0VDVDcU8rc1VF?=
 =?utf-8?B?b2M3VVpHVkR2eUFPTVZJek5sN2RrV3VwRmNZR0VZUXBMZ0JPTkxmcUNKcDBM?=
 =?utf-8?B?L05CNmp3ajBNcFJqb3dxY3o2REdWRWFYbElqbjZIeXl5SkxFODZMV21rdUJl?=
 =?utf-8?B?a09KMnZXREplVFVrS1NSSWk0WTNXUlZmdjFOVTZWWlh1KzRUTnNxOHo3eEJu?=
 =?utf-8?B?Nk9YbytkOVY4R0RpdUhHYzdSeU9iaThKTys0WHJHb21WbjNiUkNqWk5ybFNz?=
 =?utf-8?B?WkdWMTRqQS95NkJpYjJuMFg1WlNhdi96QlgzcVdRNys1dThaR0NaR1JrN0J5?=
 =?utf-8?B?QUh2YnhUeE82NGl3aE83elFpZW1KWE1ORkJMUG9BbVkxZWoyTkV3NEtiYjJM?=
 =?utf-8?B?Q2h3dEVNS1Z4eWdXT2dkUUtUUHI1M083NTZwZ0E4eGlkMlRsZjBNa2g3N1FR?=
 =?utf-8?B?MVJwYTd4d2tsWUt0VW5HcUJicEtIUGMvNUh1SENpVTV4LzY3cEpiajJ4UG9o?=
 =?utf-8?B?QXVLSXU1K3Y1cHEwUnYwcG11NHltNys4TUg3UGhzemZhUjBUSExnT2ZiSi8x?=
 =?utf-8?B?dlhITkt1S3Z6cml0N3U0azZXZklqMFBIY1ArMUxtbG5RK3pZd1B0V2pCYjg3?=
 =?utf-8?B?bHM4UE92U1hPWDg1RWJHSFpFNVhuMDNHbVNnenczN2FQMnoyeThyK1JHb3Nz?=
 =?utf-8?B?YTlEQUM5WDR3MHVMbmllS0Y0ekMzSFNDVGhnNDBNNE44d1ZncEtPZ2pTdzRx?=
 =?utf-8?B?K2VhRUEyZ0xSV0ZHZXQzVElTZmhXbTFnQlYySnVjb1Jzdjg3c2svVXFCSGho?=
 =?utf-8?B?ZkdrUGNycENzSUx0WWxpcUlWWHQxOGtjaXdEUW1mNXNUa1RaekVpeHJSckxt?=
 =?utf-8?B?MTRGem1BYmErRXFnamRjU01HY1J5Ty9IcTQ5eFhNZWdaaG8zN3ZpUGlqa0t4?=
 =?utf-8?B?bUNFV1JmSWxpTXdXdEMrRzJWQlVudFJyc0t4Vlg1TTNGdDV4VTBCNFJKN0tm?=
 =?utf-8?B?R2N1UVhQRGFOdnZybVZlbmYyT2xJZmZIZHNaWm80YW1Lc01RSDJYVXNZV2xi?=
 =?utf-8?B?Qk9EcCtTRVJvaFJRUDh2RTVxNVQ0c21VMTg2bUdNSmhqNzdYUjhkRVVUbnl4?=
 =?utf-8?B?bnMxVzAvb2UwU3h2UDNUSDZuTEZqOEpHSXMzVThFc3QzenZ4VlE1THZ6dVVv?=
 =?utf-8?B?N3l2MHpoeDM3ZFlPWXBIaTBJMm1xY0xvMjVvNGEvUUdmL1BkVGcxK1pxazFu?=
 =?utf-8?B?SVU1UjZ3K0tjVHlQYldCVnppYmUxZEtyWmNtZjdLWEpiT01Bc252Ym5kK2Q1?=
 =?utf-8?B?TlpmUTFYYkFYTUNRZWZUb2pwOWJoZC9MWU9Ib0F4ZWpuditmUEVXc2ZOQmpJ?=
 =?utf-8?B?OGRBZW55OENpQ2dldGRTWkNtd1RML1M2ZHlRYWV1QXJSMlpGVDd2WlM3Tmlh?=
 =?utf-8?B?KzM3NDcxVzN1K2NVcmpBRGRnK0QrSTJISmZIN3lpamkrSEVtOHJWbTY0NTlI?=
 =?utf-8?B?czN5Vm91ZlUxeGwxN1BqYXdRNDRLU2ZQZ3gwbWgrb0FQU25mTy91Mkg4TDZS?=
 =?utf-8?Q?8E91yXaOz/9dtLJCR5j10wJNP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 261c6e1b-5530-43e1-00a1-08de164521f8
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5176.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2025 17:12:11.8677
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: g5lI6VtciGhZbM3O+rcZoc7kVu6+PY1MgFxsQ+tD7seNOnlml+DDhzoQ6V5kg0U3QypNhTnVxrwwG+T8XhomGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157

--------------6aRVamsBn2NU0uMW8xXcLGkw
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/28/2025 01:47, Lars Francke wrote:
>> See if this one helps.  I do think we still need a PMF change though too.
> 
> I tried it. System crashes again with:
> 
> Oct 27 21:13:51 lars-laptop kernel: BUG: kernel NULL pointer
> dereference, address: 00000000000003fc
> Oct 27 21:13:51 lars-laptop kernel: #PF: supervisor read access in kernel mode
> Oct 27 21:13:51 lars-laptop kernel: #PF: error_code(0x0000) - not-present page

Can you try the attached patches now?

First patch is the same which Mario shared last time and the 2nd one
is on PMF to handle the .restore() callback for hibernate.

I have tried this on 6.18-rc3 (though this should not matter)

92cc770312fa (HEAD -> master) platform/x86/amd/pmf: Prevent TEE errors
after hibernate
c992e558b474 crypto: ccp - Add an S4 restore flow
fd57572253bc (origin/master, origin/HEAD) Merge tag
'sched_ext-for-6.18-rc3-fixes' of
git://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext
dcb6fa37fd7b (tag: v6.18-rc3) Linux 6.18-rc3

and.. hibernate works on my setup.

[  647.633672] PM: hibernation: hibernation entry
[  647.640686] Filesystems sync: 0.005 seconds
[  647.641206] Freezing user space processes
[  647.643223] Freezing user space processes completed (elapsed 0.001
seconds)

...

[  648.475190] amd-pmf AMDI0108:00: TEE init done
[  648.475191] amd-pmf AMDI0108:00: Policy Binary size: 880 bytes
[  648.477416] amd-pmf AMDI0108:00: start policy engine ret: 0 (UUID
idx: 0)

...
[  650.018324] PM: hibernation: Basic memory bitmaps freed
[  650.018963] OOM killer enabled.
[  650.019313] Restarting tasks: Starting
[  650.020597] Restarting tasks: Done
[  650.021011] PM: hibernation: hibernation exit

Thanks,
Shyam

--------------6aRVamsBn2NU0uMW8xXcLGkw
Content-Type: text/plain; charset=UTF-8;
 name="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Disposition: attachment;
 filename="0001-crypto-ccp-Add-an-S4-restore-flow.patch"
Content-Transfer-Encoding: base64

RnJvbSBjOTkyZTU1OGI0NzQwNGNkZjE5N2I0YTZlNWFlM2MzMzdmNDA4NTBlIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiAiTWFyaW8gTGltb25jaWVsbG8gKEFNRCkiIDxzdXBlcm0xQGtl
cm5lbC5vcmc+CkRhdGU6IFN1biwgMjYgT2N0IDIwMjUgMTI6MzQ6NDggLTA1MDAKU3ViamVjdDog
W1BBVENIIDEvMl0gY3J5cHRvOiBjY3AgLSBBZGQgYW4gUzQgcmVzdG9yZSBmbG93CgpUaGUgc3lz
dGVtIHdpbGwgaGF2ZSBsb3N0IHBvd2VyIGR1cmluZyBTNC4gIFRoZSByaW5nIHVzZWQgZm9yIFRF
RQpjb21tdW5pY2F0aW9ucyBuZWVkcyB0byBiZSBpbml0aWFsaXplZCBiZWZvcmUgdXNlLgoKU2ln
bmVkLW9mZi1ieTogTWFyaW8gTGltb25jaWVsbG8gKEFNRCkgPHN1cGVybTFAa2VybmVsLm9yZz4K
LS0tCiBkcml2ZXJzL2NyeXB0by9jY3Avc3AtZGV2LmMgIHwgMTMgKysrKysrKysrKysrKwogZHJp
dmVycy9jcnlwdG8vY2NwL3NwLWRldi5oICB8ICAxICsKIGRyaXZlcnMvY3J5cHRvL2NjcC9zcC1w
Y2kuYyAgfCAxNiArKysrKysrKysrKysrKystCiBkcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5j
IHwgIDYgKysrKysrCiBkcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5oIHwgIDEgKwogNSBmaWxl
cyBjaGFuZ2VkLCAzNiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5jIGIvZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5j
CmluZGV4IDM0NjdmNmRiNGY1MC4uZTNmYTk0ZDE0MDI2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2Ny
eXB0by9jY3Avc3AtZGV2LmMKKysrIGIvZHJpdmVycy9jcnlwdG8vY2NwL3NwLWRldi5jCkBAIC0y
MSw2ICsyMSw3IEBACiAKICNpbmNsdWRlICJzZXYtZGV2LmgiCiAjaW5jbHVkZSAiY2NwLWRldi5o
IgorI2luY2x1ZGUgInRlZS1kZXYuaCIKICNpbmNsdWRlICJzcC1kZXYuaCIKIAogTU9EVUxFX0FV
VEhPUigiVG9tIExlbmRhY2t5IDx0aG9tYXMubGVuZGFja3lAYW1kLmNvbT4iKTsKQEAgLTIzMCw2
ICsyMzEsMTggQEAgaW50IHNwX3Jlc3VtZShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCkKIAlyZXR1cm4g
MDsKIH0KIAoraW50IHNwX3Jlc3RvcmUoc3RydWN0IHNwX2RldmljZSAqc3ApCit7CisJaWYgKHNw
LT5kZXZfdmRhdGEtPnBzcF92ZGF0YS0+dGVlKSB7CisJCWludCByID0gdGVlX3Jlc3RvcmUoc3At
PnBzcF9kYXRhKTsKKworCQlpZiAocikKKwkJCXJldHVybiByOworCX0KKworCXJldHVybiBzcF9y
ZXN1bWUoc3ApOworfQorCiBzdHJ1Y3Qgc3BfZGV2aWNlICpzcF9nZXRfcHNwX21hc3Rlcl9kZXZp
Y2Uodm9pZCkKIHsKIAlzdHJ1Y3Qgc3BfZGV2aWNlICppLCAqcmV0ID0gTlVMTDsKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuaCBiL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1k
ZXYuaAppbmRleCA2ZjlkNzA2MzI1N2QuLjM3YjM4YWZhYWIxNCAxMDA2NDQKLS0tIGEvZHJpdmVy
cy9jcnlwdG8vY2NwL3NwLWRldi5oCisrKyBiL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1kZXYuaApA
QCAtMTQxLDYgKzE0MSw3IEBAIHZvaWQgc3BfZGVzdHJveShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCk7
CiAKIGludCBzcF9zdXNwZW5kKHN0cnVjdCBzcF9kZXZpY2UgKnNwKTsKIGludCBzcF9yZXN1bWUo
c3RydWN0IHNwX2RldmljZSAqc3ApOworaW50IHNwX3Jlc3RvcmUoc3RydWN0IHNwX2RldmljZSAq
c3ApOwogaW50IHNwX3JlcXVlc3RfY2NwX2lycShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCwgaXJxX2hh
bmRsZXJfdCBoYW5kbGVyLAogCQkgICAgICAgY29uc3QgY2hhciAqbmFtZSwgdm9pZCAqZGF0YSk7
CiB2b2lkIHNwX2ZyZWVfY2NwX2lycShzdHJ1Y3Qgc3BfZGV2aWNlICpzcCwgdm9pZCAqZGF0YSk7
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2NyeXB0by9jY3Avc3AtcGNpLmMgYi9kcml2ZXJzL2NyeXB0
by9jY3Avc3AtcGNpLmMKaW5kZXggZTdiYjgwMzkxMmE2Li42MWM3YjRiNGI0YzcgMTAwNjQ0Ci0t
LSBhL2RyaXZlcnMvY3J5cHRvL2NjcC9zcC1wY2kuYworKysgYi9kcml2ZXJzL2NyeXB0by9jY3Av
c3AtcGNpLmMKQEAgLTM1Myw2ICszNTMsMTMgQEAgc3RhdGljIGludCBfX21heWJlX3VudXNlZCBz
cF9wY2lfcmVzdW1lKHN0cnVjdCBkZXZpY2UgKmRldikKIAlyZXR1cm4gc3BfcmVzdW1lKHNwKTsK
IH0KIAorc3RhdGljIGludCBfX21heWJlX3VudXNlZCBzcF9wY2lfcmVzdG9yZShzdHJ1Y3QgZGV2
aWNlICpkZXYpCit7CisJc3RydWN0IHNwX2RldmljZSAqc3AgPSBkZXZfZ2V0X2RydmRhdGEoZGV2
KTsKKworCXJldHVybiBzcF9yZXN0b3JlKHNwKTsKK30KKwogI2lmZGVmIENPTkZJR19DUllQVE9f
REVWX1NQX1BTUAogc3RhdGljIGNvbnN0IHN0cnVjdCBzZXZfdmRhdGEgc2V2djEgPSB7CiAJLmNt
ZHJlc3BfcmVnCQk9IDB4MTA1ODAsCS8qIEMyUE1TR18zMiAqLwpAQCAtNTQ0LDcgKzU1MSwxNCBA
QCBzdGF0aWMgY29uc3Qgc3RydWN0IHBjaV9kZXZpY2VfaWQgc3BfcGNpX3RhYmxlW10gPSB7CiB9
OwogTU9EVUxFX0RFVklDRV9UQUJMRShwY2ksIHNwX3BjaV90YWJsZSk7CiAKLXN0YXRpYyBTSU1Q
TEVfREVWX1BNX09QUyhzcF9wY2lfcG1fb3BzLCBzcF9wY2lfc3VzcGVuZCwgc3BfcGNpX3Jlc3Vt
ZSk7Citjb25zdCBzdHJ1Y3QgZGV2X3BtX29wcyBzcF9wY2lfcG1fb3BzID0geworCS5zdXNwZW5k
ID0gcG1fc2xlZXBfcHRyKHNwX3BjaV9zdXNwZW5kKSwKKwkucmVzdW1lID0gcG1fc2xlZXBfcHRy
KHNwX3BjaV9yZXN1bWUpLAorCS5mcmVlemUgPSBwbV9zbGVlcF9wdHIoc3BfcGNpX3N1c3BlbmQp
LAorCS50aGF3ID0gcG1fc2xlZXBfcHRyKHNwX3BjaV9yZXN1bWUpLAorCS5wb3dlcm9mZiA9IHBt
X3NsZWVwX3B0cihzcF9wY2lfc3VzcGVuZCksCisJLnJlc3RvcmUgPSBwbV9zbGVlcF9wdHIoc3Bf
cGNpX3Jlc3RvcmUpLAorfTsKIAogc3RhdGljIHN0cnVjdCBwY2lfZHJpdmVyIHNwX3BjaV9kcml2
ZXIgPSB7CiAJLm5hbWUgPSAiY2NwIiwKZGlmZiAtLWdpdCBhL2RyaXZlcnMvY3J5cHRvL2NjcC90
ZWUtZGV2LmMgYi9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5jCmluZGV4IDVlMWQ4MDcyNDY3
OC4uNjY0NjhkZTA4ZmMzIDEwMDY0NAotLS0gYS9kcml2ZXJzL2NyeXB0by9jY3AvdGVlLWRldi5j
CisrKyBiL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmMKQEAgLTM2NSwzICszNjUsOSBAQCBp
bnQgcHNwX2NoZWNrX3RlZV9zdGF0dXModm9pZCkKIAlyZXR1cm4gMDsKIH0KIEVYUE9SVF9TWU1C
T0wocHNwX2NoZWNrX3RlZV9zdGF0dXMpOworCitpbnQgdGVlX3Jlc3RvcmUoc3RydWN0IHBzcF9k
ZXZpY2UgKnBzcCkKK3sKKwl0ZWVfZnJlZV9yaW5nKHBzcC0+dGVlX2RhdGEpOworCXJldHVybiB0
ZWVfaW5pdF9yaW5nKHBzcC0+dGVlX2RhdGEpOworfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9jcnlw
dG8vY2NwL3RlZS1kZXYuaCBiL2RyaXZlcnMvY3J5cHRvL2NjcC90ZWUtZGV2LmgKaW5kZXggZWE5
YTJiN2MwNWY1Li5jMjM0MTZjYjdiYjMgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvY3J5cHRvL2NjcC90
ZWUtZGV2LmgKKysrIGIvZHJpdmVycy9jcnlwdG8vY2NwL3RlZS1kZXYuaApAQCAtMTExLDUgKzEx
MSw2IEBAIHN0cnVjdCB0ZWVfcmluZ19jbWQgewogCiBpbnQgdGVlX2Rldl9pbml0KHN0cnVjdCBw
c3BfZGV2aWNlICpwc3ApOwogdm9pZCB0ZWVfZGV2X2Rlc3Ryb3koc3RydWN0IHBzcF9kZXZpY2Ug
KnBzcCk7CitpbnQgdGVlX3Jlc3RvcmUoc3RydWN0IHBzcF9kZXZpY2UgKnBzcCk7CiAKICNlbmRp
ZiAvKiBfX1RFRV9ERVZfSF9fICovCi0tIAoyLjM0LjEKCg==

--------------6aRVamsBn2NU0uMW8xXcLGkw
Content-Type: text/plain; charset=UTF-8;
 name="0002-platform-x86-amd-pmf-Prevent-TEE-errors-after-hibern.patch"
Content-Disposition: attachment;
 filename*0="0002-platform-x86-amd-pmf-Prevent-TEE-errors-after-hibern.pa";
 filename*1="tch"
Content-Transfer-Encoding: base64

RnJvbSA5MmNjNzcwMzEyZmFhNzA2NWEwN2NjZWU0YTg0MjE4MTc2NTY1N2JmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBTaHlhbSBTdW5kYXIgUyBLIDxTaHlhbS1zdW5kYXIuUy1rQGFt
ZC5jb20+CkRhdGU6IFR1ZSwgMjggT2N0IDIwMjUgMjI6MTg6NTIgKzA1MzAKU3ViamVjdDogW1BB
VENIIDIvMl0gcGxhdGZvcm0veDg2L2FtZC9wbWY6IFByZXZlbnQgVEVFIGVycm9ycyBhZnRlciBo
aWJlcm5hdGUKCkFmdGVyIHJlc3VtaW5nIGZyb20gaGliZXJuYXRlLCBURUUgY29tbWFuZHMgY2Fu
IHRpbWUgb3V0IGFuZCBjYXVzZSBQU1AKZGlzYWJsZXMuIEZpeCB0aGlzIGJ5IHJlaW5pdGlhbGl6
aW5nIHRoZSBUcnVzdGVkIEFwcGxpY2F0aW9uIChUQSkgYW5kCmNhbmNlbGxpbmcgdGhlIHBiIHdv
cmtxdWV1ZSBpbiB0aGUgaGliZXJuYXRlIGNhbGxiYWNrcyB0byBhdm9pZCB0aGVzZQplcnJvcnMu
CgpjY3AgMDAwMDpjNDowMC4yOiB0ZWU6IGNvbW1hbmQgMHg1IHRpbWVkIG91dCwgZGlzYWJsaW5n
IFBTUAphbWQtcG1mIEFNREkwMTA3OjAwOiBURUUgZW5hY3QgY21kIGZhaWxlZC4gZXJyOiBmZmZm
MDAwZSwgcmV0OjAKYW1kLXBtZiBBTURJMDEwNzowMDogVEVFIGVuYWN0IGNtZCBmYWlsZWQuIGVy
cjogZmZmZjAwMGUsIHJldDowCmFtZC1wbWYgQU1ESTAxMDc6MDA6IFRFRSBlbmFjdCBjbWQgZmFp
bGVkLiBlcnI6IGZmZmYwMDBlLCByZXQ6MAoKRml4ZXM6IGFlODJjZWY3ZDljNSAoInBsYXRmb3Jt
L3g4Ni9hbWQvcG1mOiBBZGQgc3VwcG9ydCBmb3IgUE1GLVRBIGludGVyYWN0aW9uIikKQ28tZGV2
ZWxvcGVkLWJ5OiBQYXRpbCBSYWplc2ggUmVkZHkgPFBhdGlsLlJlZGR5QGFtZC5jb20+ClNpZ25l
ZC1vZmYtYnk6IFBhdGlsIFJhamVzaCBSZWRkeSA8UGF0aWwuUmVkZHlAYW1kLmNvbT4KU2lnbmVk
LW9mZi1ieTogU2h5YW0gU3VuZGFyIFMgSyA8U2h5YW0tc3VuZGFyLlMta0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9wbWYvY29yZS5jICAgfCA2MiArKysrKysrKysrKysr
KysrKysrKysrKysrKy0KIGRyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9wbWYvcG1mLmggICAgfCAx
MCArKysrKwogZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtZi90ZWUtaWYuYyB8IDEyICsrLS0t
LQogMyBmaWxlcyBjaGFuZ2VkLCA3NCBpbnNlcnRpb25zKCspLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1mL2NvcmUuYyBiL2RyaXZlcnMv
cGxhdGZvcm0veDg2L2FtZC9wbWYvY29yZS5jCmluZGV4IGJjNTQ0YTRhNTI2Ni4uZTc4NzQ4MGY0
ZGYyIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1mL2NvcmUuYworKysg
Yi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1mL2NvcmUuYwpAQCAtMzE0LDYgKzMxNCw2MSBA
QCBpbnQgYW1kX3BtZl9pbml0X21ldHJpY3NfdGFibGUoc3RydWN0IGFtZF9wbWZfZGV2ICpkZXYp
CiAJcmV0dXJuIDA7CiB9CiAKK3N0YXRpYyBpbnQgYW1kX3BtZl9yZWluaXRfdGEoc3RydWN0IGFt
ZF9wbWZfZGV2ICpwZGV2KQoreworCWJvb2wgc3RhdHVzOworCWludCByZXQsIGk7CisKKwlmb3Ig
KGkgPSAwOyBpIDwgQVJSQVlfU0laRShhbWRfcG1mX3RhX3V1aWQpOyBpKyspIHsKKwkJcmV0ID0g
YW1kX3BtZl90ZWVfaW5pdChwZGV2LCAmYW1kX3BtZl90YV91dWlkW2ldKTsKKwkJaWYgKHJldCkg
eworCQkJZGV2X2VycihwZGV2LT5kZXYsICJURUUgaW5pdCBmYWlsZWQgZm9yIFVVSURbJWRdIHJl
dDogJWRcbiIsIGksIHJldCk7CisJCQlyZXR1cm4gcmV0OworCQl9CisKKwkJcmV0ID0gYW1kX3Bt
Zl9zdGFydF9wb2xpY3lfZW5naW5lKHBkZXYpOworCQlkZXZfZGJnKHBkZXYtPmRldiwgInN0YXJ0
IHBvbGljeSBlbmdpbmUgcmV0OiAlZCAoVVVJRCBpZHg6ICVkKVxuIiwgcmV0LCBpKTsKKwkJc3Rh
dHVzID0gcmV0ID09IFRBX1BNRl9UWVBFX1NVQ0NFU1M7CisJCWlmIChzdGF0dXMpCisJCQlicmVh
azsKKwkJYW1kX3BtZl90ZWVfZGVpbml0KHBkZXYpOworCX0KKworCXJldHVybiAwOworfQorCitz
dGF0aWMgaW50IGFtZF9wbWZfcmVzdG9yZV9oYW5kbGVyKHN0cnVjdCBkZXZpY2UgKmRldikKK3sK
KwlzdHJ1Y3QgYW1kX3BtZl9kZXYgKnBkZXYgPSBkZXZfZ2V0X2RydmRhdGEoZGV2KTsKKwlpbnQg
cmV0OworCisJaWYgKHBkZXYtPmJ1ZikgeworCQlyZXQgPSBhbWRfcG1mX3NldF9kcmFtX2FkZHIo
cGRldiwgZmFsc2UpOworCQlpZiAocmV0KQorCQkJcmV0dXJuIHJldDsKKwl9CisKKwlpZiAocGRl
di0+c21hcnRfcGNfZW5hYmxlZCkKKwkJYW1kX3BtZl9yZWluaXRfdGEocGRldik7CisKKwlyZXR1
cm4gMDsKK30KKworc3RhdGljIGludCBhbWRfcG1mX2ZyZWV6ZV9oYW5kbGVyKHN0cnVjdCBkZXZp
Y2UgKmRldikKK3sKKwlzdHJ1Y3QgYW1kX3BtZl9kZXYgKnBkZXYgPSBkZXZfZ2V0X2RydmRhdGEo
ZGV2KTsKKworCWlmICghcGRldi0+c21hcnRfcGNfZW5hYmxlZCkKKwkJcmV0dXJuIDA7CisKKwlj
YW5jZWxfZGVsYXllZF93b3JrX3N5bmMoJnBkZXYtPnBiX3dvcmspOworCS8qIENsZWFyIGFsbCBU
RUUgcmVzb3VyY2VzICovCisJYW1kX3BtZl90ZWVfZGVpbml0KHBkZXYpOworCXBkZXYtPnNlc3Np
b25faWQgPSAwOworCisJcmV0dXJuIDA7Cit9CisKIHN0YXRpYyBpbnQgYW1kX3BtZl9zdXNwZW5k
X2hhbmRsZXIoc3RydWN0IGRldmljZSAqZGV2KQogewogCXN0cnVjdCBhbWRfcG1mX2RldiAqcGRl
diA9IGRldl9nZXRfZHJ2ZGF0YShkZXYpOwpAQCAtMzQ3LDcgKzQwMiwxMiBAQCBzdGF0aWMgaW50
IGFtZF9wbWZfcmVzdW1lX2hhbmRsZXIoc3RydWN0IGRldmljZSAqZGV2KQogCXJldHVybiAwOwog
fQogCi1zdGF0aWMgREVGSU5FX1NJTVBMRV9ERVZfUE1fT1BTKGFtZF9wbWZfcG0sIGFtZF9wbWZf
c3VzcGVuZF9oYW5kbGVyLCBhbWRfcG1mX3Jlc3VtZV9oYW5kbGVyKTsKK3N0YXRpYyBjb25zdCBz
dHJ1Y3QgZGV2X3BtX29wcyBhbWRfcG1mX3BtID0geworCS5zdXNwZW5kID0gYW1kX3BtZl9zdXNw
ZW5kX2hhbmRsZXIsCisJLnJlc3VtZSA9IGFtZF9wbWZfcmVzdW1lX2hhbmRsZXIsCisJLmZyZWV6
ZSA9IGFtZF9wbWZfZnJlZXplX2hhbmRsZXIsCisJLnJlc3RvcmUgPSBhbWRfcG1mX3Jlc3RvcmVf
aGFuZGxlciwKK307CiAKIHN0YXRpYyB2b2lkIGFtZF9wbWZfaW5pdF9mZWF0dXJlcyhzdHJ1Y3Qg
YW1kX3BtZl9kZXYgKmRldikKIHsKZGlmZiAtLWdpdCBhL2RyaXZlcnMvcGxhdGZvcm0veDg2L2Ft
ZC9wbWYvcG1mLmggYi9kcml2ZXJzL3BsYXRmb3JtL3g4Ni9hbWQvcG1mL3BtZi5oCmluZGV4IGJk
MTlmMmE2YmM3OC4uMmRhMTg4NWQ4NzkxIDEwMDY0NAotLS0gYS9kcml2ZXJzL3BsYXRmb3JtL3g4
Ni9hbWQvcG1mL3BtZi5oCisrKyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9wbWYvcG1mLmgK
QEAgLTEyMiw2ICsxMjIsMTIgQEAgc3RydWN0IGNvb2tpZV9oZWFkZXIgewogCiB0eXBlZGVmIHZv
aWQgKCphcG1mX2V2ZW50X2hhbmRsZXJfdCkoYWNwaV9oYW5kbGUgaGFuZGxlLCB1MzIgZXZlbnQs
IHZvaWQgKmRhdGEpOwogCitzdGF0aWMgY29uc3QgdXVpZF90IGFtZF9wbWZfdGFfdXVpZFtdIF9f
dXNlZCA9IHsgVVVJRF9JTklUKDB4ZDliMzliZjIsIDB4NjZiZCwgMHg0MTU0LCAweGFmLCAweGI4
LAorCQkJCQkJCSAgIDB4OGEsIDB4Y2MsIDB4MmIsIDB4MmIsIDB4NjAsIDB4ZDYpLAorCQkJCQkJ
IFVVSURfSU5JVCgweDZmZDkzYjc3LCAweDNmYjgsIDB4NTI0ZCwgMHhiMSwgMHgyZCwKKwkJCQkJ
CQkgICAweGM1LCAweDI5LCAweGIxLCAweDNkLCAweDg1LCAweDQzKSwKKwkJCQkJICAgICAgIH07
CisKIC8qIEFQVFMgUE1GIEJJT1MgSW50ZXJmYWNlICovCiBzdHJ1Y3QgYW1kX3BtZl9hcHRzX291
dHB1dCB7CiAJdTE2IHRhYmxlX3ZlcnNpb247CkBAIC04ODgsNCArODk0LDggQEAgdm9pZCBhbWRf
cG1mX3BvcHVsYXRlX3RhX2lucHV0cyhzdHJ1Y3QgYW1kX3BtZl9kZXYgKmRldiwgc3RydWN0IHRh
X3BtZl9lbmFjdF90YWIKIHZvaWQgYW1kX3BtZl9kdW1wX3RhX2lucHV0cyhzdHJ1Y3QgYW1kX3Bt
Zl9kZXYgKmRldiwgc3RydWN0IHRhX3BtZl9lbmFjdF90YWJsZSAqaW4pOwogaW50IGFtZF9wbWZf
aW52b2tlX2NtZF9lbmFjdChzdHJ1Y3QgYW1kX3BtZl9kZXYgKmRldik7CiAKK2ludCBhbWRfcG1m
X3RlZV9pbml0KHN0cnVjdCBhbWRfcG1mX2RldiAqZGV2LCBjb25zdCB1dWlkX3QgKnV1aWQpOwor
dm9pZCBhbWRfcG1mX3RlZV9kZWluaXQoc3RydWN0IGFtZF9wbWZfZGV2ICpkZXYpOworaW50IGFt
ZF9wbWZfc3RhcnRfcG9saWN5X2VuZ2luZShzdHJ1Y3QgYW1kX3BtZl9kZXYgKmRldik7CisKICNl
bmRpZiAvKiBQTUZfSCAqLwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3Bt
Zi90ZWUtaWYuYyBiL2RyaXZlcnMvcGxhdGZvcm0veDg2L2FtZC9wbWYvdGVlLWlmLmMKaW5kZXgg
NmU4MTE2YmVmNGY2Li45MDMwNDU5MzUyMzcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvcGxhdGZvcm0v
eDg2L2FtZC9wbWYvdGVlLWlmLmMKKysrIGIvZHJpdmVycy9wbGF0Zm9ybS94ODYvYW1kL3BtZi90
ZWUtaWYuYwpAQCAtMjcsMTIgKzI3LDYgQEAgbW9kdWxlX3BhcmFtKHBiX3NpZGVfbG9hZCwgYm9v
bCwgMDQ0NCk7CiBNT0RVTEVfUEFSTV9ERVNDKHBiX3NpZGVfbG9hZCwgIlNpZGVsb2FkIHBvbGlj
eSBiaW5hcmllcyBkZWJ1ZyBwb2xpY3kgZmFpbHVyZXMiKTsKICNlbmRpZgogCi1zdGF0aWMgY29u
c3QgdXVpZF90IGFtZF9wbWZfdGFfdXVpZFtdID0geyBVVUlEX0lOSVQoMHhkOWIzOWJmMiwgMHg2
NmJkLCAweDQxNTQsIDB4YWYsIDB4YjgsIDB4OGEsCi0JCQkJCQkgICAgMHhjYywgMHgyYiwgMHgy
YiwgMHg2MCwgMHhkNiksCi0JCQkJCSAgVVVJRF9JTklUKDB4NmZkOTNiNzcsIDB4M2ZiOCwgMHg1
MjRkLCAweGIxLCAweDJkLCAweGM1LAotCQkJCQkJICAgIDB4MjksIDB4YjEsIDB4M2QsIDB4ODUs
IDB4NDMpLAotCQkJCQl9OwotCiBzdGF0aWMgY29uc3QgY2hhciAqYW1kX3BtZl91ZXZlbnRfYXNf
c3RyKHVuc2lnbmVkIGludCBzdGF0ZSkKIHsKIAlzd2l0Y2ggKHN0YXRlKSB7CkBAIC0zMTIsNyAr
MzA2LDcgQEAgc3RhdGljIHZvaWQgYW1kX3BtZl9pbnZva2VfY21kKHN0cnVjdCB3b3JrX3N0cnVj
dCAqd29yaykKIAlzY2hlZHVsZV9kZWxheWVkX3dvcmsoJmRldi0+cGJfd29yaywgbXNlY3NfdG9f
amlmZmllcyhwYl9hY3Rpb25zX21zKSk7CiB9CiAKLXN0YXRpYyBpbnQgYW1kX3BtZl9zdGFydF9w
b2xpY3lfZW5naW5lKHN0cnVjdCBhbWRfcG1mX2RldiAqZGV2KQoraW50IGFtZF9wbWZfc3RhcnRf
cG9saWN5X2VuZ2luZShzdHJ1Y3QgYW1kX3BtZl9kZXYgKmRldikKIHsKIAlzdHJ1Y3QgY29va2ll
X2hlYWRlciAqaGVhZGVyOwogCWludCByZXM7CkBAIC00NjgsNyArNDYyLDcgQEAgc3RhdGljIGlu
dCBhbWRfcG1mX3JlZ2lzdGVyX2lucHV0X2RldmljZShzdHJ1Y3QgYW1kX3BtZl9kZXYgKmRldikK
IAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBhbWRfcG1mX3RlZV9pbml0KHN0cnVjdCBhbWRf
cG1mX2RldiAqZGV2LCBjb25zdCB1dWlkX3QgKnV1aWQpCitpbnQgYW1kX3BtZl90ZWVfaW5pdChz
dHJ1Y3QgYW1kX3BtZl9kZXYgKmRldiwgY29uc3QgdXVpZF90ICp1dWlkKQogewogCXUzMiBzaXpl
OwogCWludCByZXQ7CkBAIC01MTYsNyArNTEwLDcgQEAgc3RhdGljIGludCBhbWRfcG1mX3RlZV9p
bml0KHN0cnVjdCBhbWRfcG1mX2RldiAqZGV2LCBjb25zdCB1dWlkX3QgKnV1aWQpCiAJcmV0dXJu
IHJldDsKIH0KIAotc3RhdGljIHZvaWQgYW1kX3BtZl90ZWVfZGVpbml0KHN0cnVjdCBhbWRfcG1m
X2RldiAqZGV2KQordm9pZCBhbWRfcG1mX3RlZV9kZWluaXQoc3RydWN0IGFtZF9wbWZfZGV2ICpk
ZXYpCiB7CiAJaWYgKCFkZXYtPnRlZV9jdHgpCiAJCXJldHVybjsKLS0gCjIuMzQuMQoK

--------------6aRVamsBn2NU0uMW8xXcLGkw--

