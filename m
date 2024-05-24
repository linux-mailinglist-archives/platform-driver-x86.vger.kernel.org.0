Return-Path: <platform-driver-x86+bounces-3453-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id EE8A18CE07D
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2024 06:54:25 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 47C561F224E9
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 May 2024 04:54:25 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6F0C383AB;
	Fri, 24 May 2024 04:54:21 +0000 (UTC)
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from mx3.molgen.mpg.de (mx3.molgen.mpg.de [141.14.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC063D549
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 May 2024 04:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.14.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716526461; cv=none; b=dcOjqsCMRHy33PsFUCcZV4cUIqr8R8phWU1/XhqgRTOEKCYT6PdoAujpDw4DwpVf6tOMCKZXDCcN/SgvJ/YmUnpxK4dziCVArDa2KE3LOxe7rRSPBYcgKyHWw/dWpJ9Nbm1tsgM+tHjNlBTJiwuyTXIRWHRshV6F9JlmvX4gskg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716526461; c=relaxed/simple;
	bh=khkWtUSic60cJO/Q5LgpXQYF6z2vlLTh3eCTffdahDY=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=uhszldTQqVa8qHcTaS8z2TOvNUKH1GELKlxaKvHK2c9WtZwt3sfPYe0Gpq3PDNLzgMLnZS7G6iv6rkAyQcV1E84XLUwmkbxl0+ad2zYZ/NfTp1nxHQrQop/xxINGub3RfdU0kt22c44YyPU9jw4hbbIFl9md43vvW9ugO/zpsmo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de; spf=pass smtp.mailfrom=molgen.mpg.de; arc=none smtp.client-ip=141.14.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=molgen.mpg.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=molgen.mpg.de
Received: from [192.168.0.3] (unknown [95.90.244.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pmenzel)
	by mx.molgen.mpg.de (Postfix) with ESMTPSA id 3C51E61E5FE06;
	Fri, 24 May 2024 06:53:40 +0200 (CEST)
Content-Type: multipart/mixed; boundary="------------Fvdcc0O2v8CuVIL04VNv52N6"
Message-ID: <36a91aa1-84e3-4ad5-8384-1bd999c15675@molgen.mpg.de>
Date: Fri, 24 May 2024 06:53:39 +0200
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Dell XPS 13 9360: `slp_s0_residency_usec` stays 0
To: Mario Limonciello <mario.limonciello@amd.com>,
 Rajneesh Bhardwaj <irenic.rajneesh@gmail.com>,
 David E Box <david.e.box@intel.com>
Cc: Hans de Goede <hdegoede@redhat.com>,
 =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
 platform-driver-x86@vger.kernel.org
References: <38fc334a-7c8c-4e43-bf63-6ac9aa882a2f@molgen.mpg.de>
 <c73a9072-27eb-4d42-b74a-52619a81837e@molgen.mpg.de>
 <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>
Content-Language: en-US
From: Paul Menzel <pmenzel@molgen.mpg.de>
In-Reply-To: <81e937f0-df95-4e07-8d0f-3e20fce8481f@amd.com>

This is a multi-part message in MIME format.
--------------Fvdcc0O2v8CuVIL04VNv52N6
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Dear Mario, dear Linux folks,


Am 22.05.24 um 18:37 schrieb Mario Limonciello:
> On 5/22/2024 10:52, Paul Menzel wrote:

>> On the Intel Kaby Lake laptop Dell XPS 13 9360, 
>> `/sys/kernel/debug/pmc_core/slp_s0_residency_usec` does stay 0 even 
>> after a s2idle suspend/resume cycle.
> 
> It won't change your numbers but FWIW you can also read from
> 
> $ cat /sys/power/suspend_stats/last_hw_sleep
> 
> which is also accessible under kernel lockdown.
> 
>>
>>      $ sudo dmesg
>>      […]
>>      [    0.000000] DMI: Dell Inc. XPS 13 9360/0596KF, BIOS 2.21.0 06/02/2022
>>      […]
>>      [10176.745124] PM: suspend entry (s2idle)
>>      [10176.757275] Filesystems sync: 0.012 seconds
>>      [10176.769118] Freezing user space processes
>>      [10176.771693] Freezing user space processes completed (elapsed 0.002 seconds)
>>      [10176.771710] OOM killer disabled.
>>      [10176.771714] Freezing remaining freezable tasks
>>      [10176.773487] Freezing remaining freezable tasks completed (elapsed 0.001 seconds)
>>      [10176.773504] printk: Suspending console(s) (use no_console_suspend to debug)
>>      [10176.948337] ACPI: EC: interrupt blocked
>>      [10176.951016] intel_pch_thermal 0000:00:14.2: CPU-PCH is cool [48C]
>>      [10181.281827] ACPI: EC: interrupt unblocked
>>      $ sudo more /sys/kernel/debug/pmc_core/slp_s0_residency_usec
>>      0
>>
>> Is that expected?
> 
> Is it a regression?  If so; probably it's worth bisecting.

Sorry, I do not know. It’s the first time [1] I heard about this file, 
and that fwts [2] checks it. Do you remember, if Dell has any public 
logs from testing, containing `slp_s0_residency_usec`?

> If it's not a regression IIUC you should probably run 
> https://github.com/intel/S0ixSelftestTool for assistance in next steps 
> on debugging why this is happening.

Thank you for the pointer. Please find the log file from `sudo 
./s0ix-selftest-tool.sh -s` attached. Some PCIe ports are flagged.


Kind regards,

Paul


[1]: 
https://review.coreboot.org/c/coreboot/+/81595/10/src/mainboard/cwwk/adl/Kconfig#9
[2]: https://wiki.ubuntu.com/FirmwareTestSuite/


>> PS: Some system details:
>>
>> ```
>> $ LANG= lspci -nn
>> 00:00.0 Host bridge [0600]: Intel Corporation Xeon E3-1200 v6/7th Gen Core Processor Host Bridge/DRAM Registers [8086:5904] (rev 02)
>> 00:02.0 VGA compatible controller [0300]: Intel Corporation HD Graphics 620 [8086:5916] (rev 02)
>> 00:04.0 Signal processing controller [1180]: Intel Corporation Xeon E3-1200 v5/E3-1500 v5/6th Gen Core Processor Thermal Subsystem [8086:1903] (rev 02)
>> 00:14.0 USB controller [0c03]: Intel Corporation Sunrise Point-LP USB 3.0 xHCI Controller [8086:9d2f] (rev 21)

[…]
--------------Fvdcc0O2v8CuVIL04VNv52N6
Content-Type: text/x-log; charset=UTF-8; name="20240524-05-55-s0ix-output.log"
Content-Disposition: attachment; filename="20240524-05-55-s0ix-output.log"
Content-Transfer-Encoding: base64

Ci0tLUNoZWNrIFMyaWRsZSBwYXRoIFMwaXggUmVzaWRlbmN5LS0tOgoKVGhlIHN5c3RlbSBP
UyBLZXJuZWwgdmVyc2lvbiBpczoKTGludXggYWJyZXUgNi45LjAtMTIxMjQtZzZkNjliNmMx
MmZjZSAjMTYwIFNNUCBQUkVFTVBUX0RZTkFNSUMgRnJpIE1heSAyNCAwNTo1MDoyNSBDRVNU
IDIwMjQgeDg2XzY0IEdOVS9MaW51eAoKLS0tQ2hlY2sgd2hldGhlciB5b3VyIHN5c3RlbSBz
dXBwb3J0cyBTMGl4IG9yIG5vdC0tLToKCkxvdyBQb3dlciBTMCBJZGxlIGlzOjEKWW91ciBz
eXN0ZW0gc3VwcG9ydHMgbG93IHBvd2VyIFMwIGlkbGUgY2FwYWJpbGl0eS4KCgoKLS0tQ2hl
Y2sgd2hldGhlciBpbnRlbF9wbWNfY29yZSBzeXNmcyBmaWxlcyBleGl0LS0tOgoKVGhlIHBt
Y19jb3JlIGRlYnVnIHN5c2ZzIGZpbGVzIGFyZSBPSyBvbiB5b3VyIHN5c3RlbS4KCgoKLS0t
SnVkZ2UgUEMxMCwgUzBpeCByZXNpZGVuY3kgYXZhaWxhYmxlIHN0YXR1cy0tLToKVGVzdCBz
eXN0ZW0gZG9lcyBub3Qgc3VwcG9ydCBTMGl4Lnkgc3Vic3RhdGUKClR1cmJvc3RhdCBvdXRw
dXQ6IAoxNC45NDg3MDcgc2VjCkNQVSVjMQlDUFUlYzYJQ1BVJWM3CUdGWCVyYzYJUGtnJXBj
MglQa2clcGMzCVBrZyVwYzYJUGtnJXBjNwlQa2clcGM4CVBrZyVwYzkJUGslcGMxMAlTWVMl
TFBJCjIuNjgJMC42NAk5My4xOAk0MzguODMJMS42OQkwLjc5CTAuMjIJMC4wMQk4OS4zNQkw
LjAwCTAuMDAJMC4wMAozLjQ5CTAuNTMJOTMuNjQJNDM4Ljg4CTEuNjkJMC43OQkwLjIyCTAu
MDEJODkuMzYJMC4wMAkwLjAwCTAuMDAKMS41NwozLjQ5CTAuNzYJOTIuNzQKMi4xOQoKQ1BV
IENvcmUgQzcgcmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogOTMuMTgKR0ZYIFJDNiByZXNp
ZGVuY3kgYWZ0ZXIgUzJpZGxlIGlzOiA0MzguODMKQ1BVIFBhY2thZ2UgQy1zdGF0ZSAyIHJl
c2lkZW5jeSBhZnRlciBTMmlkbGUgaXM6IDEuNjkKQ1BVIFBhY2thZ2UgQy1zdGF0ZSAzIHJl
c2lkZW5jeSBhZnRlciBTMmlkbGUgaXM6IDAuNzkKQ1BVIFBhY2thZ2UgQy1zdGF0ZSA4IHJl
c2lkZW5jeSBhZnRlciBTMmlkbGUgaXM6IDg5LjM1CkNQVSBQYWNrYWdlIEMtc3RhdGUgOSBy
ZXNpZGVuY3kgYWZ0ZXIgUzJpZGxlIGlzOiAwLjAwCkNQVSBQYWNrYWdlIEMtc3RhdGUgMTAg
cmVzaWRlbmN5IGFmdGVyIFMyaWRsZSBpczogMC4wMApTMGl4IHJlc2lkZW5jeSBhZnRlciBT
MmlkbGUgaXM6IDAuMDAKCllvdXIgc3lzdGVtIGFjaGlldmVkIFBDOCByZXNpZGVuY3k6IDg5
LjM1LCBidXQgbm8gUEMxMCByZXNpZGVuY3k6MC4wMCxubyBTMGl4IHJlc2lkZW5jeTogMC4w
MAoKLS0tRGVidWcgbm8gREM5IHJlc2lkZW5jeSBzY2VuYXJpby0tLToKCkdGWCBEQzUgYmVm
b3JlIFMyaWRsZTogNTAKR0ZYIERDNiBiZWZvcmUgUzJpZGxlOiAwCgpUdXJib3N0YXQgb3V0
cHV0OiAKCjE1LjQ5MjA2NiBzZWMKQ1BVJWMxCUNQVSVjNglDUFUlYzcJR0ZYJXJjNglQa2cl
cGMyCVBrZyVwYzMJUGtnJXBjNglQa2clcGM3CVBrZyVwYzgJUGtnJXBjOQlQayVwYzEwCVNZ
UyVMUEkKMS4wOAkwLjUxCTk2LjU4CTU1NC43MgkxLjMyCTAuNjIJMC4xMwkwLjAwCTk0LjAw
CTAuMDAJMC4wMAkwLjAwCjAuODIJMC40Mgk5Ni44Mgk1NTQuNzEJMS4zMgkwLjYyCTAuMTMJ
MC4wMAk5NC4wMAkwLjAwCTAuMDAJMC4wMAoxLjEzCjEuNTIJMC42MAk5Ni4zMwowLjg0CgpH
RlggREM1IGFmdGVyIFMyaWRsZTogNTkKR0ZYIERDNiBhZnRlciBTMmlkbGU6IDAKCllvdXIg
c3lzdGVtIENQVSBNb2RlbCBJRCBpczogMTQyLCBhbmQgdGhlIGdyYXBoaWNzIERDNiB2YWx1
ZSBpcyBub3QgZXhwZWN0ZWQgdG8gZW50ZXIgREM5LCAgICAgICAKcGxlYXNlIGNoZWNrIHRo
ZSBsYXRlc3QgZGlzcGxheSBETUMgRlcgbG9hZCBzdGF0dXM6CgpZb3VyIHN5c3RlbSBJbnRl
bCBncmFwaGljcyBETUMgRlcgbG9hZGVkIHN0YXR1cyBpczp5ZXMKCgoKCi0tLURlYnVnIG5v
IFBDMTAgcmVzaWRlbmN5IHNjZW5hcmlvLS1JZ25vcmUgSVAgTFRSIHZhbHVlLS0tOgoKVHVy
Ym9zdGF0IG91dHB1dDogCjkuOTI0OTkyIHNlYwpDUFUlYzEJQ1BVJWM2CUNQVSVjNwlHRlgl
cmM2CVBrZyVwYzIJUGtnJXBjMwlQa2clcGM2CVBrZyVwYzcJUGtnJXBjOAlQa2clcGM5CVBr
JXBjMTAJU1lTJUxQSQoxLjUyCTAuNjUJOTQuOTQJMTAxNi4xMwkxLjY0CTIuODEJMC4wNAkw
LjAwCTg5LjkxCTAuMDAJMC4wMAkwLjAwCjEuNTQJMC42OQk5NC45MAkxMDE2LjEyCTEuNjQJ
Mi44MQkwLjA0CTAuMDAJODkuOTEJMC4wMAkwLjAwCTAuMDAKMS4xOQoxLjY5CTAuNjAJOTQu
OTcKMS42OAoKSVAgTFRSIE51bWJlcjogMTggICAKUGxlYXNlIGJlIHBhdGllbnQsIHN5c3Rl
bSB3aWxsIGRvIDE4IGN5Y2xlcyBTMmlkbGUgYmVsb3csIGNoZWNrIGlmIGlnbm9yaW5nICAg
CnRoZSBJUCBMVFIgdmFsdWUgaXMgaGVscGZ1bCB0byB0aGUgUEMxMCBhbmQgUzBpeCByZXNp
ZGVuY3kgb25lIGJ5IG9uZS4KCkxUUiBpZ25vcmUgZm9yIElQIDAKUEMxMCByZXNpZGVuY3kg
aXM6MC4wMApTMGl4IHJlc2lkZW5jeSBpczowLjAwCgpJUCBOdW1iZXIgMCBMVFIgaWdub3Jl
IGlzIG5vdCBoZWxwZnVsIHRvIHRoZSBQQzEwIGFuZCBTMGl4IHN0YXRlLgoKTFRSIGlnbm9y
ZSBmb3IgSVAgMQpQQzEwIHJlc2lkZW5jeSBpczowLjAwClMwaXggcmVzaWRlbmN5IGlzOjAu
MDAKCklQIE51bWJlciAxIExUUiBpZ25vcmUgaXMgbm90IGhlbHBmdWwgdG8gdGhlIFBDMTAg
YW5kIFMwaXggc3RhdGUuCgpMVFIgaWdub3JlIGZvciBJUCAyClBDMTAgcmVzaWRlbmN5IGlz
OjAuMDAKUzBpeCByZXNpZGVuY3kgaXM6MC4wMAoKSVAgTnVtYmVyIDIgTFRSIGlnbm9yZSBp
cyBub3QgaGVscGZ1bCB0byB0aGUgUEMxMCBhbmQgUzBpeCBzdGF0ZS4KCkxUUiBpZ25vcmUg
Zm9yIElQIDMKUEMxMCByZXNpZGVuY3kgaXM6MC4wMApTMGl4IHJlc2lkZW5jeSBpczowLjAw
CgpJUCBOdW1iZXIgMyBMVFIgaWdub3JlIGlzIG5vdCBoZWxwZnVsIHRvIHRoZSBQQzEwIGFu
ZCBTMGl4IHN0YXRlLgoKTFRSIGlnbm9yZSBmb3IgSVAgNApQQzEwIHJlc2lkZW5jeSBpczow
LjAwClMwaXggcmVzaWRlbmN5IGlzOjAuMDAKCklQIE51bWJlciA0IExUUiBpZ25vcmUgaXMg
bm90IGhlbHBmdWwgdG8gdGhlIFBDMTAgYW5kIFMwaXggc3RhdGUuCgpMVFIgaWdub3JlIGZv
ciBJUCA1ClBDMTAgcmVzaWRlbmN5IGlzOjAuMDAKUzBpeCByZXNpZGVuY3kgaXM6MC4wMAoK
SVAgTnVtYmVyIDUgTFRSIGlnbm9yZSBpcyBub3QgaGVscGZ1bCB0byB0aGUgUEMxMCBhbmQg
UzBpeCBzdGF0ZS4KCkxUUiBpZ25vcmUgZm9yIElQIDYKUEMxMCByZXNpZGVuY3kgaXM6MC4w
MApTMGl4IHJlc2lkZW5jeSBpczowLjAwCgpJUCBOdW1iZXIgNiBMVFIgaWdub3JlIGlzIG5v
dCBoZWxwZnVsIHRvIHRoZSBQQzEwIGFuZCBTMGl4IHN0YXRlLgoKTFRSIGlnbm9yZSBmb3Ig
SVAgNwpQQzEwIHJlc2lkZW5jeSBpczowLjAwClMwaXggcmVzaWRlbmN5IGlzOjAuMDAKCklQ
IE51bWJlciA3IExUUiBpZ25vcmUgaXMgbm90IGhlbHBmdWwgdG8gdGhlIFBDMTAgYW5kIFMw
aXggc3RhdGUuCgpMVFIgaWdub3JlIGZvciBJUCA4ClBDMTAgcmVzaWRlbmN5IGlzOjg4LjU1
ClMwaXggcmVzaWRlbmN5IGlzOjAuMDAKCk5vIFMwaXggcmVzaWRlbmN5LCBvbmx5IFBDMTAg
aXMgYXZhaWxhYmxlIGFmdGVyIElQIG51bWJlciA4IExUUiBpZ25vcmU6CgoKVGhpcyBzY3Jp
cHQgZGV0ZWN0cyBQQzEwIHJlc2lkZW5jeSBhZnRlciBJUCBMVFIgaWdub3JlLiAgICAgICAK
UGxlYXNlIGNvbnNpZGVyIHJlcG9ydGluZyBhIGJ1ZyBhZ2FpbnN0IHRoZSBwb3RlbnRpYWwg
SVAgTFRSIGlzc3VlIGlmIHRoZSB0ZXN0IHBsYXRmb3JtIGlzIHN0YWJsZS4gCk1lYW53aGls
ZSB0aGlzIHNjcmlwdCB3aWxsIGNvbnRpbnVlIHRvIGNoZWNrCnRoZSBwb3RlbnRpYWwgUzBp
eCBibG9ja2VyIHNpbmNlIFBDMTAgaXMgYXZhaWxhYmxlLgoKCllvdXIgc3lzdGVtIHNvdXRo
IHBvcnQgY29udHJvbGxlciBkaWQgbm90IG1lZXQgUzBpeCByZXF1aXJlbWVudDogG1szMW1T
UEEKU1BCClNQQxtbMG0KCi0tLURlYnVnIFMwaXggZmFpbHVyZSBzY2VuYXJpby0tU2V0dGlu
ZyBObyBBQ1BJIERTTSBDYWxsYmFjay0tLToKClNldHRpbmcgbm8gQUNQSSBEU00gY2FsbGJh
Y2sgaXMgbm90IGhlbHBmdWwgdG8gdGhlIFMwaXggcmVzaWRlbmN5LgoKLS0tRGVidWcgUENJ
ZXBvcnRzIEQgc3RhdGVzIGFuZCBsaW5rIFBNIHN0YXRlcy0tLQoKQ2hlY2tpbmcgUENJIERl
dmljZXMgRDMgU3RhdGVzOgpbICAyMjIuMDY0OTM3XSBudm1lIDAwMDA6M2I6MDAuMDogUENJ
IFBNOiBTdXNwZW5kIHBvd2VyIHN0YXRlOiBEMApbICAyMjIuMDY0OTQ5XSBudm1lIDAwMDA6
M2I6MDAuMDogUENJIFBNOiBTa2lwcGVkClsgIDIyMi4wNjc5NDddIGk4MDFfc21idXMgMDAw
MDowMDoxZi40OiBQQ0kgUE06IFN1c3BlbmQgcG93ZXIgc3RhdGU6IEQwClsgIDIyMi4wNjc5
NTVdIGk4MDFfc21idXMgMDAwMDowMDoxZi40OiBQQ0kgUE06IFNraXBwZWQKWyAgMjIyLjA3
MTQ2OF0gcGNpZXBvcnQgMDAwMDowMDoxZC4wOiBQQ0kgUE06IFN1c3BlbmQgcG93ZXIgc3Rh
dGU6IEQwClsgIDIyMi4wNzE0NzVdIHBjaWVwb3J0IDAwMDA6MDA6MWQuMDogUENJIFBNOiBT
a2lwcGVkClsgIDIyMi4wNzE2NThdIHBjaWVwb3J0IDAwMDA6MDA6MWMuMDogUENJIFBNOiBT
dXNwZW5kIHBvd2VyIHN0YXRlOiBEMApbICAyMjIuMDcxNjYzXSBwY2llcG9ydCAwMDAwOjAw
OjFjLjA6IFBDSSBQTTogU2tpcHBlZApbICAyMjIuMDczMTk4XSBzbmRfaGRhX2ludGVsIDAw
MDA6MDA6MWYuMzogUENJIFBNOiBTdXNwZW5kIHBvd2VyIHN0YXRlOiBEM2hvdApbICAyMjIu
MDczMjI1XSBpOTE1IDAwMDA6MDA6MDIuMDogUENJIFBNOiBTdXNwZW5kIHBvd2VyIHN0YXRl
OiBEM2hvdApbICAyMjIuMDgyMzkzXSBpbnRlbF9wY2hfdGhlcm1hbCAwMDAwOjAwOjE0LjI6
IFBDSSBQTTogU3VzcGVuZCBwb3dlciBzdGF0ZTogRDNob3QKWyAgMjIyLjA4MjQwMl0gYXRo
MTBrX3BjaSAwMDAwOjNhOjAwLjA6IFBDSSBQTTogU3VzcGVuZCBwb3dlciBzdGF0ZTogRDNo
b3QKWyAgMjIyLjA4Mjk2NV0gaW50ZWwtbHBzcyAwMDAwOjAwOjE1LjE6IFBDSSBQTTogU3Vz
cGVuZCBwb3dlciBzdGF0ZTogRDNob3QKWyAgMjIyLjA4Mzc0M10gbWVpX21lIDAwMDA6MDA6
MTYuMDogUENJIFBNOiBTdXNwZW5kIHBvd2VyIHN0YXRlOiBEM2hvdApbICAyMjIuMDg0MTY5
XSBwcm9jX3RoZXJtYWwgMDAwMDowMDowNC4wOiBQQ0kgUE06IFN1c3BlbmQgcG93ZXIgc3Rh
dGU6IEQzaG90ClsgIDIyMi4wOTQwNzVdIHBjaWVwb3J0IDAwMDA6MDA6MWMuNDogUENJIFBN
OiBTdXNwZW5kIHBvd2VyIHN0YXRlOiBEM2hvdApbICAyMjIuMTAyMjUxXSB4aGNpX2hjZCAw
MDAwOjAwOjE0LjA6IFBDSSBQTTogU3VzcGVuZCBwb3dlciBzdGF0ZTogRDNob3QKCgpDaGVj
a2luZyBQQ0kgRGV2aWNlcyB0cmVlIGRpYWdyYW06Ci1bMDAwMDowMF0tKy0wMC4wICBJbnRl
bCBDb3Jwb3JhdGlvbiBYZW9uIEUzLTEyMDAgdjYvN3RoIEdlbiBDb3JlIFByb2Nlc3NvciBI
b3N0IEJyaWRnZS9EUkFNIFJlZ2lzdGVycwogICAgICAgICAgICstMDIuMCAgSW50ZWwgQ29y
cG9yYXRpb24gSEQgR3JhcGhpY3MgNjIwCiAgICAgICAgICAgKy0wNC4wICBJbnRlbCBDb3Jw
b3JhdGlvbiBYZW9uIEUzLTEyMDAgdjUvRTMtMTUwMCB2NS82dGggR2VuIENvcmUgUHJvY2Vz
c29yIFRoZXJtYWwgU3Vic3lzdGVtCiAgICAgICAgICAgKy0xNC4wICBJbnRlbCBDb3Jwb3Jh
dGlvbiBTdW5yaXNlIFBvaW50LUxQIFVTQiAzLjAgeEhDSSBDb250cm9sbGVyCiAgICAgICAg
ICAgKy0xNC4yICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFRoZXJtYWwg
c3Vic3lzdGVtCiAgICAgICAgICAgKy0xNS4wICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNl
IFBvaW50LUxQIFNlcmlhbCBJTyBJMkMgQ29udHJvbGxlciAjMAogICAgICAgICAgICstMTUu
MSAgSW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBTZXJpYWwgSU8gSTJDIENv
bnRyb2xsZXIgIzEKICAgICAgICAgICArLTE2LjAgIEludGVsIENvcnBvcmF0aW9uIFN1bnJp
c2UgUG9pbnQtTFAgQ1NNRSBIRUNJICMxCiAgICAgICAgICAgKy0xYy4wLVswMS0zOV0tLQog
ICAgICAgICAgICstMWMuNC1bM2FdLS0tLTAwLjAgIFF1YWxjb21tIEF0aGVyb3MgUUNBNjE3
NCA4MDIuMTFhYyBXaXJlbGVzcyBOZXR3b3JrIEFkYXB0ZXIKICAgICAgICAgICArLTFkLjAt
WzNiXS0tLS0wMC4wICBTSyBoeW5peCBQQzMwMCBOVk1lIFNvbGlkIFN0YXRlIERyaXZlIDUx
MkdCCiAgICAgICAgICAgKy0xZi4wICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50
LUxQIExQQyBDb250cm9sbGVyCiAgICAgICAgICAgKy0xZi4yICBJbnRlbCBDb3Jwb3JhdGlv
biBTdW5yaXNlIFBvaW50LUxQIFBNQwogICAgICAgICAgICstMWYuMyAgSW50ZWwgQ29ycG9y
YXRpb24gU3VucmlzZSBQb2ludC1MUCBIRCBBdWRpbwogICAgICAgICAgIFwtMWYuNCAgSW50
ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBTTUJ1cwoKVGhlIHBjaWVwb3J0IDAw
MDA6MDA6MWQuMCBBU1BNIGVuYWJsZSBzdGF0dXM6CgkJTG5rQ3RsOglBU1BNIEwxIEVuYWJs
ZWQ7IFJDQiA2NCBieXRlcywgTG5rRGlzYWJsZS0gQ29tbUNsaysKClBjaWVwb3J0IGlzIG5v
dCBpbiBEM2NvbGTvvJogICAgICAgICAgChtbMzFtMDAwMDowMDoxZC4wG1swbQoKVGhlIHBj
aWVwb3J0IDAwMDA6MDA6MWMuMCBBU1BNIGVuYWJsZSBzdGF0dXM6CgoKUGNpZXBvcnQgaXMg
bm90IGluIEQzY29sZO+8miAgICAgICAgICAKG1szMW0wMDAwOjAwOjFjLjAbWzBtCgpQY2ll
cG9ydCBpcyBub3QgaW4gRDNjb2xkOiAgICAgChtbMzFtMDAwMDowMDoxYy40G1swbQoKClRo
ZSBQQ0llIGJyaWRnZSBsaW5rIHBvd2VyIG1hbmFnZW1lbnQgc3RhdGUgaXM6ChtbMzFtMDAw
MDowMDoxYy4wIExpbmsgaXMgUmV0cmFpbmluZxtbMG0KClRoZSBsaW5rIHBvd2VyIG1hbmFn
ZW1lbnQgc3RhdGUgb2YgUENJZSBicmlkZ2U6IBtbMzFtMDAwMDowMDoxYy4wG1swbSBpcyBu
b3QgZXhwZWN0ZWQuIAp3aGljaCBpcyBleHBlY3RlZCB0byBiZSBMMS4xIG9yIEwxLjIsIG9y
IHVzZXIgd291bGQgcnVuIHRoaXMgc2NyaXB0IGFnYWluLgoKClRoZSBMMVN1YkNhcCBvZiB0
aGUgZmFpbGVkIDAwMDA6MDA6MWMuMCBpczoKCgpUaGUgTDFTdWJDdGwxIG9mIHRoZSBmYWls
ZWQgMDAwMDowMDoxYy4wIGlzOgoKCgpDaGVja2luZyBQQ0kgRGV2aWNlcyB0cmVlIGRpYWdy
YW06Ci1bMDAwMDowMF0tKy0wMC4wICBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIEUzLTEyMDAg
djYvN3RoIEdlbiBDb3JlIFByb2Nlc3NvciBIb3N0IEJyaWRnZS9EUkFNIFJlZ2lzdGVycwog
ICAgICAgICAgICstMDIuMCAgSW50ZWwgQ29ycG9yYXRpb24gSEQgR3JhcGhpY3MgNjIwCiAg
ICAgICAgICAgKy0wNC4wICBJbnRlbCBDb3Jwb3JhdGlvbiBYZW9uIEUzLTEyMDAgdjUvRTMt
MTUwMCB2NS82dGggR2VuIENvcmUgUHJvY2Vzc29yIFRoZXJtYWwgU3Vic3lzdGVtCiAgICAg
ICAgICAgKy0xNC4wICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFVTQiAz
LjAgeEhDSSBDb250cm9sbGVyCiAgICAgICAgICAgKy0xNC4yICBJbnRlbCBDb3Jwb3JhdGlv
biBTdW5yaXNlIFBvaW50LUxQIFRoZXJtYWwgc3Vic3lzdGVtCiAgICAgICAgICAgKy0xNS4w
ICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFNlcmlhbCBJTyBJMkMgQ29u
dHJvbGxlciAjMAogICAgICAgICAgICstMTUuMSAgSW50ZWwgQ29ycG9yYXRpb24gU3Vucmlz
ZSBQb2ludC1MUCBTZXJpYWwgSU8gSTJDIENvbnRyb2xsZXIgIzEKICAgICAgICAgICArLTE2
LjAgIEludGVsIENvcnBvcmF0aW9uIFN1bnJpc2UgUG9pbnQtTFAgQ1NNRSBIRUNJICMxCiAg
ICAgICAgICAgKy0xYy4wLVswMS0zOV0tLQogICAgICAgICAgICstMWMuNC1bM2FdLS0tLTAw
LjAgIFF1YWxjb21tIEF0aGVyb3MgUUNBNjE3NCA4MDIuMTFhYyBXaXJlbGVzcyBOZXR3b3Jr
IEFkYXB0ZXIKICAgICAgICAgICArLTFkLjAtWzNiXS0tLS0wMC4wICBTSyBoeW5peCBQQzMw
MCBOVk1lIFNvbGlkIFN0YXRlIERyaXZlIDUxMkdCCiAgICAgICAgICAgKy0xZi4wICBJbnRl
bCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIExQQyBDb250cm9sbGVyCiAgICAgICAg
ICAgKy0xZi4yICBJbnRlbCBDb3Jwb3JhdGlvbiBTdW5yaXNlIFBvaW50LUxQIFBNQwogICAg
ICAgICAgICstMWYuMyAgSW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2ludC1MUCBIRCBB
dWRpbwogICAgICAgICAgIFwtMWYuNCAgSW50ZWwgQ29ycG9yYXRpb24gU3VucmlzZSBQb2lu
dC1MUCBTTUJ1cwoKChtbMzFtVGhlIHBjaWVyb290IHBvcnQgMDAwMDowMDoxYy4wIEFTUE0g
c2V0dGluZyBpcyBEaXNhYmxlZCwgYW5kIGl0cyBEIHN0YXRlIGFuZCBMaW5rIFBNIGFyZSBu
b3QgZXhwZWN0ZWQsCnBsZWFzZSBlbmFibGUgMDAwMDowMDoxYy4wIEFTUE0gc2V0dGluZyB0
byBkb3VibGUgY2hlY2sgb3IgcmVwb3J0IGEgYnVnLhtbMG0KCg==

--------------Fvdcc0O2v8CuVIL04VNv52N6--

