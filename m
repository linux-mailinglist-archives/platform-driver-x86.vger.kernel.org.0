Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 009344D9F92
	for <lists+platform-driver-x86@lfdr.de>; Tue, 15 Mar 2022 17:04:36 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245178AbiCOQFp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 15 Mar 2022 12:05:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44820 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238915AbiCOQFo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 15 Mar 2022 12:05:44 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 735B41FA5E
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 09:04:32 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id lj8-20020a17090b344800b001bfaa46bca3so2706181pjb.2
        for <platform-driver-x86@vger.kernel.org>; Tue, 15 Mar 2022 09:04:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gvkC3jGwM0BSWnuGpgckFHOiTk6SWYeHrSDlcpLuLck=;
        b=3gqdwDRiCpRYgnbCiljAUJPe+a2nTGkGs2zkB5QHuuedEezypdquacGD/eUaQO1L48
         W8q+bQNYgZzYuWRLozKeXY/T6eFQRQeF0zEZJj2Uj51n8r+WEVn59ZGNDqZ3WRH9Ixbr
         vjfaZmO3t+A/a04EBXTmKgmCaYz6pFUFvcPblzGN9GWeI0uTrZv+8qlpHoRUapzOJIA0
         0LAxv4xPNTNd8ErCac5s+GPIxnEWbZF6vtS5bIIgEOOeBIDJ+DEp1UkRkXlpE8LPq4pU
         4LskO51J4VqSAb83p4KhKkgt/VPsn4Al4Dr/pozZ5fSQdu/gp2Ukcgmrc5f3QRI8t8tu
         7VRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gvkC3jGwM0BSWnuGpgckFHOiTk6SWYeHrSDlcpLuLck=;
        b=gtnWFNvU/IjirZk6TJOGr+GfbahiwKzQvOT42nfISJbC2OkLfsN7CtiH6bPMRDx6JN
         KFCkjnN0h9PvZPdsN/R4mVs+Z7Ufl3FKVttLofpnNp21taAtGewiJMW/P40ZNNgG0UQq
         Ts2OAr5MDFI56C/2e31AkypW9psIYudhC5Vu5RA9drUtRHq6mDLp5M1EX6Skq1XRHIbV
         jhkZ0a3r38rduswseHVE/9TkWfvQcdsziR/Fpu8P4cNcuwB1t+oFj0Z64sDhHMgNgo2H
         lP79Vy3URnWeL7/ZzNapBK2fYiiGJ79rHcYdnt4/1cA1gE4A/EVqfK+Y7TwLrbl5jwUT
         rN9w==
X-Gm-Message-State: AOAM531b5B+tLf1i6oQeUwdWJ/OEOEMkQtWrEovmHRpwDGIuQsm3Q3xP
        2nxs2LWCrzBQ3gudlttvPrRgnpSUPmwyGMgkshybkw==
X-Google-Smtp-Source: ABdhPJx4iexvZ9E7ec4YTysWAlz/seulvJb3IeWy/vdbRcyyJyL0GKEJRsaIdVfIyVQD8KsXXN09cpfz7Pj3dHUw5t0=
X-Received: by 2002:a17:90a:430d:b0:1bc:f340:8096 with SMTP id
 q13-20020a17090a430d00b001bcf3408096mr5395590pjg.93.1647360271908; Tue, 15
 Mar 2022 09:04:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220301195457.21152-1-jithu.joseph@intel.com>
 <Yh59rOIH24X+6GyI@kroah.com> <Yh5+om/Nr06V0+Qj@kroah.com> <Yi/Lb5laEki0JHft@agluck-desk3.sc.intel.com>
 <YjBBmEjbIaqTbVt+@kroah.com> <c4af81bd788e43dda915a1052af0be55@intel.com> <YjCwI4N00reBuIqA@kroah.com>
