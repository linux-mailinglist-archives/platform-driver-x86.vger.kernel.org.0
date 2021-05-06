Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 18AA9375351
	for <lists+platform-driver-x86@lfdr.de>; Thu,  6 May 2021 13:56:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232151AbhEFL5f (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 6 May 2021 07:57:35 -0400
Received: from mx0b-00154904.pphosted.com ([148.163.137.20]:43294 "EHLO
        mx0b-00154904.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231800AbhEFL5f (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 6 May 2021 07:57:35 -0400
Received: from pps.filterd (m0170394.ppops.net [127.0.0.1])
        by mx0b-00154904.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146BqHWE005444;
        Thu, 6 May 2021 07:56:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dell.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding;
 s=smtpout1; bh=kAqG1xSiy1fNYSYSKfOGSm223epERpT41q1HmNbuKro=;
 b=LutnyVl2+bEx/LAzgTy51fWLaa8npc920qs3v+rOF7tZ+X7auvm/qg8eNdoBs3UNO81d
 jlWhBSxsEyCFRkxTIzJwtvTqstJ0B8YwTA/6zAF0UwDPry084gsUg2sYDtayFZlf4WTO
 sYR6JZi7FnMkc+h4bDdqMxFBBAKWbkI+eNoLu2/Qfi9joukjGTAjBmmlvrPO637Ug5Ph
 txTdx2KkOAUFVBlkl3hDlqY+sksiREEFBS4larmU6UJp2KtFEfGKIoNoGun/O864lFXB
 LlpTIHKLIBvTWvLm4mZrerpQHIodolq36vB+nHebaKV+yXov1gVahtmrIv31wu4bHXFh hQ== 
Received: from mx0b-00154901.pphosted.com (mx0b-00154901.pphosted.com [67.231.157.37])
        by mx0b-00154904.pphosted.com with ESMTP id 38bec9q3fy-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 06 May 2021 07:56:37 -0400
Received: from pps.filterd (m0144103.ppops.net [127.0.0.1])
        by mx0b-00154901.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 146BuawK183260;
        Thu, 6 May 2021 07:56:36 -0400
Received: from esaploutps321.us.dell.com ([143.166.148.228])
        by mx0b-00154901.pphosted.com with ESMTP id 38ccwpjknb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 06 May 2021 07:56:36 -0400
X-LoopCount0: from 10.69.132.19
X-PREM-Routing: D-Outbound
X-IronPort-AV: E=Sophos;i="5.82,277,1613455200"; 
   d="scan'208";a="9585114"
From:   Perry Yuan <Perry.Yuan@dell.com>
To:     pobrn@protonmail.com, pierre-louis.bossart@linux.intel.com,
        oder_chiou@realtek.com, perex@perex.cz, tiwai@suse.com,
        hdegoede@redhat.com, mgross@linux.intel.com
Cc:     lgirdwood@gmail.com, broonie@kernel.org,
        alsa-devel@alsa-project.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, Perry.Yuan@dell.com,
        mario.limonciello@outlook.com, Dell.Client.Kernel@dell.com
Subject: [PATCH v8 2/2] ASoC: rt715:add micmute led state control supports
Date:   Thu,  6 May 2021 19:56:26 +0800
Message-Id: <20210506115626.12480-1-Perry_Yuan@Dell.com>
X-Mailer: git-send-email 2.19.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-05-06_08:2021-05-06,2021-05-06 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 impostorscore=0 mlxscore=0 phishscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 clxscore=1015 suspectscore=0 mlxlogscore=999
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2104060000 definitions=main-2105060084
X-Proofpoint-GUID: BI7_-ab8T80bU-l2vlO6ikB11DRvAMKq
X-Proofpoint-ORIG-GUID: BI7_-ab8T80bU-l2vlO6ikB11DRvAMKq
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 phishscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2104060000
 definitions=main-2105060083
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
v7 -> v8:
* N/A
v6 -> v7:
* addresed review comments from Jaroslav
* use device id in the quirk list
v5 -> v6:
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
 sound/soc/codecs/rt715-sdca.c | 42 +++++++++++++++++++++++++++++++++++
 sound/soc/codecs/rt715.c      | 42 +++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 936e3061ca1e..de46514e0207 100644
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
 
@@ -1069,6 +1110,7 @@ int rt715_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 1352869cc086..4dbd870009b8 100644
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
@@ -83,6 +111,7 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 	unsigned int addr_h, addr_l, val_h, val_ll, val_lr;
 	unsigned int read_ll, read_rl, i;
 	unsigned int k_vol_changed = 0;
+	bool micmute_led;
 
 	for (i = 0; i < 2; i++) {
 		if (ucontrol->value.integer.value[i] != rt715->kctl_2ch_vol_ori[i]) {
@@ -155,6 +184,18 @@ static int rt715_set_amp_gain_put(struct snd_kcontrol *kcontrol,
 			break;
 	}
 
+	/* Micmute LED state changed by muted/unmute switch
+	 * to keep syncing with actual hardware mic mute led state
+	 * invert will be checked to change the state switch
+	 */
+	if (micmute_led_set) {
+		if (ucontrol->value.integer.value[0] || ucontrol->value.integer.value[1])
+			micmute_led = LED_OFF;
+		else
+			micmute_led = LED_ON;
+		ledtrig_audio_set(LED_AUDIO_MICMUTE, micmute_led);
+	}
+
 	/* D0:power on state, D3: power saving mode */
 	if (dapm->bias_level <= SND_SOC_BIAS_STANDBY)
 		regmap_write(rt715->regmap,
@@ -1088,6 +1129,7 @@ int rt715_io_init(struct device *dev, struct sdw_slave *slave)
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put_autosuspend(&slave->dev);
+	dmi_check_system(micmute_led_dmi_table);
 
 	return 0;
 }
-- 
2.25.1

