Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 73A2172A4D5
	for <lists+platform-driver-x86@lfdr.de>; Fri,  9 Jun 2023 22:43:21 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232321AbjFIUnU (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 9 Jun 2023 16:43:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44678 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232285AbjFIUnT (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 9 Jun 2023 16:43:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF74930F1
        for <platform-driver-x86@vger.kernel.org>; Fri,  9 Jun 2023 13:42:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1686343355;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=tIHS4ZGwLmpBq3yASCoMhWXPQdCcm1k5A29a4Y8FLfU=;
        b=fxOl4OdvpJHqwcwrQkTeKqps6MfXwvbY22g9ajlWeCpvPD/yWkkn4DQFDWotj4zEbNSNDc
        F76oCQppug9kOm1ZpAbrPDR7q5/2dpwyZZmrtbSY44gPMBVvpBFhYbVOCd057az+BLi/pF
        EBWE7JyGxxdegItZeNn13MZRiBnjecA=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-488-XO_-YywDM367n8cR0XXYNA-1; Fri, 09 Jun 2023 16:42:33 -0400
X-MC-Unique: XO_-YywDM367n8cR0XXYNA-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0D7343801FFB;
        Fri,  9 Jun 2023 20:42:33 +0000 (UTC)
Received: from shalem.redhat.com (unknown [10.39.192.16])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EF85F40CFD00;
        Fri,  9 Jun 2023 20:42:31 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Dan Scally <dan.scally@ideasonboard.com>,
        Hao Yao <hao.yao@intel.com>, Bingbu Cao <bingbu.cao@intel.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH 2/4] platform/x86: int3472: discrete: Remove sensor_config-s
Date:   Fri,  9 Jun 2023 22:42:26 +0200
Message-Id: <20230609204228.74967-3-hdegoede@redhat.com>
In-Reply-To: <20230609204228.74967-1-hdegoede@redhat.com>
References: <20230609204228.74967-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Currently the only 2 sensor_config-s both specify "avdd" as supply-id.

The INT3472 device is going to be the only supplier of a regulator for
the sensor device.

So there is no chance of collisions with other regulator suppliers
and it is undesirable to need to manually add new entries to
int3472_sensor_configs[] for each new sensor module which uses
a GPIO regulator.

Instead just always use "avdd" as supply-id when registering
the GPIO regulator.

If necessary for specific sensor drivers then other supply-ids can
be added as aliases in the future, adding aliases will be safe
since INT3472 will be the only regulator supplier for the sensor.

Cc: Hao Yao <hao.yao@intel.com>
Cc: Bingbu Cao <bingbu.cao@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 .../x86/intel/int3472/clk_and_regulator.c     | 38 ++++++++++------
 drivers/platform/x86/intel/int3472/common.h   |  7 +--
 drivers/platform/x86/intel/int3472/discrete.c | 45 +++----------------
 3 files changed, 31 insertions(+), 59 deletions(-)

diff --git a/drivers/platform/x86/intel/int3472/clk_and_regulator.c b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
index b3a55c618151..30686091300d 100644
--- a/drivers/platform/x86/intel/int3472/clk_and_regulator.c
+++ b/drivers/platform/x86/intel/int3472/clk_and_regulator.c
@@ -232,32 +232,42 @@ void skl_int3472_unregister_clock(struct int3472_discrete_device *int3472)
 	gpiod_put(int3472->clock.ena_gpio);
 }
 
