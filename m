Return-Path: <platform-driver-x86+bounces-8213-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EF388A00C55
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Jan 2025 17:45:22 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 93739161C71
	for <lists+platform-driver-x86@lfdr.de>; Fri,  3 Jan 2025 16:45:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 14E481FC102;
	Fri,  3 Jan 2025 16:45:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HnLEU4pa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tlVM46O2";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="HnLEU4pa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="tlVM46O2"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5379F1FBEBF;
	Fri,  3 Jan 2025 16:45:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735922707; cv=none; b=UfvYyO2C1Fbae3CNVrs/Gx3iXHQHhbrIXsOzN0yuSPvj7nG2NyB/ldWWjYuTBWowHm5ZPkxgRdKgObCh+vbV0AyvSFdq0Fyg4wpOQWuhIVlsCLOcZH51nwG2oq6uOs36VhWb/CG80oNZyQ6U6k9vzEFbpo8oPmCXvivdnTja6EM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735922707; c=relaxed/simple;
	bh=Zl4eeM5tiHaW7wZyoJScP1Jtw2YGWMu81ErWFArBR1E=;
	h=Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RmVa3TDjDgWa4km5U1olhUG3WHRVtOX5lj0I0jNwlHuPim0rDLAn1O6dLrM9RfOUrFykZDd0pL2ZmDFyPbejjIEzKnkXSKs78YnfsqIztEzumOAkYggK7zU3cpNtiCqPGVOD678a2vpPP8xAphWYvPlGYnyMsKvkNshG+N6iLcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HnLEU4pa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tlVM46O2; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=HnLEU4pa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=tlVM46O2; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4661F2115E;
	Fri,  3 Jan 2025 16:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735922698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nooTW6NiYz/yPO2SXU5irGP6MHF2dtO+w7dqURp8ciM=;
	b=HnLEU4pamHWc1hScjHj4wFjr2QDgfVuNLnrq1oPjHCdhqpTvYJZ3rb0LK9vRj5Go9PfHTa
	sTUGAAaSgQGtghLwmsI+Va2zS0kV/0eua8288sUxldn4p4mat/E5nzllgK1RlknWw18nnQ
	VLmjnusHrBAW/QintXalc79eAq1h5FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735922698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nooTW6NiYz/yPO2SXU5irGP6MHF2dtO+w7dqURp8ciM=;
	b=tlVM46O2kMygD1azakZmBZOcipo4uhM39F2znLmQMBcUajRy5g1V+RkcVox2O6cR2xsRRW
	AYZM35zMKo/SlEDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1735922698; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nooTW6NiYz/yPO2SXU5irGP6MHF2dtO+w7dqURp8ciM=;
	b=HnLEU4pamHWc1hScjHj4wFjr2QDgfVuNLnrq1oPjHCdhqpTvYJZ3rb0LK9vRj5Go9PfHTa
	sTUGAAaSgQGtghLwmsI+Va2zS0kV/0eua8288sUxldn4p4mat/E5nzllgK1RlknWw18nnQ
	VLmjnusHrBAW/QintXalc79eAq1h5FM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1735922698;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=nooTW6NiYz/yPO2SXU5irGP6MHF2dtO+w7dqURp8ciM=;
	b=tlVM46O2kMygD1azakZmBZOcipo4uhM39F2znLmQMBcUajRy5g1V+RkcVox2O6cR2xsRRW
	AYZM35zMKo/SlEDg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 9A4FB134E4;
	Fri,  3 Jan 2025 16:44:57 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id lKxkJAkUeGeAAQAAD6G6ig
	(envelope-from <tiwai@suse.de>); Fri, 03 Jan 2025 16:44:57 +0000
Date: Fri, 03 Jan 2025 17:44:57 +0100
Message-ID: <87bjwnzw1i.wl-tiwai@suse.de>
From: Takashi Iwai <tiwai@suse.de>
To: Baojun Xu <baojun.xu@ti.com>
Cc:<tiwai@suse.de>,<robh+dt@kernel.org>,<andriy.shevchenko@linux.intel.com>,
 <lgirdwood@gmail.com>,<perex@perex.cz>,<shenghao-ding@ti.com>,
 <navada@ti.com>,<13916275206@139.com>,<v-hampiholi@ti.com>,<v-po@ti.com>,
 <linux-sound@vger.kernel.org>,<linux-kernel@vger.kernel.org>,
 <liam.r.girdwood@intel.com>,<yung-chuan.liao@linux.intel.com>,
 <broonie@kernel.org>,<antheas.dk@gmail.com>,	"Rafael J. Wysocki"
 <rafael@kernel.org>,	linux-acpi@vger.kernel.org,	Hans de Goede
 <hdegoede@redhat.com>,	=?ISO-8859-1?Q?=22Ilpo_J=E4rvinen=22?=
 <ilpo.jarvinen@linux.intel.com>,	platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH v12] ALSA: hda/tas2781: Add tas2781 hda SPI driver
