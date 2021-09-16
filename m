Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8622C40D73C
	for <lists+platform-driver-x86@lfdr.de>; Thu, 16 Sep 2021 12:14:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236351AbhIPKQK convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 16 Sep 2021 06:16:10 -0400
Received: from mga03.intel.com ([134.134.136.65]:24496 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S236277AbhIPKQK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 16 Sep 2021 06:16:10 -0400
X-IronPort-AV: E=McAfee;i="6200,9189,10108"; a="222586061"
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="222586061"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 03:14:49 -0700
X-IronPort-AV: E=Sophos;i="5.85,298,1624345200"; 
   d="scan'208";a="545467722"
Received: from djustese-mobl.ger.corp.intel.com (HELO localhost) ([10.249.34.120])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2021 03:14:42 -0700
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Hans de Goede <hdegoede@redhat.com>, Lyude Paul <lyude@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>
Cc:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
Subject: Re: [PATCH 0/9] drm: Add privacy-screen class and connector properties
In-Reply-To: <ddd05009-49dd-c61e-f966-e28d42eb7ef8@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20210906073519.4615-1-hdegoede@redhat.com> <ddd8ba1e22adb6fd536c9d72384a30bb9c945997.camel@redhat.com> <ddd05009-49dd-c61e-f966-e28d42eb7ef8@redhat.com>
Date:   Thu, 16 Sep 2021 13:14:39 +0300
Message-ID: <87pmt8x1ww.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 16 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
> Hi,
>
> On 9/15/21 11:12 PM, Lyude Paul wrote:
>> OK! Looked over all of these patches. Patches 2 and 4 have some comments that
>> should be addressed, but otherwise this series is:
>> 
>> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> Thank you!
>
>> Let me know when/if you need help pushing this upstream
>
> My plan was to just straight forward push the entire series to
> drm-misc-next. The only non drm bits are the drivers/platform/x86/thinkpad_acpi.c
> changes and I'm the drivers/platform/x86 subsys-maintainer and this
> plan has my blessing :)
>
> That only leaves the last patch in the series:
> "drm/i915: Add privacy-screen support" 
>
> As something which could potentially be troublesome. I can also
> leave that out, while pushing the test to drm-misc-next and then
> push the i915 patch after a drm-misc-next merge into drm-intel-next.
>
> Jani, how would you like to handle the single i915 patch in this
> series?

I think it's easiest to merge that via the same route as everything else
goes. It's a fairly small patch with not that much conflict potential.

