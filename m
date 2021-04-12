Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8F5CE35C11C
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Apr 2021 11:23:52 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238695AbhDLJWJ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Apr 2021 05:22:09 -0400
Received: from mx0a-00154904.pphosted.com ([148.163.133.20]:11642 "EHLO
        mx0a-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S240637AbhDLJUC (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Apr 2021 05:20:02 -0400
Received: from pps.filterd (m0170389.ppops.net [127.0.0.1])
        by mx0a-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13C9Cetr013222;
        Mon, 12 Apr 2021 05:19:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=d2YeAzcMr5WXK8+Rz5JJ/XJQ38jVQ+th1Ygw2YKFiwc=;
 b=nIs60VuRwBOvEfy3dVMeueBh+2u7Em4goZdseRNqcV0l/1mw8ahLIzbeTpYJnC9XpQJC
 Th8OT2LD2u+M27C8vvf5DYWECZlvdaTm4iViRFLsN9h5TkoRbdn1Z4v+nTIuq9xdJBxA
 keppnZcf8mrs6osT4ZaVNBRqU+dnrj5B13ORm/ih9985Ai6OYfuVFfxuwtG+aXREsg6v
 BhWKJwN42XL71h6Y5zQbW9YbNNuYq4AreJ1fEL5SL3QaSe9LUZQWu45Yv7g/iuEBW/ch
 x3pi01tZpa49soqpjDjByaj4/+SqvPrx1SSWCmWFePq1aT7CZptvLE4iOW++XinQ1Esh Eg== 
Received: from mx0b-00154901.pphosted.com (mx0a-00154901.pphosted.com [67.231.149.39])
        by mx0a-00154904.pphosted.com with ESMTP id 37u81mvn5q-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 12 Apr 2021 05:19:45 -0400
Received: from pps.filterd (m0090350.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 13C9AcgZ182680;
        Mon, 12 Apr 2021 05:19:44 -0400
Received: from ausxippc106.us.dell.com (AUSXIPPC106.us.dell.com [143.166.85.156])
        by mx0b-00154901.pphosted.com with ESMTP id 37us87cvsw-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 12 Apr 2021 05:19:44 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.81,216,1610431200"; 
   d="scan'208";a="689675310"
From:   Perry Yuan <Perry.Yuan@dell.com>
To:     pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
        oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Perry.Yuan@dell.com,
        mario.limonciello@outlook.com, Dell.Client.Kernel@dell.com
Subject: [PATCH v7 2/2] ASoC: rt715:add micmute led state control supports
Date:   Mon, 12 Apr 2021 17:19:39 +0800
Message-Id: <20210412091939.16036-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-04-12_07:2021-04-12,2021-04-12 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 clxscore=1015 bulkscore=0 spamscore=0
 impostorscore=0 priorityscore=1501 lowpriorityscore=0 mlxscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120061
X-Proofpoint-GUID: U6PBAtD8Yi2iQ46VdReYOvrtRPQq2IYJ
X-Proofpoint-ORIG-GUID: U6PBAtD8Yi2iQ46VdReYOvrtRPQq2IYJ
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 adultscore=0
 malwarescore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2104120061
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Perry Yuan <perry_yuan@dell.com>

Some new Dell system is going to support audio internal micphone
privacy setting from hardware level with micmute led state changing
When micmute hotkey pressed by user, soft mute will need to be enabled
firstly in case of pop noise, and codec driver need to react to mic
mute event to EC(embedded controller) notifying that SW mute is completed
Then EC will do the hardware mute physically within the timeout reached

This patch allow codec rt715 and rt715 sdca driver to change the local micmute
led state. Dell privacy led trigger driver will ack EC when micmute key pressed
through this micphone led control interface like hda_generic provided
ACPI method defined in dell-privacy micmute led trigger will be called
for notifying the EC that software mute has been completed, then hardware
audio circuit solution controlled by EC will switch the audio input source off/on

Signed-off-by: Perry Yuan <perry_yuan@dell.com>

--------
v5 -> v6:
* addresed review comments from Jaroslav
* add quirks for micmute led control as short term solution to control
  micmute led state change
* add comments for the invert checking
v4 -> v5:
* rebase to latest 5.12 rc4 upstream kernel
v3 -> v4:
* remove unused debug log
* remove compile flag of DELL privacy
* move the micmute_led to local from rt715_priv
* when Jaroslav upstream his gerneric LED trigger driver,I will rebase
  this patch,please consider merge this at first
  https://lore.kernel.org/alsa-devel/20210211111400.1131020-1-perex@perex.cz/
v2 -> v3:
* simplify the patch to reuse some val value
* add more detail to the commit info
v1 -> v2:
* fix some format issue
--------
---
 sound/soc/codecs/rt715-sdca.c | 42 ++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt715.c      | 43 +++++++++++++++++++++++++++++++++++
 2 files changed, 85 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 20528afbdc57..47dc31f7f3e3 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -11,12 +11,14 @@
 #include <linux/moduleparam.h>
 #include <linux/kernel.h>
 #include <linux/init.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
 #include <linux/platform_device.h>
+#include <linux/dmi.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -344,6 +346,32 @@ static int rt715_sdca_get_volsw(struct snd_kcontrol *kcontrol,
 	return 0;
 }
 
+static bool micmute_led_set;
+static int  dmi_matched(const struct dmi_system_id *dmi)
+{
+	micmute_led_set = 1;
+	return 1;
+}
+
+/* Some systems will need to use this to trigger mic mute LED state changed */
+static const struct dmi_system_id micmute_led_dmi_table[] = {
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
+		},
+	},
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
+		},
+	},
+	{},
+};
+
 static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	struct snd_ctl_elem_value *ucontrol)
 {
@@ -358,6 +386,7 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 	unsigned int mask = (1 << fls(max)) - 1;
 	unsigned int invert = p->invert;
 	int err;
+	bool micmute_led;
 
 	for (i = 0; i < 4; i++) {
 		if (ucontrol->value.integer.value[i] != rt715->kctl_switch_orig[i]) {
@@ -394,6 +423,18 @@ static int rt715_sdca_put_volsw(struct snd_kcontrol *kcontrol,
 			return err;
 	}
 
+	/* Micmute LED state changed by muted/unmute switch
+	 * to keep syncing with actual hardware mic mute led state
+	 * invert will be checked to change the state switch
+	 */
+	if (invert && micmute_led_set) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
+			micmute_led = LED_OFF;
+		else
+			micmute_led = LED_ON;
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	return k_changed;
 }
 
@@ -1066,6 +1107,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 34c3357e943b..59d05b28f52e 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -13,6 +13,7 @@
 #include <linux/init.h>
 #include <linux/delay.h>
 #include <linux/i2c.h>
+#include <linux/leds.h>
 #include <linux/pm_runtime.h>
 #include <linux/pm.h>
 #include <linux/soundwire/sdw.h>
@@ -25,6 +26,7 @@
 #include <linux/of.h>
 #include <linux/of_gpio.h>
 #include <linux/of_device.h>
+#include <linux/dmi.h>
 #include <sound/core.h>
 #include <sound/pcm.h>
 #include <sound/pcm_params.h>
@@ -70,6 +72,32 @@ static void rt715_get_gain(struct rt715_priv *rt715, unsigned int addr_h,
 		pr_err("Failed to get L channel gain.\n");
 }
 
+static bool micmute_led_set;
+static int  dmi_matched(const struct dmi_system_id *dmi)
+{
+	micmute_led_set = 1;
+	return 1;
+}
+
+/* Some systems will need to use this to trigger mic mute LED state changed */
+static const struct dmi_system_id micmute_led_dmi_table[] = {
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A32"),
+		},
+	},
+	{
+		.callback = dmi_matched,
+		.matches = {
+			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
+			DMI_MATCH(DMI_PRODUCT_SKU, "0A3E"),
+		},
+	},
+	{},
+};
+
 /* For Verb-Set Amplifier Gain (Verb ID = 3h) */
 static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 					struct snd_ctl_elem_value *ucontrol)
@@ -88,6 +116,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 		RT715_SET_GAIN_MIX_ADC2_L};
 	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
 	unsigned int read_ll, read_rl, i, j, loop_cnt;
+	bool micmute_led;
 
 	if (strstr(ucontrol->id.name, "Main Capture Switch") ||
 		strstr(ucontrol->id.name, "Main Capture Volume"))
@@ -185,6 +214,19 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
 				RT715_SET_AUDIO_POWER_STATE, AC_PWRST_D3);
+
+	/* Micmute LED state changed by muted/unmute switch
+	 * to keep syncing with actual hardware mic mute led state
+	 * invert will be checked to change the state switch
+	 */
+	if (mc->invert && micmute_led_set) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
+			micmute_led = LED_OFF;
+		else
+			micmute_led = LED_ON;
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	return 0;
 }
 
@@ -901,6 +943,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
-- 
2.25.1

