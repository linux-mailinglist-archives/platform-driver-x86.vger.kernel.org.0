Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 2A7334450AE
	for <lists+platform-driver-x86@lfdr.de>; Thu,  4 Nov 2021 09:56:50 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231129AbhKDI70 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 4 Nov 2021 04:59:26 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:43753 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230497AbhKDI7Y (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 4 Nov 2021 04:59:24 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1636016206;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0SvAKf7ezxmHpj8d9MCJUQ7XychzurMm3ivlIs2VbuM=;
        b=YaDSWCfFYsuZch1hfZQCs3nUieIUTfrCdf0puniF7X4RW+JYT5CH/tZgc0I4FDk30C0KaK
        w10HUQGI5pZK/jO2rP/5/hRWEWckj5OXmuU49yB95s67cBxZiG1AQqNQxo3+KbFLrbd3dH
        b3q3Vr9hZgFFY8gMZpoGJgqHcpQJshk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-445-9-HSOv1APsyMpJNi9O-YMw-1; Thu, 04 Nov 2021 04:56:46 -0400
X-MC-Unique: 9-HSOv1APsyMpJNi9O-YMw-1
Received: by mail-ed1-f70.google.com with SMTP id u10-20020a50d94a000000b003dc51565894so5033105edj.21
        for <platform-driver-x86@vger.kernel.org>; Thu, 04 Nov 2021 01:56:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0SvAKf7ezxmHpj8d9MCJUQ7XychzurMm3ivlIs2VbuM=;
        b=zQot6sqTJf0H6iTGUd4rxuBLCJjtfbUE8g1OJ/NGwwuUDWWBr8xpgH8i0NTi94I6xG
         5TK/Tvqecy3EOphl9EIs3WpVm2QSVkSZmiEC9QGTz5TQFBk/C07JvNqF1MVKgcpjf+1k
         1BUEDGXP7cSj8P+Vh53dyndMMWAQUR7ctsRju4LxzHT9M/r7vXH1U8SMK543sKtx0vCs
         7lmJMKkB6pHeTN4d4gpOkWBtaswUcNbcj4RXKxmQ/AQalwJituCnDC+FI+OQrsTxBEm/
         mEHqvHJ5+QPxyOUWIYfIs7dPypNZXslgt3XSE8V+JM3Rynqg/30yJ3SUXhFFVbmwQMMo
         +HBA==
X-Gm-Message-State: AOAM530Hb3Aox/pBrm93PvtqRkSZm03s/w3jc7YUD4JYeR9xBCwQjrYF
        fVezC2U/9l8LWxZHl9Oh1ewkA3IdIhynS8/VPAEOd/rx4scTJxSg3M8V/Kv5wbXsjgilaSP7ws7
        DYxcfWc25ewAQtPzL029W2Oy5izXfAHjgdA==
X-Received: by 2002:a17:906:5d0b:: with SMTP id g11mr32829659ejt.381.1636016203788;
        Thu, 04 Nov 2021 01:56:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw3pfyiM70trdB28BQBuyoFVhlgbLXjEvM2AIYoTAjT5O2dG5FjYI6/GrYr0iXoZdGlD8u5bA==
X-Received: by 2002:a17:906:5d0b:: with SMTP id g11mr32829635ejt.381.1636016203592;
        Thu, 04 Nov 2021 01:56:43 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:1054:9d19:e0f0:8214? (2001-1c00-0c1e-bf00-1054-9d19-e0f0-8214.cable.dynamic.v6.ziggo.nl. [2001:1c00:c1e:bf00:1054:9d19:e0f0:8214])
        by smtp.gmail.com with ESMTPSA id g1sm1127535eje.105.2021.11.04.01.56.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Nov 2021 01:56:42 -0700 (PDT)
Message-ID: <09b6253f-fbd2-c45e-a314-f4e7354a7218@redhat.com>
Date:   Thu, 4 Nov 2021 09:56:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH 10/10] drm/i915: Add privacy-screen support (v3)
Content-Language: en-US
To:     Rajat Jain <rajatja@google.com>,
        =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Lyude <lyude@redhat.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Mark Gross <markgross@kernel.org>,
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
References: <20211005202322.700909-1-hdegoede@redhat.com>
 <20211005202322.700909-11-hdegoede@redhat.com> <YWdWyTVXMA3907no@intel.com>
 <CACK8Z6GPu=Y_-0rrgN-S=HUrgqn_OoU0XroxAp--N0JKZxOnEQ@mail.gmail.com>
