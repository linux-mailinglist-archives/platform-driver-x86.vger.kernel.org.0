Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 0B57B48AB8C
	for <lists+platform-driver-x86@lfdr.de>; Tue, 11 Jan 2022 11:39:26 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349142AbiAKKjX (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 11 Jan 2022 05:39:23 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124]:25380 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348736AbiAKKjX (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 11 Jan 2022 05:39:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1641897562;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Xr73w+r1kljvIqPT6MwAMTI0Cl0hi1tsfX48ig8ePyk=;
        b=DcIdmvm5UzhId3rC4ZbKSgiZLEKdAY00yQpmy9sffWF2qJUnzKFmHRlPZZ+rXLuXyT8zzX
        bbwB8mtDpPifc/YRPWkLotG0izyogUo1AQhuKO2B2Ofy8iMDm2KTWC6/B6vMbRTOUvlKHD
        lHivEnl4i/uUJhFTPMubhdN4mAnSp30=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-223-RYNXNzQ4N9GqUDSVY_A39Q-1; Tue, 11 Jan 2022 05:39:21 -0500
X-MC-Unique: RYNXNzQ4N9GqUDSVY_A39Q-1
Received: by mail-ed1-f71.google.com with SMTP id c8-20020a05640227c800b003fdc1684cdeso4900233ede.12
        for <platform-driver-x86@vger.kernel.org>; Tue, 11 Jan 2022 02:39:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Xr73w+r1kljvIqPT6MwAMTI0Cl0hi1tsfX48ig8ePyk=;
        b=P07jIIunAreYPKRe3vjIAD410+lUYy33wWjucO9ZwySxqwTS9rEhvyKoU6BT4BF0d8
         Ag3yVYri89YhUgxUBr8XdKwivABmYDXitMI/tHSSY7HcpDhcGsglIEi9NFuUybYWTcDM
         QfK/53qdDqwJsrSKfiYY2D9Q4PsZApV5IpNUfchgfgKB84aOZQD3N+OzWZsMeT5tgFie
         3SPqi1YOBtRIJ7QwdIgkFiZeKs+g8sydaG3gpHwG2if8kP6K1tqnpP4s3DrMbEb/iiM9
         uPTD7CEtI+wLbfpbjMeu4CTcu0qxFnpg7Q4eIMh8T12m4bXPQ+cwvAF8R+8a0EwpGrB7
         R2MQ==
X-Gm-Message-State: AOAM5333L+PT5LqlgNTIKvE3/gnA/EaKA5IrN9QmRCgCQz2hTL/JZXQg
        V7QOeJCiSzlAZSNrmIwOKuwt7ahEe4sRRmu3xLxDhJ5I/N02aYQQH341BpycMxlfIiDLrGWmEdU
        w7vqjrBXTxEEDp83d3+PVqx3suC9T5X+UVw==
X-Received: by 2002:a17:907:c001:: with SMTP id ss1mr3201254ejc.265.1641897560146;
        Tue, 11 Jan 2022 02:39:20 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjq6Wl9IfzBSgkc9Gchd3CrWD4sn0Zi4jMLhtSosPUpcCgsiTOG/Sw4xcXnfKP0lENfux3YA==
X-Received: by 2002:a17:907:c001:: with SMTP id ss1mr3201239ejc.265.1641897559873;
        Tue, 11 Jan 2022 02:39:19 -0800 (PST)
Received: from ?IPV6:2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1? (2001-1c00-0c1e-bf00-1db8-22d3-1bc9-8ca1.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1db8:22d3:1bc9:8ca1])
        by smtp.gmail.com with ESMTPSA id g9sm3435702ejo.222.2022.01.11.02.39.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Jan 2022 02:39:19 -0800 (PST)
Message-ID: <9e5fd9f2-dda7-73ef-00a8-203da3827e9d@redhat.com>
Date:   Tue, 11 Jan 2022 11:39:19 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH] platform/x86: ISST: do not hold lock punit_misc_dev_lock
 when register misc
Content-Language: en-US
To:     Liwei Song <liwei.song@windriver.com>,
        SrinivasPandruvada <srinivas.pandruvada@linux.intel.com>,
        MarkGross <markgross@kernel.org>
Cc:     platform-driver-x86@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20220111103122.32362-1-liwei.song@windriver.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <20220111103122.32362-1-liwei.song@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 1/11/22 11:31, Liwei Song wrote:
> exist the below call sequences may cause deadlock:
> 
> isst_if_probe()
>    --> isst_if_cdev_register()
>       --> mutex_lock(&punit_misc_dev_lock)
>    --> misc_register()
>       --> mutex_lock(&misc_mtx)
> 
> misc_open()
>    --> mutex_lock(&misc_mtx)
>    --> isst_if_open()
>       --> mutex_lock(&punit_misc_dev_lock)
> 
> to fix this do not hold punit_misc_dev_lock when call misc_register
> since it has misc_mtx lock for sync.

I agree that the punit_misc_dev_lock should not be hold during
(un)registration, but this fix looks wrong with unlocking + relocking it.

