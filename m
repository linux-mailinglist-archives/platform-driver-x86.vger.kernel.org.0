Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7243430E1C1
	for <lists+platform-driver-x86@lfdr.de>; Wed,  3 Feb 2021 19:03:47 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231540AbhBCSCs (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 3 Feb 2021 13:02:48 -0500
Received: from mail-il-dmz.mellanox.com ([193.47.165.129]:52407 "EHLO
        mellanox.co.il" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S229979AbhBCSCX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 3 Feb 2021 13:02:23 -0500
Received: from Internal Mail-Server by MTLPINE1 (envelope-from vadimp@nvidia.com)
        with SMTP; 3 Feb 2021 19:36:26 +0200
Received: from r-build-lowlevel.mtr.labs.mlnx. (r-build-lowlevel.mtr.labs.mlnx [10.209.0.190])
        by labmailer.mlnx (8.13.8/8.13.8) with ESMTP id 113HaOOH001002;
        Wed, 3 Feb 2021 19:36:26 +0200
From:   Vadim Pasternak <vadimp@nvidia.com>
To:     andy@infradead.org, hdegoede@redhat.com
Cc:     platform-driver-x86@vger.kernel.org,
        Vadim Pasternak <vadimp@nvidia.com>
Subject: [PATCH RFC platform-next 2/8] platform/x86: mlx-platform: Add initial support for new modular system
Date:   Wed,  3 Feb 2021 19:36:16 +0200
Message-Id: <20210203173622.5845-3-vadimp@nvidia.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20210203173622.5845-1-vadimp@nvidia.com>
References: <20210203173622.5845-1-vadimp@nvidia.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Add initial chassis management support for Nvidia modular Ethernet
switch systems MSN4800, providing a high performance switching solution
for Enterprise Data Centers (EDC) for building Ethernet based clusters,
High-Performance Computing (HPC) and embedded environments.

This system could be equipped with the different types of replaceable
line cards and management board. The first system flavor will support
the line card type MSN4800-C16 equipped with Lattice CPLD devices aimed
for system and ASIC control, one Nvidia FPGA for gearboxes (PHYs)
management, and four Nvidia gearboxes for the port control and with
16x100GbE QSFP28 ports and also with various devices for electrical
control.

The system is equipped with eight slots for line cards, four slots for
power supplies and six slots for fans. It could be configured as fully
populated or with even only one line card. The line cards are
hot-pluggable.
In the future when more line card flavors are to be available (for
example line cards with 8x200Gb Eth port, with 4x400 Eth ports, or with
some kind of smart cards for offloading purpose), any type of line card
could be inserted at any slot.

The system is based on Nvidia Spectrum-3 ASIC. The switch height is
4U and it fits standard rack size.

System could be configured as fully populated or with even only one
line card. The line cards are hot-pluggable.

Line cards are connected to the chassis through I2C interface for the
chassis management operations and through PCIe for the networking
operations. Future line cards could be connected to the chassis through
InfiniBand fabric, instead of PCIe.

The first type of line card supports 16x100GbE QSFP28 Ethernet ports.
Those line cards equipped with the programmable devices aimed for
system control of Nvidia Ethernet switch ASIC control, Nvidia FPGA,
Nvidia gearboxes (PHYs).
The next coming  card generations are supposed to support:
- Line cards with 8x200Gbe QSFP28 Ethernet ports.
- Line cards with 4x400Gbe QSFP-DD Ethernet ports.
- Smart cards equipped with Nvidia ARM CPU for offloading and for fast
  access to the storage (EBoF).
- Fabric cards for inter-connection.

The basic system initialization flow with input signals from the
programmable device to kernel hotplug driver and with OS response
to some of these signals is depicted below.

lc#n_present	*-> Input: line card presence in/out events.
		    Informational event. Required action - 'udev' event
		    generation for logging.
lc#n_verified	*-> Input: line card verification status events coming
		    after line card security signature validation by
		    hardware. Required action - connect line card
		    driver and initialized line card devices feeding
		    from system auxiliary power domain.
lc#n_pwr	<-* Output: line card power on / off from OS. Action
		    should be performed by platform power management
		    driver.
lc#n_powered	*-> Input: line card power on/off events coming after
		    line card "power good" on/off events, mean that
		    line card power up sequence has been successfully
		    completed or line card "power good" status has been
		    dropped. Required action - connect line card
		    devices feeding from system main power domain.
lc#n_synced	*-> Input: line card synchronization events, coming
		    after hardware-firmware synchronization handshake.
		    Required action - to enable line card, in case
		    lc#n_ready has been received before.
lc#n_ready	*-> Input: line card ready events, indicating line card
		    PHYs ready / unready states. Required action -
		    enable line card, in case lc#n_synced has been
		    received before.
lc#n_enable	<-* Output: line card enable from OS - release FPGA and
		    PHYs line card devices from reset state. Action
		    should be performed by platform power management
		    driver.
lc#n_active	*-> Input: when line card "active event" is received
		    for particular line card, its network, hardware
		    monitoring and thermal interfaces should be
		    configured according to the configuration obtained
		    from the firmware. When opposite "inactive event"
		    is received all the above interfaces should be
		    teared down. Required action - connect / disconnect
		    the above line card interfaces through ASIC I2C
		    chassis management driver.
lc#n_shutdown	*-> Input: when line card thermal shutdown event is
		    received. Hardware will send such event in case some
		    line card component, like gearboxes or FPAG is
		    overheated. In such situation line card should be
		    powered off.

For initial support:
- Define new system type 'VMOD0011' to support new modular system.
- Provide initial platform configuration for new system type.
- Extend the registers definitions.
- Add support for modular system registers related to line card
  specific events - insertion/removal, power on/off, verification
  and activation.
- Add hotplug configuration for the above events.
- Add configurations for hotplug actions for the modular system.

Signed-off-by: Vadim Pasternak <vadimp@nvidia.com>
---
 drivers/platform/x86/mlx-platform.c | 1817 +++++++++++++++++++++++++++++++----
 1 file changed, 1622 insertions(+), 195 deletions(-)

diff --git a/drivers/platform/x86/mlx-platform.c b/drivers/platform/x86/mlx-platform.c
index 8bce3da32a42..eca564cca8d4 100644
--- a/drivers/platform/x86/mlx-platform.c
+++ b/drivers/platform/x86/mlx-platform.c
@@ -30,6 +30,7 @@
 #define MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET	0x06
 #define MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET	0x08
 #define MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET	0x0a
+#define MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET	0x1c
 #define MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET	0x1d
 #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET	0x1e
 #define MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET	0x1f
@@ -41,6 +42,7 @@
 #define MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION	0x2a
 #define MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET	0x2b
 #define MLXPLAT_CPLD_LPC_REG_GP0_OFFSET		0x2e
+#define MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET	0x2f
 #define MLXPLAT_CPLD_LPC_REG_GP1_OFFSET		0x30
 #define MLXPLAT_CPLD_LPC_REG_WP1_OFFSET		0x31
 #define MLXPLAT_CPLD_LPC_REG_GP2_OFFSET		0x32
@@ -57,15 +59,39 @@
 #define MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET 0x50
 #define MLXPLAT_CPLD_LPC_REG_ASIC_EVENT_OFFSET	0x51
 #define MLXPLAT_CPLD_LPC_REG_ASIC_MASK_OFFSET	0x52
+#define MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET	0x56
+#define MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET	0x57
 #define MLXPLAT_CPLD_LPC_REG_PSU_OFFSET		0x58
 #define MLXPLAT_CPLD_LPC_REG_PSU_EVENT_OFFSET	0x59
 #define MLXPLAT_CPLD_LPC_REG_PSU_MASK_OFFSET	0x5a
 #define MLXPLAT_CPLD_LPC_REG_PWR_OFFSET		0x64
 #define MLXPLAT_CPLD_LPC_REG_PWR_EVENT_OFFSET	0x65
 #define MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET	0x66
+#define MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET	0x70
+#define MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET	0x71
+#define MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET	0x72
 #define MLXPLAT_CPLD_LPC_REG_FAN_OFFSET		0x88
 #define MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET	0x89
 #define MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET	0x8a
+#define MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET	0x9a
+#define MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET	0x9b
+#define MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET	0x9c
+#define MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET	0x9d
+#define MLXPLAT_CPLD_LPC_REG_LC_PG_EVENT_OFFSET	0x9e
+#define MLXPLAT_CPLD_LPC_REG_LC_PG_MASK_OFFSET	0x9f
+#define MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET	0xa0
+#define MLXPLAT_CPLD_LPC_REG_LC_RD_EVENT_OFFSET 0xa1
+#define MLXPLAT_CPLD_LPC_REG_LC_RD_MASK_OFFSET	0xa2
+#define MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET	0xa3
+#define MLXPLAT_CPLD_LPC_REG_LC_SN_EVENT_OFFSET 0xa4
+#define MLXPLAT_CPLD_LPC_REG_LC_SN_MASK_OFFSET	0xa5
+#define MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET	0xa6
+#define MLXPLAT_CPLD_LPC_REG_LC_OK_EVENT_OFFSET	0xa7
+#define MLXPLAT_CPLD_LPC_REG_LC_OK_MASK_OFFSET	0xa8
+#define MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET	0xa9
+#define MLXPLAT_CPLD_LPC_REG_LC_SD_EVENT_OFFSET	0xaa
+#define MLXPLAT_CPLD_LPC_REG_LC_SD_MASK_OFFSET	0xab
+#define MLXPLAT_CPLD_LPC_REG_LC_PWR_ON		0xb2
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET	0xc7
 #define MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET	0xc8
 #define MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET	0xc9
@@ -99,12 +125,14 @@
 #define MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET	0xf7
 #define MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET	0xf8
 #define MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET 0xf9
+#define MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET	0xfa
 #define MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET	0xfb
 #define MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET	0xfc
 #define MLXPLAT_CPLD_LPC_IO_RANGE		0x100
 #define MLXPLAT_CPLD_LPC_I2C_CH1_OFF		0xdb
 #define MLXPLAT_CPLD_LPC_I2C_CH2_OFF		0xda
 #define MLXPLAT_CPLD_LPC_I2C_CH3_OFF		0xdc
+#define MLXPLAT_CPLD_LPC_I2C_CH4_OFF		0xdd
 
 #define MLXPLAT_CPLD_LPC_PIO_OFFSET		0x10000UL
 #define MLXPLAT_CPLD_LPC_REG1	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
@@ -116,6 +144,9 @@
 #define MLXPLAT_CPLD_LPC_REG3	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
 				  MLXPLAT_CPLD_LPC_I2C_CH3_OFF) | \
 				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
+#define MLXPLAT_CPLD_LPC_REG4	((MLXPLAT_CPLD_LPC_REG_BASE_ADRR + \
+				  MLXPLAT_CPLD_LPC_I2C_CH4_OFF) | \
+				  MLXPLAT_CPLD_LPC_PIO_OFFSET)
 
 /* Masks for aggregation, psu, pwr and fan event in CPLD related registers. */
 #define MLXPLAT_CPLD_AGGR_ASIC_MASK_DEF	0x04
