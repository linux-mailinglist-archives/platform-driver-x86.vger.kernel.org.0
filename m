Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 035E5151CEE
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2020 16:07:38 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727305AbgBDPHh (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Feb 2020 10:07:37 -0500
Received: from userp2120.oracle.com ([156.151.31.85]:39956 "EHLO
        userp2120.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727250AbgBDPHh (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Feb 2020 10:07:37 -0500
Received: from pps.filterd (userp2120.oracle.com [127.0.0.1])
        by userp2120.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014ExW1M012668;
        Tue, 4 Feb 2020 15:06:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=date : from : to : cc
 : subject : message-id : references : mime-version : content-type :
 in-reply-to; s=corp-2019-08-05;
 bh=dd+iXR/tjnyRtcKk6cuEt18AIyPemfuw34GSWTU/YyI=;
 b=AgmpfuBzxPbUTOcWttSEhgX95//f63qwi2Ac9eNv2gU/oZvn6jfqDop9jiHY7QdZPyfz
 K7Odt136HJStBaLd0SSGqS1UFeBwcvu9zoGy9B37Rz25iA3TBW7VnW/fE93J/U6IdeGI
 G54XTBvc3fkaDAl9vRXepiSNs/Y7XWLLDX3Rr6yl6JD9W/2S3kCozDxnfkJZtoaVL3N6
 RdDNHn7dDZLrcPrbjfyekemFaQOXgqIf9N4fQjYZXr+XfMGI+9wVnT35BYWyV9u3xaDc
 dFQpsQQwmZFM/ju/GoefS7vp38gJH1YaQt9BY/l9EHJBYpMd4k3ZP8HdAwghXBCgV5HR jA== 
Received: from userp3030.oracle.com (userp3030.oracle.com [156.151.31.80])
        by userp2120.oracle.com with ESMTP id 2xwyg9kf9r-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 15:06:35 +0000
Received: from pps.filterd (userp3030.oracle.com [127.0.0.1])
        by userp3030.oracle.com (8.16.0.27/8.16.0.27) with SMTP id 014F0viG031310;
        Tue, 4 Feb 2020 15:06:34 GMT
Received: from userv0121.oracle.com (userv0121.oracle.com [156.151.31.72])
        by userp3030.oracle.com with ESMTP id 2xxvuryfxv-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 04 Feb 2020 15:06:34 +0000
Received: from abhmp0009.oracle.com (abhmp0009.oracle.com [141.146.116.15])
        by userv0121.oracle.com (8.14.4/8.13.8) with ESMTP id 014F6Xw3002441;
        Tue, 4 Feb 2020 15:06:34 GMT
Received: from kadam (/129.205.23.165)
        by default (Oracle Beehive Gateway v4.0)
        with ESMTP ; Tue, 04 Feb 2020 07:06:33 -0800
Date:   Tue, 4 Feb 2020 18:06:25 +0300
From:   Dan Carpenter <dan.carpenter@oracle.com>
To:     Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
Cc:     platform-driver-x86@vger.kernel.org
Subject: Re: [bug report] platform/x86: Add support for Uncore frequency
 control
Message-ID: <20200204150625.GR11068@kadam>
References: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
 <20200204074832.GN11068@kadam>
 <7cae99aa52cd9dc164d09286ececa3e16d094492.camel@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7cae99aa52cd9dc164d09286ececa3e16d094492.camel@linux.intel.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=2 malwarescore=0
 phishscore=0 bulkscore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.0.1-1911140001 definitions=main-2002040105
X-Proofpoint-Virus-Version: vendor=nai engine=6000 definitions=9520 signatures=668685
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 priorityscore=1501 malwarescore=0
 suspectscore=2 phishscore=0 bulkscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 impostorscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.0.1-1911140001
 definitions=main-2002040105
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Feb 04, 2020 at 06:58:00AM -0800, Srinivas Pandruvada wrote:
> > lib/kobject.c
> >    664  static void kobject_cleanup(struct kobject *kobj)
> >    665  {
> >    666          struct kobj_type *t = get_ktype(kobj);
> >    667          const char *name = kobj->name;
> >    668  
> >    669          pr_debug("kobject: '%s' (%p): %s, parent %p\n",
> >    670                   kobject_name(kobj), kobj, __func__, kobj-
> > >parent);
> >    671  
> >    672          if (t && !t->release)
> >    673                  pr_debug("kobject: '%s' (%p): does not have a
> > release() function, it is broken and must be fixed. See
> > Documentation/kobject.txt.\n",
> >                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > 
> >    674                           kobject_name(kobj), kobj);
> > 
> There are several usages in kernel without release callback. 

There are 19.  They mostly have to do with sysfs?  I'm still figuring
these things out so I don't know how it all fits together yet.

> Does the attach patch fixes the warning?
> 
> Thanks,
> Srinivas
> 
> 
> > regards,
> > dan carpenter
> > 

> From 959ee9fe784d623960df2560fd13cae215b464d4 Mon Sep 17 00:00:00 2001
> From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> Date: Tue, 4 Feb 2020 06:50:11 -0800
> Subject: [PATCH] platform/x86/intel-uncore-freq: Add release function
> 
> When user mode is reference to the kobject, wait to free the memory
> during module unload by adding a release callback.
> 
> Signed-off-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> ---
>  drivers/platform/x86/intel-uncore-frequency.c | 15 +++++++++++++--
>  1 file changed, 13 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/platform/x86/intel-uncore-frequency.c b/drivers/platform/x86/intel-uncore-frequency.c
> index 2b1a0734c3f8..3eda66d0713b 100644
> --- a/drivers/platform/x86/intel-uncore-frequency.c
> +++ b/drivers/platform/x86/intel-uncore-frequency.c
> @@ -217,12 +217,21 @@ static struct attribute *uncore_attrs[] = {
>  	NULL
>  };
>  
> +
> +static void uncore_sysfs_entry_release(struct kobject *kobj)
> +{
> +	if (!uncore_max_entries)
> +		kfree(uncore_instances);
> +}
> +
>  static struct kobj_type uncore_ktype = {
> +	.release = uncore_sysfs_entry_release,
>  	.sysfs_ops = &kobj_sysfs_ops,
>  	.default_attrs = uncore_attrs,
>  };
>  
>  static struct kobj_type uncore_root_ktype = {
> +	.release = uncore_sysfs_entry_release,
>  	.sysfs_ops = &kobj_sysfs_ops,
>  };
>  
> @@ -281,9 +290,9 @@ static void uncore_remove_die_entry(int cpu)
>  	mutex_lock(&uncore_lock);
>  	data = uncore_get_instance(cpu);
>  	if (data) {
> -		kobject_put(&data->kobj);
>  		data->control_cpu = -1;
>  		data->valid = false;
> +		kobject_put(&data->kobj);
>  	}
>  	mutex_unlock(&uncore_lock);
>  }
> @@ -424,12 +433,14 @@ static void __exit intel_uncore_exit(void)
>  
>  	unregister_pm_notifier(&uncore_pm_nb);
>  	cpuhp_remove_state(uncore_hp_state);
> +	mutex_lock(&uncore_lock);

It's not clear what this locking does.  The actual uncore_sysfs_entry_release()
can be called from a different work queue depending on the .config.  See
how kobject_release() is implemented.

regards,
dan carpenter


>  	for (i = 0; i < uncore_max_entries; ++i) {
>  		if (uncore_instances[i].valid)
>  			kobject_put(&uncore_instances[i].kobj);
>  	}
> +	uncore_max_entries = 0;
>  	kobject_put(&uncore_root_kobj);
> -	kfree(uncore_instances);
> +	mutex_unlock(&uncore_lock);
>  }
>  module_exit(intel_uncore_exit)
