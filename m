Return-Path: <platform-driver-x86+bounces-14932-lists+platform-driver-x86=lfdr.de@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id E89F9C07715
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Oct 2025 19:04:10 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id EB4B71C45272
	for <lists+platform-driver-x86@lfdr.de>; Fri, 24 Oct 2025 17:03:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C4BBC33DED3;
	Fri, 24 Oct 2025 17:02:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b="jSWJxxsv"
X-Original-To: platform-driver-x86@vger.kernel.org
Received: from relay13.grserver.gr (relay13.grserver.gr [178.156.171.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1A32F6178
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.156.171.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761325365; cv=none; b=pRg2BVypgPPIyd7snAeg1bCzFlxhK9kuqrwhXEhhnBfsRC+jD0FEc3lSFxg4ApC0cW4gYp2oFRwrw8I5bYkNM9xw5QuTxhepuuqSn+ayUosRrzyJBC9sz4yBvwpLw1jmAMIQCae01AWKJP6/uHU3xataT7QpU1Rmt95LCE+wBow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761325365; c=relaxed/simple;
	bh=hD80H0V8rXW/qoP6mffHOe7I0HPWaOhp2Wm8uxk56c8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P4ueiE6ZNZDGfJ8Pgj/pYp1tsoMqkLYMJfN7ZNqDjdknNd+rBEDhHlUMDZrH+CO4GdE3UsgqcZKXrEyJBcxWMJaYxrJHL0zlAKmFLjlPyMzrUG8cyytwCYGobRvUYKS77yx6w+w+Qw6820aUouX7E7uA7AlifUUegTTsQs/P8jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev; spf=pass smtp.mailfrom=antheas.dev; dkim=temperror (0-bit key) header.d=antheas.dev header.i=@antheas.dev header.b=jSWJxxsv; arc=none smtp.client-ip=178.156.171.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=antheas.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antheas.dev
Received: from relay13 (localhost [127.0.0.1])
	by relay13.grserver.gr (Proxmox) with ESMTP id 8DD705E4CD
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 20:02:42 +0300 (EEST)
Received: from linux3247.grserver.gr (linux3247.grserver.gr [213.158.90.240])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by relay13.grserver.gr (Proxmox) with ESMTPS id 7DD715E654
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 20:02:41 +0300 (EEST)
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	by linux3247.grserver.gr (Postfix) with ESMTPSA id 2B0B5200ABA
	for <platform-driver-x86@vger.kernel.org>; Fri, 24 Oct 2025 20:02:40 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=antheas.dev;
	s=default; t=1761325360;
	bh=gEpcV/HllkCVq7Z16MNUlS+YOxDPPWPkkI0cYqhx9mY=;
	h=Received:From:Subject:To;
	b=jSWJxxsv3+DwFHc63M61OgUhJdgJnOS/8tbzl9X1EIjEhpRRUZo0T47tNj8pXzOca
	 XKGE/+ZXMV1bFwt3/T/ruq/W7+TE+iJW2UytElIUCh8PaGFd7KELLiakgXUCKSk+lf
	 LcZgEfCNgnSfZ2t6ybHq4SeeOeHpWf9ahDS2+X0iMOqpn+XRvo79GbqFfu6vao8MNx
	 PsmpTyv5cY85xQJzMaSerHZw3WQ9tioQx+b5wxSOuwvkeNLyQkCR8bP83je8ZjFF+I
	 Y/vsG2BjTqR3RcSiS6q2JblaIIJUk0ldsWfzbPlPENXZW8XNZDmqV6KiIKBBGUS/ZI
	 DNpzAsCDcd25A==
Authentication-Results: linux3247.grserver.gr;
        spf=pass (sender IP is 209.85.167.42) smtp.mailfrom=lkml@antheas.dev smtp.helo=mail-lf1-f42.google.com
Received-SPF: pass (linux3247.grserver.gr: connection is authenticated)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-592f7e50da2so2458731e87.0
        for <platform-driver-x86@vger.kernel.org>;
 Fri, 24 Oct 2025 10:02:40 -0700 (PDT)
X-Forwarded-Encrypted: i=1;
 AJvYcCXRCj5/aRIBFKS+WkzGHudTJ0KI90sRV3PIcUpOdTXUOR5TZXavtrUYm5upkXV4tBwqfrirkgVNbovTeIvfkxfopUI/@vger.kernel.org
X-Gm-Message-State: AOJu0YxfdJLT4pRk+6hZiZVSLhWwBsyMMgeNevfCDz8DKOE3ydnv1f/+
	LbVeE9f2AuLrKkeD2XLinehV5N70j2JRivIp6rzK7BpHG9JGOuzidOiwB9HdK+KjdpdjP11klmc
	9ZRY9BnfyQibGxREcbwTvTeNAZssByyc=
X-Google-Smtp-Source: 
 AGHT+IEKrbCWuSYfAPJP4FkxTmteHnnI6gTvT9z5rV+Fp3wvMV/cQLvS3MdjFpKV8WdMVw+XDdwelcyJodCs7o5l9/c=
X-Received: by 2002:a05:6512:33d4:b0:57c:4428:4f14 with SMTP id
 2adb3069b0e04-592fc1379fcmr1181236e87.24.1761325359526; Fri, 24 Oct 2025
 10:02:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: platform-driver-x86@vger.kernel.org
List-Id: <platform-driver-x86.vger.kernel.org>
List-Subscribe: <mailto:platform-driver-x86+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:platform-driver-x86+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024152152.3981721-1-lkml@antheas.dev>
 <20251024152152.3981721-4-lkml@antheas.dev>
 <61da9864-b7c8-43f1-b437-36756077b545@amd.com>
 <27439123-98aa-4096-a4e4-3c8eecb3aaca@amd.com>
 <CAGwozwHAJAvgZEgn1M0ioRP4dT2urMUtQQzNXKXydu0ueoOzsA@mail.gmail.com>
 <CAGwozwH+UneR7uB0h_yrEWTBM=-uHapmzL3JnmrJ8S2v5WQ2SQ@mail.gmail.com>
 <d6f72b8f-1961-406a-aed8-5f4570ce98d1@amd.com>
In-Reply-To: <d6f72b8f-1961-406a-aed8-5f4570ce98d1@amd.com>
From: Antheas Kapenekakis <lkml@antheas.dev>
Date: Fri, 24 Oct 2025 19:02:28 +0200
X-Gmail-Original-Message-ID: 
 <CAGwozwF7HBoX_hOgc5uKM1JeuFLD3anmQMQf8eqhxQBcK_9sHA@mail.gmail.com>
X-Gm-Features: AWmQ_bljBDAjdQtCzD1QjfP5Tp0acAevQsmyEaeqADBBZ8vrysgtBsbkhNv-Txc
Message-ID: 
 <CAGwozwF7HBoX_hOgc5uKM1JeuFLD3anmQMQf8eqhxQBcK_9sHA@mail.gmail.com>
Subject: Re: [PATCH v1 3/3] drm/amdgpu: only send the SMU RLC notification on
 S3
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>,
 Shyam Sundar S K <Shyam-sundar.S-k@amd.com>,
	Perry Yuan <perry.yuan@amd.com>, amd-gfx@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-PPP-Message-ID: 
 <176132536047.2708894.3034201005321212998@linux3247.grserver.gr>
X-PPP-Vhost: antheas.dev
X-Virus-Scanned: clamav-milter 1.4.3 at linux3247.grserver.gr
X-Virus-Status: Clean

On Fri, 24 Oct 2025 at 18:52, Mario Limonciello
<mario.limonciello@amd.com> wrote:
>
>
>
> On 10/24/2025 11:45 AM, Antheas Kapenekakis wrote:
> > On Fri, 24 Oct 2025 at 18:24, Antheas Kapenekakis <lkml@antheas.dev> wrote:
> >>
> >> On Fri, 24 Oct 2025 at 18:20, Mario Limonciello
> >> <mario.limonciello@amd.com> wrote:
> >>>
> >>>
> >>>
> >>> On 10/24/2025 10:54 AM, Mario Limonciello wrote:
> >>>>
> >>>>
> >>>> On 10/24/2025 10:21 AM, Antheas Kapenekakis wrote:
> >>>>> From: Alex Deucher <alexander.deucher@amd.com>
> >>>>>
> >>>>> For S0ix, the RLC is not powered down. Rework the Van Gogh logic to
> >>>>> skip powering it down and skip part of post-init.
> >>>>>
> >>>>> Fixes: 8c4e9105b2a8 ("drm/amdgpu: optimize RLC powerdown notification
> >>>>> on Vangogh")
> >>>>> Closes: https://gitlab.freedesktop.org/drm/amd/-/issues/4659
> >>>>> Signed-off-by: Alex Deucher <alexander.deucher@amd.com>
> >>>>> Tested-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> Signed-off-by: Antheas Kapenekakis <lkml@antheas.dev>
> >>>>> ---
> >>>>>    drivers/gpu/drm/amd/amdgpu/amdgpu_device.c       | 8 +++++---
> >>>>>    drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c        | 6 ++++++
> >>>>>    drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c | 3 +++
> >>>>>    3 files changed, 14 insertions(+), 3 deletions(-)
> >>>>>
> >>>>> diff --git a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c b/drivers/gpu/
> >>>>> drm/amd/amdgpu/amdgpu_device.c
> >>>>> index 3d032c4e2dce..220b12d59795 100644
> >>>>> --- a/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>> +++ b/drivers/gpu/drm/amd/amdgpu/amdgpu_device.c
> >>>>> @@ -5243,9 +5243,11 @@ int amdgpu_device_suspend(struct drm_device
> >>>>> *dev, bool notify_clients)
> >>>>>        if (amdgpu_sriov_vf(adev))
> >>>>>            amdgpu_virt_release_full_gpu(adev, false);
> >>>>> -    r = amdgpu_dpm_notify_rlc_state(adev, false);
> >>>>> -    if (r)
> >>>>> -        return r;
> >>>>> +    if (!adev->in_s0ix) {
> >>>>> +        r = amdgpu_dpm_notify_rlc_state(adev, false);
> >>>>> +        if (r)
> >>>>> +            return r;
> >>>>> +    }
> >>>>
> >>>> Just FYI this is going to clash with my unwind failed suspend series [1].
> >>>>
> >>>> This is fine, just whichever "lands" first the other will need to rework
> >>>> a little bit and I wanted to mention it.
> >>>>
> >>>> Link: https://lore.kernel.org/amd-gfx/20251023165243.317153-2-
> >>>> mario.limonciello@amd.com/ [1]
> >>>>
> >>>> This does have me wondering though why amdgpu_dpm_notify_rlc_state() is
> >>>> even in amdgpu_device_suspend()?  This is only used on Van Gogh.
> >>>> Should we be pushing this deeper into amdgpu_device_ip_suspend_phase2()?
> >>>>
> >>>> Or should we maybe overhaul this to move the RLC notification into
> >>>> a .set_mp1_state callback instead so it's more similar to all the other
> >>>> ASICs?
> >>>>
> >>>
> >>> My proposal as such is here:
> >>>
> >>> https://lore.kernel.org/amd-gfx/20251024161216.345691-1-mario.limonciello@amd.com/
> >>>
> >>> It would need some testing though to make sure it didn't break Steam
> >>> Deck or Steam Deck OLED.
> >>
> >> I will give it a quick go on my OLED.
> >
> > Horribly broken. Did not enter S3 and when waking up fan maxed out and
> > it bootlooped. Journalctl stops on suspend entry. It works on the Xbox
> > ally though
> >
> > My series works on both
>
> OK.
>
> Can you try Alex's idea instead?  Just comment out the RLC notification
> code in amdgpu_device_suspend().
>
> It's supposed to already be called in smu_disable_dpms() anyway.

Yes, removing those lines works.

> >
> >
> >>
> >>>>>        return 0;
> >>>>>    }
> >>>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c b/drivers/gpu/
> >>>>> drm/amd/pm/swsmu/amdgpu_smu.c
> >>>>> index fb8086859857..244b8c364d45 100644
> >>>>> --- a/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >>>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/amdgpu_smu.c
> >>>>> @@ -2040,6 +2040,12 @@ static int smu_disable_dpms(struct smu_context
> >>>>> *smu)
> >>>>>            smu->is_apu && (amdgpu_in_reset(adev) || adev->in_s0ix))
> >>>>>            return 0;
> >>>>> +    /* vangogh s0ix */
> >>>>> +    if ((amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5, 0) ||
> >>>>> +         amdgpu_ip_version(adev, MP1_HWIP, 0) == IP_VERSION(11, 5,
> >>>>> 2)) &&
> >>>>> +        adev->in_s0ix)
> >>>>> +        return 0;
> >>>>> +
> >>>>
> >>>> How about for GPU reset, does PMFW handle this too?
> >>>>
> >>>>>        /*
> >>>>>         * For gpu reset, runpm and hibernation through BACO,
> >>>>>         * BACO feature has to be kept enabled.
> >>>>> diff --git a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c b/
> >>>>> drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >>>>> index 2c9869feba61..0708d0f0938b 100644
> >>>>> --- a/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >>>>> +++ b/drivers/gpu/drm/amd/pm/swsmu/smu11/vangogh_ppt.c
> >>>>> @@ -2217,6 +2217,9 @@ static int vangogh_post_smu_init(struct
> >>>>> smu_context *smu)
> >>>>>        uint32_t total_cu = adev->gfx.config.max_cu_per_sh *
> >>>>>            adev->gfx.config.max_sh_per_se * adev-
> >>>>>> gfx.config.max_shader_engines;
> >>>>> +    if (adev->in_s0ix)
> >>>>> +        return 0;
> >>>>> +
> >>>>>        /* allow message will be sent after enable message on Vangogh*/
> >>>>>        if (smu_cmn_feature_is_enabled(smu, SMU_FEATURE_DPM_GFXCLK_BIT) &&
> >>>>>                (adev->pg_flags & AMD_PG_SUPPORT_GFX_PG)) {
> >>>>
> >>>
> >>>
> >
>
>


