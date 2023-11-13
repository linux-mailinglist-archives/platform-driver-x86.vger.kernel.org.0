Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 910107EA32D
	for <lists+platform-driver-x86@lfdr.de>; Mon, 13 Nov 2023 19:59:14 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231649AbjKMS7O (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 13 Nov 2023 13:59:14 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231618AbjKMS7N (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 13 Nov 2023 13:59:13 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8885D10EC;
        Mon, 13 Nov 2023 10:59:10 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADHiqMw019587;
        Mon, 13 Nov 2023 18:59:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type : content-transfer-encoding; s=corp-2023-03-30;
 bh=cADs8qk2ppLthQt4oT8j8ZmUSa4B8v92ZlV1vefrQM4=;
 b=0eq9BDRyOuLbABYO8n9OkHk7WQTHyCLAyOcMxk6vHbGaCp2oR6NrsBwx4yCtsoRfsTzo
 hntauscF8FTL1pFdUzjnte/s7aWRB6LS34sKtvsyG2Mk/haG8Jq+0UXj3PGufiJQhEHH
 xoMRyMTMBkWnQi8wD1hx2S7DmAMFF0bXwq/TWVkpNujhDWiPCKNRDHz5169BPuV9yjVJ
 IzD5xIv26MCjtLNt4OhEH4rimQn81ZPDTAL1rKvkRN0B5+Uh03z/nIvsd099NM63UXRe
 gGl43EoAuwS97R9MubKmXEPgmUYtQnhOxlAW/TbovBWEZbkg1Ft4Pz+YE6PGzvfPk/TV dA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3ua2m2bh29-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Nov 2023 18:59:02 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ADItAf1014991;
        Mon, 13 Nov 2023 18:59:02 GMT
Received: from pps.reinject (localhost [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uaxpuur09-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 13 Nov 2023 18:59:02 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 3ADIwtmT021868;
        Mon, 13 Nov 2023 18:59:01 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 3uaxpuuqw1-4;
        Mon, 13 Nov 2023 18:59:01 +0000
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
To:     Jorge Lopez <jorge.lopez2@hp.com>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <linux@weissschuh.net>,
        platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
Cc:     dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
        error27@gmail.com, vegard.nossum@oracle.com,
        harshit.m.mogalapalli@oracle.com, darren.kenny@oracle.com
Subject: [PATCH v3 4/4] platform/x86: hp-bioscfg: Remove unused obj in hp_add_other_attributes()
Date:   Mon, 13 Nov 2023 10:58:50 -0800
Message-ID: <20231113185852.3579970-4-harshit.m.mogalapalli@oracle.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
References: <20231113185852.3579970-1-harshit.m.mogalapalli@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-13_09,2023-11-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0
 phishscore=0 mlxscore=0 bulkscore=0 spamscore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311130153
X-Proofpoint-GUID: 7OWOZMsGqalXqO1_hyXQl7fJnb2xcVHP
X-Proofpoint-ORIG-GUID: 7OWOZMsGqalXqO1_hyXQl7fJnb2xcVHP
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_MED,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        RCVD_IN_MSPIKE_H5,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

acpi_object *obj is unused in this function, so delete it, also
delete a unnecessary kfree(obj);

Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
---
v2->v3: Add R.B from Ilpo and move this patch to end of the series.
---
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
index 6ddca857cc4d..8c9f4f3227fc 100644
--- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -575,80 +575,78 @@ static void release_attributes_data(void)
 /**
  * hp_add_other_attributes() - Initialize HP custom attributes not
  * reported by BIOS and required to support Secure Platform and Sure
  * Start.
  *
  * @attr_type: Custom HP attribute not reported by BIOS
  *
  * Initialize all 2 types of attributes: Platform and Sure Start
  * object.  Populates each attribute types respective properties
  * under sysfs files.
  *
  * Returns zero(0) if successful. Otherwise, a negative value.
  */
 static int hp_add_other_attributes(int attr_type)
 {
 	struct kobject *attr_name_kobj;
-	union acpi_object *obj = NULL;
 	int ret;
 	char *attr_name;
 
 	attr_name_kobj = kzalloc(sizeof(*attr_name_kobj), GFP_KERNEL);
 	if (!attr_name_kobj)
 		return -ENOMEM;
 
 	mutex_lock(&bioscfg_drv.mutex);
 
 	/* Check if attribute type is supported */
 	switch (attr_type) {
 	case HPWMI_SECURE_PLATFORM_TYPE:
 		attr_name_kobj->kset = bioscfg_drv.authentication_dir_kset;
 		attr_name = SPM_STR;
 		break;
 
 	case HPWMI_SURE_START_TYPE:
 		attr_name_kobj->kset = bioscfg_drv.main_dir_kset;
 		attr_name = SURE_START_STR;
 		break;
 
 	default:
 		pr_err("Error: Unknown attr_type: %d\n", attr_type);
 		ret = -EINVAL;
 		kfree(attr_name_kobj);
 		goto unlock_drv_mutex;
 	}
 
 	ret = kobject_init_and_add(attr_name_kobj, &attr_name_ktype,
 				   NULL, "%s", attr_name);
 	if (ret) {
 		pr_err("Error encountered [%d]\n", ret);
 		goto err_other_attr_init;
 	}
 
 	/* Populate attribute data */
 	switch (attr_type) {
 	case HPWMI_SECURE_PLATFORM_TYPE:
 		ret = hp_populate_secure_platform_data(attr_name_kobj);
 		break;
 
 	case HPWMI_SURE_START_TYPE:
 		ret = hp_populate_sure_start_data(attr_name_kobj);
 		break;
 
 	default:
 		ret = -EINVAL;
 	}
 
 	if (ret)
 		goto err_other_attr_init;
 
 	mutex_unlock(&bioscfg_drv.mutex);
 	return 0;
 
 err_other_attr_init:
 	kobject_put(attr_name_kobj);
 unlock_drv_mutex:
 	mutex_unlock(&bioscfg_drv.mutex);
-	kfree(obj);
 	return ret;
 }
 
-- 
2.39.3

