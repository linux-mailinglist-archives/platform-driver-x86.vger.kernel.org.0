Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 152ED5078C6
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Apr 2022 20:27:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357102AbiDSSZ2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 19 Apr 2022 14:25:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357112AbiDSSWp (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Apr 2022 14:22:45 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23ACF419AF
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Apr 2022 11:15:16 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id h5so24837831pgc.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Apr 2022 11:15:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zpBv9Q1tNkPDBxpwPbLdjbsmA3r5cT/nw1H2p8//7VQ=;
        b=nZvZCFCBv0zvPnol4PONdYJwznuBCN/AxhcMZT3PpAg7N/VnQFuPRmc59dVJmZhUZX
         ECMv/hjCGO+Yo9hPm0IPGeKJ0B6ktiAJyHTxXvVuF2aVbAVF8CuAQHgIJP1LNJMXn9tW
         pewlp4W+kHkNI1zg56QFlr1V7Y7IC03EodUwq8bmU0cnToRJRtLyABVPCFbP3syCDchx
         LDjvNXMhS7Xh2ngpvwPQ2GqpF+opYdpOjCsLq6UgJBnYaZhcq7SIJ1v5a7aSd1NogVh6
         VSjMR54pFEhQe1/PiG/gXQU8g8fXg+WNaoH+BrDQzIaYm/mRG5gcSrOvz7wSwTEhHzhn
         RLUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zpBv9Q1tNkPDBxpwPbLdjbsmA3r5cT/nw1H2p8//7VQ=;
        b=IJ8Fy+8F9zeI4NkHz9+Zn9MTSWprHpz9lDdz4f1pyWc4kXtwePLTdKvoqfEa2Tnh8f
         6PuH7uG5kY9OEr0idlDUleFPSb/z3fk76avWdsVuN1tUX25wWozoDj99PEmVtrgr3APv
         gf97a19OlqP1iWr8VIvrjYN3YmlPqj44SHv0hxTaRn9Ixx/E19ox8yeidA+sCmKF6M1g
         3LyE5SUc9fRMHYNTb1Ej6TGcG15D50V88OGFKUMqHlsWRneyWWULDIIAgkrBvqW4Y5PW
         whCpFjkXXv+hpA7eVjgFp2is460GvmSVXuwFgKYZSiXvNoLvRfRF5rZwlekVSnyi4Wgm
         gAuw==
X-Gm-Message-State: AOAM530JAr6tGsXgcPcqezhRsJgy86Q2nmeh9s55HPl/oY2RksbVOHNG
        MTbzX6Pr1IaNS1SZStoZ1bMsg0D4sVBJh8rIbD4lmA==
X-Google-Smtp-Source: ABdhPJw4oSURnCuFS/ZVGc9BlKI9iSwFoHzN3zK1GLk085q5yQt4OdaNxeK86wgd3BiiLXrJ0hkQRIeqzlpHZRTTfTo=
X-Received: by 2002:a65:6e0e:0:b0:399:26d7:a224 with SMTP id
 bd14-20020a656e0e000000b0039926d7a224mr15704175pgb.437.1650392116287; Tue, 19
 Apr 2022 11:15:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220407191347.9681-1-jithu.joseph@intel.com> <20220419163859.2228874-1-tony.luck@intel.com>
 <20220419163859.2228874-10-tony.luck@intel.com> <Yl7vdpJgKYRL1jeW@kroah.com>
 <Yl7y1YDaNVxyDnKI@agluck-desk3.sc.intel.com> <Yl74MYW1+NgH4tOX@kroah.com>
In-Reply-To: <Yl74MYW1+NgH4tOX@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 19 Apr 2022 11:15:05 -0700
Message-ID: <CAPcyv4haH561eC_+oPj8PMdf2510BDq7==orHNLoHPm0d16k2w@mail.gmail.com>
Subject: Re: [PATCH v3 09/11] platform/x86/intel/ifs: Add IFS sysfs interface
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        platform-driver-x86@vger.kernel.org, patches@lists.linux.dev,
        Ravi V Shankar <ravi.v.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Apr 19, 2022 at 11:01 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Apr 19, 2022 at 10:35:17AM -0700, Luck, Tony wrote:
> > On Tue, Apr 19, 2022 at 07:20:54PM +0200, Greg KH wrote:
> > > > +/*
> > > > + * Note there is no need for a ->remove() call back. There isn't an
> > > > + * "unload" operation to remove the scan binary from the BIOS reserved
> > > > + * area. Also ".dev_groups" removal order will guarantee that any in
> > > > + * flight tests have completed.
> > > > + */
> > >
> > > So you are ok with the warning the kernel gives you when you unload the
> > > driver?  That feels wrong :(
> >
> > What warning?
> >
> > # dmesg | tail -5
> > [   38.084165] virbr0: port 1(virbr0-nic) entered listening state
> > [   38.149621] virbr0: port 1(virbr0-nic) entered disabled state
> > [   38.582054] broken atomic modeset userspace detected, disabling atomic
> > [   43.703321] igc 0000:01:00.0 enp1s0: NIC Link is Up 2500 Mbps Full Duplex, Flow Control: RX
> > [   43.703470] IPv6: ADDRCONF(NETDEV_CHANGE): enp1s0: link becomes ready
> > # modprobe intel_ifs
> > # ls /sys/devices/platform/intel_ifs.0/
> > details  driver_override  modalias  reload    status     uevent
> > driver   image_version    power     run_test  subsystem
> > # rmmod intel_ifs
> > # dmesg | tail -5
> > [   38.084165] virbr0: port 1(virbr0-nic) entered listening state
> > [   38.149621] virbr0: port 1(virbr0-nic) entered disabled state
> > [   38.582054] broken atomic modeset userspace detected, disabling atomic
> > [   43.703321] igc 0000:01:00.0 enp1s0: NIC Link is Up 2500 Mbps Full Duplex, Flow Control: RX
> > [   43.703470] IPv6: ADDRCONF(NETDEV_CHANGE): enp1s0: link becomes ready
> > #
>
> If there's no warning when the device goes away, why the crazy comment
> trying to justify the lack of a remove callback?

The comment clarifies the nuance that driver.dev_groups coordinates
flushing access sysfs ops users before ->remove() is called. It can
certainly be dropped.
