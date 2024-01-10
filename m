Return-Path: <platform-driver-x86+bounces-877-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EF18275B3
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 17:47:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DC926B229E1
	for <lists+platform-driver-x86@lfdr.de>; Mon,  8 Jan 2024 16:47:35 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7227353E29;
	Mon,  8 Jan 2024 16:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6BcFA54"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C87953E1F;
	Mon,  8 Jan 2024 16:47:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DAD4C433C7;
	Mon,  8 Jan 2024 16:47:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704732451;
	bh=jzDkSjutnyqB5ptCxHZmeZ8btzWzzzXxGc19LnLLUvM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g6BcFA54b/ebIXlI8FXszZlG40NEosKc9Tb1tFElD7zadCoMg5V5PuR8TX6kjIF3o
	 nhSkjUr4di7NPe38voOJFcHH8dz5gLaH+/RCcPBLHRLlrVANlu0NqDw9riJx1Tjpma
	 D5A2GUHlfneg9OC3dPB4fSvZPUcT8mORgZ2Lto8a43mtJ/jhD8fuA0EQyCkIFaLhTH
	 vYN2huPrEYTTAeFLv9wdrBKMQg0spM9Vgg6u96fjvJUxS9vrjWGh44Zar/oHazjcmZ
	 jcmLa7oaZrL5XPw800d6DkF0DkuubJ9odqzGD9PizJSPaflUI/fYCoaUPZQpAOIljN
	 xlMX/U/k1zb+A==
Date: Mon, 8 Jan 2024 09:47:29 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
Cc: hdegoede@redhat.com, ilpo.jarvinen@linux.intel.com,
	keescook@chromium.org, samitolvanen@google.com,
	platform-driver-x86@vger.kernel.org, llvm@lists.linux.dev,
	patches@lists.linux.dev
Subject: Re: [PATCH] platform/x86: intel-uncore-freq: Fix types in sysfs
 callbacks
Message-ID: <20240108164729.GA3199973@dev-arch.thelio-3990X>
References: <20240104-intel-uncore-freq-kcfi-fix-v1-1-bf1e8939af40@kernel.org>
 <4867adc4063d8b808c05141942eac426ac78bab9.camel@linux.intel.com>
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4867adc4063d8b808c05141942eac426ac78bab9.camel@linux.intel.com>

