Return-Path: <platform-driver-x86+bounces-3243-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 601AB8BEB09
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 May 2024 20:01:39 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id AD803B25E24
	for <lists+platform-driver-x86@lfdr.de>; Tue,  7 May 2024 18:01:36 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0FCBB16D33B;
	Tue,  7 May 2024 18:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TvEPuWhk"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDC716C866;
	Tue,  7 May 2024 18:01:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715104875; cv=none; b=gQtz5F5mJ9jr7z8TT1WH7V6FEJSDpAF6UQ/RFrI6Yv1p6LqCBZxa46VzmG7lQuXriPLszjk3+75x3W92D/QLudY+uF60PXWWgo+HQbGVz3zDG7j0Bi12y5JO2um0vW7W8p16e8kQbOw/mL0MAZX5hgwT+nMyiHu5FQOuOEXkL6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715104875; c=relaxed/simple;
	bh=biVE2pxIxx+qNIVvKr5FCUYpjbM7OkxaTTAGZtWw5K4=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Yapt302Y64i0kUpUNNtKDklqoSoViiKbjnRm0gAtzuEaHqqozR3Omsxo5d9G7XTR0pr/TR+rrqW54WiwUpQFSihxewAcSp07y0cS16gPbWBotgZ74MgDpV6+cqLDZ9al7UV8b7ImO2Po2z/FxZUiPQk3GVXp7CwN7BWvFwP+ScI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TvEPuWhk; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1715104873; x=1746640873;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=biVE2pxIxx+qNIVvKr5FCUYpjbM7OkxaTTAGZtWw5K4=;
  b=TvEPuWhkTFzppzQ07DnrR75LkujnAEZ6awyUtpbZoWUVgKKejISWkOFP
   HjeIXDDDxG5Aas3y2+wGA06CxZBlxCY7mLcqbxLrKzOq6yPAilxsaJke7
   5SV+jWbfk66E3wtz9aMiJ46vkDLJD0DUJa5hROuXbZIcpjRe5Xmu1kSb8
   NJpUMTPOqQ2qCnnwv1aA84TJnBfIItxp/nYx8dB4LNak5OARN5psMc5Qe
   bk27O9pjtLJjyIjmPgjRq81e8ABK0lvW3VJ1kGOfocPClEuTolSI99+nm
   Gw0ogGEEJkvug5AZNlR2s/OhTcaTd1iESZ82c2ZwktDSGF2IBf+ZENT8u
   g==;
X-CSE-ConnectionGUID: mwxugn6xQraz5ibzcfsIZw==
X-CSE-MsgGUID: PMBIHSctTdmBmb7hxpD//A==
X-IronPort-AV: E=McAfee;i="6600,9927,11066"; a="22333265"
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="22333265"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:01:10 -0700
X-CSE-ConnectionGUID: Mh8S9EvoSy2QUg8UCPQ6YA==
X-CSE-MsgGUID: Z///CB4XQJy55LI4++pv9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,143,1712646000"; 
   d="scan'208";a="28491203"
Received: from sayakray-mobl2.amr.corp.intel.com (HELO debox1-desk4.lan) ([10.212.130.28])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 May 2024 11:01:11 -0700
From: "David E. Box" <david.e.box@linux.intel.com>
To: linux-doc@vger.kernel.org,
	david.e.box@linux.intel.com,
	ilpo.jarvinen@linux.intel.com,
	hdegoede@redhat.com,
	linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Subject: [PATCH V2 3/3] tools/arch/x86/intel_sdsi: Add attestation support
Date: Tue,  7 May 2024 11:01:06 -0700
Message-Id: <20240507180106.5218-3-david.e.box@linux.intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240507180106.5218-1-david.e.box@linux.intel.com>
References: <20240507180106.5218-1-david.e.box@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add support in the intel_sdsi tool to perform SPDM GET_DIGESTS and
GET_CERTIFICATE commands. Output is sent to stdout.

Example reading the certificate chain from socket 0:

intel_sdsi -d 1 -attest get_certificate | openssl x509 -inform DER -nout -text