@@ -128,6 +159,24 @@
 #define MLXPLAT_CPLD_AGGR_ASIC_MASK_NG	0x01
 #define MLXPLAT_CPLD_AGGR_MASK_NG_DEF	0x04
 #define MLXPLAT_CPLD_AGGR_MASK_COMEX	BIT(0)
+#define MLXPLAT_CPLD_AGGR_MASK_LC	BIT(3)
+#define MLXPLAT_CPLD_AGGR_MASK_MODULAR	(MLXPLAT_CPLD_AGGR_MASK_NG_DEF | \
+					 MLXPLAT_CPLD_AGGR_MASK_COMEX | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_PRSNT	BIT(0)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_RDY	BIT(1)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_PG	BIT(2)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_SCRD	BIT(3)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_SYNC	BIT(4)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_ACT	BIT(5)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_SDWN	BIT(6)
+#define MLXPLAT_CPLD_AGGR_MASK_LC_LOW	(MLXPLAT_CPLD_AGGR_MASK_LC_PRSNT | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_RDY | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_PG | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_SCRD | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_SYNC | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_ACT | \
+					 MLXPLAT_CPLD_AGGR_MASK_LC_SDWN)
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_LOW	0xc1
 #define MLXPLAT_CPLD_LOW_AGGR_MASK_I2C	BIT(6)
 #define MLXPLAT_CPLD_PSU_MASK		GENMASK(1, 0)
