Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C76B64CC15B
	for <lists+platform-driver-x86@lfdr.de>; Thu,  3 Mar 2022 16:32:44 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229741AbiCCPd1 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 3 Mar 2022 10:33:27 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230199AbiCCPd0 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 3 Mar 2022 10:33:26 -0500
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam07on2058.outbound.protection.outlook.com [40.107.212.58])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57D0A3DA53
        for <platform-driver-x86@vger.kernel.org>; Thu,  3 Mar 2022 07:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dSMHTbSrJxpwb5RaGfRHy+xNPUQpUoJbrzDqAOvm1eqxwqmYYarcSjnjcxrroMaBbmjX9bk3l1l/nR7AkXAHEI3KUNvPd7hrCpfWKf0IMu2ENT5uYP1HG+iFYSC8KC4WNQbw/1uL1pIVmfr57GdWEcHp3A8UNgwfzUxBOTlYbk3mUlDlciND62Tv+tJv0BPb6tRhghxvq1ApRYfOjpfOkVgqN06zdYVKNkk9dNuFMbD+xb2e03SRoy+2/VyoLHTy4j+0mVJJ/slfIFVa82R/lSKtfpSxCghc+5l6ZIRNgm56d0CsZlGOdohgw7stCCypbKnR/K1ED2jgcaZVFM1tQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7okZIWDwWDCNwB7fDmfabInRqxh/eofnFyG7L6kccSc=;
 b=ArJ/Xm36JKFRiaiuFEb+iCa3T9xYqme6PoH3d4m7Iz5//X05Px2v/7IEmbu9qEM5LeHHYWjrdFZnvZGx8r0yxTIdWqgU9MGBRIIa6TPnB4QHZPl2CTqSuTRCtZGGwNwEkVXR0YgdN/bxsgkcGcq43DnwDgWHDN0evY+VDQKDe+Zlh4u1NcnJK8QKMRELUAV7HDJPYgNPeE+cRazB6NQdva1GSuwDZPZaEn+r3+AcwN/N32yBlQ5ANCRtfFdBf26BalFCILyxxRqAyhWdLSYnVlL1IDlCqAtmAVCSU0XRaZoU50uewrIW0A9+lDSWzB+8E61WCahNghdGqYBCXL/Fag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7okZIWDwWDCNwB7fDmfabInRqxh/eofnFyG7L6kccSc=;
 b=BrtI4CfOJJqm8zOoguOCBy4uJAVIZ30+oD32quauuwZ0H9fr3/9rgvh/csOJb4gMkANZbyM8mGmHiu+jKijdbYKUHrGYevBm2FLM6lpRJKWqjsQFqJnBIFupKe0QuP0tn7eCXNSzDgIEPOkmv/lX4zE7eViTiPObiueHdDbnNPM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BN9PR12MB5291.namprd12.prod.outlook.com (2603:10b6:408:104::13)
 by MN2PR12MB4343.namprd12.prod.outlook.com (2603:10b6:208:26f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5038.14; Thu, 3 Mar
 2022 15:32:32 +0000
Received: from BN9PR12MB5291.namprd12.prod.outlook.com
 ([fe80::3061:94f6:750f:b494]) by BN9PR12MB5291.namprd12.prod.outlook.com
 ([fe80::3061:94f6:750f:b494%8]) with mapi id 15.20.5038.016; Thu, 3 Mar 2022
 15:32:32 +0000
Message-ID: <5be85c82-f7e5-db99-008e-6e031d68a403@amd.com>
Date:   Thu, 3 Mar 2022 21:02:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.1.0
Subject: Re: [PATCH v7 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Hans de Goede <hdegoede@redhat.com>
Cc:     carlos.bilbao@amd.com, siva.sathappan@amd.com, song@kernel.org,
        nathan.fontenot@amd.com, Suma Hegde <suma.hegde@amd.com>,
        platform-driver-x86@vger.kernel.org
References: <20220222050501.18789-1-nchatrad@amd.com>
 <5c6d6684-cbb8-5a73-06c6-d515322fa15a@redhat.com>
From:   "Chatradhi, Naveen Krishna" <nchatrad@amd.com>
In-Reply-To: <5c6d6684-cbb8-5a73-06c6-d515322fa15a@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0081.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:9a::20) To BN9PR12MB5291.namprd12.prod.outlook.com
 (2603:10b6:408:104::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 9f57eac6-8fb7-4975-9a84-08d9fd2b08b7
X-MS-TrafficTypeDiagnostic: MN2PR12MB4343:EE_
X-Microsoft-Antispam-PRVS: <MN2PR12MB43432B74755ACF84841175EFE8049@MN2PR12MB4343.namprd12.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aIH6KhVdqk0X8gga+bd0ZPS2ojnVHlmRLl2Wrw/DRZo9Q7ssGn6CbszZ8a73idUjq5xCi0ZJwS4Y5LMiGkbAGh8U63Ad8hD5KKb+sLhHtZ9pOJE6axXBzuk7vEII7cfbgKwyWd4CAIUmQ1VY9e+svHYNoEV9n+uyHQeU5yms8G8aiHKBex8H5Vy9J3k8LCvo816oMRk6FBE7yhAy5ZECZ64L2hufnmNPMZpN3pgg5OIkjgxiC0H0ScpFZ9J8ISTtH6fDQscVKuAMxqzsFHBvqCCqr0qmDr47bxjuzBKKXPPN0+BpIWlyF8iHNNya11T+j5w21pnvY1x0QyktzQKSuOFvImnSAyh7VDKbzuCFjRtL0TkjMRKUCtsjZC9WXLycKB4w4l3sNmzth8UmaKRpDdxPLbFzPNCLALJV4tBXfLYb7wk+9Gv6m6vI70S37RHhbE0VuP/8rVkSLs2y3gQtJ3XxfXZS9byXT5QXeRZgfZqqluy6v0c8iw4E4p5aYw1NBXxwINRFUupJrLlfcBtD21TmffqgCTyhhJnJot7xzIdPBc0Z5K/N3xiXGTw+hw5mXa2iqwITcK2HWXX9HEq9yAKVeEDKKAkMO89l9yj1Y9e3CwyQL24hGpOKKNFAL/fzYKpwx8wlTzoNiDqKPNZPFFHAkyCiWG24pb0fqWTYXCQ/+a9mXvKjZfSdYuOb1KJPziNy29/G8zV39CqboC7OfTBUWW5ttLH/prqhukTi+yuZ9E1taB8XBnE4Y5nU24m6zoQWjcAxSVa3sZDF8JLMrso6zNyOIknMKfAQWzZNOx2HQId7aCdm9LZz56rLfBgSF2CWC+0c5pfrDpN2+oHG3FOvAJG1PwWZe2PmBhPrfA4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BN9PR12MB5291.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(30864003)(5660300002)(38100700002)(2906002)(508600001)(45080400002)(966005)(6486002)(6506007)(53546011)(6666004)(4326008)(8676002)(66946007)(66476007)(66556008)(316002)(6916009)(83380400001)(8936002)(6512007)(26005)(186003)(2616005)(31696002)(31686004)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDJlY1plZXgyend0NU1IaHA4ZzFVa1pmVTVmcjNGY1F5MS94UVZmQ1ZveHN3?=
 =?utf-8?B?VW55QURaOUJISjY5cTFQTmh1cWJNRGJCeUhiVEtZekdidEtVZEJEbU5qR0hQ?=
 =?utf-8?B?MHdUaFoydkZwWStYTG55a2FMRERzays3WTdoaW9YSEVTWU9Pem5rVlpPQkU0?=
 =?utf-8?B?eTZzdTk0K2h5M0FhNmFWZkR5VlJEZmozckQzTjA0cVRoRGFmQnAzUllaSVVp?=
 =?utf-8?B?aVRmckxxR0Q2MlMwS01YRCtFTjR2SkQrR0dZS2VqRW4wUjY0TG50SzV2VVVH?=
 =?utf-8?B?b1g5REVORGg2aEY0RUdTTXdhN3hqOTg2VkpjSjdzSUFSdkxiQWRwM2pSUXBN?=
 =?utf-8?B?Z0V1a3BSSnR0Q3BIQXdNbEFWU3d2RWM1UktJMzJXQ3RJcmRIdWdEUk0zMUJo?=
 =?utf-8?B?SE1DUFdLT1ZIUjViOWVHNWM3b2c1MVNxYXFrMmtob0N4ZUVOaGtiZDkzZDlU?=
 =?utf-8?B?MnpPTTZIaE11ekNKcFZ2c1RUdW9WSUl1bEExc2RwSy9pWHNyRW16NS9MSjd3?=
 =?utf-8?B?dGhUbG0xaHVPL01vY3ZDKzN2U3dHYlJkTlVnazVLREc0UGx4R0xEa0x5MHJP?=
 =?utf-8?B?a0NFWmlnR2FkYjBzODBzVm5BSGQ0NUtiV01PaGVGTzR0WW5HSnd6L015Nm1E?=
 =?utf-8?B?Z2VWZWQxTzF0Y2YyVUJqZGtzTjB6K1VzUitBdmZKV1BkR2RnZ0dTbG9qRW9W?=
 =?utf-8?B?ZHVZT1hYdUs2Y3ZBdWd6QVFMbk9UYWIxTWZ3N0FjSnJMV2h3eXlFb3daWk1o?=
 =?utf-8?B?d0VsK05YZkk4S2RGK3VLQ1k0NC8vQVhkTkJwaDdNMUw3RSs4cDVVbzVqTHJu?=
 =?utf-8?B?OWRLallwcUhUandDYzVDcXljd1RRMy9sRjRZR3E5WnczbXZyZU9YUVdhYSth?=
 =?utf-8?B?K2REanlFZEZpUURseFNUaFBuZ1diZVRPejRKUGVBOWhjSlpJRXZVWVdwUUli?=
 =?utf-8?B?YllWbDZQZTZ0dVFGYkpvSkhVZnNBYys1MkdPbTZqT1gvK0YzTEMwaHR2QUhw?=
 =?utf-8?B?UW1zRU8vTW4xc0dUZ0ZSdGVhU2dzblkyZW81ZVgwMWUzQVd0ZWpJT01lcDc0?=
 =?utf-8?B?RGl0MGdFVG9UQUhOMHBtV0RzZUtrYS9udHZDWXEvWTlISGE5MFFnZ283UjVR?=
 =?utf-8?B?alN4WU1kOEU5a3ZIemN3QTh4OFFMWmZwOXB0RTVYeU9xYWxtSVJlTmtwQXB4?=
 =?utf-8?B?SVk4Ykozdkc1emhzV0NFbU9hUFJMemYwa3ZJQ1dxR1FVVHJ5dkZSMHdTcDcz?=
 =?utf-8?B?eGdPOE8xcGlZNkxTT1h5ZmpoWnZmcDY5TCtFeTAwZXFkMStFWjNUYk5jc3dM?=
 =?utf-8?B?SS9nTk91bm9XTnpocXdSWkJVRmtCVDRDdDRYSkpKY2hQb2hXQ1M1ZVdUamh1?=
 =?utf-8?B?d0hXQlJsQ1BGSFF4SFJzc2Y1bVJjdCt6Q2x4RFZSNUJuVVV2b2pyQmZ6enRY?=
 =?utf-8?B?NGRkYlNHOENVcGl5L3JSb3lRbjRkZDBjTTU5Vis2di9uaXFmS29yK0pZbzNa?=
 =?utf-8?B?WnQyWnlydDdyVmtJZ3FjVDFxYnFDM0R3YUplcXVNbnlOaFZiRTl5dVQ4VE8y?=
 =?utf-8?B?ZFh2NTcrOTY5Z1NpUlB0azJzb1o0S0szOVJwMXZYemJPa000Sjl4bnRaYUpq?=
 =?utf-8?B?WFNPa1BBUVAxckd1VDE5WG52b2ZrdDgyaEliaVRQTFVqYnFWYmhGS2dkUlpj?=
 =?utf-8?B?VStxeE9PeUlUYzZoUXAxcFRtM2NEWTI2NzAwdEc3aFdjYmozeU1rVks1c2Zu?=
 =?utf-8?B?cG5iSzdiTDBUSnpOTUQ4bURNZDFQYU5TV3ZqMllTQ3Boa3lIeEtBUEhHSkVt?=
 =?utf-8?B?dmI1ZGJhT3NQWDZsVDBqUzF0aGw0Yy9tMXcwNngrUG9IVEZGN1NNcnBRTTZL?=
 =?utf-8?B?Q3gvdXhrclBlQ1dSeU1sbmxDMm5lQXYvcisyU0RRejlZZW1adEJiRlZLMjVH?=
 =?utf-8?B?ZXFoZ284eVk3cm5pa3V3TWcydnZBdDlBcWs0ZGJjblQ5Zk9ZMTQwSXM1TFgr?=
 =?utf-8?B?cGVGNTI0Uzdlam1MZ1RYa2Foak9xM2dXU1JubTA3VEVpZnMzbTZVU0FUaUlV?=
 =?utf-8?B?ZDc1OUFVTWE5dExNdTZoSU1OcFZtUzYrLys2NHpkYlVueXprVFllRS8zNlhk?=
 =?utf-8?B?bWtjTnY4RE8xQzYvSzM3OExxai9IK280dGUvVGdwUGVhdlRzeks4MFVqTVQy?=
 =?utf-8?Q?pEy9VZLJQT8NC7WRIkSlZck=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9f57eac6-8fb7-4975-9a84-08d9fd2b08b7
X-MS-Exchange-CrossTenant-AuthSource: BN9PR12MB5291.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Mar 2022 15:32:32.6007
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pqP5VQBq3LrS/xwQnsh+4a1kGVOqby3ql7g0fzh92cbIyZQbWt8SjNZEXPrzDl7fa3K+gnt2XwZvz76CWPCrSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4343
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Hans

On 2/24/2022 8:48 PM, Hans de Goede wrote:
> [CAUTION: External Email]
>
> Hi,
>
> On 2/22/22 06:05, Naveen Krishna Chatradhi wrote:
>> From: Suma Hegde <suma.hegde@amd.com>
>>
>> Recent Fam19h EPYC server line of processors from AMD support system
>> management functionality via HSMP (Host System Management Port) interface.
>>
>> The Host System Management Port (HSMP) is an interface to provide
>> OS-level software with access to system management functions via a
>> set of mailbox registers.
>>
>> More details on the interface can be found in chapter
>> "7 Host System Management Port (HSMP)" of the following PPR
>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.amd.com%2Fsystem%2Ffiles%2FTechDocs%2F55898_B1_pub_0.50.zip&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7C9de612262a6a41055f1908d9f7a90563%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813128187730682%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Lv7O%2FSHiR1pvs%2Ft60mP9FHOfie34XjkCXpfmH%2FyWUS8%3D&amp;reserved=0
>>
>> This patch adds new amd_hsmp module under the drivers/platforms/x86/
>> which creates miscdevice with an IOCTL interface to the user space.
>> /dev/hsmp is for running the hsmp mailbox commands.
>>
>> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
>> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
>> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
>> Acked-by: Song Liu <song@kernel.org>
>> Reviewed-by: Nathan Fontenot <nathan.fontenot@amd.com>
>> ---
>> Changes since v6:
>> None
>> Changes since v5:
>> 1. change variable name msg.buf to msg.args
>> 2. correct spellings and adjust comments
>> 3. do not call validate_message() in 2 places
>>     use the necessary checks alone.
>> 4. return misc_register() directly
>> 5. Added reviewed-by and acked-by, thanks for the review
>>
>> Changes since v4:
>> 1. Add description of the messages in the header
>> 2. use one set of buf[] array for both arguments and response data
>> 3. renamed struct msg_desc_table to hsmp_msg_desc_table
>> 4. Correct the names in MAINTAINER to first name last name basis
>>
>> Changes since v3:
>> remove change ids
>> Changes since v2:
>> 1. Updated MAINTAINERS page
>> 2. Added message description table with num_args, response_sz and type fields.
>>     This will be useful for user space applications and the driver
>>     to validate the inputs.
>> 3. removed the model check and added a statement in the documentation.
>>
>> Changes since v1:
>> 1. Add supported model check
>>     . This interface is supported only on server line of CPUs.
>> 2. Handle Reserved messages
>> 3. Add brief descriptions of the Messages
>> 4. Add Carlos Bilbao's reviewed-by
>>
>>   .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>>   MAINTAINERS                                   |  10 +
>>   arch/x86/include/asm/amd_hsmp.h               |  16 +
>>   arch/x86/include/uapi/asm/amd_hsmp.h          | 203 +++++++++
>>   drivers/platform/x86/Kconfig                  |  13 +
>>   drivers/platform/x86/Makefile                 |   1 +
>>   drivers/platform/x86/amd_hsmp.c               | 425 ++++++++++++++++++
>>   7 files changed, 670 insertions(+)
>>   create mode 100644 arch/x86/include/asm/amd_hsmp.h
>>   create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
>>   create mode 100644 drivers/platform/x86/amd_hsmp.c
>>
>> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> index e6fce2cbd99e..e55d842380ef 100644
>> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
>> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
>> @@ -375,6 +375,8 @@ Code  Seq#    Include File                                           Comments
>>                                                                        <mailto:thomas@winischhofer.net>
>>   0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
>>                                                                        <mailto:mathieu.desnoyers@efficios.com>
>> +0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
>> +                                                                     <mailto:nchatrad@amd.com>
>>   0xFD  all    linux/dm-ioctl.h
>>   0xFE  all    linux/isst_if.h
>>   ====  =====  ======================================================= ================================================================
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index fca970a46e77..b7d95d5cc650 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -989,6 +989,16 @@ L:       platform-driver-x86@vger.kernel.org
>>   S:   Maintained
>>   F:   drivers/platform/x86/amd-pmc.*
>>
>> +AMD HSMP DRIVER
>> +M:   Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
>> +R:   Carlos Bilbao <carlos.bilbao@amd.com>
>> +L:   platform-driver-x86@vger.kernel.org
>> +S:   Maintained
>> +F:   Documentation/x86/amd_hsmp.rst
>> +F:   arch/x86/include/asm/amd_hsmp.h
>> +F:   arch/x86/include/uapi/asm/amd_hsmp.h
>> +F:   drivers/platform/x86/amd_hsmp.c
>> +
>>   AMD POWERPLAY AND SWSMU
>>   M:   Evan Quan <evan.quan@amd.com>
>>   L:   amd-gfx@lists.freedesktop.org
>> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
>> new file mode 100644
>> index 000000000000..db2846bb3c37
>> --- /dev/null
>> +++ b/arch/x86/include/asm/amd_hsmp.h
>> @@ -0,0 +1,16 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +
>> +#ifndef _ASM_X86_AMD_HSMP_H_
>> +#define _ASM_X86_AMD_HSMP_H_
>> +
>> +#include <uapi/asm/amd_hsmp.h>
>> +
>> +#if (defined(CONFIG_AMD_HSMP) || defined(CONFIG_AMD_HSMP_MODULE))
> This should be:
>
> #if IS_ENABLED(CONFIG_AMD_HSMP)
>
>> +int hsmp_send_message(struct hsmp_message *msg);
>> +#else
>> +int hsmp_send_message(struct hsmp_message *msg)
> And this should be a "static inline int".
>
> Otherwise this patch looks good to me, so I've fixed these
> 2 small things up while merging it:
Thank you, please let us know if you have any suggestions.
>
> Thank you for your patch, I've applied this patch to my review-hans
> branch:
> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fgit.kernel.org%2Fpub%2Fscm%2Flinux%2Fkernel%2Fgit%2Fpdx86%2Fplatform-drivers-x86.git%2Flog%2F%3Fh%3Dreview-hans&amp;data=04%7C01%7CNaveenKrishna.Chatradhi%40amd.com%7C9de612262a6a41055f1908d9f7a90563%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C637813128187730682%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000&amp;sdata=Q8ZeWkN6vXwzWVRf88qXKcBaPVL7dFa34yv2sdGi09U%3D&amp;reserved=0
>
> Note it will show up in my review-hans branch once I've pushed my
> local branch there, which might take a while.
>
> Once I've run some tests on this branch the patches there will be
> added to the platform-drivers-x86/for-next branch and eventually
> will be included in the pdx86 pull-request to Linus for the next
> merge-window.
>
> Regards,
>
> Hans
>
>
>
>
>> +{
>> +     return -ENODEV;
>> +}
>> +#endif
>> +#endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
>> new file mode 100644
>> index 000000000000..7ee7ba0d63a3
>> --- /dev/null
>> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
>> @@ -0,0 +1,203 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +
>> +#ifndef _UAPI_ASM_X86_AMD_HSMP_H_
>> +#define _UAPI_ASM_X86_AMD_HSMP_H_
>> +
>> +#include <linux/types.h>
>> +
>> +#pragma pack(4)
>> +
>> +#define HSMP_MAX_MSG_LEN 8
>> +
>> +/*
>> + * HSMP Messages supported
>> + */
>> +enum hsmp_message_ids {
>> +     HSMP_TEST = 1,                  /* 01h Increments input value by 1 */
>> +     HSMP_GET_SMU_VER,               /* 02h SMU FW version */
>> +     HSMP_GET_PROTO_VER,             /* 03h HSMP interface version */
>> +     HSMP_GET_SOCKET_POWER,          /* 04h average package power consumption */
>> +     HSMP_SET_SOCKET_POWER_LIMIT,    /* 05h Set the socket power limit */
>> +     HSMP_GET_SOCKET_POWER_LIMIT,    /* 06h Get current socket power limit */
>> +     HSMP_GET_SOCKET_POWER_LIMIT_MAX,/* 07h Get maximum socket power value */
>> +     HSMP_SET_BOOST_LIMIT,           /* 08h Set a core maximum frequency limit */
>> +     HSMP_SET_BOOST_LIMIT_SOCKET,    /* 09h Set socket maximum frequency level */
>> +     HSMP_GET_BOOST_LIMIT,           /* 0Ah Get current frequency limit */
>> +     HSMP_GET_PROC_HOT,              /* 0Bh Get PROCHOT status */
>> +     HSMP_SET_XGMI_LINK_WIDTH,       /* 0Ch Set max and min width of xGMI Link */
>> +     HSMP_SET_DF_PSTATE,             /* 0Dh Alter APEnable/Disable messages behavior */
>> +     HSMP_SET_AUTO_DF_PSTATE,        /* 0Eh Enable DF P-State Performance Boost algorithm */
>> +     HSMP_GET_FCLK_MCLK,             /* 0Fh Get FCLK and MEMCLK for current socket */
>> +     HSMP_GET_CCLK_THROTTLE_LIMIT,   /* 10h Get CCLK frequency limit in socket */
>> +     HSMP_GET_C0_PERCENT,            /* 11h Get average C0 residency in socket */
>> +     HSMP_SET_NBIO_DPM_LEVEL,        /* 12h Set max/min LCLK DPM Level for a given NBIO */
>> +                                     /* 13h Reserved */
>> +     HSMP_GET_DDR_BANDWIDTH = 0x14,  /* 14h Get theoretical maximum and current DDR Bandwidth */
>> +     HSMP_GET_TEMP_MONITOR,          /* 15h Get per-DIMM temperature and refresh rates */
>> +     HSMP_MSG_ID_MAX,
>> +};
>> +
>> +struct hsmp_message {
>> +     __u32   msg_id;                 /* Message ID */
>> +     __u16   num_args;               /* Number of input argument words in message */
>> +     __u16   response_sz;            /* Number of expected output/response words */
>> +     __u32   args[HSMP_MAX_MSG_LEN]; /* argument/response buffer */
>> +     __u16   sock_ind;               /* socket number */
>> +};
>> +
>> +enum hsmp_msg_type {
>> +     HSMP_RSVD = -1,
>> +     HSMP_SET  = 0,
>> +     HSMP_GET  = 1,
>> +};
>> +
>> +struct hsmp_msg_desc {
>> +     int num_args;
>> +     int response_sz;
>> +     enum hsmp_msg_type type;
>> +};
>> +
>> +/*
>> + * User may use these comments as reference, please find the
>> + * supported list of messages and message definition in the
>> + * HSMP chapter of respective family/model PPR.
>> + *
>> + * Not supported messages would return -ENOMSG.
>> + */
>> +static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
>> +     /* RESERVED */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /*
>> +      * HSMP_TEST, num_args = 1, response_sz = 1
>> +      * input:  args[0] = xx
>> +      * output: args[0] = xx + 1
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_SMU_VER, num_args = 0, response_sz = 1
>> +      * output: args[0] = smu fw ver
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_PROTO_VER, num_args = 0, response_sz = 1
>> +      * output: args[0] = proto version
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_SOCKET_POWER, num_args = 0, response_sz = 1
>> +      * output: args[0] = socket power in mWatts
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_SOCKET_POWER_LIMIT, num_args = 1, response_sz = 0
>> +      * input: args[0] = power limit value in mWatts
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_GET_SOCKET_POWER_LIMIT, num_args = 0, response_sz = 1
>> +      * output: args[0] = socket power limit value in mWatts
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_SOCKET_POWER_LIMIT_MAX, num_args = 0, response_sz = 1
>> +      * output: args[0] = maximuam socket power limit in mWatts
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_BOOST_LIMIT, num_args = 1, response_sz = 0
>> +      * input: args[0] = apic id[31:16] + boost limit value in MHz[15:0]
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_SET_BOOST_LIMIT_SOCKET, num_args = 1, response_sz = 0
>> +      * input: args[0] = boost limit value in MHz
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_GET_BOOST_LIMIT, num_args = 1, response_sz = 1
>> +      * input: args[0] = apic id
>> +      * output: args[0] = boost limit value in MHz
>> +      */
>> +     {1, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_PROC_HOT, num_args = 0, response_sz = 1
>> +      * output: args[0] = proc hot status
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
>> +      * input: args[0] = min link width[15:8] + max link width[7:0]
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
>> +      * input: args[0] = df pstate[7:0]
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
>> +     {0, 0, HSMP_SET},
>> +
>> +     /*
>> +      * HSMP_GET_FCLK_MCLK, num_args = 0, response_sz = 2
>> +      * output: args[0] = fclk in MHz, args[1] = mclk in MHz
>> +      */
>> +     {0, 2, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_CCLK_THROTTLE_LIMIT, num_args = 0, response_sz = 1
>> +      * output: args[0] = core clock in MHz
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_C0_PERCENT, num_args = 0, response_sz = 1
>> +      * output: args[0] = average c0 residency
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_SET_NBIO_DPM_LEVEL, num_args = 1, response_sz = 0
>> +      * input: args[0] = nbioid[23:16] + max dpm level[15:8] + min dpm level[7:0]
>> +      */
>> +     {1, 0, HSMP_SET},
>> +
>> +     /* RESERVED message */
>> +     {0, 0, HSMP_RSVD},
>> +
>> +     /*
>> +      * HSMP_GET_DDR_BANDWIDTH, num_args = 0, response_sz = 1
>> +      * output: args[0] = max bw in Gbps[31:20] + utilised bw in Gbps[19:8] +
>> +      * bw in percentage[7:0]
>> +      */
>> +     {0, 1, HSMP_GET},
>> +
>> +     /*
>> +      * HSMP_GET_TEMP_MONITOR, num_args = 0, response_sz = 1
>> +      * output: args[0] = temperature in degree celsius. [15:8] integer part +
>> +      * [7:5] fractional part
>> +      */
>> +     {0, 1, HSMP_GET},
>> +};
>> +
>> +/* Reset to default packing */
>> +#pragma pack()
>> +
>> +/* Define unique ioctl command for hsmp msgs using generic _IOWR */
>> +#define HSMP_BASE_IOCTL_NR   0xF8
>> +#define HSMP_IOCTL_CMD               _IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
>> +
>> +#endif /*_ASM_X86_AMD_HSMP_H_*/
>> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
>> index 24deeeb29af2..0906c36ea07b 100644
>> --- a/drivers/platform/x86/Kconfig
>> +++ b/drivers/platform/x86/Kconfig
>> @@ -210,6 +210,19 @@ config AMD_PMC
>>          If you choose to compile this driver as a module the module will be
>>          called amd-pmc.
>>
>> +config AMD_HSMP
>> +     tristate "AMD HSMP Driver"
>> +     depends on AMD_NB && X86_64
>> +     help
>> +       The driver provides a way for user space tools to monitor and manage
>> +       system management functionality on EPYC server CPUs from AMD.
>> +
>> +       Host System Management Port (HSMP) interface is a mailbox interface
>> +       between the x86 core and the System Management Unit (SMU) firmware.
>> +
>> +       If you choose to compile this driver as a module the module will be
>> +       called amd_hsmp.
>> +
>>   config ADV_SWBUTTON
>>        tristate "Advantech ACPI Software Button Driver"
>>        depends on ACPI && INPUT
>> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
>> index c12a9b044fd8..b3a93a5053a3 100644
>> --- a/drivers/platform/x86/Makefile
>> +++ b/drivers/platform/x86/Makefile
>> @@ -24,6 +24,7 @@ obj-$(CONFIG_ACER_WMI)              += acer-wmi.o
>>
>>   # AMD
>>   obj-$(CONFIG_AMD_PMC)                += amd-pmc.o
>> +obj-$(CONFIG_AMD_HSMP)               += amd_hsmp.o
>>
>>   # Advantech
>>   obj-$(CONFIG_ADV_SWBUTTON)   += adv_swbutton.o
>> diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd_hsmp.c
>> new file mode 100644
>> index 000000000000..a0c54b838c11
>> --- /dev/null
>> +++ b/drivers/platform/x86/amd_hsmp.c
>> @@ -0,0 +1,425 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +/*
>> + * AMD HSMP Platform Driver
>> + * Copyright (c) 2022, AMD.
>> + * All Rights Reserved.
>> + *
>> + * This file provides a device implementation for HSMP interface
>> + */
>> +
>> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
>> +
>> +#include <asm/amd_hsmp.h>
>> +#include <asm/amd_nb.h>
>> +#include <linux/delay.h>
>> +#include <linux/io.h>
>> +#include <linux/miscdevice.h>
>> +#include <linux/module.h>
>> +#include <linux/pci.h>
>> +#include <linux/platform_device.h>
>> +#include <linux/semaphore.h>
>> +
>> +#define DRIVER_NAME          "amd_hsmp"
>> +#define DRIVER_VERSION               "1.0"
>> +
>> +/* HSMP Status / Error codes */
>> +#define HSMP_STATUS_NOT_READY        0x00
>> +#define HSMP_STATUS_OK               0x01
>> +#define HSMP_ERR_INVALID_MSG 0xFE
>> +#define HSMP_ERR_INVALID_INPUT       0xFF
>> +
>> +/* Timeout in millsec */
>> +#define HSMP_MSG_TIMEOUT     100
>> +#define HSMP_SHORT_SLEEP     1
>> +
>> +#define HSMP_WR                      true
>> +#define HSMP_RD                      false
>> +
>> +/*
>> + * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
>> + * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
>> + * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
>> + */
>> +#define SMN_HSMP_MSG_ID              0x3B10534
>> +#define SMN_HSMP_MSG_RESP    0x3B10980
>> +#define SMN_HSMP_MSG_DATA    0x3B109E0
>> +
>> +#define HSMP_INDEX_REG               0xc4
>> +#define HSMP_DATA_REG                0xc8
>> +
>> +static struct semaphore *hsmp_sem;
>> +
>> +static struct miscdevice hsmp_device;
>> +
>> +static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
>> +                      u32 *value, bool write)
>> +{
>> +     int ret;
>> +
>> +     ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
>> +     if (ret)
>> +             return ret;
>> +
>> +     ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
>> +                  : pci_read_config_dword(root, HSMP_DATA_REG, value));
>> +
>> +     return ret;
>> +}
>> +
>> +/*
>> + * Send a message to the HSMP port via PCI-e config space registers.
>> + *
>> + * The caller is expected to zero out any unused arguments.
>> + * If a response is expected, the number of response words should be greater than 0.
>> + *
>> + * Returns 0 for success and populates the requested number of arguments.
>> + * Returns a negative error code for failure.
>> + */
>> +static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
>> +{
>> +     unsigned long timeout, short_sleep;
>> +     u32 mbox_status;
>> +     u32 index;
>> +     int ret;
>> +
>> +     /* Clear the status register */
>> +     mbox_status = HSMP_STATUS_NOT_READY;
>> +     ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
>> +     if (ret) {
>> +             pr_err("Error %d clearing mailbox status register\n", ret);
>> +             return ret;
>> +     }
>> +
>> +     index = 0;
>> +     /* Write any message arguments */
>> +     while (index < msg->num_args) {
>> +             ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
>> +                                 &msg->args[index], HSMP_WR);
>> +             if (ret) {
>> +                     pr_err("Error %d writing message argument %d\n", ret, index);
>> +                     return ret;
>> +             }
>> +             index++;
>> +     }
>> +
>> +     /* Write the message ID which starts the operation */
>> +     ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
>> +     if (ret) {
>> +             pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
>> +             return ret;
>> +     }
>> +
>> +     /*
>> +      * Depending on when the trigger write completes relative to the SMU
>> +      * firmware 1 ms cycle, the operation may take from tens of us to 1 ms
>> +      * to complete. Some operations may take more. Therefore we will try
>> +      * a few short duration sleeps and switch to long sleeps if we don't
>> +      * succeed quickly.
>> +      */
>> +     short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
>> +     timeout = jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
>> +
>> +     while (time_before(jiffies, timeout)) {
>> +             ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
>> +             if (ret) {
>> +                     pr_err("Error %d reading mailbox status\n", ret);
>> +                     return ret;
>> +             }
>> +
>> +             if (mbox_status != HSMP_STATUS_NOT_READY)
>> +                     break;
>> +             if (time_before(jiffies, short_sleep))
>> +                     usleep_range(50, 100);
>> +             else
>> +                     usleep_range(1000, 2000);
>> +     }
>> +
>> +     if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
>> +             return -ETIMEDOUT;
>> +     } else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
>> +             return -ENOMSG;
>> +     } else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
>> +             return -EINVAL;
>> +     } else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
>> +             pr_err("Message ID %u unknown failure (status = 0x%X)\n",
>> +                    msg->msg_id, mbox_status);
>> +             return -EIO;
>> +     }
>> +
>> +     /*
>> +      * SMU has responded OK. Read response data.
>> +      * SMU reads the input arguments from eight 32 bit registers starting
>> +      * from SMN_HSMP_MSG_DATA and writes the response data to the same
>> +      * SMN_HSMP_MSG_DATA address.
>> +      * We copy the response data if any, back to the args[].
>> +      */
>> +     index = 0;
>> +     while (index < msg->response_sz) {
>> +             ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
>> +                                 &msg->args[index], HSMP_RD);
>> +             if (ret) {
>> +                     pr_err("Error %d reading response %u for message ID:%u\n",
>> +                            ret, index, msg->msg_id);
>> +                     break;
>> +             }
>> +             index++;
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>> +static int validate_message(struct hsmp_message *msg)
>> +{
>> +     /* msg_id against valid range of message IDs */
>> +     if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
>> +             return -ENOMSG;
>> +
>> +     /* msg_id is a reserved message ID */
>> +     if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
>> +             return -ENOMSG;
>> +
>> +     /* num_args and response_sz against the HSMP spec */
>> +     if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
>> +         msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
>> +             return -EINVAL;
>> +
>> +     return 0;
>> +}
>> +
>> +int hsmp_send_message(struct hsmp_message *msg)
>> +{
>> +     struct amd_northbridge *nb;
>> +     int ret;
>> +
>> +     if (!msg)
>> +             return -EINVAL;
>> +
>> +     nb = node_to_amd_nb(msg->sock_ind);
>> +     if (!nb || !nb->root)
>> +             return -ENODEV;
>> +
>> +     ret = validate_message(msg);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /*
>> +      * The time taken by smu operation to complete is between
>> +      * 10us to 1ms. Sometime it may take more time.
>> +      * In SMP system timeout of 100 millisecs should
>> +      * be enough for the previous thread to finish the operation
>> +      */
>> +     ret = down_timeout(&hsmp_sem[msg->sock_ind],
>> +                        msecs_to_jiffies(HSMP_MSG_TIMEOUT));
>> +     if (ret < 0)
>> +             return ret;
>> +
>> +     ret = __hsmp_send_message(nb->root, msg);
>> +
>> +     up(&hsmp_sem[msg->sock_ind]);
>> +
>> +     return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(hsmp_send_message);
>> +
>> +static int hsmp_test(u16 sock_ind, u32 value)
>> +{
>> +     struct hsmp_message msg = { 0 };
>> +     struct amd_northbridge *nb;
>> +     int ret = -ENODEV;
>> +
>> +     nb = node_to_amd_nb(sock_ind);
>> +     if (!nb || !nb->root)
>> +             return ret;
>> +
>> +     /*
>> +      * Test the hsmp port by performing TEST command. The test message
>> +      * takes one argument and returns the value of that argument + 1.
>> +      */
>> +     msg.msg_id      = HSMP_TEST;
>> +     msg.num_args    = 1;
>> +     msg.response_sz = 1;
>> +     msg.args[0]     = value;
>> +     msg.sock_ind    = sock_ind;
>> +
>> +     ret = __hsmp_send_message(nb->root, &msg);
>> +     if (ret)
>> +             return ret;
>> +
>> +     /* Check the response value */
>> +     if (msg.args[0] != (value + 1)) {
>> +             pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
>> +                    sock_ind, (value + 1), msg.args[0]);
>> +             return -EBADE;
>> +     }
>> +
>> +     return ret;
>> +}
>> +
>> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
>> +{
>> +     int __user *arguser = (int  __user *)arg;
>> +     struct hsmp_message msg = { 0 };
>> +     int ret;
>> +
>> +     if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
>> +             return -EFAULT;
>> +
>> +     /*
>> +      * Check msg_id is within the range of supported msg ids
>> +      * i.e within the array bounds of hsmp_msg_desc_table
>> +      */
>> +     if (msg.msg_id < HSMP_TEST || msg.msg_id >= HSMP_MSG_ID_MAX)
>> +             return -ENOMSG;
>> +
>> +     switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
>> +     case FMODE_WRITE:
>> +             /*
>> +              * Device is opened in O_WRONLY mode
>> +              * Execute only set/configure commands
>> +              */
>> +             if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
>> +                     return -EINVAL;
>> +             break;
>> +     case FMODE_READ:
>> +             /*
>> +              * Device is opened in O_RDONLY mode
>> +              * Execute only get/monitor commands
>> +              */
>> +             if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
>> +                     return -EINVAL;
>> +             break;
>> +     case FMODE_READ | FMODE_WRITE:
>> +             /*
>> +              * Device is opened in O_RDWR mode
>> +              * Execute both get/monitor and set/configure commands
>> +              */
>> +             break;
>> +     default:
>> +             return -EINVAL;
>> +     }
>> +
>> +     ret = hsmp_send_message(&msg);
>> +     if (ret)
>> +             return ret;
>> +
>> +     if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
>> +             /* Copy results back to user for get/monitor commands */
>> +             if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
>> +                     return -EFAULT;
>> +     }
>> +
>> +     return 0;
>> +}
>> +
>> +static const struct file_operations hsmp_fops = {
>> +     .owner          = THIS_MODULE,
>> +     .unlocked_ioctl = hsmp_ioctl,
>> +     .compat_ioctl   = hsmp_ioctl,
>> +};
>> +
>> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
>> +{
>> +     int i;
>> +
>> +     hsmp_sem = devm_kzalloc(&pdev->dev,
>> +                             (amd_nb_num() * sizeof(struct semaphore)),
>> +                             GFP_KERNEL);
>> +     if (!hsmp_sem)
>> +             return -ENOMEM;
>> +
>> +     for (i = 0; i < amd_nb_num(); i++)
>> +             sema_init(&hsmp_sem[i], 1);
>> +
>> +     hsmp_device.name        = "hsmp_cdev";
>> +     hsmp_device.minor       = MISC_DYNAMIC_MINOR;
>> +     hsmp_device.fops        = &hsmp_fops;
>> +     hsmp_device.parent      = &pdev->dev;
>> +     hsmp_device.nodename    = "hsmp";
>> +     hsmp_device.mode        = 0644;
>> +
>> +     return misc_register(&hsmp_device);
>> +}
>> +
>> +static int hsmp_pltdrv_remove(struct platform_device *pdev)
>> +{
>> +     misc_deregister(&hsmp_device);
>> +
>> +     return 0;
>> +}
>> +
>> +static struct platform_driver amd_hsmp_driver = {
>> +     .probe          = hsmp_pltdrv_probe,
>> +     .remove         = hsmp_pltdrv_remove,
>> +     .driver         = {
>> +             .name   = DRIVER_NAME,
>> +     },
>> +};
>> +
>> +static struct platform_device *amd_hsmp_platdev;
>> +
>> +static int __init hsmp_plt_init(void)
>> +{
>> +     int ret = -ENODEV;
>> +     u16 num_sockets;
>> +     int i;
>> +
>> +     if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
>> +             pr_err("HSMP is not supported on Family:%x model:%x\n",
>> +                    boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +             return ret;
>> +     }
>> +
>> +     /*
>> +      * amd_nb_num() returns number of SMN/DF interfaces present in the system
>> +      * if we have N SMN/DF interfaces that ideally means N sockets
>> +      */
>> +     num_sockets = amd_nb_num();
>> +     if (num_sockets == 0)
>> +             return ret;
>> +
>> +     /* Test the hsmp interface on each socket */
>> +     for (i = 0; i < num_sockets; i++) {
>> +             ret = hsmp_test(i, 0xDEADBEEF);
>> +             if (ret) {
>> +                     pr_err("HSMP is not supported on Fam:%x model:%x\n",
>> +                            boot_cpu_data.x86, boot_cpu_data.x86_model);
>> +                     pr_err("Or Is HSMP disabled in BIOS ?\n");
>> +                     return -EOPNOTSUPP;
>> +             }
>> +     }
>> +
>> +     ret = platform_driver_register(&amd_hsmp_driver);
>> +     if (ret)
>> +             return ret;
>> +
>> +     amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
>> +     if (!amd_hsmp_platdev) {
>> +             ret = -ENOMEM;
>> +             goto drv_unregister;
>> +     }
>> +
>> +     ret = platform_device_add(amd_hsmp_platdev);
>> +     if (ret) {
>> +             platform_device_put(amd_hsmp_platdev);
>> +             goto drv_unregister;
>> +     }
>> +
>> +     return 0;
>> +
>> +drv_unregister:
>> +     platform_driver_unregister(&amd_hsmp_driver);
>> +     return ret;
>> +}
>> +
>> +static void __exit hsmp_plt_exit(void)
>> +{
>> +     platform_device_unregister(amd_hsmp_platdev);
>> +     platform_driver_unregister(&amd_hsmp_driver);
>> +}
>> +
>> +device_initcall(hsmp_plt_init);
>> +module_exit(hsmp_plt_exit);
>> +
>> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
>> +MODULE_VERSION(DRIVER_VERSION);
>> +MODULE_LICENSE("GPL v2");
