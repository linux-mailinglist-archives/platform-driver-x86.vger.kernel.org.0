Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 733B35B067D
	for <lists+platform-driver-x86@lfdr.de>; Wed,  7 Sep 2022 16:26:17 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229459AbiIGO0Q (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 7 Sep 2022 10:26:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229907AbiIGO0P (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 7 Sep 2022 10:26:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E86C5A3CC
        for <platform-driver-x86@vger.kernel.org>; Wed,  7 Sep 2022 07:25:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662560681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gHQSyKroSQYvdtZ+SjBll7XwO8apZfW7kryI1Vwd1/8=;
        b=d3SCBoytOBpFcymipFPe0UoyszX3l5+x8fhsJ1gc9u5r3HPxQ85qRJKiqBgqyH7DvRYOF7
        ALplNze/aTlMSBTb1JchXWfXb8fyb/U48iXIkOtmE7zcyZEQCwRVZSldRDYP96pz8ONF8G
        PeJFkm1N34SNYCWdAVNsGGlBQPBxKrw=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-27-JjGetyqMOfewN6Ks0I3XHw-1; Wed, 07 Sep 2022 10:24:40 -0400
X-MC-Unique: JjGetyqMOfewN6Ks0I3XHw-1
Received: by mail-ej1-f69.google.com with SMTP id xh12-20020a170906da8c00b007413144e87fso4949721ejb.14
        for <platform-driver-x86@vger.kernel.org>; Wed, 07 Sep 2022 07:24:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=gHQSyKroSQYvdtZ+SjBll7XwO8apZfW7kryI1Vwd1/8=;
        b=r5VtJprUA6lDHWM5riyY5uGhsqZrJFzycB+Q7uAZqur6vlfXWYGa989IUjlMq7GfdW
         REAWQemJJTo9p86Mpxr+Lk8f9YHqv1FieofkliJuq054ph9wTT4f07xKKgB19l/542U+
         hMnxE4rDsU/WXVibp5Xvdd2zHC113h/cXLD5QugJHeJ9d+QXkx84NNxUAeJP5hsYCxtz
         ZNIT4ssN3XLevx0VS11YHIz8StvdUf3ekeGCGvLHJLBeA58bN+1aaVmSoYROhzTBI/3e
         AInLbrZgju2+6cv5hKEt3qiO9E/OS/bd6b7al/juCtSx4imUSu8wtYuuzX+W6VwCFHVi
         kc+w==
X-Gm-Message-State: ACgBeo2/utAni+wISSfiX/4gbFLNtAp73NpfBZfO03C8R/zrMkQEIBZk
        GJjM1w1kvRMlNlYwG6ldETjkh5X0gSkq6pYCAEroQMJ7zvZgNU9mq+k4j/ODZe7AV2ohbdkbmkP
        yo/Snk9LI5waHN4uMg7pSvUJYW9ZE0jyokAN7ewfgtrO6VKzhJw==
X-Received: by 2002:a05:6402:550c:b0:443:7d15:d57f with SMTP id fi12-20020a056402550c00b004437d15d57fmr3285930edb.147.1662560679136;
        Wed, 07 Sep 2022 07:24:39 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7bYSGmUaCJXitKtxC0w7um5WpMwKa5A+ItmAH5Ayb3bXZYthfncY8J4Fbyg0sFASBsuT6oygr+Y7pAXOmID4w=
X-Received: by 2002:a05:6402:550c:b0:443:7d15:d57f with SMTP id
 fi12-20020a056402550c00b004437d15d57fmr3285908edb.147.1662560678858; Wed, 07
 Sep 2022 07:24:38 -0700 (PDT)
MIME-Version: 1.0
References: <20220823102913.4181217-1-Shyam-sundar.S-k@amd.com>
 <6ab21af2-e1c6-f76e-9bee-74e21f019be5@redhat.com> <CAKEBQogpK-Kgrgc=gb20w07XnsU7ASVjm4XHWMG=rhD0yQLUKw@mail.gmail.com>
 <a528cbe2-847b-9b15-5123-536900e0d943@redhat.com> <CAKEBQoiuDA1DM4Y_EMRNpRmisCc6KAa2akwxSpbKDrDDnrB71Q@mail.gmail.com>
 <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
In-Reply-To: <a5ac5eb7-6a8e-aafd-10ca-b3049a7a74f4@amd.com>
From:   Bastien Nocera <bnocera@redhat.com>
Date:   Wed, 7 Sep 2022 16:24:27 +0200
Message-ID: <CAKEBQohHJcxgRr4rMcdDMyi1cgBebcbeVcQu7qfAPuNK5E4t=Q@mail.gmail.com>
Subject: Re: [PATCH 0/4] platform/x86/amd/pmf: Introduce CnQF feature for AMD PMF
To:     Shyam Sundar S K <Shyam-sundar.S-k@amd.com>
Cc:     Hans de Goede <hdegoede@redhat.com>, markgross@kernel.org,
        platform-driver-x86@vger.kernel.org, Patil.Reddy@amd.com
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=-2.8 required=5.0 tests=BAYES_00,DKIMWL_WL_HIGH,
        DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_LOW,
        SPF_HELO_NONE,SPF_NONE,T_SCC_BODY_TEXT_LINE autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hey Shyam,

I misunderstood that CnQF was a single setting, but it looks like it
has 4 different levels, right?
Unless there's a major malfunction, I don't think that offering to
switch between 2 different policies where the difference is how
"static" the performance boosts are is very useful, or comprehensible,
to end-users.

If CnQF only has a single "on" setting, then this could replace the
balanced mode for what you call "static slider", so the end-user can
still make a choice and have agency on whether the system tries to
save power, or increase performance.

If CnQF has multiple levels (Turbo, Performance, Balanced and Quiet,
right?), then I don't think it's useful to have a sysfs setting to
switch it at runtime, which only confuses user-space and the users.
BIOS setting and/or kernel command-line option are the way to go.

Did I understand this correctly?

On Tue, 6 Sept 2022 at 12:00, Shyam Sundar S K <Shyam-sundar.S-k@amd.com> wrote:
>
> Hi Bastien, Hans
>
> On 9/1/2022 7:04 PM, Bastien Nocera wrote:
> > On Thu, 1 Sept 2022 at 14:44, Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 9/1/22 14:24, Bastien Nocera wrote:
> >>> On Thu, 1 Sept 2022 at 13:16, Hans de Goede <hdegoede@redhat.com> wrote:
> >>>>
> >>>> Hi,
> >>>>
> >>>> On 8/23/22 12:29, Shyam Sundar S K wrote:
> >>>>> In this series, support for following features has been added.
> >>>>> - "Cool n Quiet Framework (CnQF)" is an extension to the static slider,
> >>>>>   where the system power can be boosted or throttled independent
> >>>>>   of the selected slider position.
> >>>>> - On the fly, the CnQF can be turned on/off via a sysfs knob.
> >>>>
> >>>> Thank you. I think that before doing a more in detail review
> >>>> we first need to agree on the userspace interactions here.
> >>>>
> >>>> I've added Bastien, the power-profiles-daemon maintainer
> >>>> to the Cc for this.
> >>>>
> >>>> From a quick peek at the patches I see that currently they do
> >>>> the following:
> >>>>
> >>>> Probe time:
> >>>> -----------
> >>>>
> >>>> 1. If static slider (classic /sys/firmware/acpi/platform_profile)
> >>>> is available register as a platform_profile provider
> >>>>
> >>>> 2. Query if the BIOS tells us that CnQF should be enable by
> >>>> default if yes then unregister the platform_profile provider
> >>>> and enable CnQF
> >>>>
> >>>>
> >>>> Run time:
> >>>> ---------
> >>>>
> >>>> Allow turning CnQF on/off by writing a sysfs attribute for this.
> >>>>
> >>>> 1. When CnQF gets enabled unregister the platform_profile provider
> >>>>
> >>>> 2. When CnQF gets disabled restore the last set profile and
> >>>> register the platform_profile provider
> >>>>
> >>>>
> >>>> Questions/remarks:
> >>>>
> >>>> 1. If you look at 1. and 2. under "Probe time", you will see that
> >>>> when the BIOS requests to have CnQF enabled by default that
> >>>> userspace will then still shortly see a platform_profile
> >>>> provider. This must be fixed IMHO by checking whether to do
> >>>> CnQF by default or not before the initial register call.
> >>>>
> >>>> 2. What about low-power scenarios ? Currently power-profiles-daemon
> >>>> will always advertise a low-power mode even when there is no
> >>>> platform-profile support, since this is also a hint for other
> >>>> parts of the system to try and conserve power. But when this
> >>>> mode is enabled we really want the system to also behave as
> >>>> if the old static slider mode is active and set to low-power.
> >>>>
> >>>> Some ideas:
> >>>> a) maybe still have the amd-pmf code register a (different)
> >>>> platform_profile provider whn in CnQF mode and have it only
> >>>> advertise low-power
> >>>>
> >>>> b) teach power-profiles-daemon about CnQF and have it
> >>>> disable CnQF when entering low-power mode?
> >>>>
> >>>> c) make the CnQF code in PMF take the charge level into
> >>>> account and have it not go "full throttle" when the chare
> >>>> is below say 25% ?
> >>>>
> >>>> 3. Bastien, can power-profiles-daemon deal with
> >>>> /sys/firmware/acpi/platform_profile disappearing or
> >>>> appearing while it is running?
> >>>
> >>> No, it doesn't.
> >>>
> >>> It expects the platform_profile file to be available on startup, at
> >>> worse with the choices not yet filled in. It doesn't handle the
> >>> platform_profile file going away, it doesn't handle the
> >>> platform_profile_choices file changing after it's been initially
> >>> filled in, and it doesn't support less than one power profile being
> >>> made available, and only supports hiding the performance profile if
> >>> the platform doesn't support it.
> >>
> >> Ok, so this means that if we go with these changes as currently
> >> proposed that if a user uses the sysfs file to turn CnQF on/off
> >> they will need to restart power-profile-daemon.
> >>
> >> I think that that is acceptable given that the user needs to manually
> >> poke things anyway. We should probably document this in the documentation
> >> for the sysfs attribute (as well as in newer versions of the p-p-d
> >> docs/README).
> >>
> >>> Some of those things we could change/fix, some other things will not.
> >>> If the platform_profile_choices file only contained a single item,
> >>> then power-profiles-daemon would just export the "low-power" and
> >>> "balanced" profiles to user-space, as it does on unsupported hardware.
> >>
> >> Right.
> >>
> >>> The profiles in power-profiles-daemon are supposed to show the user
> >>> intent, which having a single setting would effectively nullify.
> >>
> >> Yes that was my understanding too.
> >>
> >>> It's unclear to me how CnQF takes user intent into account (it's also
> >>> unclear to me how that's a low-power setting rather than a combination
> >>> of the existing cool and quiet settings).
> >>
> >> AMD folks, please correct me if any of the below is wrong:
> >>
> >> AFAIK even though it is called CnQF it is more like auto-profile
> >> selection and as such does not take user intent into account
> >> at all.
> >>
> >> It looks at the workload over a somewhat longer time period (say
> >> 5 minutes or so I guess?) and then if that consistently has been
> >> quite high, it will select something similar to performance.
> >>
> >> Where as for a more mixed workload it will select balanced and for
> >> a mostly idle machine it will select low-power.
> >>
> >> I guess this auto feature is best treated the same as unsupported hw.
> >>
> >>> (it's also
> >>> unclear to me how that's a low-power setting rather than a combination
> >>> of the existing cool and quiet settings).
> >>
> >> Even though it is called cool and quiet AFAIK it won't be all that
> >> cool and quiet when running a heavy workload. Which is why I wonder
> >> how to re-conciliate this with showing low-power in e.g. the
> >> GNOME shell system men. Because in essence even if the battery
> >> is low the system will still go full-throttle when confronted
> >> with a heavy workload.
> >>
> >> So selecting low-power would result in the screen-dimming which
> >> I think is part of that, but the CPU's max power-consumption won't
> >> get limited as it would when platform-profiles are supported.
> >>
> >> So I guess this is indeed very much like how p-p-d behaves
> >> on unsupported hw...
> >>
> >> ###
> >>
> >> As mentioned I guess one option would be for CnQF to
> >> still register a platform_profile provider and then in
> >> balanced mode do its CnQF thing and in low-power mode
> >> disable CnQF and apply the static-slider low-power settings
> >> I think that that would work best from things actual
> >> working in a way I would expect the avarage end-user to
> >> expect things to work.
> >>
> >> So p-p-d would then still see platform-profile support
> >> in CnQF mode but with only low-power + balanced advertised.
> >>
> >> Bastien would that work for you?
> >
> > That's something I can make work, yes.
> >
> >> AMD folks would that also work for you ?
> >>
> >> ###
> >>
> >> I'm also wondering if we are going to still export
> >> balanced + low-power modes to userspace in CnQF mode
> >> and disable CnQF in low-power mode then if we
> >> even need a sysfs knob to turn it on/off at all.
> >>
> >> I guess the sysfs knob would then still be useful
> >> to turn it on on systems where it defaults to off
> >> in the BIOS.  Might be better to do this as
> >> a kernel-cmdline (module-param) then though, then we
> >> also avoid the problem of platform_profile support
> >> all of a sudden changing underneath's p-p-d's feet.
> >
> > I would say that, you could probably have CnQF transparently replacing
> > the more static "balanced" profile if it is available, and have a
> > separate setting to force enable/disable it as a kernel command-line
> > for debugging or if the BIOS menu doesn't offer it as an option.
> >
> > That way the balanced mode would work like a more refined automatic
> > profile switcher, and make the default experience better, without the
> > disappearing profiles, or the user-space API headaches.
> >
>
> module param would be fine to force load CnQF if the BIOS does not
> advertise it.
>
> But I still think, having a sysfs node would still help to give an
> option to the user to "opt-out" of the scenarios where he thinks that
> battery can drain out if CnQF is turned on? Or in any case to turn
> on/off CnQF on the fly, so that he can still switch back to the
> traditional "static slider" based power optimizations.
>
> Please let me know your thoughts on this?
>
> Thanks,
> Shyam
>