Signed-off-by: David E. Box <david.e.box@linux.intel.com>
---
V2
   - Remove unnecessary struct packing
   - Remove newline from perror()
   - Use new SDSI_SPDM_BUF_SIZE from uapi header
   - In spdm_get_certificate:
        - Initialize remainder length to the minimum of the actual size
          or the maximum buffer size.
        - Add old_remainder to test for progress in retrieving the
	  certificate chain
   - Add the MESSAGE options for --attest in --help output

 tools/arch/x86/intel_sdsi/Makefile     |  11 +-
 tools/arch/x86/intel_sdsi/intel_sdsi.c |  72 +++-
 tools/arch/x86/intel_sdsi/spdm.c       | 476 +++++++++++++++++++++++++
 tools/arch/x86/intel_sdsi/spdm.h       |  13 +
 4 files changed, 567 insertions(+), 5 deletions(-)
 create mode 100644 tools/arch/x86/intel_sdsi/spdm.c
 create mode 100644 tools/arch/x86/intel_sdsi/spdm.h

diff --git a/tools/arch/x86/intel_sdsi/Makefile b/tools/arch/x86/intel_sdsi/Makefile
index 47b6fd98372c..0d59a0299bc7 100644
--- a/tools/arch/x86/intel_sdsi/Makefile
+++ b/tools/arch/x86/intel_sdsi/Makefile
@@ -3,20 +3,23 @@
 include ../../../scripts/Makefile.include
 BINDIR ?= /usr/sbin
 
-SRCS = intel_sdsi.c
+SRCS = intel_sdsi.c spdm.c
 
 OBJS = $(SRCS:.c=.o)
 
-override CFLAGS += -O2 -Wall -Wextra
+override CFLAGS += -O2 -Wall -Wextra -I../../../include
 
-intel_sdsi: $(OBJS)
+intel_sdsi: intel_sdsi.h $(OBJS)
 	$(CC) $(CFLAGS) $(OBJS) -o $@
 
+intel_sdsi.h: ../../../../include/uapi/linux/intel_sdsi.h
+	ln -sf ../../../../include/uapi/linux/intel_sdsi.h $@
+
 %.o: %.c
 	$(CC) $(CFLAGS) -c $< -o $@
 
 clean :
-	@rm -f intel_sdsi $(OBJS)
+	@rm -f intel_sdsi intel_sdsi.h $(OBJS)
 
 install : intel_sdsi
 	install -d  $(DESTDIR)$(BINDIR)
diff --git a/tools/arch/x86/intel_sdsi/intel_sdsi.c b/tools/arch/x86/intel_sdsi/intel_sdsi.c
index 766a5d26f534..b3c13e4696f4 100644
--- a/tools/arch/x86/intel_sdsi/intel_sdsi.c
+++ b/tools/arch/x86/intel_sdsi/intel_sdsi.c
@@ -22,6 +22,9 @@
 
 #include <sys/types.h>
 
+#include "spdm.h"
+#include "intel_sdsi.h"
+
 #ifndef __packed
 #define __packed __attribute__((packed))
 #endif
@@ -179,6 +182,7 @@ struct sdsi_dev {
 	struct state_certificate sc;
 	char *dev_name;
 	char *dev_path;
+	int dev_no;
 	uint32_t guid;
 };
 
@@ -189,6 +193,12 @@ enum command {
 	CMD_STATE_CERT,
 	CMD_PROV_AKC,
 	CMD_PROV_CAP,
+	CMD_ATTESTATION,
+};
+
+enum spdm_message {
+	GET_DIGESTS,
+	GET_CERTIFICATE,
 };
 
 static void sdsi_list_devices(void)
@@ -647,6 +657,41 @@ static int sdsi_provision_cap(struct sdsi_dev *s, char *bin_file)
 	return sdsi_provision(s, bin_file, CMD_PROV_CAP);
 }
 