From:   Hans de Goede <hdegoede@redhat.com>
In-Reply-To: <CACK8Z6GPu=Y_-0rrgN-S=HUrgqn_OoU0XroxAp--N0JKZxOnEQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

On 11/4/21 00:16, Rajat Jain wrote:
> Hello Hans,
> 
> Thanks a lot for working on this diligently and getting almost all of
> it finally merged!
> 
> On Wed, Oct 13, 2021 at 2:59 PM Ville Syrjälä
> <ville.syrjala@linux.intel.com> wrote:
>>
>> On Tue, Oct 05, 2021 at 10:23:22PM +0200, Hans de Goede wrote:
>>> Add support for eDP panels with a built-in privacy screen using the
>>> new drm_privacy_screen class.
>>>
>>> Changes in v3:
>>> - Move drm_privacy_screen_get() call to intel_ddi_init_dp_connector()
>>>
>>> Changes in v2:
>>> - Call drm_connector_update_privacy_screen() from
>>>   intel_enable_ddi_dp() / intel_ddi_update_pipe_dp() instead of adding a
>>>   for_each_new_connector_in_state() loop to intel_atomic_commit_tail()
>>> - Move the probe-deferral check to the intel_modeset_probe_defer() helper
>>>
>>> Signed-off-by: Hans de Goede <hdegoede@redhat.com>
>>> ---
>>>  drivers/gpu/drm/i915/display/intel_atomic.c  |  1 +
>>>  drivers/gpu/drm/i915/display/intel_ddi.c     | 16 ++++++++++++++++
>>>  drivers/gpu/drm/i915/display/intel_display.c | 10 ++++++++++
>>>  3 files changed, 27 insertions(+)
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_atomic.c b/drivers/gpu/drm/i915/display/intel_atomic.c
>>> index b4e7ac51aa31..a62550711e98 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_atomic.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_atomic.c
>>> @@ -139,6 +139,7 @@ int intel_digital_connector_atomic_check(struct drm_connector *conn,
>>>           new_conn_state->base.picture_aspect_ratio != old_conn_state->base.picture_aspect_ratio ||
>>>           new_conn_state->base.content_type != old_conn_state->base.content_type ||
>>>           new_conn_state->base.scaling_mode != old_conn_state->base.scaling_mode ||
>>> +         new_conn_state->base.privacy_screen_sw_state != old_conn_state->base.privacy_screen_sw_state ||
>>>           !drm_connector_atomic_hdr_metadata_equal(old_state, new_state))
>>>               crtc_state->mode_changed = true;
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_ddi.c b/drivers/gpu/drm/i915/display/intel_ddi.c
>>> index 0d4cf7fa8720..272714e07cc6 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_ddi.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_ddi.c
>>> @@ -25,6 +25,7 @@
>>>   *
>>>   */
>>>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include <drm/drm_scdc_helper.h>
>>>
>>>  #include "i915_drv.h"
>>> @@ -2946,6 +2947,7 @@ static void intel_enable_ddi_dp(struct intel_atomic_state *state,
>>>       if (port == PORT_A && DISPLAY_VER(dev_priv) < 9)
>>>               intel_dp_stop_link_train(intel_dp, crtc_state);
>>>
>>> +     drm_connector_update_privacy_screen(conn_state);
>>>       intel_edp_backlight_on(crtc_state, conn_state);
>>>
>>>       if (!dig_port->lspcon.active || dig_port->dp.has_hdmi_sink)
>>> @@ -3161,6 +3163,7 @@ static void intel_ddi_update_pipe_dp(struct intel_atomic_state *state,
>>>       intel_drrs_update(intel_dp, crtc_state);
>>>
>>>       intel_backlight_update(state, encoder, crtc_state, conn_state);
>>> +     drm_connector_update_privacy_screen(conn_state);
>>>  }
>>>
>>>  void intel_ddi_update_pipe(struct intel_atomic_state *state,
>>> @@ -3979,6 +3982,19 @@ intel_ddi_init_dp_connector(struct intel_digital_port *dig_port)
>>>               return NULL;
>>>       }
>>>
>>> +     if (dig_port->base.type == INTEL_OUTPUT_EDP) {
>>
>> Connector type check would be a bit more consistent with what this is
>> about I think. But there's is 1:1 correspondence with the encoder type
>> for eDP so not a particularly important point.
>>
>> Reviewed-by: Ville Syrjälä <ville.syrjala@linux.intel.com>
> 
> I see only 8 out of 10 patches in this series were applied to drm-tip.
> I'm curious if there is any reason for which the last 2 patches were
> not applied:
> 
> [Patch 9/10]: drm/i915: Add intel_modeset_probe_defer() helper
> [Patch 10/10]: drm/i915: Add privacy-screen support (v3)
> 
> I look forward to getting them merged so that I can use them.

The main-parts of the patch-set were merged through drm-misc-next,
the 2 i915 patches had a conflict there since the series was
based on drm-tip and some of the surrounding i915 code had some
small changes in drm-intel-next which was not in drm-misc-next yet.

Once drm-intel-next merges in recent drm-misc-next changes 
(after the merge window closes) I will push the remaining 2 patches
through drm-intel-next and then everything will be in drm-tip and
on its way to 5.17 .

Regards,

Hans



>>> +             struct drm_device *dev = dig_port->base.base.dev;
>>> +             struct drm_privacy_screen *privacy_screen;
>>> +
>>> +             privacy_screen = drm_privacy_screen_get(dev->dev, NULL);
>>> +             if (!IS_ERR(privacy_screen)) {
>>> +                     drm_connector_attach_privacy_screen_provider(&connector->base,
>>> +                                                                  privacy_screen);
>>> +             } else if (PTR_ERR(privacy_screen) != -ENODEV) {
>>> +                     drm_warn(dev, "Error getting privacy-screen\n");
>>> +             }
>>> +     }
>>> +
>>>       return connector;
>>>  }
>>>
>>> diff --git a/drivers/gpu/drm/i915/display/intel_display.c b/drivers/gpu/drm/i915/display/intel_display.c
>>> index 86dbe366a907..84715a779d9d 100644
>>> --- a/drivers/gpu/drm/i915/display/intel_display.c
>>> +++ b/drivers/gpu/drm/i915/display/intel_display.c
>>> @@ -42,6 +42,7 @@
>>>  #include <drm/drm_edid.h>
>>>  #include <drm/drm_fourcc.h>
>>>  #include <drm/drm_plane_helper.h>
>>> +#include <drm/drm_privacy_screen_consumer.h>
>>>  #include <drm/drm_probe_helper.h>
>>>  #include <drm/drm_rect.h>
>>>
>>> @@ -12769,6 +12770,8 @@ void intel_modeset_driver_remove_nogem(struct drm_i915_private *i915)
>>>
>>>  bool intel_modeset_probe_defer(struct pci_dev *pdev)
>>>  {
>>> +     struct drm_privacy_screen *privacy_screen;
>>> +
>>>       /*
>>>        * apple-gmux is needed on dual GPU MacBook Pro
>>>        * to probe the panel if we're the inactive GPU.
>>> @@ -12776,6 +12779,13 @@ bool intel_modeset_probe_defer(struct pci_dev *pdev)
>>>       if (vga_switcheroo_client_probe_defer(pdev))
>>>               return true;
>>>
>>> +     /* If the LCD panel has a privacy-screen, wait for it */
>>> +     privacy_screen = drm_privacy_screen_get(&pdev->dev, NULL);
>>> +     if (IS_ERR(privacy_screen) && PTR_ERR(privacy_screen) == -EPROBE_DEFER)
>>> +             return true;
>>> +
>>> +     drm_privacy_screen_put(privacy_screen);
>>> +
>>>       return false;
>>>  }
>>>
>>> --
>>> 2.31.1
>>
>> --
>> Ville Syrjälä
>> Intel
> 

