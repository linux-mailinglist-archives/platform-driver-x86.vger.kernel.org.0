Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78CC34B945A
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Feb 2022 00:13:19 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236398AbiBPXNa (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Feb 2022 18:13:30 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:51234 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbiBPXN2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Feb 2022 18:13:28 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF43A136869
        for <platform-driver-x86@vger.kernel.org>; Wed, 16 Feb 2022 15:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FIaNBzqSr3oW9tBOYF/wFqB5+mmarR1vby5tNuuFGICX0raVQ6rYQKz6m4t7Ostl5YgGIRUoklyrTRfnTTwg/FMTRzjor/1FjmQcFvqSpql+jYRQ7i3qOmSmaP3biX3+BkS8xeKXu7r84U7nWd3r+MH+U1IePTlNbR9GgHByH2UhIZpVaiHoC4xQK9seHbC28IAPoZiHvjp5wJz1j1Yt3mpNloH9dtSA3Pb9VK97o5ea4hyrrUMYnT/c9d04HqoRGzXY4VCm/0juTtmtyKU9xHM+0FWnhlQri6NTqERNGLMdfdD3co8SQOetxdouyCA3dOv6SloHaFjyuqGFGsa7rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+LerYfd9wi+OJ+fj+FHnWNrRP2SHrqXuHV2tw7n/Y2U=;
 b=cktgDBIbulB1FAWkH1mkuwGAMo5b+ppN5SjRu3u6m25ueMNcy8dokEoWq/VsMe9AW8feZLamNtMXye7kdXohvc4bhjNaMS/VrLh1Y4cebtfzHgpRSgQwwhCYLGhMzYtvXIUYLRLgQ+wvdCJDUirO5pv9ey2zby/DNIN8fxyEBFZnOCPRQyYVrKLVCvJ7c8edTGQcspDSbyreUG7I7USBBC/p00wQUCb5TwUukxBwJHnxsaOOS8hPP/GZwoBJ+qB1tF2ldEaL9hJiIO/Ls5hdqOJ8WAnfgYVdf8taC48DMiUgS0yMI/9i6jNtJft04yX03kJRz7uoU5+s+8lz494PTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+LerYfd9wi+OJ+fj+FHnWNrRP2SHrqXuHV2tw7n/Y2U=;
 b=D1QTtaJQyh6NcxFjU7134i0xI9obgFu6nA6yKg93O1yt4HEjR0LHPwLUmrucJad714wchVvlzt1obT+NV+vfZqAK25GxvLawSW8PWydCaycYHmG/wTNszXhl7zh3vg/YhwLkgXIX1guOrfB6aLkDf4fJEkPCKTpzEO8fnQjTjUU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SN6PR12MB4720.namprd12.prod.outlook.com (2603:10b6:805:e6::31)
 by SN1PR12MB2416.namprd12.prod.outlook.com (2603:10b6:802:2f::30) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4975.14; Wed, 16 Feb
 2022 23:13:07 +0000
Received: from SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c]) by SN6PR12MB4720.namprd12.prod.outlook.com
 ([fe80::f804:7cc6:9f9f:9f2c%6]) with mapi id 15.20.4995.014; Wed, 16 Feb 2022
 23:13:07 +0000
Message-ID: <f0595c3e-14b2-ff7f-2a1e-6c12b60f7df5@amd.com>
Date:   Wed, 16 Feb 2022 17:13:04 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v5 1/2] platforms/x86: Add AMD system management interface
Content-Language: en-US
To:     Naveen Krishna Chatradhi <nchatrad@amd.com>,
        platform-driver-x86@vger.kernel.org
Cc:     hdegoede@redhat.com, carlos.bilbao@amd.com, siva.sathappan@amd.com,
        nathan.fontenot@amd.com, song@kernel.org,
        Suma Hegde <suma.hegde@amd.com>
