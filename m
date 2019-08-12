Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 6BFC9897AE
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 09:24:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726479AbfHLHYF (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 03:24:05 -0400
Received: from mail-qt1-f195.google.com ([209.85.160.195]:34477 "EHLO
        mail-qt1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfHLHYF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 03:24:05 -0400
Received: by mail-qt1-f195.google.com with SMTP id q4so4752857qtp.1
        for <platform-driver-x86@vger.kernel.org>; Mon, 12 Aug 2019 00:24:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=endlessm-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=VhbxCk74oJ4B5udD0iAvcvPq3128Vu2sHEABIUMCTHU=;
        b=1K0iI+XqGkT0OPm6minU2SmYF/0vlbT+ZWdJNCt1mJHKj9lI8SyJNPuXU3xzWFBlVs
         /0bqxpqmsY/KwN7x7RmW7+Ahi2oYZj4kQsoB7gpEuvoT8FVUPRh/PmxABAT5xY6o5Twd
         Bx7/9ph5RXYF50nX/BiSFBBPSUK1osb9oxpRq6t/MoolCUC6TGsEP9+bEqT74zJKAP5o
         4G2LGldoGyoQ9qLT2G1nBsK4JaxKOhjvh1s5O4EsbureeJ2BzFtsiKWyVHMWXwbTixyJ
         yPbSruJ+FpJ4WeXKYnLjuwcvgfNW16la1GD2SPNkkWUVKf90wRFR3hGvL6KXEsZ6G0Fz
         6hNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=VhbxCk74oJ4B5udD0iAvcvPq3128Vu2sHEABIUMCTHU=;
        b=NuS9A0eWIKgKxLSM13kVGH68i3WZYGtYVS2JsgwDUY4pr7sZ/Jh41+MUCsoL4S15Nq
         EsKdOpq1xn5C7LzXNd/hR6qfJN4EwtWe56geJAkmuQ90EF5CJY7B/Jl8A0GsTDo8zY7d
         nfamOprtOpSNXC8vos2/wUbq1ah35QnAnDrfDUjFjUor9kzvPkCa4ZYed4PTdhZxwMEb
         Xo0yp4vBYDx0lh/mvIddyjvbiFrGjhNStXo1wS0VseCmp2A9/gnuDxiJvSvbvARSYdzv
         f5IehWuyMvXpCUflqnBMRFbDNXJo+kavXpYEb1b6hwrwQe1I7C7wR2sHt58CqzLPIpIX
         /Duw==
X-Gm-Message-State: APjAAAUopP3T9EaNpbYXqX76IjGdodaN+9rDSDf132CtftZElE+39+im
        13DemnZNKA5jtELzAoGNrUY5eWPUDtjUzlUkVAKT3AFy9AY=
X-Google-Smtp-Source: APXvYqxYLIPia4Js2Y2gOmFOrjUD4PyL8sej4/Sff1g1thdBRUqFSXu4ptJjCIfAUPsVHBkd9x+sEEqluAJgqtP3hVI=
X-Received: by 2002:ac8:322e:: with SMTP id x43mr12780961qta.213.1565594644554;
 Mon, 12 Aug 2019 00:24:04 -0700 (PDT)
MIME-Version: 1.0
References: <20190808195532.14220-1-kristian@klausen.dk>
In-Reply-To: <20190808195532.14220-1-kristian@klausen.dk>
From:   Daniel Drake <drake@endlessm.com>
Date:   Mon, 12 Aug 2019 15:23:53 +0800
Message-ID: <CAD8Lp47ouXSj_kZggoL2JJzOUmi38k0jjLK=M+8c3YE=YNe+QA@mail.gmail.com>
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
To:     Kristian Klausen <kristian@klausen.dk>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Fri, Aug 9, 2019 at 3:56 AM Kristian Klausen <kristian@klausen.dk> wrote:
> The sysfs knob is still called "charge_threshold", as
> maximum_charging_percentage seems a bit long.
> I did look on some of the other platform modules, the LG module
> use battery_care_limit and the Samsung module use
> battery_life_extender.

Maybe it's just me, but I personally find the "threshold" part of this
to be a little unclear.

In other contexts a threshold is where something starts to happen,
rather than a stop point, and this had me confused at initial glance
of your first mail.

https://www.asus.com/us/support/FAQ/1032726/ doesn't really help us
here, looks like it was not written by a native English speaker.

maximum_charging_percentage is a bit long, but how about
max_battery_charge or max_charge ?

Daniel
