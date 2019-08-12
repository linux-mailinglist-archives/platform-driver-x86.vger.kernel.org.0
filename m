Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 1275B89EF7
	for <lists+platform-driver-x86@lfdr.de>; Mon, 12 Aug 2019 14:57:35 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726543AbfHLM5b (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 12 Aug 2019 08:57:31 -0400
Received: from mail.klausen.dk ([174.138.9.187]:40292 "EHLO mail.klausen.dk"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726219AbfHLM5b (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 12 Aug 2019 08:57:31 -0400
Subject: Re: [PATCH v2] platform/x86: asus-wmi: Support setting a maximum
 charging percentage
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=klausen.dk; s=dkim;
        t=1565614649;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=1DkuC1wT+IjV7CFrXt4ElpLXO5td9wB6g51AOi2a568=;
        b=fij2sa541cwqz1v263zimRigTRiDgNwncPSJDon+MChH2bh4Rs85oy+aZ/n8XFkOWRD0C7
        l4LNnPfEC+M/JYWG4npV1ww6jChSGGUZAzOasNn/VVhzfQ2rA7gqx66t1NaCUma38mZWim
        vA6OlrxD0FyWUCoqZXuLDuKR0ui28as=
To:     Daniel Drake <drake@endlessm.com>
Cc:     Platform Driver <platform-driver-x86@vger.kernel.org>
References: <20190808195532.14220-1-kristian@klausen.dk>
 <CAD8Lp47ouXSj_kZggoL2JJzOUmi38k0jjLK=M+8c3YE=YNe+QA@mail.gmail.com>
From:   Kristian Klausen <kristian@klausen.dk>
Message-ID: <67efc453-4286-774b-72ad-f3d494f44f7a@klausen.dk>
Date:   Mon, 12 Aug 2019 14:57:28 +0200
MIME-Version: 1.0
In-Reply-To: <CAD8Lp47ouXSj_kZggoL2JJzOUmi38k0jjLK=M+8c3YE=YNe+QA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org


On 12.08.2019 09.23, Daniel Drake wrote:
> On Fri, Aug 9, 2019 at 3:56 AM Kristian Klausen <kristian@klausen.dk> wrote:
>> The sysfs knob is still called "charge_threshold", as
>> maximum_charging_percentage seems a bit long.
>> I did look on some of the other platform modules, the LG module
>> use battery_care_limit and the Samsung module use
>> battery_life_extender.
> Maybe it's just me, but I personally find the "threshold" part of this
> to be a little unclear.
>
> In other contexts a threshold is where something starts to happen,
> rather than a stop point, and this had me confused at initial glance
> of your first mail.
Hmm, yes it is confusing.
> https://www.asus.com/us/support/FAQ/1032726/ doesn't really help us
> here, looks like it was not written by a native English speaker.
>
> maximum_charging_percentage is a bit long, but how about
> max_battery_charge or max_charge ?
Maybe battery_max_charge to follow the same pattern as the LG/Samsumg 
modules (battery_care_limit/battery_life_extender).

What do you think?