On Sun, Jan 07, 2024 at 11:25:53PM -0800, srinivas pandruvada wrote:
> On Thu, 2024-01-04 at 15:59 -0700, Nathan Chancellor wrote:
> > When booting a kernel with CONFIG_CFI_CLANG, there is a CFI failure
> > when
> > accessing any of the values under
> > /sys/devices/system/cpu/intel_uncore_frequency/package_00_die_00:
> > 
> >   $ cat
> > /sys/devices/system/cpu/intel_uncore_frequency/package_00_die_00/max_
> > freq_khz
> >   fish: Job 1, 'cat /sys/devices/system/cpu/int…' terminated by
> > signal SIGSEGV (Address boundary error)
> > 
> >   $ sudo dmesg &| grep 'CFI failure'
> >   [  170.953925] CFI failure at kobj_attr_show+0x19/0x30 (target:
> > show_max_freq_khz+0x0/0xc0 [intel_uncore_frequency_common]; expected
> > type: 0xd34078c5
> > 
> > The sysfs callback functions such as show_domain_id() are written as
> > if
> > they are going to be called by dev_attr_show() but as the above
> > message
> > shows, they are instead called by kobj_attr_show(). kCFI checks that
> > the
> > destination of an indirect jump has the exact same type as the
> > prototype
> > of the function pointer it is called through and fails when they do
> > not.
> > 
> > These callbacks are called through kobj_attr_show() because
> > uncore_root_kobj was initialized with kobject_create_and_add(), which
> > means uncore_root_kobj has a ->sysfs_ops of kobj_sysfs_ops from
> > kobject_create(), which uses kobj_attr_show() as its ->show() value.
> > 
> > The only reason there has not been a more noticeable problem until
> > this
> > point is that 'struct kobj_attribute' and 'struct device_attribute'
> > have
> > the same layout, so getting the callback from container_of() works
> > the
> > same with either value.
> > 
> > Change all the callbacks and their uses to be compatible with
> > kobj_attr_show() and kobj_attr_store(), which resolves the kCFI
> > failure
> > and allows the sysfs files to work properly.
> > 
> > Closes: https://github.com/ClangBuiltLinux/linux/issues/1974
> > Fixes: ae7b2ce57851 ("platform/x86/intel/uncore-freq: Use sysfs API
> > to create attributes")
> > Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> Do you need Cc: stable@vger.kernel.org 

Yes, I think we do, and I see Hans graciously added that for me during
application. Thanks for taking a look!

>  Acked-by: Srinivas Pandruvada <srinivas.pandruvada@linux.intel.com>
> 
> > ---
> > I think I got the fixes tag right. I only started seeing this because
> > of
> > commit 27f2b08735c9 ("platform/x86: intel-uncore-freq: Add additional
> > client processors"), which allows this driver to load on my i7-11700
> > test system but I think the commit in the Fixes tag incorrectly
> > changes
> > the types of the callbacks.
> > ---
> >  .../uncore-frequency/uncore-frequency-common.c     | 82 +++++++++++-
> > ----------
> >  .../uncore-frequency/uncore-frequency-common.h     | 32 ++++-----
> >  2 files changed, 57 insertions(+), 57 deletions(-)
> > 
> > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency-common.c b/drivers/platform/x86/intel/uncore-
> > frequency/uncore-frequency-common.c
> > index 33ab207493e3..33bb58dc3f78 100644
> > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.c
> > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.c
> > @@ -23,23 +23,23 @@ static int (*uncore_read)(struct uncore_data
> > *data, unsigned int *min, unsigned
> >  static int (*uncore_write)(struct uncore_data *data, unsigned int
> > input, unsigned int min_max);
> >  static int (*uncore_read_freq)(struct uncore_data *data, unsigned
> > int *freq);
> >  
> > -static ssize_t show_domain_id(struct device *dev, struct
> > device_attribute *attr, char *buf)
> > +static ssize_t show_domain_id(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> >  {
> > -       struct uncore_data *data = container_of(attr, struct
> > uncore_data, domain_id_dev_attr);
> > +       struct uncore_data *data = container_of(attr, struct
> > uncore_data, domain_id_kobj_attr);
> >  
> >         return sprintf(buf, "%u\n", data->domain_id);
> >  }
> >  
> > -static ssize_t show_fabric_cluster_id(struct device *dev, struct
> > device_attribute *attr, char *buf)
> > +static ssize_t show_fabric_cluster_id(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> >  {
> > -       struct uncore_data *data = container_of(attr, struct
> > uncore_data, fabric_cluster_id_dev_attr);
> > +       struct uncore_data *data = container_of(attr, struct
> > uncore_data, fabric_cluster_id_kobj_attr);
> >  
> >         return sprintf(buf, "%u\n", data->cluster_id);
> >  }
> >  
> > -static ssize_t show_package_id(struct device *dev, struct
> > device_attribute *attr, char *buf)
> > +static ssize_t show_package_id(struct kobject *kobj, struct
> > kobj_attribute *attr, char *buf)
> >  {
> > -       struct uncore_data *data = container_of(attr, struct
> > uncore_data, package_id_dev_attr);
> > +       struct uncore_data *data = container_of(attr, struct
> > uncore_data, package_id_kobj_attr);
> >  
> >         return sprintf(buf, "%u\n", data->package_id);
> >  }
> > @@ -97,30 +97,30 @@ static ssize_t show_perf_status_freq_khz(struct
> > uncore_data *data, char *buf)
> >  }
> >  
> >  #define store_uncore_min_max(name,
> > min_max)                            \
> > -       static ssize_t store_##name(struct device *dev,         \
> > -                                    struct device_attribute
> > *attr,     \
> > +       static ssize_t store_##name(struct kobject
> > *kobj,               \
> > +                                    struct kobj_attribute
> > *attr,       \
> >                                      const char *buf, size_t
> > count)     \
> >         {                                                            
> >    \
> > -               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_dev_attr);\
> > +               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_kobj_attr);\
> >                                                                      
> >    \
> >                 return store_min_max_freq_khz(data, buf, count, \
> >                                               min_max);         \
> >         }
> >  
> >  #define show_uncore_min_max(name,
> > min_max)                             \
> > -       static ssize_t show_##name(struct device *dev,          \
> > -                                   struct device_attribute *attr,
> > char *buf)\
> > +       static ssize_t show_##name(struct kobject
> > *kobj,                \
> > +                                   struct kobj_attribute *attr, char
> > *buf)\
> >         {                                                            
> >    \
> > -               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_dev_attr);\
> > +               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_kobj_attr);\
> >                                                                      
> >    \
> >                 return show_min_max_freq_khz(data, buf,
> > min_max);       \
> >         }
> >  
> >  #define
> > show_uncore_perf_status(name)                                  \
> > -       static ssize_t show_##name(struct device *dev,          \
> > -                                  struct device_attribute *attr,
> > char *buf)\
> > +       static ssize_t show_##name(struct kobject
> > *kobj,                \
> > +                                  struct kobj_attribute *attr, char
> > *buf)\
> >         {                                                            
> >    \
> > -               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_dev_attr);\
> > +               struct uncore_data *data = container_of(attr, struct
> > uncore_data, name##_kobj_attr);\
> >                                                                      
> >    \
> >                 return show_perf_status_freq_khz(data, buf); \
> >         }
> > @@ -134,11 +134,11 @@ show_uncore_min_max(max_freq_khz, 1);
> >  show_uncore_perf_status(current_freq_khz);
> >  
> >  #define
> > show_uncore_data(member_name)                                  \
> > -       static ssize_t show_##member_name(struct device *dev,   \
> > -                                          struct device_attribute
> > *attr, char *buf)\
> > +       static ssize_t show_##member_name(struct kobject *kobj, \
> > +                                          struct kobj_attribute
> > *attr, char *buf)\
> >         {                                                            
> >    \
> >                 struct uncore_data *data = container_of(attr, struct
> > uncore_data,\
> > -                                                        
> > member_name##_dev_attr);\
> > +                                                        
> > member_name##_kobj_attr);\
> >                                                                      
> >    \
> >                 return sysfs_emit(buf,
> > "%u\n",                          \
> >                                  data-
> > >member_name);                    \
> > @@ -149,29 +149,29 @@ show_uncore_data(initial_max_freq_khz);
> >  
> >  #define
> > init_attribute_rw(_name)                                       \
> >         do
> > {                                                            \
> > -               sysfs_attr_init(&data->_name##_dev_attr.attr);  \
> > -               data->_name##_dev_attr.show =
> > show_##_name;             \
> > -               data->_name##_dev_attr.store =
> > store_##_name;           \
> > -               data->_name##_dev_attr.attr.name =
> > #_name;              \
> > -               data->_name##_dev_attr.attr.mode =
> > 0644;                \
> > +               sysfs_attr_init(&data->_name##_kobj_attr.attr); \
> > +               data->_name##_kobj_attr.show =
> > show_##_name;            \
> > +               data->_name##_kobj_attr.store =
> > store_##_name;          \
> > +               data->_name##_kobj_attr.attr.name =
> > #_name;             \
> > +               data->_name##_kobj_attr.attr.mode =
> > 0644;               \
> >         } while (0)
> >  
> >  #define
> > init_attribute_ro(_name)                                       \
> >         do
> > {                                                            \
> > -               sysfs_attr_init(&data->_name##_dev_attr.attr);  \
> > -               data->_name##_dev_attr.show =
> > show_##_name;             \
> > -               data->_name##_dev_attr.store =
> > NULL;                    \
> > -               data->_name##_dev_attr.attr.name =
> > #_name;              \
> > -               data->_name##_dev_attr.attr.mode =
> > 0444;                \
> > +               sysfs_attr_init(&data->_name##_kobj_attr.attr); \
> > +               data->_name##_kobj_attr.show =
> > show_##_name;            \
> > +               data->_name##_kobj_attr.store =
> > NULL;                   \
> > +               data->_name##_kobj_attr.attr.name =
> > #_name;             \
> > +               data->_name##_kobj_attr.attr.mode =
> > 0444;               \
> >         } while (0)
> >  
> >  #define
> > init_attribute_root_ro(_name)                                  \
> >         do
> > {                                                            \
> > -               sysfs_attr_init(&data->_name##_dev_attr.attr);  \
> > -               data->_name##_dev_attr.show =
> > show_##_name;             \
> > -               data->_name##_dev_attr.store =
> > NULL;                    \
> > -               data->_name##_dev_attr.attr.name =
> > #_name;              \
> > -               data->_name##_dev_attr.attr.mode =
> > 0400;                \
> > +               sysfs_attr_init(&data->_name##_kobj_attr.attr); \
> > +               data->_name##_kobj_attr.show =
> > show_##_name;            \
> > +               data->_name##_kobj_attr.store =
> > NULL;                   \
> > +               data->_name##_kobj_attr.attr.name =
> > #_name;             \
> > +               data->_name##_kobj_attr.attr.mode =
> > 0400;               \
> >         } while (0)
> >  
> >  static int create_attr_group(struct uncore_data *data, char *name)
> > @@ -186,21 +186,21 @@ static int create_attr_group(struct uncore_data
> > *data, char *name)
> >  
> >         if (data->domain_id != UNCORE_DOMAIN_ID_INVALID) {
> >                 init_attribute_root_ro(domain_id);
> > -               data->uncore_attrs[index++] = &data-
> > >domain_id_dev_attr.attr;
> > +               data->uncore_attrs[index++] = &data-
> > >domain_id_kobj_attr.attr;
> >                 init_attribute_root_ro(fabric_cluster_id);
> > -               data->uncore_attrs[index++] = &data-
> > >fabric_cluster_id_dev_attr.attr;
> > +               data->uncore_attrs[index++] = &data-
> > >fabric_cluster_id_kobj_attr.attr;
> >                 init_attribute_root_ro(package_id);
> > -               data->uncore_attrs[index++] = &data-
> > >package_id_dev_attr.attr;
> > +               data->uncore_attrs[index++] = &data-
> > >package_id_kobj_attr.attr;
> >         }
> >  
> > -       data->uncore_attrs[index++] = &data-
> > >max_freq_khz_dev_attr.attr;
> > -       data->uncore_attrs[index++] = &data-
> > >min_freq_khz_dev_attr.attr;
> > -       data->uncore_attrs[index++] = &data-
> > >initial_min_freq_khz_dev_attr.attr;
> > -       data->uncore_attrs[index++] = &data-
> > >initial_max_freq_khz_dev_attr.attr;
> > +       data->uncore_attrs[index++] = &data-
> > >max_freq_khz_kobj_attr.attr;
> > +       data->uncore_attrs[index++] = &data-
> > >min_freq_khz_kobj_attr.attr;
> > +       data->uncore_attrs[index++] = &data-
> > >initial_min_freq_khz_kobj_attr.attr;
> > +       data->uncore_attrs[index++] = &data-
> > >initial_max_freq_khz_kobj_attr.attr;
> >  
> >         ret = uncore_read_freq(data, &freq);
> >         if (!ret)
> > -               data->uncore_attrs[index++] = &data-
> > >current_freq_khz_dev_attr.attr;
> > +               data->uncore_attrs[index++] = &data-
> > >current_freq_khz_kobj_attr.attr;
> >  
> >         data->uncore_attrs[index] = NULL;
> >  
> > diff --git a/drivers/platform/x86/intel/uncore-frequency/uncore-
> > frequency-common.h b/drivers/platform/x86/intel/uncore-
> > frequency/uncore-frequency-common.h
> > index 7afb69977c7e..0e5bf507e555 100644
> > --- a/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.h
> > +++ b/drivers/platform/x86/intel/uncore-frequency/uncore-frequency-
> > common.h
> > @@ -26,14 +26,14 @@
> >   * @instance_id:       Unique instance id to append to directory
> > name
> >   * @name:              Sysfs entry name for this instance
> >   * @uncore_attr_group: Attribute group storage
> > - * @max_freq_khz_dev_attr: Storage for device attribute max_freq_khz
> > - * @mix_freq_khz_dev_attr: Storage for device attribute min_freq_khz
> > - * @initial_max_freq_khz_dev_attr: Storage for device attribute
> > initial_max_freq_khz
> > - * @initial_min_freq_khz_dev_attr: Storage for device attribute
> > initial_min_freq_khz
> > - * @current_freq_khz_dev_attr: Storage for device attribute
> > current_freq_khz
> > - * @domain_id_dev_attr: Storage for device attribute domain_id
> > - * @fabric_cluster_id_dev_attr: Storage for device attribute
> > fabric_cluster_id
> > - * @package_id_dev_attr: Storage for device attribute package_id
> > + * @max_freq_khz_kobj_attr: Storage for kobject attribute
> > max_freq_khz
> > + * @mix_freq_khz_kobj_attr: Storage for kobject attribute
> > min_freq_khz
> > + * @initial_max_freq_khz_kobj_attr: Storage for kobject attribute
> > initial_max_freq_khz
> > + * @initial_min_freq_khz_kobj_attr: Storage for kobject attribute
> > initial_min_freq_khz
> > + * @current_freq_khz_kobj_attr: Storage for kobject attribute
> > current_freq_khz
> > + * @domain_id_kobj_attr: Storage for kobject attribute domain_id
> > + * @fabric_cluster_id_kobj_attr: Storage for kobject attribute
> > fabric_cluster_id
> > + * @package_id_kobj_attr: Storage for kobject attribute package_id
> >   * @uncore_attrs:      Attribute storage for group creation
> >   *
> >   * This structure is used to encapsulate all data related to uncore
> > sysfs
> > @@ -53,14 +53,14 @@ struct uncore_data {
> >         char name[32];
> >  
> >         struct attribute_group uncore_attr_group;
> > -       struct device_attribute max_freq_khz_dev_attr;
> > -       struct device_attribute min_freq_khz_dev_attr;
> > -       struct device_attribute initial_max_freq_khz_dev_attr;
> > -       struct device_attribute initial_min_freq_khz_dev_attr;
> > -       struct device_attribute current_freq_khz_dev_attr;
> > -       struct device_attribute domain_id_dev_attr;
> > -       struct device_attribute fabric_cluster_id_dev_attr;
> > -       struct device_attribute package_id_dev_attr;
> > +       struct kobj_attribute max_freq_khz_kobj_attr;
> > +       struct kobj_attribute min_freq_khz_kobj_attr;
> > +       struct kobj_attribute initial_max_freq_khz_kobj_attr;
> > +       struct kobj_attribute initial_min_freq_khz_kobj_attr;
> > +       struct kobj_attribute current_freq_khz_kobj_attr;
> > +       struct kobj_attribute domain_id_kobj_attr;
> > +       struct kobj_attribute fabric_cluster_id_kobj_attr;
> > +       struct kobj_attribute package_id_kobj_attr;
> >         struct attribute *uncore_attrs[9];
> >  };
> >  
> > 
> > ---
> > base-commit: 236f7d8034ff401d02fa6d74bae494a2b54e1834
> > change-id: 20240104-intel-uncore-freq-kcfi-fix-6ef07053db58
> > 
> > Best regards,
> 

