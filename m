Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 943B9200A3C
	for <lists+platform-driver-x86@lfdr.de>; Fri, 19 Jun 2020 15:33:57 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732809AbgFSNdw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 19 Jun 2020 09:33:52 -0400
Received: from mail-qt1-f180.google.com ([209.85.160.180]:33173 "EHLO
        mail-qt1-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732786AbgFSNdu (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 19 Jun 2020 09:33:50 -0400
Received: by mail-qt1-f180.google.com with SMTP id h23so23916qtr.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 19 Jun 2020 06:33:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=kjd2Zi3BnxwELLz5rAvbh4Awz0PeV2wQhaYfRzShywQ=;
        b=GyfiO4T87UeL1t081EgV80UTRyjr5QBaaCs26/sELOD9ofOxMmMTsZWaKsKQGYPkN7
         /GO+aEgA7PT1/B8cCMVM/xCzvaoUHniWlFjmNbrsCGv4N48xL/PlNKlj8RjPfRA7oBsL
         /k+zEgWZKN95MWAt60pdrf+ouEQrgMI6RiA6p5ZQmqTMRwkraZgTaAK0y5nt8GQEdcNC
         XlxjYRuCXl9H/58pvpp9YaWqhMTL2tqn/mlb+slgTo9glkGiDIB/xYxmYg9BG+aOPQLf
         riKX8zRQFMWSptJ3Z3RIdf7cOpO0SUZVSC1K1B8YonDw+3T1+JhLQqsTBv/hBkOMouzB
         CoGg==
X-Gm-Message-State: AOAM530EwKr/lO12TSrbImRuIyXosr2otd9iVI2JyU1n/AKp8s3JoPW5
        yo173YFKqWSGoOqgYR8ZAG2hgW4rFcwdphhmY4ZwpvqFoc8=
X-Google-Smtp-Source: ABdhPJz1GoXY651WHyw3g+uYfwInmhX9X5f+G8FH7HYyylOmwmBjdBWK8xZW3ZFVyzBMr79RmLw0Q41fIdREqu3VqzA=
X-Received: by 2002:ac8:548b:: with SMTP id h11mr3523961qtq.66.1592573628936;
 Fri, 19 Jun 2020 06:33:48 -0700 (PDT)
MIME-Version: 1.0
From:   Nick Shipp <ns@segbrk.com>
Date:   Fri, 19 Jun 2020 09:33:39 -0400
Message-ID: <CADjEuPv=C77iLAF-w4e+wXMwLwtNC12RHN3HN6xtb2jwW19Lfw@mail.gmail.com>
Subject: system76-acpi: system76_set schedules while atomic
To:     jeremy@system76.com
Cc:     productdev@system76.com, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

system76_set() is apparently called while atomic, and
acpi_evaluate_object() eventually schedule()s. This happens several
times at startup, and I can reliably trigger it with the Airplane Mode
key on my Lemur Pro (lemp9). I opened a System76 ticket for a
possibly-related lockup (#47303 in their system), but this looks like
a standalone driver bug at least. This log is from the vanilla Arch
Linux kernel 5.7.2-arch1. I get the same bug in 5.7.4 as well.

Trace:
Jun 18 09:08:23 disorder kernel: BUG: scheduling while atomic:
kworker/7:1/234/0x00000002
Jun 18 09:08:23 disorder kernel: Modules linked in: btusb(+) btrtl
mousedev btbcm snd_compress btintel ghash_clmulni_intel(+) mac80211
acpi_cpufreq(-) pcc_cpufreq(-) ac97_bus bluetooth snd_pcm_dmaengine
uvcvideo snd_hda_intel snd_intel_dspcfg i2c_algo_bit iTCO_wdt snd_hda>
Jun 18 09:08:23 disorder kernel: intel_hid system76_acpi battery
sparse_keymap ac coreboot_table drm agpgart ip_tables x_tables f2fs
serio_raw atkbd libps2 rtsx_pci_sdmmc xhci_pci mmc_core xhci_hcd
crc32_pclmul rtsx_pci i8042 serio
Jun 18 09:08:23 disorder kernel: Preemption disabled at:
Jun 18 09:08:23 disorder kernel: [] 0x0
Jun 18 09:08:23 disorder kernel: CPU: 7 PID: 234 Comm: kworker/7:1 Not
tainted 5.7.2-arch1-1 #1
Jun 18 09:08:23 disorder kernel: Hardware name: System76 Lemur
Pro/Lemur Pro, BIOS 2020-05-15_e2baafa 05/15/2020
Jun 18 09:08:23 disorder kernel: Workqueue: events
rfkill_global_led_trigger_worker [rfkill]
Jun 18 09:08:23 disorder kernel: Call Trace:
Jun 18 09:08:23 disorder kernel: dump_stack+0x64/0x88
Jun 18 09:08:23 disorder kernel: __schedule_bug.cold+0x8e/0x9b
Jun 18 09:08:23 disorder kernel: __schedule+0x6a6/0x8c0
Jun 18 09:08:23 disorder kernel: schedule+0x46/0xf0
Jun 18 09:08:23 disorder kernel: schedule_timeout+0x99/0x170
Jun 18 09:08:23 disorder kernel: ? __next_timer_interrupt+0xd0/0xd0
Jun 18 09:08:23 disorder kernel: ec_guard+0x209/0x240
Jun 18 09:08:23 disorder kernel: ? wait_woken+0x80/0x80
Jun 18 09:08:23 disorder kernel: acpi_ec_transaction+0x195/0x440
Jun 18 09:08:23 disorder kernel: acpi_ec_space_handler+0x137/0x280
Jun 18 09:08:23 disorder kernel: ? _raw_spin_unlock_irqrestore+0x20/0x40
Jun 18 09:08:23 disorder kernel: ? acpi_ec_resume+0x20/0x20
Jun 18 09:08:23 disorder kernel: acpi_ev_address_space_dispatch+0x2f2/0x39a
Jun 18 09:08:23 disorder kernel: acpi_ex_access_region+0x44a/0x4e5
Jun 18 09:08:23 disorder kernel: ? acpi_ns_get_type+0x8c/0x91
Jun 18 09:08:23 disorder kernel: acpi_ex_field_datum_io+0x190/0x434
Jun 18 09:08:23 disorder kernel: acpi_ex_extract_from_field+0xea/0x32a
Jun 18 09:08:23 disorder kernel: ? _raw_spin_unlock_irqrestore+0x20/0x40
Jun 18 09:08:23 disorder kernel: acpi_ex_read_data_from_field+0x305/0x351
Jun 18 09:08:23 disorder kernel: acpi_ex_resolve_node_to_value+0x39c/0x4cf
Jun 18 09:08:23 disorder kernel: acpi_ex_resolve_to_value+0x3ba/0x468
Jun 18 09:08:23 disorder kernel: acpi_ds_evaluate_name_path+0xb5/0x16e
Jun 18 09:08:23 disorder kernel: ? acpi_ut_trace_ptr+0x25/0x66
Jun 18 09:08:23 disorder kernel: acpi_ds_exec_end_op+0xcc/0x6ff
Jun 18 09:08:23 disorder kernel: acpi_ps_parse_loop+0x7f4/0x8c5
Jun 18 09:08:23 disorder kernel: acpi_ps_parse_aml+0x1aa/0x545
Jun 18 09:08:23 disorder kernel: acpi_ps_execute_method+0x203/0x2bf
Jun 18 09:08:23 disorder kernel: acpi_ns_evaluate+0x34a/0x4e7
Jun 18 09:08:23 disorder kernel: acpi_evaluate_object+0x184/0x3ac
Jun 18 09:08:23 disorder kernel: ? rescuer_thread+0x3f0/0x3f0
Jun 18 09:08:23 disorder kernel: ap_led_set+0x6f/0x90 [system76_acpi]
Jun 18 09:08:23 disorder kernel: led_trigger_event+0x41/0x70
Jun 18 09:08:23 disorder kernel: process_one_work+0x1da/0x3d0
Jun 18 09:08:23 disorder kernel: ? rescuer_thread+0x3f0/0x3f0
Jun 18 09:08:23 disorder kernel: worker_thread+0x4d/0x3e0
Jun 18 09:08:23 disorder kernel: ? rescuer_thread+0x3f0/0x3f0
Jun 18 09:08:23 disorder kernel: kthread+0x13e/0x160
Jun 18 09:08:23 disorder kernel: ? __kthread_bind_mask+0x60/0x60
Jun 18 09:08:23 disorder kernel: ret_from_fork+0x1f/0x40
