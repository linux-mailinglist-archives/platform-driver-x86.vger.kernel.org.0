Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5284941F66C
	for <lists+platform-driver-x86@lfdr.de>; Fri,  1 Oct 2021 22:43:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355491AbhJAUpQ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 1 Oct 2021 16:45:16 -0400
Received: from mga12.intel.com ([192.55.52.136]:8613 "EHLO mga12.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1355475AbhJAUpN (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 1 Oct 2021 16:45:13 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10124"; a="205059066"
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; 
   d="scan'208";a="205059066"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2021 13:43:26 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.85,340,1624345200"; 
   d="scan'208";a="619392045"
Received: from linux.intel.com ([10.54.29.200])
  by fmsmga001.fm.intel.com with ESMTP; 01 Oct 2021 13:43:24 -0700
Received: from debox1-desk1.jf.intel.com (debox1-desk1.jf.intel.com [10.54.75.53])
        by linux.intel.com (Postfix) with ESMTP id 846A6580689;
        Fri,  1 Oct 2021 13:43:24 -0700 (PDT)
Message-ID: <f559b543ce28a3333e6690ba217758a08ffadf15.camel@linux.intel.com>
Subject: Re: [PATCH 5/5] platform/x86: Add Intel Software Defined Silicon
 driver
From:   "David E. Box" <david.e.box@linux.intel.com>
Reply-To: david.e.box@linux.intel.com
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     lee.jones@linaro.org, hdegoede@redhat.com, mgross@linux.intel.com,
        bhelgaas@google.com, andriy.shevchenko@linux.intel.com,
        srinivas.pandruvada@intel.com, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
Date:   Fri, 01 Oct 2021 13:43:24 -0700
In-Reply-To: <YVbwgkncsQtWuh/k@kroah.com>
References: <20211001012815.1999501-1-david.e.box@linux.intel.com>
         <20211001012815.1999501-6-david.e.box@linux.intel.com>
         <YVa46eU1VX7CM+Xd@kroah.com>
         <45b6454a3421ac064dff3ba159e02985d3e55440.camel@linux.intel.com>
         <YVbwgkncsQtWuh/k@kroah.com>
Organization: David E. Box
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, 2021-10-01 at 13:26 +0200, Greg KH wrote:
> On Fri, Oct 01, 2021 at 04:13:58AM -0700, David E. Box wrote:
> > On Fri, 2021-10-01 at 09:29 +0200, Greg KH wrote:
> > > On Thu, Sep 30, 2021 at 06:28:15PM -0700, David E. Box wrote:
> > > > +static long sdsi_device_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
> > > > +{
> > > > +       struct miscdevice *miscdev = file->private_data;
> > > > +       struct sdsi_priv *priv = to_sdsi_priv(miscdev);
> > > > +       void __user *argp = (void __user *)arg;
> > > > +       long ret = -EINVAL;
> > > > +
> > > > +       if (!priv->dev_present)
> > > > +               return -ENODEV;
> > > > +
> > > > +       if (!priv->sdsi_enabled)
> > > > +               return -EPERM;
> > > > +
> > > > +       if (cmd == SDSI_IF_READ_STATE)
> > > > +               return sdsi_if_read_state_cert(priv, argp);
> > > > +
> > > > +       mutex_lock(&priv->akc_lock);
> > > > +       switch (cmd) {
> > > > +       case SDSI_IF_PROVISION_AKC:
> > > > +               /*
> > > > +                * While writing an authentication certificate disallow other openers
> > > > +                * from using AKC or CAP.
> > > > +                */
> > > > +               if (!priv->akc_owner)
> > > > +                       priv->akc_owner = file;
> > > > +
> > > > +               if (priv->akc_owner != file) {
> > > 
> > > Please explain how this test would ever trigger and how you tested it?
> > > 
> > > What exactly are you trying to protect from here?  If userspace has your
> > > file descriptor, it can do whatever it wants, don't try to be smarter
> > > than it as you will never win.
> > > 
> > > And why are you using ioctls at all here?  As you are just
> > > reading/writing to the hardware directly, why not just use a binary
> > > sysfs file to be that pipe?  What requires an ioctl at all?
> > 
> > So an original internal version of this did use binary attributes. But there was concern during
> > review that a flow, particularly when doing the two write operations, could not be handled
> > atomically while exposed as separate files. Above is the attempt to handle the situation in the
> > ioctl. That is, whichever opener performs AKC write first would lock out all other openers from
> > performing any write until that file is closed. This is to avoid interfering with that process,
> > should the opener also decide to perform a CAP operation.
> 
> Unfortunately, your code here does not prevent that at all, so your
> moving off of a binary sysfs attribute changed nothing.
> 
> You can "prevent" this from happening just as easily through a sysfs
> attribute as you can a character device node.
> 
> > There may be future commands requiring RW ioctls as well.
> 
> How am I or anyone else supposed to know that?  We write code and review
> it for _today_, not what might be sometime in the future someday.  As
> that will be dealt with when it actually happens.

Sure. Thanks for the insightful review. I'll take your comments back and submit with the reviewed-by
tag. Will probably switch back to sysfs.

David

> 
> greg k-h


