Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 279FD3C9ABE
	for <lists+platform-driver-x86@lfdr.de>; Thu, 15 Jul 2021 10:36:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240269AbhGOIjc (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 15 Jul 2021 04:39:32 -0400
Received: from smtp-out2.suse.de ([195.135.220.29]:36368 "EHLO
        smtp-out2.suse.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229620AbhGOIjc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 15 Jul 2021 04:39:32 -0400
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by smtp-out2.suse.de (Postfix) with ESMTPS id E7DF31FDF9;
        Thu, 15 Jul 2021 08:36:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
        t=1626338197; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2PWjr+0c7psZzyw1qFaM/XPj81wb2xNcBw94sKXKDHs=;
        b=qrNDU29dDXzvPD1erWBKcRFYJo36GDE2FyTiUgXz1zL12YE+BbmgrUhmZLT0caFBr6YRfU
        K8BgmhrRni2LYKEGw9TrxJVRDofdcBg+/mLdpuLl1uPjqWthfUbQ2wfVaIwKe1Rsu3YRh9
        kbyfbqTZlEnM+NHutFqFeHFcCFw2LbY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
        s=susede2_ed25519; t=1626338197;
        h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=2PWjr+0c7psZzyw1qFaM/XPj81wb2xNcBw94sKXKDHs=;
        b=x3B01zgznpgM2ZmkjseydG7jP09ccXKdOIA12Lc4ru8QZ5AWFg6KZ8i6DqXk46LbHRzVRE
        noZ2UjFTeWpBlnAQ==
Received: from imap1.suse-dmz.suse.de (imap1.suse-dmz.suse.de [192.168.254.73])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
        (No client certificate requested)
        by imap1.suse-dmz.suse.de (Postfix) with ESMTPS id 3C3BE13AB1;
        Thu, 15 Jul 2021 08:36:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
        by imap1.suse-dmz.suse.de with ESMTPSA
        id TEODDJXz72BKcwAAGKfGzw
        (envelope-from <ykaukab@suse.de>); Thu, 15 Jul 2021 08:36:37 +0000
Date:   Thu, 15 Jul 2021 10:36:35 +0200
From:   Mian Yousaf Kaukab <ykaukab@suse.de>
To:     Kuppuswamy Sathyanarayanan 
        <sathyanarayanan.kuppuswamy@linux.intel.com>
Cc:     Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Peter Zijlstra <peterz@infradead.org>,
        Andy Lutomirski <luto@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        Mark Gross <mgross@linux.intel.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        Andrii Nakryiko <andrii@kernel.org>,
        Peter H Anvin <hpa@zytor.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Tony Luck <tony.luck@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Andi Kleen <ak@linux.intel.com>,
        Kirill Shutemov <kirill.shutemov@linux.intel.com>,
        Sean Christopherson <seanjc@google.com>,
        Kuppuswamy Sathyanarayanan <knsathya@kernel.org>,
        x86@kernel.org, linux-kernel@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, bpf@vger.kernel.org,
        netdev@vger.kernel.org
Subject: Re: [PATCH v2 6/6] tools/tdx: Add a sample attestation user app
Message-ID: <20210715083635.GA112769@suse.de>
References: <20210707204249.3046665-1-sathyanarayanan.kuppuswamy@linux.intel.com>
 <20210707204249.3046665-7-sathyanarayanan.kuppuswamy@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20210707204249.3046665-7-sathyanarayanan.kuppuswamy@linux.intel.com>
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Wed, Jul 07, 2021 at 01:42:49PM -0700, Kuppuswamy Sathyanarayanan wrote:
> This application uses the misc device /dev/tdx-attest to get TDREPORT
> from the TDX Module or request quote from the VMM.
> 
> It tests following attestation features:
> 
>   - Get report using TDX_CMD_GET_TDREPORT IOCTL.
>   - Using report data request quote from VMM using TDX_CMD_GEN_QUOTE IOCTL.
>   - Get the quote size using TDX_CMD_GET_QUOTE_SIZE IOCTL.
> 
> Reviewed-by: Tony Luck <tony.luck@intel.com>
> Reviewed-by: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> ---
>  tools/Makefile                     |  13 +-
>  tools/tdx/Makefile                 |  19 +++
>  tools/tdx/attest/.gitignore        |   2 +
>  tools/tdx/attest/Makefile          |  24 +++
>  tools/tdx/attest/tdx-attest-test.c | 232 +++++++++++++++++++++++++++++
>  5 files changed, 284 insertions(+), 6 deletions(-)
>  create mode 100644 tools/tdx/Makefile
>  create mode 100644 tools/tdx/attest/.gitignore
>  create mode 100644 tools/tdx/attest/Makefile
>  create mode 100644 tools/tdx/attest/tdx-attest-test.c
> 
> diff --git a/tools/Makefile b/tools/Makefile
> index 7e9d34ddd74c..5d68084511cb 100644
> --- a/tools/Makefile
> +++ b/tools/Makefile
> @@ -30,6 +30,7 @@ help:
>  	@echo '  selftests              - various kernel selftests'
>  	@echo '  bootconfig             - boot config tool'
>  	@echo '  spi                    - spi tools'
> +	@echo '  tdx                    - TDX related test tools'
>  	@echo '  tmon                   - thermal monitoring and tuning tool'
>  	@echo '  tracing                - misc tracing tools'
>  	@echo '  turbostat              - Intel CPU idle stats and freq reporting tool'
> @@ -65,7 +66,7 @@ acpi: FORCE
>  cpupower: FORCE
>  	$(call descend,power/$@)
>  
> -cgroup firewire hv guest bootconfig spi usb virtio vm bpf iio gpio objtool leds wmi pci firmware debugging tracing: FORCE
> +cgroup firewire hv guest bootconfig spi usb virtio vm bpf iio gpio objtool leds wmi pci firmware debugging tracing tdx: FORCE
>  	$(call descend,$@)
>  
>  bpf/%: FORCE
> @@ -104,7 +105,7 @@ all: acpi cgroup cpupower gpio hv firewire liblockdep \
>  		perf selftests bootconfig spi turbostat usb \
>  		virtio vm bpf x86_energy_perf_policy \
>  		tmon freefall iio objtool kvm_stat wmi \
> -		pci debugging tracing
> +		pci debugging tracing tdx
>  
>  acpi_install:
>  	$(call descend,power/$(@:_install=),install)
> @@ -112,7 +113,7 @@ acpi_install:
>  cpupower_install:
>  	$(call descend,power/$(@:_install=),install)
>  
> -cgroup_install firewire_install gpio_install hv_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install vm_install bpf_install objtool_install wmi_install pci_install debugging_install tracing_install:
> +cgroup_install firewire_install gpio_install hv_install iio_install perf_install bootconfig_install spi_install usb_install virtio_install vm_install bpf_install objtool_install wmi_install pci_install debugging_install tracing_install tdx_install:
>  	$(call descend,$(@:_install=),install)
>  
>  liblockdep_install:
> @@ -139,7 +140,7 @@ install: acpi_install cgroup_install cpupower_install gpio_install \
>  		virtio_install vm_install bpf_install x86_energy_perf_policy_install \
>  		tmon_install freefall_install objtool_install kvm_stat_install \
>  		wmi_install pci_install debugging_install intel-speed-select_install \
> -		tracing_install
> +		tracing_install tdx_install
>  
>  acpi_clean:
>  	$(call descend,power/acpi,clean)
> @@ -147,7 +148,7 @@ acpi_clean:
>  cpupower_clean:
>  	$(call descend,power/cpupower,clean)
>  
> -cgroup_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean vm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean pci_clean firmware_clean debugging_clean tracing_clean:
> +cgroup_clean hv_clean firewire_clean bootconfig_clean spi_clean usb_clean virtio_clean vm_clean wmi_clean bpf_clean iio_clean gpio_clean objtool_clean leds_clean pci_clean firmware_clean debugging_clean tracing_clean tdx_clean:
>  	$(call descend,$(@:_clean=),clean)
>  
>  liblockdep_clean:
> @@ -186,6 +187,6 @@ clean: acpi_clean cgroup_clean cpupower_clean hv_clean firewire_clean \
>  		vm_clean bpf_clean iio_clean x86_energy_perf_policy_clean tmon_clean \
>  		freefall_clean build_clean libbpf_clean libsubcmd_clean liblockdep_clean \
>  		gpio_clean objtool_clean leds_clean wmi_clean pci_clean firmware_clean debugging_clean \
> -		intel-speed-select_clean tracing_clean
> +		intel-speed-select_clean tracing_clean tdx_clean
>  
>  .PHONY: FORCE
> diff --git a/tools/tdx/Makefile b/tools/tdx/Makefile
> new file mode 100644
> index 000000000000..e2564557d463
> --- /dev/null
> +++ b/tools/tdx/Makefile
> @@ -0,0 +1,19 @@
> +# SPDX-License-Identifier: GPL-2.0
> +include ../scripts/Makefile.include
> +
> +all: attest
> +
> +clean: attest_clean
> +
> +install: attest_install
> +
> +attest:
> +	$(call descend,attest)
> +
> +attest_install:
> +	$(call descend,attest,install)
> +
> +attest_clean:
> +	$(call descend,attest,clean)
> +
> +.PHONY: all install clean attest latency_install latency_clean
> diff --git a/tools/tdx/attest/.gitignore b/tools/tdx/attest/.gitignore
> new file mode 100644
> index 000000000000..5f819a8a6c49
> --- /dev/null
> +++ b/tools/tdx/attest/.gitignore
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +tdx-attest-test
> diff --git a/tools/tdx/attest/Makefile b/tools/tdx/attest/Makefile
> new file mode 100644
> index 000000000000..bf47ba718386
> --- /dev/null
> +++ b/tools/tdx/attest/Makefile
> @@ -0,0 +1,24 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Makefile for vm tools
> +#
> +VAR_CFLAGS := $(shell pkg-config --cflags libtracefs 2>/dev/null)
> +VAR_LDLIBS := $(shell pkg-config --libs libtracefs 2>/dev/null)
> +
> +TARGETS = tdx-attest-test
> +CFLAGS = -static -Wall -Wextra -g -O2 $(VAR_CFLAGS)
> +LDFLAGS = -lpthread $(VAR_LDLIBS)
> +
> +all: $(TARGETS)
> +
> +%: %.c
> +	$(CC) $(CFLAGS) -o $@ $< $(LDFLAGS)
> +
> +clean:
> +	$(RM) tdx-attest-test
> +
> +prefix ?= /usr/local
> +sbindir ?= ${prefix}/sbin
> +
> +install: all
> +	install -d $(DESTDIR)$(sbindir)
> +	install -m 755 -p $(TARGETS) $(DESTDIR)$(sbindir)
> diff --git a/tools/tdx/attest/tdx-attest-test.c b/tools/tdx/attest/tdx-attest-test.c
> new file mode 100644
> index 000000000000..7634ec6a084c
> --- /dev/null
> +++ b/tools/tdx/attest/tdx-attest-test.c
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * tdx-attest-test.c - utility to test TDX attestation feature.
> + *
> + * Copyright (C) 2020 - 2021 Intel Corporation. All rights reserved.
> + *
> + * Author: Kuppuswamy Sathyanarayanan <sathyanarayanan.kuppuswamy@linux.intel.com>
> + *
> + */
> +
> +#include <linux/types.h>
> +#include <linux/ioctl.h>
> +#include <sys/ioctl.h>
> +#include <sys/stat.h>
> +#include <sys/types.h>
> +#include <stdio.h>
> +#include <ctype.h>
> +#include <errno.h>
> +#include <fcntl.h>
> +#include <stdio.h>
> +#include <stdlib.h>
> +#include <unistd.h>
> +#include <string.h>
> +#include <limits.h>
> +#include <stdbool.h>
> +#include <getopt.h>
> +#include <stdint.h> /* uintmax_t */
> +#include <sys/mman.h>
> +#include <unistd.h> /* sysconf */
> +#include <time.h>
> +
> +#include "../../../include/uapi/misc/tdx.h"
> +
> +#define devname		"/dev/tdx-attest"
> +
> +#define HEX_DUMP_SIZE	16
> +#define MAX_ROW_SIZE	70
> +
> +#define ATTESTATION_TEST_BIN_VERSION "0.1"
> +
> +struct tdx_attest_args {
> +	bool is_dump_data;
> +	bool is_get_tdreport;
> +	bool is_get_quote_size;
> +	bool is_gen_quote;
> +	bool debug_mode;
> +	char *out_file;
> +};
> +
> +static void print_hex_dump(const char *title, const char *prefix_str,
> +			   const void *buf, int len)
> +{
> +	const __u8 *ptr = buf;
> +	int i, rowsize = HEX_DUMP_SIZE;
> +
> +	if (!len || !buf)
> +		return;
> +
> +	printf("\t\t%s", title);
> +
> +	for (i = 0; i < len; i++) {
> +		if (!(i % rowsize))
> +			printf("\n%s%.8x:", prefix_str, i);
> +		printf(" %.2x", ptr[i])
> +	}
> +
> +	printf("\n");
> +}
> +
> +static void gen_report_data(__u8 *report_data, bool dump_data)
> +{
> +	int i;
> +
> +	srand(time(NULL));
> +
> +	for (i = 0; i < TDX_REPORT_DATA_LEN; i++)
> +		report_data[i] = rand();
> +
> +	if (dump_data)
> +		print_hex_dump("\n\t\tTDX report data\n", " ",
> +			       report_data, TDX_REPORT_DATA_LEN);
> +}
> +
> +static int get_tdreport(int devfd, bool dump_data, __u8 *report_data)
> +{
> +	__u8 tdrdata[TDX_TDREPORT_LEN] = {0};
> +	int ret;
> +
> +	if (!report_data)
> +		report_data = tdrdata;
> +
> +	gen_report_data(report_data, dump_data);
> +
> +	ret = ioctl(devfd, TDX_CMD_GET_TDREPORT, report_data);
> +	if (ret) {
> +		printf("TDX_CMD_GET_TDREPORT ioctl() %d failed\n", ret);
> +		return -EIO;
> +	}
> +
> +	if (dump_data)
> +		print_hex_dump("\n\t\tTDX tdreport data\n", " ", report_data,
> +			       TDX_TDREPORT_LEN);
> +
> +	return 0;
> +}
> +
> +static __u64 get_quote_size(int devfd)
> +{
> +	int ret;
> +	__u64 quote_size;
> +
> +	ret = ioctl(devfd, TDX_CMD_GET_QUOTE_SIZE, &quote_size);
> +	if (ret) {
> +		printf("TDX_CMD_GET_QUOTE_SIZE ioctl() %d failed\n", ret);
> +		return -EIO;
> +	}
> +
> +	printf("Quote size: %lld\n", quote_size);
> +
> +	return quote_size;
> +}
> +
> +static int gen_quote(int devfd, bool dump_data)
> +{
> +	__u8 *quote_data;
> +	__u64 quote_size;
> +	int ret;
> +
> +	quote_size = get_quote_size(devfd);
> +
> +	quote_data = malloc(sizeof(char) * quote_size);
> +	if (!quote_data) {
> +		printf("%s queue data alloc failed\n", devname);
> +		return -ENOMEM;
> +	}
> +
> +	ret = get_tdreport(devfd, dump_data, quote_data);
In tdg_attest_ioctl() TDX_CMD_GEN_QUOTE case is calling
tdx_mcall_tdreport() same as TDX_CMD_GET_TDREPORT case. Then what is
the point of calling get_tdreport() here? Do you mean to call
gen_report_data()?
> +	if (ret) {
> +		printf("TDX_CMD_GET_TDREPORT ioctl() %d failed\n", ret);
> +		goto done;
> +	}
> +
> +	ret = ioctl(devfd, TDX_CMD_GEN_QUOTE, quote_data);
> +	if (ret) {
> +		printf("TDX_CMD_GEN_QUOTE ioctl() %d failed\n", ret);
> +		goto done;
> +	}
> +
> +	print_hex_dump("\n\t\tTDX Quote MMIO data\n", " ", quote_data,
> +		       quote_size);
> +
> +done:
> +	free(quote_data);
> +
> +	return ret;
> +}
> +
> +static void usage(void)
> +{
> +	puts("\nUsage:\n");
> +	puts("tdx_attest [options] \n");
> +
> +	puts("Attestation device test utility.");
> +
> +	puts("\nOptions:\n");
> +	puts(" -d, --dump                Dump tdreport/tdquote data");
> +	puts(" -r, --get-tdreport        Get TDREPORT data");
> +	puts(" -g, --gen-quote           Generate TDQUOTE");
> +	puts(" -s, --get-quote-size      Get TDQUOTE size");
> +}
> +
> +int main(int argc, char **argv)
> +{
> +	int ret, devfd;
> +	struct tdx_attest_args args = {0};
> +
> +	static const struct option longopts[] = {
> +		{ "dump",           no_argument,       NULL, 'd' },
> +		{ "get-tdreport",   required_argument, NULL, 'r' },
> +		{ "gen-quote",      required_argument, NULL, 'g' },
> +		{ "gen-quote-size", required_argument, NULL, 's' },
> +		{ "version",        no_argument,       NULL, 'V' },
> +		{ NULL,             0, NULL, 0 }
> +	};
> +
> +	while ((ret = getopt_long(argc, argv, "hdrgsV", longopts,
> +				  NULL)) != -1) {
> +		switch (ret) {
> +		case 'd':
> +			args.is_dump_data = true;
> +			break;
> +		case 'r':
> +			args.is_get_tdreport = true;
> +			break;
> +		case 'g':
> +			args.is_gen_quote = true;
> +			break;
> +		case 's':
> +			args.is_get_quote_size = true;
> +			break;
> +		case 'h':
> +			usage();
> +			return 0;
> +		case 'V':
> +			printf("Version: %s\n", ATTESTATION_TEST_BIN_VERSION);
> +			return 0;
> +		default:
> +			printf("Invalid options\n");
> +			usage();
> +			return -EINVAL;
> +		}
> +	}
> +
> +	devfd = open(devname, O_RDWR | O_SYNC);
> +	if (devfd < 0) {
> +		printf("%s open() failed\n", devname);
> +		return -ENODEV;
> +	}
> +
> +	if (args.is_get_quote_size)
> +		get_quote_size(devfd);
> +
> +	if (args.is_get_tdreport)
> +		get_tdreport(devfd, args.is_dump_data, NULL);
> +
> +	if (args.is_gen_quote)
> +		gen_quote(devfd, args.is_dump_data);
> +
> +	close(devfd);
> +
> +	return 0;
> +}
> -- 
> 2.25.1

BR,
Yousaf
