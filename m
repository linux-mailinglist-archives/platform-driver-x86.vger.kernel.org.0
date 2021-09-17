Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7A46940FA18
	for <lists+platform-driver-x86@lfdr.de>; Fri, 17 Sep 2021 16:23:08 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229680AbhIQOY2 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 17 Sep 2021 10:24:28 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:60365 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232161AbhIQOY2 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 17 Sep 2021 10:24:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1631888585;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=bI64QYSDpBVT8/gWBdIZI4WSCd5oXszuQKLlkpnO6v8=;
        b=E8Eyd7rRAf/2poMbRTwoGkepx/ymXRZsCpBEprCA5aliz3GgtKvQbETmSxEZ74tNOOe7ST
        X2KfAcnbgjbd177in5kBwoFAeQaEQWAJonBmsMGRKD33xUA8n6wzwoOmqUw+fhWJGy4x4b
        0LJTBDX7piVyPhr4ewfzRbvjOMbIAqE=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-451-kRdfubiXP0aCRe0HI3sIjQ-1; Fri, 17 Sep 2021 10:23:04 -0400
X-MC-Unique: kRdfubiXP0aCRe0HI3sIjQ-1
Received: by mail-ed1-f71.google.com with SMTP id b7-20020a50e787000000b003d59cb1a923so8311833edn.5
        for <platform-driver-x86@vger.kernel.org>; Fri, 17 Sep 2021 07:23:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=bI64QYSDpBVT8/gWBdIZI4WSCd5oXszuQKLlkpnO6v8=;
        b=4+jm/mXmgn5hw7JRc9Yd84bXiYa89ojqBVtY0FZiIFOfbJDvgG5AsEpRI1i9KKYg0Y
         FVB3YSD9T+Nrr6xwr5m+5gKFOZ5qRMQR0Yk2FwAStyngpFeDTMkE3cvk7n6FU7VvpP9n
         WaSuTLGGbpNLlUnfi0+cauy4m2asAgJN3H6VsabJ85kZheZuPMGQjv7Uhz+BeTmGtqlB
         xjoyeoQwZSswtLWnZPVWdtqI1P2MtiZ40xeLJchsFwL6OLaoxfiSigPjbIVVK1g4lhs/
         8Z8uVZULqhcsBAdhPF0iqSNGi0+rZ6vt4g/5UHWLtQLbuoAmvU2GMeIqDwajaFrZzDyC
         qliA==
X-Gm-Message-State: AOAM530DoFHGUTS/dbJVohjRLd7IosUmioPl/eYkJ2Acg8R5DsR86m95
        1wOqeNApwSkF9wsUzg+utovKRls7GiLoIrt0GYdDPiNpBamNL6XL+CXUPTYy4z3RqV6pIvErHtd
        UzRonhcJoG/l8UfxxO5wyowClf7p4/D0ysTAsg8p7TQ+nMnE3SB0PsCdY4A+g+IBUXAZB0HnKxK
        wXLuZdBOC6Bw==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr12471301ejx.470.1631888582857;
        Fri, 17 Sep 2021 07:23:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxa/bm+soBA+sjiwpF+D00HqanQhTjL1ArpHFHLO+4TMD6y1gEHc02a6kFuN2UlNR5oN0yAwQ==
X-Received: by 2002:a17:906:8608:: with SMTP id o8mr12471247ejx.470.1631888582468;
        Fri, 17 Sep 2021 07:23:02 -0700 (PDT)
Received: from x1.localdomain ([2a0e:5700:4:11:334c:7e36:8d57:40cb])
        by smtp.gmail.com with ESMTPSA id k12sm2700618edo.9.2021.09.17.07.23.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Sep 2021 07:23:02 -0700 (PDT)
Subject: Re: [PATCH 9/9] drm/i915: Add privacy-screen support
To:     =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>,
        Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Rajat Jain <rajatja@google.com>, Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <mgross@linux.intel.com>,
        Andy Shevchenko <andy@infradead.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Pekka Paalanen <pekka.paalanen@collabora.com>,
        Mario Limonciello <mario.limonciello@outlook.com>,
        Mark Pearson <markpearson@lenovo.com>,
        Sebastien Bacher <seb128@ubuntu.com>,
        Marco Trevisan <marco.trevisan@canonical.com>,
        Emil Velikov <emil.l.velikov@gmail.com>,
        intel-gfx <intel-gfx@lists.freedesktop.org>,
        dri-devel@lists.freedesktop.org,
        platform-driver-x86@vger.kernel.org
References: <20210906073519.4615-1-hdegoede@redhat.com>
 <20210906073519.4615-10-hdegoede@redhat.com> <87sfy4x3ic.fsf@intel.com>
 <YUNO0VrffuPZa02O@intel.com>