In-Reply-To: <YjCwI4N00reBuIqA@kroah.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 15 Mar 2022 09:04:20 -0700
Message-ID: <CAPcyv4iU5mXAjkUe-c_-Ba4Ejse90gqd=db+00jybnkV1-K6=g@mail.gmail.com>
Subject: Re: [RFC 00/10] Introduce In Field Scan driver
To:     Greg KH <gregkh@linuxfoundation.org>
Cc:     "Luck, Tony" <tony.luck@intel.com>,
        "Joseph, Jithu" <jithu.joseph@intel.com>,
        "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "bp@alien8.de" <bp@alien8.de>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>, "hpa@zytor.com" <hpa@zytor.com>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Tue, Mar 15, 2022 at 8:27 AM Greg KH <gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 15, 2022 at 02:59:03PM +0000, Luck, Tony wrote:
> > >> This seems a novel use of uevent ... is it OK, or is is abuse?
> > >
> > > Don't create "novel" uses of uevents.  They are there to express a
> > > change in state of a device so that userspace can then go and do
> > > something with that information.  If that pattern fits here, wonderful.
> >
> > Maybe Dan will chime in here to better explain his idea. I think for
> > the case where the core test fails, there is a good match with uevent.
> > The device (one CPU core) has changed state from "working" to
> > "untrustworthy". Userspace can do things like: take the logical CPUs
> > on that core offline, initiate a service call, or in a VMM cluster environment
> > migrate work to a different node.
>
> Again, I have no idea what you are doing at all with this driver, nor
> what you want to do with it.
>
> Start over please.
>
> What is the hardware you have to support?
>
> What is the expectation from userspace with regards to using the
> hardware?

Here is what I have learned about this driver since engaging on this
patch set. Cores go bad at run time. Datacenters can detect them at
scale. When I worked at Facebook there was an epic story of debugging
random user login failures that resulted in the discovery of a
marginal lot-number of CPUs in a certain cluster. In that case the
crypto instructions on a few cores of those CPUs gave wrong answers.
Whether that was an electromigration effect, or just a marginal bin of
CPUs, the only detection method was A-B testing different clusters of
CPUs to isolate the differences.

This driver takes advantage of a CPU feature to inject a diagnostic
test similar to what can be done via JTAG to validate the
functionality of a given core on a CPU at a low level. The diagnostic
is run periodically since some failures may be sensitive to thermals
while other failures may be be related to the lifetime of the CPU. The
result of the diagnostic is "here are 1 or more cores that may
miscalculate, stop using them and replace the CPU".

At a base level the ABI need only be something that conveys "core X
failed its last diagnostic". All the other details are just extra, and
in my opinion can be dropped save for maybe "core X was unable to run
the diagnostic".

The thought process that got me from the proposal on the table "extend
/sys/devices/system/cpu with per-cpu result state and other details"
to "emit uevents on each test completion" were the following:
-The complexity and maintenance burden of dynamically extending
/sys/devices/system/cpu: Given that you identified a reference
counting issue, I wondered why this was trying to use
/sys/devices/system/cpu in the first instance.

- The result of the test is an event that kicks off remediation
actions: When this fails a tech is paged to replace the CPU and in the
meantime the system can either be taken offline, or if some of the
cores are still good the workloads can be moved off of the bad cores
to keep some capacity online until the replacement can be made.

- KOBJ_CHANGE uevents are already deployed in NVME for AEN
(Asynchronous Event Notifications): If the results of the test were
conveyed only in sysfs then there would be a program that would scrape
sysfs and turn around and fire an event for the downstream remediation
actions. Uevent cuts to the chase and lets udev rule policy log,
notify, and/or take pre-emptive CPU offline action. The CPU state has
changed after a test run. It has either changed to a failed CPU, or it
has changed to one that has recently asserted its health.

> > > I doubt you can report "test results" via a uevent in a way that the
> > > current uevent states and messages would properly convey, but hey, maybe
> > > I'm wrong.
> >
> > But here things get a bit sketchy. Reporting "pass", or "didn't complete the test"
> > isn't a state change.  But it seems like a poor interface if there is no feedback
> > that the test was run. Using different methods to report pass/fail/incomplete
> > also seems user hostile.
>
> We have an in-kernel "test" framework.  Yes, it's for kernel code, but
> why not extend that to also include hardware tests?

This is where my head was at when starting out with this, but this is
more of an asynchronous error reporting mechanism like machine check,
or PCIe AER, than a test. The only difference being that the error in
this case is only reported by first requesting an error check. So it
is more similar to something like a background patrol scrub that seeks
out latent ECC errors in memory.