+static int sdsi_attestation(struct sdsi_dev *s, enum spdm_message message)
+{
+	struct cert_chain c;
+	uint8_t digest[TPM_ALG_SHA_384_SIZE];
+	size_t size;
+	int ret, i;
+
+	switch (message) {
+	case GET_CERTIFICATE:
+		ret = spdm_get_certificate(s->dev_no, &c);
+		if (ret)
+			return ret;
+
+		size = fwrite(c.chain, sizeof(uint8_t), c.len, stdout);
+		if (size != c.len) {
+			fprintf(stderr, "Unable to write complete certificate chain\n");
+			ret = -1;
+		}
+
+		free(c.chain);
+		break;
+	case GET_DIGESTS:
+		ret = spdm_get_digests(s->dev_no, digest);
+		if (ret)
+			return ret;
+
+		for (i = 0; i < TPM_ALG_SHA_384_SIZE; i++)
+			printf("%02x", digest[i]);
+		printf("\n");
+		break;
+	}
+
+	return ret;
+}
+
 static int read_sysfs_data(const char *file, int *value)
 {
 	char buff[16];
@@ -728,6 +773,7 @@ static struct sdsi_dev *sdsi_create_dev(char *dev_no)
 	}
 
 	s->guid = guid;
+	s->dev_no = atoi(dev_no);
 
 	return s;
 }
@@ -742,6 +788,7 @@ static void sdsi_free_dev(struct sdsi_dev *s)
 static void usage(char *prog)
 {
 	printf("Usage: %s [-l] [-d DEVNO [-i] [-s] [-m | -C] [-a FILE] [-c FILE]\n", prog);
+	printf("       [-attest MESSAGE]\n");
 }
 
 static void show_help(void)
@@ -754,12 +801,17 @@ static void show_help(void)
 	printf("  %-18s\t%s\n", "-m, --meter",          "show meter certificate data");
 	printf("  %-18s\t%s\n", "-C, --meter_current",  "show live unattested meter data");
 	printf("  %-18s\t%s\n", "-a, --akc FILE",       "provision socket with AKC FILE");