@@ -149,6 +198,9 @@
 					 MLXPLAT_CPLD_AGGR_MASK_CARRIER)
 #define MLXPLAT_CPLD_LOW_AGGRCX_MASK	0xc1
 
+/* Masks for aggregation for modular systems */
+#define MLXPLAT_CPLD_LPC_LC_MASK	GENMASK(7, 0)
+
 /* Default I2C parent bus number */
 #define MLXPLAT_CPLD_PHYS_ADAPTER_DEF_NR	1
 
@@ -163,18 +215,27 @@
 #define MLXPLAT_CPLD_CH1			2
 #define MLXPLAT_CPLD_CH2			10
 #define MLXPLAT_CPLD_CH3			18
+#define MLXPLAT_CPLD_CH2_ETH_MODULAR		3
+#define MLXPLAT_CPLD_CH3_ETH_MODULAR		43
+#define MLXPLAT_CPLD_CH4_ETH_MODULAR		51
 
 /* Number of LPC attached MUX platform devices */
-#define MLXPLAT_CPLD_LPC_MUX_DEVS		3
+#define MLXPLAT_CPLD_LPC_MUX_DEVS		4
 
 /* Hotplug devices adapter numbers */
 #define MLXPLAT_CPLD_NR_NONE			-1
 #define MLXPLAT_CPLD_PSU_DEFAULT_NR		10
 #define MLXPLAT_CPLD_PSU_MSNXXXX_NR		4
+#define MLXPLAT_CPLD_PSU_MODULAR_NR		5
 #define MLXPLAT_CPLD_FAN1_DEFAULT_NR		11
 #define MLXPLAT_CPLD_FAN2_DEFAULT_NR		12
 #define MLXPLAT_CPLD_FAN3_DEFAULT_NR		13
 #define MLXPLAT_CPLD_FAN4_DEFAULT_NR		14
+#define MLXPLAT_CPLD_NR_ASIC			3
+#define MLXPLAT_CPLD_NR_LC_BASE			34
+
+#define MLXPLAT_CPLD_NR_LC_SET(nr)	(MLXPLAT_CPLD_NR_LC_BASE + (nr))
+#define MLXPLAT_CPLD_LC_ADDR		0x32
 
 /* Masks and default values for watchdogs */
 #define MLXPLAT_CPLD_WD1_CLEAR_MASK	GENMASK(7, 1)
@@ -190,6 +251,11 @@
 #define MLXPLAT_CPLD_WD3_DFLT_TIMEOUT	600
 #define MLXPLAT_CPLD_WD_MAX_DEVS	2
 
