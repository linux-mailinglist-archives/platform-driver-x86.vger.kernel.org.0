Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 1E3B7340382
	for <lists+platform-driver-x86@lfdr.de>; Thu, 18 Mar 2021 11:39:27 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhCRKiy (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 18 Mar 2021 06:38:54 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:32828 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230092AbhCRKil (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 18 Mar 2021 06:38:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1616063921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=ZFcEuBunPrBlnFARDxQLLLV7P1+tq4mKkv7tIwNYp1M=;
        b=WNwC9OXknFDPhyT92UAZe+8AVyAc3qSEKc2mu7eeeC3GNNl0fuHrVM6XjXwiruOlVrmIco
        1ApeoFYqHIK1ioESfttQmj07N1Sx5++R2LvCZr3u7aE/NjSLTlZV96KbOGx8Oe8wcdswc6
        SxXSGjH0zeo4QxJ+OL5HX1968GhR0wc=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-459-Wvi3NPstOLye0RkZvcEO5w-1; Thu, 18 Mar 2021 06:38:40 -0400
X-MC-Unique: Wvi3NPstOLye0RkZvcEO5w-1
Received: by mail-ed1-f70.google.com with SMTP id v27so20910792edx.1
        for <platform-driver-x86@vger.kernel.org>; Thu, 18 Mar 2021 03:38:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=ZFcEuBunPrBlnFARDxQLLLV7P1+tq4mKkv7tIwNYp1M=;
        b=I9CiXmKPb4eoG1m9iXMbXrPZfQpS7dCo8mu71+1E1jFsoi0h+8w7xXUZGQY2ZWe0MG
         ghx77fTkZGjoZ38Wx/Sp8fK6ILIXHXZ8psIJRGtv56f4X9Wc6G3LqOQ7bfvgYmlTSj0n
         g0AQNSSJYwpDY9TzBH3yozVcSi8QhTtLBqD0mrDUxEqHr+Kc2kYI2lYvEN3ab9nGzKxl
         S97u+F+6gg4B3WLK2NXZcKegZUgA0PIDMt1zdX+Ll93uG6eqDLFU8QWhn7v8Wz027jhr
         Xr7A5gJzTY1yw/za8OHys5WjbVChGAWy1z5wZ6Qq4D46Ys9eDDzK2qMF3xRhJ+xJk8gn
         WJCw==
X-Gm-Message-State: AOAM533VVjbBh9MQICdapvEu6DUpr9CaRbpR5C7pMrwUxdN6c8BJlr9e
        cf5/Lv1nJH+xgHo/Oic9f+eBfl/YIqKqZtavVZnR3w65MnIwUUZ32+GNVZ2G9bEh1vnctTP9sMO
        GSoInKLVPez2tzWfzatKPksZMGD2N0y0cSzEtdnwNGaBX5QbnGx/h+fHkhULqI7k+Ebhr9s1YR6
        7/nr2hJmHHlw==
X-Received: by 2002:a05:6402:cb8:: with SMTP id cn24mr2818600edb.105.1616063918009;
        Thu, 18 Mar 2021 03:38:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOvfcOTS2gm4LSRU+H4K4kIec/9J1COiAQ8YD8CPJ0zSPbijCbWL5+6YeZ+yzdz1sqI/Cv5g==
X-Received: by 2002:a05:6402:cb8:: with SMTP id cn24mr2818575edb.105.1616063917805;
        Thu, 18 Mar 2021 03:38:37 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id t15sm1665733edw.84.2021.03.18.03.38.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Mar 2021 03:38:37 -0700 (PDT)
To:     Sebastian Reichel <sre@kernel.org>, Jiri Kosina <jikos@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>
Cc:     Linux PM <linux-pm@vger.kernel.org>,
        linux-input <linux-input@vger.kernel.org>,
        "platform-driver-x86@vger.kernel.org" 
        <platform-driver-x86@vger.kernel.org>
From:   Hans de Goede <hdegoede@redhat.com>
Subject: [GIT PULL] Immutable branch between drivers/platform/x86 and HID
 resp. drivers/power/supply due for the v5.13 merge window
Message-ID: <ef994907-61c7-2e0e-f26d-25b06a5dbf0f@redhat.com>
Date:   Thu, 18 Mar 2021 11:38:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi Sebastian, Jiri,

Here is a pull-req with the drivers/platform/surface changes necessary
as prereqs for the surface power_supply resp. HID patches which have been
submitted to you.

Note the dependency seems to purely be a runtime/Kconfig one, so theoretically
the patches could be merged without this, but then they cannot be compile-tested,
since the "depends on SURFACE_AGGREGATOR_REGISTRY" then will never be true.

Regards,

Hans



The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/platform-drivers-x86-surface-aggregator-v5.13-1

for you to fetch changes up to aebf0a11a8c1fb6444d1365db97f90672199a867:

  platform/surface: aggregator_registry: Add HID subsystem devices (2021-03-06 10:23:26 +0100)

----------------------------------------------------------------
Signed tag for the immutable platform-surface-aggregator-registry
branch for merging into other sub-systems.

Note this is based on v5.12-rc2.

----------------------------------------------------------------
Maximilian Luz (6):
      platform/surface: Set up Surface Aggregator device registry
      platform/surface: aggregator_registry: Add base device hub
      platform/surface: aggregator_registry: Add battery subsystem devices
      platform/surface: aggregator_registry: Add platform profile device
      platform/surface: aggregator_registry: Add DTX device
      platform/surface: aggregator_registry: Add HID subsystem devices

 MAINTAINERS                                        |   1 +
 drivers/platform/surface/Kconfig                   |  27 +
 drivers/platform/surface/Makefile                  |   1 +
 .../platform/surface/surface_aggregator_registry.c | 641 +++++++++++++++++++++
 4 files changed, 670 insertions(+)
 create mode 100644 drivers/platform/surface/surface_aggregator_registry.c

