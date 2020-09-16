Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84A6026CE41
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Sep 2020 00:04:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726378AbgIPWEx (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 16 Sep 2020 18:04:53 -0400
Received: from mx0b-002e3701.pphosted.com ([148.163.143.35]:34278 "EHLO
        mx0b-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725267AbgIPWEx (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 16 Sep 2020 18:04:53 -0400
Received: from pps.filterd (m0134425.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 08GLFtCW024805;
        Wed, 16 Sep 2020 21:19:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=date : from : to : cc :
 subject : message-id : references : mime-version : content-type :
 in-reply-to; s=pps0720; bh=556W1zaO6BQLNwTX7ARdw1aykDoHcOnGVIKoe9xi8MQ=;
 b=PEsKIK6//6SGg/8z4nqQNUBC/IASELFw3j7wmIqVMmmEMrS63moX6Ham44Mz0KnXl1F8
 tHeXuK28MtPq557onc0pqKRifboLw5Fv3UruiAmryopABqczVWjlLsMAJoi/3jWV7zXb
 EvSmRTc33SzU8ZrfxLse7JF2VnS1U9Pk5aqRCIKmDapFTn+nH1ke5UP0fyiyyy/1vuq1
 xhbO11ewocadofJQkiT4vo9cYPX5sin176gDfRKtxiBf3f9CPOATOsWcMwUZef63PXF4
 kGgZH7P2rxoJsdv+seSX5wuGTi2p3obv6riRtJJnwbVPK6kFzgYAiERYrgMkmd5K3abs HQ== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 33k5p3c7nu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 16 Sep 2020 21:19:57 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id AFC4258;
        Wed, 16 Sep 2020 21:19:56 +0000 (UTC)
Received: from swahl-home.5wahls.com (unknown [16.214.129.22])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id A729748;
        Wed, 16 Sep 2020 21:19:53 +0000 (UTC)
Date:   Wed, 16 Sep 2020 16:19:53 -0500
From:   Steve Wahl <steve.wahl@hpe.com>
To:     Mike Travis <mike.travis@hpe.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Jian Cai <caij2003@gmail.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v2 01/13] x86/platform/uv: Remove UV BAU TLB Shootdown
 Handler
Message-ID: <20200916211953.GQ362364@swahl-home.5wahls.com>
References: <20200916192039.162934-1-mike.travis@hpe.com>
 <20200916192039.162934-2-mike.travis@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200916192039.162934-2-mike.travis@hpe.com>
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-09-16_13:2020-09-16,2020-09-16 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 mlxlogscore=999 suspectscore=5 impostorscore=0 spamscore=0 mlxscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2009160155
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Acked-by: Steve	Wahl <steve.wahl@hpe.com>

On Wed, Sep 16, 2020 at 02:20:27PM -0500, Mike Travis wrote:
> The Broadcast Assist Unit (BAU) TLB shootdown handler is being rewritten
> to become the UV BAU APIC driver.  It is designed to speed up sending
> IPI's to selective CPUs within the system.  Remove the current TLB
> shutdown handler (tlb_uv.c) file and a couple of kernel hooks in the
> interim.
> 
> Signed-off-by: Mike Travis <mike.travis@hpe.com>
> Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
> ---
>  arch/x86/include/asm/idtentry.h  |    4 -
>  arch/x86/include/asm/uv/uv.h     |    4 +-
>  arch/x86/include/asm/uv/uv_bau.h |  755 -----------
>  arch/x86/kernel/idt.c            |    3 -
>  arch/x86/mm/tlb.c                |   24 -
>  arch/x86/platform/uv/Makefile    |    2 +-
>  arch/x86/platform/uv/tlb_uv.c    | 2097 ------------------------------
>  7 files changed, 2 insertions(+), 2887 deletions(-)
>  delete mode 100644 arch/x86/include/asm/uv/uv_bau.h
>  delete mode 100644 arch/x86/platform/uv/tlb_uv.c
> 
> diff --git a/arch/x86/include/asm/idtentry.h b/arch/x86/include/asm/idtentry.h
> index a43366191212..27485af16008 100644
> --- a/arch/x86/include/asm/idtentry.h
> +++ b/arch/x86/include/asm/idtentry.h
> @@ -591,10 +591,6 @@ DECLARE_IDTENTRY_SYSVEC(CALL_FUNCTION_VECTOR,		sysvec_call_function);
>  #endif
>  
>  #ifdef CONFIG_X86_LOCAL_APIC
> -# ifdef CONFIG_X86_UV
> -DECLARE_IDTENTRY_SYSVEC(UV_BAU_MESSAGE,			sysvec_uv_bau_message);
> -# endif
> -
>  # ifdef CONFIG_X86_MCE_THRESHOLD
>  DECLARE_IDTENTRY_SYSVEC(THRESHOLD_APIC_VECTOR,		sysvec_threshold);
>  # endif
> diff --git a/arch/x86/include/asm/uv/uv.h b/arch/x86/include/asm/uv/uv.h
> index e48aea9ba47d..172d3e4a9e4b 100644
> --- a/arch/x86/include/asm/uv/uv.h
> +++ b/arch/x86/include/asm/uv/uv.h
> @@ -35,10 +35,8 @@ extern int is_uv_hubbed(int uvtype);
>  extern void uv_cpu_init(void);
>  extern void uv_nmi_init(void);
>  extern void uv_system_init(void);
> -extern const struct cpumask *uv_flush_tlb_others(const struct cpumask *cpumask,
> -						 const struct flush_tlb_info *info);
>  
> -#else	/* X86_UV */
> +#else	/* !X86_UV */
>  
>  static inline enum uv_system_type get_uv_system_type(void) { return UV_NONE; }
>  static inline bool is_early_uv_system(void)	{ return 0; }
> diff --git a/arch/x86/include/asm/uv/uv_bau.h b/arch/x86/include/asm/uv/uv_bau.h
> deleted file mode 100644
> index cd24804955d7..000000000000
> --- a/arch/x86/include/asm/uv/uv_bau.h
> +++ /dev/null
> @@ -1,755 +0,0 @@
> -/*
> - * This file is subject to the terms and conditions of the GNU General Public
> - * License.  See the file "COPYING" in the main directory of this archive
> - * for more details.
> - *
> - * SGI UV Broadcast Assist Unit definitions
> - *
> - * Copyright (C) 2008-2011 Silicon Graphics, Inc. All rights reserved.
> - */
> -
> -#ifndef _ASM_X86_UV_UV_BAU_H
> -#define _ASM_X86_UV_UV_BAU_H
> -
> -#include <linux/bitmap.h>
> -#include <asm/idtentry.h>
> -
> -#define BITSPERBYTE 8
> -
> -/*
> - * Broadcast Assist Unit messaging structures
> - *
> - * Selective Broadcast activations are induced by software action
> - * specifying a particular 8-descriptor "set" via a 6-bit index written
> - * to an MMR.
> - * Thus there are 64 unique 512-byte sets of SB descriptors - one set for
> - * each 6-bit index value. These descriptor sets are mapped in sequence
> - * starting with set 0 located at the address specified in the
> - * BAU_SB_DESCRIPTOR_BASE register, set 1 is located at BASE + 512,
> - * set 2 is at BASE + 2*512, set 3 at BASE + 3*512, and so on.
> - *
> - * We will use one set for sending BAU messages from each of the
> - * cpu's on the uvhub.
> - *
> - * TLB shootdown will use the first of the 8 descriptors of each set.
> - * Each of the descriptors is 64 bytes in size (8*64 = 512 bytes in a set).
> - */
> -
> -#define MAX_CPUS_PER_UVHUB		128
> -#define MAX_CPUS_PER_SOCKET		64
> -#define ADP_SZ				64 /* hardware-provided max. */
> -#define UV_CPUS_PER_AS			32 /* hardware-provided max. */
> -#define ITEMS_PER_DESC			8
> -/* the 'throttle' to prevent the hardware stay-busy bug */
> -#define MAX_BAU_CONCURRENT		3
> -#define UV_ACT_STATUS_MASK		0x3
> -#define UV_ACT_STATUS_SIZE		2
> -#define UV_DISTRIBUTION_SIZE		256
> -#define UV_SW_ACK_NPENDING		8
> -#define UV_NET_ENDPOINT_INTD		0x28
> -#define UV_PAYLOADQ_GNODE_SHIFT		49
> -#define UV_PTC_BASENAME			"sgi_uv/ptc_statistics"
> -#define UV_BAU_BASENAME			"sgi_uv/bau_tunables"
> -#define UV_BAU_TUNABLES_DIR		"sgi_uv"
> -#define UV_BAU_TUNABLES_FILE		"bau_tunables"
> -#define WHITESPACE			" \t\n"
> -#define cpubit_isset(cpu, bau_local_cpumask) \
> -	test_bit((cpu), (bau_local_cpumask).bits)
> -
> -/* [19:16] SOFT_ACK timeout period  19: 1 is urgency 7  17:16 1 is multiplier */
> -/*
> - * UV2: Bit 19 selects between
> - *  (0): 10 microsecond timebase and
> - *  (1): 80 microseconds
> - *  we're using 560us
> - */
> -#define UV_INTD_SOFT_ACK_TIMEOUT_PERIOD	(15UL)
> -/* assuming UV3 is the same */
> -
> -#define BAU_MISC_CONTROL_MULT_MASK	3
> -
> -#define UVH_AGING_PRESCALE_SEL		0x000000b000UL
> -/* [30:28] URGENCY_7  an index into a table of times */
> -#define BAU_URGENCY_7_SHIFT		28
> -#define BAU_URGENCY_7_MASK		7
> -
> -#define UVH_TRANSACTION_TIMEOUT		0x000000b200UL
> -/* [45:40] BAU - BAU transaction timeout select - a multiplier */
> -#define BAU_TRANS_SHIFT			40
> -#define BAU_TRANS_MASK			0x3f
> -
> -/*
> - * shorten some awkward names
> - */
> -#define AS_PUSH_SHIFT UVH_LB_BAU_SB_ACTIVATION_CONTROL_PUSH_SHFT
> -#define SOFTACK_MSHIFT UVH_LB_BAU_MISC_CONTROL_ENABLE_INTD_SOFT_ACK_MODE_SHFT
> -#define SOFTACK_PSHIFT UVH_LB_BAU_MISC_CONTROL_INTD_SOFT_ACK_TIMEOUT_PERIOD_SHFT
> -#define SOFTACK_TIMEOUT_PERIOD UV_INTD_SOFT_ACK_TIMEOUT_PERIOD
> -#define PREFETCH_HINT_SHFT UV3H_LB_BAU_MISC_CONTROL_ENABLE_INTD_PREFETCH_HINT_SHFT
> -#define SB_STATUS_SHFT UV3H_LB_BAU_MISC_CONTROL_ENABLE_EXTENDED_SB_STATUS_SHFT
> -#define write_gmmr	uv_write_global_mmr64
> -#define write_lmmr	uv_write_local_mmr
> -#define read_lmmr	uv_read_local_mmr
> -#define read_gmmr	uv_read_global_mmr64
> -
> -/*
> - * bits in UVH_LB_BAU_SB_ACTIVATION_STATUS_0/1
> - */
> -#define DS_IDLE				0
> -#define DS_ACTIVE			1
> -#define DS_DESTINATION_TIMEOUT		2
> -#define DS_SOURCE_TIMEOUT		3
> -/*
> - * bits put together from HRP_LB_BAU_SB_ACTIVATION_STATUS_0/1/2
> - * values 1 and 3 will not occur
> - *        Decoded meaning              ERROR  BUSY    AUX ERR
> - * -------------------------------     ----   -----   -------
> - * IDLE                                 0       0        0
> - * BUSY (active)                        0       1        0
> - * SW Ack Timeout (destination)         1       0        0
> - * SW Ack INTD rejected (strong NACK)   1       0        1
> - * Source Side Time Out Detected        1       1        0
> - * Destination Side PUT Failed          1       1        1
> - */
> -#define UV2H_DESC_IDLE			0
> -#define UV2H_DESC_BUSY			2
> -#define UV2H_DESC_DEST_TIMEOUT		4
> -#define UV2H_DESC_DEST_STRONG_NACK	5
> -#define UV2H_DESC_SOURCE_TIMEOUT	6
> -#define UV2H_DESC_DEST_PUT_ERR		7
> -
> -/*
> - * delay for 'plugged' timeout retries, in microseconds
> - */
> -#define PLUGGED_DELAY			10
> -
> -/*
> - * threshholds at which to use IPI to free resources
> - */
> -/* after this # consecutive 'plugged' timeouts, use IPI to release resources */
> -#define PLUGSB4RESET			100
> -/* after this many consecutive timeouts, use IPI to release resources */
> -#define TIMEOUTSB4RESET			1
> -/* at this number uses of IPI to release resources, giveup the request */
> -#define IPI_RESET_LIMIT			1
> -/* after this # consecutive successes, bump up the throttle if it was lowered */
> -#define COMPLETE_THRESHOLD		5
> -/* after this # of giveups (fall back to kernel IPI's) disable the use of
> -   the BAU for a period of time */
> -#define GIVEUP_LIMIT			100
> -
> -#define UV_LB_SUBNODEID			0x10
> -
> -#define UV_SA_SHFT UVH_LB_BAU_MISC_CONTROL_INTD_SOFT_ACK_TIMEOUT_PERIOD_SHFT
> -#define UV_SA_MASK UVH_LB_BAU_MISC_CONTROL_INTD_SOFT_ACK_TIMEOUT_PERIOD_MASK
> -/* 4 bits of software ack period */
> -#define UV2_ACK_MASK			0x7UL
> -#define UV2_ACK_UNITS_SHFT		3
> -#define UV2_EXT_SHFT UV2H_LB_BAU_MISC_CONTROL_ENABLE_EXTENDED_SB_STATUS_SHFT
> -
> -/*
> - * number of entries in the destination side payload queue
> - */
> -#define DEST_Q_SIZE			20
> -/*
> - * number of destination side software ack resources
> - */
> -#define DEST_NUM_RESOURCES		8
> -/*
> - * completion statuses for sending a TLB flush message
> - */
> -#define FLUSH_RETRY_PLUGGED		1
> -#define FLUSH_RETRY_TIMEOUT		2
> -#define FLUSH_GIVEUP			3
> -#define FLUSH_COMPLETE			4
> -
> -/*
> - * tuning the action when the numalink network is extremely delayed
> - */
> -#define CONGESTED_RESPONSE_US		1000	/* 'long' response time, in
> -						   microseconds */
> -#define CONGESTED_REPS			10	/* long delays averaged over
> -						   this many broadcasts */
> -#define DISABLED_PERIOD			10	/* time for the bau to be
> -						   disabled, in seconds */
> -/* see msg_type: */
> -#define MSG_NOOP			0
> -#define MSG_REGULAR			1
> -#define MSG_RETRY			2
> -
> -#define BAU_DESC_QUALIFIER		0x534749
> -
> -enum uv_bau_version {
> -	UV_BAU_V2 = 2,
> -	UV_BAU_V3,
> -	UV_BAU_V4,
> -};
> -
> -/*
> - * Distribution: 32 bytes (256 bits) (bytes 0-0x1f of descriptor)
> - * If the 'multilevel' flag in the header portion of the descriptor
> - * has been set to 0, then endpoint multi-unicast mode is selected.
> - * The distribution specification (32 bytes) is interpreted as a 256-bit
> - * distribution vector. Adjacent bits correspond to consecutive even numbered
> - * nodeIDs. The result of adding the index of a given bit to the 15-bit
> - * 'base_dest_nasid' field of the header corresponds to the
> - * destination nodeID associated with that specified bit.
> - */
> -struct pnmask {
> -	unsigned long		bits[BITS_TO_LONGS(UV_DISTRIBUTION_SIZE)];
> -};
> -
> -/*
> - * mask of cpu's on a uvhub
> - * (during initialization we need to check that unsigned long has
> - *  enough bits for max. cpu's per uvhub)
> - */
> -struct bau_local_cpumask {
> -	unsigned long		bits;
> -};
> -
> -/*
> - * Payload: 16 bytes (128 bits) (bytes 0x20-0x2f of descriptor)
> - * only 12 bytes (96 bits) of the payload area are usable.
> - * An additional 3 bytes (bits 27:4) of the header address are carried
> - * to the next bytes of the destination payload queue.
> - * And an additional 2 bytes of the header Suppl_A field are also
> - * carried to the destination payload queue.
> - * But the first byte of the Suppl_A becomes bits 127:120 (the 16th byte)
> - * of the destination payload queue, which is written by the hardware
> - * with the s/w ack resource bit vector.
> - * [ effective message contents (16 bytes (128 bits) maximum), not counting
> - *   the s/w ack bit vector  ]
> - */
> -
> -/**
> - * struct uv2_3_bau_msg_payload - defines payload for INTD transactions
> - * @address:		Signifies a page or all TLB's of the cpu
> - * @sending_cpu:	CPU from which the message originates
> - * @acknowledge_count:	CPUs on the destination Hub that received the interrupt
> - */
> -struct uv2_3_bau_msg_payload {
> -	u64 address;
> -	u16 sending_cpu;
> -	u16 acknowledge_count;
> -};
> -
> -/**
> - * struct uv4_bau_msg_payload - defines payload for INTD transactions
> - * @address:		Signifies a page or all TLB's of the cpu
> - * @sending_cpu:	CPU from which the message originates
> - * @acknowledge_count:	CPUs on the destination Hub that received the interrupt
> - * @qualifier:		Set by source to verify origin of INTD broadcast
> - */
> -struct uv4_bau_msg_payload {
> -	u64 address;
> -	u16 sending_cpu;
> -	u16 acknowledge_count;
> -	u32 reserved:8;
> -	u32 qualifier:24;
> -};
> -
> -/*
> - * UV2 Message header:  16 bytes (128 bits) (bytes 0x30-0x3f of descriptor)
> - * see figure 9-2 of harp_sys.pdf
> - * assuming UV3 is the same
> - */
> -struct uv2_3_bau_msg_header {
> -	unsigned int	base_dest_nasid:15;	/* nasid of the first bit */
> -	/* bits 14:0 */				/* in uvhub map */
> -	unsigned int	dest_subnodeid:5;	/* must be 0x10, for the LB */
> -	/* bits 19:15 */
> -	unsigned int	rsvd_1:1;		/* must be zero */
> -	/* bit 20 */
> -	/* Address bits 59:21 */
> -	/* bits 25:2 of address (44:21) are payload */
> -	/* these next 24 bits become bytes 12-14 of msg */
> -	/* bits 28:21 land in byte 12 */
> -	unsigned int	replied_to:1;		/* sent as 0 by the source to
> -						   byte 12 */
> -	/* bit 21 */
> -	unsigned int	msg_type:3;		/* software type of the
> -						   message */
> -	/* bits 24:22 */
> -	unsigned int	canceled:1;		/* message canceled, resource
> -						   is to be freed*/
> -	/* bit 25 */
> -	unsigned int	payload_1:3;		/* not currently used */
> -	/* bits 28:26 */
> -
> -	/* bits 36:29 land in byte 13 */
> -	unsigned int	payload_2a:3;		/* not currently used */
> -	unsigned int	payload_2b:5;		/* not currently used */
> -	/* bits 36:29 */
> -
> -	/* bits 44:37 land in byte 14 */
> -	unsigned int	payload_3:8;		/* not currently used */
> -	/* bits 44:37 */
> -
> -	unsigned int	rsvd_2:7;		/* reserved */
> -	/* bits 51:45 */
> -	unsigned int	swack_flag:1;		/* software acknowledge flag */
> -	/* bit 52 */
> -	unsigned int	rsvd_3a:3;		/* must be zero */
> -	unsigned int	rsvd_3b:8;		/* must be zero */
> -	unsigned int	rsvd_3c:8;		/* must be zero */
> -	unsigned int	rsvd_3d:3;		/* must be zero */
> -	/* bits 74:53 */
> -	unsigned int	fairness:3;		/* usually zero */
> -	/* bits 77:75 */
> -
> -	unsigned int	sequence:16;		/* message sequence number */
> -	/* bits 93:78  Suppl_A  */
> -	unsigned int	chaining:1;		/* next descriptor is part of
> -						   this activation*/
> -	/* bit 94 */
> -	unsigned int	multilevel:1;		/* multi-level multicast
> -						   format */
> -	/* bit 95 */
> -	unsigned int	rsvd_4:24;		/* ordered / source node /
> -						   source subnode / aging
> -						   must be zero */
> -	/* bits 119:96 */
> -	unsigned int	command:8;		/* message type */
> -	/* bits 127:120 */
> -};
> -
> -/*
> - * The activation descriptor:
> - * The format of the message to send, plus all accompanying control
> - * Should be 64 bytes
> - */
> -struct bau_desc {
> -	struct pnmask				distribution;
> -	/*
> -	 * message template, consisting of header and payload:
> -	 */
> -	union bau_msg_header {
> -		struct uv2_3_bau_msg_header	uv2_3_hdr;
> -	} header;
> -
> -	union bau_payload_header {
> -		struct uv2_3_bau_msg_payload	uv2_3;
> -		struct uv4_bau_msg_payload	uv4;
> -	} payload;
> -};
> -/* UV2:
> - *   -payload--    ---------header------
> - *   bytes 0-11    bits 70-78  bits 21-44
> - *       A           B  (2)      C (3)
> - *
> - *            A/B/C are moved to:
> - *       A            C          B
> - *   bytes 0-11  bytes 12-14  bytes 16-17  (byte 15 filled in by hw as vector)
> - *   ------------payload queue-----------
> - */
> -
> -/*
> - * The payload queue on the destination side is an array of these.
> - * With BAU_MISC_CONTROL set for software acknowledge mode, the messages
> - * are 32 bytes (2 micropackets) (256 bits) in length, but contain only 17
> - * bytes of usable data, including the sw ack vector in byte 15 (bits 127:120)
> - * (12 bytes come from bau_msg_payload, 3 from payload_1, 2 from
> - *  swack_vec and payload_2)
> - * "Enabling Software Acknowledgment mode (see Section 4.3.3 Software
> - *  Acknowledge Processing) also selects 32 byte (17 bytes usable) payload
> - *  operation."
> - */
> -struct bau_pq_entry {
> -	unsigned long	address;	/* signifies a page or all TLB's
> -					   of the cpu */
> -	/* 64 bits, bytes 0-7 */
> -	unsigned short	sending_cpu;	/* cpu that sent the message */
> -	/* 16 bits, bytes 8-9 */
> -	unsigned short	acknowledge_count; /* filled in by destination */
> -	/* 16 bits, bytes 10-11 */
> -	/* these next 3 bytes come from bits 58-81 of the message header */
> -	unsigned short	replied_to:1;	/* sent as 0 by the source */
> -	unsigned short	msg_type:3;	/* software message type */
> -	unsigned short	canceled:1;	/* sent as 0 by the source */
> -	unsigned short	unused1:3;	/* not currently using */
> -	/* byte 12 */
> -	unsigned char	unused2a;	/* not currently using */
> -	/* byte 13 */
> -	unsigned char	unused2;	/* not currently using */
> -	/* byte 14 */
> -	unsigned char	swack_vec;	/* filled in by the hardware */
> -	/* byte 15 (bits 127:120) */
> -	unsigned short	sequence;	/* message sequence number */
> -	/* bytes 16-17 */
> -	unsigned char	unused4[2];	/* not currently using bytes 18-19 */
> -	/* bytes 18-19 */
> -	int		number_of_cpus;	/* filled in at destination */
> -	/* 32 bits, bytes 20-23 (aligned) */
> -	unsigned char	unused5[8];	/* not using */
> -	/* bytes 24-31 */
> -};
> -
> -struct msg_desc {
> -	struct bau_pq_entry	*msg;
> -	int			msg_slot;
> -	struct bau_pq_entry	*queue_first;
> -	struct bau_pq_entry	*queue_last;
> -};
> -
> -struct reset_args {
> -	int			sender;
> -};
> -
> -/*
> - * This structure is allocated per_cpu for UV TLB shootdown statistics.
> - */
> -struct ptc_stats {
> -	/* sender statistics */
> -	unsigned long	s_giveup;		/* number of fall backs to
> -						   IPI-style flushes */
> -	unsigned long	s_requestor;		/* number of shootdown
> -						   requests */
> -	unsigned long	s_stimeout;		/* source side timeouts */
> -	unsigned long	s_dtimeout;		/* destination side timeouts */
> -	unsigned long	s_strongnacks;		/* number of strong nack's */
> -	unsigned long	s_time;			/* time spent in sending side */
> -	unsigned long	s_retriesok;		/* successful retries */
> -	unsigned long	s_ntargcpu;		/* total number of cpu's
> -						   targeted */
> -	unsigned long	s_ntargself;		/* times the sending cpu was
> -						   targeted */
> -	unsigned long	s_ntarglocals;		/* targets of cpus on the local
> -						   blade */
> -	unsigned long	s_ntargremotes;		/* targets of cpus on remote
> -						   blades */
> -	unsigned long	s_ntarglocaluvhub;	/* targets of the local hub */
> -	unsigned long	s_ntargremoteuvhub;	/* remotes hubs targeted */
> -	unsigned long	s_ntarguvhub;		/* total number of uvhubs
> -						   targeted */
> -	unsigned long	s_ntarguvhub16;		/* number of times target
> -						   hubs >= 16*/
> -	unsigned long	s_ntarguvhub8;		/* number of times target
> -						   hubs >= 8 */
> -	unsigned long	s_ntarguvhub4;		/* number of times target
> -						   hubs >= 4 */
> -	unsigned long	s_ntarguvhub2;		/* number of times target
> -						   hubs >= 2 */
> -	unsigned long	s_ntarguvhub1;		/* number of times target
> -						   hubs == 1 */
> -	unsigned long	s_resets_plug;		/* ipi-style resets from plug
> -						   state */
> -	unsigned long	s_resets_timeout;	/* ipi-style resets from
> -						   timeouts */
> -	unsigned long	s_busy;			/* status stayed busy past
> -						   s/w timer */
> -	unsigned long	s_throttles;		/* waits in throttle */
> -	unsigned long	s_retry_messages;	/* retry broadcasts */
> -	unsigned long	s_bau_reenabled;	/* for bau enable/disable */
> -	unsigned long	s_bau_disabled;		/* for bau enable/disable */
> -	unsigned long	s_uv2_wars;		/* uv2 workaround, perm. busy */
> -	unsigned long	s_uv2_wars_hw;		/* uv2 workaround, hiwater */
> -	unsigned long	s_uv2_war_waits;	/* uv2 workaround, long waits */
> -	unsigned long	s_overipilimit;		/* over the ipi reset limit */
> -	unsigned long	s_giveuplimit;		/* disables, over giveup limit*/
> -	unsigned long	s_enters;		/* entries to the driver */
> -	unsigned long	s_ipifordisabled;	/* fall back to IPI; disabled */
> -	unsigned long	s_plugged;		/* plugged by h/w bug*/
> -	unsigned long	s_congested;		/* giveup on long wait */
> -	/* destination statistics */
> -	unsigned long	d_alltlb;		/* times all tlb's on this
> -						   cpu were flushed */
> -	unsigned long	d_onetlb;		/* times just one tlb on this
> -						   cpu was flushed */
> -	unsigned long	d_multmsg;		/* interrupts with multiple
> -						   messages */
> -	unsigned long	d_nomsg;		/* interrupts with no message */
> -	unsigned long	d_time;			/* time spent on destination
> -						   side */
> -	unsigned long	d_requestee;		/* number of messages
> -						   processed */
> -	unsigned long	d_retries;		/* number of retry messages
> -						   processed */
> -	unsigned long	d_canceled;		/* number of messages canceled
> -						   by retries */
> -	unsigned long	d_nocanceled;		/* retries that found nothing
> -						   to cancel */
> -	unsigned long	d_resets;		/* number of ipi-style requests
> -						   processed */
> -	unsigned long	d_rcanceled;		/* number of messages canceled
> -						   by resets */
> -};
> -
> -struct tunables {
> -	int			*tunp;
> -	int			deflt;
> -};
> -
> -struct hub_and_pnode {
> -	short			uvhub;
> -	short			pnode;
> -};
> -
> -struct socket_desc {
> -	short			num_cpus;
> -	short			cpu_number[MAX_CPUS_PER_SOCKET];
> -};
> -
> -struct uvhub_desc {
> -	unsigned short		socket_mask;
> -	short			num_cpus;
> -	short			uvhub;
> -	short			pnode;
> -	struct socket_desc	socket[2];
> -};
> -
> -/**
> - * struct bau_control
> - * @status_mmr: location of status mmr, determined by uvhub_cpu
> - * @status_index: index of ERR|BUSY bits in status mmr, determined by uvhub_cpu
> - *
> - * Per-cpu control struct containing CPU topology information and BAU tuneables.
> - */
> -struct bau_control {
> -	struct bau_desc		*descriptor_base;
> -	struct bau_pq_entry	*queue_first;
> -	struct bau_pq_entry	*queue_last;
> -	struct bau_pq_entry	*bau_msg_head;
> -	struct bau_control	*uvhub_master;
> -	struct bau_control	*socket_master;
> -	struct ptc_stats	*statp;
> -	cpumask_t		*cpumask;
> -	unsigned long		timeout_interval;
> -	unsigned long		set_bau_on_time;
> -	atomic_t		active_descriptor_count;
> -	int			plugged_tries;
> -	int			timeout_tries;
> -	int			ipi_attempts;
> -	int			conseccompletes;
> -	u64			status_mmr;
> -	int			status_index;
> -	bool			nobau;
> -	short			baudisabled;
> -	short			cpu;
> -	short			osnode;
> -	short			uvhub_cpu;
> -	short			uvhub;
> -	short			uvhub_version;
> -	short			cpus_in_socket;
> -	short			cpus_in_uvhub;
> -	short			partition_base_pnode;
> -	short			busy;       /* all were busy (war) */
> -	unsigned short		message_number;
> -	unsigned short		uvhub_quiesce;
> -	short			socket_acknowledge_count[DEST_Q_SIZE];
> -	cycles_t		send_message;
> -	cycles_t		period_end;
> -	cycles_t		period_time;
> -	spinlock_t		uvhub_lock;
> -	spinlock_t		queue_lock;
> -	spinlock_t		disable_lock;
> -	/* tunables */
> -	int			max_concurr;
> -	int			max_concurr_const;
> -	int			plugged_delay;
> -	int			plugsb4reset;
> -	int			timeoutsb4reset;
> -	int			ipi_reset_limit;
> -	int			complete_threshold;
> -	int			cong_response_us;
> -	int			cong_reps;
> -	cycles_t		disabled_period;
> -	int			period_giveups;
> -	int			giveup_limit;
> -	long			period_requests;
> -	struct hub_and_pnode	*thp;
> -};
> -
> -/* Abstracted BAU functions */
> -struct bau_operations {
> -	unsigned long	(*read_l_sw_ack)(void);
> -	unsigned long	(*read_g_sw_ack)(int pnode);
> -	unsigned long	(*bau_gpa_to_offset)(unsigned long vaddr);
> -	void		(*write_l_sw_ack)(unsigned long mmr);
> -	void		(*write_g_sw_ack)(int pnode, unsigned long mmr);
> -	void		(*write_payload_first)(int pnode, unsigned long mmr);
> -	void		(*write_payload_last)(int pnode, unsigned long mmr);
> -	int		(*wait_completion)(struct bau_desc*,
> -				struct bau_control*, long try);
> -};
> -
> -static inline void write_mmr_data_broadcast(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_BAU_DATA_BROADCAST, mmr_image);
> -}
> -
> -static inline void write_mmr_descriptor_base(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_SB_DESCRIPTOR_BASE, mmr_image);
> -}
> -
> -static inline void write_mmr_activation(unsigned long index)
> -{
> -	write_lmmr(UVH_LB_BAU_SB_ACTIVATION_CONTROL, index);
> -}
> -
> -static inline void write_gmmr_activation(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_SB_ACTIVATION_CONTROL, mmr_image);
> -}
> -
> -static inline void write_mmr_proc_payload_first(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UV4H_LB_PROC_INTD_QUEUE_FIRST, mmr_image);
> -}
> -
> -static inline void write_mmr_proc_payload_last(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UV4H_LB_PROC_INTD_QUEUE_LAST, mmr_image);
> -}
> -
> -static inline void write_mmr_payload_first(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_INTD_PAYLOAD_QUEUE_FIRST, mmr_image);
> -}
> -
> -static inline void write_mmr_payload_tail(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_INTD_PAYLOAD_QUEUE_TAIL, mmr_image);
> -}
> -
> -static inline void write_mmr_payload_last(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_INTD_PAYLOAD_QUEUE_LAST, mmr_image);
> -}
> -
> -static inline void write_mmr_misc_control(int pnode, unsigned long mmr_image)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_MISC_CONTROL, mmr_image);
> -}
> -
> -static inline unsigned long read_mmr_misc_control(int pnode)
> -{
> -	return read_gmmr(pnode, UVH_LB_BAU_MISC_CONTROL);
> -}
> -
> -static inline void write_mmr_sw_ack(unsigned long mr)
> -{
> -	uv_write_local_mmr(UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE_ALIAS, mr);
> -}
> -
> -static inline void write_gmmr_sw_ack(int pnode, unsigned long mr)
> -{
> -	write_gmmr(pnode, UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE_ALIAS, mr);
> -}
> -
> -static inline unsigned long read_mmr_sw_ack(void)
> -{
> -	return read_lmmr(UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE);
> -}
> -
> -static inline unsigned long read_gmmr_sw_ack(int pnode)
> -{
> -	return read_gmmr(pnode, UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE);
> -}
> -
> -static inline void write_mmr_proc_sw_ack(unsigned long mr)
> -{
> -	uv_write_local_mmr(UV4H_LB_PROC_INTD_SOFT_ACK_CLEAR, mr);
> -}
> -
> -static inline void write_gmmr_proc_sw_ack(int pnode, unsigned long mr)
> -{
> -	write_gmmr(pnode, UV4H_LB_PROC_INTD_SOFT_ACK_CLEAR, mr);
> -}
> -
> -static inline unsigned long read_mmr_proc_sw_ack(void)
> -{
> -	return read_lmmr(UV4H_LB_PROC_INTD_SOFT_ACK_PENDING);
> -}
> -
> -static inline unsigned long read_gmmr_proc_sw_ack(int pnode)
> -{
> -	return read_gmmr(pnode, UV4H_LB_PROC_INTD_SOFT_ACK_PENDING);
> -}
> -
> -static inline void write_mmr_data_config(int pnode, unsigned long mr)
> -{
> -	uv_write_global_mmr64(pnode, UVH_BAU_DATA_CONFIG, mr);
> -}
> -
> -static inline int bau_uvhub_isset(int uvhub, struct pnmask *dstp)
> -{
> -	return constant_test_bit(uvhub, &dstp->bits[0]);
> -}
> -static inline void bau_uvhub_set(int pnode, struct pnmask *dstp)
> -{
> -	__set_bit(pnode, &dstp->bits[0]);
> -}
> -static inline void bau_uvhubs_clear(struct pnmask *dstp,
> -				    int nbits)
> -{
> -	bitmap_zero(&dstp->bits[0], nbits);
> -}
> -static inline int bau_uvhub_weight(struct pnmask *dstp)
> -{
> -	return bitmap_weight((unsigned long *)&dstp->bits[0],
> -				UV_DISTRIBUTION_SIZE);
> -}
> -
> -static inline void bau_cpubits_clear(struct bau_local_cpumask *dstp, int nbits)
> -{
> -	bitmap_zero(&dstp->bits, nbits);
> -}
> -
> -struct atomic_short {
> -	short counter;
> -};
> -
> -/*
> - * atomic_read_short - read a short atomic variable
> - * @v: pointer of type atomic_short
> - *
> - * Atomically reads the value of @v.
> - */
> -static inline int atomic_read_short(const struct atomic_short *v)
> -{
> -	return v->counter;
> -}
> -
> -/*
> - * atom_asr - add and return a short int
> - * @i: short value to add
> - * @v: pointer of type atomic_short
> - *
> - * Atomically adds @i to @v and returns @i + @v
> - */
> -static inline int atom_asr(short i, struct atomic_short *v)
> -{
> -	short __i = i;
> -	asm volatile(LOCK_PREFIX "xaddw %0, %1"
> -			: "+r" (i), "+m" (v->counter)
> -			: : "memory");
> -	return i + __i;
> -}
> -
> -/*
> - * conditionally add 1 to *v, unless *v is >= u
> - * return 0 if we cannot add 1 to *v because it is >= u
> - * return 1 if we can add 1 to *v because it is < u
> - * the add is atomic
> - *
> - * This is close to atomic_add_unless(), but this allows the 'u' value
> - * to be lowered below the current 'v'.  atomic_add_unless can only stop
> - * on equal.
> - */
> -static inline int atomic_inc_unless_ge(spinlock_t *lock, atomic_t *v, int u)
> -{
> -	spin_lock(lock);
> -	if (atomic_read(v) >= u) {
> -		spin_unlock(lock);
> -		return 0;
> -	}
> -	atomic_inc(v);
> -	spin_unlock(lock);
> -	return 1;
> -}
> -
> -void uv_bau_message_interrupt(struct pt_regs *regs);
> -
> -#endif /* _ASM_X86_UV_UV_BAU_H */
> diff --git a/arch/x86/kernel/idt.c b/arch/x86/kernel/idt.c
> index 7ecf9babf0cb..1bffb87dcfdc 100644
> --- a/arch/x86/kernel/idt.c
> +++ b/arch/x86/kernel/idt.c
> @@ -148,9 +148,6 @@ static const __initconst struct idt_data apic_idts[] = {
>  # endif
>  # ifdef CONFIG_IRQ_WORK
>  	INTG(IRQ_WORK_VECTOR,			asm_sysvec_irq_work),
> -# endif
> -# ifdef CONFIG_X86_UV
> -	INTG(UV_BAU_MESSAGE,			asm_sysvec_uv_bau_message),
>  # endif
>  	INTG(SPURIOUS_APIC_VECTOR,		asm_sysvec_spurious_apic_interrupt),
>  	INTG(ERROR_APIC_VECTOR,			asm_sysvec_error_interrupt),
> diff --git a/arch/x86/mm/tlb.c b/arch/x86/mm/tlb.c
> index 0951b47e64c1..11666ba19b62 100644
> --- a/arch/x86/mm/tlb.c
> +++ b/arch/x86/mm/tlb.c
> @@ -14,7 +14,6 @@
>  #include <asm/nospec-branch.h>
>  #include <asm/cache.h>
>  #include <asm/apic.h>
> -#include <asm/uv/uv.h>
>  
>  #include "mm_internal.h"
>  
> @@ -800,29 +799,6 @@ STATIC_NOPV void native_flush_tlb_others(const struct cpumask *cpumask,
>  		trace_tlb_flush(TLB_REMOTE_SEND_IPI,
>  				(info->end - info->start) >> PAGE_SHIFT);
>  
> -	if (is_uv_system()) {
> -		/*
> -		 * This whole special case is confused.  UV has a "Broadcast
> -		 * Assist Unit", which seems to be a fancy way to send IPIs.
> -		 * Back when x86 used an explicit TLB flush IPI, UV was
> -		 * optimized to use its own mechanism.  These days, x86 uses
> -		 * smp_call_function_many(), but UV still uses a manual IPI,
> -		 * and that IPI's action is out of date -- it does a manual
> -		 * flush instead of calling flush_tlb_func_remote().  This
> -		 * means that the percpu tlb_gen variables won't be updated
> -		 * and we'll do pointless flushes on future context switches.
> -		 *
> -		 * Rather than hooking native_flush_tlb_others() here, I think
> -		 * that UV should be updated so that smp_call_function_many(),
> -		 * etc, are optimal on UV.
> -		 */
> -		cpumask = uv_flush_tlb_others(cpumask, info);
> -		if (cpumask)
> -			smp_call_function_many(cpumask, flush_tlb_func_remote,
> -					       (void *)info, 1);
> -		return;
> -	}
> -
>  	/*
>  	 * If no page tables were freed, we can skip sending IPIs to
>  	 * CPUs in lazy TLB mode. They will flush the CPU themselves
> diff --git a/arch/x86/platform/uv/Makefile b/arch/x86/platform/uv/Makefile
> index a3693c829e2e..224ff0504890 100644
> --- a/arch/x86/platform/uv/Makefile
> +++ b/arch/x86/platform/uv/Makefile
> @@ -1,2 +1,2 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> -obj-$(CONFIG_X86_UV)		+= tlb_uv.o bios_uv.o uv_irq.o uv_sysfs.o uv_time.o uv_nmi.o
> +obj-$(CONFIG_X86_UV)		+= bios_uv.o uv_irq.o uv_sysfs.o uv_time.o uv_nmi.o
> diff --git a/arch/x86/platform/uv/tlb_uv.c b/arch/x86/platform/uv/tlb_uv.c
> deleted file mode 100644
> index 62ea907668f8..000000000000
> --- a/arch/x86/platform/uv/tlb_uv.c
> +++ /dev/null
> @@ -1,2097 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0-or-later
> -/*
> - *	SGI UltraViolet TLB flush routines.
> - *
> - *	(c) 2008-2014 Cliff Wickman <cpw@sgi.com>, SGI.
> - */
> -#include <linux/seq_file.h>
> -#include <linux/proc_fs.h>
> -#include <linux/debugfs.h>
> -#include <linux/kernel.h>
> -#include <linux/slab.h>
> -#include <linux/delay.h>
> -
> -#include <asm/mmu_context.h>
> -#include <asm/uv/uv.h>
> -#include <asm/uv/uv_mmrs.h>
> -#include <asm/uv/uv_hub.h>
> -#include <asm/uv/uv_bau.h>
> -#include <asm/apic.h>
> -#include <asm/tsc.h>
> -#include <asm/irq_vectors.h>
> -#include <asm/timer.h>
> -
> -static struct bau_operations ops __ro_after_init;
> -
> -static int timeout_us;
> -static bool nobau = true;
> -static int nobau_perm;
> -
> -/* tunables: */
> -static int max_concurr		= MAX_BAU_CONCURRENT;
> -static int max_concurr_const	= MAX_BAU_CONCURRENT;
> -static int plugged_delay	= PLUGGED_DELAY;
> -static int plugsb4reset		= PLUGSB4RESET;
> -static int giveup_limit		= GIVEUP_LIMIT;
> -static int timeoutsb4reset	= TIMEOUTSB4RESET;
> -static int ipi_reset_limit	= IPI_RESET_LIMIT;
> -static int complete_threshold	= COMPLETE_THRESHOLD;
> -static int congested_respns_us	= CONGESTED_RESPONSE_US;
> -static int congested_reps	= CONGESTED_REPS;
> -static int disabled_period	= DISABLED_PERIOD;
> -
> -static struct tunables tunables[] = {
> -	{&max_concurr,           MAX_BAU_CONCURRENT}, /* must be [0] */
> -	{&plugged_delay,         PLUGGED_DELAY},
> -	{&plugsb4reset,          PLUGSB4RESET},
> -	{&timeoutsb4reset,       TIMEOUTSB4RESET},
> -	{&ipi_reset_limit,       IPI_RESET_LIMIT},
> -	{&complete_threshold,    COMPLETE_THRESHOLD},
> -	{&congested_respns_us,   CONGESTED_RESPONSE_US},
> -	{&congested_reps,        CONGESTED_REPS},
> -	{&disabled_period,       DISABLED_PERIOD},
> -	{&giveup_limit,          GIVEUP_LIMIT}
> -};
> -
> -static struct dentry *tunables_dir;
> -
> -/* these correspond to the statistics printed by ptc_seq_show() */
> -static char *stat_description[] = {
> -	"sent:     number of shootdown messages sent",
> -	"stime:    time spent sending messages",
> -	"numuvhubs: number of hubs targeted with shootdown",
> -	"numuvhubs16: number times 16 or more hubs targeted",
> -	"numuvhubs8: number times 8 or more hubs targeted",
> -	"numuvhubs4: number times 4 or more hubs targeted",
> -	"numuvhubs2: number times 2 or more hubs targeted",
> -	"numuvhubs1: number times 1 hub targeted",
> -	"numcpus:  number of cpus targeted with shootdown",
> -	"dto:      number of destination timeouts",
> -	"retries:  destination timeout retries sent",
> -	"rok:   :  destination timeouts successfully retried",
> -	"resetp:   ipi-style resource resets for plugs",
> -	"resett:   ipi-style resource resets for timeouts",
> -	"giveup:   fall-backs to ipi-style shootdowns",
> -	"sto:      number of source timeouts",
> -	"bz:       number of stay-busy's",
> -	"throt:    number times spun in throttle",
> -	"swack:   image of UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE",
> -	"recv:     shootdown messages received",
> -	"rtime:    time spent processing messages",
> -	"all:      shootdown all-tlb messages",
> -	"one:      shootdown one-tlb messages",
> -	"mult:     interrupts that found multiple messages",
> -	"none:     interrupts that found no messages",
> -	"retry:    number of retry messages processed",
> -	"canc:     number messages canceled by retries",
> -	"nocan:    number retries that found nothing to cancel",
> -	"reset:    number of ipi-style reset requests processed",
> -	"rcan:     number messages canceled by reset requests",
> -	"disable:  number times use of the BAU was disabled",
> -	"enable:   number times use of the BAU was re-enabled"
> -};
> -
> -static int __init setup_bau(char *arg)
> -{
> -	int result;
> -
> -	if (!arg)
> -		return -EINVAL;
> -
> -	result = strtobool(arg, &nobau);
> -	if (result)
> -		return result;
> -
> -	/* we need to flip the logic here, so that bau=y sets nobau to false */
> -	nobau = !nobau;
> -
> -	if (!nobau)
> -		pr_info("UV BAU Enabled\n");
> -	else
> -		pr_info("UV BAU Disabled\n");
> -
> -	return 0;
> -}
> -early_param("bau", setup_bau);
> -
> -/* base pnode in this partition */
> -static int uv_base_pnode __read_mostly;
> -
> -static DEFINE_PER_CPU(struct ptc_stats, ptcstats);
> -static DEFINE_PER_CPU(struct bau_control, bau_control);
> -static DEFINE_PER_CPU(cpumask_var_t, uv_flush_tlb_mask);
> -
> -static void
> -set_bau_on(void)
> -{
> -	int cpu;
> -	struct bau_control *bcp;
> -
> -	if (nobau_perm) {
> -		pr_info("BAU not initialized; cannot be turned on\n");
> -		return;
> -	}
> -	nobau = false;
> -	for_each_present_cpu(cpu) {
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->nobau = false;
> -	}
> -	pr_info("BAU turned on\n");
> -	return;
> -}
> -
> -static void
> -set_bau_off(void)
> -{
> -	int cpu;
> -	struct bau_control *bcp;
> -
> -	nobau = true;
> -	for_each_present_cpu(cpu) {
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->nobau = true;
> -	}
> -	pr_info("BAU turned off\n");
> -	return;
> -}
> -
> -/*
> - * Determine the first node on a uvhub. 'Nodes' are used for kernel
> - * memory allocation.
> - */
> -static int __init uvhub_to_first_node(int uvhub)
> -{
> -	int node, b;
> -
> -	for_each_online_node(node) {
> -		b = uv_node_to_blade_id(node);
> -		if (uvhub == b)
> -			return node;
> -	}
> -	return -1;
> -}
> -
> -/*
> - * Determine the apicid of the first cpu on a uvhub.
> - */
> -static int __init uvhub_to_first_apicid(int uvhub)
> -{
> -	int cpu;
> -
> -	for_each_present_cpu(cpu)
> -		if (uvhub == uv_cpu_to_blade_id(cpu))
> -			return per_cpu(x86_cpu_to_apicid, cpu);
> -	return -1;
> -}
> -
> -/*
> - * Free a software acknowledge hardware resource by clearing its Pending
> - * bit. This will return a reply to the sender.
> - * If the message has timed out, a reply has already been sent by the
> - * hardware but the resource has not been released. In that case our
> - * clear of the Timeout bit (as well) will free the resource. No reply will
> - * be sent (the hardware will only do one reply per message).
> - */
> -static void reply_to_message(struct msg_desc *mdp, struct bau_control *bcp,
> -						int do_acknowledge)
> -{
> -	unsigned long dw;
> -	struct bau_pq_entry *msg;
> -
> -	msg = mdp->msg;
> -	if (!msg->canceled && do_acknowledge) {
> -		dw = (msg->swack_vec << UV_SW_ACK_NPENDING) | msg->swack_vec;
> -		ops.write_l_sw_ack(dw);
> -	}
> -	msg->replied_to = 1;
> -	msg->swack_vec = 0;
> -}
> -
> -/*
> - * Process the receipt of a RETRY message
> - */
> -static void bau_process_retry_msg(struct msg_desc *mdp,
> -					struct bau_control *bcp)
> -{
> -	int i;
> -	int cancel_count = 0;
> -	unsigned long msg_res;
> -	unsigned long mmr = 0;
> -	struct bau_pq_entry *msg = mdp->msg;
> -	struct bau_pq_entry *msg2;
> -	struct ptc_stats *stat = bcp->statp;
> -
> -	stat->d_retries++;
> -	/*
> -	 * cancel any message from msg+1 to the retry itself
> -	 */
> -	for (msg2 = msg+1, i = 0; i < DEST_Q_SIZE; msg2++, i++) {
> -		if (msg2 > mdp->queue_last)
> -			msg2 = mdp->queue_first;
> -		if (msg2 == msg)
> -			break;
> -
> -		/* same conditions for cancellation as do_reset */
> -		if ((msg2->replied_to == 0) && (msg2->canceled == 0) &&
> -		    (msg2->swack_vec) && ((msg2->swack_vec &
> -			msg->swack_vec) == 0) &&
> -		    (msg2->sending_cpu == msg->sending_cpu) &&
> -		    (msg2->msg_type != MSG_NOOP)) {
> -			mmr = ops.read_l_sw_ack();
> -			msg_res = msg2->swack_vec;
> -			/*
> -			 * This is a message retry; clear the resources held
> -			 * by the previous message only if they timed out.
> -			 * If it has not timed out we have an unexpected
> -			 * situation to report.
> -			 */
> -			if (mmr & (msg_res << UV_SW_ACK_NPENDING)) {
> -				unsigned long mr;
> -				/*
> -				 * Is the resource timed out?
> -				 * Make everyone ignore the cancelled message.
> -				 */
> -				msg2->canceled = 1;
> -				stat->d_canceled++;
> -				cancel_count++;
> -				mr = (msg_res << UV_SW_ACK_NPENDING) | msg_res;
> -				ops.write_l_sw_ack(mr);
> -			}
> -		}
> -	}
> -	if (!cancel_count)
> -		stat->d_nocanceled++;
> -}
> -
> -/*
> - * Do all the things a cpu should do for a TLB shootdown message.
> - * Other cpu's may come here at the same time for this message.
> - */
> -static void bau_process_message(struct msg_desc *mdp, struct bau_control *bcp,
> -						int do_acknowledge)
> -{
> -	short socket_ack_count = 0;
> -	short *sp;
> -	struct atomic_short *asp;
> -	struct ptc_stats *stat = bcp->statp;
> -	struct bau_pq_entry *msg = mdp->msg;
> -	struct bau_control *smaster = bcp->socket_master;
> -
> -	/*
> -	 * This must be a normal message, or retry of a normal message
> -	 */
> -	if (msg->address == TLB_FLUSH_ALL) {
> -		flush_tlb_local();
> -		stat->d_alltlb++;
> -	} else {
> -		flush_tlb_one_user(msg->address);
> -		stat->d_onetlb++;
> -	}
> -	stat->d_requestee++;
> -
> -	/*
> -	 * One cpu on each uvhub has the additional job on a RETRY
> -	 * of releasing the resource held by the message that is
> -	 * being retried.  That message is identified by sending
> -	 * cpu number.
> -	 */
> -	if (msg->msg_type == MSG_RETRY && bcp == bcp->uvhub_master)
> -		bau_process_retry_msg(mdp, bcp);
> -
> -	/*
> -	 * This is a swack message, so we have to reply to it.
> -	 * Count each responding cpu on the socket. This avoids
> -	 * pinging the count's cache line back and forth between
> -	 * the sockets.
> -	 */
> -	sp = &smaster->socket_acknowledge_count[mdp->msg_slot];
> -	asp = (struct atomic_short *)sp;
> -	socket_ack_count = atom_asr(1, asp);
> -	if (socket_ack_count == bcp->cpus_in_socket) {
> -		int msg_ack_count;
> -		/*
> -		 * Both sockets dump their completed count total into
> -		 * the message's count.
> -		 */
> -		*sp = 0;
> -		asp = (struct atomic_short *)&msg->acknowledge_count;
> -		msg_ack_count = atom_asr(socket_ack_count, asp);
> -
> -		if (msg_ack_count == bcp->cpus_in_uvhub) {
> -			/*
> -			 * All cpus in uvhub saw it; reply
> -			 * (unless we are in the UV2 workaround)
> -			 */
> -			reply_to_message(mdp, bcp, do_acknowledge);
> -		}
> -	}
> -
> -	return;
> -}
> -
> -/*
> - * Determine the first cpu on a pnode.
> - */
> -static int pnode_to_first_cpu(int pnode, struct bau_control *smaster)
> -{
> -	int cpu;
> -	struct hub_and_pnode *hpp;
> -
> -	for_each_present_cpu(cpu) {
> -		hpp = &smaster->thp[cpu];
> -		if (pnode == hpp->pnode)
> -			return cpu;
> -	}
> -	return -1;
> -}
> -
> -/*
> - * Last resort when we get a large number of destination timeouts is
> - * to clear resources held by a given cpu.
> - * Do this with IPI so that all messages in the BAU message queue
> - * can be identified by their nonzero swack_vec field.
> - *
> - * This is entered for a single cpu on the uvhub.
> - * The sender want's this uvhub to free a specific message's
> - * swack resources.
> - */
> -static void do_reset(void *ptr)
> -{
> -	int i;
> -	struct bau_control *bcp = &per_cpu(bau_control, smp_processor_id());
> -	struct reset_args *rap = (struct reset_args *)ptr;
> -	struct bau_pq_entry *msg;
> -	struct ptc_stats *stat = bcp->statp;
> -
> -	stat->d_resets++;
> -	/*
> -	 * We're looking for the given sender, and
> -	 * will free its swack resource.
> -	 * If all cpu's finally responded after the timeout, its
> -	 * message 'replied_to' was set.
> -	 */
> -	for (msg = bcp->queue_first, i = 0; i < DEST_Q_SIZE; msg++, i++) {
> -		unsigned long msg_res;
> -		/* do_reset: same conditions for cancellation as
> -		   bau_process_retry_msg() */
> -		if ((msg->replied_to == 0) &&
> -		    (msg->canceled == 0) &&
> -		    (msg->sending_cpu == rap->sender) &&
> -		    (msg->swack_vec) &&
> -		    (msg->msg_type != MSG_NOOP)) {
> -			unsigned long mmr;
> -			unsigned long mr;
> -			/*
> -			 * make everyone else ignore this message
> -			 */
> -			msg->canceled = 1;
> -			/*
> -			 * only reset the resource if it is still pending
> -			 */
> -			mmr = ops.read_l_sw_ack();
> -			msg_res = msg->swack_vec;
> -			mr = (msg_res << UV_SW_ACK_NPENDING) | msg_res;
> -			if (mmr & msg_res) {
> -				stat->d_rcanceled++;
> -				ops.write_l_sw_ack(mr);
> -			}
> -		}
> -	}
> -	return;
> -}
> -
> -/*
> - * Use IPI to get all target uvhubs to release resources held by
> - * a given sending cpu number.
> - */
> -static void reset_with_ipi(struct pnmask *distribution, struct bau_control *bcp)
> -{
> -	int pnode;
> -	int apnode;
> -	int maskbits;
> -	int sender = bcp->cpu;
> -	cpumask_t *mask = bcp->uvhub_master->cpumask;
> -	struct bau_control *smaster = bcp->socket_master;
> -	struct reset_args reset_args;
> -
> -	reset_args.sender = sender;
> -	cpumask_clear(mask);
> -	/* find a single cpu for each uvhub in this distribution mask */
> -	maskbits = sizeof(struct pnmask) * BITSPERBYTE;
> -	/* each bit is a pnode relative to the partition base pnode */
> -	for (pnode = 0; pnode < maskbits; pnode++) {
> -		int cpu;
> -		if (!bau_uvhub_isset(pnode, distribution))
> -			continue;
> -		apnode = pnode + bcp->partition_base_pnode;
> -		cpu = pnode_to_first_cpu(apnode, smaster);
> -		cpumask_set_cpu(cpu, mask);
> -	}
> -
> -	/* IPI all cpus; preemption is already disabled */
> -	smp_call_function_many(mask, do_reset, (void *)&reset_args, 1);
> -	return;
> -}
> -
> -/*
> - * Not to be confused with cycles_2_ns() from tsc.c; this gives a relative
> - * number, not an absolute. It converts a duration in cycles to a duration in
> - * ns.
> - */
> -static inline unsigned long long cycles_2_ns(unsigned long long cyc)
> -{
> -	struct cyc2ns_data data;
> -	unsigned long long ns;
> -
> -	cyc2ns_read_begin(&data);
> -	ns = mul_u64_u32_shr(cyc, data.cyc2ns_mul, data.cyc2ns_shift);
> -	cyc2ns_read_end();
> -
> -	return ns;
> -}
> -
> -/*
> - * The reverse of the above; converts a duration in ns to a duration in cycles.
> - */
> -static inline unsigned long long ns_2_cycles(unsigned long long ns)
> -{
> -	struct cyc2ns_data data;
> -	unsigned long long cyc;
> -
> -	cyc2ns_read_begin(&data);
> -	cyc = (ns << data.cyc2ns_shift) / data.cyc2ns_mul;
> -	cyc2ns_read_end();
> -
> -	return cyc;
> -}
> -
> -static inline unsigned long cycles_2_us(unsigned long long cyc)
> -{
> -	return cycles_2_ns(cyc) / NSEC_PER_USEC;
> -}
> -
> -static inline cycles_t sec_2_cycles(unsigned long sec)
> -{
> -	return ns_2_cycles(sec * NSEC_PER_SEC);
> -}
> -
> -static inline unsigned long long usec_2_cycles(unsigned long usec)
> -{
> -	return ns_2_cycles(usec * NSEC_PER_USEC);
> -}
> -
> -/*
> - * wait for all cpus on this hub to finish their sends and go quiet
> - * leaves uvhub_quiesce set so that no new broadcasts are started by
> - * bau_flush_send_and_wait()
> - */
> -static inline void quiesce_local_uvhub(struct bau_control *hmaster)
> -{
> -	atom_asr(1, (struct atomic_short *)&hmaster->uvhub_quiesce);
> -}
> -
> -/*
> - * mark this quiet-requestor as done
> - */
> -static inline void end_uvhub_quiesce(struct bau_control *hmaster)
> -{
> -	atom_asr(-1, (struct atomic_short *)&hmaster->uvhub_quiesce);
> -}
> -
> -/*
> - * UV2 could have an extra bit of status in the ACTIVATION_STATUS_2 register.
> - * But not currently used.
> - */
> -static unsigned long uv2_3_read_status(unsigned long offset, int rshft, int desc)
> -{
> -	return ((read_lmmr(offset) >> rshft) & UV_ACT_STATUS_MASK) << 1;
> -}
> -
> -/*
> - * Entered when a bau descriptor has gone into a permanent busy wait because
> - * of a hardware bug.
> - * Workaround the bug.
> - */
> -static int handle_uv2_busy(struct bau_control *bcp)
> -{
> -	struct ptc_stats *stat = bcp->statp;
> -
> -	stat->s_uv2_wars++;
> -	bcp->busy = 1;
> -	return FLUSH_GIVEUP;
> -}
> -
> -static int uv2_3_wait_completion(struct bau_desc *bau_desc,
> -				struct bau_control *bcp, long try)
> -{
> -	unsigned long descriptor_stat;
> -	cycles_t ttm;
> -	u64 mmr_offset = bcp->status_mmr;
> -	int right_shift = bcp->status_index;
> -	int desc = bcp->uvhub_cpu;
> -	long busy_reps = 0;
> -	struct ptc_stats *stat = bcp->statp;
> -
> -	descriptor_stat = uv2_3_read_status(mmr_offset, right_shift, desc);
> -
> -	/* spin on the status MMR, waiting for it to go idle */
> -	while (descriptor_stat != UV2H_DESC_IDLE) {
> -		if (descriptor_stat == UV2H_DESC_SOURCE_TIMEOUT) {
> -			/*
> -			 * A h/w bug on the destination side may
> -			 * have prevented the message being marked
> -			 * pending, thus it doesn't get replied to
> -			 * and gets continually nacked until it times
> -			 * out with a SOURCE_TIMEOUT.
> -			 */
> -			stat->s_stimeout++;
> -			return FLUSH_GIVEUP;
> -		} else if (descriptor_stat == UV2H_DESC_DEST_TIMEOUT) {
> -			ttm = get_cycles();
> -
> -			/*
> -			 * Our retries may be blocked by all destination
> -			 * swack resources being consumed, and a timeout
> -			 * pending.  In that case hardware returns the
> -			 * ERROR that looks like a destination timeout.
> -			 * Without using the extended status we have to
> -			 * deduce from the short time that this was a
> -			 * strong nack.
> -			 */
> -			if (cycles_2_us(ttm - bcp->send_message) < timeout_us) {
> -				bcp->conseccompletes = 0;
> -				stat->s_plugged++;
> -				/* FLUSH_RETRY_PLUGGED causes hang on boot */
> -				return FLUSH_GIVEUP;
> -			}
> -			stat->s_dtimeout++;
> -			bcp->conseccompletes = 0;
> -			/* FLUSH_RETRY_TIMEOUT causes hang on boot */
> -			return FLUSH_GIVEUP;
> -		} else {
> -			busy_reps++;
> -			if (busy_reps > 1000000) {
> -				/* not to hammer on the clock */
> -				busy_reps = 0;
> -				ttm = get_cycles();
> -				if ((ttm - bcp->send_message) > bcp->timeout_interval)
> -					return handle_uv2_busy(bcp);
> -			}
> -			/*
> -			 * descriptor_stat is still BUSY
> -			 */
> -			cpu_relax();
> -		}
> -		descriptor_stat = uv2_3_read_status(mmr_offset, right_shift, desc);
> -	}
> -	bcp->conseccompletes++;
> -	return FLUSH_COMPLETE;
> -}
> -
> -/*
> - * Returns the status of current BAU message for cpu desc as a bit field
> - * [Error][Busy][Aux]
> - */
> -static u64 read_status(u64 status_mmr, int index, int desc)
> -{
> -	u64 stat;
> -
> -	stat = ((read_lmmr(status_mmr) >> index) & UV_ACT_STATUS_MASK) << 1;
> -	stat |= (read_lmmr(UVH_LB_BAU_SB_ACTIVATION_STATUS_2) >> desc) & 0x1;
> -
> -	return stat;
> -}
> -
> -static int uv4_wait_completion(struct bau_desc *bau_desc,
> -				struct bau_control *bcp, long try)
> -{
> -	struct ptc_stats *stat = bcp->statp;
> -	u64 descriptor_stat;
> -	u64 mmr = bcp->status_mmr;
> -	int index = bcp->status_index;
> -	int desc = bcp->uvhub_cpu;
> -
> -	descriptor_stat = read_status(mmr, index, desc);
> -
> -	/* spin on the status MMR, waiting for it to go idle */
> -	while (descriptor_stat != UV2H_DESC_IDLE) {
> -		switch (descriptor_stat) {
> -		case UV2H_DESC_SOURCE_TIMEOUT:
> -			stat->s_stimeout++;
> -			return FLUSH_GIVEUP;
> -
> -		case UV2H_DESC_DEST_TIMEOUT:
> -			stat->s_dtimeout++;
> -			bcp->conseccompletes = 0;
> -			return FLUSH_RETRY_TIMEOUT;
> -
> -		case UV2H_DESC_DEST_STRONG_NACK:
> -			stat->s_plugged++;
> -			bcp->conseccompletes = 0;
> -			return FLUSH_RETRY_PLUGGED;
> -
> -		case UV2H_DESC_DEST_PUT_ERR:
> -			bcp->conseccompletes = 0;
> -			return FLUSH_GIVEUP;
> -
> -		default:
> -			/* descriptor_stat is still BUSY */
> -			cpu_relax();
> -		}
> -		descriptor_stat = read_status(mmr, index, desc);
> -	}
> -	bcp->conseccompletes++;
> -	return FLUSH_COMPLETE;
> -}
> -
> -/*
> - * Our retries are blocked by all destination sw ack resources being
> - * in use, and a timeout is pending. In that case hardware immediately
> - * returns the ERROR that looks like a destination timeout.
> - */
> -static void destination_plugged(struct bau_desc *bau_desc,
> -			struct bau_control *bcp,
> -			struct bau_control *hmaster, struct ptc_stats *stat)
> -{
> -	udelay(bcp->plugged_delay);
> -	bcp->plugged_tries++;
> -
> -	if (bcp->plugged_tries >= bcp->plugsb4reset) {
> -		bcp->plugged_tries = 0;
> -
> -		quiesce_local_uvhub(hmaster);
> -
> -		spin_lock(&hmaster->queue_lock);
> -		reset_with_ipi(&bau_desc->distribution, bcp);
> -		spin_unlock(&hmaster->queue_lock);
> -
> -		end_uvhub_quiesce(hmaster);
> -
> -		bcp->ipi_attempts++;
> -		stat->s_resets_plug++;
> -	}
> -}
> -
> -static void destination_timeout(struct bau_desc *bau_desc,
> -			struct bau_control *bcp, struct bau_control *hmaster,
> -			struct ptc_stats *stat)
> -{
> -	hmaster->max_concurr = 1;
> -	bcp->timeout_tries++;
> -	if (bcp->timeout_tries >= bcp->timeoutsb4reset) {
> -		bcp->timeout_tries = 0;
> -
> -		quiesce_local_uvhub(hmaster);
> -
> -		spin_lock(&hmaster->queue_lock);
> -		reset_with_ipi(&bau_desc->distribution, bcp);
> -		spin_unlock(&hmaster->queue_lock);
> -
> -		end_uvhub_quiesce(hmaster);
> -
> -		bcp->ipi_attempts++;
> -		stat->s_resets_timeout++;
> -	}
> -}
> -
> -/*
> - * Stop all cpus on a uvhub from using the BAU for a period of time.
> - * This is reversed by check_enable.
> - */
> -static void disable_for_period(struct bau_control *bcp, struct ptc_stats *stat)
> -{
> -	int tcpu;
> -	struct bau_control *tbcp;
> -	struct bau_control *hmaster;
> -	cycles_t tm1;
> -
> -	hmaster = bcp->uvhub_master;
> -	spin_lock(&hmaster->disable_lock);
> -	if (!bcp->baudisabled) {
> -		stat->s_bau_disabled++;
> -		tm1 = get_cycles();
> -		for_each_present_cpu(tcpu) {
> -			tbcp = &per_cpu(bau_control, tcpu);
> -			if (tbcp->uvhub_master == hmaster) {
> -				tbcp->baudisabled = 1;
> -				tbcp->set_bau_on_time =
> -					tm1 + bcp->disabled_period;
> -			}
> -		}
> -	}
> -	spin_unlock(&hmaster->disable_lock);
> -}
> -
> -static void count_max_concurr(int stat, struct bau_control *bcp,
> -				struct bau_control *hmaster)
> -{
> -	bcp->plugged_tries = 0;
> -	bcp->timeout_tries = 0;
> -	if (stat != FLUSH_COMPLETE)
> -		return;
> -	if (bcp->conseccompletes <= bcp->complete_threshold)
> -		return;
> -	if (hmaster->max_concurr >= hmaster->max_concurr_const)
> -		return;
> -	hmaster->max_concurr++;
> -}
> -
> -static void record_send_stats(cycles_t time1, cycles_t time2,
> -		struct bau_control *bcp, struct ptc_stats *stat,
> -		int completion_status, int try)
> -{
> -	cycles_t elapsed;
> -
> -	if (time2 > time1) {
> -		elapsed = time2 - time1;
> -		stat->s_time += elapsed;
> -
> -		if ((completion_status == FLUSH_COMPLETE) && (try == 1)) {
> -			bcp->period_requests++;
> -			bcp->period_time += elapsed;
> -			if ((elapsed > usec_2_cycles(bcp->cong_response_us)) &&
> -			    (bcp->period_requests > bcp->cong_reps) &&
> -			    ((bcp->period_time / bcp->period_requests) >
> -					usec_2_cycles(bcp->cong_response_us))) {
> -				stat->s_congested++;
> -				disable_for_period(bcp, stat);
> -			}
> -		}
> -	} else
> -		stat->s_requestor--;
> -
> -	if (completion_status == FLUSH_COMPLETE && try > 1)
> -		stat->s_retriesok++;
> -	else if (completion_status == FLUSH_GIVEUP) {
> -		stat->s_giveup++;
> -		if (get_cycles() > bcp->period_end)
> -			bcp->period_giveups = 0;
> -		bcp->period_giveups++;
> -		if (bcp->period_giveups == 1)
> -			bcp->period_end = get_cycles() + bcp->disabled_period;
> -		if (bcp->period_giveups > bcp->giveup_limit) {
> -			disable_for_period(bcp, stat);
> -			stat->s_giveuplimit++;
> -		}
> -	}
> -}
> -
> -/*
> - * Handle the completion status of a message send.
> - */
> -static void handle_cmplt(int completion_status, struct bau_desc *bau_desc,
> -			struct bau_control *bcp, struct bau_control *hmaster,
> -			struct ptc_stats *stat)
> -{
> -	if (completion_status == FLUSH_RETRY_PLUGGED)
> -		destination_plugged(bau_desc, bcp, hmaster, stat);
> -	else if (completion_status == FLUSH_RETRY_TIMEOUT)
> -		destination_timeout(bau_desc, bcp, hmaster, stat);
> -}
> -
> -/*
> - * Send a broadcast and wait for it to complete.
> - *
> - * The flush_mask contains the cpus the broadcast is to be sent to including
> - * cpus that are on the local uvhub.
> - *
> - * Returns 0 if all flushing represented in the mask was done.
> - * Returns 1 if it gives up entirely and the original cpu mask is to be
> - * returned to the kernel.
> - */
> -static int uv_flush_send_and_wait(struct cpumask *flush_mask,
> -				  struct bau_control *bcp,
> -				  struct bau_desc *bau_desc)
> -{
> -	int seq_number = 0;
> -	int completion_stat = 0;
> -	long try = 0;
> -	unsigned long index;
> -	cycles_t time1;
> -	cycles_t time2;
> -	struct ptc_stats *stat = bcp->statp;
> -	struct bau_control *hmaster = bcp->uvhub_master;
> -	struct uv2_3_bau_msg_header *uv2_3_hdr = NULL;
> -
> -	while (hmaster->uvhub_quiesce)
> -		cpu_relax();
> -
> -	time1 = get_cycles();
> -	uv2_3_hdr = &bau_desc->header.uv2_3_hdr;
> -
> -	do {
> -		if (try == 0) {
> -			uv2_3_hdr->msg_type = MSG_REGULAR;
> -			seq_number = bcp->message_number++;
> -		} else {
> -			uv2_3_hdr->msg_type = MSG_RETRY;
> -			stat->s_retry_messages++;
> -		}
> -
> -		uv2_3_hdr->sequence = seq_number;
> -		index = (1UL << AS_PUSH_SHIFT) | bcp->uvhub_cpu;
> -		bcp->send_message = get_cycles();
> -
> -		write_mmr_activation(index);
> -
> -		try++;
> -		completion_stat = ops.wait_completion(bau_desc, bcp, try);
> -
> -		handle_cmplt(completion_stat, bau_desc, bcp, hmaster, stat);
> -
> -		if (bcp->ipi_attempts >= bcp->ipi_reset_limit) {
> -			bcp->ipi_attempts = 0;
> -			stat->s_overipilimit++;
> -			completion_stat = FLUSH_GIVEUP;
> -			break;
> -		}
> -		cpu_relax();
> -	} while ((completion_stat == FLUSH_RETRY_PLUGGED) ||
> -		 (completion_stat == FLUSH_RETRY_TIMEOUT));
> -
> -	time2 = get_cycles();
> -
> -	count_max_concurr(completion_stat, bcp, hmaster);
> -
> -	while (hmaster->uvhub_quiesce)
> -		cpu_relax();
> -
> -	atomic_dec(&hmaster->active_descriptor_count);
> -
> -	record_send_stats(time1, time2, bcp, stat, completion_stat, try);
> -
> -	if (completion_stat == FLUSH_GIVEUP)
> -		/* FLUSH_GIVEUP will fall back to using IPI's for tlb flush */
> -		return 1;
> -	return 0;
> -}
> -
> -/*
> - * The BAU is disabled for this uvhub. When the disabled time period has
> - * expired re-enable it.
> - * Return 0 if it is re-enabled for all cpus on this uvhub.
> - */
> -static int check_enable(struct bau_control *bcp, struct ptc_stats *stat)
> -{
> -	int tcpu;
> -	struct bau_control *tbcp;
> -	struct bau_control *hmaster;
> -
> -	hmaster = bcp->uvhub_master;
> -	spin_lock(&hmaster->disable_lock);
> -	if (bcp->baudisabled && (get_cycles() >= bcp->set_bau_on_time)) {
> -		stat->s_bau_reenabled++;
> -		for_each_present_cpu(tcpu) {
> -			tbcp = &per_cpu(bau_control, tcpu);
> -			if (tbcp->uvhub_master == hmaster) {
> -				tbcp->baudisabled = 0;
> -				tbcp->period_requests = 0;
> -				tbcp->period_time = 0;
> -				tbcp->period_giveups = 0;
> -			}
> -		}
> -		spin_unlock(&hmaster->disable_lock);
> -		return 0;
> -	}
> -	spin_unlock(&hmaster->disable_lock);
> -	return -1;
> -}
> -
> -static void record_send_statistics(struct ptc_stats *stat, int locals, int hubs,
> -				int remotes, struct bau_desc *bau_desc)
> -{
> -	stat->s_requestor++;
> -	stat->s_ntargcpu += remotes + locals;
> -	stat->s_ntargremotes += remotes;
> -	stat->s_ntarglocals += locals;
> -
> -	/* uvhub statistics */
> -	hubs = bau_uvhub_weight(&bau_desc->distribution);
> -	if (locals) {
> -		stat->s_ntarglocaluvhub++;
> -		stat->s_ntargremoteuvhub += (hubs - 1);
> -	} else
> -		stat->s_ntargremoteuvhub += hubs;
> -
> -	stat->s_ntarguvhub += hubs;
> -
> -	if (hubs >= 16)
> -		stat->s_ntarguvhub16++;
> -	else if (hubs >= 8)
> -		stat->s_ntarguvhub8++;
> -	else if (hubs >= 4)
> -		stat->s_ntarguvhub4++;
> -	else if (hubs >= 2)
> -		stat->s_ntarguvhub2++;
> -	else
> -		stat->s_ntarguvhub1++;
> -}
> -
> -/*
> - * Translate a cpu mask to the uvhub distribution mask in the BAU
> - * activation descriptor.
> - */
> -static int set_distrib_bits(struct cpumask *flush_mask, struct bau_control *bcp,
> -			struct bau_desc *bau_desc, int *localsp, int *remotesp)
> -{
> -	int cpu;
> -	int pnode;
> -	int cnt = 0;
> -	struct hub_and_pnode *hpp;
> -
> -	for_each_cpu(cpu, flush_mask) {
> -		/*
> -		 * The distribution vector is a bit map of pnodes, relative
> -		 * to the partition base pnode (and the partition base nasid
> -		 * in the header).
> -		 * Translate cpu to pnode and hub using a local memory array.
> -		 */
> -		hpp = &bcp->socket_master->thp[cpu];
> -		pnode = hpp->pnode - bcp->partition_base_pnode;
> -		bau_uvhub_set(pnode, &bau_desc->distribution);
> -		cnt++;
> -		if (hpp->uvhub == bcp->uvhub)
> -			(*localsp)++;
> -		else
> -			(*remotesp)++;
> -	}
> -	if (!cnt)
> -		return 1;
> -	return 0;
> -}
> -
> -/*
> - * globally purge translation cache of a virtual address or all TLB's
> - * @cpumask: mask of all cpu's in which the address is to be removed
> - * @mm: mm_struct containing virtual address range
> - * @start: start virtual address to be removed from TLB
> - * @end: end virtual address to be remove from TLB
> - * @cpu: the current cpu
> - *
> - * This is the entry point for initiating any UV global TLB shootdown.
> - *
> - * Purges the translation caches of all specified processors of the given
> - * virtual address, or purges all TLB's on specified processors.
> - *
> - * The caller has derived the cpumask from the mm_struct.  This function
> - * is called only if there are bits set in the mask. (e.g. flush_tlb_page())
> - *
> - * The cpumask is converted into a uvhubmask of the uvhubs containing
> - * those cpus.
> - *
> - * Note that this function should be called with preemption disabled.
> - *
> - * Returns NULL if all remote flushing was done.
> - * Returns pointer to cpumask if some remote flushing remains to be
> - * done.  The returned pointer is valid till preemption is re-enabled.
> - */
> -const struct cpumask *uv_flush_tlb_others(const struct cpumask *cpumask,
> -					  const struct flush_tlb_info *info)
> -{
> -	unsigned int cpu = smp_processor_id();
> -	int locals = 0, remotes = 0, hubs = 0;
> -	struct bau_desc *bau_desc;
> -	struct cpumask *flush_mask;
> -	struct ptc_stats *stat;
> -	struct bau_control *bcp;
> -	unsigned long descriptor_status, status, address;
> -
> -	bcp = &per_cpu(bau_control, cpu);
> -
> -	if (bcp->nobau)
> -		return cpumask;
> -
> -	stat = bcp->statp;
> -	stat->s_enters++;
> -
> -	if (bcp->busy) {
> -		descriptor_status =
> -			read_lmmr(UVH_LB_BAU_SB_ACTIVATION_STATUS_0);
> -		status = ((descriptor_status >> (bcp->uvhub_cpu *
> -			UV_ACT_STATUS_SIZE)) & UV_ACT_STATUS_MASK) << 1;
> -		if (status == UV2H_DESC_BUSY)
> -			return cpumask;
> -		bcp->busy = 0;
> -	}
> -
> -	/* bau was disabled due to slow response */
> -	if (bcp->baudisabled) {
> -		if (check_enable(bcp, stat)) {
> -			stat->s_ipifordisabled++;
> -			return cpumask;
> -		}
> -	}
> -
> -	/*
> -	 * Each sending cpu has a per-cpu mask which it fills from the caller's
> -	 * cpu mask.  All cpus are converted to uvhubs and copied to the
> -	 * activation descriptor.
> -	 */
> -	flush_mask = (struct cpumask *)per_cpu(uv_flush_tlb_mask, cpu);
> -	/* don't actually do a shootdown of the local cpu */
> -	cpumask_andnot(flush_mask, cpumask, cpumask_of(cpu));
> -
> -	if (cpumask_test_cpu(cpu, cpumask))
> -		stat->s_ntargself++;
> -
> -	bau_desc = bcp->descriptor_base;
> -	bau_desc += (ITEMS_PER_DESC * bcp->uvhub_cpu);
> -	bau_uvhubs_clear(&bau_desc->distribution, UV_DISTRIBUTION_SIZE);
> -	if (set_distrib_bits(flush_mask, bcp, bau_desc, &locals, &remotes))
> -		return NULL;
> -
> -	record_send_statistics(stat, locals, hubs, remotes, bau_desc);
> -
> -	if (!info->end || (info->end - info->start) <= PAGE_SIZE)
> -		address = info->start;
> -	else
> -		address = TLB_FLUSH_ALL;
> -
> -	switch (bcp->uvhub_version) {
> -	case UV_BAU_V2:
> -	case UV_BAU_V3:
> -		bau_desc->payload.uv2_3.address = address;
> -		bau_desc->payload.uv2_3.sending_cpu = cpu;
> -		break;
> -	case UV_BAU_V4:
> -		bau_desc->payload.uv4.address = address;
> -		bau_desc->payload.uv4.sending_cpu = cpu;
> -		bau_desc->payload.uv4.qualifier = BAU_DESC_QUALIFIER;
> -		break;
> -	}
> -
> -	/*
> -	 * uv_flush_send_and_wait returns 0 if all cpu's were messaged,
> -	 * or 1 if it gave up and the original cpumask should be returned.
> -	 */
> -	if (!uv_flush_send_and_wait(flush_mask, bcp, bau_desc))
> -		return NULL;
> -	else
> -		return cpumask;
> -}
> -
> -/*
> - * Search the message queue for any 'other' unprocessed message with the
> - * same software acknowledge resource bit vector as the 'msg' message.
> - */
> -static struct bau_pq_entry *find_another_by_swack(struct bau_pq_entry *msg,
> -						  struct bau_control *bcp)
> -{
> -	struct bau_pq_entry *msg_next = msg + 1;
> -	unsigned char swack_vec = msg->swack_vec;
> -
> -	if (msg_next > bcp->queue_last)
> -		msg_next = bcp->queue_first;
> -	while (msg_next != msg) {
> -		if ((msg_next->canceled == 0) && (msg_next->replied_to == 0) &&
> -				(msg_next->swack_vec == swack_vec))
> -			return msg_next;
> -		msg_next++;
> -		if (msg_next > bcp->queue_last)
> -			msg_next = bcp->queue_first;
> -	}
> -	return NULL;
> -}
> -
> -/*
> - * UV2 needs to work around a bug in which an arriving message has not
> - * set a bit in the UVH_LB_BAU_INTD_SOFTWARE_ACKNOWLEDGE register.
> - * Such a message must be ignored.
> - */
> -static void process_uv2_message(struct msg_desc *mdp, struct bau_control *bcp)
> -{
> -	unsigned long mmr_image;
> -	unsigned char swack_vec;
> -	struct bau_pq_entry *msg = mdp->msg;
> -	struct bau_pq_entry *other_msg;
> -
> -	mmr_image = ops.read_l_sw_ack();
> -	swack_vec = msg->swack_vec;
> -
> -	if ((swack_vec & mmr_image) == 0) {
> -		/*
> -		 * This message was assigned a swack resource, but no
> -		 * reserved acknowlegment is pending.
> -		 * The bug has prevented this message from setting the MMR.
> -		 */
> -		/*
> -		 * Some message has set the MMR 'pending' bit; it might have
> -		 * been another message.  Look for that message.
> -		 */
> -		other_msg = find_another_by_swack(msg, bcp);
> -		if (other_msg) {
> -			/*
> -			 * There is another. Process this one but do not
> -			 * ack it.
> -			 */
> -			bau_process_message(mdp, bcp, 0);
> -			/*
> -			 * Let the natural processing of that other message
> -			 * acknowledge it. Don't get the processing of sw_ack's
> -			 * out of order.
> -			 */
> -			return;
> -		}
> -	}
> -
> -	/*
> -	 * Either the MMR shows this one pending a reply or there is no
> -	 * other message using this sw_ack, so it is safe to acknowledge it.
> -	 */
> -	bau_process_message(mdp, bcp, 1);
> -
> -	return;
> -}
> -
> -/*
> - * The BAU message interrupt comes here. (registered by set_intr_gate)
> - * See entry_64.S
> - *
> - * We received a broadcast assist message.
> - *
> - * Interrupts are disabled; this interrupt could represent
> - * the receipt of several messages.
> - *
> - * All cores/threads on this hub get this interrupt.
> - * The last one to see it does the software ack.
> - * (the resource will not be freed until noninterruptable cpus see this
> - *  interrupt; hardware may timeout the s/w ack and reply ERROR)
> - */
> -DEFINE_IDTENTRY_SYSVEC(sysvec_uv_bau_message)
> -{
> -	int count = 0;
> -	cycles_t time_start;
> -	struct bau_pq_entry *msg;
> -	struct bau_control *bcp;
> -	struct ptc_stats *stat;
> -	struct msg_desc msgdesc;
> -
> -	ack_APIC_irq();
> -	kvm_set_cpu_l1tf_flush_l1d();
> -	time_start = get_cycles();
> -
> -	bcp = &per_cpu(bau_control, smp_processor_id());
> -	stat = bcp->statp;
> -
> -	msgdesc.queue_first = bcp->queue_first;
> -	msgdesc.queue_last = bcp->queue_last;
> -
> -	msg = bcp->bau_msg_head;
> -	while (msg->swack_vec) {
> -		count++;
> -
> -		msgdesc.msg_slot = msg - msgdesc.queue_first;
> -		msgdesc.msg = msg;
> -		if (bcp->uvhub_version == UV_BAU_V2)
> -			process_uv2_message(&msgdesc, bcp);
> -		else
> -			/* no error workaround for uv3 */
> -			bau_process_message(&msgdesc, bcp, 1);
> -
> -		msg++;
> -		if (msg > msgdesc.queue_last)
> -			msg = msgdesc.queue_first;
> -		bcp->bau_msg_head = msg;
> -	}
> -	stat->d_time += (get_cycles() - time_start);
> -	if (!count)
> -		stat->d_nomsg++;
> -	else if (count > 1)
> -		stat->d_multmsg++;
> -}
> -
> -/*
> - * Each target uvhub (i.e. a uvhub that has cpu's) needs to have
> - * shootdown message timeouts enabled.  The timeout does not cause
> - * an interrupt, but causes an error message to be returned to
> - * the sender.
> - */
> -static void __init enable_timeouts(void)
> -{
> -	int uvhub;
> -	int nuvhubs;
> -	int pnode;
> -	unsigned long mmr_image;
> -
> -	nuvhubs = uv_num_possible_blades();
> -
> -	for (uvhub = 0; uvhub < nuvhubs; uvhub++) {
> -		if (!uv_blade_nr_possible_cpus(uvhub))
> -			continue;
> -
> -		pnode = uv_blade_to_pnode(uvhub);
> -		mmr_image = read_mmr_misc_control(pnode);
> -		/*
> -		 * Set the timeout period and then lock it in, in three
> -		 * steps; captures and locks in the period.
> -		 *
> -		 * To program the period, the SOFT_ACK_MODE must be off.
> -		 */
> -		mmr_image &= ~(1L << SOFTACK_MSHIFT);
> -		write_mmr_misc_control(pnode, mmr_image);
> -		/*
> -		 * Set the 4-bit period.
> -		 */
> -		mmr_image &= ~((unsigned long)0xf << SOFTACK_PSHIFT);
> -		mmr_image |= (SOFTACK_TIMEOUT_PERIOD << SOFTACK_PSHIFT);
> -		write_mmr_misc_control(pnode, mmr_image);
> -
> -		mmr_image |= (1L << SOFTACK_MSHIFT);
> -		if (is_uv2_hub()) {
> -			/* do not touch the legacy mode bit */
> -			/* hw bug workaround; do not use extended status */
> -			mmr_image &= ~(1L << UV2_EXT_SHFT);
> -		} else if (is_uv3_hub()) {
> -			mmr_image &= ~(1L << PREFETCH_HINT_SHFT);
> -			mmr_image |= (1L << SB_STATUS_SHFT);
> -		}
> -		write_mmr_misc_control(pnode, mmr_image);
> -	}
> -}
> -
> -static void *ptc_seq_start(struct seq_file *file, loff_t *offset)
> -{
> -	if (*offset < num_possible_cpus())
> -		return offset;
> -	return NULL;
> -}
> -
> -static void *ptc_seq_next(struct seq_file *file, void *data, loff_t *offset)
> -{
> -	(*offset)++;
> -	if (*offset < num_possible_cpus())
> -		return offset;
> -	return NULL;
> -}
> -
> -static void ptc_seq_stop(struct seq_file *file, void *data)
> -{
> -}
> -
> -/*
> - * Display the statistics thru /proc/sgi_uv/ptc_statistics
> - * 'data' points to the cpu number
> - * Note: see the descriptions in stat_description[].
> - */
> -static int ptc_seq_show(struct seq_file *file, void *data)
> -{
> -	struct ptc_stats *stat;
> -	struct bau_control *bcp;
> -	int cpu;
> -
> -	cpu = *(loff_t *)data;
> -	if (!cpu) {
> -		seq_puts(file,
> -			 "# cpu bauoff sent stime self locals remotes ncpus localhub ");
> -		seq_puts(file, "remotehub numuvhubs numuvhubs16 numuvhubs8 ");
> -		seq_puts(file,
> -			 "numuvhubs4 numuvhubs2 numuvhubs1 dto snacks retries ");
> -		seq_puts(file,
> -			 "rok resetp resett giveup sto bz throt disable ");
> -		seq_puts(file,
> -			 "enable wars warshw warwaits enters ipidis plugged ");
> -		seq_puts(file,
> -			 "ipiover glim cong swack recv rtime all one mult ");
> -		seq_puts(file, "none retry canc nocan reset rcan\n");
> -	}
> -	if (cpu < num_possible_cpus() && cpu_online(cpu)) {
> -		bcp = &per_cpu(bau_control, cpu);
> -		if (bcp->nobau) {
> -			seq_printf(file, "cpu %d bau disabled\n", cpu);
> -			return 0;
> -		}
> -		stat = bcp->statp;
> -		/* source side statistics */
> -		seq_printf(file,
> -			"cpu %d %d %ld %ld %ld %ld %ld %ld %ld %ld %ld %ld ",
> -			   cpu, bcp->nobau, stat->s_requestor,
> -			   cycles_2_us(stat->s_time),
> -			   stat->s_ntargself, stat->s_ntarglocals,
> -			   stat->s_ntargremotes, stat->s_ntargcpu,
> -			   stat->s_ntarglocaluvhub, stat->s_ntargremoteuvhub,
> -			   stat->s_ntarguvhub, stat->s_ntarguvhub16);
> -		seq_printf(file, "%ld %ld %ld %ld %ld %ld ",
> -			   stat->s_ntarguvhub8, stat->s_ntarguvhub4,
> -			   stat->s_ntarguvhub2, stat->s_ntarguvhub1,
> -			   stat->s_dtimeout, stat->s_strongnacks);
> -		seq_printf(file, "%ld %ld %ld %ld %ld %ld %ld %ld ",
> -			   stat->s_retry_messages, stat->s_retriesok,
> -			   stat->s_resets_plug, stat->s_resets_timeout,
> -			   stat->s_giveup, stat->s_stimeout,
> -			   stat->s_busy, stat->s_throttles);
> -		seq_printf(file, "%ld %ld %ld %ld %ld %ld %ld %ld %ld %ld %ld ",
> -			   stat->s_bau_disabled, stat->s_bau_reenabled,
> -			   stat->s_uv2_wars, stat->s_uv2_wars_hw,
> -			   stat->s_uv2_war_waits, stat->s_enters,
> -			   stat->s_ipifordisabled, stat->s_plugged,
> -			   stat->s_overipilimit, stat->s_giveuplimit,
> -			   stat->s_congested);
> -
> -		/* destination side statistics */
> -		seq_printf(file,
> -			"%lx %ld %ld %ld %ld %ld %ld %ld %ld %ld %ld %ld\n",
> -			   ops.read_g_sw_ack(uv_cpu_to_pnode(cpu)),
> -			   stat->d_requestee, cycles_2_us(stat->d_time),
> -			   stat->d_alltlb, stat->d_onetlb, stat->d_multmsg,
> -			   stat->d_nomsg, stat->d_retries, stat->d_canceled,
> -			   stat->d_nocanceled, stat->d_resets,
> -			   stat->d_rcanceled);
> -	}
> -	return 0;
> -}
> -
> -/*
> - * Display the tunables thru debugfs
> - */
> -static ssize_t tunables_read(struct file *file, char __user *userbuf,
> -				size_t count, loff_t *ppos)
> -{
> -	char *buf;
> -	int ret;
> -
> -	buf = kasprintf(GFP_KERNEL, "%s %s %s\n%d %d %d %d %d %d %d %d %d %d\n",
> -		"max_concur plugged_delay plugsb4reset timeoutsb4reset",
> -		"ipi_reset_limit complete_threshold congested_response_us",
> -		"congested_reps disabled_period giveup_limit",
> -		max_concurr, plugged_delay, plugsb4reset,
> -		timeoutsb4reset, ipi_reset_limit, complete_threshold,
> -		congested_respns_us, congested_reps, disabled_period,
> -		giveup_limit);
> -
> -	if (!buf)
> -		return -ENOMEM;
> -
> -	ret = simple_read_from_buffer(userbuf, count, ppos, buf, strlen(buf));
> -	kfree(buf);
> -	return ret;
> -}
> -
> -/*
> - * handle a write to /proc/sgi_uv/ptc_statistics
> - * -1: reset the statistics
> - *  0: display meaning of the statistics
> - */
> -static ssize_t ptc_proc_write(struct file *file, const char __user *user,
> -				size_t count, loff_t *data)
> -{
> -	int cpu;
> -	int i;
> -	int elements;
> -	long input_arg;
> -	char optstr[64];
> -	struct ptc_stats *stat;
> -
> -	if (count == 0 || count > sizeof(optstr))
> -		return -EINVAL;
> -	if (copy_from_user(optstr, user, count))
> -		return -EFAULT;
> -	optstr[count - 1] = '\0';
> -
> -	if (!strcmp(optstr, "on")) {
> -		set_bau_on();
> -		return count;
> -	} else if (!strcmp(optstr, "off")) {
> -		set_bau_off();
> -		return count;
> -	}
> -
> -	if (kstrtol(optstr, 10, &input_arg) < 0) {
> -		pr_debug("%s is invalid\n", optstr);
> -		return -EINVAL;
> -	}
> -
> -	if (input_arg == 0) {
> -		elements = ARRAY_SIZE(stat_description);
> -		pr_debug("# cpu:      cpu number\n");
> -		pr_debug("Sender statistics:\n");
> -		for (i = 0; i < elements; i++)
> -			pr_debug("%s\n", stat_description[i]);
> -	} else if (input_arg == -1) {
> -		for_each_present_cpu(cpu) {
> -			stat = &per_cpu(ptcstats, cpu);
> -			memset(stat, 0, sizeof(struct ptc_stats));
> -		}
> -	}
> -
> -	return count;
> -}
> -
> -static int local_atoi(const char *name)
> -{
> -	int val = 0;
> -
> -	for (;; name++) {
> -		switch (*name) {
> -		case '0' ... '9':
> -			val = 10*val+(*name-'0');
> -			break;
> -		default:
> -			return val;
> -		}
> -	}
> -}
> -
> -/*
> - * Parse the values written to /sys/kernel/debug/sgi_uv/bau_tunables.
> - * Zero values reset them to defaults.
> - */
> -static int parse_tunables_write(struct bau_control *bcp, char *instr,
> -				int count)
> -{
> -	char *p;
> -	char *q;
> -	int cnt = 0;
> -	int val;
> -	int e = ARRAY_SIZE(tunables);
> -
> -	p = instr + strspn(instr, WHITESPACE);
> -	q = p;
> -	for (; *p; p = q + strspn(q, WHITESPACE)) {
> -		q = p + strcspn(p, WHITESPACE);
> -		cnt++;
> -		if (q == p)
> -			break;
> -	}
> -	if (cnt != e) {
> -		pr_info("bau tunable error: should be %d values\n", e);
> -		return -EINVAL;
> -	}
> -
> -	p = instr + strspn(instr, WHITESPACE);
> -	q = p;
> -	for (cnt = 0; *p; p = q + strspn(q, WHITESPACE), cnt++) {
> -		q = p + strcspn(p, WHITESPACE);
> -		val = local_atoi(p);
> -		switch (cnt) {
> -		case 0:
> -			if (val == 0) {
> -				max_concurr = MAX_BAU_CONCURRENT;
> -				max_concurr_const = MAX_BAU_CONCURRENT;
> -				continue;
> -			}
> -			if (val < 1 || val > bcp->cpus_in_uvhub) {
> -				pr_debug(
> -				"Error: BAU max concurrent %d is invalid\n",
> -				val);
> -				return -EINVAL;
> -			}
> -			max_concurr = val;
> -			max_concurr_const = val;
> -			continue;
> -		default:
> -			if (val == 0)
> -				*tunables[cnt].tunp = tunables[cnt].deflt;
> -			else
> -				*tunables[cnt].tunp = val;
> -			continue;
> -		}
> -	}
> -	return 0;
> -}
> -
> -/*
> - * Handle a write to debugfs. (/sys/kernel/debug/sgi_uv/bau_tunables)
> - */
> -static ssize_t tunables_write(struct file *file, const char __user *user,
> -				size_t count, loff_t *data)
> -{
> -	int cpu;
> -	int ret;
> -	char instr[100];
> -	struct bau_control *bcp;
> -
> -	if (count == 0 || count > sizeof(instr)-1)
> -		return -EINVAL;
> -	if (copy_from_user(instr, user, count))
> -		return -EFAULT;
> -
> -	instr[count] = '\0';
> -
> -	cpu = get_cpu();
> -	bcp = &per_cpu(bau_control, cpu);
> -	ret = parse_tunables_write(bcp, instr, count);
> -	put_cpu();
> -	if (ret)
> -		return ret;
> -
> -	for_each_present_cpu(cpu) {
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->max_concurr         = max_concurr;
> -		bcp->max_concurr_const   = max_concurr;
> -		bcp->plugged_delay       = plugged_delay;
> -		bcp->plugsb4reset        = plugsb4reset;
> -		bcp->timeoutsb4reset     = timeoutsb4reset;
> -		bcp->ipi_reset_limit     = ipi_reset_limit;
> -		bcp->complete_threshold  = complete_threshold;
> -		bcp->cong_response_us    = congested_respns_us;
> -		bcp->cong_reps           = congested_reps;
> -		bcp->disabled_period     = sec_2_cycles(disabled_period);
> -		bcp->giveup_limit        = giveup_limit;
> -	}
> -	return count;
> -}
> -
> -static const struct seq_operations uv_ptc_seq_ops = {
> -	.start		= ptc_seq_start,
> -	.next		= ptc_seq_next,
> -	.stop		= ptc_seq_stop,
> -	.show		= ptc_seq_show
> -};
> -
> -static int ptc_proc_open(struct inode *inode, struct file *file)
> -{
> -	return seq_open(file, &uv_ptc_seq_ops);
> -}
> -
> -static int tunables_open(struct inode *inode, struct file *file)
> -{
> -	return 0;
> -}
> -
> -static const struct proc_ops uv_ptc_proc_ops = {
> -	.proc_open	= ptc_proc_open,
> -	.proc_read	= seq_read,
> -	.proc_write	= ptc_proc_write,
> -	.proc_lseek	= seq_lseek,
> -	.proc_release	= seq_release,
> -};
> -
> -static const struct file_operations tunables_fops = {
> -	.open		= tunables_open,
> -	.read		= tunables_read,
> -	.write		= tunables_write,
> -	.llseek		= default_llseek,
> -};
> -
> -static int __init uv_ptc_init(void)
> -{
> -	struct proc_dir_entry *proc_uv_ptc;
> -
> -	if (!is_uv_system())
> -		return 0;
> -
> -	proc_uv_ptc = proc_create(UV_PTC_BASENAME, 0444, NULL,
> -				  &uv_ptc_proc_ops);
> -	if (!proc_uv_ptc) {
> -		pr_err("unable to create %s proc entry\n",
> -		       UV_PTC_BASENAME);
> -		return -EINVAL;
> -	}
> -
> -	tunables_dir = debugfs_create_dir(UV_BAU_TUNABLES_DIR, NULL);
> -	debugfs_create_file(UV_BAU_TUNABLES_FILE, 0600, tunables_dir, NULL,
> -			    &tunables_fops);
> -	return 0;
> -}
> -
> -/*
> - * Initialize the sending side's sending buffers.
> - */
> -static void activation_descriptor_init(int node, int pnode, int base_pnode)
> -{
> -	int i;
> -	int cpu;
> -	unsigned long gpa;
> -	unsigned long m;
> -	unsigned long n;
> -	size_t dsize;
> -	struct bau_desc *bau_desc;
> -	struct bau_desc *bd2;
> -	struct uv2_3_bau_msg_header *uv2_3_hdr;
> -	struct bau_control *bcp;
> -
> -	/*
> -	 * each bau_desc is 64 bytes; there are 8 (ITEMS_PER_DESC)
> -	 * per cpu; and one per cpu on the uvhub (ADP_SZ)
> -	 */
> -	dsize = sizeof(struct bau_desc) * ADP_SZ * ITEMS_PER_DESC;
> -	bau_desc = kmalloc_node(dsize, GFP_KERNEL, node);
> -	BUG_ON(!bau_desc);
> -
> -	gpa = uv_gpa(bau_desc);
> -	n = uv_gpa_to_gnode(gpa);
> -	m = ops.bau_gpa_to_offset(gpa);
> -
> -	/* the 14-bit pnode */
> -	write_mmr_descriptor_base(pnode,
> -		(n << UVH_LB_BAU_SB_DESCRIPTOR_BASE_NODE_ID_SHFT | m));
> -	/*
> -	 * Initializing all 8 (ITEMS_PER_DESC) descriptors for each
> -	 * cpu even though we only use the first one; one descriptor can
> -	 * describe a broadcast to 256 uv hubs.
> -	 */
> -	for (i = 0, bd2 = bau_desc; i < (ADP_SZ * ITEMS_PER_DESC); i++, bd2++) {
> -		memset(bd2, 0, sizeof(struct bau_desc));
> -		/*
> -		 * BIOS uses legacy mode, but uv2 and uv3 hardware always
> -		 * uses native mode for selective broadcasts.
> -		 */
> -		uv2_3_hdr = &bd2->header.uv2_3_hdr;
> -		uv2_3_hdr->swack_flag      = 1;
> -		uv2_3_hdr->base_dest_nasid = UV_PNODE_TO_NASID(base_pnode);
> -		uv2_3_hdr->dest_subnodeid  = UV_LB_SUBNODEID;
> -		uv2_3_hdr->command         = UV_NET_ENDPOINT_INTD;
> -	}
> -	for_each_present_cpu(cpu) {
> -		if (pnode != uv_blade_to_pnode(uv_cpu_to_blade_id(cpu)))
> -			continue;
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->descriptor_base = bau_desc;
> -	}
> -}
> -
> -/*
> - * initialize the destination side's receiving buffers
> - * entered for each uvhub in the partition
> - * - node is first node (kernel memory notion) on the uvhub
> - * - pnode is the uvhub's physical identifier
> - */
> -static void pq_init(int node, int pnode)
> -{
> -	int cpu;
> -	size_t plsize;
> -	char *cp;
> -	void *vp;
> -	unsigned long gnode, first, last, tail;
> -	struct bau_pq_entry *pqp;
> -	struct bau_control *bcp;
> -
> -	plsize = (DEST_Q_SIZE + 1) * sizeof(struct bau_pq_entry);
> -	vp = kmalloc_node(plsize, GFP_KERNEL, node);
> -	BUG_ON(!vp);
> -
> -	pqp = (struct bau_pq_entry *)vp;
> -	cp = (char *)pqp + 31;
> -	pqp = (struct bau_pq_entry *)(((unsigned long)cp >> 5) << 5);
> -
> -	for_each_present_cpu(cpu) {
> -		if (pnode != uv_cpu_to_pnode(cpu))
> -			continue;
> -		/* for every cpu on this pnode: */
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->queue_first	= pqp;
> -		bcp->bau_msg_head	= pqp;
> -		bcp->queue_last		= pqp + (DEST_Q_SIZE - 1);
> -	}
> -
> -	first = ops.bau_gpa_to_offset(uv_gpa(pqp));
> -	last = ops.bau_gpa_to_offset(uv_gpa(pqp + (DEST_Q_SIZE - 1)));
> -
> -	/*
> -	 * Pre UV4, the gnode is required to locate the payload queue
> -	 * and the payload queue tail must be maintained by the kernel.
> -	 */
> -	bcp = &per_cpu(bau_control, smp_processor_id());
> -	if (bcp->uvhub_version <= UV_BAU_V3) {
> -		tail = first;
> -		gnode = uv_gpa_to_gnode(uv_gpa(pqp));
> -		first = (gnode << UV_PAYLOADQ_GNODE_SHIFT) | tail;
> -		write_mmr_payload_tail(pnode, tail);
> -	}
> -
> -	ops.write_payload_first(pnode, first);
> -	ops.write_payload_last(pnode, last);
> -
> -	/* in effect, all msg_type's are set to MSG_NOOP */
> -	memset(pqp, 0, sizeof(struct bau_pq_entry) * DEST_Q_SIZE);
> -}
> -
> -/*
> - * Initialization of each UV hub's structures
> - */
> -static void __init init_uvhub(int uvhub, int vector, int base_pnode)
> -{
> -	int node;
> -	int pnode;
> -	unsigned long apicid;
> -
> -	node = uvhub_to_first_node(uvhub);
> -	pnode = uv_blade_to_pnode(uvhub);
> -
> -	activation_descriptor_init(node, pnode, base_pnode);
> -
> -	pq_init(node, pnode);
> -	/*
> -	 * The below initialization can't be in firmware because the
> -	 * messaging IRQ will be determined by the OS.
> -	 */
> -	apicid = uvhub_to_first_apicid(uvhub);
> -	write_mmr_data_config(pnode, ((apicid << 32) | vector));
> -}
> -
> -/*
> - * We will set BAU_MISC_CONTROL with a timeout period.
> - * But the BIOS has set UVH_AGING_PRESCALE_SEL and UVH_TRANSACTION_TIMEOUT.
> - * So the destination timeout period has to be calculated from them.
> - */
> -static int calculate_destination_timeout(void)
> -{
> -	unsigned long mmr_image;
> -	int mult1;
> -	int base;
> -	int ret;
> -
> -	/* same destination timeout for uv2 and uv3 */
> -	/* 4 bits  0/1 for 10/80us base, 3 bits of multiplier */
> -	mmr_image = uv_read_local_mmr(UVH_LB_BAU_MISC_CONTROL);
> -	mmr_image = (mmr_image & UV_SA_MASK) >> UV_SA_SHFT;
> -	if (mmr_image & (1L << UV2_ACK_UNITS_SHFT))
> -		base = 80;
> -	else
> -		base = 10;
> -	mult1 = mmr_image & UV2_ACK_MASK;
> -	ret = mult1 * base;
> -
> -	return ret;
> -}
> -
> -static void __init init_per_cpu_tunables(void)
> -{
> -	int cpu;
> -	struct bau_control *bcp;
> -
> -	for_each_present_cpu(cpu) {
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->baudisabled		= 0;
> -		if (nobau)
> -			bcp->nobau		= true;
> -		bcp->statp			= &per_cpu(ptcstats, cpu);
> -		/* time interval to catch a hardware stay-busy bug */
> -		bcp->timeout_interval		= usec_2_cycles(2*timeout_us);
> -		bcp->max_concurr		= max_concurr;
> -		bcp->max_concurr_const		= max_concurr;
> -		bcp->plugged_delay		= plugged_delay;
> -		bcp->plugsb4reset		= plugsb4reset;
> -		bcp->timeoutsb4reset		= timeoutsb4reset;
> -		bcp->ipi_reset_limit		= ipi_reset_limit;
> -		bcp->complete_threshold		= complete_threshold;
> -		bcp->cong_response_us		= congested_respns_us;
> -		bcp->cong_reps			= congested_reps;
> -		bcp->disabled_period		= sec_2_cycles(disabled_period);
> -		bcp->giveup_limit		= giveup_limit;
> -		spin_lock_init(&bcp->queue_lock);
> -		spin_lock_init(&bcp->uvhub_lock);
> -		spin_lock_init(&bcp->disable_lock);
> -	}
> -}
> -
> -/*
> - * Scan all cpus to collect blade and socket summaries.
> - */
> -static int __init get_cpu_topology(int base_pnode,
> -					struct uvhub_desc *uvhub_descs,
> -					unsigned char *uvhub_mask)
> -{
> -	int cpu;
> -	int pnode;
> -	int uvhub;
> -	int socket;
> -	struct bau_control *bcp;
> -	struct uvhub_desc *bdp;
> -	struct socket_desc *sdp;
> -
> -	for_each_present_cpu(cpu) {
> -		bcp = &per_cpu(bau_control, cpu);
> -
> -		memset(bcp, 0, sizeof(struct bau_control));
> -
> -		pnode = uv_cpu_hub_info(cpu)->pnode;
> -		if ((pnode - base_pnode) >= UV_DISTRIBUTION_SIZE) {
> -			pr_emerg(
> -				"cpu %d pnode %d-%d beyond %d; BAU disabled\n",
> -				cpu, pnode, base_pnode, UV_DISTRIBUTION_SIZE);
> -			return 1;
> -		}
> -
> -		bcp->osnode = cpu_to_node(cpu);
> -		bcp->partition_base_pnode = base_pnode;
> -
> -		uvhub = uv_cpu_hub_info(cpu)->numa_blade_id;
> -		*(uvhub_mask + (uvhub/8)) |= (1 << (uvhub%8));
> -		bdp = &uvhub_descs[uvhub];
> -
> -		bdp->num_cpus++;
> -		bdp->uvhub = uvhub;
> -		bdp->pnode = pnode;
> -
> -		/* kludge: 'assuming' one node per socket, and assuming that
> -		   disabling a socket just leaves a gap in node numbers */
> -		socket = bcp->osnode & 1;
> -		bdp->socket_mask |= (1 << socket);
> -		sdp = &bdp->socket[socket];
> -		sdp->cpu_number[sdp->num_cpus] = cpu;
> -		sdp->num_cpus++;
> -		if (sdp->num_cpus > MAX_CPUS_PER_SOCKET) {
> -			pr_emerg("%d cpus per socket invalid\n",
> -				sdp->num_cpus);
> -			return 1;
> -		}
> -	}
> -	return 0;
> -}
> -
> -/*
> - * Each socket is to get a local array of pnodes/hubs.
> - */
> -static void make_per_cpu_thp(struct bau_control *smaster)
> -{
> -	int cpu;
> -	size_t hpsz = sizeof(struct hub_and_pnode) * num_possible_cpus();
> -
> -	smaster->thp = kzalloc_node(hpsz, GFP_KERNEL, smaster->osnode);
> -	for_each_present_cpu(cpu) {
> -		smaster->thp[cpu].pnode = uv_cpu_hub_info(cpu)->pnode;
> -		smaster->thp[cpu].uvhub = uv_cpu_hub_info(cpu)->numa_blade_id;
> -	}
> -}
> -
> -/*
> - * Each uvhub is to get a local cpumask.
> - */
> -static void make_per_hub_cpumask(struct bau_control *hmaster)
> -{
> -	int sz = sizeof(cpumask_t);
> -
> -	hmaster->cpumask = kzalloc_node(sz, GFP_KERNEL, hmaster->osnode);
> -}
> -
> -/*
> - * Initialize all the per_cpu information for the cpu's on a given socket,
> - * given what has been gathered into the socket_desc struct.
> - * And reports the chosen hub and socket masters back to the caller.
> - */
> -static int scan_sock(struct socket_desc *sdp, struct uvhub_desc *bdp,
> -			struct bau_control **smasterp,
> -			struct bau_control **hmasterp)
> -{
> -	int i, cpu, uvhub_cpu;
> -	struct bau_control *bcp;
> -
> -	for (i = 0; i < sdp->num_cpus; i++) {
> -		cpu = sdp->cpu_number[i];
> -		bcp = &per_cpu(bau_control, cpu);
> -		bcp->cpu = cpu;
> -		if (i == 0) {
> -			*smasterp = bcp;
> -			if (!(*hmasterp))
> -				*hmasterp = bcp;
> -		}
> -		bcp->cpus_in_uvhub = bdp->num_cpus;
> -		bcp->cpus_in_socket = sdp->num_cpus;
> -		bcp->socket_master = *smasterp;
> -		bcp->uvhub = bdp->uvhub;
> -		if (is_uv2_hub())
> -			bcp->uvhub_version = UV_BAU_V2;
> -		else if (is_uv3_hub())
> -			bcp->uvhub_version = UV_BAU_V3;
> -		else if (is_uv4_hub())
> -			bcp->uvhub_version = UV_BAU_V4;
> -		else {
> -			pr_emerg("uvhub version not 1, 2, 3, or 4\n");
> -			return 1;
> -		}
> -		bcp->uvhub_master = *hmasterp;
> -		uvhub_cpu = uv_cpu_blade_processor_id(cpu);
> -		bcp->uvhub_cpu = uvhub_cpu;
> -
> -		/*
> -		 * The ERROR and BUSY status registers are located pairwise over
> -		 * the STATUS_0 and STATUS_1 mmrs; each an array[32] of 2 bits.
> -		 */
> -		if (uvhub_cpu < UV_CPUS_PER_AS) {
> -			bcp->status_mmr = UVH_LB_BAU_SB_ACTIVATION_STATUS_0;
> -			bcp->status_index = uvhub_cpu * UV_ACT_STATUS_SIZE;
> -		} else {
> -			bcp->status_mmr = UVH_LB_BAU_SB_ACTIVATION_STATUS_1;
> -			bcp->status_index = (uvhub_cpu - UV_CPUS_PER_AS)
> -						* UV_ACT_STATUS_SIZE;
> -		}
> -
> -		if (bcp->uvhub_cpu >= MAX_CPUS_PER_UVHUB) {
> -			pr_emerg("%d cpus per uvhub invalid\n",
> -				bcp->uvhub_cpu);
> -			return 1;
> -		}
> -	}
> -	return 0;
> -}
> -
> -/*
> - * Summarize the blade and socket topology into the per_cpu structures.
> - */
> -static int __init summarize_uvhub_sockets(int nuvhubs,
> -			struct uvhub_desc *uvhub_descs,
> -			unsigned char *uvhub_mask)
> -{
> -	int socket;
> -	int uvhub;
> -	unsigned short socket_mask;
> -
> -	for (uvhub = 0; uvhub < nuvhubs; uvhub++) {
> -		struct uvhub_desc *bdp;
> -		struct bau_control *smaster = NULL;
> -		struct bau_control *hmaster = NULL;
> -
> -		if (!(*(uvhub_mask + (uvhub/8)) & (1 << (uvhub%8))))
> -			continue;
> -
> -		bdp = &uvhub_descs[uvhub];
> -		socket_mask = bdp->socket_mask;
> -		socket = 0;
> -		while (socket_mask) {
> -			struct socket_desc *sdp;
> -			if ((socket_mask & 1)) {
> -				sdp = &bdp->socket[socket];
> -				if (scan_sock(sdp, bdp, &smaster, &hmaster))
> -					return 1;
> -				make_per_cpu_thp(smaster);
> -			}
> -			socket++;
> -			socket_mask = (socket_mask >> 1);
> -		}
> -		make_per_hub_cpumask(hmaster);
> -	}
> -	return 0;
> -}
> -
> -/*
> - * initialize the bau_control structure for each cpu
> - */
> -static int __init init_per_cpu(int nuvhubs, int base_part_pnode)
> -{
> -	struct uvhub_desc *uvhub_descs;
> -	unsigned char *uvhub_mask = NULL;
> -
> -	if (is_uv3_hub() || is_uv2_hub())
> -		timeout_us = calculate_destination_timeout();
> -
> -	uvhub_descs = kcalloc(nuvhubs, sizeof(struct uvhub_desc), GFP_KERNEL);
> -	if (!uvhub_descs)
> -		goto fail;
> -
> -	uvhub_mask = kzalloc((nuvhubs+7)/8, GFP_KERNEL);
> -	if (!uvhub_mask)
> -		goto fail;
> -
> -	if (get_cpu_topology(base_part_pnode, uvhub_descs, uvhub_mask))
> -		goto fail;
> -
> -	if (summarize_uvhub_sockets(nuvhubs, uvhub_descs, uvhub_mask))
> -		goto fail;
> -
> -	kfree(uvhub_descs);
> -	kfree(uvhub_mask);
> -	init_per_cpu_tunables();
> -	return 0;
> -
> -fail:
> -	kfree(uvhub_descs);
> -	kfree(uvhub_mask);
> -	return 1;
> -}
> -
> -static const struct bau_operations uv2_3_bau_ops __initconst = {
> -	.bau_gpa_to_offset       = uv_gpa_to_offset,
> -	.read_l_sw_ack           = read_mmr_sw_ack,
> -	.read_g_sw_ack           = read_gmmr_sw_ack,
> -	.write_l_sw_ack          = write_mmr_sw_ack,
> -	.write_g_sw_ack          = write_gmmr_sw_ack,
> -	.write_payload_first     = write_mmr_payload_first,
> -	.write_payload_last      = write_mmr_payload_last,
> -	.wait_completion	 = uv2_3_wait_completion,
> -};
> -
> -static const struct bau_operations uv4_bau_ops __initconst = {
> -	.bau_gpa_to_offset       = uv_gpa_to_soc_phys_ram,
> -	.read_l_sw_ack           = read_mmr_proc_sw_ack,
> -	.read_g_sw_ack           = read_gmmr_proc_sw_ack,
> -	.write_l_sw_ack          = write_mmr_proc_sw_ack,
> -	.write_g_sw_ack          = write_gmmr_proc_sw_ack,
> -	.write_payload_first     = write_mmr_proc_payload_first,
> -	.write_payload_last      = write_mmr_proc_payload_last,
> -	.wait_completion         = uv4_wait_completion,
> -};
> -
> -/*
> - * Initialization of BAU-related structures
> - */
> -static int __init uv_bau_init(void)
> -{
> -	int uvhub;
> -	int pnode;
> -	int nuvhubs;
> -	int cur_cpu;
> -	int cpus;
> -	int vector;
> -	cpumask_var_t *mask;
> -
> -	if (!is_uv_system())
> -		return 0;
> -
> -	if (is_uv4_hub())
> -		ops = uv4_bau_ops;
> -	else if (is_uv3_hub())
> -		ops = uv2_3_bau_ops;
> -	else if (is_uv2_hub())
> -		ops = uv2_3_bau_ops;
> -
> -	nuvhubs = uv_num_possible_blades();
> -	if (nuvhubs < 2) {
> -		pr_crit("UV: BAU disabled - insufficient hub count\n");
> -		goto err_bau_disable;
> -	}
> -
> -	for_each_possible_cpu(cur_cpu) {
> -		mask = &per_cpu(uv_flush_tlb_mask, cur_cpu);
> -		zalloc_cpumask_var_node(mask, GFP_KERNEL, cpu_to_node(cur_cpu));
> -	}
> -
> -	uv_base_pnode = 0x7fffffff;
> -	for (uvhub = 0; uvhub < nuvhubs; uvhub++) {
> -		cpus = uv_blade_nr_possible_cpus(uvhub);
> -		if (cpus && (uv_blade_to_pnode(uvhub) < uv_base_pnode))
> -			uv_base_pnode = uv_blade_to_pnode(uvhub);
> -	}
> -
> -	/* software timeouts are not supported on UV4 */
> -	if (is_uv3_hub() || is_uv2_hub())
> -		enable_timeouts();
> -
> -	if (init_per_cpu(nuvhubs, uv_base_pnode)) {
> -		pr_crit("UV: BAU disabled - per CPU init failed\n");
> -		goto err_bau_disable;
> -	}
> -
> -	vector = UV_BAU_MESSAGE;
> -	for_each_possible_blade(uvhub) {
> -		if (uv_blade_nr_possible_cpus(uvhub))
> -			init_uvhub(uvhub, vector, uv_base_pnode);
> -	}
> -
> -	for_each_possible_blade(uvhub) {
> -		if (uv_blade_nr_possible_cpus(uvhub)) {
> -			unsigned long val;
> -			unsigned long mmr;
> -			pnode = uv_blade_to_pnode(uvhub);
> -			/* INIT the bau */
> -			val = 1L << 63;
> -			write_gmmr_activation(pnode, val);
> -			mmr = 1; /* should be 1 to broadcast to both sockets */
> -			write_mmr_data_broadcast(pnode, mmr);
> -		}
> -	}
> -
> -	return 0;
> -
> -err_bau_disable:
> -
> -	for_each_possible_cpu(cur_cpu)
> -		free_cpumask_var(per_cpu(uv_flush_tlb_mask, cur_cpu));
> -
> -	set_bau_off();
> -	nobau_perm = 1;
> -
> -	return -EINVAL;
> -}
> -core_initcall(uv_bau_init);
> -fs_initcall(uv_ptc_init);
> -- 
> 2.21.0
> 