References: <20220216133336.108810-1-nchatrad@amd.com>
From:   Nathan Fontenot <nafonten@amd.com>
In-Reply-To: <20220216133336.108810-1-nchatrad@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0107.namprd04.prod.outlook.com
 (2603:10b6:610:75::22) To SN6PR12MB4720.namprd12.prod.outlook.com
 (2603:10b6:805:e6::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: f15c2941-3203-43d6-98a6-08d9f1a1e442
X-MS-TrafficTypeDiagnostic: SN1PR12MB2416:EE_
X-Microsoft-Antispam-PRVS: <SN1PR12MB24167B4C60DEFABA3E272044EC359@SN1PR12MB2416.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:233;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: +x8wx24iomMf+1RGlsTYtcE6khur3HhMmYN0JMQt3psJtaNZ/4t9XHP5mX48NVrFcYO9gpZ6+ly2xnFfsjZOrEWnJq1J4eqhb6kEcjTRueOnAskBf6kp9ypRAa/LwUlrss6sGfuqnjmoR17UrDBfx8rsoEoQPoHYZUG0OFoJQ5oQZmg65utf//x0hp+RWBHTDl3mu/QJA6wEdSjCa2wQS9nXNVvZ4KYQm6ES1amGQgJzxUqRmDRvgWhPSaB1NqAvVo1L0gOYUe9nwLhiipYninuq62JfHkuO+QdBL+iDkUoFO84RoA3yX2E/BgQH+S93dA1yc2wWjCa4sbG5nHtmVig3jPhNTuNxVN9mmMqPl6+AC/XPYLe4BaRUeTyZpTKFVbzVNarnCwOSDvsqtFZNc3NdZB9ByL+QjCTLq+nkN4xDkjTCM2n3eCEuyg/9UVdmvQeMZDVTBb2QmHX5LgpS5u17Mm0AJtAmZGLez7wZGdoENLM6tuMkg+3xsZ3AQNxbxyjJPzFGAgKV3dgqR0rMzx2LnaFHUXZd/EdzGWl8yKf7ZksGNN5Hm5W/KFoXvYiZYkZcBqGpdYDuxM3pEw1mUn9qKkZ1M2wamojpmyBJKNPjmpTaB32oZtvQD+yxo0s/489XwNAoftXgEPmJIgeMgsbHUr8FD3BrKIOfMJG93650Dk85TdaroTqEja31rez/nkZR/4VejmqfuR92Z4eP/7gpIOmZsZ8LhNSroTAyx1rrxEIa9cVuSSQKy37uYmLYYwa2YrLeJaXxrER6B1BvPscmsj6xIf07srdVQHeZRy5FAsH8QvhzrsRlqwb/Sdzy
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN6PR12MB4720.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(31696002)(4326008)(2616005)(8676002)(38100700002)(66556008)(30864003)(8936002)(36756003)(66476007)(66946007)(83380400001)(26005)(5660300002)(186003)(508600001)(2906002)(31686004)(6512007)(316002)(6486002)(966005)(53546011)(6666004)(6506007)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z2twQVFxYWZMa0l0T3ljVmNFaG9lRlErbjFoMTBUTFhObUxHSTI1TTZiQkRs?=
 =?utf-8?B?YzVpTUhkNkJiRmFJZXpySHV6VHZHVndNRHp4UCtKWjVMU0lWc0o5aC8zcFRH?=
 =?utf-8?B?NmI3ODN4SVE3MlRqTFg1ZnRQckR0Y1FyV1djZ3R0RExOYy9OSzIxblhSdi94?=
 =?utf-8?B?a21oVUtySlVZZk5uQ3JRdVJ0elBoeFBudVB0eUxvdE0wMU1weXhBK2d6NmRN?=
 =?utf-8?B?QlEzZkxHSDhlRlhWQmRDUGs2VzBIYUNISjNVdjFSeTd4a0YxK0dzWU1SdWFR?=
 =?utf-8?B?aDRrSFR4cStpQW5ScWk5a3BHdG9OSzJNS3NwTTBNTE1FQTNEWU5KS3ZpN25P?=
 =?utf-8?B?MHdTc09ON3gwTVNyV01UUVh3OURtNGt2amZMaURqWUhkY2gxQy81Q25RY1Bs?=
 =?utf-8?B?Zk5TK0x0Rm81L1d6OHpSTDZoWms0SGF3Q1djUUlzMkhWcStyYVpYaTMvRWNy?=
 =?utf-8?B?dkJSQXNtL1BXMnNSOXN4L2xNaUVHVUEzUnB2ekY5alFIbWovOW1xUFlTWDMw?=
 =?utf-8?B?VGxVdlRacjlvZ3FTUnBFMlNZNkRPUlpCYzJSUU00RmZLQzhWdzl5NFk3Wlpi?=
 =?utf-8?B?SDZiK0lMYmsyS3NhemlsMC8yRUd0RkdraE04RjVhS3BjR3dtUmVBMWtUWjAz?=
 =?utf-8?B?bElERkFkcEl1NTMybndMejIzK3p4dnQ5TmxxYzVvdUJnN3BwaWFPSS9BNjZx?=
 =?utf-8?B?YVh6V0ZhVmxTWFJLcEhRNHN0b0dGV1lqdFV0blpKTU5DRjRPcUFZZFJiNXBZ?=
 =?utf-8?B?NXFyN1BCRFc3NEZuRW1qL2ZKUFNiWGF5TlFSeXRYOUJ6RnpTMWpHSEVlVDRh?=
 =?utf-8?B?cXNpTFFydnowVFcyYkg2aUgzeTQ0QzI2bWwxYmdMc1FETGNUM1IyWVBpaEdI?=
 =?utf-8?B?eUZJS0I1aGsxMExtVW1mQnRXaUp1aFhDQ2xITHVqczdSdExTSE5xbHNkVnR5?=
 =?utf-8?B?SHhiWmkyY2dsUEFJVmtJNUV6ZlZTenBlNDk3Zkl3L0pBOFNTM3lhUlU0ZVB2?=
 =?utf-8?B?L1RzTW9zaWo1MGR6YTkwNVJPNmlBc2NZTk1zbkkrd21XdHNWVVRkNlpkdkpH?=
 =?utf-8?B?SklBbjA2bmxtSG5nVnpTTkZPZmFxd1RGWUErKzNXcGNZNFoyMUhEQWR2Mm1U?=
 =?utf-8?B?eTR2cTk1ejR6ZWJIN0RkN0FKdldSM3ZCYWk5R285QU10aHpOcEw4UWxrVC8v?=
 =?utf-8?B?Ynl4T1dKa1dBMmcxMUkvYjJrZDViNlRSbEhOVHJIWG50VXJEN25xUzJGTzhw?=
 =?utf-8?B?TDRtZmZSRk5KOWI3enB3Q29zUXA0dDFOSm1pMnNFUDlveGVhUzFFKzhCSlJm?=
 =?utf-8?B?aGFlVjVwQ0tZR1VaK0Ftekw4Z2xzcFo4aVNtVmZWZ2ZXVTZ3bWdQOUFuRHIw?=
 =?utf-8?B?L0xMSGhYUmR6RkEvYkI3alFNenc5L1BqWm4vem1OamdWVmw2RXdqbmZZNjJM?=
 =?utf-8?B?WXNVSURockhocXhyYmpVUGhrN3VOUkQzWWora2ZQUHlzaFIxZTNhakdoWExB?=
 =?utf-8?B?L3NnZ2pSeEFCY1ozaTFpOGtNbllaaEFwN0poaUJIdDNMWmNuaW1uMDk2ai9H?=
 =?utf-8?B?em84c1l4eXZ3MjdPekZDcXo4ODdPVmkxdU1QMjh2OHBiUkN6UHFBbUJicXM4?=
 =?utf-8?B?SmxUcHk0aGo1OElobk9pank3TFQ2ZzAxRnhrdmhUUWp0RDcyVk85eS91Qmt4?=
 =?utf-8?B?emFGM1UzZ004Y2FiR2RCUXVyUHIyU0lwY0FOQkpoYTNmeXN3QXowZDRNcHJV?=
 =?utf-8?B?NG1lejcwM1U4d3JDUnlhMStERjlnSmNJVlU1elJyeWsvRkNZaWtaa0N6c095?=
 =?utf-8?B?TURWdXoyU1RYNTVvT1lLbkxXSlFqV052UHpac3ZiSk5wY2ZFdjIvNU42QWM5?=
 =?utf-8?B?Z0tPeWtLUmg2bzdEcWdKNVFaR1pGais2S2F1TGtGUk5KU2RxY1RFOWdzUHhR?=
 =?utf-8?B?QVFNOUZTaU9YanRuaHVMMlNPR1lSOVJUcmRhTUVzSjBSQWpTWUN1c3J5UHlI?=
 =?utf-8?B?MWNwUW53WmJEUmdxbTVQNnJEOW5HUWNZVnlYaDBFMzA4Z3d2MS96Q1B3OGU0?=
 =?utf-8?B?blJlWmI5TXFJYlZlQUVSNllTeUovQW92OHkvZ0xGN2lGN2FuRkl3eklqbnZR?=
 =?utf-8?B?MFNnRGJXL3Z1OTVSdFE4WklFeFJBMytwRnRSM25UUDBYcnNIUDJiTTgxaCtQ?=
 =?utf-8?Q?R3SPpsorEEo858QomoH9b1A=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f15c2941-3203-43d6-98a6-08d9f1a1e442
X-MS-Exchange-CrossTenant-AuthSource: SN6PR12MB4720.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2022 23:13:07.6546
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eCJ1XOZ53f92rvMcK+4mchpCqA9jpc3UR9K2NoOlFnj4ff2BsEGk3bk/e4w1h9VsVFWFl0l6ppztdbh1BH5ngw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN1PR12MB2416
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H2,SPF_HELO_PASS,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Other than a few nits below...

Reviewed-by: Nathan Fontenot <nathan.fontenot@amd.com>

On 2/16/22 07:33, Naveen Krishna Chatradhi wrote:
> From: Suma Hegde <suma.hegde@amd.com>
> 
> Recent Fam19h EPYC server line of processors from AMD support system
> management functionality via HSMP (Host System Management Port) interface.
> 
> The Host System Management Port (HSMP) is an interface to provide
> OS-level software with access to system management functions via a
> set of mailbox registers.
> 
> More details on the interface can be found in chapter
> "7 Host System Management Port (HSMP)" of the following PPR
> https://www.amd.com/system/files/TechDocs/55898_B1_pub_0.50.zip
> 
> This patch adds new amd_hsmp module under the drivers/platforms/x86/
> which creates miscdevice with an IOCTL interface to the user space.
> /dev/hsmp is for running the hsmp mailbox commands.
> 
> Signed-off-by: Suma Hegde <suma.hegde@amd.com>
> Signed-off-by: Naveen Krishna Chatradhi <nchatrad@amd.com>
> Reviewed-by: Carlos Bilbao <carlos.bilbao@amd.com>
> ---
> Changes since v4:
> 1. Add description of the messages in the header
> 2. use one set of buf[] array for both arguments and response data
> 3. renamed struct msg_desc_table to hsmp_msg_desc_table
> 4. Correct the names in MAINTAINER to first name last name basis
> 
> Changes since v3:
> remove change ids
> Changes since v2:
> 1. Updated MAINTAINERS page
> 2. Added message description table with num_args, response_sz and type fields.
>    This will be useful for user space applications and the driver
>    to validate the inputs.
> 3. removed the model check and added a statement in the documentation.
> 
> Changes since v1:
> 1. Add supported model check
>    . This interface is supported only on server line of CPUs.
> 2. Handle Reserved messages
> 3. Add brief descriptions of the Messages
> 4. Add Carlos Bilbao's reviewed-by
> 
> 
>  .../userspace-api/ioctl/ioctl-number.rst      |   2 +
>  MAINTAINERS                                   |  10 +
>  arch/x86/include/asm/amd_hsmp.h               |  16 +
>  arch/x86/include/uapi/asm/amd_hsmp.h          | 202 +++++++++
>  drivers/platform/x86/Kconfig                  |  13 +
>  drivers/platform/x86/Makefile                 |   1 +
>  drivers/platform/x86/amd_hsmp.c               | 426 ++++++++++++++++++
>  7 files changed, 670 insertions(+)
>  create mode 100644 arch/x86/include/asm/amd_hsmp.h
>  create mode 100644 arch/x86/include/uapi/asm/amd_hsmp.h
>  create mode 100644 drivers/platform/x86/amd_hsmp.c
> 
> diff --git a/Documentation/userspace-api/ioctl/ioctl-number.rst b/Documentation/userspace-api/ioctl/ioctl-number.rst
> index e6fce2cbd99e..e55d842380ef 100644
> --- a/Documentation/userspace-api/ioctl/ioctl-number.rst
> +++ b/Documentation/userspace-api/ioctl/ioctl-number.rst
> @@ -375,6 +375,8 @@ Code  Seq#    Include File                                           Comments
>                                                                       <mailto:thomas@winischhofer.net>
>  0xF6  all                                                            LTTng Linux Trace Toolkit Next Generation
>                                                                       <mailto:mathieu.desnoyers@efficios.com>
> +0xF8  all    arch/x86/include/uapi/asm/amd_hsmp.h                    AMD HSMP EPYC system management interface driver
> +                                                                     <mailto:nchatrad@amd.com>
>  0xFD  all    linux/dm-ioctl.h
>  0xFE  all    linux/isst_if.h
>  ====  =====  ======================================================= ================================================================
> diff --git a/MAINTAINERS b/MAINTAINERS
> index fca970a46e77..b7d95d5cc650 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -989,6 +989,16 @@ L:	platform-driver-x86@vger.kernel.org
>  S:	Maintained
>  F:	drivers/platform/x86/amd-pmc.*
>  
> +AMD HSMP DRIVER
> +M:	Naveen Krishna Chatradhi <naveenkrishna.chatradhi@amd.com>
> +R:	Carlos Bilbao <carlos.bilbao@amd.com>
> +L:	platform-driver-x86@vger.kernel.org
> +S:	Maintained
> +F:	Documentation/x86/amd_hsmp.rst
> +F:	arch/x86/include/asm/amd_hsmp.h
> +F:	arch/x86/include/uapi/asm/amd_hsmp.h
> +F:	drivers/platform/x86/amd_hsmp.c
> +
>  AMD POWERPLAY AND SWSMU
>  M:	Evan Quan <evan.quan@amd.com>
>  L:	amd-gfx@lists.freedesktop.org
> diff --git a/arch/x86/include/asm/amd_hsmp.h b/arch/x86/include/asm/amd_hsmp.h
> new file mode 100644
> index 000000000000..db2846bb3c37
> --- /dev/null
> +++ b/arch/x86/include/asm/amd_hsmp.h
> @@ -0,0 +1,16 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#ifndef _ASM_X86_AMD_HSMP_H_
> +#define _ASM_X86_AMD_HSMP_H_
> +
> +#include <uapi/asm/amd_hsmp.h>
> +
> +#if (defined(CONFIG_AMD_HSMP) || defined(CONFIG_AMD_HSMP_MODULE))
> +int hsmp_send_message(struct hsmp_message *msg);
> +#else
> +int hsmp_send_message(struct hsmp_message *msg)
> +{
> +	return -ENODEV;
> +}
> +#endif
> +#endif /*_ASM_X86_AMD_HSMP_H_*/
> diff --git a/arch/x86/include/uapi/asm/amd_hsmp.h b/arch/x86/include/uapi/asm/amd_hsmp.h
> new file mode 100644
> index 000000000000..011916d7817e
> --- /dev/null
> +++ b/arch/x86/include/uapi/asm/amd_hsmp.h
> @@ -0,0 +1,202 @@
> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
> +
> +#ifndef _UAPI_ASM_X86_AMD_HSMP_H_
> +#define _UAPI_ASM_X86_AMD_HSMP_H_
> +
> +#include <linux/types.h>
> +
> +#pragma pack(4)
> +
> +#define HSMP_MAX_MSG_LEN 8
> +
> +/*
> + * HSMP Messages supported
> + */
> +enum hsmp_message_ids {
> +	HSMP_TEST = 1,			/* 01h Increments input value by 1 */
> +	HSMP_GET_SMU_VER,		/* 02h SMU FW version */
> +	HSMP_GET_PROTO_VER,		/* 03h HSMP interface version */
> +	HSMP_GET_SOCKET_POWER,		/* 04h average package power consumption */
> +	HSMP_SET_SOCKET_POWER_LIMIT,	/* 05h Set the socket power limit */
> +	HSMP_GET_SOCKET_POWER_LIMIT,	/* 06h Get current socket power limit */
> +	HSMP_GET_SOCKET_POWER_LIMIT_MAX,/* 07h Get maximum socket power value */
> +	HSMP_SET_BOOST_LIMIT,		/* 08h Set a core maximum frequency limit */
> +	HSMP_SET_BOOST_LIMIT_SOCKET,	/* 09h Set socket maximum frequency level */
> +	HSMP_GET_BOOST_LIMIT,		/* 0Ah Get current frequency limit */
> +	HSMP_GET_PROC_HOT,		/* 0Bh Get PROCHOT status */
> +	HSMP_SET_XGMI_LINK_WIDTH,	/* 0Ch Set max and min width of xGMI Link */
> +	HSMP_SET_DF_PSTATE,		/* 0Dh Alter APEnable/Disable messages behavior */
> +	HSMP_SET_AUTO_DF_PSTATE,	/* 0Eh Enable DF P-State Performance Boost algorithm */
> +	HSMP_GET_FCLK_MCLK,		/* 0Fh Get FCLK and MEMCLK for current socket */
> +	HSMP_GET_CCLK_THROTTLE_LIMIT,	/* 10h Get CCLK frequency limit in socket */
> +	HSMP_GET_C0_PERCENT,		/* 11h Get average C0 residency in socket */
> +	HSMP_SET_NBIO_DPM_LEVEL,	/* 12h Set max/min LCLK DPM Level for a given NBIO */
> +					/* 13h Reserved */
> +	HSMP_GET_DDR_BANDWIDTH = 0x14,	/* 14h Get theoretical maximum and current DDR Bandwidth */
> +	HSMP_GET_TEMP_MONITOR,		/* 15h Get per-DIMM temperature and refresh rates */
> +	HSMP_MSG_ID_MAX,
> +};
> +
> +struct hsmp_message {
> +	__u32	msg_id;			/* Message ID */
> +	__u16	num_args;		/* Number of input argument words in message */
> +	__u16	response_sz;		/* Number of expected output/response words */
> +	__u32	buf[HSMP_MAX_MSG_LEN];	/* argument/response buffer */
> +	__u16	sock_ind;		/* socket number */
> +};
> +
> +enum hsmp_msg_type {
> +	HSMP_RSVD = -1,
> +	HSMP_SET  = 0,
> +	HSMP_GET  = 1,
> +};
> +
> +struct hsmp_msg_desc {
> +	int num_args;
> +	int response_sz;
> +	enum hsmp_msg_type type;
> +};
> +
> +/*
> + * User may use these comments as reference, please find the
> + * supported list of messages and message definition in the
> + * HSMP chapter of respective family/model PPR.
> + *
> + * Not supported messages would return -ENOMSG.
> + */
> +static const struct hsmp_msg_desc hsmp_msg_desc_table[] = {
> +	/* RESERVED */
> +	{0, 0, HSMP_RSVD},
> +
> +	/*
> +	 * HSMP_TEST, num_args = 1, response_sz = 1
> +	 * input:  args[0] = xx
> +	 * output: args[0] = xx + 1
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SMU_VER, num_args = 0, response_sz = 1
> +	 * output: args[0] = smu fw ver
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_PROTO_VER, num_args = 0, response_sz = 1
> +	 * output: args[0] = proto version
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SOCKET_POWER, num_args = 0, response_sz = 1
> +	 * output: args[0] = socket power in mWatts
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_SOCKET_POWER_LIMIT, num_args = 1, response_sz = 0
> +	 * input: args[0] = power limit value in mWatts
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_GET_SOCKET_POWER_LIMIT, num_args = 0, response_sz = 1
> +	 * output: args[0] = socket power limit value in mWatts
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_SOCKET_POWER_LIMIT_MAX, num_args = 0, response_sz = 1
> +	 * output: args[0] = maximuam socket power limit in mWatts
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_BOOST_LIMIT, num_args = 1, response_sz = 0
> +	 * input: args[0] = apic id[31:16] + boost limit value in MHz[15:0]
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SET_BOOST_LIMIT_SOCKET, num_args = 1, response_sz = 0
> +	 * input: args[0] = boost limit value in MHz
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_GET_BOOST_LIMIT, num_args = 1, response_sz = 1
> +	 * input: args[0] = apic id
> +	 * output: args[0] = boost limit value in MHz
> +	 */
> +	{1, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_PROC_HOT num_args = 0, response_sz = 1
> +	 * output: args[0] = proc hot status
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_XGMI_LINK_WIDTH, num_args = 1, response_sz = 0
> +	 * input: args[0] = xgmi link width
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_SET_DF_PSTATE, num_args = 1, response_sz = 0
> +	 * input: args[0] = df pstate
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/* HSMP_SET_AUTO_DF_PSTATE, num_args = 0, response_sz = 0 */
> +	{0, 0, HSMP_SET},
> +
> +	/*
> +	 * HSMP_GET_FCLK_MCLK, num_args = 0, response_sz = 2
> +	 * output: args[0] = fclk in MHz, args[1] = mclk in MHz
> +	 */
> +	{0, 2, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_CCLK_THROTTLE_LIMIT, num_args = 0, response_sz = 1
> +	 * output: args[0] = core clock in MHz
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_C0_PERCENT, num_args = 0, response_sz = 1
> +	 * output: args[0] = average c0 residency
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_SET_NBIO_DPM_LEVEL, num_args = 1, response_sz = 0
> +	 * input: args[0] = nbioid[23:16] + max dpm level[15:8] + min dpm level[7:0]
> +	 */
> +	{1, 0, HSMP_SET},
> +
> +	/* RESERVED message */
> +	{0, 0, HSMP_RSVD},
> +
> +	/*
> +	 * HSMP_GET_DDR_BANDWIDTH, num_args = 0, response_sz = 1
> +	 * output: args[0] max bw[31:20] + utilised bw[19:8] + bw in percentage[7:0]
> +	 */
> +	{0, 1, HSMP_GET},
> +
> +	/*
> +	 * HSMP_GET_TEMP_MONITOR num_args = 0, response_sz = 1
> +	 * output: args[0] temperature in degree celcius. [15:8] integer part +

s/celcius/celsius/

> +	 * [7:5] fractional part
> +	 */
> +	{0, 1, HSMP_GET},
> +};
> +
> +/* Reset to default packing */
> +#pragma pack()
> +
> +/* Define unique ioctl command for hsmp msgs using generic _IOWR */
> +#define HSMP_BASE_IOCTL_NR	0xF8
> +#define HSMP_IOCTL_CMD		_IOWR(HSMP_BASE_IOCTL_NR, 0, struct hsmp_message)
> +
> +#endif /*_ASM_X86_AMD_HSMP_H_*/
> diff --git a/drivers/platform/x86/Kconfig b/drivers/platform/x86/Kconfig
> index 24deeeb29af2..0906c36ea07b 100644
> --- a/drivers/platform/x86/Kconfig
> +++ b/drivers/platform/x86/Kconfig
> @@ -210,6 +210,19 @@ config AMD_PMC
>  	  If you choose to compile this driver as a module the module will be
>  	  called amd-pmc.
>  
> +config AMD_HSMP
> +	tristate "AMD HSMP Driver"
> +	depends on AMD_NB && X86_64
> +	help
> +	  The driver provides a way for user space tools to monitor and manage
> +	  system management functionality on EPYC server CPUs from AMD.
> +
> +	  Host System Management Port (HSMP) interface is a mailbox interface
> +	  between the x86 core and the System Management Unit (SMU) firmware.
> +
> +	  If you choose to compile this driver as a module the module will be
> +	  called amd_hsmp.
> +
>  config ADV_SWBUTTON
>  	tristate "Advantech ACPI Software Button Driver"
>  	depends on ACPI && INPUT
> diff --git a/drivers/platform/x86/Makefile b/drivers/platform/x86/Makefile
> index c12a9b044fd8..b3a93a5053a3 100644
> --- a/drivers/platform/x86/Makefile
> +++ b/drivers/platform/x86/Makefile
> @@ -24,6 +24,7 @@ obj-$(CONFIG_ACER_WMI)		+= acer-wmi.o
>  
>  # AMD
>  obj-$(CONFIG_AMD_PMC)		+= amd-pmc.o
> +obj-$(CONFIG_AMD_HSMP)		+= amd_hsmp.o
>  
>  # Advantech
>  obj-$(CONFIG_ADV_SWBUTTON)	+= adv_swbutton.o
> diff --git a/drivers/platform/x86/amd_hsmp.c b/drivers/platform/x86/amd_hsmp.c
> new file mode 100644
> index 000000000000..15b94e1d7443
> --- /dev/null
> +++ b/drivers/platform/x86/amd_hsmp.c
> @@ -0,0 +1,426 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * AMD HSMP Platform Driver
> + * Copyright (c) 2022, AMD.
> + * All Rights Reserved.
> + *
> + * This file provides a device implementation for HSMP interface
> + */
> +
> +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> +
> +#include <asm/amd_hsmp.h>
> +#include <asm/amd_nb.h>
> +#include <linux/delay.h>
> +#include <linux/io.h>
> +#include <linux/miscdevice.h>
> +#include <linux/module.h>
> +#include <linux/pci.h>
> +#include <linux/platform_device.h>
> +#include <linux/semaphore.h>
> +
> +#define DRIVER_NAME		"amd_hsmp"
> +#define DRIVER_VERSION		"1.0"
> +
> +/* HSMP Status / Error codes */
> +#define HSMP_STATUS_NOT_READY	0x00
> +#define HSMP_STATUS_OK		0x01
> +#define HSMP_ERR_INVALID_MSG	0xFE
> +#define HSMP_ERR_INVALID_INPUT	0xFF
> +
> +/* Timeout in millsec */
> +#define HSMP_MSG_TIMEOUT	100
> +#define HSMP_SHORT_SLEEP	1
> +
> +#define HSMP_WR			true
> +#define HSMP_RD			false
> +
> +/*
> + * To access specific HSMP mailbox register, s/w writes the SMN address of HSMP mailbox
> + * register into the SMN_INDEX register, and reads/writes the SMN_DATA reg.
> + * Below are required SMN address for HSMP Mailbox register offsets in SMU address space
> + */
> +#define SMN_HSMP_MSG_ID		0x3B10534
> +#define SMN_HSMP_MSG_RESP	0x3B10980
> +#define SMN_HSMP_MSG_DATA	0x3B109E0
> +
> +#define HSMP_INDEX_REG		0xc4
> +#define HSMP_DATA_REG		0xc8
> +
> +static struct semaphore *hsmp_sem;
> +
> +static struct miscdevice hsmp_device;
> +
> +static int amd_hsmp_rdwr(struct pci_dev *root, u32 address,
> +			 u32 *value, bool write)
> +{
> +	int ret;
> +
> +	ret = pci_write_config_dword(root, HSMP_INDEX_REG, address);
> +	if (ret)
> +		return ret;
> +
> +	ret = (write ? pci_write_config_dword(root, HSMP_DATA_REG, *value)
> +		     : pci_read_config_dword(root, HSMP_DATA_REG, value));
> +
> +	return ret;
> +}
> +
> +/*
> + * Send a message to the HSMP port via PCI-e config space registers.
> + *
> + * The caller is expected to zero out any unused arguments.
> + * If a response is expected, the number of response words should be greater than 0.
> + *
> + * Returns 0 for success and populates the requested number of arguments.
> + * Returns a negative error code for failure.
> + */
> +static int __hsmp_send_message(struct pci_dev *root, struct hsmp_message *msg)
> +{
> +	unsigned long timeout, short_sleep;
> +	u32 mbox_status;
> +	u32 index;
> +	int ret;
> +
> +	/* Clear the status register */
> +	mbox_status = HSMP_STATUS_NOT_READY;
> +	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_WR);
> +	if (ret) {
> +		pr_err("Error %d clearing mailbox status register\n", ret);
> +		return ret;
> +	}
> +
> +	index = 0;
> +	/* Write any message arguments */
> +	while (index < msg->num_args) {
> +		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
> +				    &msg->buf[index], HSMP_WR);
> +		if (ret) {
> +			pr_err("Error %d writing message argument %d\n", ret, index);
> +			return ret;
> +		}
> +		index++;
> +	}
> +
> +	/* Write the message ID which starts the operation */
> +	ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_ID, &msg->msg_id, HSMP_WR);
> +	if (ret) {
> +		pr_err("Error %d writing message ID %u\n", ret, msg->msg_id);
> +		return ret;
> +	}
> +
> +	/*
> +	 * Depending on when the trigger write completes relative to the SMU
> +	 * firmware 1 ms cycle, the operation may take from tens of us to 1 ms
> +	 * to complete. Some operations may take more. Therefore we will try
> +	 * a few short duration sleeps and switch to long sleeps if we don't
> +	 * succeed quickly.
> +	 */
> +	short_sleep = jiffies + msecs_to_jiffies(HSMP_SHORT_SLEEP);
> +	timeout	= jiffies + msecs_to_jiffies(HSMP_MSG_TIMEOUT);
> +
> +	while (time_before(jiffies, timeout)) {
> +		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_RESP, &mbox_status, HSMP_RD);
> +		if (ret) {
> +			pr_err("Error %d reading mailbox status\n", ret);
> +			return ret;
> +		}
> +
> +		if (mbox_status != HSMP_STATUS_NOT_READY)
> +			break;
> +		if (time_before(jiffies, short_sleep))
> +			usleep_range(50, 100);
> +		else
> +			usleep_range(1000, 2000);
> +	}
> +
> +	if (unlikely(mbox_status == HSMP_STATUS_NOT_READY)) {
> +		return -ETIMEDOUT;
> +	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_MSG)) {
> +		return -ENOMSG;
> +	} else if (unlikely(mbox_status == HSMP_ERR_INVALID_INPUT)) {
> +		return -EINVAL;
> +	} else if (unlikely(mbox_status != HSMP_STATUS_OK)) {
> +		pr_err("Message ID %u unknown failure (status = 0x%X)\n",
> +		       msg->msg_id, mbox_status);
> +		return -EIO;
> +	}
> +
> +	/*
> +	 * SMU has responded OK. Read response data.
> +	 * SMU reads the input arguments from eight 32 bit registers starting
> +	 * from SMN_HSMP_MSG_DATA and writes the response data to the same
> +	 * SMN_HSMP_MSG_DATA address.
> +	 * We copy the response data if any, back to the buf[].
> +	 */
> +	index = 0;
> +	while (index < msg->response_sz) {
> +		ret = amd_hsmp_rdwr(root, SMN_HSMP_MSG_DATA + (index << 2),
> +				    &msg->buf[index], HSMP_RD);
> +		if (ret) {
> +			pr_err("Error %d reading response %u for message ID:%u\n",
> +			       ret, index, msg->msg_id);
> +			break;
> +		}
> +		index++;
> +	}
> +
> +	return ret;
> +}
> +
> +static int validate_message(struct hsmp_message *msg)
> +{
> +	/* msg_id against valid range of message IDs */
> +	if (msg->msg_id < HSMP_TEST || msg->msg_id >= HSMP_MSG_ID_MAX)
> +		return -ENOMSG;
> +
> +	/* msg_id is a reserved message ID */
> +	if (hsmp_msg_desc_table[msg->msg_id].type == HSMP_RSVD)
> +		return -ENOMSG;
> +
> +	/* num_args and response_sz against the HSMP spec */
> +	if (msg->num_args != hsmp_msg_desc_table[msg->msg_id].num_args ||
> +	    msg->response_sz != hsmp_msg_desc_table[msg->msg_id].response_sz)
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
> +int hsmp_send_message(struct hsmp_message *msg)
> +{
> +	struct amd_northbridge *nb;
> +	int ret;
> +
> +	if (!msg)
> +		return -EINVAL;
> +
> +	nb = node_to_amd_nb(msg->sock_ind);
> +	if (!nb || !nb->root)
> +		return -ENODEV;
> +
> +	ret = validate_message(msg);
> +	if (ret)
> +		return ret;
> +
> +	/*
> +	 * The time taken by smu operation to complete is between
> +	 * 10us to 1ms. Sometime it may take more time.
> +	 * In SMP system timeout of 100 millisecs should
> +	 * be enough for the previous thread to finish the operation
> +	 */
> +	ret = down_timeout(&hsmp_sem[msg->sock_ind],
> +			   msecs_to_jiffies(HSMP_MSG_TIMEOUT));
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = __hsmp_send_message(nb->root, msg);
> +
> +	up(&hsmp_sem[msg->sock_ind]);
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(hsmp_send_message);
> +
> +static int hsmp_test(u16 sock_ind, u32 value)
> +{
> +	struct hsmp_message msg = { 0 };
> +	struct amd_northbridge *nb;
> +	int ret = -ENODEV;
> +
> +	nb = node_to_amd_nb(sock_ind);
> +	if (!nb || !nb->root)
> +		return ret;
> +
> +	/*
> +	 * Test the hsmp port by performing TEST command. The test message
> +	 * takes one argument and returns the value of that argument + 1.
> +	 */
> +	msg.msg_id	= HSMP_TEST;
> +	msg.num_args	= 1;
> +	msg.response_sz	= 1;
> +	msg.buf[0]	= value;
> +	msg.sock_ind	= sock_ind;
> +
> +	ret = __hsmp_send_message(nb->root, &msg);
> +	if (ret)
> +		return ret;
> +
> +	/* Check the response value */
> +	if (msg.buf[0] != (value + 1)) {
> +		pr_err("Socket %d test message failed, Expected 0x%08X, received 0x%08X\n",
> +		       sock_ind, (value + 1), msg.buf[0]);
> +		return -EBADE;
> +	}
> +
> +	return ret;
> +}
> +
> +static long hsmp_ioctl(struct file *fp, unsigned int cmd, unsigned long arg)
> +{
> +	int __user *arguser = (int  __user *)arg;
> +	struct hsmp_message msg = { 0 };
> +	int ret;
> +
> +	if (copy_struct_from_user(&msg, sizeof(msg), arguser, sizeof(struct hsmp_message)))
> +		return -EFAULT;
> +
> +	ret = validate_message(&msg);
> +	if (ret)
> +		return ret;
> +
> +	switch (fp->f_mode & (FMODE_WRITE | FMODE_READ)) {
> +	case FMODE_WRITE:
> +		/*
> +		 * Device is opened in O_WRONLY mode
> +		 * Execute only set/configure commands
> +		 */
> +		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_SET)
> +			return -EINVAL;
> +		break;
> +	case FMODE_READ:
> +		/*
> +		 * Device is opened in O_RDONLY mode
> +		 * Execute only get/monitor commands
> +		 */
> +		if (hsmp_msg_desc_table[msg.msg_id].type != HSMP_GET)
> +			return -EINVAL;
> +		break;
> +	case FMODE_READ | FMODE_WRITE:
> +		/*
> +		 * Device is opened in O_RDWR mode
> +		 * Execute both get/monitor and set/configure commands
> +		 */
> +		break;
> +	default:
> +		return -EINVAL;
> +	}
> +
> +	ret =  hsmp_send_message(&msg);             ^^
You have an extra space here.

> +	if (ret)
> +		return ret;
> +
> +	if (hsmp_msg_desc_table[msg.msg_id].response_sz > 0) {
> +		/* Copy results back to user for get/monitor commands */
> +		if (copy_to_user(arguser, &msg, sizeof(struct hsmp_message)))
> +			return -EFAULT;
> +	}
> +
> +	return 0;
> +}
> +
> +static const struct file_operations hsmp_fops = {
> +	.owner		= THIS_MODULE,
> +	.unlocked_ioctl	= hsmp_ioctl,
> +	.compat_ioctl	= hsmp_ioctl,
> +};
> +
> +static int hsmp_pltdrv_probe(struct platform_device *pdev)
> +{
> +	int ret, i;
> +
> +	hsmp_sem = devm_kzalloc(&pdev->dev,
> +				(amd_nb_num() * sizeof(struct semaphore)),
> +				GFP_KERNEL);
> +	if (!hsmp_sem)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < amd_nb_num(); i++)
> +		sema_init(&hsmp_sem[i], 1);
> +
> +	hsmp_device.name	= "hsmp_cdev";
> +	hsmp_device.minor	= MISC_DYNAMIC_MINOR;
> +	hsmp_device.fops	= &hsmp_fops;
> +	hsmp_device.parent	= &pdev->dev;
> +	hsmp_device.nodename	= "hsmp";
> +	hsmp_device.mode	= 0644;
> +
> +	ret = misc_register(&hsmp_device);

You could just do,

	return ret;

-Nathan

> +	if (ret)
> +		return ret;
> +
> +	return 0;
> +}
> +
> +static int hsmp_pltdrv_remove(struct platform_device *pdev)
> +{
> +	misc_deregister(&hsmp_device);
> +
> +	return 0;
> +}
> +
> +static struct platform_driver amd_hsmp_driver = {
> +	.probe		= hsmp_pltdrv_probe,
> +	.remove		= hsmp_pltdrv_remove,
> +	.driver		= {
> +		.name	= DRIVER_NAME,
> +	},
> +};
> +
> +static struct platform_device *amd_hsmp_platdev;
> +
> +static int __init hsmp_plt_init(void)
> +{
> +	int ret = -ENODEV;
> +	u16 num_sockets;
> +	int i;
> +
> +	if (boot_cpu_data.x86_vendor != X86_VENDOR_AMD || boot_cpu_data.x86 < 0x19) {
> +		pr_err("HSMP is not supported on Family:%x model:%x\n",
> +		       boot_cpu_data.x86, boot_cpu_data.x86_model);
> +		return ret;
> +	}
> +
> +	/*
> +	 * amd_nb_num() returns number of SMN/DF interfaces present in the system
> +	 * if we have N SMN/DF interfaces that ideally means N sockets
> +	 */
> +	num_sockets = amd_nb_num();
> +	if (num_sockets == 0)
> +		return ret;
> +
> +	/* Test the hsmp interface on each socket */
> +	for (i = 0; i < num_sockets; i++) {
> +		ret = hsmp_test(i, 0xDEADBEEF);
> +		if (ret) {
> +			pr_err("HSMP is not supported on Fam:%x model:%x\n",
> +			       boot_cpu_data.x86, boot_cpu_data.x86_model);
> +			pr_err("Or Is HSMP disabled in BIOS ?\n");
> +			return -EOPNOTSUPP;
> +		}
> +	}
> +
> +	ret = platform_driver_register(&amd_hsmp_driver);
> +	if (ret)
> +		return ret;
> +
> +	amd_hsmp_platdev = platform_device_alloc(DRIVER_NAME, -1);
> +	if (!amd_hsmp_platdev) {
> +		ret = -ENOMEM;
> +		goto drv_unregister;
> +	}
> +
> +	ret = platform_device_add(amd_hsmp_platdev);
> +	if (ret) {
> +		platform_device_put(amd_hsmp_platdev);
> +		goto drv_unregister;
> +	}
> +
> +	return 0;
> +
> +drv_unregister:
> +	platform_driver_unregister(&amd_hsmp_driver);
> +	return ret;
> +}
> +
> +static void __exit hsmp_plt_exit(void)
> +{
> +	platform_device_unregister(amd_hsmp_platdev);
> +	platform_driver_unregister(&amd_hsmp_driver);
> +}
> +
> +device_initcall(hsmp_plt_init);
> +module_exit(hsmp_plt_exit);
> +
> +MODULE_DESCRIPTION("AMD HSMP Platform Interface Driver");
> +MODULE_VERSION(DRIVER_VERSION);
> +MODULE_LICENSE("GPL v2");
