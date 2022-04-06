Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A73084F510C
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 Apr 2022 04:29:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1844597AbiDFBud (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 Apr 2022 21:50:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1457911AbiDEQ6a (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 Apr 2022 12:58:30 -0400
Received: from mail-yw1-x1136.google.com (mail-yw1-x1136.google.com [IPv6:2607:f8b0:4864:20::1136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 253AE35ABC
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 Apr 2022 09:56:31 -0700 (PDT)
Received: by mail-yw1-x1136.google.com with SMTP id 00721157ae682-2e5e9025c20so142921237b3.7
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 Apr 2022 09:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=rF1PsOX4AJOtM//MLwknHaok6/4yZDRx7JcCHfO1hHQ=;
        b=lgVVrtk4AYr46G/HYrLzu0AGk00/DP/OlPu99Zqgpj0VXhYuTSFmswneZ4p2d1S/+g
         GgpjYHgjOw3fqObVbZh9bPiv2Qexm1xFUULBsjrhvp9DM7bBZuwyaZHzcnGnoEgUiGTm
         m78c5HVngjt2K+hSR450P/AE5VU9lDxHsXkmu3M9KgpdSVXdsbdP9wOTp5hYvAy93jPV
         Eu5aZvlXC6p/HM+IgjfDbe9qZFTC0myTHhJGqNjAdiTFGug7hipF5c51XsyEVslbeLHw
         pl5oZLMYVDeBZB++X3NYGWtoIL9/33qUioHM26MXlzU9nNvWm+qTeS6k3CTty9WMVFi5
         FIhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=rF1PsOX4AJOtM//MLwknHaok6/4yZDRx7JcCHfO1hHQ=;
        b=LpIHiz7oY4soBY1oE8gnU8/k37SdWBoKS53FIb+Yk6/RZcqyl6SVsbkgJGAxalwrtZ
         Z66QNUeYL1LMjAix/AL1DTkj5ymZ1gQdmYdGjXkv9XCl1PvIyTkGGmbUQ+nr28Z1+kzW
         aTO67bmejtoJvw6GuOkUQUJo16Sl0kCPRK0SvFiGFOkqSwP+KZwZS6Z4gsAg6m9zpg4r
         I5Wy38vIRzvk/hPx0U4HWPWLJOfVwJg1rxsn3FjKGPhXA4p2gLOwQOKRaL0emL+ebQKI
         RZQoLrncfwyeptzcCKja7kn/jXee4wOz87FC6Q2m2l0XpeuRA2TrWnwkpKuSNpUt2h8p
         uxCg==
X-Gm-Message-State: AOAM5335o2KmArQi1ynnZ34r3i856PN1FdkmV+P2L6ne3AeZptL6hbph
        O+1m2WfPoQyT0PTWIKSGi9X7EcaDuVwCqSVCouo=
X-Google-Smtp-Source: ABdhPJwQx1t4ybCRrvc+HFGxNSFUn/zKn7wJJiOC1AsTsxNYZ6g3O4SYUhEspWygYOQ2/AYygjAeANC5kKbJQrm/kiM=
X-Received: by 2002:a81:4e58:0:b0:2eb:5da0:e706 with SMTP id
 c85-20020a814e58000000b002eb5da0e706mr3581166ywb.412.1649177790335; Tue, 05
 Apr 2022 09:56:30 -0700 (PDT)
MIME-Version: 1.0
References: <20220404203626.4311-1-jorge.lopez2@hp.com> <20220404203626.4311-5-jorge.lopez2@hp.com>
 <BL1PR12MB515731CE551D22A5CBFB3C9DE2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
In-Reply-To: <BL1PR12MB515731CE551D22A5CBFB3C9DE2E59@BL1PR12MB5157.namprd12.prod.outlook.com>
From:   Jorge Lopez <jorgealtxwork@gmail.com>
Date:   Tue, 5 Apr 2022 11:56:19 -0500
Message-ID: <CAOOmCE-fe3ZbCKFRcsFbMxkkaYi5UTm+tQvLaq0JXD15bbWOpg@mail.gmail.com>
Subject: Re: [PATCH v1 4/6] Sure Start Security Feature
To:     "Limonciello, Mario" <Mario.Limonciello@amd.com>
Cc:     "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

hi Mario,

On Mon, Apr 4, 2022 at 5:05 PM Limonciello, Mario
<Mario.Limonciello@amd.com> wrote:
>
> [Public]
>
>
>
> > -----Original Message-----
> > From: Jorge Lopez <jorgealtxwork@gmail.com>
> > Sent: Monday, April 4, 2022 15:36
> > To: platform-driver-x86@vger.kernel.org
> > Subject: [PATCH v1 4/6] Sure Start Security Feature
> >
> > Sure Start provides advanced firmware protection and resiliency by
> > identifying and repairing unauthorized BIOS changes.  It maintains an
> > audit log of these events and other important system configuration
> > changes.  The following sysfs entries can be used to read the contents
> > of the audit log.
> >
> >       /sys/devices/platform/hp-wmi/sure_start/audit_log_entry_count
> >       /sys/devices/platform/hp-wmi/sure_start/audit_log_entries
> >
> > 'audit_log_entry_count' is a read-only file that returns the number of
> > existing audit log events available to be read
> >
> > 'audit_log_entries' is a read-only file that returns the events in the
> > log
> >
> > This feature requires "Update hp_wmi_group to simplify feature
> > addition" patch.
> >
> > All changes were validated on a HP ZBook Workstation,
> > HP EliteBook x360, and HP EliteBook 850 G8 notebooks.
> >
> > Signed-off-by: Jorge Lopez <jorge.lopez2@hp.com>
> >
> > ---
> > Based on the latest platform-drivers-x86.git/for-next
> > ---
> >  drivers/platform/x86/hp-wmi.c | 108
> > ++++++++++++++++++++++++++++++++++
> >  1 file changed, 108 insertions(+)
> >
> > diff --git a/drivers/platform/x86/hp-wmi.c b/drivers/platform/x86/hp-wmi.c
> > index 139dc079c1fa..918e3eaf1b67 100644
> > --- a/drivers/platform/x86/hp-wmi.c
> > +++ b/drivers/platform/x86/hp-wmi.c
> > @@ -126,6 +126,11 @@ enum hp_wmi_spm_commandtype {
> >       HPWMI_SECUREPLATFORM_SET_SK     = 0x12,
> >  };
> >
> > +enum hp_wmi_surestart_commandtype {
> > +     HPWMI_SURESTART_GET_LOG_COUNT   = 0x01,
> > +     HPWMI_SURESTART_GET_LOG = 0x02,
> > +};
> > +
> >  enum hp_wmi_gm_commandtype {
> >       HPWMI_FAN_SPEED_GET_QUERY = 0x11,
> >       HPWMI_SET_PERFORMANCE_MODE = 0x1A,
> > @@ -138,6 +143,7 @@ enum hp_wmi_command {
> >       HPWMI_READ      = 0x01,
> >       HPWMI_WRITE     = 0x02,
> >       HPWMI_ODM       = 0x03,
> > +     HPWMI_SURESTART = 0x20006,
> >       HPWMI_GM        = 0x20008,
> >       HPWMI_SECUREPLATFORM = 0x20010,
> >  };
> > @@ -851,6 +857,7 @@ static ssize_t spm_kek_store(struct kobject *kobj,
> >  {
> >       int ret =
> > hp_wmi_perform_query(HPWMI_SECUREPLATFORM_SET_KEK,
> >                                      HPWMI_SECUREPLATFORM, (void *)buf,
> > count, 0);
> > +
> >       return ret ? -EINVAL : count;
> >  }
> >
> > @@ -918,6 +925,106 @@ static const struct attribute_group spm_group = {
> >       .attrs = spm_attrs,
> >  };
> >
> > +/* Sure Start functions */
> > +
> > +#define LOG_MAX_ENTRIES      254
> > +#define LOG_ENTRY_SIZE       16
> > +
> > +/*
> > + * sure_start_audit_log_entry_count_show - Reports the number of
> > + *                           existing audit log entries available
> > + *                           to be read
> > + *
> > + * @kobj:  Pointer to a kernel object of things that show up as directory
> > + *      in the sysfs filesystem.
> > + * @attr:  Pointer to list of attributes for the operation
> > + * @buf:   Pointer to buffer
> > + *
> > + * Returns number of existing audit log entries available to be read,
> > + *         audit log entry size, and maximum number of entries
> > + *         supported. Otherwise, an HP WMI query specific error code
> > + *         (which is negative)
> > + *
> > + *         [No of entries],[log entry size],[Max number of entries supported]
> > + */
> > +static ssize_t sure_start_audit_log_entry_count_show(struct kobject
> > *kobj,
> > +                                                  struct kobj_attribute *attr,
> > char *buf)
> > +{
> > +     int ret;
> > +     u32 count = 0;
> > +
> > +     ret =
> > hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
> > HPWMI_SURESTART,
> > +                                &count, 0, sizeof(count));
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     return snprintf(buf, PAGE_SIZE, "%d,%d,%d\n", count,
> > LOG_ENTRY_SIZE, LOG_MAX_ENTRIES);
> > +}
> > +
> > +/*
> > + * sure_start_audit_log_entries_show() - Return all entries found in log file
> > + *
> > + * @kobj:  Pointer to a kernel object of things that show up as
> > + *      directory in the sysfs filesystem.
> > + * @attr:  Pointer to list of attributes for the operation
> > + * @buf:   Pointer to buffer
> > + *
> > + * Returns number of bytes needed to read all audit logs entries to be read.
> > + *         Otherwise, an HP WMI query specific error code (which is negative)
> > + *      -EFAULT if the audit logs size exceeds 4KB
> > + *
> > + */
> > +static ssize_t sure_start_audit_log_entries_show(struct kobject *kobj,
> > +                                              struct kobj_attribute *attr,
> > char *buf)
> > +{
> > +     int ret;
> > +     int i;
> > +     u32 count = 0;
> > +
> > +     // Get the number of event logs
> > +     ret =
> > hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG_COUNT,
> > HPWMI_SURESTART,
> > +                                &count, 1, 4);
> > +
> > +     /*
> > +      * The show() api will not work if the audit logs ever go
> > +      *  beyond 4KB
> > +      */
> > +     if (count * LOG_ENTRY_SIZE > PAGE_SIZE)
> > +             return -EFAULT;
>
> This is an interface that will be there forever, what are realistic numbers and sizes after a long time?
> I have an AMD HP laptop that is only been used a few months and checked the size like this:
> dd if=audit_log_entries of=/tmp/entries
>
The audit log will grow linearly and it is defined by BIOS.  The total
number of bytes ( audit log size times the max number of audit logs
supported by BIOS) is 4K.
The audit log size reports three values. Number of event logs, audit
log max size (16), and max of audit logs supported by BIOS (254).
(16*254 = 4K).
In your case, the total number of bytes for all audit logs available
is 224 bytes.  You can conclude, your system has 14 audit logs
available to be read  (224/16 = 14)

> If so, then maybe this should be designed as a different interface.
>
> Also, the log is readable by anybody.  Should this be root only?

No.  audit logs will be available to everyone.  The interpretation of
each audit event is done at the application level.

>
> > +
> > +     if (ret < 0)
> > +             return ret;
> > +
> > +     /*
> > +      * We are guaranteed the buffer is 4KB so today all the event
> > +      * logs will fit
> > +      */
> > +     for (i = 0; ((i < count) & (ret >= 0)); i++) {
> > +             *buf = (i + 1);
> > +             ret =
> > hp_wmi_perform_query(HPWMI_SURESTART_GET_LOG,
> > +                                        HPWMI_SURESTART,
> > +                                        buf, 1, 128);
> > +             if (ret >= 0)
> > +                     buf += LOG_ENTRY_SIZE;
> > +     }
> > +
> > +     return (count * LOG_ENTRY_SIZE);
> > +}
> > +
> > +HPWMI_ATTR_RO(sure_start, audit_log_entry_count);
> > +HPWMI_ATTR_RO(sure_start, audit_log_entries);
> > +
> > +static struct attribute *sure_start_attrs[] = {
> > +     &sure_start_audit_log_entry_count.attr,
> > +     &sure_start_audit_log_entries.attr,
> > +     NULL,
> > +};
> > +
> > +static const struct attribute_group sure_start_group = {
> > +     .name = "sure_start",
> > +     .attrs = sure_start_attrs,
> > +};
> > +
> >  static DEVICE_ATTR_RO(display);
> >  static DEVICE_ATTR_RO(hddtemp);
> >  static DEVICE_ATTR_RW(als);
> > @@ -942,6 +1049,7 @@ static const struct attribute_group hp_wmi_group =
> > {
> >  static const struct attribute_group *hp_wmi_groups[] = {
> >       &hp_wmi_group,
> >       &spm_group,
> > +     &sure_start_group,
> >       NULL,
> >  };
> >
> > --
> > 2.25.1
