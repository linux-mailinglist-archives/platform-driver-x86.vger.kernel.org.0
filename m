Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 88A084D0763
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Mar 2022 20:15:30 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236924AbiCGTQW (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Mar 2022 14:16:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237333AbiCGTQW (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 14:16:22 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7D17CDFB
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 11:15:27 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id k5-20020a17090a3cc500b001befa0d3102so175105pjd.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 11:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=Ec12nJBSkE86MnU2yz3hD3Crn8S+e1l2jeH9YuRdiFg=;
        b=0h/eT9ol31u+aaBaTF7odf5szx32PTHZvNh5Ed8dtxAx4adLg/+T6CA8K5Pfs/Tagh
         OgbhX2q9ZHDjCi/dTmUbkTxxK1983owlpY53/jvF+3vrcsvfG1cL9vDQt5N8ygzHQ1Qy
         NYNxWAM5UaEp7EFh7Tlun5++cjfAxUjai4dv4X5cqyiDOECQ8eVz3mGDEWujnIOQ7C5z
         W13m/XjsDWandN+9u/WHP2fsBkHIosdm7CnfqdxGcwUPS5l2wg9HSzXIYmHW6ShJ0mRK
         Ie8xjGMmg4Uyl772AdwLuqQ57FIC982eSgqVR1uaj37nar0BYitY8uFm5hRmzhSQLuuL
         YX7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=Ec12nJBSkE86MnU2yz3hD3Crn8S+e1l2jeH9YuRdiFg=;
        b=i4cOqaMDeiWNr3sE1whsTMvYVCJHlNW/k48xpEoAqJFXUcPhzhiSECG3sYWkyoUuYn
         FAVAjS/xN4bQBNG7GqiLaYuWGwluffRGfcdNjbVbUJC70DiwlLyu67VMqFK1jlNQ3oQP
         N39l9aZS1utr/RLLJ8Roqpmfz0MtPsEusjCZ4ktyRCZ1b0NYzPe39+3Rf4YNIBjUJzkh
         3S/RxKlORhC4TNToyzGUzQxDqfiQFX0Mt+USq+bB8atEY1vbOSR7d3UTLHdJlScoRwVd
         s2pSMeucHQN0B0rtrO+5p1dOVQY5lawS/X9IvtncC79mwwrAM1pKdpix2Klo0MUIkK1J
         tw9A==
X-Gm-Message-State: AOAM531+xu7LeJRm+rsPZR26mkzJLpfRjgVvuKDzuSv7e4LfltSO2gsd
        2Cpq0I7QO3Zz+YVfVtbVoCo6nhPoweJH+K4jSLO7mQ==
X-Google-Smtp-Source: ABdhPJyyCiet5Mfd0KFLhDhyKkh5WyTvUsGLB+U4nAW5fU0bwYJ6hjsEn/Zf4pjIYjWajMfWtQADvqo6T0HCv6fkeA4=
X-Received: by 2002:a17:902:7296:b0:14b:4bc6:e81 with SMTP id
 d22-20020a170902729600b0014b4bc60e81mr13651116pll.132.1646680526576; Mon, 07
 Mar 2022 11:15:26 -0800 (PST)
MIME-Version: 1.0
References: <20220301195457.21152-1-jithu.joseph@intel.com>
 <20220301195457.21152-9-jithu.joseph@intel.com> <188492dc80c017375da76d444347b1d00c2031f6.camel@intel.com>
 <7b9c788e-21dc-eedc-a1b4-9c6877fa48fe@intel.com> <CAPcyv4h=qPFrP+mRqaZhkh5ZmYjuQawsqvf+-R036ZJVKBNK4Q@mail.gmail.com>
 <33d0e764-86d9-8504-17fa-14b31c87de4e@intel.com>
In-Reply-To: <33d0e764-86d9-8504-17fa-14b31c87de4e@intel.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Mon, 7 Mar 2022 11:15:18 -0800
Message-ID: <CAPcyv4g5bq9+u0iLjhpeJw8bkbCREUw60H2z_KfDz4hHCrKdFQ@mail.gmail.com>
Subject: Re: [RFC 08/10] platform/x86/intel/ifs: Add IFS sysfs interface
To:     "Joseph, Jithu" <jithu.joseph@intel.com>
Cc:     "hdegoede@redhat.com" <hdegoede@redhat.com>,
        "markgross@kernel.org" <markgross@kernel.org>,
        "corbet@lwn.net" <corbet@lwn.net>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        "Luck, Tony" <tony.luck@intel.com>,
        "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
        "patches@lists.linux.dev" <patches@lists.linux.dev>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "mingo@redhat.com" <mingo@redhat.com>,
        "rostedt@goodmis.org" <rostedt@goodmis.org>,
        "Shankar, Ravi V" <ravi.v.shankar@intel.com>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "hpa@zytor.com" <hpa@zytor.com>, "bp@alien8.de" <bp@alien8.de>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "andriy.shevchenko@linux.intel.com" 
        <andriy.shevchenko@linux.intel.com>,
        "x86@kernel.org" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_NONE,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, Mar 7, 2022 at 11:09 AM Joseph, Jithu <jithu.joseph@intel.com> wrot=
e:
>
>
>
> On 3/7/2022 9:38 AM, Dan Williams wrote:
> > On Fri, Mar 4, 2022 at 12:42 PM Joseph, Jithu <jithu.joseph@intel.com> =
wrote:
> >>
> >>
> >>
>
> >>>> + */
> >>>> +static ssize_t details_show(struct device *dev,
> >>>> +                           struct device_attribute *attr,
> >>>> +                           char *buf)
> >>>> +{
> >>>> +       unsigned int cpu =3D dev->id;
> >>>> +       int ret;
> >>>> +
> >>>> +       if (down_trylock(&ifs_sem))
> >>>> +               return -EBUSY;
> >>>
> >>> What is the ifs_sem protecting? This result is immediately invalid
> >>> after the lock is dropped anyway, so why hold it over reading the
> >>> value? You can't prevent 2 threads racing each other here.
> >>
> >> percpu thread running scan_test_worker() will update per_cpu(ifs_state=
, cpu).scan_details. (before signalling this thread to run, this lock would=
 be acquired)
> >> This is to protect against the scenario where if the percpu thread is =
running a test and if at the same time a user is querying its status, they =
would see busy.
> >
> > That begs the question why would userspace be polling this file? Is it
> > because it does not know when a test completes otherwise? How does it
> > know that the result it is seeing is from the test it ran and not some
> > other invocation to start a new test?
>
> I think I should have explained the need for locking at a higher level .
> It is to make sure that only one of the below action happens at any time
>
> 1. single percpu test
> 2. all-cpu test (tests all cores sequentially)
> 3. scan binary reload
> 4. querying the status
>
> (There are h/w reasons for why we restrict to a  single IFS test at any t=
ime)
> If 4 happens while 1 or 2 is in progress , we return busy.  My earlier ex=
planation was trying to explain why we are preventing 4 when 1 or 2   is in=
 progress.
>
> As to the question of why would a user do 4 while 1 or 2 is in progress, =
there is no reason for him to do that, both the run_test (percpu and global=
) are blocking.
> But if he issues a test from one shell and uses another shell to query th=
e status  (while it is still in progress) he will see busy.

...and what about the race that the semaphore cannot solve of test run
launch racing collection of previous run results?

>
>
> >>>
> >>> Just have a CPU mask as an input parameter and avoid needing to hang
> >>> ifs sysfs attributes underneath /sys/device/system/cpu/ifs.
> >>
> >> The percpu sysfs has the additional function of providing percpu statu=
s and  details.
> >
> > That still does not answer the question about the input parameter for
> > selecting cores.
>
> see below
>
> >
> >> The global interface is unable to provide the status and details for a=
ll the cores in the system. It does give a summary, which
> >> guides the user to the appropriate percpu status/details
> >
> > It does not sound like the global sysfs interface is all that useful,
> > especially as it just expands the window for the global results to
> > become out of sync with the per-cpu results. With a uevent  the tool
> > can get called to handle results on per-cpu / per-test,chunk basis
> > atomically. I.e. a udev rule like:
>
> The global/percpu design was chosen after some thought on how a user migh=
t want to test his system.  And the sysfs files are grouped accordingly.
> To start with he might want to see if everything is fine with his system =
(all cores).  The global interface is for this. He can do that with a singl=
e line command
>
> echo 1 > /sys/devices/system/cpu/ifs/run_test
>
> if "/sys/devices/system/cpu/ifs/status" says anything other than pass, he=
 can identify the failed/untested cores using "/sys/devices/system/cpu/ifs/=
cpu_fail_list" and "cpu_untested_list".
>
> Now to understand why a particular core failed or retest that particular =
core, the percpu interface is present.
> (So  global and percpu views are  a simple and convenient way to expose t=
he available functionality and we went with that =E2=80=A6 I agree that an =
alternative was to provide an input parameter for selecting cores)
>
> The whole testing can be done with simple interaction with sysfs file  =
=E2=80=A6 without the need for any elaborate user space tool.

I have not asked for an "elaborate" user tool, sysfs events and
uevents allow for basic shell script tooling. Now, a more polished
tool is certainly welcome, but a sample script is better than nothing.

> Perhaps we can add recommended testing flow in the Documentation

Documentation is good for describing architecture internals and
motivation, a sample user tool / script is good for validating ABI fit
for purpose.
