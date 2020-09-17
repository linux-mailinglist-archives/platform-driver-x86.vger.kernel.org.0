Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5F8A326DC58
	for <lists+platform-driver-x86@lfdr.de>; Thu, 17 Sep 2020 15:02:55 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727048AbgIQNCw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 17 Sep 2020 09:02:52 -0400
Received: from relay10.mail.gandi.net ([217.70.178.230]:47383 "EHLO
        relay10.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726787AbgIQNBg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 17 Sep 2020 09:01:36 -0400
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay10.mail.gandi.net (Postfix) with ESMTPSA id 121E1240008;
        Thu, 17 Sep 2020 13:00:54 +0000 (UTC)
Message-ID: <bf260d79ec9612d0d8c427e4db54447f57bf501d.camel@hadess.net>
Subject: Re: RFC: offering a standardized (/sys/class) userspace API for
 selecting system/laptop performance-profiles
From:   Bastien Nocera <hadess@hadess.net>
To:     Hans de Goede <hdegoede@redhat.com>,
        Elia Devito <eliadevito@gmail.com>,
        Mark Pearson <mpearson@lenovo.com>
Cc:     Benjamin Berg <bberg@redhat.com>,
        Jared Dominguez <jaredz@redhat.com>,
        platform-driver-x86@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Thu, 17 Sep 2020 15:00:54 +0200
In-Reply-To: <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
References: <bbe4ebef-0845-2719-ac9a-fbc9c7bcd7be@redhat.com>
         <21b6dffbbc6dbb14ebef3f078cc2497f9a872f57.camel@hadess.net>
         <b6332a4a-7606-2bd0-632b-f67b68d3dd1b@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.0 (3.38.0-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Thu, 2020-09-17 at 14:51 +0200, Hans de Goede wrote:
<snip>

> UGh, do we really need to export this though. We have the lap_mode
> thing
> already; and that is something which we will need for other reasons
> in
> the future too. Any UI for selecting performance modes can display a
> warning when lap_mode is true saying that: "The laptop has detected
> that it
> is sitting on someone's lap and that performance may be limited
> because of this." (feel free to improve the text).

Given that there might be "100" profiles in that range, which ones
would be considered to be the "performance" ones that would be
inhibited if the laptop was on a person's lap?

