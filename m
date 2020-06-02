Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 84D0D1EBA31
	for <lists+platform-driver-x86@lfdr.de>; Tue,  2 Jun 2020 13:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725969AbgFBLNd (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 2 Jun 2020 07:13:33 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:60053 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1725900AbgFBLNc (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 2 Jun 2020 07:13:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1591096411;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=mcGdkq8ccdORDcTXBpKNpsu+Jhtx9060LrIuVw/kpqE=;
        b=INEANKyJjnx5vcaHZQsz+nyrsjMDjlk8tl1AIAe4my4P29BuhqNvvMwXPSc2DttxLN5K0C
        vlAt1o7SaJmFiyk5eHGTexPJHlzSHhRhx99ov2jcR3c984Ymo9D6jm3VL11iz7gpL5+Ssh
        YznjpXuXjZMxOGfITtKYvqojvtb+H88=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-267-tufw42iCOLKIPwq5y9h2Rw-1; Tue, 02 Jun 2020 07:13:30 -0400
X-MC-Unique: tufw42iCOLKIPwq5y9h2Rw-1
Received: by mail-ed1-f69.google.com with SMTP id e1so6461447edn.14
        for <platform-driver-x86@vger.kernel.org>; Tue, 02 Jun 2020 04:13:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=mcGdkq8ccdORDcTXBpKNpsu+Jhtx9060LrIuVw/kpqE=;
        b=hjWkxjE3Nghk7tDWY4Xyb650PS2iEXGDSaisJBM/ZzkUVWjdmDjrqz2jZTfwUOfELq
         8+mGB8/iFogz5gqQgsz3oh0bcQ3nSziWRZUQ6epCKpeCJu31NgQgAqNHR+T0T7U2q9g1
         wX7u9GzC1O2mf2ZiXXWB5K6mB5BoItkdxHGVVbpZOcRje6G1awUce4ZlZonqSRpgLYoq
         d7tCUsJEvTZG3hLgET2gnJwmppfTW3PpqZQ2G3MjYzizhTR8sF3olK4ASc7Bg2p40kvn
         Z+1l+WeMVFFK7Y9YiQy2mxJnyIWZhL7MYk3y4RCZhPoBCOiSDaC4SvWM2/eN8AC4C/Lv
         mq2g==
X-Gm-Message-State: AOAM533ZW3DjwCZkEMbYgbNqWs3+RwJ/OZPUg1I5aXxdX1v8KOdOjudH
        DXWbGftCcTsk//kMaAxSmgx6LaZVXRuHb6PxyY1JCfaIeaz56Fm28CN3RS8YFeUK72OxNw/BsRs
        6BUaF/g7noS5yfraWD4rwlViSxsAf9eEATQ==
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr22505494eji.338.1591096408982;
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz9aUdItLHvjAGqk/HKw4j0VB0tvMsfY3zMxv2DWihZe5mGBiU9xAECc1qiW7tSoxMN0whHxA==
X-Received: by 2002:a17:906:2e55:: with SMTP id r21mr22505473eji.338.1591096408665;
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id w28sm1487875ejk.75.2020.06.02.04.13.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Jun 2020 04:13:28 -0700 (PDT)
To:     Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     linux-hwmon@vger.kernel.org, platform-driver-x86@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: RFC: Writing a small superio kernel driver to allow superio probing
 on locked down systems?
Message-ID: <0d7e97e0-fe78-163a-cdaf-825b9d0b50ee@redhat.com>
Date:   Tue, 2 Jun 2020 13:13:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.8.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi All,

Yesterday Fedora received this bug report:

https://bugzilla.redhat.com/show_bug.cgi?id=1842611

The problem reported here is that sensors-detect is denied
/dev/ports access when run on systems booted with secure-boot
enabled (and thus kernel-lockdown mode activated).

I've been thinking a bit about this issue and I was thinking
that maybe we could do a very small kernel driver to help
sensors-detect here (and which might also be useful for
other diagnostic purposes) ?

The idea would be to take the superio probe code from
sensors-detect and put it in a kernel module under
drivers/platform/x86.

This module will never autoload (sensors-detect will
need to modprobe it); and this module will offer a couple
of sysfs attributes, all of which will only be readable
by root (to avoid a regular user being able to trigger
the probe if the module does somehow end up being loaded
through some other mechanism).

When the first sysfs attr is read then the module will
do the probe and export the results through sysfs
attr. With the results being the super-io base address
(0x2e or 0x4e IIRC) and the device-id of the super-io
chip; and maybe some other info.

The above proposal is a bit fuzy wrt what info will be
exported through sysfs attributes because I've not looked
at super-io probing for ages, details to be filled in later.

The main purpose of this email is to test the waters
for the concept of such a module, so some questions:

1. Do you (hwmon and platform/x86 maintainers) think
that the proposed security comprise is ok?

IOW is it ok to allow root to trigger a super-io probe,
which involves poking some io-ports. Note this will
only allow root to cause the kernel to do the probe,
the probe itself and thus the exact io-port reads / writes
are fully under the kernel's control.

2. Do you think that the concept of having a little
helper module for this, with a simple sysfs interface
is ok?

Regards,

Hans