-	printf("  %-18s\t%s\n", "-c, --cap FILE>",      "provision socket with CAP FILE");
+	printf("  %-18s\t%s\n", "-c, --cap FILE",       "provision socket with CAP FILE");
+	printf("  %-18s\t%s\n", "--attest MESSAGE",     "send attestion MESSAGE. Valid");
+	printf("  %-18s\t%s\n", "",                     "messages are:");
+	printf("  %-18s\t%s\n", "",                     "    get_digests");
+	printf("  %-18s\t%s\n", "",                     "    get_certificate");
 }
 
 int main(int argc, char *argv[])
 {
 	char bin_file[PATH_MAX], *dev_no = NULL;
+	enum spdm_message message = GET_DIGESTS;
 	bool device_selected = false;
 	char *progname;
 	enum command command = -1;
@@ -769,6 +821,7 @@ int main(int argc, char *argv[])
 
 	static struct option long_options[] = {
 		{"akc",			required_argument,	0, 'a'},
+		{"attest",		required_argument,	0, 0},
 		{"cap",			required_argument,	0, 'c'},
 		{"devno",		required_argument,	0, 'd'},
 		{"help",		no_argument,		0, 'h'},
@@ -820,6 +873,20 @@ int main(int argc, char *argv[])
 
 			command = (opt == 'a') ? CMD_PROV_AKC : CMD_PROV_CAP;
 			break;
+		case 0:
+			if (strcmp(long_options[option_index].name, "attest") == 0) {
+				command = CMD_ATTESTATION;
+
+				if (strcmp(optarg, "get_digests") == 0)
+					message = GET_DIGESTS;
+				else if (strcmp(optarg, "get_certificate") == 0)
+					message = GET_CERTIFICATE;
+				else {
+					fprintf(stderr, "Unrecognized attestation command\n");
+					return -1;
+				}
+			}
+			break;
 		case 'h':
 			usage(progname);
 			show_help();
@@ -854,6 +921,9 @@ int main(int argc, char *argv[])
 		case CMD_PROV_CAP:
 			ret = sdsi_provision_cap(s, bin_file);
 			break;
+		case CMD_ATTESTATION:
+			ret = sdsi_attestation(s, message);
+			break;
 		default:
 			fprintf(stderr, "No command specified\n");
 			return -1;
diff --git a/tools/arch/x86/intel_sdsi/spdm.c b/tools/arch/x86/intel_sdsi/spdm.c
new file mode 100644
index 000000000000..71ac1e91a6d8
--- /dev/null
+++ b/tools/arch/x86/intel_sdsi/spdm.c
@@ -0,0 +1,476 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * spdm: Lightweight Security Protocol and Data Model (SPDM) specification
+ * support code for performing attestation commands using the Intel On
+ * Demand driver ioctl interface. Intel On Demand currently supports
+ * SPDM version 1.0
+ *
+ * See the SPDM v1.0 specification at:
+ * https://www.dmtf.org/sites/default/files/standards/documents/DSP0274_1.0.1.pdf
+ *
+ * Copyright (C) 2024 Intel Corporation. All rights reserved.
+ */
+
+#include<linux/bits.h>
+
+#include<fcntl.h>
+#include<stdio.h>
+#include<stdlib.h>
+#include<stdint.h>
+#include<string.h>
+#include<unistd.h>
+#include<sys/ioctl.h>
+#include "spdm.h"
+#include "intel_sdsi.h"
+
+// SPDM constants
+#define SPDM_VERSION			0x10
+#define SPDM_REQUEST			0x80
+#define SPDM_ERROR			0x7f
+
+// SPDM request codes
+#define SPDM_GET_VERSION		0x84
+#define SPDM_GET_CAPABILITIES		0xE1
+#define SPDM_NEGOTIATE_ALGORITHMS	0xE3
+#define SPDM_GET_DIGESTS		0x81
+#define SPDM_GET_CERTIFICATE		0x82
+#define SPDM_CHALLENGE			0x83
+#define SPDM_GET_MEASUREMENTS		0xE0
+
+#define SDSI_DEV_PATH			"/dev/isdsi"
+
+#define SPDM_RSVD			0
+
+#ifndef __packed
+#define __packed __attribute__((packed))
+#endif
+
+struct spdm_header {
+	uint8_t version;
+	uint8_t code;
+	uint8_t param1;
+	uint8_t param2;
+};
+
+static int error_response(struct spdm_header *response)
+{
+	if (response->code != SPDM_ERROR)
+		fprintf(stderr, "ERROR: Unrecognized SPDM response\n");
+
+	switch (response->param1) {
+	case 0x00:
+	case 0x02:
+	case 0x06:
+	case 0x08 ... 0x40:
+	case 0x44 ... 0xfe:
+		fprintf(stderr, "SPDM RSP ERROR: Reserved.\n");
+		break;
+	case 0x01:
+		fprintf(stderr, "SPDM RSP ERROR: One or more request fields are invalid.\n");
+		break;
+	case 0x03:
+		fprintf(stderr, "SPDM RSP ERROR: The Responder received the request message\n");
+		fprintf(stderr, "and the Responder decided to ignore the request message\n");
+		fprintf(stderr, "but the Responder may be able to process the request message\n");
+		fprintf(stderr, "if the request message is sent again in the future.\n");
+		break;
+	case 0x04:
+		fprintf(stderr, "SPDM RSP ERROR: The Responder received an unexpected request\n");
+		fprintf(stderr, "message. For example, CHALLENGE before NEGOTIATE_ALGORITHMS.\n");
+		break;
+	case 0x05:
+		fprintf(stderr, "SPDM RSP ERROR: Unspecified error occurred.\n");
+		break;
+	case 0x07:
+		fprintf(stderr, "SPDM RSP ERROR: The RequestResponseCode in the request\n");
+		fprintf(stderr, "message is unsupported.\n");
+		break;
+	case 0x41:
+		fprintf(stderr, "SPDM RSP ERROR: Requested SPDM Major Version is not\n");
+		fprintf(stderr, "supported.\n");
+		break;
+	case 0x42:
+		fprintf(stderr, "SPDM RSP ERROR: See the RESPONSE_IF_READY request message.\n");
+		break;
+	case 0x43:
+		fprintf(stderr, "SPDM RSP ERROR: Responder is requesting Requester to reissue\n");
+		fprintf(stderr, "GET_VERSION to resynchronize.\n");
+		break;
+	case 0xFF:
+		fprintf(stderr, "SPDM RSP ERROR: Vendor or Other Standards defined.\n");
+		break;
+	}
+
+	return -1;
+}
+
+static int sdsi_process_ioctl(int ioctl_no, void *info, uint8_t dev_no)
+{
+	char pathname[14];
+	int fd, ret;
+
+	ret = snprintf(pathname, 14, "%s%d", SDSI_DEV_PATH, dev_no);
+	if (ret < 0)
+		return ret;
+
+	fd = open(pathname, O_RDONLY);
+	if (fd < 0)
+		return fd;
+
+	ret = ioctl(fd, ioctl_no, info);
+	if (ret)
+		perror("Failed to process ioctl");
+
+	close(fd);
+
+	return ret;
+}
+
+static int
+sdsi_process_spdm(void *request, void *response, int req_size, uint32_t rsp_size,
+		  int dev_no)
+{
+	struct sdsi_spdm_command *command;
+	struct sdsi_spdm_message *message = request;
+	uint8_t request_code;
+	int ret;
+
+	command = malloc(sizeof(*command));
+	if (!command) {
+		perror("malloc");
+		return -1;
+	}
+
+	command->size = req_size;
+	command->message = *message;
+	request_code = command->message.request_response_code;
+
+	ret = sdsi_process_ioctl(SDSI_IF_SPDM_COMMAND, command, dev_no);
+	if (ret)
+		goto free_command;
+
+	if (command->size < sizeof(struct spdm_header)) {
+		fprintf(stderr, "Bad SPDM message size\n");
+		ret = -1;
+		goto free_command;
+	}
+
+	if (command->message.request_response_code != (request_code & ~SPDM_REQUEST)) {
+		ret = error_response((struct spdm_header *)&command->message);
+		goto free_command;
+	}
+
+	if (response) {
+		if (command->size > rsp_size) {
+			fprintf(stderr, "SPDM response buffer too small\n");
+			ret = -1;
+			goto free_command;
+		}
+
+		memcpy(response, &command->message, command->size);
+	}
+
+free_command:
+	free(command);
+	return ret;
+}
+
+struct version_number_entry {
+	uint8_t alpha:4;
+	uint8_t update_version_number:4;
+	union {
+		uint8_t version;
+		struct {
+			uint8_t minor:4;
+			uint8_t major:4;
+		};
+	};
+} __packed;
+
+struct get_version_response {
+	struct spdm_header header;
+	uint16_t reserved:8;
+	uint16_t version_number_entry_count:8;
+	struct version_number_entry entry[10];
+} __packed;
+
+static int spdm_get_version(int dev_no)
+{
+	struct spdm_header request = {};
+	struct get_version_response response = {};
+	uint8_t version;
+	int ret;
+
+	request.version = SPDM_VERSION;
+	request.code = SPDM_GET_VERSION;
+	request.param1 = SPDM_RSVD;
+	request.param2 = SPDM_RSVD;
+
+	ret = sdsi_process_spdm(&request, &response, sizeof(request),
+				sizeof(response), dev_no);
+	if (ret) {
+		fprintf(stderr, "Failed GET_VERSION\n");
+		return ret;
+	}
+
+	if (!response.version_number_entry_count) {
+		fprintf(stderr, "Bad GET_VERSION entry count\n");
+		return -1;
+	}
+
+	version = response.entry[0].version;
+
+	if (version != SPDM_VERSION) {
+		fprintf(stderr, "Unsupported version 0x%x\n", SPDM_VERSION);
+		return -1;
+	}
+
+	return 0;
+}
+
+static int spdm_get_capabilities(int dev_no)
+{
+	struct spdm_header request = {};
+	int ret;
+
+	request.version = SPDM_VERSION;
+	request.code = SPDM_GET_CAPABILITIES;
+	request.param1 = SPDM_RSVD;
+	request.param2 = SPDM_RSVD;
+
+	ret = sdsi_process_spdm(&request, NULL, sizeof(request), 0, dev_no);
+	if (ret) {
+		fprintf(stderr, "Failed GET_CAPABILITIES\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+struct spdm_negotiate_alg {
+	struct spdm_header header;
+	uint32_t	length:16;
+	uint32_t	measurement_specification:8;
+	uint32_t	reserved:8;
+	uint32_t	base_asym_algo;
+	uint32_t	base_hash_algo;
+	uint32_t	reserved2[3];
+	uint32_t	ext_asym_count:8;
+	uint32_t	ext_hash_count:8;
+	uint32_t	reserved3:16;
+};
+
+#define MEASUREMENT_SPEC_DMTF			BIT(0)
+#define BASE_ASYM_ALG_ECDSA_ECC_NIST_P384	BIT(7)
+#define BASE_HASH_ALG_SHA_384			BIT(1)
+
+static int spdm_negotiate_algorithms(int dev_no)
+{
+	struct spdm_negotiate_alg request = {};
+	int ret;
+
+	request.header.version = SPDM_VERSION;
+	request.header.code = SPDM_NEGOTIATE_ALGORITHMS;
+	request.header.param1 = SPDM_RSVD;
+	request.header.param2 = SPDM_RSVD;
+
+	request.length = sizeof(request);
+	request.measurement_specification = MEASUREMENT_SPEC_DMTF;
+	request.base_asym_algo = BASE_ASYM_ALG_ECDSA_ECC_NIST_P384;
+	request.base_hash_algo = BASE_HASH_ALG_SHA_384;
+
+	ret = sdsi_process_spdm(&request, NULL, sizeof(request), 0, dev_no);
+	if (ret) {
+		fprintf(stderr, "Failed NEGOTIATE_ALGORITHMS\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static int spdm_negotiate(int dev_no)
+{
+	int ret;
+
+	ret = spdm_get_version(dev_no);
+	if (ret)
+		return ret;
+
+	ret = spdm_get_capabilities(dev_no);
+	if (ret)
+		return ret;
+
+	return spdm_negotiate_algorithms(dev_no);
+}
+
+struct get_digests_response {
+	struct spdm_header header;
+	uint8_t digest[TPM_ALG_SHA_384_SIZE];
+};
+
+#define SLOT_MASK(slot) BIT(slot)
+
+int spdm_get_digests(int dev_no, uint8_t digest[TPM_ALG_SHA_384_SIZE])
+{
+	struct spdm_header request = {};
+	struct get_digests_response response = {};
+	int ret;
+
+	ret = spdm_negotiate(dev_no);
+	if (ret)
+		return ret;
+
+	request.version = SPDM_VERSION;
+	request.code = SPDM_GET_DIGESTS;
+	request.param1 = SPDM_RSVD;
+	request.param2 = SPDM_RSVD;
+
+	ret = sdsi_process_spdm(&request, &response, sizeof(request),
+				sizeof(response), dev_no);
+	if (ret) {
+		fprintf(stderr, "Failed GET_DIGESTS\n");
+		return ret;
+	}
+
+	if (!(response.header.param2 & SLOT_MASK(0))) {
+		fprintf(stderr, "Error, Slot 0 not selected in GET_DIGESTS\n");
+		return -1;
+	}
+
+	if (digest)
+		memcpy(digest, response.digest, TPM_ALG_SHA_384_SIZE);
+
+	return 0;
+}
+
+#define CERT_SLOT	0
+
+struct get_cert_request {
+	struct spdm_header header;
+	uint16_t offset;
+	uint16_t length;
+};
+
+struct get_cert_response {
+	struct spdm_header header;
+	uint16_t portion_length;
+	uint16_t remainder_length;
+	uint8_t certificate_chain[SDSI_SPDM_BUF_SIZE];
+};
+
+static int get_certificate_size(int dev_no)
+{
+	struct get_cert_request request = {};
+	struct get_cert_response response = {};
+	int ret;
+
+	request.header.version = SPDM_VERSION;
+	request.header.code = SPDM_GET_CERTIFICATE;
+	request.header.param1 = CERT_SLOT;
+	request.header.param2 = SPDM_RSVD;
+	request.offset = 0;
+	request.length = SDSI_SPDM_BUF_SIZE;
+
+	ret = sdsi_process_spdm(&request, &response, sizeof(request),
+				sizeof(response), dev_no);
+	if (ret) {
+		fprintf(stderr, "Error getting size during GET_CERTIFICATE\n");
+		return ret;
+	}
+
+	return response.portion_length + response.remainder_length;
+}
+
+static int get_certificate_portion(int dev_no, uint16_t offset, uint16_t length,
+				   uint16_t *portion_length, uint16_t *remainder_length,
+				   uint8_t *cert_chain)
+{
+	struct get_cert_request request = {};
+	struct get_cert_response response = {};
+	int ret;
+
+	request.header.version = SPDM_VERSION;
+	request.header.code = SPDM_GET_CERTIFICATE;
+	request.header.param1 = CERT_SLOT;
+	request.header.param2 = SPDM_RSVD;
+	request.offset = offset;
+	request.length = length;
+
+	ret = sdsi_process_spdm(&request, &response, sizeof(request),
+				sizeof(response), dev_no);
+	if (ret) {
+		fprintf(stderr, "Failed GET_CERTIFICATE\n");
+		return ret;
+	}
+
+	*portion_length = response.portion_length;
+	*remainder_length = response.remainder_length;
+
+	memcpy(cert_chain + offset, response.certificate_chain, *portion_length);
+
+	return 0;
+}
+
+int spdm_get_certificate(int dev_no, struct cert_chain *c)
+{
+	uint16_t remainder_length;
+	uint16_t old_remainder;
+	uint16_t portion_length = 0;
+	uint16_t offset = 0;
+	uint16_t size;
+	int ret;
+
+	ret = spdm_negotiate(dev_no);
+	if (ret)
+		return ret;
+
+	ret = spdm_get_digests(dev_no, NULL);
+	if (ret)
+		return ret;
+
+	ret = get_certificate_size(dev_no);
+	if (ret < 0)
+		return ret;
+
+	size = ret;
+
+	c->chain = malloc(size);
+	if (!c->chain) {
+		perror("malloc");
+		return -1;
+	}
+
+	remainder_length = size < SDSI_SPDM_BUF_SIZE ? size : SDSI_SPDM_BUF_SIZE;
+	old_remainder = remainder_length;
+
+	while (remainder_length) {
+		uint16_t length;
+
+		length = remainder_length < SDSI_SPDM_BUF_SIZE ?
+				remainder_length : SDSI_SPDM_BUF_SIZE;
+		offset += portion_length;
+
+		ret = get_certificate_portion(dev_no, offset, length,
+					      &portion_length,
+					      &remainder_length,
+					      c->chain);
+		if (ret < 0)
+			goto free_cert_chain;
+
+		if (!(remainder_length < old_remainder)) {
+			fprintf(stderr, "Bad GET_CERTIFICATE length\n");
+			ret = -1;
+			goto free_cert_chain;
+		}
+
+		old_remainder = remainder_length;
+	}
+
+	c->len = offset + portion_length;
+	return 0;
+
+free_cert_chain:
+	free(c->chain);
+	c->chain = NULL;
+	return ret;
+}
diff --git a/tools/arch/x86/intel_sdsi/spdm.h b/tools/arch/x86/intel_sdsi/spdm.h
new file mode 100644
index 000000000000..aa7e08ffb872
--- /dev/null
+++ b/tools/arch/x86/intel_sdsi/spdm.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#include <stdint.h>
+
+#define TPM_ALG_SHA_384_SIZE 48
+
+struct cert_chain {
+	void *chain;
+	size_t len;
+};
+
+int spdm_get_digests(int dev_no, uint8_t digest[TPM_ALG_SHA_384_SIZE]);
+int spdm_get_certificate(int dev_no, struct cert_chain *c);
+
-- 
2.34.1