Normally things like this are done by setting up everything which needs
to be setup before calling misc_register() and in that case the
setup code does not need to lock the punit_misc_dev_lock at all since
none of the misc_dev callbacks can be called before everything is
setup (and the same in reverse for unregister, unregister the misc-dev
before doing any teardown, then there is no need for the lock).

Note the above assumes that the punit_misc_dev_lock is only used
from misc-dev callbacks based on its name, I did not check this is true.

Srinivas, can you take a look please ? And see if you can come up
with a better fix ?

Regards,

Hans




> 
> [  256.104522] ======================================================
> [  256.113783] WARNING: possible circular locking dependency detected
> [  256.120093] 5.16.0-rc6-yocto-standard+ #99 Not tainted
> [  256.125362] ------------------------------------------------------
> [  256.131673] intel-speed-sel/844 is trying to acquire lock:
> [  256.137290] ffffffffc036f0d0 (punit_misc_dev_lock){+.+.}-{3:3}, at: isst_if_open+0x18/0x90 [isst_if_common]
> [  256.147171]
> [  256.147171] but task is already holding lock:
> [  256.153135] ffffffff8ee7cb50 (misc_mtx){+.+.}-{3:3}, at: misc_open+0x2a/0x170
> [  256.160407]
> [  256.160407] which lock already depends on the new lock.
> [  256.160407]
> [  256.168712]
> [  256.168712] the existing dependency chain (in reverse order) is:
> [  256.176327]
> [  256.176327] -> #1 (misc_mtx){+.+.}-{3:3}:
> [  256.181946]        lock_acquire+0x1e6/0x330
> [  256.186265]        __mutex_lock+0x9b/0x9b0
> [  256.190497]        mutex_lock_nested+0x1b/0x20
> [  256.195075]        misc_register+0x32/0x1a0
> [  256.199390]        isst_if_cdev_register+0x65/0x180 [isst_if_common]
> [  256.205878]        isst_if_probe+0x144/0x16e [isst_if_mmio]
> [  256.209991] hrtimer: interrupt took 10370 ns
> [  256.211582]        local_pci_probe+0x47/0xa0
> [  256.220384]        work_for_cpu_fn+0x17/0x30
> [  256.224790]        process_one_work+0x26a/0x650
> [  256.229456]        worker_thread+0x1dd/0x3b0
> [  256.233861]        kthread+0x191/0x1c0
> [  256.237745]        ret_from_fork+0x1f/0x30
> [  256.241976]
> [  256.241976] -> #0 (punit_misc_dev_lock){+.+.}-{3:3}:
> [  256.248552]        validate_chain+0xbc6/0x1750
> [  256.253131]        __lock_acquire+0x88c/0xc10
> [  256.257618]        lock_acquire+0x1e6/0x330
> [  256.261933]        __mutex_lock+0x9b/0x9b0
> [  256.266165]        mutex_lock_nested+0x1b/0x20
> [  256.270739]        isst_if_open+0x18/0x90 [isst_if_common]
> [  256.276356]        misc_open+0x100/0x170
> [  256.280409]        chrdev_open+0xa5/0x1e0
> [  256.284550]        do_dentry_open+0x23d/0x3c0
> [  256.289039]        vfs_open+0x2f/0x40
> [  256.292836]        path_openat+0x87a/0x940
> [  256.297064]        do_filp_open+0xc5/0x140
> [  256.301295]        do_sys_openat2+0x23d/0x320
> [  256.305782]        do_sys_open+0x59/0x80
> [  256.309836]        __x64_sys_openat+0x20/0x30
> [  256.314324]        do_syscall_64+0x3f/0x90
> [  256.318552]        entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  256.324259]
> [  256.324259] other info that might help us debug this:
> [  256.324259]
> [  256.332394]  Possible unsafe locking scenario:
> [  256.332394]
> [  256.338444]        CPU0                    CPU1
> [  256.343105]        ----                    ----
> [  256.347768]   lock(misc_mtx);
> [  256.350870]                                lock(punit_misc_dev_lock);
> [  256.357441]                                lock(misc_mtx);
> [  256.363058]   lock(punit_misc_dev_lock);
> [  256.367110]
> [  256.367110]  *** DEADLOCK ***
> [  256.367110]
> [  256.373162] 1 lock held by intel-speed-sel/844:
> [  256.377824]  #0: ffffffff8ee7cb50 (misc_mtx){+.+.}-{3:3}, at: misc_open+0x2a/0x170
> [  256.385531]
> [  256.385531] stack backtrace:
> [  256.390021] CPU: 12 PID: 844 Comm: intel-speed-sel Not tainted 5.16.0-rc6-yocto-standard+ #99
> [  256.398678] Hardware name: ACCTON MOROCITY/MOROCITY, BIOS IDVLCRB1.86B.0021.D09.2111010103 11/01/2021
> [  256.408028] Call Trace:
> [  256.410605]  <TASK>
> [  256.412837]  dump_stack_lvl+0x5b/0x82
> [  256.416635]  dump_stack+0x10/0x12
> [  256.420085]  print_circular_bug.isra.43+0x261/0x2c0
> [  256.425095]  check_noncircular+0x126/0x140
> [  256.429326]  ? __this_cpu_preempt_check+0x13/0x20
> [  256.434167]  validate_chain+0xbc6/0x1750
> [  256.438223]  ? validate_chain+0xbc6/0x1750
> [  256.442451]  ? validate_chain+0x236/0x1750
> [  256.446687]  __lock_acquire+0x88c/0xc10
> [  256.450658]  lock_acquire+0x1e6/0x330
> [  256.454452]  ? isst_if_open+0x18/0x90 [isst_if_common]
> [  256.459726]  ? __mutex_lock+0x79/0x9b0
> [  256.463610]  ? __mutex_lock+0x79/0x9b0
> [  256.467493]  ? isst_if_open+0x18/0x90 [isst_if_common]
> [  256.472764]  ? isst_if_open+0x18/0x90 [isst_if_common]
> [  256.478038]  __mutex_lock+0x9b/0x9b0
> [  256.481748]  ? isst_if_open+0x18/0x90 [isst_if_common]
> [  256.487021]  ? __mutex_lock+0x102/0x9b0
> [  256.490993]  ? __this_cpu_preempt_check+0x13/0x20
> [  256.495837]  mutex_lock_nested+0x1b/0x20
> [  256.499893]  ? mutex_lock_nested+0x1b/0x20
> [  256.504121]  isst_if_open+0x18/0x90 [isst_if_common]
> [  256.509222]  misc_open+0x100/0x170
> [  256.512759]  chrdev_open+0xa5/0x1e0
> [  256.516386]  ? cdev_put.part.1+0x20/0x20
> [  256.520441]  do_dentry_open+0x23d/0x3c0
> [  256.524414]  vfs_open+0x2f/0x40
> [  256.527689]  path_openat+0x87a/0x940
> [  256.531399]  do_filp_open+0xc5/0x140
> [  256.535112]  ? trace_preempt_on+0x28/0xd0
> [  256.539255]  ? alloc_fd+0x152/0x230
> [  256.542880]  ? preempt_count_sub+0x9b/0x100
> [  256.547200]  ? _raw_spin_unlock+0x2c/0x50
> [  256.551348]  do_sys_openat2+0x23d/0x320
> [  256.555320]  ? do_sys_openat2+0x23d/0x320
> [  256.559467]  do_sys_open+0x59/0x80
> [  256.563003]  __x64_sys_openat+0x20/0x30
> [  256.566972]  do_syscall_64+0x3f/0x90
> [  256.570680]  entry_SYSCALL_64_after_hwframe+0x44/0xae
> [  256.575866] RIP: 0033:0x7f9be4b97c27
> [  256.579576] Code: 25 00 00 41 00 3d 00 00 41 00 74 37 64 8b 04 25 18 00 00 00 85 c0 75 5b 44 89 e2 48 89 ee bf 9c ff ff ff b8 01 01 00 00 0f 05 <48> 3d 00 f0 ff ff 0f 87 85 00 00 00 48 83 c4 68 5d 41 5c c3 0f 1f
> [  256.598474] RSP: 002b:00007ffd8fc01b70 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
> [  256.606177] RAX: ffffffffffffffda RBX: 00005572f20332b0 RCX: 00007f9be4b97c27
> [  256.613443] RDX: 0000000000000000 RSI: 00005572f202936a RDI: 00000000ffffff9c
> [  256.620709] RBP: 00005572f202936a R08: 0000000000000008 R09: 0000000000000001
> [  256.627974] R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
> [  256.635241] R13: 00005572f20332b0 R14: 0000000000000001 R15: 0000000000000000
> [  256.642513]  </TASK>
> 
> Signed-off-by: Liwei Song <liwei.song@windriver.com>
> ---
>  drivers/platform/x86/intel/speed_select_if/isst_if_common.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> index c9a85eb2e860..bcbc0d508ec4 100644
> --- a/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> +++ b/drivers/platform/x86/intel/speed_select_if/isst_if_common.c
> @@ -693,10 +693,12 @@ int isst_if_cdev_register(int device_type, struct isst_if_cmd_cb *cb)
>  	if (!misc_usage_count) {
>  		int ret;
>  
> +		mutex_unlock(&punit_misc_dev_lock);
>  		misc_device_ret = misc_register(&isst_if_char_driver);
>  		if (misc_device_ret)
> -			goto unlock_exit;
> +			return misc_device_ret;
>  
> +		mutex_lock(&punit_misc_dev_lock);
>  		ret = isst_if_cpu_info_init();
>  		if (ret) {
>  			misc_deregister(&isst_if_char_driver);
> @@ -731,7 +733,9 @@ void isst_if_cdev_unregister(int device_type)
>  	if (device_type == ISST_IF_DEV_MBOX)
>  		isst_delete_hash();
>  	if (!misc_usage_count && !misc_device_ret) {
> +		mutex_unlock(&punit_misc_dev_lock);
>  		misc_deregister(&isst_if_char_driver);
> +		mutex_lock(&punit_misc_dev_lock);
>  		isst_if_cpu_info_exit();
>  	}
>  	mutex_unlock(&punit_misc_dev_lock);
> 