In-Reply-To: <20241216122008.15425-1-baojun.xu@ti.com>
References: <20241216122008.15425-1-baojun.xu@ti.com>
User-Agent: Wanderlust/2.15.9 (Almost Unreal) Emacs/27.2 Mule/6.0
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 (generated by SEMI-EPG 1.14.7 - "Harue")
Content-Type: text/plain; charset=US-ASCII
X-Spam-Level: 
X-Spamd-Result: default: False [-1.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	FREEMAIL_ENVRCPT(0.00)[139.com,gmail.com];
	FREEMAIL_CC(0.00)[suse.de,kernel.org,linux.intel.com,gmail.com,perex.cz,ti.com,139.com,vger.kernel.org,intel.com,redhat.com];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[dt];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Score: -1.80
X-Spam-Flag: NO

On Mon, 16 Dec 2024 13:20:08 +0100,
Baojun Xu wrote:
> 
> This patch was used to add TAS2781 devices on SPI support in sound/pci/hda.
> It use ACPI node descript about parameters of TAS2781 on SPI, it like:
>     Scope (_SB.PC00.SPI0)
>     {
>         Device (GSPK)
>         {
>             Name (_HID, "TXNW2781")  // _HID: Hardware ID
>             Method (_CRS, 0, NotSerialized)
>             {
>                 Name (RBUF, ResourceTemplate ()
>                 {
>                     SpiSerialBusV2 (...)
>                     SpiSerialBusV2 (...)
>                 }
>             }
>         }
>     }
> 
> And in platform/x86/serial-multi-instantiate.c, those spi devices will be
> added into system as a single SPI device, so TAS2781 SPI driver will
> probe twice for every single SPI device. And driver will also parser
> mono DSP firmware binary and RCA binary for itself.
> The code support Realtek as the primary codec.
> In patch version-10, add multi devices firmware binary support,
> to compatble with windows driver, they can share same firmware binary.
> 
> Signed-off-by: Baojun Xu <baojun.xu@ti.com>
> 
> ---
> v12:
>  - Reture real error in tas2781_save_calibration().
>  - Change tas_priv->rcabin.profile_cfg_id to 0 after reset.
>  - Add tas2781_spi_reset() in system suspend.
>  - Remove apply_calibration in system resume, it will cause no sound.
>  - Change unaligned.h include directory from asm to linux.
> v11:
>  - Define config number for pre-reset and post-reset scripts.
>  - Remove acpi_subsystem_id as it was not used.
>  - Change variables order in structure, to avoid possible memory holes.
>  - Remove pre-reset and post-reset scripts in reset function.
>  - Change variables name to more common.
>  - Add pre-reset and post-reset scripts in fw_ready.
>  - Add empty line after end of function.
>  - Remove reset function before fw ready.
>  - Add result check for tasdevice_spi_prmg_load().
>  - Return real result of tasdevice_load_block_kernel().
>  - Change code for ppcver check, and update debug message.
>  - Remove load_calib_data() as no calibration data in firmware now.
>  - Remove tasdevice_spi_select_tuningprm_cfg() as config will be forced
>    downloaded after program download.
>  - Change comments for tasdevice_spi_tuning_switch().
>  - Remove unnecessary brace.
> v10:
>  - Remove project id 103c8b93 in Patch_realtek.c, as it was used
>    for test only, offcial project id is 103c8daa (Gemtree).
>  - Add TAS2781_REG_CLK_CONFIG for check if AMP has been reset.
>  - Add table for pre-reset and post-reset.
>  - Perform pre-reset config before reset AMP.
>  - Perform post-reset config after reset AMP.
>  - Fix wrong offset in calibration data issue.
>  - Remove tuning switch after firmware download.
>  - Force stop play in runtime suspend.
>  - Apply patch for component change in bind & unbind.
>  - Remove program download and calibration data apply,
>    switch tuning only in runtime resume.
>  - Check if AMP has reseted in system resume,
>    and do firmware download and calibration data apply.
>  - Change flag 0xCx to 0x8x for coeff data force download.
>  - Add device index for multi device firmware binary file compatible.
>  - Check device index before registers write during firmware download.
>  - Force config data download after program download.
>  - Remove config download in tuning switch.
> v9:
>  - Add parentheses for variables in micro define.
>  - Add define for calibration registers address identify.
>  - Change variable name from calibration_data to cali_data.
>  - Add variable for calibration registers address in struct tasdevice_priv.
>  - Change format for alignment to parentheses.
>  - Remove tas2781_reg_defaults as it will be over write in firmware download.
>  - Remove RESET for second device in tas2781_spi_reset(),
>    as it will cause no sound on second device.
>  - Add calibration registers address initial in tasdevice_spi_init().
>  - Remove unnecessary parentheses.
>  - Remove exception in tas2781_hda_playback_hook().
>  - Remove hard code for calibration registers address.
>  - Add support for calibration data format V3 for registers address identify,
>    as new firmware tool will define calibration registers address dynamic,
>    so can't hard code it, need read it from BIOS with calibration data.
>  - Remove some debug print.
>  - Change hard code value (3) to ARRAY_SIZE(tas2781_snd_controls)/2.
>  - New patch apply for change position of component_del().
>  - Change label from out, out1 to config_err and block_err.
>  - Remove unnecessary parentheses in tas2781_spi_fwlib.c.
>  - Remove tasdevice_spi_prmg_calibdata_load().
> v8:
>  - Move *-y position in sound/pci/hda/Makefile.
>  - Change + to | for bit operation in macro define.
>  - Change TASDEVICE_Checksum to TASDEVICE_CHECKSUM.
> v7:
>  - Add new project Gemtree (0x103c8daa) support for tas2781 spi driver.
> v6:
>  - Remove client in tasdevice_priv struct as it was not used.
>  - Change format for tasdevice_spi_dev_write() in tas2781_hda_spi.c.
>  - Change update bits function to read & write mode, as tas2781 use last bit
>    to mask read & write, it cause regmap_update_bits work not as our expected.
>  - Add element in tas2781_snd_controls, tas2781_prof_ctrl,
>    tas2781_dsp_conf_ctrl, to support second device.
>    Previous version add sound card for first index only.
>  - Change calibration registers address declaire to TASDEVICE_REG() mode.
>  - Add snd_ctl_new1() for second device.
>  - Change format for tas2781_hda_unbind() to fit 79 chars in one line.
>  - Remove client for spi as it was not used.
>  - Remove unused variables.
>  - Remove cur_prog clean in runtime_suspend().
>  - Remove unused variables.
>  - Add tasdevice_spi_tuning_switch() in runtime_resume.
>  - Remove cur_prog clean in system_resume().
>  - Add tuning switch if playback started in system_resume().
>  - Change TASDEVICE_PAGE_REG to TASDEVICE_REG_ID in tas2781_spi_fwlib.c.
>  - Remove calibration binary load functions as data will be loaded from EFI.
> v5:
>  - Combined all modification into one patch for pass the compile.
>  - Remove old hardware id "TIAS2781" as no production on market.
>  - Change max page size to 256 in tas2781-spi.h.
>  - Change book reg from 127 to GENMASK(7, 1), as one bit shift is needed.
>  - Change register address define as one bit shift needed for offset.
>  - Change block check sum comments to Firmware block from I2C.
>  - Change define of (page + reg) to TASDEVICE_PAGE_REG from TASDEVICE_PGRG.
>  - Change to lower case in defined value.
>  - Add registers default value table in tas2781_hda_spi.c
>  - Change rang_max to 256 * 256.
>  - Add zero_flag_mask in regmap_config.
>  - Change max_register to 256 * 256.
>  - Add registers default table into structure regmap_config.
>  - Change parameter from book number to whole register address.
>  - Remove page 0 switch as SPI driver will do it.
>  - Add bit(0) for read function as tas2781 will check last bit of address,
>    to determine operation mode is read (1) or write (0).
>  - Change switch case to if check in tas2781_hda_playback_hook(),
>    as it may cause compile problem in clang-19 building.
>  - Change variable declaration position.
>  - Change order in if check.
>  - Remove old hardware id ("TIAS2781") support.
>  - Remove debug message in runtime suspend and resume.
>  - Remove regmap.h include in tas2781_spi_fwlib.c.
>  - Remove MODULE_ in fwlib as this file will work with tas2781_hda_spi.c only.
> v4:
>  - Add old hardware id "TIAS2781" for compatible with old production
>  - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
> v4:
>  - Add old hardware id "TIAS2781" for compatible with old production
>  - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
>  - Move include of sound/tas2781-dsp.h to c source file tas2781_hda_spi.c,
>    tas2781_spi_fwlib.c, as it's not needed in header file tas2781-spi.h
>  - Use page and book number define in other micro define
>  - Change 4000000 to (4 * HZ_PER_MHZ)
>  - Add define for calibration variable name and size in UEFI.
>  - Remove structure tasdevice & tasdevice_irqinfo, and move variables in to
>    structure tasdevice_priv
>  - Remove some unused variables in sttructure tasdevice_priv
>  - Remove function declare of tascodec_init(), use tascodec_spi_init()
>  - Remove function declare of tasdevice_remove()
>  - Add array_size.h included in tas2781_hda_spi.c
>  - Add cleanup.h included for change mutex to guard
>  - Add units.h included
>  - Include tas2781-dsp.h
>  - Remove unused variables in tas2781_hda structure
>  - Change 0xff to GENMASK(7, 0)
>  - Change 128 to define of max page size
>  - Change code as all variables was moved to tasdevice_priv structure
>  - Change comments for error in book write, or page write
>  - Remove initial of ret, and return 0 directly
>  - Change comments for wrong typo, add space in front and end
>  - Add check for bulk read, max size should be a page size
>  - Change usleep_rang() to fsleep()
>  - Change mutex_lock to guard(mutex), and remove mutex_unlock()
>  - Change tasdevice_spi_init() to void from int as no value return required
>  - Change second parameter to sizeof
>  - Remove tasdevice_clamp(), use clamp()
>  - Add compatible with old hardware id "TIAS2781"
>  - Remove cs_gpio and spi device in tas2781_read_acpi() as use default CS
>  - Change dev-index check, return -EINVAL if it's <= 0
>  - Change 0xFF to U8_MAX
>  - Remove GPIO get for chip-select, use default from SPI device
>  - Perform RESET in first AMP only as all AMPs share same RESET pin
>  - return 0 directly in some simple routine to avoid variable initial
>  - Change comments for function which was used by system
>  - Change "ON" "OFF" to function str_on_off(...)
>  - Change format of GUID
>  - Add temp buffer for first efi.get_variable()
>  - Free data if it was allocated
>  - Change format of debug message of calibration date time print
>  - Remove total_sz = 0, as it's not needed
>  - Move save_calibration to after tuning_switch to avoid calibration data
>    overwrite
>  - Remove dev from structure tasdevice_hda, use dev in tasdevice_priv
>  - Remove 0 from { "tas2781-hda", 0}, & {"TXNW2781", 0},
>  - Add old hardware id "TIAS2781" for compatible with old production
>  - Add 2 devices in struct smi_node tas2781_hda, to compatible with 4 AMPs
> v3:
>  - Move HID up to above /* Non-conforming _HID ... */ in scan.c,
>    for avoid misunderstanding.
>  - Move HID up to above /* Non-conforming _HID ... */ in
>    serial-multi-instantiate.c, for avoid misunderstanding.
>  - Change objs to y for snd-hda-scodec-tas2781-spi- in Makefile.
>  - Change format for some define in tas2781-spi.h.
>  - Add define for TASDEVICE_MAX_BOOK_NUM, TASDEVICE_MAX_PAGE.
>  - Move declare of "enum calib_data {" to header file from source file.
>  - Remove "enum device_catlog_id {" as only one platform was supported now.
>  - Remove "struct calidata", as we will save pure calibration data only.
>  - Remove "struct calidata", "enum device_catlog_id" in tasdevice_priv.
>  - Add calibration_data in tasdevice_priv to save pure calibration data.
>  - Remove declare of tasdevice_save_calibration() and
>    tasdevice_apply_calibration(), as it will be used within same c file.
>  - Add below header files included in tas2781_hda_spi.c:
>    bits.h, mutex.h, property.h, time.h, types.h.
>  - Move two micro define to header file tas2781-spi.h.
>  - Change format of some micro define.
>  - Change format of some structure.
>  - Remove irq in tas2781_hda, as have it already in tasdevice_priv.
>  - Remove some local functions declare as not necessarily.
>  - Return error if regmap_write() failed.
>  - Change fixed value 2 to sizeof(data).
>  - Remove all of EXPORT_SYMBOL_GPL,
>    as all of function was called within same module.
>  - Remove empty line after last return in some functions.
>  - Remove some variable initialyzation.
>  - Remove variable sub, store acpi_subsystem_id directly.
>  - Remove wrong comments for device index, it's must, can't be NULL.
>  - Remove some local variables, use elements in structure directly.
>  - Append commas in last element of an array.
>  - Change calibration data process, didn't save all of calibration data in EFI,
>    get in local, and save pure calibration data in tasdevice_priv.
>  - Call tasdevice_save_calibration() from function pointer in tasdevice_priv;
>  - Remove subid as one platform was supported only, needn't check.
>  - Add initialyzation for local variable.
>  - Move regmap initialyzation to before acpi read.
>  - Call tasdevice_apply_calibration() from function pointer in tasdevice_priv;
>  - Remove MODULE_IMPORT_NS(SND_SOC_TAS2781_FMWLIB), as all functions was
>    performed within same module.
>  - Update format and variables declare order.
>  - Change format of multi conditions for if.
>  - Remove casting which is not needed.
>  - Change variables type to avoid casting.
>  - Remove Unneeded parentheses.
>  - Change if check to avoid goto.
>  - Add {} for keep same style.
>  - Remove some local variables, use elements in structure directly.
> v2:
>  - Change depends on SPI to SPI_MASTER in sound/pci/hda/Kconfig
>  - Add select SND_HDA_SCODEC_COMPONENT in sound/pci/hda/Kconfig
>  - Change comp_generic_fixup() 5th parameter from "-%s:00" to
>    "-%s:00-tas2781-hda.%d" in sound/pci/hda/patch_realtek.c
>  - Change chain_id from ALC285_FIXUP_THINKPAD_HEADSET_JACK to
>    ALC285_FIXUP_HP_GPIO_LED in sound/pci/hda/patch_realtek.c
>  - Remove project name "Gemtree"
>  - Update information in file header of tas2781-spi.h.
>  - Remove useless micro define.
>  - Change TASDEVICE_I2CChecksum to TASDEVICE_Checksum
>  - Remove enum control_bus as current code support SPI only.
>  - Remove device define as current code support TAS2781 only.
>  - Remove spi_device **spi_devs in structure tasdevice_priv.
>  - Remove cal_binaryname in structure tasdevice_priv.
>  - Remove ndev in structure tasdevice_priv.
>  - Change isacpi and  isspi, replace by control_bus(I2C or SPI).
>  - Remove void tasdevice_spi_dsp_remove(void *context).
>  - Add acpi_device and irq in structure tas2781_hda in tas2781_hda_spi.c.
>  - Remove parameter chn in all of registers access functions.
>  - Add tascodec_spi_init().
>  - Add chip select gpio set for SPI device.
>  - Change tasdevice_tuning_switch() to tasdevice_spi_tuning_switch().
>  - Change device offset from tas_priv->ndev to tas_priv->index.
>  - Change tasdevice_dsp_remove() to tasdevice_spi_dsp_remove().
>  - tasdevice_prmg_load() to tasdevice_spi_prmg_load().
>  - Change tasdevice_config_info_remove() to
>    tasdevice_spi_config_info_remove().
>  - Add one dummy byte shift when read from page 2~127, or not book 0.
>  - Change tasdevice_spi_change_chn_book() to tasdevice_spi_switch_book()
>  - Perform put_device(physdev) before error return.
>  - Change calibration data id to 2781 from 2783 in EFI
>  - Change calibration data structure name in comments.
>  - Remove file name in tas2781_spi_fwlib.c.
>  - Remove #include <linux/i2c.h> as it not needed in SPI mode.
>  - Change TAB to speace in micro define in tas2781_spi_fwlib.c.
>  - Change to up-case for DSP.
>  - Change all of multi-line comments format, empty first line.
>  - Change all of sizeof(struct xx) to sizeof(*xx).
>  - Remove Explicit casting for variables compare to avoid possible fault.
>  - Return directly without goto.
>  - Change 1 << xx to BIT(xx).
>  - Remove deviceNumber[] as current SPI device will support one device only.
>  - Add memory free before return error.
>  - Change "buf[offset]; offset += 1" to buf[offset++].
>  - Remove some debug information print.
>  - Change firmware binary to single device mode.
>  - Change all bexx_to_cpup() to get_unaligned_bexx().
>  - Remove ndev process as current SPI device support single device only.
>  - Remove chn and chnend for single device support only.
>  - Change all of registers read/write function, remove parameter chn.
>  - Create new function for single write, burst write, delay, field write
>    in tasdevice_process_block().
> ---
>  drivers/acpi/scan.c                           |    1 +
>  .../platform/x86/serial-multi-instantiate.c   |   12 +
>  sound/pci/hda/Kconfig                         |   14 +
>  sound/pci/hda/Makefile                        |    2 +
>  sound/pci/hda/patch_realtek.c                 |   14 +
>  sound/pci/hda/tas2781-spi.h                   |  158 ++
>  sound/pci/hda/tas2781_hda_spi.c               | 1271 +++++++++++
>  sound/pci/hda/tas2781_spi_fwlib.c             | 2008 +++++++++++++++++
>  8 files changed, 3480 insertions(+)

So this series reached already v12, and we'd really like to take in
some form.  Although the code is still much more complex than I
wished, it's more or less readable and understandable in some level,
so I'm fine about the sound/* part.

OTOH, this contains also the changes for drivers/acpi/scan.c and
drivers/platform/x86/serial-multi-instantiate.c, and those need Acks
from the corresponding people, but it missed Cc to them (and MLs).
Now I put them to Cc.

Rafael, Hans, Ilpo, Andy, anyone else - could you guys check it?


thanks,

Takashi

>  create mode 100644 sound/pci/hda/tas2781-spi.h
>  create mode 100644 sound/pci/hda/tas2781_hda_spi.c
>  create mode 100644 sound/pci/hda/tas2781_spi_fwlib.c
> 
> diff --git a/drivers/acpi/scan.c b/drivers/acpi/scan.c
> index 74dcccdc6482..55a9a3d5afa8 100644
> --- a/drivers/acpi/scan.c
> +++ b/drivers/acpi/scan.c
> @@ -1769,6 +1769,7 @@ static bool acpi_device_enumeration_by_parent(struct acpi_device *device)
>  		{"CSC3557", },
>  		{"INT33FE", },
>  		{"INT3515", },
> +		{"TXNW2781", },
>  		/* Non-conforming _HID for Cirrus Logic already released */
>  		{"CLSA0100", },
>  		{"CLSA0101", },
> diff --git a/drivers/platform/x86/serial-multi-instantiate.c b/drivers/platform/x86/serial-multi-instantiate.c
> index ed6b28505cd6..db030b0f176a 100644
> --- a/drivers/platform/x86/serial-multi-instantiate.c
> +++ b/drivers/platform/x86/serial-multi-instantiate.c
> @@ -384,6 +384,17 @@ static const struct smi_node cs35l57_hda = {
>  	.bus_type = SMI_AUTO_DETECT,
>  };
>  
> +static const struct smi_node tas2781_hda = {
> +	.instances = {
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{ "tas2781-hda", IRQ_RESOURCE_AUTO, 0 },
> +		{}
> +	},
> +	.bus_type = SMI_AUTO_DETECT,
> +};
> +
>  /*
>   * Note new device-ids must also be added to ignore_serial_bus_ids in
>   * drivers/acpi/scan.c: acpi_device_enumeration_by_parent().
> @@ -396,6 +407,7 @@ static const struct acpi_device_id smi_acpi_ids[] = {
>  	{ "CSC3556", (unsigned long)&cs35l56_hda },
>  	{ "CSC3557", (unsigned long)&cs35l57_hda },
>  	{ "INT3515", (unsigned long)&int3515_data },
> +	{ "TXNW2781", (unsigned long)&tas2781_hda },
>  	/* Non-conforming _HID for Cirrus Logic already released */
>  	{ "CLSA0100", (unsigned long)&cs35l41_hda },
>  	{ "CLSA0101", (unsigned long)&cs35l41_hda },
> diff --git a/sound/pci/hda/Kconfig b/sound/pci/hda/Kconfig
> index 68f1eee9e5c9..ca3f5b69b521 100644
> --- a/sound/pci/hda/Kconfig
> +++ b/sound/pci/hda/Kconfig
> @@ -206,6 +206,20 @@ config SND_HDA_SCODEC_TAS2781_I2C
>  comment "Set to Y if you want auto-loading the side codec driver"
>  	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_I2C=m
>  
> +config SND_HDA_SCODEC_TAS2781_SPI
> +	tristate "Build TAS2781 HD-audio side codec support for SPI Bus"
> +	depends on SPI_MASTER
> +	depends on ACPI
> +	depends on EFI
> +	depends on SND_SOC
> +	select CRC32_SARWATE
> +	help
> +	  Say Y or M here to include TAS2781 SPI HD-audio side codec support
> +	  in snd-hda-intel driver, such as ALC287.
> +
> +comment "Set to Y if you want auto-loading the side codec driver"
> +	depends on SND_HDA=y && SND_HDA_SCODEC_TAS2781_SPI=m
> +
>  config SND_HDA_CODEC_REALTEK
>  	tristate "Build Realtek HD-audio codec support"
>  	select SND_HDA_GENERIC
> diff --git a/sound/pci/hda/Makefile b/sound/pci/hda/Makefile
> index 80210f845df2..210c406dfbc5 100644
> --- a/sound/pci/hda/Makefile
> +++ b/sound/pci/hda/Makefile
> @@ -40,6 +40,7 @@ snd-hda-scodec-cs35l56-spi-y :=	cs35l56_hda_spi.o
>  snd-hda-cs-dsp-ctls-y :=	hda_cs_dsp_ctl.o
>  snd-hda-scodec-component-y :=	hda_component.o
>  snd-hda-scodec-tas2781-i2c-y :=	tas2781_hda_i2c.o
> +snd-hda-scodec-tas2781-spi-y :=	tas2781_hda_spi.o tas2781_spi_fwlib.o
>  
>  # common driver
>  obj-$(CONFIG_SND_HDA) := snd-hda-codec.o
> @@ -72,6 +73,7 @@ obj-$(CONFIG_SND_HDA_SCODEC_CS35L56_SPI) += snd-hda-scodec-cs35l56-spi.o
>  obj-$(CONFIG_SND_HDA_CS_DSP_CONTROLS) += snd-hda-cs-dsp-ctls.o
>  obj-$(CONFIG_SND_HDA_SCODEC_COMPONENT) += snd-hda-scodec-component.o
>  obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_I2C) += snd-hda-scodec-tas2781-i2c.o
> +obj-$(CONFIG_SND_HDA_SCODEC_TAS2781_SPI) += snd-hda-scodec-tas2781-spi.o
>  
>  # this must be the last entry after codec drivers;
>  # otherwise the codec patches won't be hooked before the PCI probe
> diff --git a/sound/pci/hda/patch_realtek.c b/sound/pci/hda/patch_realtek.c
> index 17392b21d5bf..f457e879ba42 100644
> --- a/sound/pci/hda/patch_realtek.c
> +++ b/sound/pci/hda/patch_realtek.c
> @@ -7128,6 +7128,11 @@ static void tas2781_fixup_i2c(struct hda_codec *cdc,
>  	comp_generic_fixup(cdc, action, "i2c", "TIAS2781", "-%s:00", 1);
>  }
>  
> +static void tas2781_fixup_spi(struct hda_codec *cdc, const struct hda_fixup *fix, int action)
> +{
> +	comp_generic_fixup(cdc, action, "spi", "TXNW2781", "-%s:00-tas2781-hda.%d", 2);
> +}
> +
>  static void yoga7_14arb7_fixup_i2c(struct hda_codec *cdc,
>  	const struct hda_fixup *fix, int action)
>  {
> @@ -7761,6 +7766,7 @@ enum {
>  	ALC236_FIXUP_DELL_DUAL_CODECS,
>  	ALC287_FIXUP_CS35L41_I2C_2_THINKPAD_ACPI,
>  	ALC287_FIXUP_TAS2781_I2C,
> +	ALC245_FIXUP_TAS2781_SPI_2,
>  	ALC287_FIXUP_YOGA7_14ARB7_I2C,
>  	ALC245_FIXUP_HP_MUTE_LED_COEFBIT,
>  	ALC245_FIXUP_HP_X360_MUTE_LEDS,
> @@ -9965,6 +9971,12 @@ static const struct hda_fixup alc269_fixups[] = {
>  		.chained = true,
>  		.chain_id = ALC285_FIXUP_THINKPAD_HEADSET_JACK,
>  	},
> +	[ALC245_FIXUP_TAS2781_SPI_2] = {
> +		.type = HDA_FIXUP_FUNC,
> +		.v.func = tas2781_fixup_spi,
> +		.chained = true,
> +		.chain_id = ALC285_FIXUP_HP_GPIO_LED,
> +	},
>  	[ALC287_FIXUP_YOGA7_14ARB7_I2C] = {
>  		.type = HDA_FIXUP_FUNC,
>  		.v.func = yoga7_14arb7_fixup_i2c,
> @@ -10526,6 +10538,8 @@ static const struct hda_quirk alc269_fixup_tbl[] = {
>  	SND_PCI_QUIRK(0x103c, 0x8d84, "HP EliteBook X G1i", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8d91, "HP ZBook Firefly 14 G12", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8d92, "HP ZBook Firefly 16 G12", ALC285_FIXUP_HP_GPIO_LED),
> +	SND_PCI_QUIRK(0x103c, 0x8de8, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
> +	SND_PCI_QUIRK(0x103c, 0x8de9, "HP Gemtree", ALC245_FIXUP_TAS2781_SPI_2),
>  	SND_PCI_QUIRK(0x103c, 0x8e18, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8e19, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
>  	SND_PCI_QUIRK(0x103c, 0x8e1a, "HP ZBook Firefly 14 G12A", ALC285_FIXUP_HP_GPIO_LED),
> diff --git a/sound/pci/hda/tas2781-spi.h b/sound/pci/hda/tas2781-spi.h
> new file mode 100644
> index 000000000000..ecfc3c8bb821
> --- /dev/null
> +++ b/sound/pci/hda/tas2781-spi.h
> @@ -0,0 +1,158 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +//
> +// ALSA SoC Texas Instruments TAS2781 Audio Smart Amplifier
> +//
> +// Copyright (C) 2024 Texas Instruments Incorporated
> +// https://www.ti.com
> +//
> +// The TAS2781 driver implements a flexible and configurable
> +// algo coefficient setting for TAS2781 chips.
> +//
> +// Author: Baojun Xu <baojun.xu@ti.com>
> +//
> +
> +#ifndef __TAS2781_SPI_H__
> +#define __TAS2781_SPI_H__
> +
> +#define TASDEVICE_RATES			\
> +	(SNDRV_PCM_RATE_44100 |	SNDRV_PCM_RATE_48000 | \
> +	SNDRV_PCM_RATE_96000 | SNDRV_PCM_RATE_88200)
> +
> +#define TASDEVICE_FORMATS		\
> +	(SNDRV_PCM_FMTBIT_S16_LE | SNDRV_PCM_FMTBIT_S24_LE | \
> +	SNDRV_PCM_FMTBIT_S32_LE)
> +
> +#define TASDEVICE_MAX_BOOK_NUM		256
> +#define TASDEVICE_MAX_PAGE		256
> +
> +#define TASDEVICE_MAX_SIZE	(TASDEVICE_MAX_BOOK_NUM * TASDEVICE_MAX_PAGE)
> +
> +/* PAGE Control Register (available in page0 of each book) */
> +#define TASDEVICE_PAGE_SELECT		0x00
> +#define TASDEVICE_BOOKCTL_PAGE		0x00
> +#define TASDEVICE_BOOKCTL_REG		GENMASK(7, 1)
> +#define TASDEVICE_BOOK_ID(reg)		(((reg) & GENMASK(24, 16)) >> 16)
> +#define TASDEVICE_PAGE_ID(reg)		(((reg) & GENMASK(15, 8)) >> 8)
> +#define TASDEVICE_REG_ID(reg)		(((reg) & GENMASK(7, 1)) >> 1)
> +#define TASDEVICE_PAGE_REG(reg)		((reg) & GENMASK(15, 1))
> +#define TASDEVICE_REG(book, page, reg)	\
> +	(((book) << 16) | ((page) << 8) | ((reg) << 1))
> +
> +/* Software Reset */
> +#define TAS2781_REG_SWRESET		TASDEVICE_REG(0x0, 0x0, 0x01)
> +#define TAS2781_REG_SWRESET_RESET	BIT(0)
> +
> +/* System Reset Check Register */
> +#define TAS2781_REG_CLK_CONFIG		TASDEVICE_REG(0x0, 0x0, 0x5c)
> +#define TAS2781_REG_CLK_CONFIG_RESET	(0x19)
> +#define TAS2781_PRE_POST_RESET_CFG	3
> +
> +/* Block Checksum */
> +#define TASDEVICE_CHECKSUM		TASDEVICE_REG(0x0, 0x0, 0x7e)
> +
> +/* Volume control */
> +#define TAS2781_DVC_LVL			TASDEVICE_REG(0x0, 0x0, 0x1a)
> +#define TAS2781_AMP_LEVEL		TASDEVICE_REG(0x0, 0x0, 0x03)
> +#define TAS2781_AMP_LEVEL_MASK		GENMASK(5, 1)
> +
> +#define TASDEVICE_CMD_SING_W		0x1
> +#define TASDEVICE_CMD_BURST		0x2
> +#define TASDEVICE_CMD_DELAY		0x3
> +#define TASDEVICE_CMD_FIELD_W		0x4
> +
> +#define TAS2781_SPI_MAX_FREQ		(4 * HZ_PER_MHZ)
> +
> +#define TASDEVICE_CRC8_POLYNOMIAL		0x4d
> +#define TASDEVICE_SPEAKER_CALIBRATION_SIZE	20
> +
> +/* Flag of calibration registers address. */
> +#define TASDEVICE_CALIBRATION_REG_ADDRESS	BIT(7)
> +
> +#define TASDEVICE_CALIBRATION_DATA_NAME	L"CALI_DATA"
> +#define TASDEVICE_CALIBRATION_DATA_SIZE	256
> +
> +enum calib_data {
> +	R0_VAL = 0,
> +	INV_R0,
> +	R0LOW,
> +	POWER,
> +	TLIM,
> +	CALIB_MAX
> +};
> +
> +struct tasdevice_priv {
> +	struct tasdevice_fw *cali_data_fmw;
> +	struct tasdevice_rca rcabin;
> +	struct tasdevice_fw *fmw;
> +	struct gpio_desc *reset;
> +	struct mutex codec_lock;
> +	struct regmap *regmap;
> +	struct device *dev;
> +	struct tm tm;
> +
> +	unsigned char crc8_lkp_tbl[CRC8_TABLE_SIZE];
> +	unsigned char coef_binaryname[64];
> +	unsigned char rca_binaryname[64];
> +	unsigned char dev_name[32];
> +
> +	bool force_fwload_status;
> +	bool playback_started;
> +	bool is_loading;
> +	bool is_loaderr;
> +	unsigned int cali_reg_array[CALIB_MAX];
> +	unsigned int cali_data[CALIB_MAX];
> +	unsigned int err_code;
> +	void *codec;
> +	int cur_book;
> +	int cur_prog;
> +	int cur_conf;
> +	int fw_state;
> +	int index;
> +	int irq;
> +
> +	int (*fw_parse_variable_header)(struct tasdevice_priv *tas_priv,
> +					const struct firmware *fmw,
> +					int offset);
> +	int (*fw_parse_program_data)(struct tasdevice_priv *tas_priv,
> +				     struct tasdevice_fw *tas_fmw,
> +				     const struct firmware *fmw, int offset);
> +	int (*fw_parse_configuration_data)(struct tasdevice_priv *tas_priv,
> +					   struct tasdevice_fw *tas_fmw,
> +					   const struct firmware *fmw,
> +					   int offset);
> +	int (*tasdevice_load_block)(struct tasdevice_priv *tas_priv,
> +				    struct tasdev_blk *block);
> +
> +	int (*save_calibration)(struct tasdevice_priv *tas_priv);
> +	void (*apply_calibration)(struct tasdevice_priv *tas_priv);
> +};
> +
> +int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
> +			   unsigned int reg, unsigned int *value);
> +int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv,
> +			    unsigned int reg, unsigned int value);
> +int tasdevice_spi_dev_bulk_write(struct tasdevice_priv *tas_priv,
> +				 unsigned int reg, unsigned char *p_data,
> +				 unsigned int n_length);
> +int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
> +				unsigned int reg, unsigned char *p_data,
> +				unsigned int n_length);
> +int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tasdevice,
> +				  unsigned int reg, unsigned int mask,
> +				  unsigned int value);
> +
> +void tasdevice_spi_select_cfg_blk(void *context, int conf_no,
> +				  unsigned char block_type);
> +void tasdevice_spi_config_info_remove(void *context);
> +int tasdevice_spi_dsp_parser(void *context);
> +int tasdevice_spi_rca_parser(void *context, const struct firmware *fmw);
> +void tasdevice_spi_dsp_remove(void *context);
> +void tasdevice_spi_calbin_remove(void *context);
> +int tasdevice_spi_select_tuningprm_cfg(void *context, int prm, int cfg_no,
> +				       int rca_conf_no);
> +int tasdevice_spi_prmg_load(void *context, int prm_no);
> +int tasdevice_spi_prmg_calibdata_load(void *context, int prm_no);
> +void tasdevice_spi_tuning_switch(void *context, int state);
> +int tas2781_spi_load_calibration(void *context, char *file_name,
> +				 unsigned short i);
> +#endif /* __TAS2781_SPI_H__ */
> diff --git a/sound/pci/hda/tas2781_hda_spi.c b/sound/pci/hda/tas2781_hda_spi.c
> new file mode 100644
> index 000000000000..8068c70b7014
> --- /dev/null
> +++ b/sound/pci/hda/tas2781_hda_spi.c
> @@ -0,0 +1,1271 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// TAS2781 HDA SPI driver
> +//
> +// Copyright 2024 Texas Instruments, Inc.
> +//
> +// Author: Baojun Xu <baojun.xu@ti.com>
> +
> +#include <linux/acpi.h>
> +#include <linux/array_size.h>
> +#include <linux/bits.h>
> +#include <linux/cleanup.h>
> +#include <linux/crc8.h>
> +#include <linux/crc32.h>
> +#include <linux/efi.h>
> +#include <linux/firmware.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/mutex.h>
> +#include <linux/pm_runtime.h>
> +#include <linux/property.h>
> +#include <linux/regmap.h>
> +#include <linux/spi/spi.h>
> +#include <linux/time.h>
> +#include <linux/types.h>
> +#include <linux/units.h>
> +
> +#include <sound/hda_codec.h>
> +#include <sound/soc.h>
> +#include <sound/tas2781-dsp.h>
> +#include <sound/tlv.h>
> +#include <sound/tas2781-tlv.h>
> +
> +#include "tas2781-spi.h"
> +
> +#include "hda_local.h"
> +#include "hda_auto_parser.h"
> +#include "hda_component.h"
> +#include "hda_jack.h"
> +#include "hda_generic.h"
> +
> +/*
> + * No standard control callbacks for SNDRV_CTL_ELEM_IFACE_CARD
> + * Define two controls, one is Volume control callbacks, the other is
> + * flag setting control callbacks.
> + */
> +
> +/* Volume control callbacks for tas2781 */
> +#define ACARD_SINGLE_RANGE_EXT_TLV(xname, xreg, xshift, xmin, xmax, xinvert, \
> +	xhandler_get, xhandler_put, tlv_array) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, .name = (xname), \
> +	.access = SNDRV_CTL_ELEM_ACCESS_TLV_READ | \
> +		SNDRV_CTL_ELEM_ACCESS_READWRITE, \
> +	.tlv.p = (tlv_array), \
> +	.info = snd_soc_info_volsw_range, \
> +	.get = xhandler_get, .put = xhandler_put, \
> +	.private_value = (unsigned long)&(struct soc_mixer_control) { \
> +		.reg = xreg, .rreg = xreg, \
> +		.shift = xshift, .rshift = xshift,\
> +		.min = xmin, .max = xmax, .invert = xinvert, \
> +	} \
> +}
> +
> +/* Flag control callbacks for tas2781 */
> +#define ACARD_SINGLE_BOOL_EXT(xname, xdata, xhandler_get, xhandler_put) { \
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD, \
> +	.name = xname, \
> +	.info = snd_ctl_boolean_mono_info, \
> +	.get = xhandler_get, \
> +	.put = xhandler_put, \
> +	.private_value = xdata, \
> +}
> +
> +struct tas2781_hda {
> +	struct tasdevice_priv *priv;
> +	struct acpi_device *dacpi;
> +	struct snd_kcontrol *dsp_prog_ctl;
> +	struct snd_kcontrol *dsp_conf_ctl;
> +	struct snd_kcontrol *snd_ctls[3];
> +	struct snd_kcontrol *prof_ctl;
> +};
> +
> +static const struct regmap_range_cfg tasdevice_ranges[] = {
> +	{
> +		.range_min = 0,
> +		.range_max = TASDEVICE_MAX_SIZE,
> +		.selector_reg = TASDEVICE_PAGE_SELECT,
> +		.selector_mask = GENMASK(7, 0),
> +		.selector_shift = 0,
> +		.window_start = 0,
> +		.window_len = TASDEVICE_MAX_PAGE,
> +	},
> +};
> +
> +static const struct regmap_config tasdevice_regmap = {
> +	.reg_bits = 8,
> +	.val_bits = 8,
> +	.zero_flag_mask = true,
> +	.cache_type = REGCACHE_NONE,
> +	.ranges = tasdevice_ranges,
> +	.num_ranges = ARRAY_SIZE(tasdevice_ranges),
> +	.max_register = TASDEVICE_MAX_SIZE,
> +};
> +
> +static int tasdevice_spi_switch_book(struct tasdevice_priv *tas_priv, int reg)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	if (tas_priv->cur_book != TASDEVICE_BOOK_ID(reg)) {
> +		ret = regmap_write(map, TASDEVICE_BOOKCTL_REG,
> +				   TASDEVICE_BOOK_ID(reg));
> +		if (ret < 0) {
> +			dev_err(tas_priv->dev, "Switch Book E=%d\n", ret);
> +			return ret;
> +		}
> +		tas_priv->cur_book = TASDEVICE_BOOK_ID(reg);
> +	}
> +	return ret;
> +}
> +
> +int tasdevice_spi_dev_read(struct tasdevice_priv *tas_priv,
> +			   unsigned int reg,
> +			   unsigned int *val)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	ret = tasdevice_spi_switch_book(tas_priv, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	/*
> +	 * In our TAS2781 SPI mode, if read from other book (not book 0),
> +	 * or read from page number larger than 1 in book 0, one more byte
> +	 * read is needed, and first byte is a dummy byte, need to be ignored.
> +	 */
> +	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
> +		unsigned char data[2];
> +
> +		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1,
> +			data, sizeof(data));
> +		*val = data[1];
> +	} else {
> +		ret = regmap_read(map, TASDEVICE_PAGE_REG(reg) | 1, val);
> +	}
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +int tasdevice_spi_dev_write(struct tasdevice_priv *tas_priv,
> +			    unsigned int reg,
> +			    unsigned int value)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	ret = tasdevice_spi_switch_book(tas_priv, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg), value);
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +int tasdevice_spi_dev_bulk_write(struct tasdevice_priv *tas_priv,
> +				 unsigned int reg,
> +				 unsigned char *data,
> +				 unsigned int len)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	ret = tasdevice_spi_switch_book(tas_priv, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	ret = regmap_bulk_write(map, TASDEVICE_PAGE_REG(reg), data, len);
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +int tasdevice_spi_dev_bulk_read(struct tasdevice_priv *tas_priv,
> +				unsigned int reg,
> +				unsigned char *data,
> +				unsigned int len)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret;
> +
> +	ret = tasdevice_spi_switch_book(tas_priv, reg);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (len > TASDEVICE_MAX_PAGE)
> +		len = TASDEVICE_MAX_PAGE;
> +	/*
> +	 * In our TAS2781 SPI mode, if read from other book (not book 0),
> +	 * or read from page number larger than 1 in book 0, one more byte
> +	 * read is needed, and first byte is a dummy byte, need to be ignored.
> +	 */
> +	if ((TASDEVICE_BOOK_ID(reg) > 0) || (TASDEVICE_PAGE_ID(reg) > 1)) {
> +		unsigned char buf[TASDEVICE_MAX_PAGE+1];
> +
> +		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1, buf,
> +				      len + 1);
> +		memcpy(data, buf + 1, len);
> +	} else {
> +		ret = regmap_bulk_read(map, TASDEVICE_PAGE_REG(reg) | 1, data,
> +				      len);
> +	}
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +int tasdevice_spi_dev_update_bits(struct tasdevice_priv *tas_priv,
> +				  unsigned int reg,
> +				  unsigned int mask,
> +				  unsigned int value)
> +{
> +	struct regmap *map = tas_priv->regmap;
> +	int ret, val;
> +
> +	/*
> +	 * In our TAS2781 SPI mode, read/write was masked in last bit of
> +	 * address, it cause regmap_update_bits() not work as expected.
> +	 */
> +	ret = tasdevice_spi_dev_read(tas_priv, reg, &val);
> +	if (ret < 0) {
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +		return ret;
> +	}
> +	ret = regmap_write(map, TASDEVICE_PAGE_REG(reg),
> +			  (val & ~mask) | (mask & value));
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "%s, E=%d\n", __func__, ret);
> +
> +	return ret;
> +}
> +
> +static void tas2781_spi_reset(struct tasdevice_priv *tas_dev)
> +{
> +	int ret;
> +
> +	if (tas_dev->reset) {
> +		gpiod_set_value_cansleep(tas_dev->reset, 0);
> +		fsleep(800);
> +		gpiod_set_value_cansleep(tas_dev->reset, 1);
> +	}
> +	ret = tasdevice_spi_dev_write(tas_dev, TAS2781_REG_SWRESET,
> +		TAS2781_REG_SWRESET_RESET);
> +	if (ret < 0)
> +		dev_err(tas_dev->dev, "dev sw-reset fail, %d\n", ret);
> +	fsleep(1000);
> +}
> +
> +static int tascodec_spi_init(struct tasdevice_priv *tas_priv,
> +	void *codec, struct module *module,
> +	void (*cont)(const struct firmware *fw, void *context))
> +{
> +	int ret;
> +
> +	/*
> +	 * Codec Lock Hold to ensure that codec_probe and firmware parsing and
> +	 * loading do not simultaneously execute.
> +	 */
> +	guard(mutex)(&tas_priv->codec_lock);
> +
> +	ret = scnprintf(tas_priv->rca_binaryname,
> +		sizeof(tas_priv->rca_binaryname), "%sRCA%d.bin",
> +		tas_priv->dev_name, tas_priv->index);
> +	if (ret <= 0) {
> +		dev_err(tas_priv->dev, "rca name err:0x%08x\n", ret);
> +		return ret;
> +	}
> +	crc8_populate_msb(tas_priv->crc8_lkp_tbl, TASDEVICE_CRC8_POLYNOMIAL);
> +	tas_priv->codec = codec;
> +	ret = request_firmware_nowait(module, FW_ACTION_UEVENT,
> +		tas_priv->rca_binaryname, tas_priv->dev, GFP_KERNEL, tas_priv,
> +		cont);
> +	if (ret)
> +		dev_err(tas_priv->dev, "request_firmware_nowait err:0x%08x\n",
> +			ret);
> +
> +	return ret;
> +}
> +
> +static void tasdevice_spi_init(struct tasdevice_priv *tas_priv)
> +{
> +	tas_priv->cur_prog = -1;
> +	tas_priv->cur_conf = -1;
> +
> +	tas_priv->cur_book = -1;
> +	tas_priv->cur_prog = -1;
> +	tas_priv->cur_conf = -1;
> +
> +	/* Store default registers address for calibration data. */
> +	tas_priv->cali_reg_array[0] = TASDEVICE_REG(0, 0x17, 0x74);
> +	tas_priv->cali_reg_array[1] = TASDEVICE_REG(0, 0x18, 0x0c);
> +	tas_priv->cali_reg_array[2] = TASDEVICE_REG(0, 0x18, 0x14);
> +	tas_priv->cali_reg_array[3] = TASDEVICE_REG(0, 0x13, 0x70);
> +	tas_priv->cali_reg_array[4] = TASDEVICE_REG(0, 0x18, 0x7c);
> +
> +	mutex_init(&tas_priv->codec_lock);
> +}
> +
> +static int tasdevice_spi_amp_putvol(struct tasdevice_priv *tas_priv,
> +				    struct snd_ctl_elem_value *ucontrol,
> +				    struct soc_mixer_control *mc)
> +{
> +	unsigned int invert = mc->invert;
> +	unsigned char mask;
> +	int max = mc->max;
> +	int val, ret;
> +
> +	mask = rounddown_pow_of_two(max);
> +	mask <<= mc->shift;
> +	val =  clamp(invert ? max - ucontrol->value.integer.value[0] :
> +		ucontrol->value.integer.value[0], 0, max);
> +	ret = tasdevice_spi_dev_update_bits(tas_priv,
> +		mc->reg, mask, (unsigned int)(val << mc->shift));
> +	if (ret)
> +		dev_err(tas_priv->dev, "set AMP vol error in dev %d\n",
> +			tas_priv->index);
> +
> +	return ret;
> +}
> +
> +static int tasdevice_spi_amp_getvol(struct tasdevice_priv *tas_priv,
> +				    struct snd_ctl_elem_value *ucontrol,
> +				    struct soc_mixer_control *mc)
> +{
> +	unsigned int invert = mc->invert;
> +	unsigned char mask = 0;
> +	int max = mc->max;
> +	int ret, val;
> +
> +	/* Read the primary device */
> +	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "%s, get AMP vol error\n", __func__);
> +		return ret;
> +	}
> +
> +	mask = rounddown_pow_of_two(max);
> +	mask <<= mc->shift;
> +	val = (val & mask) >> mc->shift;
> +	val = clamp(invert ? max - val : val, 0, max);
> +	ucontrol->value.integer.value[0] = val;
> +
> +	return ret;
> +}
> +
> +static int tasdevice_spi_digital_putvol(struct tasdevice_priv *tas_priv,
> +					struct snd_ctl_elem_value *ucontrol,
> +					struct soc_mixer_control *mc)
> +{
> +	unsigned int invert = mc->invert;
> +	int max = mc->max;
> +	int val, ret;
> +
> +	val = clamp(invert ? max - ucontrol->value.integer.value[0] :
> +		ucontrol->value.integer.value[0], 0, max);
> +	ret = tasdevice_spi_dev_write(tas_priv, mc->reg, (unsigned int)val);
> +	if (ret)
> +		dev_err(tas_priv->dev, "set digital vol err in dev %d\n",
> +			tas_priv->index);
> +
> +	return ret;
> +}
> +
> +static int tasdevice_spi_digital_getvol(struct tasdevice_priv *tas_priv,
> +					struct snd_ctl_elem_value *ucontrol,
> +					struct soc_mixer_control *mc)
> +{
> +	unsigned int invert = mc->invert;
> +	int max = mc->max;
> +	int ret, val;
> +
> +	/* Read the primary device as the whole */
> +	ret = tasdevice_spi_dev_read(tas_priv, mc->reg, &val);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "%s, get digital vol err\n", __func__);
> +		return ret;
> +	}
> +
> +	val = clamp(invert ? max - val : val, 0, max);
> +	ucontrol->value.integer.value[0] = val;
> +
> +	return ret;
> +}
> +
> +static int tas2781_read_acpi(struct tas2781_hda *tas_hda,
> +			     const char *hid,
> +			     int id)
> +{
> +	struct tasdevice_priv *p = tas_hda->priv;
> +	struct acpi_device *adev;
> +	struct device *physdev;
> +	u32 values[HDA_MAX_COMPONENTS];
> +	const char *property;
> +	size_t nval;
> +	int ret, i;
> +
> +	adev = acpi_dev_get_first_match_dev(hid, NULL, -1);
> +	if (!adev) {
> +		dev_err(p->dev, "Failed to find ACPI device: %s\n", hid);
> +		return -ENODEV;
> +	}
> +
> +	strscpy(p->dev_name, hid, sizeof(p->dev_name));
> +	tas_hda->dacpi = adev;
> +	physdev = get_device(acpi_get_first_physical_node(adev));
> +	acpi_dev_put(adev);
> +
> +	property = "ti,dev-index";
> +	ret = device_property_count_u32(physdev, property);
> +	if (ret <= 0 || ret > ARRAY_SIZE(values)) {
> +		ret = -EINVAL;
> +		goto err;
> +	}
> +	nval = ret;
> +
> +	ret = device_property_read_u32_array(physdev, property, values, nval);
> +	if (ret)
> +		goto err;
> +
> +	p->index = U8_MAX;
> +	for (i = 0; i < nval; i++) {
> +		if (values[i] == id) {
> +			p->index = i;
> +			break;
> +		}
> +	}
> +	if (p->index == U8_MAX) {
> +		dev_dbg(p->dev, "No index found in %s\n", property);
> +		ret = -ENODEV;
> +		goto err;
> +	}
> +
> +	if (p->index == 0) {
> +		/* All of amps share same RESET pin. */
> +		p->reset = devm_gpiod_get_index_optional(physdev, "reset",
> +			p->index, GPIOD_OUT_LOW);
> +		if (IS_ERR(p->reset)) {
> +			dev_err_probe(p->dev, ret, "Failed on reset GPIO\n");
> +			goto err;
> +		}
> +	}
> +	put_device(physdev);
> +
> +	return 0;
> +err:
> +	dev_err(p->dev, "read acpi error, ret: %d\n", ret);
> +	put_device(physdev);
> +	acpi_dev_put(adev);
> +
> +	return ret;
> +}
> +
> +static void tas2781_hda_playback_hook(struct device *dev, int action)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +
> +	if (action == HDA_GEN_PCM_ACT_OPEN) {
> +		pm_runtime_get_sync(dev);
> +		guard(mutex)(&tas_hda->priv->codec_lock);
> +		tasdevice_spi_tuning_switch(tas_hda->priv, 0);
> +	} else if (action == HDA_GEN_PCM_ACT_CLOSE) {
> +		guard(mutex)(&tas_hda->priv->codec_lock);
> +		tasdevice_spi_tuning_switch(tas_hda->priv, 1);
> +		pm_runtime_mark_last_busy(dev);
> +		pm_runtime_put_autosuspend(dev);
> +	}
> +}
> +
> +static int tasdevice_info_profile(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_info *uinfo)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = tas_priv->rcabin.ncfgs - 1;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_get_profile_id(struct snd_kcontrol *kcontrol,
> +	struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = tas_priv->rcabin.profile_cfg_id;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_set_profile_id(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	int max = tas_priv->rcabin.ncfgs - 1;
> +	int val;
> +
> +	val = clamp(ucontrol->value.integer.value[0], 0, max);
> +	if (tas_priv->rcabin.profile_cfg_id != val) {
> +		tas_priv->rcabin.profile_cfg_id = val;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tasdevice_info_programs(struct snd_kcontrol *kcontrol,
> +				   struct snd_ctl_elem_info *uinfo)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = tas_priv->fmw->nr_programs - 1;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_info_config(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_info *uinfo)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	uinfo->type = SNDRV_CTL_ELEM_TYPE_INTEGER;
> +	uinfo->count = 1;
> +	uinfo->value.integer.min = 0;
> +	uinfo->value.integer.max = tas_priv->fmw->nr_configurations - 1;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_program_get(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = tas_priv->cur_prog;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_program_put(struct snd_kcontrol *kcontrol,
> +				 struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	int nr_program = ucontrol->value.integer.value[0];
> +	int max = tas_priv->fmw->nr_programs - 1;
> +	int val;
> +
> +	val = clamp(nr_program, 0, max);
> +
> +	if (tas_priv->cur_prog != val) {
> +		tas_priv->cur_prog = val;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +static int tasdevice_config_get(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = tas_priv->cur_conf;
> +
> +	return 0;
> +}
> +
> +static int tasdevice_config_put(struct snd_kcontrol *kcontrol,
> +				struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	int max = tas_priv->fmw->nr_configurations - 1;
> +	int val;
> +
> +	val = clamp(ucontrol->value.integer.value[0], 0, max);
> +
> +	if (tas_priv->cur_conf != val) {
> +		tas_priv->cur_conf = val;
> +		return 1;
> +	}
> +
> +	return 0;
> +}
> +
> +/*
> + * tas2781_digital_getvol - get the volum control
> + * @kcontrol: control pointer
> + * @ucontrol: User data
> + *
> + * Customer Kcontrol for tas2781 is primarily for regmap booking, paging
> + * depends on internal regmap mechanism.
> + * tas2781 contains book and page two-level register map, especially
> + * book switching will set the register BXXP00R7F, after switching to the
> + * correct book, then leverage the mechanism for paging to access the
> + * register.
> + *
> + * Return 0 if succeeded.
> + */
> +static int tas2781_digital_getvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	return tasdevice_spi_digital_getvol(tas_priv, ucontrol, mc);
> +}
> +
> +static int tas2781_amp_getvol(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	return tasdevice_spi_amp_getvol(tas_priv, ucontrol, mc);
> +}
> +
> +static int tas2781_digital_putvol(struct snd_kcontrol *kcontrol,
> +				  struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	/* The check of the given value is in tasdevice_digital_putvol. */
> +	return tasdevice_spi_digital_putvol(tas_priv, ucontrol, mc);
> +}
> +
> +static int tas2781_amp_putvol(struct snd_kcontrol *kcontrol,
> +			      struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	struct soc_mixer_control *mc =
> +		(struct soc_mixer_control *)kcontrol->private_value;
> +
> +	/* The check of the given value is in tasdevice_amp_putvol. */
> +	return tasdevice_spi_amp_putvol(tas_priv, ucontrol, mc);
> +}
> +
> +static int tas2781_force_fwload_get(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +
> +	ucontrol->value.integer.value[0] = (int)tas_priv->force_fwload_status;
> +	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
> +		str_on_off(tas_priv->force_fwload_status));
> +
> +	return 0;
> +}
> +
> +static int tas2781_force_fwload_put(struct snd_kcontrol *kcontrol,
> +				    struct snd_ctl_elem_value *ucontrol)
> +{
> +	struct tasdevice_priv *tas_priv = snd_kcontrol_chip(kcontrol);
> +	bool change, val = (bool)ucontrol->value.integer.value[0];
> +
> +	if (tas_priv->force_fwload_status == val) {
> +		change = false;
> +	} else {
> +		change = true;
> +		tas_priv->force_fwload_status = val;
> +	}
> +	dev_dbg(tas_priv->dev, "%s : Force FWload %s\n", __func__,
> +		str_on_off(tas_priv->force_fwload_status));
> +
> +	return change;
> +}
> +
> +static const struct snd_kcontrol_new tas2781_snd_controls[] = {
> +	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 0", TAS2781_AMP_LEVEL,
> +		1, 0, 20, 0, tas2781_amp_getvol,
> +		tas2781_amp_putvol, amp_vol_tlv),
> +	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 0", TAS2781_DVC_LVL,
> +		0, 0, 200, 1, tas2781_digital_getvol,
> +		tas2781_digital_putvol, dvc_tlv),
> +	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 0", 0,
> +		tas2781_force_fwload_get, tas2781_force_fwload_put),
> +	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Analog Gain 1", TAS2781_AMP_LEVEL,
> +		1, 0, 20, 0, tas2781_amp_getvol,
> +		tas2781_amp_putvol, amp_vol_tlv),
> +	ACARD_SINGLE_RANGE_EXT_TLV("Speaker Digital Gain 1", TAS2781_DVC_LVL,
> +		0, 0, 200, 1, tas2781_digital_getvol,
> +		tas2781_digital_putvol, dvc_tlv),
> +	ACARD_SINGLE_BOOL_EXT("Speaker Force Firmware Load 1", 0,
> +		tas2781_force_fwload_get, tas2781_force_fwload_put),
> +};
> +
> +static const struct snd_kcontrol_new tas2781_prof_ctrl[] = {
> +{
> +	.name = "Speaker Profile Id - 0",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_profile,
> +	.get = tasdevice_get_profile_id,
> +	.put = tasdevice_set_profile_id,
> +},
> +{
> +	.name = "Speaker Profile Id - 1",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_profile,
> +	.get = tasdevice_get_profile_id,
> +	.put = tasdevice_set_profile_id,
> +},
> +};
> +static const struct snd_kcontrol_new tas2781_dsp_prog_ctrl[] = {
> +{
> +	.name = "Speaker Program Id 0",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_programs,
> +	.get = tasdevice_program_get,
> +	.put = tasdevice_program_put,
> +},
> +{
> +	.name = "Speaker Program Id 1",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_programs,
> +	.get = tasdevice_program_get,
> +	.put = tasdevice_program_put,
> +},
> +};
> +
> +static const struct snd_kcontrol_new tas2781_dsp_conf_ctrl[] = {
> +{
> +	.name = "Speaker Config Id 0",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_config,
> +	.get = tasdevice_config_get,
> +	.put = tasdevice_config_put,
> +},
> +{
> +	.name = "Speaker Config Id 1",
> +	.iface = SNDRV_CTL_ELEM_IFACE_CARD,
> +	.info = tasdevice_info_config,
> +	.get = tasdevice_config_get,
> +	.put = tasdevice_config_put,
> +},
> +};
> +
> +static void tas2781_apply_calib(struct tasdevice_priv *tas_priv)
> +{
> +	int i, rc;
> +
> +	/*
> +	 * If no calibration data exist in tasdevice_priv *tas_priv,
> +	 * calibration apply will be ignored, and use default values
> +	 * in firmware binary, which was loaded during firmware download.
> +	 */
> +	if (tas_priv->cali_data[0] == 0)
> +		return;
> +	/*
> +	 * Calibration data was saved in tasdevice_priv *tas_priv as:
> +	 * unsigned int cali_data[CALIB_MAX];
> +	 * and every data (in 4 bytes) will be saved in register which in
> +	 * book 0, and page number in page_array[], offset was saved in
> +	 * rgno_array[].
> +	 */
> +	for (i = 0; i < CALIB_MAX; i++) {
> +		rc = tasdevice_spi_dev_bulk_write(tas_priv,
> +			tas_priv->cali_reg_array[i],
> +			(unsigned char *)&tas_priv->cali_data[i], 4);
> +		if (rc < 0)
> +			dev_err(tas_priv->dev,
> +				"chn %d calib %d bulk_wr err = %d\n",
> +				tas_priv->index, i, rc);
> +	}
> +}
> +
> +/*
> + * Update the calibration data, including speaker impedance, f0, etc,
> + * into algo. Calibrate data is done by manufacturer in the factory.
> + * These data are used by Algo for calculating the speaker temperature,
> + * speaker membrane excursion and f0 in real time during playback.
> + * Calibration data format in EFI is V2, since 2024.
> + */
> +static int tas2781_save_calibration(struct tasdevice_priv *tas_priv)
> +{
> +	/*
> +	 * GUID was used for data access in BIOS, it was provided by board
> +	 * manufactory, like HP: "{02f9af02-7734-4233-b43d-93fe5aa35db3}"
> +	 */
> +	efi_guid_t efi_guid =
> +		EFI_GUID(0x02f9af02, 0x7734, 0x4233,
> +			 0xb4, 0x3d, 0x93, 0xfe, 0x5a, 0xa3, 0x5d, 0xb3);
> +	static efi_char16_t efi_name[] = TASDEVICE_CALIBRATION_DATA_NAME;
> +	unsigned char data[TASDEVICE_CALIBRATION_DATA_SIZE], *buf;
> +	unsigned int attr, crc, offset, *tmp_val;
> +	struct tm *tm = &tas_priv->tm;
> +	unsigned long total_sz = 0;
> +	efi_status_t status;
> +
> +	tas_priv->cali_data[0] = 0;
> +	status = efi.get_variable(efi_name, &efi_guid, &attr, &total_sz, data);
> +	if (status == EFI_BUFFER_TOO_SMALL) {
> +		if (total_sz > TASDEVICE_CALIBRATION_DATA_SIZE)
> +			return -ENOMEM;
> +		/* Get variable contents into buffer */
> +		status = efi.get_variable(efi_name, &efi_guid, &attr,
> +			&total_sz, data);
> +	}
> +	if (status != EFI_SUCCESS)
> +		return status;
> +
> +	tmp_val = (unsigned int *)data;
> +	if (tmp_val[0] == 2781) {
> +		/*
> +		 * New features were added in calibrated Data V3:
> +		 *     1. Added calibration registers address define in
> +		 *     a node, marked as Device id == 0x80.
> +		 * New features were added in calibrated Data V2:
> +		 *     1. Added some the fields to store the link_id and
> +		 *     uniqie_id for multi-link solutions
> +		 *     2. Support flexible number of devices instead of
> +		 *     fixed one in V1.
> +		 * Layout of calibrated data V2 in UEFI(total 256 bytes):
> +		 *     ChipID (2781, 4 bytes)
> +		 *     Device-Sum (4 bytes)
> +		 *     TimeStamp of Calibration (4 bytes)
> +		 *     for (i = 0; i < Device-Sum; i++) {
> +		 *             Device #i index_info () {
> +		 *                     SDW link id (2bytes)
> +		 *                     SDW unique_id (2bytes)
> +		 *             } // if Device number is 0x80, mean it's
> +		 *                  calibration registers address.
> +		 *             Calibrated Data of Device #i (20 bytes)
> +		 *     }
> +		 *     CRC (4 bytes)
> +		 *     Reserved (the rest)
> +		 */
> +		crc = crc32(~0, data, (3 + tmp_val[1] * 6) * 4) ^ ~0;
> +
> +		if (crc != tmp_val[3 + tmp_val[1] * 6])
> +			return 0;
> +
> +		time64_to_tm(tmp_val[2], 0, tm);
> +		for (int j = 0; j < tmp_val[1]; j++) {
> +			offset = j * 6 + 3;
> +			if (tmp_val[offset] == tas_priv->index) {
> +				for (int i = 0; i < CALIB_MAX; i++)
> +					tas_priv->cali_data[i] =
> +					tmp_val[offset + i + 1];
> +			} else if (tmp_val[offset] ==
> +				   TASDEVICE_CALIBRATION_REG_ADDRESS) {
> +				for (int i = 0; i < CALIB_MAX; i++) {
> +					buf = &data[(offset + i + 1) * 4];
> +					tas_priv->cali_reg_array[i] =
> +						TASDEVICE_REG(buf[1], buf[2],
> +						      buf[3]);
> +				}
> +			}
> +			tas_priv->apply_calibration(tas_priv);
> +		}
> +	} else {
> +		/*
> +		 * Calibration data is in V1 format.
> +		 * struct cali_data {
> +		 *      char cali_data[20];
> +		 * }
> +		 *
> +		 * struct {
> +		 *      struct cali_data cali_data[4];
> +		 *      int  TimeStamp of Calibration (4 bytes)
> +		 *      int CRC (4 bytes)
> +		 * } ueft;
> +		 */
> +		crc = crc32(~0, data, 84) ^ ~0;
> +		if (crc == tmp_val[21]) {
> +			time64_to_tm(tmp_val[20], 0, tm);
> +			for (int i = 0; i < CALIB_MAX; i++)
> +				tas_priv->cali_data[i] =
> +					tmp_val[tas_priv->index * 5 + i];
> +			tas_priv->apply_calibration(tas_priv);
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void tas2781_hda_remove_controls(struct tas2781_hda *tas_hda)
> +{
> +	struct hda_codec *codec = tas_hda->priv->codec;
> +
> +	snd_ctl_remove(codec->card, tas_hda->dsp_prog_ctl);
> +
> +	snd_ctl_remove(codec->card, tas_hda->dsp_conf_ctl);
> +
> +	for (int i = ARRAY_SIZE(tas_hda->snd_ctls) - 1; i >= 0; i--)
> +		snd_ctl_remove(codec->card, tas_hda->snd_ctls[i]);
> +
> +	snd_ctl_remove(codec->card, tas_hda->prof_ctl);
> +}
> +
> +static void tasdev_fw_ready(const struct firmware *fmw, void *context)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(tas_priv->dev);
> +	struct hda_codec *codec = tas_priv->codec;
> +	int i, j, ret;
> +
> +	pm_runtime_get_sync(tas_priv->dev);
> +	guard(mutex)(&tas_priv->codec_lock);
> +
> +	ret = tasdevice_spi_rca_parser(tas_priv, fmw);
> +	if (ret)
> +		goto out;
> +
> +	/* Add control one time only. */
> +	tas_hda->prof_ctl = snd_ctl_new1(&tas2781_prof_ctrl[tas_priv->index],
> +		tas_priv);
> +	ret = snd_ctl_add(codec->card, tas_hda->prof_ctl);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
> +			tas2781_prof_ctrl[tas_priv->index].name, ret);
> +		goto out;
> +	}
> +	j = tas_priv->index * ARRAY_SIZE(tas2781_snd_controls) / 2;
> +	for (i = 0; i < 3; i++) {
> +		tas_hda->snd_ctls[i] = snd_ctl_new1(&tas2781_snd_controls[i+j],
> +			tas_priv);
> +		ret = snd_ctl_add(codec->card, tas_hda->snd_ctls[i]);
> +		if (ret) {
> +			dev_err(tas_priv->dev,
> +				"Failed to add KControl %s = %d\n",
> +				tas2781_snd_controls[i+tas_priv->index*3].name,
> +				ret);
> +			goto out;
> +		}
> +	}
> +
> +	tasdevice_spi_dsp_remove(tas_priv);
> +
> +	tas_priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> +	scnprintf(tas_priv->coef_binaryname, 64, "TAS2XXX%08X-%01d.bin",
> +		codec->core.subsystem_id, tas_priv->index);
> +	ret = tasdevice_spi_dsp_parser(tas_priv);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "dspfw load %s error\n",
> +			tas_priv->coef_binaryname);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		goto out;
> +	}
> +
> +	/* Add control one time only. */
> +	tas_hda->dsp_prog_ctl =
> +		snd_ctl_new1(&tas2781_dsp_prog_ctrl[tas_priv->index],
> +			     tas_priv);
> +	ret = snd_ctl_add(codec->card, tas_hda->dsp_prog_ctl);
> +	if (ret) {
> +		dev_err(tas_priv->dev,
> +			"Failed to add KControl %s = %d\n",
> +			tas2781_dsp_prog_ctrl[tas_priv->index].name, ret);
> +		goto out;
> +	}
> +
> +	tas_hda->dsp_conf_ctl =
> +		snd_ctl_new1(&tas2781_dsp_conf_ctrl[tas_priv->index],
> +			     tas_priv);
> +	ret = snd_ctl_add(codec->card, tas_hda->dsp_conf_ctl);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "Failed to add KControl %s = %d\n",
> +			tas2781_dsp_conf_ctrl[tas_priv->index].name, ret);
> +		goto out;
> +	}
> +
> +	/* Perform AMP reset before firmware download. */
> +	tas_priv->rcabin.profile_cfg_id = TAS2781_PRE_POST_RESET_CFG;
> +	tasdevice_spi_tuning_switch(tas_priv, 0);
> +	tas2781_spi_reset(tas_priv);
> +	tas_priv->rcabin.profile_cfg_id = 0;
> +	tasdevice_spi_tuning_switch(tas_priv, 1);
> +
> +	tas_priv->fw_state = TASDEVICE_DSP_FW_ALL_OK;
> +	ret = tasdevice_spi_prmg_load(tas_priv, 0);
> +	if (ret < 0) {
> +		dev_err(tas_priv->dev, "FW download failed = %d\n", ret);
> +		goto out;
> +	}
> +	if (tas_priv->fmw->nr_programs > 0)
> +		tas_priv->cur_prog = 0;
> +	if (tas_priv->fmw->nr_configurations > 0)
> +		tas_priv->cur_conf = 0;
> +
> +	/*
> +	 * If calibrated data occurs error, dsp will still works with default
> +	 * calibrated data inside algo.
> +	 */
> +	tas_priv->save_calibration(tas_priv);
> +
> +out:
> +	if (fmw)
> +		release_firmware(fmw);
> +	pm_runtime_mark_last_busy(tas_hda->priv->dev);
> +	pm_runtime_put_autosuspend(tas_hda->priv->dev);
> +}
> +
> +static int tas2781_hda_bind(struct device *dev, struct device *master,
> +	void *master_data)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	struct hda_component_parent *parent = master_data;
> +	struct hda_component *comp;
> +	struct hda_codec *codec;
> +	int ret;
> +
> +	comp = hda_component_from_index(parent, tas_hda->priv->index);
> +	if (!comp)
> +		return -EINVAL;
> +
> +	if (comp->dev)
> +		return -EBUSY;
> +
> +	codec = parent->codec;
> +
> +	pm_runtime_get_sync(dev);
> +
> +	comp->dev = dev;
> +
> +	strscpy(comp->name, dev_name(dev), sizeof(comp->name));
> +
> +	ret = tascodec_spi_init(tas_hda->priv, codec, THIS_MODULE,
> +		tasdev_fw_ready);
> +	if (!ret)
> +		comp->playback_hook = tas2781_hda_playback_hook;
> +
> +	pm_runtime_mark_last_busy(dev);
> +	pm_runtime_put_autosuspend(dev);
> +
> +	return ret;
> +}
> +
> +static void tas2781_hda_unbind(struct device *dev, struct device *master,
> +			       void *master_data)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	struct hda_component_parent *parent = master_data;
> +	struct hda_component *comp;
> +
> +	comp = hda_component_from_index(parent, tas_hda->priv->index);
> +	if (comp && (comp->dev == dev)) {
> +		comp->dev = NULL;
> +		memset(comp->name, 0, sizeof(comp->name));
> +		comp->playback_hook = NULL;
> +	}
> +
> +	tas2781_hda_remove_controls(tas_hda);
> +
> +	tasdevice_spi_config_info_remove(tas_hda->priv);
> +	tasdevice_spi_dsp_remove(tas_hda->priv);
> +
> +	tas_hda->priv->fw_state = TASDEVICE_DSP_FW_PENDING;
> +}
> +
> +static const struct component_ops tas2781_hda_comp_ops = {
> +	.bind = tas2781_hda_bind,
> +	.unbind = tas2781_hda_unbind,
> +};
> +
> +static void tas2781_hda_remove(struct device *dev)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +
> +	component_del(tas_hda->priv->dev, &tas2781_hda_comp_ops);
> +
> +	pm_runtime_get_sync(tas_hda->priv->dev);
> +	pm_runtime_disable(tas_hda->priv->dev);
> +
> +	pm_runtime_put_noidle(tas_hda->priv->dev);
> +
> +	mutex_destroy(&tas_hda->priv->codec_lock);
> +}
> +
> +static int tas2781_hda_spi_probe(struct spi_device *spi)
> +{
> +	struct tasdevice_priv *tas_priv;
> +	struct tas2781_hda *tas_hda;
> +	const char *device_name;
> +	int ret = 0;
> +
> +	tas_hda = devm_kzalloc(&spi->dev, sizeof(*tas_hda), GFP_KERNEL);
> +	if (!tas_hda)
> +		return -ENOMEM;
> +
> +	spi->max_speed_hz = TAS2781_SPI_MAX_FREQ;
> +
> +	tas_priv = devm_kzalloc(&spi->dev, sizeof(*tas_priv), GFP_KERNEL);
> +	if (!tas_priv)
> +		goto err;
> +	tas_priv->dev = &spi->dev;
> +	tas_hda->priv = tas_priv;
> +	tas_priv->regmap = devm_regmap_init_spi(spi, &tasdevice_regmap);
> +	if (IS_ERR(tas_priv->regmap)) {
> +		ret = PTR_ERR(tas_priv->regmap);
> +		dev_err(tas_priv->dev, "Failed to allocate regmap: %d\n",
> +			ret);
> +		goto err;
> +	}
> +	if (strstr(dev_name(&spi->dev), "TXNW2781")) {
> +		device_name = "TXNW2781";
> +		tas_priv->save_calibration = tas2781_save_calibration;
> +		tas_priv->apply_calibration = tas2781_apply_calib;
> +	} else {
> +		goto err;
> +	}
> +
> +	tas_priv->irq = spi->irq;
> +	dev_set_drvdata(&spi->dev, tas_hda);
> +	ret = tas2781_read_acpi(tas_hda, device_name,
> +				spi_get_chipselect(spi, 0));
> +	if (ret)
> +		return dev_err_probe(tas_priv->dev, ret,
> +				     "Platform not supported\n");
> +
> +	tasdevice_spi_init(tas_priv);
> +
> +	pm_runtime_set_autosuspend_delay(tas_priv->dev, 3000);
> +	pm_runtime_use_autosuspend(tas_priv->dev);
> +	pm_runtime_mark_last_busy(tas_priv->dev);
> +	pm_runtime_set_active(tas_priv->dev);
> +	pm_runtime_get_noresume(tas_priv->dev);
> +	pm_runtime_enable(tas_priv->dev);
> +
> +	pm_runtime_put_autosuspend(tas_priv->dev);
> +
> +	ret = component_add(tas_priv->dev, &tas2781_hda_comp_ops);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "Register component fail: %d\n", ret);
> +		pm_runtime_disable(tas_priv->dev);
> +	}
> +
> +err:
> +	if (ret)
> +		tas2781_hda_remove(&spi->dev);
> +
> +	return ret;
> +}
> +
> +static void tas2781_hda_spi_remove(struct spi_device *spi)
> +{
> +	tas2781_hda_remove(&spi->dev);
> +}
> +
> +static int tas2781_runtime_suspend(struct device *dev)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&tas_hda->priv->codec_lock);
> +
> +	tasdevice_spi_tuning_switch(tas_hda->priv, 1);
> +
> +	tas_hda->priv->cur_book = -1;
> +	tas_hda->priv->cur_conf = -1;
> +
> +	return 0;
> +}
> +
> +static int tas2781_runtime_resume(struct device *dev)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +
> +	guard(mutex)(&tas_hda->priv->codec_lock);
> +
> +	tasdevice_spi_tuning_switch(tas_hda->priv, 0);
> +
> +	return 0;
> +}
> +
> +static int tas2781_system_suspend(struct device *dev)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = pm_runtime_force_suspend(dev);
> +	if (ret)
> +		return ret;
> +
> +	/* Shutdown chip before system suspend */
> +	tasdevice_spi_tuning_switch(tas_hda->priv, 1);
> +	tas2781_spi_reset(tas_hda->priv);
> +	/*
> +	 * Reset GPIO may be shared, so cannot reset here.
> +	 * However beyond this point, amps may be powered down.
> +	 */
> +	return 0;
> +}
> +
> +static int tas2781_system_resume(struct device *dev)
> +{
> +	struct tas2781_hda *tas_hda = dev_get_drvdata(dev);
> +	int ret, val;
> +
> +	ret = pm_runtime_force_resume(dev);
> +	if (ret)
> +		return ret;
> +
> +	guard(mutex)(&tas_hda->priv->codec_lock);
> +	ret = tasdevice_spi_dev_read(tas_hda->priv, TAS2781_REG_CLK_CONFIG,
> +				     &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (val == TAS2781_REG_CLK_CONFIG_RESET) {
> +		tas_hda->priv->cur_book = -1;
> +		tas_hda->priv->cur_conf = -1;
> +		tas_hda->priv->cur_prog = -1;
> +
> +		ret = tasdevice_spi_prmg_load(tas_hda->priv, 0);
> +		if (ret < 0) {
> +			dev_err(tas_hda->priv->dev,
> +				"FW download failed = %d\n", ret);
> +			return ret;
> +		}
> +
> +		if (tas_hda->priv->playback_started)
> +			tasdevice_spi_tuning_switch(tas_hda->priv, 0);
> +	}
> +
> +	return ret;
> +}
> +
> +static const struct dev_pm_ops tas2781_hda_pm_ops = {
> +	RUNTIME_PM_OPS(tas2781_runtime_suspend, tas2781_runtime_resume, NULL)
> +	SYSTEM_SLEEP_PM_OPS(tas2781_system_suspend, tas2781_system_resume)
> +};
> +
> +static const struct spi_device_id tas2781_hda_spi_id[] = {
> +	{ "tas2781-hda", },
> +	{}
> +};
> +
> +static const struct acpi_device_id tas2781_acpi_hda_match[] = {
> +	{"TXNW2781", },
> +	{}
> +};
> +MODULE_DEVICE_TABLE(acpi, tas2781_acpi_hda_match);
> +
> +static struct spi_driver tas2781_hda_spi_driver = {
> +	.driver = {
> +		.name		= "tas2781-hda",
> +		.acpi_match_table = tas2781_acpi_hda_match,
> +		.pm		= &tas2781_hda_pm_ops,
> +	},
> +	.id_table	= tas2781_hda_spi_id,
> +	.probe		= tas2781_hda_spi_probe,
> +	.remove		= tas2781_hda_spi_remove,
> +};
> +module_spi_driver(tas2781_hda_spi_driver);
> +
> +MODULE_DESCRIPTION("TAS2781 HDA SPI Driver");
> +MODULE_AUTHOR("Baojun, Xu, <baojun.xug@ti.com>");
> +MODULE_LICENSE("GPL");
> diff --git a/sound/pci/hda/tas2781_spi_fwlib.c b/sound/pci/hda/tas2781_spi_fwlib.c
> new file mode 100644
> index 000000000000..a9673a75ab5e
> --- /dev/null
> +++ b/sound/pci/hda/tas2781_spi_fwlib.c
> @@ -0,0 +1,2006 @@
> +// SPDX-License-Identifier: GPL-2.0
> +//
> +// TAS2781 HDA SPI driver
> +//
> +// Copyright 2024 Texas Instruments, Inc.
> +//
> +// Author: Baojun Xu <baojun.xu@ti.com>
> +
> +#include <linux/crc8.h>
> +#include <linux/firmware.h>
> +#include <linux/init.h>
> +#include <linux/interrupt.h>
> +#include <linux/module.h>
> +#include <linux/slab.h>
> +#include <linux/types.h>
> +#include <linux/unaligned.h>
> +#include <sound/pcm_params.h>
> +#include <sound/soc.h>
> +#include <sound/tas2781-dsp.h>
> +#include <sound/tlv.h>
> +
> +#include "tas2781-spi.h"
> +
> +#define OFFSET_ERROR_BIT			BIT(31)
> +
> +#define ERROR_PRAM_CRCCHK			0x0000000
> +#define ERROR_YRAM_CRCCHK			0x0000001
> +#define PPC_DRIVER_CRCCHK			0x00000200
> +
> +#define TAS2781_SA_COEFF_SWAP_REG		TASDEVICE_REG(0, 0x35, 0x2c)
> +#define TAS2781_YRAM_BOOK1			140
> +#define TAS2781_YRAM1_PAGE			42
> +#define TAS2781_YRAM1_START_REG			88
> +
> +#define TAS2781_YRAM2_START_PAGE		43
> +#define TAS2781_YRAM2_END_PAGE			49
> +#define TAS2781_YRAM2_START_REG			8
> +#define TAS2781_YRAM2_END_REG			127
> +
> +#define TAS2781_YRAM3_PAGE			50
> +#define TAS2781_YRAM3_START_REG			8
> +#define TAS2781_YRAM3_END_REG			27
> +
> +/* should not include B0_P53_R44-R47 */
> +#define TAS2781_YRAM_BOOK2			0
> +#define TAS2781_YRAM4_START_PAGE		50
> +#define TAS2781_YRAM4_END_PAGE			60
> +
> +#define TAS2781_YRAM5_PAGE			61
> +#define TAS2781_YRAM5_START_REG			TAS2781_YRAM3_START_REG
> +#define TAS2781_YRAM5_END_REG			TAS2781_YRAM3_END_REG
> +
> +#define TASDEVICE_MAXPROGRAM_NUM_KERNEL			5
> +#define TASDEVICE_MAXCONFIG_NUM_KERNEL_MULTIPLE_AMPS	64
> +#define TASDEVICE_MAXCONFIG_NUM_KERNEL			10
> +#define MAIN_ALL_DEVICES_1X				0x01
> +#define MAIN_DEVICE_A_1X				0x02
> +#define MAIN_DEVICE_B_1X				0x03
> +#define MAIN_DEVICE_C_1X				0x04
> +#define MAIN_DEVICE_D_1X				0x05
> +#define COEFF_DEVICE_A_1X				0x12
> +#define COEFF_DEVICE_B_1X				0x13
> +#define COEFF_DEVICE_C_1X				0x14
> +#define COEFF_DEVICE_D_1X				0x15
> +#define PRE_DEVICE_A_1X					0x22
> +#define PRE_DEVICE_B_1X					0x23
> +#define PRE_DEVICE_C_1X					0x24
> +#define PRE_DEVICE_D_1X					0x25
> +#define PRE_SOFTWARE_RESET_DEVICE_A			0x41
> +#define PRE_SOFTWARE_RESET_DEVICE_B			0x42
> +#define PRE_SOFTWARE_RESET_DEVICE_C			0x43
> +#define PRE_SOFTWARE_RESET_DEVICE_D			0x44
> +#define POST_SOFTWARE_RESET_DEVICE_A			0x45
> +#define POST_SOFTWARE_RESET_DEVICE_B			0x46
> +#define POST_SOFTWARE_RESET_DEVICE_C			0x47
> +#define POST_SOFTWARE_RESET_DEVICE_D			0x48
> +
> +struct tas_crc {
> +	unsigned char offset;
> +	unsigned char len;
> +};
> +
> +struct blktyp_devidx_map {
> +	unsigned char blktyp;
> +	unsigned char dev_idx;
> +};
> +
> +/* fixed m68k compiling issue: mapping table can save code field */
> +static const struct blktyp_devidx_map ppc3_tas2781_mapping_table[] = {
> +	{ MAIN_ALL_DEVICES_1X, 0x80 },
> +	{ MAIN_DEVICE_A_1X, 0x81 },
> +	{ COEFF_DEVICE_A_1X, 0x81 },
> +	{ PRE_DEVICE_A_1X, 0x81 },
> +	{ PRE_SOFTWARE_RESET_DEVICE_A, 0xC1 },
> +	{ POST_SOFTWARE_RESET_DEVICE_A, 0xC1 },
> +	{ MAIN_DEVICE_B_1X, 0x82 },
> +	{ COEFF_DEVICE_B_1X, 0x82 },
> +	{ PRE_DEVICE_B_1X, 0x82 },
> +	{ PRE_SOFTWARE_RESET_DEVICE_B, 0xC2 },
> +	{ POST_SOFTWARE_RESET_DEVICE_B, 0xC2 },
> +	{ MAIN_DEVICE_C_1X, 0x83 },
> +	{ COEFF_DEVICE_C_1X, 0x83 },
> +	{ PRE_DEVICE_C_1X, 0x83 },
> +	{ PRE_SOFTWARE_RESET_DEVICE_C, 0xC3 },
> +	{ POST_SOFTWARE_RESET_DEVICE_C, 0xC3 },
> +	{ MAIN_DEVICE_D_1X, 0x84 },
> +	{ COEFF_DEVICE_D_1X, 0x84 },
> +	{ PRE_DEVICE_D_1X, 0x84 },
> +	{ PRE_SOFTWARE_RESET_DEVICE_D, 0xC4 },
> +	{ POST_SOFTWARE_RESET_DEVICE_D, 0xC4 },
> +};
> +
> +static const struct blktyp_devidx_map ppc3_mapping_table[] = {
> +	{ MAIN_ALL_DEVICES_1X, 0x80 },
> +	{ MAIN_DEVICE_A_1X, 0x81 },
> +	{ COEFF_DEVICE_A_1X, 0xC1 },
> +	{ PRE_DEVICE_A_1X, 0xC1 },
> +	{ MAIN_DEVICE_B_1X, 0x82 },
> +	{ COEFF_DEVICE_B_1X, 0xC2 },
> +	{ PRE_DEVICE_B_1X, 0xC2 },
> +	{ MAIN_DEVICE_C_1X, 0x83 },
> +	{ COEFF_DEVICE_C_1X, 0xC3 },
> +	{ PRE_DEVICE_C_1X, 0xC3 },
> +	{ MAIN_DEVICE_D_1X, 0x84 },
> +	{ COEFF_DEVICE_D_1X, 0xC4 },
> +	{ PRE_DEVICE_D_1X, 0xC4 },
> +};
> +
> +static const struct blktyp_devidx_map non_ppc3_mapping_table[] = {
> +	{ MAIN_ALL_DEVICES, 0x80 },
> +	{ MAIN_DEVICE_A, 0x81 },
> +	{ COEFF_DEVICE_A, 0xC1 },
> +	{ PRE_DEVICE_A, 0xC1 },
> +	{ MAIN_DEVICE_B, 0x82 },
> +	{ COEFF_DEVICE_B, 0xC2 },
> +	{ PRE_DEVICE_B, 0xC2 },
> +	{ MAIN_DEVICE_C, 0x83 },
> +	{ COEFF_DEVICE_C, 0xC3 },
> +	{ PRE_DEVICE_C, 0xC3 },
> +	{ MAIN_DEVICE_D, 0x84 },
> +	{ COEFF_DEVICE_D, 0xC4 },
> +	{ PRE_DEVICE_D, 0xC4 },
> +};
> +
> +/*
> + * Device support different configurations for different scene,
> + * like voice, music, calibration, was write in regbin file.
> + * Will be stored into tas_priv after regbin was loaded.
> + */
> +static struct tasdevice_config_info *tasdevice_add_config(
> +	struct tasdevice_priv *tas_priv, unsigned char *config_data,
> +	unsigned int config_size, int *status)
> +{
> +	struct tasdevice_config_info *cfg_info;
> +	struct tasdev_blk_data **bk_da;
> +	unsigned int config_offset = 0;
> +	unsigned int i;
> +
> +	/*
> +	 * In most projects are many audio cases, such as music, handfree,
> +	 * receiver, games, audio-to-haptics, PMIC record, bypass mode,
> +	 * portrait, landscape, etc. Even in multiple audios, one or
> +	 * two of the chips will work for the special case, such as
> +	 * ultrasonic application. In order to support these variable-numbers
> +	 * of audio cases, flexible configs have been introduced in the
> +	 * DSP firmware.
> +	 */
> +	cfg_info = kzalloc(sizeof(*cfg_info), GFP_KERNEL);
> +	if (!cfg_info) {
> +		*status = -ENOMEM;
> +		return NULL;
> +	}
> +
> +	if (tas_priv->rcabin.fw_hdr.binary_version_num >= 0x105) {
> +		if ((config_offset + 64) > config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev, "add conf: Out of boundary\n");
> +			goto config_err;
> +		}
> +		config_offset += 64;
> +	}
> +
> +	if ((config_offset + 4) > config_size) {
> +		*status = -EINVAL;
> +		dev_err(tas_priv->dev, "add config: Out of boundary\n");
> +		goto config_err;
> +	}
> +
> +	/*
> +	 * convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host
> +	 */
> +	cfg_info->nblocks = get_unaligned_be32(&config_data[config_offset]);
> +	config_offset += 4;
> +
> +	/*
> +	 * Several kinds of dsp/algorithm firmwares can run on tas2781,
> +	 * the number and size of blk are not fixed and different among
> +	 * these firmwares.
> +	 */
> +	bk_da = cfg_info->blk_data = kcalloc(cfg_info->nblocks,
> +		sizeof(*bk_da), GFP_KERNEL);
> +	if (!bk_da) {
> +		*status = -ENOMEM;
> +		goto config_err;
> +	}
> +	cfg_info->real_nblocks = 0;
> +	for (i = 0; i < cfg_info->nblocks; i++) {
> +		if (config_offset + 12 > config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev,
> +				"%s: Out of boundary: i = %d nblocks = %u!\n",
> +				__func__, i, cfg_info->nblocks);
> +			goto block_err;
> +		}
> +		bk_da[i] = kzalloc(sizeof(*bk_da[i]), GFP_KERNEL);
> +		if (!bk_da[i]) {
> +			*status = -ENOMEM;
> +			goto block_err;
> +		}
> +
> +		bk_da[i]->dev_idx = config_data[config_offset];
> +		config_offset++;
> +
> +		bk_da[i]->block_type = config_data[config_offset];
> +		config_offset++;
> +
> +		bk_da[i]->yram_checksum =
> +			get_unaligned_be16(&config_data[config_offset]);
> +		config_offset += 2;
> +		bk_da[i]->block_size =
> +			get_unaligned_be32(&config_data[config_offset]);
> +		config_offset += 4;
> +
> +		bk_da[i]->n_subblks =
> +			get_unaligned_be32(&config_data[config_offset]);
> +
> +		config_offset += 4;
> +
> +		if (config_offset + bk_da[i]->block_size > config_size) {
> +			*status = -EINVAL;
> +			dev_err(tas_priv->dev,
> +				"%s: Out of boundary: i = %d blks = %u!\n",
> +				__func__, i, cfg_info->nblocks);
> +			goto block_err;
> +		}
> +		/* instead of kzalloc+memcpy */
> +		bk_da[i]->regdata = kmemdup(&config_data[config_offset],
> +			bk_da[i]->block_size, GFP_KERNEL);
> +		if (!bk_da[i]->regdata) {
> +			*status = -ENOMEM;
> +			i++;
> +			goto block_err;
> +		}
> +
> +		config_offset += bk_da[i]->block_size;
> +		cfg_info->real_nblocks += 1;
> +	}
> +
> +	return cfg_info;
> +block_err:
> +	for (int j = 0; j < i; j++)
> +		kfree(bk_da[j]);
> +	kfree(bk_da);
> +config_err:
> +	kfree(cfg_info);
> +	return NULL;
> +}
> +
> +/* Regbin file parser function. */
> +int tasdevice_spi_rca_parser(void *context, const struct firmware *fmw)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tasdevice_config_info **cfg_info;
> +	struct tasdevice_rca_hdr *fw_hdr;
> +	struct tasdevice_rca *rca;
> +	unsigned int total_config_sz = 0;
> +	int offset = 0, ret = 0, i;
> +	unsigned char *buf;
> +
> +	rca = &tas_priv->rcabin;
> +	fw_hdr = &rca->fw_hdr;
> +	if (!fmw || !fmw->data) {
> +		dev_err(tas_priv->dev, "Failed to read %s\n",
> +			tas_priv->rca_binaryname);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -EINVAL;
> +	}
> +	buf = (unsigned char *)fmw->data;
> +	fw_hdr->img_sz = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +	if (fw_hdr->img_sz != fmw->size) {
> +		dev_err(tas_priv->dev,
> +			"File size not match, %d %u", (int)fmw->size,
> +			fw_hdr->img_sz);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -EINVAL;
> +	}
> +
> +	fw_hdr->checksum = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +	fw_hdr->binary_version_num = get_unaligned_be32(&buf[offset]);
> +	if (fw_hdr->binary_version_num < 0x103) {
> +		dev_err(tas_priv->dev, "File version 0x%04x is too low",
> +			fw_hdr->binary_version_num);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -EINVAL;
> +	}
> +	offset += 4;
> +	fw_hdr->drv_fw_version = get_unaligned_be32(&buf[offset]);
> +	offset += 8;
> +	fw_hdr->plat_type = buf[offset++];
> +	fw_hdr->dev_family = buf[offset++];
> +	fw_hdr->reserve = buf[offset++];
> +	fw_hdr->ndev = buf[offset++];
> +	if (offset + TASDEVICE_DEVICE_SUM > fw_hdr->img_sz) {
> +		dev_err(tas_priv->dev, "rca_ready: Out of boundary!\n");
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -EINVAL;
> +	}
> +
> +	for (i = 0; i < TASDEVICE_DEVICE_SUM; i++, offset++)
> +		fw_hdr->devs[i] = buf[offset];
> +
> +	fw_hdr->nconfig = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +
> +	for (i = 0; i < TASDEVICE_CONFIG_SUM; i++) {
> +		fw_hdr->config_size[i] = get_unaligned_be32(&buf[offset]);
> +		offset += 4;
> +		total_config_sz += fw_hdr->config_size[i];
> +	}
> +
> +	if (fw_hdr->img_sz - total_config_sz != (unsigned int)offset) {
> +		dev_err(tas_priv->dev, "Bin file err %d - %d != %d!\n",
> +			fw_hdr->img_sz, total_config_sz, (int)offset);
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -EINVAL;
> +	}
> +
> +	cfg_info = kcalloc(fw_hdr->nconfig, sizeof(*cfg_info), GFP_KERNEL);
> +	if (!cfg_info) {
> +		tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +		return -ENOMEM;
> +	}
> +	rca->cfg_info = cfg_info;
> +	rca->ncfgs = 0;
> +	for (i = 0; i < (int)fw_hdr->nconfig; i++) {
> +		rca->ncfgs += 1;
> +		cfg_info[i] = tasdevice_add_config(tas_priv, &buf[offset],
> +			fw_hdr->config_size[i], &ret);
> +		if (ret) {
> +			tas_priv->fw_state = TASDEVICE_DSP_FW_FAIL;
> +			return ret;
> +		}
> +		offset += (int)fw_hdr->config_size[i];
> +	}
> +
> +	return ret;
> +}
> +
> +/* fixed m68k compiling issue: mapping table can save code field */
> +static unsigned char map_dev_idx(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block)
> +{
> +	struct blktyp_devidx_map *p =
> +		(struct blktyp_devidx_map *)non_ppc3_mapping_table;
> +	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
> +	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
> +	int i, n = ARRAY_SIZE(non_ppc3_mapping_table);
> +	unsigned char dev_idx = 0;
> +
> +	if (fw_fixed_hdr->ppcver >= PPC3_VERSION_TAS2781) {
> +		p = (struct blktyp_devidx_map *)ppc3_tas2781_mapping_table;
> +		n = ARRAY_SIZE(ppc3_tas2781_mapping_table);
> +	} else if (fw_fixed_hdr->ppcver >= PPC3_VERSION) {
> +		p = (struct blktyp_devidx_map *)ppc3_mapping_table;
> +		n = ARRAY_SIZE(ppc3_mapping_table);
> +	}
> +
> +	for (i = 0; i < n; i++) {
> +		if (block->type == p[i].blktyp) {
> +			dev_idx = p[i].dev_idx;
> +			break;
> +		}
> +	}
> +
> +	return dev_idx;
> +}
> +
> +/* Block parser function. */
> +static int fw_parse_block_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +
> +	if (offset + 16 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	/*
> +	 * Convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host.
> +	 */
> +	block->type = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +
> +	block->is_pchksum_present = data[offset++];
> +	block->pchksum = data[offset++];
> +	block->is_ychksum_present = data[offset++];
> +	block->ychksum = data[offset++];
> +	block->blk_size = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +	block->nr_subblocks = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +
> +	/*
> +	 * Fixed m68k compiling issue:
> +	 * 1. mapping table can save code field.
> +	 * 2. storing the dev_idx as a member of block can reduce unnecessary
> +	 *    time and system resource comsumption of dev_idx mapping every
> +	 *    time the block data writing to the dsp.
> +	 */
> +	block->dev_idx = map_dev_idx(tas_fmw, block);
> +
> +	if (offset + block->blk_size > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: nSublocks error\n", __func__);
> +		return -EINVAL;
> +	}
> +	/* instead of kzalloc+memcpy */
> +	block->data = kmemdup(&data[offset], block->blk_size, GFP_KERNEL);
> +	if (!block->data)
> +		return -ENOMEM;
> +
> +	offset += block->blk_size;
> +
> +	return offset;
> +}
> +
> +/* Data of block parser function. */
> +static int fw_parse_data_kernel(struct tasdevice_fw *tas_fmw,
> +	struct tasdevice_data *img_data, const struct firmware *fmw,
> +	int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +
> +	if (offset + 4 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +	img_data->nr_blk = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +
> +	img_data->dev_blks = kcalloc(img_data->nr_blk,
> +		sizeof(struct tasdev_blk), GFP_KERNEL);
> +	if (!img_data->dev_blks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < img_data->nr_blk; i++) {
> +		blk = &img_data->dev_blks[i];
> +		offset = fw_parse_block_data_kernel(
> +			tas_fmw, blk, fmw, offset);
> +		if (offset < 0) {
> +			kfree(img_data->dev_blks);
> +			return -EINVAL;
> +		}
> +	}
> +
> +	return offset;
> +}
> +
> +/* Data of DSP program parser function. */
> +static int fw_parse_program_data_kernel(
> +	struct tasdevice_priv *tas_priv, struct tasdevice_fw *tas_fmw,
> +	const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_prog *program;
> +	unsigned int i;
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		program = &tas_fmw->programs[i];
> +		if (offset + 72 > fmw->size) {
> +			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
> +			return -EINVAL;
> +		}
> +		/* skip 72 unused byts */
> +		offset += 72;
> +
> +		offset = fw_parse_data_kernel(tas_fmw, &program->dev_data,
> +			fmw, offset);
> +		if (offset < 0)
> +			break;
> +	}
> +
> +	return offset;
> +}
> +
> +/* Data of DSP configurations parser function. */
> +static int fw_parse_configuration_data_kernel(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *data = fmw->data;
> +	struct tasdevice_config *config;
> +	unsigned int i;
> +
> +	for (i = 0; i < tas_fmw->nr_configurations; i++) {
> +		config = &tas_fmw->configs[i];
> +		if (offset + 80 > fmw->size) {
> +			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
> +			return -EINVAL;
> +		}
> +		memcpy(config->name, &data[offset], 64);
> +		/* skip extra 16 bytes */
> +		offset += 80;
> +
> +		offset = fw_parse_data_kernel(tas_fmw, &config->dev_data,
> +			fmw, offset);
> +		if (offset < 0)
> +			break;
> +	}
> +
> +	return offset;
> +}
> +
> +/* DSP firmware file header parser function for early PPC3 firmware binary. */
> +static int fw_parse_variable_header_kernel(struct tasdevice_priv *tas_priv,
> +	const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
> +	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
> +	struct tasdevice_config *config;
> +	struct tasdevice_prog *program;
> +	const unsigned char *buf = fmw->data;
> +	unsigned short max_confs;
> +	unsigned int i;
> +
> +	if (offset + 12 + 4 * TASDEVICE_MAXPROGRAM_NUM_KERNEL > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +	fw_hdr->device_family = get_unaligned_be16(&buf[offset]);
> +	if (fw_hdr->device_family != 0) {
> +		dev_err(tas_priv->dev, "%s:not TAS device\n", __func__);
> +		return -EINVAL;
> +	}
> +	offset += 2;
> +	fw_hdr->device = get_unaligned_be16(&buf[offset]);
> +	if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
> +	    fw_hdr->device == 6) {
> +		dev_err(tas_priv->dev, "Unsupported dev %d\n", fw_hdr->device);
> +		return -EINVAL;
> +	}
> +	offset += 2;
> +
> +	tas_fmw->nr_programs = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +
> +	if (tas_fmw->nr_programs == 0 ||
> +	    tas_fmw->nr_programs > TASDEVICE_MAXPROGRAM_NUM_KERNEL) {
> +		dev_err(tas_priv->dev, "mnPrograms is invalid\n");
> +		return -EINVAL;
> +	}
> +
> +	tas_fmw->programs = kcalloc(tas_fmw->nr_programs,
> +		sizeof(*tas_fmw->programs), GFP_KERNEL);
> +	if (!tas_fmw->programs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		program = &tas_fmw->programs[i];
> +		program->prog_size = get_unaligned_be32(&buf[offset]);
> +		offset += 4;
> +	}
> +
> +	/* Skip the unused prog_size */
> +	offset += 4 * (TASDEVICE_MAXPROGRAM_NUM_KERNEL - tas_fmw->nr_programs);
> +
> +	tas_fmw->nr_configurations = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +
> +	/*
> +	 * The max number of config in firmware greater than 4 pieces of
> +	 * tas2781s is different from the one lower than 4 pieces of
> +	 * tas2781s.
> +	 */
> +	max_confs = TASDEVICE_MAXCONFIG_NUM_KERNEL;
> +	if (tas_fmw->nr_configurations == 0 ||
> +	    tas_fmw->nr_configurations > max_confs) {
> +		dev_err(tas_priv->dev, "%s: Conf is invalid\n", __func__);
> +		kfree(tas_fmw->programs);
> +		return -EINVAL;
> +	}
> +
> +	if (offset + 4 * max_confs > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: mpConfigurations err\n", __func__);
> +		kfree(tas_fmw->programs);
> +		return -EINVAL;
> +	}
> +
> +	tas_fmw->configs = kcalloc(tas_fmw->nr_configurations,
> +		sizeof(*tas_fmw->configs), GFP_KERNEL);
> +	if (!tas_fmw->configs) {
> +		kfree(tas_fmw->programs);
> +		return -ENOMEM;
> +	}
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		config = &tas_fmw->configs[i];
> +		config->cfg_size = get_unaligned_be32(&buf[offset]);
> +		offset += 4;
> +	}
> +
> +	/* Skip the unused configs */
> +	offset += 4 * (max_confs - tas_fmw->nr_programs);
> +
> +	return offset;
> +}
> +
> +/*
> + * In sub-block data, have three type sub-block:
> + * 1. Single byte write.
> + * 2. Multi-byte write.
> + * 3. Delay.
> + * 4. Bits update.
> + * This function perform single byte write to device.
> + */
> +static int tasdevice_single_byte_wr(void *context, int dev_idx,
> +				    unsigned char *data, int sublocksize)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	unsigned short len = get_unaligned_be16(&data[2]);
> +	int i, subblk_offset, rc;
> +
> +	subblk_offset = 4;
> +	if (subblk_offset + 4 * len > sublocksize) {
> +		dev_err(tas_priv->dev, "process_block: Out of boundary\n");
> +		return 0;
> +	}
> +
> +	for (i = 0; i < len; i++) {
> +		if (dev_idx == (tas_priv->index + 1) || dev_idx == 0) {
> +			rc = tasdevice_spi_dev_write(tas_priv,
> +				TASDEVICE_REG(data[subblk_offset],
> +				data[subblk_offset + 1],
> +				data[subblk_offset + 2]),
> +				data[subblk_offset + 3]);
> +			if (rc < 0) {
> +				dev_err(tas_priv->dev,
> +					"process_block: single write error\n");
> +				subblk_offset |= OFFSET_ERROR_BIT;
> +			}
> +		}
> +		subblk_offset += 4;
> +	}
> +
> +	return subblk_offset;
> +}
> +
> +/*
> + * In sub-block data, have three type sub-block:
> + * 1. Single byte write.
> + * 2. Multi-byte write.
> + * 3. Delay.
> + * 4. Bits update.
> + * This function perform multi-write to device.
> + */
> +static int tasdevice_burst_wr(void *context, int dev_idx, unsigned char *data,
> +	int sublocksize)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	unsigned short len = get_unaligned_be16(&data[2]);
> +	int subblk_offset, rc;
> +
> +	subblk_offset = 4;
> +	if (subblk_offset + 4 + len > sublocksize) {
> +		dev_err(tas_priv->dev, "%s: BST Out of boundary\n", __func__);
> +		subblk_offset |= OFFSET_ERROR_BIT;
> +	}
> +	if (len % 4) {
> +		dev_err(tas_priv->dev, "%s:Bst-len(%u)not div by 4\n",
> +			__func__, len);
> +		subblk_offset |= OFFSET_ERROR_BIT;
> +	}
> +
> +	if (dev_idx == (tas_priv->index + 1) || dev_idx == 0) {
> +		rc = tasdevice_spi_dev_bulk_write(tas_priv,
> +			TASDEVICE_REG(data[subblk_offset],
> +				      data[subblk_offset + 1],
> +				      data[subblk_offset + 2]),
> +				      &data[subblk_offset + 4], len);
> +		if (rc < 0) {
> +			dev_err(tas_priv->dev, "%s: bulk_write error = %d\n",
> +				__func__, rc);
> +			subblk_offset |= OFFSET_ERROR_BIT;
> +		}
> +	}
> +	subblk_offset += (len + 4);
> +
> +	return subblk_offset;
> +}
> +
> +/* Just delay for ms.*/
> +static int tasdevice_delay(void *context, int dev_idx, unsigned char *data,
> +	int sublocksize)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	unsigned int sleep_time, subblk_offset = 2;
> +
> +	if (subblk_offset + 2 > sublocksize) {
> +		dev_err(tas_priv->dev, "%s: delay Out of boundary\n",
> +			__func__);
> +		subblk_offset |= OFFSET_ERROR_BIT;
> +	}
> +	if (dev_idx == (tas_priv->index + 1) || dev_idx == 0) {
> +		sleep_time = get_unaligned_be16(&data[2]) * 1000;
> +		fsleep(sleep_time);
> +	}
> +	subblk_offset += 2;
> +
> +	return subblk_offset;
> +}
> +
> +/*
> + * In sub-block data, have three type sub-block:
> + * 1. Single byte write.
> + * 2. Multi-byte write.
> + * 3. Delay.
> + * 4. Bits update.
> + * This function perform bits update.
> + */
> +static int tasdevice_field_wr(void *context, int dev_idx, unsigned char *data,
> +	int sublocksize)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	int rc, subblk_offset = 2;
> +
> +	if (subblk_offset + 6 > sublocksize) {
> +		dev_err(tas_priv->dev, "%s: bit write Out of boundary\n",
> +			__func__);
> +		subblk_offset |= OFFSET_ERROR_BIT;
> +	}
> +	if (dev_idx == (tas_priv->index + 1) || dev_idx == 0) {
> +		rc = tasdevice_spi_dev_update_bits(tas_priv,
> +			TASDEVICE_REG(data[subblk_offset + 2],
> +			data[subblk_offset + 3],
> +			data[subblk_offset + 4]),
> +			data[subblk_offset + 1],
> +			data[subblk_offset + 5]);
> +		if (rc < 0) {
> +			dev_err(tas_priv->dev, "%s: update_bits error = %d\n",
> +				__func__, rc);
> +			subblk_offset |= OFFSET_ERROR_BIT;
> +		}
> +	}
> +	subblk_offset += 6;
> +
> +	return subblk_offset;
> +}
> +
> +/* Data block process function. */
> +static int tasdevice_process_block(void *context, unsigned char *data,
> +	unsigned char dev_idx, int sublocksize)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	int blktyp = dev_idx & 0xC0, subblk_offset;
> +	unsigned char subblk_typ = data[1];
> +
> +	switch (subblk_typ) {
> +	case TASDEVICE_CMD_SING_W:
> +		subblk_offset = tasdevice_single_byte_wr(tas_priv,
> +			dev_idx & 0x4f, data, sublocksize);
> +		break;
> +	case TASDEVICE_CMD_BURST:
> +		subblk_offset = tasdevice_burst_wr(tas_priv,
> +			dev_idx & 0x4f, data, sublocksize);
> +		break;
> +	case TASDEVICE_CMD_DELAY:
> +		subblk_offset = tasdevice_delay(tas_priv,
> +			dev_idx & 0x4f, data, sublocksize);
> +		break;
> +	case TASDEVICE_CMD_FIELD_W:
> +		subblk_offset = tasdevice_field_wr(tas_priv,
> +			dev_idx & 0x4f, data, sublocksize);
> +		break;
> +	default:
> +		subblk_offset = 2;
> +		break;
> +	}
> +	if (((subblk_offset & OFFSET_ERROR_BIT) != 0) && blktyp != 0) {
> +		if (blktyp == 0x80) {
> +			tas_priv->cur_prog = -1;
> +			tas_priv->cur_conf = -1;
> +		} else
> +			tas_priv->cur_conf = -1;
> +	}
> +	subblk_offset &= ~OFFSET_ERROR_BIT;
> +
> +	return subblk_offset;
> +}
> +
> +/*
> + * Device support different configurations for different scene,
> + * this function was used for choose different config.
> + */
> +void tasdevice_spi_select_cfg_blk(void *pContext, int conf_no,
> +	unsigned char block_type)
> +{
> +	struct tasdevice_priv *tas_priv = pContext;
> +	struct tasdevice_rca *rca = &tas_priv->rcabin;
> +	struct tasdevice_config_info **cfg_info = rca->cfg_info;
> +	struct tasdev_blk_data **blk_data;
> +	unsigned int j, k;
> +
> +	if (conf_no >= rca->ncfgs || conf_no < 0 || !cfg_info) {
> +		dev_err(tas_priv->dev, "conf_no should be not more than %u\n",
> +			rca->ncfgs);
> +		return;
> +	}
> +	blk_data = cfg_info[conf_no]->blk_data;
> +
> +	for (j = 0; j < cfg_info[conf_no]->real_nblocks; j++) {
> +		unsigned int length = 0, rc = 0;
> +
> +		if (block_type > 5 || block_type < 2) {
> +			dev_err(tas_priv->dev,
> +				"block_type should be in range from 2 to 5\n");
> +			break;
> +		}
> +		if (block_type != blk_data[j]->block_type)
> +			continue;
> +
> +		for (k = 0; k < blk_data[j]->n_subblks; k++) {
> +			tas_priv->is_loading = true;
> +
> +			rc = tasdevice_process_block(tas_priv,
> +				blk_data[j]->regdata + length,
> +				blk_data[j]->dev_idx,
> +				blk_data[j]->block_size - length);
> +			length += rc;
> +			if (blk_data[j]->block_size < length) {
> +				dev_err(tas_priv->dev,
> +					"%s: %u %u out of boundary\n",
> +					__func__, length,
> +					blk_data[j]->block_size);
> +				break;
> +			}
> +		}
> +		if (length != blk_data[j]->block_size)
> +			dev_err(tas_priv->dev, "%s: %u %u size is not same\n",
> +				__func__, length, blk_data[j]->block_size);
> +	}
> +}
> +
> +/* Block process function. */
> +static int tasdevice_load_block_kernel(
> +	struct tasdevice_priv *tasdevice, struct tasdev_blk *block)
> +{
> +	const unsigned int blk_size = block->blk_size;
> +	unsigned char *data = block->data;
> +	unsigned int i, length;
> +
> +	for (i = 0, length = 0; i < block->nr_subblocks; i++) {
> +		int rc = tasdevice_process_block(tasdevice, data + length,
> +			block->dev_idx, blk_size - length);
> +		if (rc < 0) {
> +			dev_err(tasdevice->dev,
> +				"%s: %u %u sublock write error\n",
> +				__func__, length, blk_size);
> +			return rc;
> +		}
> +		length += rc;
> +		if (blk_size < length) {
> +			dev_err(tasdevice->dev, "%s: %u %u out of boundary\n",
> +				__func__, length, blk_size);
> +			rc = -ENOMEM;
> +			return rc;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +/* DSP firmware file header parser function. */
> +static int fw_parse_variable_hdr(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_dspfw_hdr *fw_hdr,
> +	const struct firmware *fmw, int offset)
> +{
> +	const unsigned char *buf = fmw->data;
> +	int len = strlen((char *)&buf[offset]);
> +
> +	len++;
> +
> +	if (offset + len + 8 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +
> +	offset += len;
> +
> +	fw_hdr->device_family = get_unaligned_be32(&buf[offset]);
> +	if (fw_hdr->device_family != 0) {
> +		dev_err(tas_priv->dev, "%s: not TAS device\n", __func__);
> +		return -EINVAL;
> +	}
> +	offset += 4;
> +
> +	fw_hdr->device = get_unaligned_be32(&buf[offset]);
> +	if (fw_hdr->device >= TASDEVICE_DSP_TAS_MAX_DEVICE ||
> +	    fw_hdr->device == 6) {
> +		dev_err(tas_priv->dev, "Unsupported dev %d\n", fw_hdr->device);
> +		return -EINVAL;
> +	}
> +	offset += 4;
> +	fw_hdr->ndev = 1;
> +
> +	return offset;
> +}
> +
> +/* DSP firmware file header parser function for size variabled header. */
> +static int fw_parse_variable_header_git(struct tasdevice_priv
> +	*tas_priv, const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
> +	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
> +
> +	offset = fw_parse_variable_hdr(tas_priv, fw_hdr, fmw, offset);
> +
> +	return offset;
> +}
> +
> +/* DSP firmware file block parser function. */
> +static int fw_parse_block_data(struct tasdevice_fw *tas_fmw,
> +	struct tasdev_blk *block, const struct firmware *fmw, int offset)
> +{
> +	unsigned char *data = (unsigned char *)fmw->data;
> +	int n;
> +
> +	if (offset + 8 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Type error\n", __func__);
> +		return -EINVAL;
> +	}
> +	block->type = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +
> +	if (tas_fmw->fw_hdr.fixed_hdr.drv_ver >= PPC_DRIVER_CRCCHK) {
> +		if (offset + 8 > fmw->size) {
> +			dev_err(tas_fmw->dev, "PChkSumPresent error\n");
> +			return -EINVAL;
> +		}
> +		block->is_pchksum_present = data[offset];
> +		offset++;
> +
> +		block->pchksum = data[offset];
> +		offset++;
> +
> +		block->is_ychksum_present = data[offset];
> +		offset++;
> +
> +		block->ychksum = data[offset];
> +		offset++;
> +	} else {
> +		block->is_pchksum_present = 0;
> +		block->is_ychksum_present = 0;
> +	}
> +
> +	block->nr_cmds = get_unaligned_be32(&data[offset]);
> +	offset += 4;
> +
> +	n = block->nr_cmds * 4;
> +	if (offset + n > fmw->size) {
> +		dev_err(tas_fmw->dev,
> +			"%s: File Size(%lu) error offset = %d n = %d\n",
> +			__func__, (unsigned long)fmw->size, offset, n);
> +		return -EINVAL;
> +	}
> +	/* instead of kzalloc+memcpy */
> +	block->data = kmemdup(&data[offset], n, GFP_KERNEL);
> +	if (!block->data)
> +		return -ENOMEM;
> +
> +	offset += n;
> +
> +	return offset;
> +}
> +
> +/*
> + * When parsing error occurs, all the memory resource will be released
> + * in the end of tasdevice_rca_ready.
> + */
> +static int fw_parse_data(struct tasdevice_fw *tas_fmw,
> +	struct tasdevice_data *img_data, const struct firmware *fmw,
> +	int offset)
> +{
> +	const unsigned char *data = (unsigned char *)fmw->data;
> +	struct tasdev_blk *blk;
> +	unsigned int i, n;
> +
> +	if (offset + 64 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Name error\n", __func__);
> +		return -EINVAL;
> +	}
> +	memcpy(img_data->name, &data[offset], 64);
> +	offset += 64;
> +
> +	n = strlen((char *)&data[offset]);
> +	n++;
> +	if (offset + n + 2 > fmw->size) {
> +		dev_err(tas_fmw->dev, "%s: Description error\n", __func__);
> +		return -EINVAL;
> +	}
> +	offset += n;
> +	img_data->nr_blk = get_unaligned_be16(&data[offset]);
> +	offset += 2;
> +
> +	img_data->dev_blks = kcalloc(img_data->nr_blk,
> +		sizeof(*img_data->dev_blks), GFP_KERNEL);
> +	if (!img_data->dev_blks)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < img_data->nr_blk; i++) {
> +		blk = &img_data->dev_blks[i];
> +		offset = fw_parse_block_data(tas_fmw, blk, fmw, offset);
> +		if (offset < 0)
> +			return -EINVAL;
> +	}
> +
> +	return offset;
> +}
> +
> +/*
> + * When parsing error occurs, all the memory resource will be released
> + * in the end of tasdevice_rca_ready.
> + */
> +static int fw_parse_program_data(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	unsigned char *buf = (unsigned char *)fmw->data;
> +	struct tasdevice_prog *program;
> +	int i;
> +
> +	if (offset + 2 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +	tas_fmw->nr_programs = get_unaligned_be16(&buf[offset]);
> +	offset += 2;
> +
> +	if (tas_fmw->nr_programs == 0) {
> +		/* Not error in calibration Data file, return directly */
> +		dev_dbg(tas_priv->dev, "%s: No Programs data, maybe calbin\n",
> +			__func__);
> +		return offset;
> +	}
> +
> +	tas_fmw->programs =
> +		kcalloc(tas_fmw->nr_programs, sizeof(*tas_fmw->programs),
> +			GFP_KERNEL);
> +	if (!tas_fmw->programs)
> +		return -ENOMEM;
> +
> +	for (i = 0; i < tas_fmw->nr_programs; i++) {
> +		int n = 0;
> +
> +		program = &tas_fmw->programs[i];
> +		if (offset + 64 > fmw->size) {
> +			dev_err(tas_priv->dev, "%s: mpName error\n", __func__);
> +			return -EINVAL;
> +		}
> +		offset += 64;
> +
> +		n = strlen((char *)&buf[offset]);
> +		/* skip '\0' and 5 unused bytes */
> +		n += 6;
> +		if (offset + n > fmw->size) {
> +			dev_err(tas_priv->dev, "Description err\n");
> +			return -EINVAL;
> +		}
> +
> +		offset += n;
> +
> +		offset = fw_parse_data(tas_fmw, &program->dev_data, fmw,
> +			offset);
> +		if (offset < 0)
> +			return offset;
> +	}
> +
> +	return offset;
> +}
> +
> +/*
> + * When parsing error occurs, all the memory resource will be released
> + * in the end of tasdevice_rca_ready.
> + */
> +static int fw_parse_configuration_data(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	unsigned char *data = (unsigned char *)fmw->data;
> +	struct tasdevice_config *config;
> +	unsigned int i, n;
> +
> +	if (offset + 2 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		return -EINVAL;
> +	}
> +	tas_fmw->nr_configurations = get_unaligned_be16(&data[offset]);
> +	offset += 2;
> +
> +	if (tas_fmw->nr_configurations == 0) {
> +		dev_err(tas_priv->dev, "%s: Conf is zero\n", __func__);
> +		/* Not error for calibration Data file, return directly */
> +		return offset;
> +	}
> +	tas_fmw->configs = kcalloc(tas_fmw->nr_configurations,
> +			sizeof(*tas_fmw->configs), GFP_KERNEL);
> +	if (!tas_fmw->configs)
> +		return -ENOMEM;
> +	for (i = 0; i < tas_fmw->nr_configurations; i++) {
> +		config = &tas_fmw->configs[i];
> +		if (offset + 64 > fmw->size) {
> +			dev_err(tas_priv->dev, "File Size err\n");
> +			return -EINVAL;
> +		}
> +		memcpy(config->name, &data[offset], 64);
> +		offset += 64;
> +
> +		n = strlen((char *)&data[offset]);
> +		n += 15;
> +		if (offset + n > fmw->size) {
> +			dev_err(tas_priv->dev, "Description err\n");
> +			return -EINVAL;
> +		}
> +		offset += n;
> +		offset = fw_parse_data(tas_fmw, &config->dev_data,
> +				       fmw, offset);
> +		if (offset < 0)
> +			break;
> +	}
> +
> +	return offset;
> +}
> +
> +/* yram5 page check. */
> +static bool check_inpage_yram_rg(struct tas_crc *cd,
> +	unsigned char reg, unsigned char len)
> +{
> +	bool in = false;
> +
> +	if (reg <= TAS2781_YRAM5_END_REG &&
> +	    reg >= TAS2781_YRAM5_START_REG) {
> +		if (reg + len > TAS2781_YRAM5_END_REG)
> +			cd->len = TAS2781_YRAM5_END_REG - reg + 1;
> +		else
> +			cd->len = len;
> +		cd->offset = reg;
> +		in = true;
> +	} else if (reg < TAS2781_YRAM5_START_REG) {
> +		if (reg + len > TAS2781_YRAM5_START_REG) {
> +			cd->offset = TAS2781_YRAM5_START_REG;
> +			cd->len = len - TAS2781_YRAM5_START_REG + reg;
> +			in = true;
> +		}
> +	}
> +
> +	return in;
> +}
> +
> +/* DSP firmware yram block check. */
> +static bool check_inpage_yram_bk1(struct tas_crc *cd,
> +	unsigned char page, unsigned char reg, unsigned char len)
> +{
> +	bool in = false;
> +
> +	if (page == TAS2781_YRAM1_PAGE) {
> +		if (reg >= TAS2781_YRAM1_START_REG) {
> +			cd->offset = reg;
> +			cd->len = len;
> +			in = true;
> +		} else if (reg + len > TAS2781_YRAM1_START_REG) {
> +			cd->offset = TAS2781_YRAM1_START_REG;
> +			cd->len = len - TAS2781_YRAM1_START_REG + reg;
> +			in = true;
> +		}
> +	} else if (page == TAS2781_YRAM3_PAGE) {
> +		in = check_inpage_yram_rg(cd, reg, len);
> +	}
> +
> +	return in;
> +}
> +
> +/*
> + * Return Code:
> + * true -- the registers are in the inpage yram
> + * false -- the registers are NOT in the inpage yram
> + */
> +static bool check_inpage_yram(struct tas_crc *cd, unsigned char book,
> +	unsigned char page, unsigned char reg, unsigned char len)
> +{
> +	bool in = false;
> +
> +	if (book == TAS2781_YRAM_BOOK1)
> +		in = check_inpage_yram_bk1(cd, page, reg, len);
> +	else if (book == TAS2781_YRAM_BOOK2 && page == TAS2781_YRAM5_PAGE)
> +		in = check_inpage_yram_rg(cd, reg, len);
> +
> +	return in;
> +}
> +
> +/* yram4 page check. */
> +static bool check_inblock_yram_bk(struct tas_crc *cd,
> +	unsigned char page, unsigned char reg, unsigned char len)
> +{
> +	bool in = false;
> +
> +	if ((page >= TAS2781_YRAM4_START_PAGE &&
> +	     page <= TAS2781_YRAM4_END_PAGE) ||
> +	    (page >= TAS2781_YRAM2_START_PAGE &&
> +	     page <= TAS2781_YRAM2_END_PAGE)) {
> +		if (reg <= TAS2781_YRAM2_END_REG &&
> +		    reg >= TAS2781_YRAM2_START_REG) {
> +			cd->offset = reg;
> +			cd->len = len;
> +			in = true;
> +		} else if (reg < TAS2781_YRAM2_START_REG) {
> +			if (reg + len - 1 >= TAS2781_YRAM2_START_REG) {
> +				cd->offset = TAS2781_YRAM2_START_REG;
> +				cd->len = reg + len - TAS2781_YRAM2_START_REG;
> +				in = true;
> +			}
> +		}
> +	}
> +
> +	return in;
> +}
> +
> +/*
> + * Return Code:
> + * true -- the registers are in the inblock yram
> + * false -- the registers are NOT in the inblock yram
> + */
> +static bool check_inblock_yram(struct tas_crc *cd, unsigned char book,
> +	unsigned char page, unsigned char reg, unsigned char len)
> +{
> +	bool in = false;
> +
> +	if (book == TAS2781_YRAM_BOOK1 || book == TAS2781_YRAM_BOOK2)
> +		in = check_inblock_yram_bk(cd, page, reg, len);
> +
> +	return in;
> +}
> +
> +/* yram page check. */
> +static bool check_yram(struct tas_crc *cd, unsigned char book,
> +	unsigned char page, unsigned char reg, unsigned char len)
> +{
> +	bool in;
> +
> +	in = check_inpage_yram(cd, book, page, reg, len);
> +	if (!in)
> +		in = check_inblock_yram(cd, book, page, reg, len);
> +
> +	return in;
> +}
> +
> +/* Checksum for data block. */
> +static int tasdev_multibytes_chksum(struct tasdevice_priv *tasdevice,
> +	unsigned char book, unsigned char page,
> +	unsigned char reg, unsigned int len)
> +{
> +	struct tas_crc crc_data;
> +	unsigned char crc_chksum = 0;
> +	unsigned char nBuf1[128];
> +	int ret = 0, i;
> +	bool in;
> +
> +	if ((reg + len - 1) > 127) {
> +		ret = -EINVAL;
> +		dev_err(tasdevice->dev, "firmware error\n");
> +		goto end;
> +	}
> +
> +	if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (reg == TASDEVICE_REG_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (len == 4)) {
> +		/* DSP swap command, pass */
> +		ret = 0;
> +		goto end;
> +	}
> +
> +	in = check_yram(&crc_data, book, page, reg, len);
> +	if (!in)
> +		goto end;
> +
> +	if (len == 1) {
> +		dev_err(tasdevice->dev, "firmware error\n");
> +		ret = -EINVAL;
> +		goto end;
> +	}
> +
> +	ret = tasdevice_spi_dev_bulk_read(tasdevice,
> +		TASDEVICE_REG(book, page, crc_data.offset),
> +		nBuf1, crc_data.len);
> +	if (ret < 0)
> +		goto end;
> +
> +	for (i = 0; i < crc_data.len; i++) {
> +		if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +		    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +		    ((i + crc_data.offset) >=
> +			TASDEVICE_REG_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +		    ((i + crc_data.offset) <=
> +			(TASDEVICE_REG_ID(TAS2781_SA_COEFF_SWAP_REG) + 4)))
> +			/* DSP swap command, bypass */
> +			continue;
> +		else
> +			crc_chksum += crc8(tasdevice->crc8_lkp_tbl, &nBuf1[i],
> +				1, 0);
> +	}
> +
> +	ret = crc_chksum;
> +
> +end:
> +	return ret;
> +}
> +
> +/* Checksum for single register. */
> +static int do_singlereg_checksum(struct tasdevice_priv *tasdevice,
> +	unsigned char book, unsigned char page,
> +	unsigned char reg, unsigned char val)
> +{
> +	struct tas_crc crc_data;
> +	unsigned int nData1;
> +	int ret = 0;
> +	bool in;
> +
> +	/* DSP swap command, pass */
> +	if ((book == TASDEVICE_BOOK_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (page == TASDEVICE_PAGE_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (reg >= TASDEVICE_REG_ID(TAS2781_SA_COEFF_SWAP_REG)) &&
> +	    (reg <= (TASDEVICE_REG_ID(TAS2781_SA_COEFF_SWAP_REG) + 4)))
> +		return 0;
> +
> +	in = check_yram(&crc_data, book, page, reg, 1);
> +	if (!in)
> +		return 0;
> +	ret = tasdevice_spi_dev_read(tasdevice,
> +		TASDEVICE_REG(book, page, reg), &nData1);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (nData1 != val) {
> +		dev_err(tasdevice->dev,
> +			"B[0x%x]P[0x%x]R[0x%x] W[0x%x], R[0x%x]\n",
> +			book, page, reg, val, nData1);
> +		tasdevice->err_code |= ERROR_YRAM_CRCCHK;
> +		return -EAGAIN;
> +	}
> +
> +	ret = crc8(tasdevice->crc8_lkp_tbl, &val, 1, 0);
> +
> +	return ret;
> +}
> +
> +/* Block type check. */
> +static void set_err_prg_cfg(unsigned int type, struct tasdevice_priv *p)
> +{
> +	if ((type == MAIN_ALL_DEVICES) || (type == MAIN_DEVICE_A) ||
> +	    (type == MAIN_DEVICE_B) || (type == MAIN_DEVICE_C) ||
> +	    (type == MAIN_DEVICE_D))
> +		p->cur_prog = -1;
> +	else
> +		p->cur_conf = -1;
> +}
> +
> +/* Checksum for data bytes. */
> +static int tasdev_bytes_chksum(struct tasdevice_priv *tas_priv,
> +	struct tasdev_blk *block, unsigned char book,
> +	unsigned char page, unsigned char reg, unsigned int len,
> +	unsigned char val, unsigned char *crc_chksum)
> +{
> +	int ret;
> +
> +	if (len > 1)
> +		ret = tasdev_multibytes_chksum(tas_priv, book, page, reg,
> +			len);
> +	else
> +		ret = do_singlereg_checksum(tas_priv, book, page, reg, val);
> +
> +	if (ret > 0) {
> +		*crc_chksum += ret;
> +		goto end;
> +	}
> +
> +	if (ret != -EAGAIN)
> +		goto end;
> +
> +	block->nr_retry--;
> +	if (block->nr_retry > 0)
> +		goto end;
> +
> +	set_err_prg_cfg(block->type, tas_priv);
> +
> +end:
> +	return ret;
> +}
> +
> +/* Multi-data byte write. */
> +static int tasdev_multibytes_wr(struct tasdevice_priv *tas_priv,
> +	struct tasdev_blk *block, unsigned char book,
> +	unsigned char page, unsigned char reg, unsigned char *data,
> +	unsigned int len, unsigned int *nr_cmds,
> +	unsigned char *crc_chksum)
> +{
> +	int ret;
> +
> +	if (len > 1) {
> +		ret = tasdevice_spi_dev_bulk_write(tas_priv,
> +			TASDEVICE_REG(book, page, reg), data + 3, len);
> +		if (ret < 0)
> +			return ret;
> +		if (block->is_ychksum_present)
> +			ret = tasdev_bytes_chksum(tas_priv, block,
> +				book, page, reg, len, 0, crc_chksum);
> +	} else {
> +		ret = tasdevice_spi_dev_write(tas_priv,
> +			TASDEVICE_REG(book, page, reg), data[3]);
> +		if (ret < 0)
> +			return ret;
> +		if (block->is_ychksum_present)
> +			ret = tasdev_bytes_chksum(tas_priv, block, book,
> +				page, reg, 1, data[3], crc_chksum);
> +	}
> +
> +	if (!block->is_ychksum_present || ret >= 0) {
> +		*nr_cmds += 1;
> +		if (len >= 2)
> +			*nr_cmds += ((len - 2) / 4) + 1;
> +	}
> +
> +	return ret;
> +}
> +
> +/* Checksum for block. */
> +static int tasdev_block_chksum(struct tasdevice_priv *tas_priv,
> +	struct tasdev_blk *block)
> +{
> +	unsigned int nr_value;
> +	int ret;
> +
> +	ret = tasdevice_spi_dev_read(tas_priv, TASDEVICE_CHECKSUM, &nr_value);
> +	if (ret < 0) {
> +		dev_err(tas_priv->dev, "%s: read error %d.\n", __func__, ret);
> +		set_err_prg_cfg(block->type, tas_priv);
> +		return ret;
> +	}
> +
> +	if ((nr_value & 0xff) != block->pchksum) {
> +		dev_err(tas_priv->dev, "%s: PChkSum err %d ", __func__, ret);
> +		dev_err(tas_priv->dev, "PChkSum = 0x%x, Reg = 0x%x\n",
> +			block->pchksum, (nr_value & 0xff));
> +		tas_priv->err_code |= ERROR_PRAM_CRCCHK;
> +		ret = -EAGAIN;
> +		block->nr_retry--;
> +
> +		if (block->nr_retry <= 0)
> +			set_err_prg_cfg(block->type, tas_priv);
> +	} else {
> +		tas_priv->err_code &= ~ERROR_PRAM_CRCCHK;
> +	}
> +
> +	return ret;
> +}
> +
> +/* Firmware block load function. */
> +static int tasdev_load_blk(struct tasdevice_priv *tas_priv,
> +	struct tasdev_blk *block)
> +{
> +	unsigned int sleep_time, len, nr_cmds;
> +	unsigned char offset, book, page, val;
> +	unsigned char *data = block->data;
> +	unsigned char crc_chksum = 0;
> +	int ret = 0;
> +
> +	while (block->nr_retry > 0) {
> +		if (block->is_pchksum_present) {
> +			ret = tasdevice_spi_dev_write(tas_priv,
> +				TASDEVICE_CHECKSUM, 0);
> +			if (ret < 0)
> +				break;
> +		}
> +
> +		if (block->is_ychksum_present)
> +			crc_chksum = 0;
> +
> +		nr_cmds = 0;
> +
> +		while (nr_cmds < block->nr_cmds) {
> +			data = block->data + nr_cmds * 4;
> +
> +			book = data[0];
> +			page = data[1];
> +			offset = data[2];
> +			val = data[3];
> +
> +			nr_cmds++;
> +			/* Single byte write */
> +			if (offset <= 0x7F) {
> +				ret = tasdevice_spi_dev_write(tas_priv,
> +					TASDEVICE_REG(book, page, offset),
> +					val);
> +				if (ret < 0)
> +					break;
> +				if (block->is_ychksum_present) {
> +					ret = tasdev_bytes_chksum(tas_priv,
> +						block, book, page, offset,
> +						1, val, &crc_chksum);
> +					if (ret < 0)
> +						break;
> +				}
> +				continue;
> +			}
> +			/* sleep command */
> +			if (offset == 0x81) {
> +				/* book -- data[0] page -- data[1] */
> +				sleep_time = ((book << 8) + page)*1000;
> +				fsleep(sleep_time);
> +				continue;
> +			}
> +			/* Multiple bytes write */
> +			if (offset == 0x85) {
> +				data += 4;
> +				len = (book << 8) + page;
> +				book = data[0];
> +				page = data[1];
> +				offset = data[2];
> +				ret = tasdev_multibytes_wr(tas_priv,
> +					block, book, page, offset, data,
> +					len, &nr_cmds, &crc_chksum);
> +				if (ret < 0)
> +					break;
> +			}
> +		}
> +		if (ret == -EAGAIN) {
> +			if (block->nr_retry > 0)
> +				continue;
> +		} else if (ret < 0) {
> +			/* err in current device, skip it */
> +			break;
> +		}
> +
> +		if (block->is_pchksum_present) {
> +			ret = tasdev_block_chksum(tas_priv, block);
> +			if (ret == -EAGAIN) {
> +				if (block->nr_retry > 0)
> +					continue;
> +			} else if (ret < 0) {
> +				/* err in current device, skip it */
> +				break;
> +			}
> +		}
> +
> +		if (block->is_ychksum_present) {
> +			/* TBD, open it when FW ready */
> +			dev_err(tas_priv->dev,
> +				"Blk YChkSum: FW = 0x%x, YCRC = 0x%x\n",
> +				block->ychksum, crc_chksum);
> +
> +			tas_priv->err_code &=
> +				~ERROR_YRAM_CRCCHK;
> +			ret = 0;
> +		}
> +		/* skip current blk */
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +/* Firmware block load function. */
> +static int tasdevice_load_block(struct tasdevice_priv *tas_priv,
> +	struct tasdev_blk *block)
> +{
> +	int ret = 0;
> +
> +	block->nr_retry = 6;
> +	if (tas_priv->is_loading == false)
> +		return 0;
> +	ret = tasdev_load_blk(tas_priv, block);
> +	if (ret < 0)
> +		dev_err(tas_priv->dev, "Blk (%d) load error\n", block->type);
> +
> +	return ret;
> +}
> +
> +/*
> + * Select firmware binary parser & load callback functions by ppc3 version
> + * and firmware binary version.
> + */
> +static int dspfw_default_callback(struct tasdevice_priv *tas_priv,
> +	unsigned int drv_ver, unsigned int ppcver)
> +{
> +	int rc = 0;
> +
> +	if (drv_ver == 0x100) {
> +		if (ppcver >= PPC3_VERSION) {
> +			tas_priv->fw_parse_variable_header =
> +				fw_parse_variable_header_kernel;
> +			tas_priv->fw_parse_program_data =
> +				fw_parse_program_data_kernel;
> +			tas_priv->fw_parse_configuration_data =
> +				fw_parse_configuration_data_kernel;
> +			tas_priv->tasdevice_load_block =
> +				tasdevice_load_block_kernel;
> +		} else if (ppcver == 0x00) {
> +			tas_priv->fw_parse_variable_header =
> +				fw_parse_variable_header_git;
> +			tas_priv->fw_parse_program_data =
> +				fw_parse_program_data;
> +			tas_priv->fw_parse_configuration_data =
> +				fw_parse_configuration_data;
> +			tas_priv->tasdevice_load_block =
> +				tasdevice_load_block;
> +		} else {
> +			dev_err(tas_priv->dev,
> +				"Wrong PPCVer :0x%08x\n", ppcver);
> +			rc = -EINVAL;
> +		}
> +	} else {
> +		dev_err(tas_priv->dev, "Wrong DrvVer : 0x%02x\n", drv_ver);
> +		rc = -EINVAL;
> +	}
> +
> +	return rc;
> +}
> +
> +/* DSP firmware binary file header parser function. */
> +static int fw_parse_header(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_fw *tas_fmw, const struct firmware *fmw, int offset)
> +{
> +	struct tasdevice_dspfw_hdr *fw_hdr = &tas_fmw->fw_hdr;
> +	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr = &fw_hdr->fixed_hdr;
> +	static const unsigned char magic_number[] = {0x35, 0x35, 0x35, 0x32, };
> +	const unsigned char *buf = (unsigned char *)fmw->data;
> +
> +	if (offset + 92 > fmw->size) {
> +		dev_err(tas_priv->dev, "%s: File Size error\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	if (memcmp(&buf[offset], magic_number, 4)) {
> +		dev_err(tas_priv->dev, "%s: Magic num NOT match\n", __func__);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	offset += 4;
> +
> +	/*
> +	 * Convert data[offset], data[offset + 1], data[offset + 2] and
> +	 * data[offset + 3] into host
> +	 */
> +	fw_fixed_hdr->fwsize = get_unaligned_be32(&buf[offset]);
> +	offset += 4;
> +	if (fw_fixed_hdr->fwsize != fmw->size) {
> +		dev_err(tas_priv->dev, "File size not match, %lu %u",
> +			(unsigned long)fmw->size, fw_fixed_hdr->fwsize);
> +		offset = -EINVAL;
> +		goto out;
> +	}
> +	offset += 4;
> +	fw_fixed_hdr->ppcver = get_unaligned_be32(&buf[offset]);
> +	offset += 8;
> +	fw_fixed_hdr->drv_ver = get_unaligned_be32(&buf[offset]);
> +	offset += 72;
> +
> +out:
> +	return offset;
> +}
> +
> +/* DSP firmware binary file parser function. */
> +static int tasdevice_dspfw_ready(const struct firmware *fmw, void *context)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tasdevice_fw_fixed_hdr *fw_fixed_hdr;
> +	struct tasdevice_fw *tas_fmw;
> +	int offset = 0, ret = 0;
> +
> +	if (!fmw || !fmw->data) {
> +		dev_err(tas_priv->dev, "%s: Failed to read firmware %s\n",
> +			__func__, tas_priv->coef_binaryname);
> +		return -EINVAL;
> +	}
> +
> +	tas_priv->fmw = kzalloc(sizeof(*tas_priv->fmw), GFP_KERNEL);
> +	if (!tas_priv->fmw)
> +		return -ENOMEM;
> +	tas_fmw = tas_priv->fmw;
> +	tas_fmw->dev = tas_priv->dev;
> +	offset = fw_parse_header(tas_priv, tas_fmw, fmw, offset);
> +
> +	if (offset == -EINVAL)
> +		return -EINVAL;
> +
> +	fw_fixed_hdr = &tas_fmw->fw_hdr.fixed_hdr;
> +	/* Support different versions of firmware */
> +	switch (fw_fixed_hdr->drv_ver) {
> +	case 0x301:
> +	case 0x302:
> +	case 0x502:
> +	case 0x503:
> +		tas_priv->fw_parse_variable_header =
> +			fw_parse_variable_header_kernel;
> +		tas_priv->fw_parse_program_data =
> +			fw_parse_program_data_kernel;
> +		tas_priv->fw_parse_configuration_data =
> +			fw_parse_configuration_data_kernel;
> +		tas_priv->tasdevice_load_block =
> +			tasdevice_load_block_kernel;
> +		break;
> +	case 0x202:
> +	case 0x400:
> +		tas_priv->fw_parse_variable_header =
> +			fw_parse_variable_header_git;
> +		tas_priv->fw_parse_program_data =
> +			fw_parse_program_data;
> +		tas_priv->fw_parse_configuration_data =
> +			fw_parse_configuration_data;
> +		tas_priv->tasdevice_load_block =
> +			tasdevice_load_block;
> +		break;
> +	default:
> +		ret = dspfw_default_callback(tas_priv,
> +			fw_fixed_hdr->drv_ver, fw_fixed_hdr->ppcver);
> +		if (ret)
> +			return ret;
> +		break;
> +	}
> +
> +	offset = tas_priv->fw_parse_variable_header(tas_priv, fmw, offset);
> +	if (offset < 0)
> +		return offset;
> +
> +	offset = tas_priv->fw_parse_program_data(tas_priv, tas_fmw, fmw,
> +		offset);
> +	if (offset < 0)
> +		return offset;
> +
> +	offset = tas_priv->fw_parse_configuration_data(tas_priv,
> +		tas_fmw, fmw, offset);
> +	if (offset < 0)
> +		ret = offset;
> +
> +	return ret;
> +}
> +
> +/* DSP firmware binary file parser function. */
> +int tasdevice_spi_dsp_parser(void *context)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	const struct firmware *fw_entry;
> +	int ret;
> +
> +	ret = request_firmware(&fw_entry, tas_priv->coef_binaryname,
> +		tas_priv->dev);
> +	if (ret) {
> +		dev_err(tas_priv->dev, "%s: load %s error\n", __func__,
> +			tas_priv->coef_binaryname);
> +		return ret;
> +	}
> +
> +	ret = tasdevice_dspfw_ready(fw_entry, tas_priv);
> +	release_firmware(fw_entry);
> +	fw_entry = NULL;
> +
> +	return ret;
> +}
> +
> +/* DSP firmware program block data remove function. */
> +static void tasdev_dsp_prog_blk_remove(struct tasdevice_prog *prog)
> +{
> +	struct tasdevice_data *tas_dt;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +
> +	if (!prog)
> +		return;
> +
> +	tas_dt = &prog->dev_data;
> +
> +	if (!tas_dt->dev_blks)
> +		return;
> +
> +	for (i = 0; i < tas_dt->nr_blk; i++) {
> +		blk = &tas_dt->dev_blks[i];
> +		kfree(blk->data);
> +	}
> +	kfree(tas_dt->dev_blks);
> +}
> +
> +/* DSP firmware program block data remove function. */
> +static void tasdev_dsp_prog_remove(struct tasdevice_prog *prog,
> +	unsigned short nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; i++)
> +		tasdev_dsp_prog_blk_remove(&prog[i]);
> +	kfree(prog);
> +}
> +
> +/* DSP firmware config block data remove function. */
> +static void tasdev_dsp_cfg_blk_remove(struct tasdevice_config *cfg)
> +{
> +	struct tasdevice_data *tas_dt;
> +	struct tasdev_blk *blk;
> +	unsigned int i;
> +
> +	if (cfg) {
> +		tas_dt = &cfg->dev_data;
> +
> +		if (!tas_dt->dev_blks)
> +			return;
> +
> +		for (i = 0; i < tas_dt->nr_blk; i++) {
> +			blk = &tas_dt->dev_blks[i];
> +			kfree(blk->data);
> +		}
> +		kfree(tas_dt->dev_blks);
> +	}
> +}
> +
> +/* DSP firmware config remove function. */
> +static void tasdev_dsp_cfg_remove(struct tasdevice_config *config,
> +	unsigned short nr)
> +{
> +	int i;
> +
> +	for (i = 0; i < nr; i++)
> +		tasdev_dsp_cfg_blk_remove(&config[i]);
> +	kfree(config);
> +}
> +
> +/* DSP firmware remove function. */
> +void tasdevice_spi_dsp_remove(void *context)
> +{
> +	struct tasdevice_priv *tas_dev = context;
> +
> +	if (!tas_dev->fmw)
> +		return;
> +
> +	if (tas_dev->fmw->programs)
> +		tasdev_dsp_prog_remove(tas_dev->fmw->programs,
> +			tas_dev->fmw->nr_programs);
> +	if (tas_dev->fmw->configs)
> +		tasdev_dsp_cfg_remove(tas_dev->fmw->configs,
> +			tas_dev->fmw->nr_configurations);
> +	kfree(tas_dev->fmw);
> +	tas_dev->fmw = NULL;
> +}
> +
> +/* DSP firmware calibration data remove function. */
> +static void tas2781_clear_calfirmware(struct tasdevice_fw *tas_fmw)
> +{
> +	struct tasdevice_calibration *calibration;
> +	struct tasdev_blk *block;
> +	unsigned int blks;
> +	int i;
> +
> +	if (!tas_fmw->calibrations)
> +		goto out;
> +
> +	for (i = 0; i < tas_fmw->nr_calibrations; i++) {
> +		calibration = &tas_fmw->calibrations[i];
> +		if (!calibration)
> +			continue;
> +
> +		if (!calibration->dev_data.dev_blks)
> +			continue;
> +
> +		for (blks = 0; blks < calibration->dev_data.nr_blk; blks++) {
> +			block = &calibration->dev_data.dev_blks[blks];
> +			if (!block)
> +				continue;
> +			kfree(block->data);
> +		}
> +		kfree(calibration->dev_data.dev_blks);
> +	}
> +	kfree(tas_fmw->calibrations);
> +out:
> +	kfree(tas_fmw);
> +}
> +
> +/* Calibration data from firmware remove function. */
> +void tasdevice_spi_calbin_remove(void *context)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +
> +	if (tas_priv->cali_data_fmw) {
> +		tas2781_clear_calfirmware(tas_priv->cali_data_fmw);
> +		tas_priv->cali_data_fmw = NULL;
> +	}
> +}
> +
> +/* Configuration remove function. */
> +void tasdevice_spi_config_info_remove(void *context)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tasdevice_rca *rca = &tas_priv->rcabin;
> +	struct tasdevice_config_info **ci = rca->cfg_info;
> +	unsigned int i, j;
> +
> +	if (!ci)
> +		return;
> +	for (i = 0; i < rca->ncfgs; i++) {
> +		if (!ci[i])
> +			continue;
> +		if (ci[i]->blk_data) {
> +			for (j = 0; j < ci[i]->real_nblocks; j++) {
> +				if (!ci[i]->blk_data[j])
> +					continue;
> +				kfree(ci[i]->blk_data[j]->regdata);
> +				kfree(ci[i]->blk_data[j]);
> +			}
> +			kfree(ci[i]->blk_data);
> +		}
> +		kfree(ci[i]);
> +	}
> +	kfree(ci);
> +}
> +
> +/* DSP firmware program block data load function. */
> +static int tasdevice_load_data(struct tasdevice_priv *tas_priv,
> +	struct tasdevice_data *dev_data)
> +{
> +	struct tasdev_blk *block;
> +	unsigned int i;
> +	int ret = 0;
> +
> +	for (i = 0; i < dev_data->nr_blk; i++) {
> +		block = &dev_data->dev_blks[i];
> +		ret = tas_priv->tasdevice_load_block(tas_priv, block);
> +		if (ret < 0)
> +			break;
> +	}
> +
> +	return ret;
> +}
> +
> +/* DSP firmware program load interface function. */
> +int tasdevice_spi_prmg_load(void *context, int prm_no)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	struct tasdevice_fw *tas_fmw = tas_priv->fmw;
> +	struct tasdevice_prog *program;
> +	struct tasdevice_config *conf;
> +	int ret = 0;
> +
> +	if (!tas_fmw) {
> +		dev_err(tas_priv->dev, "%s: Firmware is NULL\n", __func__);
> +		return -EINVAL;
> +	}
> +	if (prm_no >= 0 && prm_no <= tas_fmw->nr_programs) {
> +		tas_priv->cur_conf = 0;
> +		tas_priv->is_loading = true;
> +		program = &tas_fmw->programs[prm_no];
> +		ret = tasdevice_load_data(tas_priv, &program->dev_data);
> +		if (ret < 0) {
> +			dev_err(tas_priv->dev, "Program failed %d.\n", ret);
> +			return ret;
> +		}
> +		tas_priv->cur_prog = prm_no;
> +
> +		conf = &tas_fmw->configs[tas_priv->cur_conf];
> +		ret = tasdevice_load_data(tas_priv, &conf->dev_data);
> +		if (ret < 0)
> +			dev_err(tas_priv->dev, "Config failed %d.\n", ret);
> +	} else {
> +		dev_err(tas_priv->dev,
> +			"%s: prm(%d) is not in range of Programs %u\n",
> +			__func__, prm_no, tas_fmw->nr_programs);
> +		return -EINVAL;
> +	}
> +
> +	return ret;
> +}
> +
> +/* RCABIN configuration switch interface function. */
> +void tasdevice_spi_tuning_switch(void *context, int state)
> +{
> +	struct tasdevice_priv *tas_priv = context;
> +	int profile_cfg_id = tas_priv->rcabin.profile_cfg_id;
> +
> +	if (tas_priv->fw_state == TASDEVICE_DSP_FW_FAIL) {
> +		dev_err(tas_priv->dev, "DSP bin file not loaded\n");
> +		return;
> +	}
> +
> +	if (state == 0)
> +		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
> +			TASDEVICE_BIN_BLK_PRE_POWER_UP);
> +	else
> +		tasdevice_spi_select_cfg_blk(tas_priv, profile_cfg_id,
> +			TASDEVICE_BIN_BLK_PRE_SHUTDOWN);
> +}
> -- 
> 2.43.0
> 