From:   Hans de Goede <hdegoede@redhat.com>
Message-ID: <cc9a8dd1-3cbb-06b8-6a4f-8eb3ea277c4c@redhat.com>
Date:   Fri, 17 Sep 2021 16:23:00 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <YUNO0VrffuPZa02O@intel.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 9/16/21 4:04 PM, Ville Syrjälä wrote:
> On Thu, Sep 16, 2021 at 12:40:11PM +0300, Jani Nikula wrote:
>>
>> Cc: Ville for input here, see question inline.
>>
>> On Mon, 06 Sep 2021, Hans de Goede <hdegoede@redhat.com> wrote:
>>> Add support for eDP panels with a built-in privacy screen using the
>>> new drm_privacy_screen class.
>>>
>>> One thing which stands out here is the addition of these 2 lines to
>>> intel_atomic_commit_tail:
>>>
>>> 	for_each_new_connector_in_state(&state->base, connector, ...
>>> 		drm_connector_update_privacy_screen(connector, state);
>>>
>>> It may seem more logical to instead take care of updating the
>>> privacy-screen state by marking the crtc as needing a modeset and then
>>> do this in both the encoder update_pipe (for fast-sets) and enable
>>> (for full modesets) callbacks. But ATM these callbacks only get passed
>>> the new connector_state and these callbacks are all called after
>>> drm_atomic_helper_swap_state() at which point there is no way to get
>>> the old state from the new state.
>>>
>>> Without access to the old state, we do not know if the sw_state of
>>> the privacy-screen has changes so we would need to call
>>> drm_privacy_screen_set_sw_state() unconditionally. This is undesirable
>>> since all current known privacy-screen providers use ACPI calls which
>>> are somewhat expensive to make.
>>>
>>> Also, as all providers use ACPI calls, rather then poking GPU registers,
>>> there is no need to order this together with other encoder operations.
>>> Since no GPU poking is involved having this as a separate step of the
>>> commit process actually is the logical thing to do.
>>>
>>> Reviewed-by: Emil Velikov <emil.l.velikov@gmail.com>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_display.c |  5 +++++
>>>  drivers/gpu/drm/i915/display/intel_dp.c      | 10 ++++++++++
>>>  drivers/gpu/drm/i915/i915_pci.c              | 12 ++++++++++++
>>>  3 files changed, 27 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>>> index 5560d2f4c352..7285873d329a 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>> @@ -10140,6 +10140,8 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>>  	struct drm_device *dev = state->base.dev;
>>>  	struct drm_i915_private *dev_priv = to_i915(dev);
>>>  	struct intel_crtc_state *new_crtc_state, *old_crtc_state;
>>> +	struct drm_connector_state *new_connector_state;
>>> +	struct drm_connector *connector;
>>>  	struct intel_crtc *crtc;
>>>  	u64 put_domains[I915_MAX_PIPES] = {};
>>>  	intel_wakeref_t wakeref = 0;
>>> @@ -10237,6 +10239,9 @@ static void intel_atomic_commit_tail(struct intel_atomic_state *state)
>>>  			intel_color_load_luts(new_crtc_state);
>>>  	}
>>>  
>>> +	for_each_new_connector_in_state(&state->base, connector, new_connector_state, i)
>>> +		drm_connector_update_privacy_screen(connector, &state->base);
>>> +
>>>  	/*
>>>  	 * Now that the vblank has passed, we can go ahead and program the
>>>  	 * optimal watermarks on platforms that need two-step watermark
>>> diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
>>> index 7f8e8865048f..3aa2072cccf6 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_dp.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_dp.c
>>> @@ -37,6 +37,7 @@
>>>  #include <drm/drm_crtc.h>
>>>  #include <drm/drm_dp_helper.h>
>>>  #include <drm/drm_edid.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include <drm/drm_probe_helper.h>
>>>  
>>>  #include "g4x_dp.h"
>>> @@ -5217,6 +5218,7 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>>  	struct drm_connector *connector = &intel_connector->base;
>>>  	struct drm_display_mode *fixed_mode = NULL;
>>>  	struct drm_display_mode *downclock_mode = NULL;
>>> +	struct drm_privacy_screen *privacy_screen;
>>>  	bool has_dpcd;
>>>  	enum pipe pipe = INVALID_PIPE;
>>>  	struct edid *edid;
>>> @@ -5308,6 +5310,14 @@ static bool intel_edp_init_connector(struct intel_dp *intel_dp,
>>>  				fixed_mode->hdisplay, fixed_mode->vdisplay);
>>>  	}
>>>  
>>> +	privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>>> +	if (!IS_ERR(privacy_screen)) {
>>> +		drm_connector_attach_privacy_screen_provider(connector,
>>> +							     privacy_screen);
>>> +	} else if (PTR_ERR(privacy_screen) != -ENODEV) {
>>> +		drm_warn(&dev_priv->drm, "Error getting privacy-screen\n");
>>> +	}
>>> +
>>>  	return true;
>>>  
>>>  out_vdd_off:
>>> diff --git a/drivers/gpu/drm/i915/i915_pci.c b/drivers/gpu/drm/i915/i915_pci.c
>>> index 146f7e39182a..d6913f567a1c 100644
>>> --- a/drivers/gpu/drm/i915/i915_pci.c
>>> +++ b/drivers/gpu/drm/i915/i915_pci.c
>>> @@ -25,6 +25,7 @@
>>>  #include <linux/vga_switcheroo.h>
>>>  
>>>  #include <drm/drm_drv.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include <drm/i915_pciids.h>
>>>  
>>>  #include "i915_drv.h"
>>> @@ -1167,6 +1168,7 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>  {
>>>  	struct intel_device_info *intel_info =
>>>  		(struct intel_device_info *) ent->driver_data;
>>> +	struct drm_privacy_screen *privacy_screen;
>>>  	int err;
>>>  
>>>  	if (intel_info->require_force_probe &&
>>> @@ -1195,7 +1197,17 @@ static int i915_pci_probe(struct pci_dev *pdev, const struct pci_device_id *ent)
>>>  	if (vga_switcheroo_client_probe_defer(pdev))
>>>  		return -EPROBE_DEFER;
>>>  
>>> +	/*
>>> +	 * We do not handle -EPROBE_DEFER further into the probe process, so
>>> +	 * check if we have a laptop-panel privacy-screen for which the driver
>>> +	 * has not loaded yet here.
>>> +	 */
>>> +	privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>>> +	if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>>> +		return -EPROBE_DEFER;
>>> +
>>>  	err = i915_driver_probe(pdev, ent);
>>> +	drm_privacy_screen_put(privacy_screen);
>>>  	if (err)
>>>  		return err;
>>
>> Ideally, neither i915_pci_probe() nor i915_driver_probe() should assume
>> we have display. We might not. We should not wait if we are never going
>> to initialize display.
>>
>> Alas, we'll only know after i915_driver_probe() ->
>> i915_driver_mmio_probe() -> intel_device_info_runtime_init(), which
>> modifies ->pipe_mask, which is the single point of truth. See
>> HAS_DISPLAY().
>>
>> We do have tests for failing probe at various points (see the
>> i915_inject_probe_failure() calls) to stress the cleanup paths in
>> CI. Part of the point was to prepare us for -EPROBE_DEFER returns.
>>
>> Looks like the earliest/cleanest point for checking this is in
>> intel_modeset_init_noirq(), i.e. first display init call. But I admit it
>> gives me an uneasy feeling to return -EPROBE_DEFER at that stage. The
>> only -EPROBE_DEFER return we currently have is the vga switcheroo stuff
>> you see in the patch context, and most platforms never return that.
>>
>> Ville, I'd like to get your thoughts on that.
> 
> I'm just scaread about everything to do with deferred probing.
> 
> For example, I don't even know what would happen if you have some kind
> of mismatch betwen i915 and thinkpad_acpi y/m/n? Or you have one but not
> the other in the initrd? Is the machine at least guaranteed to boot
> properly and light up the display at some point?

If i915 us builtin and thinkpad_acpi is m and the machine is a ThinkPad
with a privacy-screen then the  i915 driver's probe won't get past
the added check until the thinkpad_acpi driver has loaded.

Same for i915 being in the initrd and thinkpad_acpi not, then
the i915 driver's probe won't get past
the added check until we've pivoted to the real root and the
thinkpad_acpi module is loaded from the real-root.

Note that the boot will otherwise continue normally and we will
still have console output (and even e.g. a plymouth splash after
a timeout) on the efifb.


> 
> But yeah, failing the probe at some stage when we've already clobbered
> a bunch of things sounds like an "interesting" idea. I don't think we've
> given the error paths any real though beyond the "ci+error injection
> seems to not explode too badly" approach.
> 
>> Anyway, even if we decide not to, err, defer returning -EPROBE_DEFER, I
>> think we should abstract this better. For example, add a
>> intel_modeset_probe_defer() function in intel_display.c that checks
>> this, and call that as the first thing in i915_driver_probe(). Just to
>> keep the display specific code out of the high level functions, even if
>> that is functionally the same as what you're doing here.
> 
> Yeah, I guess something like that could be the safest option
> for the moment.

Ack I will go with that then.

Regards,

Hans

