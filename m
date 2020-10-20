Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 71CAB28423A
	for <lists+platform-driver-x86@lfdr.de>; Mon,  5 Oct 2020 23:42:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726774AbgJEVla (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 5 Oct 2020 17:41:30 -0400
Received: from mx0a-002e3701.pphosted.com ([148.163.147.86]:62304 "EHLO
        mx0a-002e3701.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726693AbgJEVla (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 5 Oct 2020 17:41:30 -0400
Received: from pps.filterd (m0134422.ppops.net [127.0.0.1])
        by mx0b-002e3701.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 095KbmVV026081;
        Mon, 5 Oct 2020 20:39:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hpe.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pps0720;
 bh=1vkvexeN5zZ1BpEDstqkTiZTE6gfqMjzHJQzFyEIILA=;
 b=VJjB/0aQBbq48Jdmc/M39iR6hQZoaDthxzN/5Uy0yjGvZIE/IqAPUUzhkQAXeUCe0GXm
 FvKf7J/Q+xqNCirRq/E+yb7LhIbE5MT2o0RGz4Mi1dT+dPH48AEJ5L/glfZ95LihE+/+
 hPbkyru0AKiIh9OSB++ZvptIA4E0V4Y5U5nbJdr1sN6UoPmVHMBp6BXqfUdV36eSXVNm
 fK1Srvq94VFY+mYfnJ3Wp05qUWYCO8ejY7ZNj4hhtZvPT1tbOL9K7G84qZ/ywtQr9Fc1
 E+JROeIu5dH40CqR2RItnX3FfkNJV9wg8Ojua1fiGbPRaOotQCcN7nokpxSUZnUd67fq cQ== 
Received: from g9t5009.houston.hpe.com (g9t5009.houston.hpe.com [15.241.48.73])
        by mx0b-002e3701.pphosted.com with ESMTP id 33y315dy7q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 05 Oct 2020 20:39:57 +0000
Received: from g9t2301.houston.hpecorp.net (g9t2301.houston.hpecorp.net [16.220.97.129])
        by g9t5009.houston.hpe.com (Postfix) with ESMTP id 7F62551;
        Mon,  5 Oct 2020 20:39:56 +0000 (UTC)
Received: from dog.eag.rdlabs.hpecorp.net (dog.eag.rdlabs.hpecorp.net [128.162.243.181])
        by g9t2301.houston.hpecorp.net (Postfix) with ESMTP id 23BD24C;
        Mon,  5 Oct 2020 20:39:55 +0000 (UTC)
From:   Mike Travis <mike.travis@hpe.com>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        x86@kernel.org, Steve Wahl <steve.wahl@hpe.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Andy Lutomirski <luto@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Dimitri Sivanich <dimitri.sivanich@hpe.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     Mike Travis <mike.travis@hpe.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Russ Anderson <russ.anderson@hpe.com>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>,
        Alexandre Chartre <alexandre.chartre@oracle.com>,
        Jian Cai <caij2003@gmail.com>,
        Vitaly Kuznetsov <vkuznets@redhat.com>,
        linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org
Subject: [PATCH v4 02/13] x86/platform/uv: Remove SCIR MMR references for UVY systems.
Date:   Mon,  5 Oct 2020 15:39:18 -0500
Message-Id: <20201005203929.148656-3-mike.travis@hpe.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20201005203929.148656-1-mike.travis@hpe.com>
References: <20201005203929.148656-1-mike.travis@hpe.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HPE-SCL: -1
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-05_15:2020-10-05,2020-10-05 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 mlxlogscore=977
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2010050144
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

UV class systems no longer use System Controller for monitoring of CPU
activity provided by this driver.  Other methods have been developed
for BIOS and the management controller (BMC).  This patch removes that
supporting code.

Signed-off-by: Mike Travis <mike.travis@hpe.com>
Reviewed-by: Dimitri Sivanich <dimitri.sivanich@hpe.com>
---
 arch/x86/include/asm/uv/uv_hub.h   | 43 ++--------------
 arch/x86/kernel/apic/x2apic_uv_x.c | 82 ------------------------------
 2 files changed, 3 insertions(+), 122 deletions(-)

diff --git a/arch/x86/include/asm/uv/uv_hub.h b/arch/x86/include/asm/uv/uv_hub.h
index 100d66806503..b21228db75bf 100644
--- a/arch/x86/include/asm/uv/uv_hub.h
+++ b/arch/x86/include/asm/uv/uv_hub.h
@@ -129,17 +129,6 @@
  */
 #define UV_MAX_NASID_VALUE	(UV_MAX_NUMALINK_BLADES * 2)
 
-/* System Controller Interface Reg info */
-struct uv_scir_s {
-	struct timer_list timer;
-	unsigned long	offset;
-	unsigned long	last;
-	unsigned long	idle_on;
-	unsigned long	idle_off;
-	unsigned char	state;
-	unsigned char	enabled;
-};
-
 /* GAM (globally addressed memory) range table */
 struct uv_gam_range_s {
 	u32	limit;		/* PA bits 56:26 (GAM_RANGE_SHFT) */
@@ -191,16 +180,13 @@ struct uv_hub_info_s {
 struct uv_cpu_info_s {
 	void			*p_uv_hub_info;
 	unsigned char		blade_cpu_id;
-	struct uv_scir_s	scir;
+	void			*reserved;
 };
 DECLARE_PER_CPU(struct uv_cpu_info_s, __uv_cpu_info);
 
 #define uv_cpu_info		this_cpu_ptr(&__uv_cpu_info)
 #define uv_cpu_info_per(cpu)	(&per_cpu(__uv_cpu_info, cpu))
 
-#define	uv_scir_info		(&uv_cpu_info->scir)
-#define	uv_cpu_scir_info(cpu)	(&uv_cpu_info_per(cpu)->scir)
-
 /* Node specific hub common info struct */
 extern void **__uv_hub_info_list;
 static inline struct uv_hub_info_s *uv_hub_info_list(int node)
@@ -297,9 +283,9 @@ union uvh_apicid {
 #define UV3_GLOBAL_MMR32_SIZE		(32UL * 1024 * 1024)
 
 #define UV4_LOCAL_MMR_BASE		0xfa000000UL
-#define UV4_GLOBAL_MMR32_BASE		0xfc000000UL
+#define UV4_GLOBAL_MMR32_BASE		0
 #define UV4_LOCAL_MMR_SIZE		(32UL * 1024 * 1024)
-#define UV4_GLOBAL_MMR32_SIZE		(16UL * 1024 * 1024)
+#define UV4_GLOBAL_MMR32_SIZE		0
 
 #define UV_LOCAL_MMR_BASE		(				\
 					is_uv2_hub() ? UV2_LOCAL_MMR_BASE : \
@@ -772,29 +758,6 @@ DECLARE_PER_CPU(struct uv_cpu_nmi_s, uv_cpu_nmi);
 #define	UV_NMI_STATE_DUMP		2
 #define	UV_NMI_STATE_DUMP_DONE		3
 
-/* Update SCIR state */
-static inline void uv_set_scir_bits(unsigned char value)
-{
-	if (uv_scir_info->state != value) {
-		uv_scir_info->state = value;
-		uv_write_local_mmr8(uv_scir_info->offset, value);
-	}
-}
-
-static inline unsigned long uv_scir_offset(int apicid)
-{
-	return SCIR_LOCAL_MMR_BASE | (apicid & 0x3f);
-}
-
-static inline void uv_set_cpu_scir_bits(int cpu, unsigned char value)
-{
-	if (uv_cpu_scir_info(cpu)->state != value) {
-		uv_write_global_mmr8(uv_cpu_to_pnode(cpu),
-				uv_cpu_scir_info(cpu)->offset, value);
-		uv_cpu_scir_info(cpu)->state = value;
-	}
-}
-
 /*
  * Get the minimum revision number of the hub chips within the partition.
  * (See UVx_HUB_REVISION_BASE above for specific values.)
diff --git a/arch/x86/kernel/apic/x2apic_uv_x.c b/arch/x86/kernel/apic/x2apic_uv_x.c
index 0b6eea3f54e6..f51fabf56010 100644
--- a/arch/x86/kernel/apic/x2apic_uv_x.c
+++ b/arch/x86/kernel/apic/x2apic_uv_x.c
@@ -909,85 +909,6 @@ static __init void uv_rtc_init(void)
 	}
 }
 
-/*
- * percpu heartbeat timer
- */
-static void uv_heartbeat(struct timer_list *timer)
-{
-	unsigned char bits = uv_scir_info->state;
-
-	/* Flip heartbeat bit: */
-	bits ^= SCIR_CPU_HEARTBEAT;
-
-	/* Is this CPU idle? */
-	if (idle_cpu(raw_smp_processor_id()))
-		bits &= ~SCIR_CPU_ACTIVITY;
-	else
-		bits |= SCIR_CPU_ACTIVITY;
-
-	/* Update system controller interface reg: */
-	uv_set_scir_bits(bits);
-
-	/* Enable next timer period: */
-	mod_timer(timer, jiffies + SCIR_CPU_HB_INTERVAL);
-}
-
-static int uv_heartbeat_enable(unsigned int cpu)
-{
-	while (!uv_cpu_scir_info(cpu)->enabled) {
-		struct timer_list *timer = &uv_cpu_scir_info(cpu)->timer;
-
-		uv_set_cpu_scir_bits(cpu, SCIR_CPU_HEARTBEAT|SCIR_CPU_ACTIVITY);
-		timer_setup(timer, uv_heartbeat, TIMER_PINNED);
-		timer->expires = jiffies + SCIR_CPU_HB_INTERVAL;
-		add_timer_on(timer, cpu);
-		uv_cpu_scir_info(cpu)->enabled = 1;
-
-		/* Also ensure that boot CPU is enabled: */
-		cpu = 0;
-	}
-	return 0;
-}
-
-#ifdef CONFIG_HOTPLUG_CPU
-static int uv_heartbeat_disable(unsigned int cpu)
-{
-	if (uv_cpu_scir_info(cpu)->enabled) {
-		uv_cpu_scir_info(cpu)->enabled = 0;
-		del_timer(&uv_cpu_scir_info(cpu)->timer);
-	}
-	uv_set_cpu_scir_bits(cpu, 0xff);
-	return 0;
-}
-
-static __init void uv_scir_register_cpu_notifier(void)
-{
-	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "x86/x2apic-uvx:online",
-				  uv_heartbeat_enable, uv_heartbeat_disable);
-}
-
-#else /* !CONFIG_HOTPLUG_CPU */
-
-static __init void uv_scir_register_cpu_notifier(void)
-{
-}
-
-static __init int uv_init_heartbeat(void)
-{
-	int cpu;
-
-	if (is_uv_system()) {
-		for_each_online_cpu(cpu)
-			uv_heartbeat_enable(cpu);
-	}
-
-	return 0;
-}
-
-late_initcall(uv_init_heartbeat);
-
-#endif /* !CONFIG_HOTPLUG_CPU */
-
 /* Direct Legacy VGA I/O traffic to designated IOH */
 static int uv_set_vga_state(struct pci_dev *pdev, bool decode, unsigned int command_bits, u32 flags)
 {
@@ -1517,8 +1438,6 @@ static void __init uv_system_init_hub(void)
 			uv_hub_info_list(numa_node_id)->pnode = pnode;
 		else if (uv_cpu_hub_info(cpu)->pnode == 0xffff)
 			uv_cpu_hub_info(cpu)->pnode = pnode;
-
-		uv_cpu_scir_info(cpu)->offset = uv_scir_offset(apicid);
 	}
 
 	for_each_node(nodeid) {
@@ -1547,7 +1466,6 @@ static void __init uv_system_init_hub(void)
 
 	uv_nmi_setup();
 	uv_cpu_init();
-	uv_scir_register_cpu_notifier();
 	uv_setup_proc_files(0);
 
 	/* Register Legacy VGA I/O redirection handler: */
-- 
2.21.0

