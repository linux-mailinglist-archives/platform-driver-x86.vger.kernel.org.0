Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E604952B6CC
	for <lists+platform-driver-x86@lfdr.de>; Wed, 18 May 2022 12:12:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234774AbiERKEj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 18 May 2022 06:04:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59460 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234803AbiERKEL (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 18 May 2022 06:04:11 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 5B97160066
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 03:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1652868246;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=VYwr92FH0FKjvuq/GMD2uIuqy9a0ci51Xv1e9fsSRIY=;
        b=QA7OL7da7q1uSPEGHkoFz3s4qXTvbVjWE1KlKaULj2dghmvxmHuFYAAQarfPQ/O6M2IBcN
        7sX8qMOTlBGTxGH55xU62MSYVD5krNBAlrnUqQBd6Oy+JqjEMvRKKdXkb2G+Fclg/NYi01
        cI8kLJJ9JhKldr3gW9CKK/uwJWGf9SM=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-644-8lC0UdIINEegWbiZoNSwOA-1; Wed, 18 May 2022 06:04:05 -0400
X-MC-Unique: 8lC0UdIINEegWbiZoNSwOA-1
Received: by mail-ed1-f72.google.com with SMTP id u1-20020aa7d981000000b0042acd1f2253so1297326eds.4
        for <platform-driver-x86@vger.kernel.org>; Wed, 18 May 2022 03:04:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=VYwr92FH0FKjvuq/GMD2uIuqy9a0ci51Xv1e9fsSRIY=;
        b=pJZRREoirv2mhevtNC6yJmriVFPQPCy5+VDMo51gtq2hdPxbah+K+mUICbyUrOjBY7
         eoo+tDritIID152p2MrfbdowJhT4LLbPa8Mu+vBh3Yh33qv2u2jYCdsZ6B7Br3ImW/e2
         bkYCUgqDzC7wHUqpw2s96TUG/mb66fEqp0z0g6itPDum8hG+PmjXt2j+vJEZB21uOZcJ
         XKqCLbGVLRjt2FIdSUvVY8HDk4lr9fVcn+S2agjlLkrW94HNzRbaFb3W6vAMHMnar34e
         GdmJbkkWKHEcB8hECc6J0UqTIAwk3FjE9DX2h6crhAunsZuvGZxUa5Xf+Bufh6KsGFnt
         +gZQ==
X-Gm-Message-State: AOAM531yfskQDImAhz21PkZFG2J0ncOc/3lwCMn2L4pRP4o5ZRxD+dYl
        x6YobJAsbrqpEGV1m2YlxW2JgvBwA9ykMd/PKfYoKY8sf1aiWcBlENKzVU6YbLrzabQcg62Fm52
        XpAMrG6dAscgRnlcSN4t6MEP6WjgU8l58vg==
X-Received: by 2002:a17:907:6094:b0:6f4:aa0b:9af0 with SMTP id ht20-20020a170907609400b006f4aa0b9af0mr22908462ejc.432.1652868244153;
        Wed, 18 May 2022 03:04:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzoWbXOItnhVv1mPC0sucEmAtUgz3E/KaQNKn67XHccvySLMGD25NGFPMdej2j/nyDA2moizw==
X-Received: by 2002:a17:907:6094:b0:6f4:aa0b:9af0 with SMTP id ht20-20020a170907609400b006f4aa0b9af0mr22908430ejc.432.1652868243811;
        Wed, 18 May 2022 03:04:03 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81? (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
        by smtp.gmail.com with ESMTPSA id n20-20020a509354000000b0042aa23fa93bsm1147559eda.20.2022.05.18.03.04.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 May 2022 03:04:03 -0700 (PDT)
Message-ID: <614a7cef-bfe6-c631-dc4c-d9e99a0b0937@redhat.com>
Date:   Wed, 18 May 2022 12:04:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH 00/14] drm/kms: Stop registering multiple
 /sys/class/backlight devs for a single display
Content-Language: en-US
To:     Jani Nikula <jani.nikula@linux.intel.com>,
        Ben Skeggs <bskeggs@redhat.com>,
        Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
        Daniel Dadap <ddadap@nvidia.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        "Pan, Xinhui" <Xinhui.Pan@amd.com>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Mark Gross <markgross@kernel.org>,
        Andy Shevchenko <andy@kernel.org>
Cc:     nouveau@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org, amd-gfx@lists.freedesktop.org,
        Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org,
        platform-driver-x86@vger.kernel.org
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <871qwrfcwr.fsf@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <871qwrfcwr.fsf@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.2 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,NICE_REPLY_A,
        RCVD_IN_DNSWL_LOW,SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE
        autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 5/18/22 10:44, Jani Nikula wrote:
> On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
>> Hi All,
>>
>> As mentioned in my RFC titled "drm/kms: control display brightness through
>> drm_connector properties":
>> https://lore.kernel.org/dri-devel/0d188965-d809-81b5-74ce-7d30c49fee2d@redhat.com/
>>
>> The first step towards this is to deal with some existing technical debt
>> in backlight handling on x86/ACPI boards, specifically we need to stop
>> registering multiple /sys/class/backlight devs for a single display.
> 
> I guess my question here is, how do you know it's for a *single*
> display?
> 
> There are already designs out there with two flat panels, with
> independent brightness controls. They're still rare and I don't think we
> handle them very well. But we've got code to register multiple native
> backlight interfaces, see e.g. commit 20f85ef89d94 ("drm/i915/backlight:
> use unique backlight device names").
> 
> So imagine a design where one of the panels needs backlight control via
> ACPI and the other via native backlight control. Granted, I don't know
> if one exists, but I think it's very much in the realm of possible
> things the OEMs might do. For example, have an EC PWM for primary panel
> backlight, and use GPU PWM for secondary. How do you know you actually
> do need to register two interfaces?

On x86/ACPI devices this is all driven by acpi_video_get_backlight_type() /
by the drivers/acpi/video_detect.c code. That code already will break on
systems where there are 2 backlight controls, with one being ACPI based
and the other a native GPU PWM backlight device.

In this scenario as soon as the native GPU PWM backlight device shows up
then, if acpi_video_get_backlight_type()==native, video_detect.c will
currently unregister the acpi_video# backlight device(s) since userspace
prefers the firmware type over the native type, so for userspace to
actually honor the acpi_video_get_backlight_type()==native we need to get
the acpi_video# backlight device "out of the way" which is currently
handled by unregistering it.

Note in a way we already have a case where userspace sees 2 panels,
in hybrid laptop setups with a mux and on those systems we may see
either 2 native backlight devices; or 2 native backlight devices +
2 acpi_video backlight devices with userspace preferring the ACPI
ones.

Also note that userspace already has code to detect if the related
panel is active (iow which way the mux between the GPU and the panels
points) and then uses that backlight device. Userspace here very
much assumes a single panel though.

> I'm fine with dealing with such cases as they arise to avoid
> over-engineering up front, but I also don't want us to completely paint
> ourselves in a corner either.

Right. Note that the current code (both with and without this patchset)
already will work fine from a kernel pov as long as both panels
are either using native GPU PWM or are both using ACPI. But if we
ever get a mix then this will need special handling.

Note that all userspace code I know is currently hardcoded
to assume a single panel. Userspace already picks one preferred
device under /sys/class/backlight and ignores the rest. Actually
atm userspace must behave this way, because on x86/ACPI boards we
do often register multiple backlight devices for a single panel.

So in a way moving to registering only a single backlight device
prepares for actually having multiple panels work.

Also keep in mind that this is preparation work for making the
panel brightness a drm_connector property. When the panel uses
a backlight device other then the native GPU PWM to control the
brightness then the helper code for this needs to have a way to
select which backlight_device to use then and the non native
types are not "linked" to a specific connector so in this case
we really need there to be only 1 backlight device registered
so that the code looking up the (non native) backlight device
for the connector gets the right one and not merely the one
which happened to get registered first.

And I believe that having the panel brightness be a drm_connector
property is the way to make it possible for userspace to deal
with the multiple panels which each have a separate brightness
control case.

Regards,

Hans





> 
> BR,
> Jani.
> 
> 
>>
>> This series implements my RFC describing my plan for these cleanups:
>> https://lore.kernel.org/dri-devel/98519ba0-7f18-201a-ea34-652f50343158@redhat.com/
>>
>> Specifically patches 1-6 implement the "Fixing kms driver unconditionally
>> register their "native" backlight dev" part.
>>
>> And patches 7-14 implement the "Fixing acpi_video0 getting registered for
>> a brief time" time.
>>
>> Note this series does not deal yet with the "Other issues" part, I plan
>> to do a follow up series for that.
>>
>> The changes in this series are good to have regardless of the further
>> "drm/kms: control display brightness through drm_connector properties"
>> plans. So I plan to push these upstream once they are ready (once
>> reviewed). Since this crosses various subsystems / touches multiple
>> kms drivers my plan is to provide an immutable branch based on say
>> 5.19-rc1 and then have that get merged into all the relevant trees.
>>
>> Please review.
>>
>> Regards,
>>
>> Hans
>>
>>
>> Hans de Goede (14):
>>   ACPI: video: Add a native function parameter to
>>     acpi_video_get_backlight_type()
>>   drm/i915: Don't register backlight when another backlight should be
>>     used
>>   drm/amdgpu: Don't register backlight when another backlight should be
>>     used
>>   drm/radeon: Don't register backlight when another backlight should be
>>     used
>>   drm/nouveau: Don't register backlight when another backlight should be
>>     used
>>   ACPI: video: Drop backlight_device_get_by_type() call from
>>     acpi_video_get_backlight_type()
>>   ACPI: video: Remove acpi_video_bus from list before tearing it down
>>   ACPI: video: Simplify acpi_video_unregister_backlight()
>>   ACPI: video: Make backlight class device registration a separate step
>>   ACPI: video: Remove code to unregister acpi_video backlight when a
>>     native backlight registers
>>   drm/i915: Call acpi_video_register_backlight()
>>   drm/nouveau: Register ACPI video backlight when nv_backlight
>>     registration fails
>>   drm/amdgpu: Register ACPI video backlight when skipping amdgpu
>>     backlight registration
>>   drm/radeon: Register ACPI video backlight when skipping radeon
>>     backlight registration
>>
>>  drivers/acpi/acpi_video.c                     | 69 ++++++++++++++-----
>>  drivers/acpi/video_detect.c                   | 53 +++-----------
>>  drivers/gpu/drm/Kconfig                       |  2 +
>>  .../gpu/drm/amd/amdgpu/atombios_encoders.c    | 14 +++-
>>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |  9 +++
>>  .../gpu/drm/i915/display/intel_backlight.c    |  7 ++
>>  drivers/gpu/drm/i915/display/intel_display.c  |  1 +
>>  drivers/gpu/drm/i915/display/intel_opregion.c |  2 +-
>>  drivers/gpu/drm/nouveau/nouveau_backlight.c   | 14 ++++
>>  drivers/gpu/drm/radeon/atombios_encoders.c    |  7 ++
>>  drivers/gpu/drm/radeon/radeon_encoders.c      | 11 ++-
>>  .../gpu/drm/radeon/radeon_legacy_encoders.c   |  7 ++
>>  drivers/platform/x86/acer-wmi.c               |  2 +-
>>  drivers/platform/x86/asus-laptop.c            |  2 +-
>>  drivers/platform/x86/asus-wmi.c               |  4 +-
>>  drivers/platform/x86/compal-laptop.c          |  2 +-
>>  drivers/platform/x86/dell/dell-laptop.c       |  2 +-
>>  drivers/platform/x86/eeepc-laptop.c           |  2 +-
>>  drivers/platform/x86/fujitsu-laptop.c         |  4 +-
>>  drivers/platform/x86/ideapad-laptop.c         |  2 +-
>>  drivers/platform/x86/intel/oaktrail.c         |  2 +-
>>  drivers/platform/x86/msi-laptop.c             |  2 +-
>>  drivers/platform/x86/msi-wmi.c                |  2 +-
>>  drivers/platform/x86/samsung-laptop.c         |  2 +-
>>  drivers/platform/x86/sony-laptop.c            |  2 +-
>>  drivers/platform/x86/thinkpad_acpi.c          |  4 +-
>>  drivers/platform/x86/toshiba_acpi.c           |  2 +-
>>  include/acpi/video.h                          |  8 ++-
>>  28 files changed, 156 insertions(+), 84 deletions(-)
> 