+/*
+ * The INT3472 device is going to be the only supplier of a regulator for
+ * the sensor device. But unlike the clk framework the regulator framework
+ * does not allow matching by consumer-device-name only.
+ *
+ * Ideally all sensor drivers would use "avdd" as supply-id. But for drivers
+ * where this cannot be changed because another supply-id is already used in
+ * e.g. DeviceTree files an alias for the other supply-id can be added here.
+ *
+ * Do not forget to update GPIO_REGULATOR_SUPPLY_MAP_COUNT when changing this.
+ */
+static const char * const skl_int3472_regulator_map_supplies[] = {
+	"avdd",
+};
+
 int skl_int3472_register_regulator(struct int3472_discrete_device *int3472,
 				   struct acpi_resource_gpio *agpio)
 {
-	const struct int3472_sensor_config *sensor_config;
 	char *path = agpio->resource_source.string_ptr;
-	struct regulator_consumer_supply supply_map;
 	struct regulator_init_data init_data = { };
 	struct regulator_config cfg = { };
-	int ret;
+	int i, ret;
 
-	sensor_config = int3472->sensor_config;
-	if (IS_ERR(sensor_config)) {
-		dev_err(int3472->dev, "No sensor module config\n");
-		return PTR_ERR(sensor_config);
+	if (ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT) {
+		dev_err(int3472->dev, "Internal error ARRAY_SIZE(skl_int3472_regulator_map_supplies) != GPIO_REGULATOR_SUPPLY_MAP_COUNT\n");
+		return -EINVAL;
 	}
 
-	if (!sensor_config->supply_map.supply) {
-		dev_err(int3472->dev, "No supply name defined\n");
-		return -ENODEV;
+	for (i = 0; i < ARRAY_SIZE(skl_int3472_regulator_map_supplies); i++) {
+		int3472->regulator.supply_map[i].supply = skl_int3472_regulator_map_supplies[i];
+		int3472->regulator.supply_map[i].dev_name = int3472->sensor_name;
 	}
 
 	init_data.constraints.valid_ops_mask = REGULATOR_CHANGE_STATUS;
-	init_data.num_consumer_supplies = 1;
-	supply_map = sensor_config->supply_map;
-	supply_map.dev_name = int3472->sensor_name;
-	init_data.consumer_supplies = &supply_map;
+	init_data.consumer_supplies = int3472->regulator.supply_map;
+	init_data.num_consumer_supplies = GPIO_REGULATOR_SUPPLY_MAP_COUNT;
 
 	snprintf(int3472->regulator.regulator_name,
 		 sizeof(int3472->regulator.regulator_name), "%s-regulator",
diff --git a/drivers/platform/x86/intel/int3472/common.h b/drivers/platform/x86/intel/int3472/common.h
index 735567f374a6..225b067c854d 100644
--- a/drivers/platform/x86/intel/int3472/common.h
+++ b/drivers/platform/x86/intel/int3472/common.h
@@ -28,6 +28,7 @@
 
 #define GPIO_REGULATOR_NAME_LENGTH				21
 #define GPIO_REGULATOR_SUPPLY_NAME_LENGTH			9
+#define GPIO_REGULATOR_SUPPLY_MAP_COUNT				1
 
 #define INT3472_LED_MAX_NAME_LEN				32
 
@@ -69,11 +70,6 @@ struct int3472_cldb {
 	u8 reserved2[17];
 };
 
-struct int3472_sensor_config {
-	const char *sensor_module_name;
-	struct regulator_consumer_supply supply_map;
-};
-
 struct int3472_discrete_device {
 	struct acpi_device *adev;
 	struct device *dev;
@@ -83,6 +79,7 @@ struct int3472_discrete_device {
 	const struct int3472_sensor_config *sensor_config;
 
 	struct int3472_gpio_regulator {
+		struct regulator_consumer_supply supply_map[GPIO_REGULATOR_SUPPLY_MAP_COUNT];
 		char regulator_name[GPIO_REGULATOR_NAME_LENGTH];
 		char supply_name[GPIO_REGULATOR_SUPPLY_NAME_LENGTH];
 		struct gpio_desc *gpio;
diff --git a/drivers/platform/x86/intel/int3472/discrete.c b/drivers/platform/x86/intel/int3472/discrete.c
index 2ab3c7466986..3b410428cec2 100644
--- a/drivers/platform/x86/intel/int3472/discrete.c
+++ b/drivers/platform/x86/intel/int3472/discrete.c
@@ -34,48 +34,17 @@ static const guid_t cio2_sensor_module_guid =
 	GUID_INIT(0x822ace8f, 0x2814, 0x4174,
 		  0xa5, 0x6b, 0x5f, 0x02, 0x9f, 0xe0, 0x79, 0xee);
 
-/*
- * Here follows platform specific mapping information that we can pass to
- * the functions mapping resources to the sensors. Where the sensors have
- * a power enable pin defined in DSDT we need to provide a supply name so
- * the sensor drivers can find the regulator. The device name will be derived
- * from the sensor's ACPI device within the code.
- */
-static const struct int3472_sensor_config int3472_sensor_configs[] = {
-	/* Lenovo Miix 510-12ISK - OV5648, Rear */
-	{ "GEFF150023R", REGULATOR_SUPPLY("avdd", NULL) },
-	/* Surface Go 1&2 - OV5693, Front */
-	{ "YHCU", REGULATOR_SUPPLY("avdd", NULL) },
-};
-
-static const struct int3472_sensor_config *
-skl_int3472_get_sensor_module_config(struct int3472_discrete_device *int3472)
+static void skl_int3472_log_sensor_module_name(struct int3472_discrete_device *int3472)
 {
 	union acpi_object *obj;
-	unsigned int i;
 
 	obj = acpi_evaluate_dsm_typed(int3472->sensor->handle,
 				      &cio2_sensor_module_guid, 0x00,
 				      0x01, NULL, ACPI_TYPE_STRING);
-
-	if (!obj) {
-		dev_err(int3472->dev,
-			"Failed to get sensor module string from _DSM\n");
-		return ERR_PTR(-ENODEV);
+	if (obj) {
+		dev_dbg(int3472->dev, "Sensor module id: '%s'\n", obj->string.pointer);
+		ACPI_FREE(obj);
 	}
-
-	for (i = 0; i < ARRAY_SIZE(int3472_sensor_configs); i++) {
-		if (!strcmp(int3472_sensor_configs[i].sensor_module_name,
-			    obj->string.pointer))
-			break;
-	}
-
-	ACPI_FREE(obj);
-
-	if (i >= ARRAY_SIZE(int3472_sensor_configs))
-		return ERR_PTR(-EINVAL);
-
-	return &int3472_sensor_configs[i];
 }
 
 static int skl_int3472_map_gpio_to_sensor(struct int3472_discrete_device *int3472,
@@ -266,11 +235,7 @@ static int skl_int3472_parse_crs(struct int3472_discrete_device *int3472)
 	LIST_HEAD(resource_list);
 	int ret;
 
-	/*
-	 * No error check, because not having a sensor config is not necessarily
-	 * a failure mode.
-	 */
-	int3472->sensor_config = skl_int3472_get_sensor_module_config(int3472);
+	skl_int3472_log_sensor_module_name(int3472);
 
 	ret = acpi_dev_get_resources(int3472->adev, &resource_list,
 				     skl_int3472_handle_gpio_resources,
-- 
2.40.1