That said, there are some issues in that patch I think still need
addressing. I've commented on the patch. I don't mind you pushing the
rest already, unless you think addressing the issues is easier by
modifying the other patches (I don't think so).


BR,
Jani.

>
> Regards,
>
> Hans
>
>
>
>
>
>> 
>> On Mon, 2021-09-06 at 09:35 +0200, Hans de Goede wrote:
>>> Hi all,
>>>
>>> Here is the privacy-screen related code which I last posted in April 2021
>>> To the best of my knowledge there is consensus about / everyone is in
>>> agreement with the new userspace API (2 connector properties) this
>>> patch-set add (patch 1 of the series).
>>>
>>> This is unchanged (except for a rebase on drm-tip), what has changed is
>>> that the first userspace consumer of the new properties is now fully ready
>>> for merging (it is just waiting for the kernel bits to land first):
>>>
>>>  -
>>> https://gitlab.gnome.org/GNOME/gsettings-desktop-schemas/-/merge_requests/49
>>>  - https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1952
>>>  - https://gitlab.gnome.org/GNOME/gnome-control-center/-/merge_requests/1032
>>>
>>> Having a userspace-consumer of the API fully ready for merging, clears the
>>> last blocker for this series. It has already has been reviewed before
>>> by Emil Velikov, but it could really do with another review.
>>>
>>> The new API works as designed and add the following features to GNOME:
>>>
>>> 1. Showing an OSD notification when the privacy-screen is toggled on/off
>>>    through hotkeys handled by the embedded-controller
>>> 2. Allowing control of the privacy-screen from the GNOME control-panel,
>>>    including the on/off slider shown there updating to match the hw-setting
>>>    when the setting is changed with the control-panel open.
>>> 3. Restoring the last user-setting at login
>>>
>>> This series consists of a number of different parts:
>>>
>>> 1. A new version of Rajat's privacy-screen connector properties patch,
>>> this adds new userspace API in the form of new properties
>>>
>>> 2. Since on most devices the privacy screen is actually controlled by
>>> some vendor specific ACPI/WMI interface which has a driver under
>>> drivers/platform/x86, we need some "glue" code to make this functionality
>>> available to KMS drivers. Patches 2-4 add a new privacy-screen class for
>>> this, which allows non KMS drivers (and possibly KMS drivers too) to
>>> register a privacy-screen device and also adds an interface for KMS drivers
>>> to get access to the privacy-screen associated with a specific connector.
>>> This is modelled similar to how we deal with e.g. PWMs and GPIOs in the
>>> kernel, including separate includes for consumers and providers(drivers).
>>>
>>> 3. Some drm_connector helper functions to keep the actual changes needed
>>> for this in individual KMS drivers as small as possible (patch 5).
>>>
>>> 4. Make the thinkpad_acpi code register a privacy-screen device on
>>> ThinkPads with a privacy-screen (patches 6-8)
>>>
>>> 5. Make the i915 driver export the privacy-screen functionality through
>>> the connector properties on the eDP connector.
>>>
>>> I believe that it would be best to merge the entire series, including
>>> the thinkpad_acpi changes through drm-misc in one go. As the pdx86
>>> subsys maintainer I hereby give my ack for merging the thinkpad_acpi
>>> changes through drm-misc.
>>>
>>> There is one small caveat with this series, which it is good to be
>>> aware of. The i915 driver will now return -EPROBE_DEFER on Thinkpads
>>> with an eprivacy screen, until the thinkpad_acpi driver is loaded.
>>> This means that initrd generation tools will need to be updated to
>>> include thinkpad_acpi when the i915 driver is added to the initrd.
>>> Without this the loading of the i915 driver will be delayed to after
>>> the switch to real rootfs.
>>>
>>> Regards,
>>>
>>> Hans
>>>
>>>
>>> Hans de Goede (8):
>>>   drm: Add privacy-screen class (v3)
>>>   drm/privacy-screen: Add X86 specific arch init code
>>>   drm/privacy-screen: Add notifier support
>>>   drm/connector: Add a drm_connector privacy-screen helper functions
>>>   platform/x86: thinkpad_acpi: Add hotkey_notify_extended_hotkey()
>>>     helper
>>>   platform/x86: thinkpad_acpi: Get privacy-screen / lcdshadow ACPI
>>>     handles only once
>>>   platform/x86: thinkpad_acpi: Register a privacy-screen device
>>>   drm/i915: Add privacy-screen support
>>>
>>> Rajat Jain (1):
>>>   drm/connector: Add support for privacy-screen properties (v4)
>>>
>>>  Documentation/gpu/drm-kms-helpers.rst        |  15 +
>>>  Documentation/gpu/drm-kms.rst                |   2 +
>>>  MAINTAINERS                                  |   8 +
>>>  drivers/gpu/drm/Kconfig                      |   4 +
>>>  drivers/gpu/drm/Makefile                     |   1 +
>>>  drivers/gpu/drm/drm_atomic_uapi.c            |   4 +
>>>  drivers/gpu/drm/drm_connector.c              | 214 +++++++++
>>>  drivers/gpu/drm/drm_drv.c                    |   4 +
>>>  drivers/gpu/drm/drm_privacy_screen.c         | 468 +++++++++++++++++++
>>>  drivers/gpu/drm/drm_privacy_screen_x86.c     |  86 ++++
>>>  drivers/gpu/drm/i915/display/intel_display.c |   5 +
>>>  drivers/gpu/drm/i915/display/intel_dp.c      |  10 +
>>>  drivers/gpu/drm/i915/i915_pci.c              |  12 +
>>>  drivers/platform/x86/Kconfig                 |   2 +
>>>  drivers/platform/x86/thinkpad_acpi.c         | 131 ++++--
>>>  include/drm/drm_connector.h                  |  56 +++
>>>  include/drm/drm_privacy_screen_consumer.h    |  65 +++
>>>  include/drm/drm_privacy_screen_driver.h      |  84 ++++
>>>  include/drm/drm_privacy_screen_machine.h     |  46 ++
>>>  19 files changed, 1175 insertions(+), 42 deletions(-)
>>>  create mode 100644 drivers/gpu/drm/drm_privacy_screen.c
>>>  create mode 100644 drivers/gpu/drm/drm_privacy_screen_x86.c
>>>  create mode 100644 include/drm/drm_privacy_screen_consumer.h
>>>  create mode 100644 include/drm/drm_privacy_screen_driver.h
>>>  create mode 100644 include/drm/drm_privacy_screen_machine.h
>>>
>> 
>

-- 
Jani Nikula, Intel Open Source Graphics Center