+#define MLXPLAT_CPLD_LPC_SYSIRQ		17
+
+/* Minimum power required for turning on Ethernet modular system (WATT) */
+#define MLXPLAT_CPLD_ETH_MODULAR_PWR_MIN	50
+
 /* mlxplat_priv - platform private data
  * @pdev_i2c - i2c controller platform device
  * @pdev_mux - array of mux platform devices
@@ -318,6 +384,58 @@ static struct i2c_mux_reg_platform_data mlxplat_extended_mux_data[] = {
 
 };
 
+/* Platform channels for modular system family */
+static const int mlxplat_modular_upper_channel[] = { 1 };
+static const int mlxplat_modular_channels[] = {
+	1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20,
+	21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37,
+	38, 39, 40
+};
+
+/* Platform modular mux data */
+static struct i2c_mux_reg_platform_data mlxplat_modular_mux_data[] = {
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH1,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG4,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_modular_upper_channel,
+		.n_values = ARRAY_SIZE(mlxplat_modular_upper_channel),
+	},
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH2_ETH_MODULAR,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG1,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_modular_channels,
+		.n_values = ARRAY_SIZE(mlxplat_modular_channels),
+	},
+	{
+		.parent = MLXPLAT_CPLD_CH1,
+		.base_nr = MLXPLAT_CPLD_CH3_ETH_MODULAR,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG3,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_msn21xx_channels,
+		.n_values = ARRAY_SIZE(mlxplat_msn21xx_channels),
+	},
+	{
+		.parent = 1,
+		.base_nr = MLXPLAT_CPLD_CH4_ETH_MODULAR,
+		.write_only = 1,
+		.reg = (void __iomem *)MLXPLAT_CPLD_LPC_REG2,
+		.reg_size = 1,
+		.idle_in_use = 1,
+		.values = mlxplat_msn21xx_channels,
+		.n_values = ARRAY_SIZE(mlxplat_msn21xx_channels),
+	},
+};
+
 /* Platform hotplug devices */
 static struct i2c_board_info mlxplat_mlxcpld_pwr[] = {
 	{
@@ -968,247 +1086,1005 @@ struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_ext_data = {
 	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
 };
 
-/* Platform led default data */
-static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_pwr_items_data[] = {
 	{
-		.label = "status:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "pwr1",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MODULAR_NR,
 	},
 	{
-		.label = "status:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+		.label = "pwr2",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MODULAR_NR,
 	},
 	{
-		.label = "psu:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "pwr3",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[0],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MODULAR_NR,
 	},
 	{
-		.label = "psu:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "pwr4",
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_ext_pwr[1],
+		.hpdev.nr = MLXPLAT_CPLD_PSU_MODULAR_NR,
 	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_lc_act = {
+	.irq = MLXPLAT_CPLD_LPC_SYSIRQ,
+};
+
+static struct i2c_board_info mlxplat_mlxcpld_chip_i2c_dev[] = {
 	{
-		.label = "fan1:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxsw_minimal", 0x37),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_asic_items_data[] = {
 	{
-		.label = "fan1:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "asic1",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_chip_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_ASIC,
 	},
+};
+
+static struct i2c_board_info mlxplat_mlxcpld_lc_i2c_dev[] = {
 	{
-		.label = "fan2:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "fan2:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "fan3:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "fan3:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "fan4:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "fan4:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
-};
-
-static struct mlxreg_core_platform_data mlxplat_default_led_data = {
-		.data = mlxplat_mlxcpld_default_led_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_data),
-};
-
-/* Platform led MSN21xx system family data */
-static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_led_data[] = {
 	{
-		.label = "status:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
 	{
-		.label = "status:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+		I2C_BOARD_INFO("mlxreg-lc", MLXPLAT_CPLD_LC_ADDR),
+		.platform_data = &mlxplat_mlxcpld_lc_act,
 	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pr_items_data[] = {
 	{
-		.label = "fan:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc1_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
 	},
 	{
-		.label = "fan:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc2_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
 	},
 	{
-		.label = "psu1:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc3_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
 	},
 	{
-		.label = "psu1:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc4_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
 	},
 	{
-		.label = "psu2:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "lc5_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
 	},
 	{
-		.label = "psu2:red",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "lc6_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
 	},
 	{
-		.label = "uid:blue",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc7_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_present",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
 	},
 };
 
-static struct mlxreg_core_platform_data mlxplat_msn21xx_led_data = {
-		.data = mlxplat_mlxcpld_msn21xx_led_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_led_data),
-};
-
-/* Platform led for default data for 200GbE systems */
-static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_led_data[] = {
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ver_items_data[] = {
 	{
-		.label = "status:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc1_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(0),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 1,
 	},
 	{
-		.label = "status:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+		.label = "lc2_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(1),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 2,
 	},
 	{
-		.label = "psu:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "lc3_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(2),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 3,
 	},
 	{
-		.label = "psu:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.label = "lc4_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(3),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 4,
 	},
 	{
-		.label = "fan1:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(0),
+		.label = "lc5_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(4),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 5,
 	},
 	{
-		.label = "fan1:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(0),
+		.label = "lc6_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(5),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 6,
+	},
+	{
+		.label = "lc7_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(6),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_verified",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = BIT(7),
+		.reg_prsnt = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.reg_pwr = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.reg_ena = MLXPLAT_CPLD_LPC_REG_WP1_OFFSET,
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_PLATFORM_ACTION,
+		.slot = 8,
 	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_pg_data[] = {
 	{
-		.label = "fan2:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(1),
+		.label = "lc1_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
 	},
 	{
-		.label = "fan2:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(1),
+		.label = "lc2_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
 	},
 	{
-		.label = "fan3:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(2),
+		.label = "lc3_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
 	},
 	{
-		.label = "fan3:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(2),
+		.label = "lc4_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
 	},
 	{
-		.label = "fan4:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(3),
+		.label = "lc5_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
 	},
 	{
-		.label = "fan4:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(3),
+		.label = "lc6_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
 	},
 	{
-		.label = "fan5:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(4),
+		.label = "lc7_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
 	},
 	{
-		.label = "fan5:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(4),
+		.label = "lc8_powered",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
 	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_ready_data[] = {
 	{
-		.label = "fan6:green",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(5),
+		.label = "lc1_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
 	},
 	{
-		.label = "fan6:orange",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
-		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
-		.bit = BIT(5),
+		.label = "lc2_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
 	},
 	{
-		.label = "uid:blue",
-		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
-		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.label = "lc3_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
 	},
-};
-
-static struct mlxreg_core_platform_data mlxplat_default_ng_led_data = {
-		.data = mlxplat_mlxcpld_default_ng_led_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_led_data),
-};
-
+	{
+		.label = "lc4_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
+	},
+	{
+		.label = "lc5_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
+	},
+	{
+		.label = "lc6_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
+	},
+	{
+		.label = "lc7_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_synced_data[] = {
+	{
+		.label = "lc1_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
+	},
+	{
+		.label = "lc2_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
+	},
+	{
+		.label = "lc3_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
+	},
+	{
+		.label = "lc4_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
+	},
+	{
+		.label = "lc5_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
+	},
+	{
+		.label = "lc6_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
+	},
+	{
+		.label = "lc7_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_synced",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_act_data[] = {
+	{
+		.label = "lc1_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
+	},
+	{
+		.label = "lc2_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
+	},
+	{
+		.label = "lc3_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
+	},
+	{
+		.label = "lc4_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
+	},
+	{
+		.label = "lc5_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
+	},
+	{
+		.label = "lc6_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
+	},
+	{
+		.label = "lc7_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_active",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
+	},
+};
+
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_lc_sd_data[] = {
+	{
+		.label = "lc1_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(0),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[0],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(0),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 1,
+	},
+	{
+		.label = "lc2_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(1),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[1],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(1),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 2,
+	},
+	{
+		.label = "lc3_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(2),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[2],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(2),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 3,
+	},
+	{
+		.label = "lc4_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(3),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[3],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(3),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 4,
+	},
+	{
+		.label = "lc5_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(4),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[4],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(4),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 5,
+	},
+	{
+		.label = "lc6_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(5),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[5],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(5),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 6,
+	},
+	{
+		.label = "lc7_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(6),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[6],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(6),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 7,
+	},
+	{
+		.label = "lc8_shutdown",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = BIT(7),
+		.hpdev.brdinfo = &mlxplat_mlxcpld_lc_i2c_dev[7],
+		.hpdev.nr = MLXPLAT_CPLD_NR_LC_SET(7),
+		.hpdev.action = MLXREG_HOTPLUG_DEVICE_NO_ACTION,
+		.slot = 8,
+	},
+};
+
+static struct mlxreg_core_item mlxplat_mlxcpld_modular_items[] = {
+	{
+		.data = mlxplat_mlxcpld_ext_psu_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PSU_OFFSET,
+		.mask = MLXPLAT_CPLD_PSU_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_psu_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_pwr_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_PWR_OFFSET,
+		.mask = MLXPLAT_CPLD_PWR_EXT_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_ext_pwr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_default_ng_fan_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_OFFSET,
+		.mask = MLXPLAT_CPLD_FAN_NG_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_fan_items_data),
+		.inversed = 1,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_asic_items_data,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_NG_DEF,
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_asic_items_data),
+		.inversed = 0,
+		.health = true,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_pr_items_data,
+		.kind = MLXREG_HOTPLUG_LC_PRESENT,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pr_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_ver_items_data,
+		.kind = MLXREG_HOTPLUG_LC_VERIFIED,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ver_items_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_pg_data,
+		.kind = MLXREG_HOTPLUG_LC_POWERED,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_pg_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_ready_data,
+		.kind = MLXREG_HOTPLUG_LC_READY,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_ready_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_synced_data,
+		.kind = MLXREG_HOTPLUG_LC_SYNCED,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_synced_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_act_data,
+		.kind = MLXREG_HOTPLUG_LC_ACTIVE,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_act_data),
+		.inversed = 0,
+		.health = false,
+	},
+	{
+		.data = mlxplat_mlxcpld_modular_lc_sd_data,
+		.kind = MLXREG_HOTPLUG_LC_THERMAL,
+		.aggr_mask = MLXPLAT_CPLD_AGGR_MASK_LC,
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_SD_OFFSET,
+		.mask = MLXPLAT_CPLD_LPC_LC_MASK,
+		.count = ARRAY_SIZE(mlxplat_mlxcpld_modular_lc_sd_data),
+		.inversed = 0,
+		.health = false,
+	},
+};
+
+static
+struct mlxreg_core_hotplug_platform_data mlxplat_mlxcpld_modular_data = {
+	.items = mlxplat_mlxcpld_modular_items,
+	.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_items),
+	.cell = MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET,
+	.mask = MLXPLAT_CPLD_AGGR_MASK_MODULAR,
+	.cell_low = MLXPLAT_CPLD_LPC_REG_AGGRLO_OFFSET,
+	.mask_low = MLXPLAT_CPLD_LOW_AGGR_MASK_LOW,
+};
+
+/* Platform led default data */
+static struct mlxreg_core_data mlxplat_mlxcpld_default_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+	{
+		.label = "psu:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan2:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan2:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan3:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan3:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan4:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan4:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_default_led_data = {
+		.data = mlxplat_mlxcpld_default_led_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_led_data),
+};
+
+/* Platform led MSN21xx system family data */
+static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+	{
+		.label = "fan:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "fan:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu1:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu1:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "psu2:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu2:red",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "uid:blue",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_msn21xx_led_data = {
+		.data = mlxplat_mlxcpld_msn21xx_led_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_led_data),
+};
+
+/* Platform led for default data for 200GbE systems */
+static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_led_data[] = {
+	{
+		.label = "status:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+	{
+		.label = "status:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK
+	},
+	{
+		.label = "psu:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "psu:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED1_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+	},
+	{
+		.label = "fan1:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(0),
+	},
+	{
+		.label = "fan1:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(0),
+	},
+	{
+		.label = "fan2:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(1),
+	},
+	{
+		.label = "fan2:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED2_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(1),
+	},
+	{
+		.label = "fan3:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(2),
+	},
+	{
+		.label = "fan3:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(2),
+	},
+	{
+		.label = "fan4:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(3),
+	},
+	{
+		.label = "fan4:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED3_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(3),
+	},
+	{
+		.label = "fan5:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(4),
+	},
+	{
+		.label = "fan5:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(4),
+	},
+	{
+		.label = "fan6:green",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(5),
+	},
+	{
+		.label = "fan6:orange",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED4_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_HI_NIBBLE_MASK,
+		.capability = MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET,
+		.bit = BIT(5),
+	},
+	{
+		.label = "uid:blue",
+		.reg = MLXPLAT_CPLD_LPC_REG_LED5_OFFSET,
+		.mask = MLXPLAT_CPLD_LED_LO_NIBBLE_MASK,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_default_ng_led_data = {
+		.data = mlxplat_mlxcpld_default_ng_led_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_led_data),
+};
+
 /* Platform led for Comex based 100GbE systems */
 static struct mlxreg_core_data mlxplat_mlxcpld_comex_100G_led_data[] = {
 	{
@@ -1480,26 +2356,250 @@ static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
-		.label = "reset_main_pwr_fail",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(4),
+		.label = "reset_main_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_hotswap_or_halt",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sff_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "psu1_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0200,
+	},
+	{
+		.label = "psu2_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_cycle",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0200,
+	},
+	{
+		.label = "pwr_down",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0200,
+	},
+	{
+		.label = "select_iio",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "asic_health",
+		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
+		.mask = MLXPLAT_CPLD_ASIC_MASK,
+		.bit = 1,
+		.mode = 0444,
+	},
+};
+
+static struct mlxreg_core_platform_data mlxplat_msn21xx_regs_io_data = {
+		.data = mlxplat_mlxcpld_msn21xx_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_regs_io_data),
+};
+
+/* Platform register access for next generation systems families data */
+static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
+	{
+		.label = "cpld1_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_VER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld1_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld2_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld3_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld4_pn",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET,
+		.bit = GENMASK(15, 0),
+		.mode = 0444,
+		.regnum = 2,
+	},
+	{
+		.label = "cpld1_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld2_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD2_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld3_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD3_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "cpld4_version_min",
+		.reg = MLXPLAT_CPLD_LPC_REG_CPLD4_MVER_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_long_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_short_pb",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_aux_pwr_or_ref",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_from_comex",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_from_asic",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_swb_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_asic_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_platform",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_soc",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_comex_wd",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_voltmon_upgrade_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_system",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0444,
+	},
+	{
+		.label = "reset_sw_pwr_off",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
 		.mode = 0444,
 	},
 	{
-		.label = "reset_asic_thermal",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(5),
+		.label = "reset_comex_thermal",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
 		.mode = 0444,
 	},
 	{
-		.label = "reset_hotswap_or_halt",
-		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(6),
+		.label = "reset_reload_bios",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
 		.mode = 0444,
 	},
 	{
-		.label = "reset_sff_wd",
-		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET,
+		.label = "reset_ac_pwr_fail",
+		.reg = MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(6),
 		.mode = 0444,
 	},
@@ -1528,9 +2628,9 @@ static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_regs_io_data[] = {
 		.mode = 0200,
 	},
 	{
-		.label = "select_iio",
+		.label = "jtag_enable",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
-		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
 	{
@@ -1540,15 +2640,58 @@ static struct mlxreg_core_data mlxplat_mlxcpld_msn21xx_regs_io_data[] = {
 		.bit = 1,
 		.mode = 0444,
 	},
+	{
+		.label = "fan_dir",
+		.reg = MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "voltreg_update_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
+		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "config1",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "config2",
+		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
+	{
+		.label = "ufm_version",
+		.reg = MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET,
+		.bit = GENMASK(7, 0),
+		.mode = 0444,
+	},
 };
 
-static struct mlxreg_core_platform_data mlxplat_msn21xx_regs_io_data = {
-		.data = mlxplat_mlxcpld_msn21xx_regs_io_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_msn21xx_regs_io_data),
+static struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data = {
+		.data = mlxplat_mlxcpld_default_ng_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data),
 };
 
-/* Platform register access for next generation systems families data */
-static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
+/* Platform register access for modular systems families data */
+static struct mlxreg_core_data mlxplat_mlxcpld_modular_regs_io_data[] = {
 	{
 		.label = "cpld1_version",
 		.reg = MLXPLAT_CPLD_LPC_REG_CPLD1_VER_OFFSET,
@@ -1626,6 +2769,54 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "lc1_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "lc2_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "lc3_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0644,
+	},
+	{
+		.label = "lc4_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "lc5_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "lc6_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "lc7_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "lc8_enable",
+		.reg = MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
 		.label = "reset_long_pb",
 		.reg = MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
@@ -1728,6 +2919,79 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
+		.label = "voltreg_update_status",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
+		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
+		.bit = 5,
+		.mode = 0444,
+	},
+	{
+		.label = "vpd_wp",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "pcie_asic_reset_dis",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "shutdown_unlock",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "lc1_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
+	},
+	{
+		.label = "lc2_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "lc3_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0644,
+	},
+	{
+		.label = "lc4_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(3),
+		.mode = 0644,
+	},
+	{
+		.label = "lc5_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0644,
+	},
+	{
+		.label = "lc6_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "lc7_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "lc8_rst_mask",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
 		.label = "psu1_on",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(0),
@@ -1752,12 +3016,36 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0200,
 	},
 	{
+		.label = "psu3_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(4),
+		.mode = 0200,
+	},
+	{
+		.label = "psu4_on",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0200,
+	},
+	{
+		.label = "pm_mgmt_en",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP1_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
 		.label = "jtag_enable",
 		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
 		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
 	{
+		.label = "os_ready",
+		.reg = MLXPLAT_CPLD_LPC_REG_GP2_OFFSET,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0444,
+	},
+	{
 		.label = "asic_health",
 		.reg = MLXPLAT_CPLD_LPC_REG_ASIC_HEALTH_OFFSET,
 		.mask = MLXPLAT_CPLD_ASIC_MASK,
@@ -1771,25 +3059,54 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 		.mode = 0444,
 	},
 	{
-		.label = "voltreg_update_status",
-		.reg = MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET,
-		.mask = MLXPLAT_CPLD_VOLTREG_UPD_MASK,
-		.bit = 5,
-		.mode = 0444,
+		.label = "lc1_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(0),
+		.mode = 0644,
 	},
 	{
-		.label = "vpd_wp",
-		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.label = "lc2_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(1),
+		.mode = 0644,
+	},
+	{
+		.label = "lc3_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(2),
+		.mode = 0644,
+	},
+	{
+		.label = "lc4_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
 		.mask = GENMASK(7, 0) & ~BIT(3),
 		.mode = 0644,
 	},
 	{
-		.label = "pcie_asic_reset_dis",
-		.reg = MLXPLAT_CPLD_LPC_REG_GP0_OFFSET,
+		.label = "lc5_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
 		.mask = GENMASK(7, 0) & ~BIT(4),
 		.mode = 0644,
 	},
 	{
+		.label = "lc6_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(5),
+		.mode = 0644,
+	},
+	{
+		.label = "lc7_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(6),
+		.mode = 0644,
+	},
+	{
+		.label = "lc8_pwr",
+		.reg = MLXPLAT_CPLD_LPC_REG_LC_PWR_ON,
+		.mask = GENMASK(7, 0) & ~BIT(7),
+		.mode = 0644,
+	},
+	{
 		.label = "config1",
 		.reg = MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET,
 		.bit = GENMASK(7, 0),
@@ -1809,9 +3126,9 @@ static struct mlxreg_core_data mlxplat_mlxcpld_default_ng_regs_io_data[] = {
 	},
 };
 
-static struct mlxreg_core_platform_data mlxplat_default_ng_regs_io_data = {
-		.data = mlxplat_mlxcpld_default_ng_regs_io_data,
-		.counter = ARRAY_SIZE(mlxplat_mlxcpld_default_ng_regs_io_data),
+static struct mlxreg_core_platform_data mlxplat_modular_regs_io_data = {
+		.data = mlxplat_mlxcpld_modular_regs_io_data,
+		.counter = ARRAY_SIZE(mlxplat_mlxcpld_modular_regs_io_data),
 };
 
 /* Platform FAN default */
@@ -2158,6 +3475,7 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_LED4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_LED5_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
@@ -2174,6 +3492,19 @@ static bool mlxplat_mlxcpld_writeable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_PWR_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
@@ -2202,6 +3533,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET:
@@ -2213,6 +3545,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
 	case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
@@ -2237,6 +3570,26 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD_CLEAR_WP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD1_TMR_OFFSET:
@@ -2270,6 +3623,7 @@ static bool mlxplat_mlxcpld_readable_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
@@ -2289,6 +3643,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_CPLD2_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD3_PN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CPLD4_PN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_RESET_GP4_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RESET_CAUSE_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_RST_CAUSE2_OFFSET:
@@ -2300,6 +3655,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_DIRECTION:
 	case MLXPLAT_CPLD_LPC_REG_GP0_RO_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP0_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_GP_RST_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_GP2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_AGGR_OFFSET:
@@ -2322,6 +3678,26 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_EVENT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_FAN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLC_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_IN_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_VR_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_PG_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_RD_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_OK_MASK_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_EVENT_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_LC_SN_MASK_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TMR_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD2_TLEFT_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_WD3_TMR_OFFSET:
@@ -2349,6 +3725,7 @@ static bool mlxplat_mlxcpld_volatile_reg(struct device *dev, unsigned int reg)
 	case MLXPLAT_CPLD_LPC_REG_FAN_DRW_CAP_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_TACHO_SPEED_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_PSU_I2C_CAP_OFFSET:
+	case MLXPLAT_CPLD_LPC_REG_SLOT_QTY_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG1_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_CONFIG2_OFFSET:
 	case MLXPLAT_CPLD_LPC_REG_UFM_VERSION_OFFSET:
@@ -2382,6 +3759,16 @@ static const struct reg_default mlxplat_mlxcpld_regmap_ng400[] = {
 	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
 };
 
+static const struct reg_default mlxplat_mlxcpld_regmap_eth_modular[] = {
+	{ MLXPLAT_CPLD_LPC_REG_GP2_OFFSET, 0x61 },
+	{ MLXPLAT_CPLD_LPC_REG_PWM_CONTROL_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD1_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD2_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_WD3_ACT_OFFSET, 0x00 },
+	{ MLXPLAT_CPLD_LPC_REG_AGGRLC_MASK_OFFSET,
+	  MLXPLAT_CPLD_AGGR_MASK_LC_LOW },
+};
+
 struct mlxplat_mlxcpld_regmap_context {
 	void __iomem *base;
 };
@@ -2462,8 +3849,22 @@ static const struct regmap_config mlxplat_mlxcpld_regmap_config_ng400 = {
 	.reg_write = mlxplat_mlxcpld_reg_write,
 };
 
+static const struct regmap_config mlxplat_mlxcpld_regmap_config_eth_modular = {
+	.reg_bits = 8,
+	.val_bits = 8,
+	.max_register = 255,
+	.cache_type = REGCACHE_FLAT,
+	.writeable_reg = mlxplat_mlxcpld_writeable_reg,
+	.readable_reg = mlxplat_mlxcpld_readable_reg,
+	.volatile_reg = mlxplat_mlxcpld_volatile_reg,
+	.reg_defaults = mlxplat_mlxcpld_regmap_eth_modular,
+	.num_reg_defaults = ARRAY_SIZE(mlxplat_mlxcpld_regmap_eth_modular),
+	.reg_read = mlxplat_mlxcpld_reg_read,
+	.reg_write = mlxplat_mlxcpld_reg_write,
+};
+
 static struct resource mlxplat_mlxcpld_resources[] = {
-	[0] = DEFINE_RES_IRQ_NAMED(17, "mlxreg-hotplug"),
+	[0] = DEFINE_RES_IRQ_NAMED(MLXPLAT_CPLD_LPC_SYSIRQ, "mlxreg-hotplug"),
 };
 
 static struct platform_device *mlxplat_dev;
@@ -2640,6 +4041,26 @@ static int __init mlxplat_dmi_ng400_matched(const struct dmi_system_id *dmi)
 	return 1;
 }
 
+static int __init mlxplat_dmi_modular_matched(const struct dmi_system_id *dmi)
+{
+	int i;
+
+	mlxplat_max_adap_num = MLXPLAT_CPLD_MAX_PHYS_ADAPTER_NUM;
+	mlxplat_mux_num = ARRAY_SIZE(mlxplat_modular_mux_data);
+	mlxplat_mux_data = mlxplat_modular_mux_data;
+	mlxplat_hotplug = &mlxplat_mlxcpld_modular_data;
+	mlxplat_hotplug->deferred_nr = MLXPLAT_CPLD_CH4_ETH_MODULAR;
+	mlxplat_led = &mlxplat_default_ng_led_data;
+	mlxplat_regs_io = &mlxplat_modular_regs_io_data;
+	mlxplat_fan = &mlxplat_default_fan_data;
+	for (i = 0; i < ARRAY_SIZE(mlxplat_mlxcpld_wd_set_type2); i++)
+		mlxplat_wd_data[i] = &mlxplat_mlxcpld_wd_set_type2[i];
+	mlxplat_i2c = &mlxplat_mlxcpld_i2c_ng_data;
+	mlxplat_regmap_config = &mlxplat_mlxcpld_regmap_config_eth_modular;
+
+	return 1;
+}
+
 static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 	{
 		.callback = mlxplat_dmi_default_matched,
@@ -2690,6 +4111,12 @@ static const struct dmi_system_id mlxplat_dmi_table[] __initconst = {
 		},
 	},
 	{
+		.callback = mlxplat_dmi_modular_matched,
+		.matches = {
+			DMI_MATCH(DMI_BOARD_NAME, "VMOD0011"),
+		},
+	},
+	{
 		.callback = mlxplat_dmi_msn274x_matched,
 		.matches = {
 			DMI_MATCH(DMI_BOARD_VENDOR, "Mellanox Technologies"),
-- 
2.11.0

