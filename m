Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 46DFE151DC1
	for <lists+platform-driver-x86@lfdr.de>; Tue,  4 Feb 2020 17:01:41 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727310AbgBDQBj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 4 Feb 2020 11:01:39 -0500
Received: from mga04.intel.com ([192.55.52.120]:28503 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727308AbgBDQBj (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 4 Feb 2020 11:01:39 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:01:38 -0800
X-IronPort-AV: E=Sophos;i="5.70,402,1574150400"; 
   d="scan'208";a="224336720"
Received: from dishasha-mobl.gar.corp.intel.com ([10.252.91.159])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 04 Feb 2020 08:01:36 -0800
Message-ID: <a35080ab2630e9c4703ad28f442d19fcfae0c8c1.camel@linux.intel.com>
Subject: Re: [bug report] platform/x86: Add support for Uncore frequency
 control
From:   Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     platform-driver-x86@vger.kernel.org
Date:   Tue, 04 Feb 2020 08:01:34 -0800
In-Reply-To: <3f639dbc5fedcf13ba6c6ce87e80dcbfd8fdc6a8.camel@linux.intel.com>
References: <20200204070009.pf4ejbj3iw3prs3z@kili.mountain>
         <20200204074832.GN11068@kadam>
         <7cae99aa52cd9dc164d09286ececa3e16d094492.camel@linux.intel.com>
         <20200204150625.GR11068@kadam>
         <3f639dbc5fedcf13ba6c6ce87e80dcbfd8fdc6a8.camel@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.34.1-2 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, 2020-02-04 at 07:22 -0800, Srinivas Pandruvada wrote:
> On Tue, 2020-02-04 at 18:06 +0300, Dan Carpenter wrote:
> > On Tue, Feb 04, 2020 at 06:58:00AM -0800, Srinivas Pandruvada
> > wrote:
> > > > lib/kobject.c
> > > >    664  static void kobject_cleanup(struct kobject *kobj)
> > > >    665  {
> > > >    666          struct kobj_type *t = get_ktype(kobj);
> > > >    667          const char *name = kobj->name;
> > > >    668  
> > > >    669          pr_debug("kobject: '%s' (%p): %s, parent %p\n",
> > > >    670                   kobject_name(kobj), kobj, __func__,
> > > > kobj-
> > > > > parent);
> > > >    671  
> > > >    672          if (t && !t->release)
> > > >    673                  pr_debug("kobject: '%s' (%p): does not
> > > > have a
> > > > release() function, it is broken and must be fixed. See
> > > > Documentation/kobject.txt.\n",
> > > >                                   ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > ^^
> > > > ^^^^
> > > > ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > > > 
> > > >    674                           kobject_name(kobj), kobj);
> > > > 
> > > There are several usages in kernel without release callback. 
> > 
> > There are 19.  They mostly have to do with sysfs?
Yes.


> >   I'm still figuring
> > these things out so I don't know how it all fits together yet.
> So this is patch is not the only one.
> 
> > > Does the attach patch fixes the warning?
> > > 
> > > Thanks,
> > > Srinivas
> > > 
> > > 
> > > > regards,
> > > > dan carpenter
> > > > 
> > > From 959ee9fe784d623960df2560fd13cae215b464d4 Mon Sep 17 00:00:00
> > > 2001
> > > From: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> > > Date: Tue, 4 Feb 2020 06:50:11 -0800
> > > Subject: [PATCH] platform/x86/intel-uncore-freq: Add release
> > > function
> > > 
> > > When user mode is reference to the kobject, wait to free the
> > > memory
> > > during module unload by adding a release callback.
> > > 
> > > Signed-off-by: Srinivas Pandruvada <
> > > srinivas.pandruvada@linux.intel.com>
> > > ---
> > >  drivers/platform/x86/intel-uncore-frequency.c | 15
> > > +++++++++++++--
> > >  1 file changed, 13 insertions(+), 2 deletions(-)
> > > 
> > > diff --git a/drivers/platform/x86/intel-uncore-frequency.c
> > > b/drivers/platform/x86/intel-uncore-frequency.c
> > > index 2b1a0734c3f8..3eda66d0713b 100644
> > > --- a/drivers/platform/x86/intel-uncore-frequency.c
> > > +++ b/drivers/platform/x86/intel-uncore-frequency.c
> > > @@ -217,12 +217,21 @@ static struct attribute *uncore_attrs[] = {
> > >  	NULL
> > >  };
> > >  
> > > +
> > > +static void uncore_sysfs_entry_release(struct kobject *kobj)
> > > +{
> > > +	if (!uncore_max_entries)
> > > +		kfree(uncore_instances);
> > > +}
> > > +
> > >  static struct kobj_type uncore_ktype = {
> > > +	.release = uncore_sysfs_entry_release,
> > >  	.sysfs_ops = &kobj_sysfs_ops,
> > >  	.default_attrs = uncore_attrs,
> > >  };
> > >  
> > >  static struct kobj_type uncore_root_ktype = {
> > > +	.release = uncore_sysfs_entry_release,
> > >  	.sysfs_ops = &kobj_sysfs_ops,
> > >  };
> > >  
> > > @@ -281,9 +290,9 @@ static void uncore_remove_die_entry(int cpu)
> > >  	mutex_lock(&uncore_lock);
> > >  	data = uncore_get_instance(cpu);
> > >  	if (data) {
> > > -		kobject_put(&data->kobj);
> > >  		data->control_cpu = -1;
> > >  		data->valid = false;
> > > +		kobject_put(&data->kobj);
> > >  	}
> > >  	mutex_unlock(&uncore_lock);
> > >  }
> > > @@ -424,12 +433,14 @@ static void __exit intel_uncore_exit(void)
> > >  
> > >  	unregister_pm_notifier(&uncore_pm_nb);
> > >  	cpuhp_remove_state(uncore_hp_state);
> > > +	mutex_lock(&uncore_lock);
> > 
> > It's not clear what this locking does.  The actual
> > uncore_sysfs_entry_release()
> > can be called from a different work queue depending on the
> > .config.  See
> > how kobject_release() is implemented.
> 
> I think your static checker is checking a case where user space has
> kobject reference and will try to read/write while and user is
> unloading module. The mutex locks are not really necessary.
> I am trying to hold the free of the memory.
> 
> 
> Thanks,
> Srinivas
> 
> 
> 
> > regards,
> > dan carpenter
> > 
> > 
> > >  	for (i = 0; i < uncore_max_entries; ++i) {
> > >  		if (uncore_instances[i].valid)
> > >  			kobject_put(&uncore_instances[i].kobj);
> > >  	}
> > > +	uncore_max_entries = 0;
> > >  	kobject_put(&uncore_root_kobj);
> > > -	kfree(uncore_instances);
> > > +	mutex_unlock(&uncore_lock);
> > >  }
> > >  module_exit(intel_uncore_exit)

