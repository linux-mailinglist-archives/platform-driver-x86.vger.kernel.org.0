Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id B65A529AA89
	for <lists+platform-driver-x86@lfdr.de>; Tue, 27 Oct 2020 12:28:13 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1749901AbgJ0L2M (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 27 Oct 2020 07:28:12 -0400
Received: from us-smtp-delivery-124.mimecast.com ([63.128.21.124]:36607 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1749896AbgJ0L2L (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 27 Oct 2020 07:28:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1603798089;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=688aZm0PD/3SiVRwK7iawCj1jbJr07QWKg/+VEWty/w=;
        b=CYexGtVJsdZJD7HMAzLaQmv7ZRr2jOjbbyMwK6ht0uDWCG7ziY+wJj0hEilCoNyep+kWl1
        n1t+wJvBwEwrEei8HkNPCKzPg0HNqxXu1JY0VPCDpVByBg5stmVLG8SysHG2bDi1XWnnt5
        4otomaR6OZOrQc0KXsQKXdUYfq6DZfg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-122-UAP1HZXLMYSEIK_MXx0eNw-1; Tue, 27 Oct 2020 07:28:07 -0400
X-MC-Unique: UAP1HZXLMYSEIK_MXx0eNw-1
Received: by mail-ej1-f70.google.com with SMTP id d12so729636ejr.19
        for <platform-driver-x86@vger.kernel.org>; Tue, 27 Oct 2020 04:28:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=688aZm0PD/3SiVRwK7iawCj1jbJr07QWKg/+VEWty/w=;
        b=S0YSjRlaF3IV37nMO44tvwNWL9Nz5QQ7K8T9tTyVonCnRbYufiYovr7W/Gi+qkU77J
         DNn28LzY/EKEaz+dYoDBtjC4FU82VwQJYfbtAfb4ZGPVSOCkPxLPqqxr0gfOWVRe8TG9
         Zqsp1cUCHGHaStKrTtvpibvu/6y455Wvl1bZfRiynEQS4Itq+XbdpzVjti+cBS5iVrQ+
         F9Q08HqC6/XHL8W4KLmiPd402knXMCrsPYy90T7VLSGF+ayAb0cl2qEtmrNL75P4upMt
         7OVUSXQhROg+LHic0mb6SVOJPVS8lYroTN4nQ3bPkxzgQYzrVFBeJtJOYSOnSSxqOals
         GxIw==
X-Gm-Message-State: AOAM5306j6dktxX6PaktzOI7yA+nMK+Wj4xr04Vf71wlI6Iq/FDs3ahx
        UdrWTvnmjUDMOaUQRtIIkzVWSMlQYOCw7gE/bVA3AikECMZUw8ylRDnM12ag9xPibLuWMPeVi7+
        cO6awO9FiyHC40dak8eNjkT7W7gk3wQI1rQ==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr1706688edr.265.1603798086279;
        Tue, 27 Oct 2020 04:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwNks/irBNquuX2qqWze7N1uU8iJmXriG2IIP0ADY1uAEjDy9xgloHTRusFL49PMuOlbI5UNg==
X-Received: by 2002:aa7:c358:: with SMTP id j24mr1706652edr.265.1603798085964;
        Tue, 27 Oct 2020 04:28:05 -0700 (PDT)
Received: from x1.localdomain (2001-1c00-0c0c-fe00-d2ea-f29d-118b-24dc.cable.dynamic.v6.ziggo.nl. [2001:1c00:c0c:fe00:d2ea:f29d:118b:24dc])
        by smtp.gmail.com with ESMTPSA id yw17sm856915ejb.97.2020.10.27.04.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2020 04:28:05 -0700 (PDT)
Subject: Re: [PATCH V8 0/5] Intel Platform Monitoring Technology
To:     "David E. Box" <david.e.box@linux.intel.com>, lee.jones@linaro.org,
        dvhart@infradead.org, andy@infradead.org, bhelgaas@google.com,
        alexey.budankov@linux.intel.com
Cc:     linux-kernel@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pci@vger.kernel.org
References: <20201003013123.20269-1-david.e.box@linux.intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <2f17db4b-2988-7f0d-fd0e-9e5b621d24ec@redhat.com>
Date:   Tue, 27 Oct 2020 12:28:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201003013123.20269-1-david.e.box@linux.intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 10/3/20 3:31 AM, David E. Box wrote:
> Intel Platform Monitoring Technology (PMT) is an architecture for
> enumerating and accessing hardware monitoring capabilities on a device.
> With customers increasingly asking for hardware telemetry, engineers not
> only have to figure out how to measure and collect data, but also how to
> deliver it and make it discoverable. The latter may be through some device
> specific method requiring device specific tools to collect the data. This
> in turn requires customers to manage a suite of different tools in order to
> collect the differing assortment of monitoring data on their systems.  Even
> when such information can be provided in kernel drivers, they may require
> constant maintenance to update register mappings as they change with
> firmware updates and new versions of hardware. PMT provides a solution for
> discovering and reading telemetry from a device through a hardware agnostic
> framework that allows for updates to systems without requiring patches to
> the kernel or software tools.
> 
> PMT defines several capabilities to support collecting monitoring data from
> hardware. All are discoverable as separate instances of the PCIE Designated
> Vendor extended capability (DVSEC) with the Intel vendor code. The DVSEC ID
> field uniquely identifies the capability. Each DVSEC also provides a BAR
> offset to a header that defines capability-specific attributes, including
> GUID, feature type, offset and length, as well as configuration settings
> where applicable. The GUID uniquely identifies the register space of any
> monitor data exposed by the capability. The GUID is associated with an XML
> file from the vendor that describes the mapping of the register space along
> with properties of the monitor data. This allows vendors to perform
> firmware updates that can change the mapping (e.g. add new metrics) without
> requiring any changes to drivers or software tools. The new mapping is
> confirmed by an updated GUID, read from the hardware, which software uses
> with a new XML.
> 
> The current capabilities defined by PMT are Telemetry, Watcher, and
> Crashlog.  The Telemetry capability provides access to a continuous block
> of read only data. The Watcher capability provides access to hardware
> sampling and tracing features. Crashlog provides access to device crash
> dumps.  While there is some relationship between capabilities (Watcher can
> be configured to sample from the Telemetry data set) each exists as stand
> alone features with no dependency on any other. The design therefore splits
> them into individual, capability specific drivers. MFD is used to create
> platform devices for each capability so that they may be managed by their
> own driver. The PMT architecture is (for the most part) agnostic to the
> type of device it can collect from. Software can determine which devices
> support a PMT feature by searching through each device node entry in the
> sysfs class folder. It can additionally determine if a particular device
> supports a PMT feature by checking for a PMT class folder in the device
> folder.
> 
> This patch set provides support for the PMT framework, along with support
> for Telemetry on Tiger Lake.

The entire series looks good to me, so you may add my:

Reviewed-by: Hans de Goede <hdegoede@redhat.com>

To the entire series.

Lee, in the discussion about previous versions you indicated that you
would be happy to merge the entire series through the MFD tree.

From my pov this is ready for merging, so if you can pick up the entire
series and then provide me with an immutable branch to merge into the
pdx86 tree that would be great.

Regards,

Hans

