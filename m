Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 453AD2B9833
	for <lists+platform-driver-x86@lfdr.de>; Thu, 19 Nov 2020 17:40:57 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729060AbgKSQiA (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 19 Nov 2020 11:38:00 -0500
Received: from relay8-d.mail.gandi.net ([217.70.183.201]:49661 "EHLO
        relay8-d.mail.gandi.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728202AbgKSQh7 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 19 Nov 2020 11:37:59 -0500
X-Originating-IP: 82.255.60.242
Received: from [192.168.0.28] (lns-bzn-39-82-255-60-242.adsl.proxad.net [82.255.60.242])
        (Authenticated sender: hadess@hadess.net)
        by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id 312D71BF210;
        Thu, 19 Nov 2020 16:37:55 +0000 (UTC)
Message-ID: <c86f894d29189980709a905df0855fdf731ade29.camel@hadess.net>
Subject: Re: [PATCH 0/3] Platform Profile support
From:   Bastien Nocera <hadess@hadess.net>
To:     Mark Pearson <markpearson@lenovo.com>
Cc:     rjw@rjwysocki.net, hdegoede@redhat.com, mgross@linux.intel.com,
        linux-acpi@vger.kernel.org, mario.limonciello@dell.com,
        eliadevito@gmail.com, bberg@redhat.com,
        platform-driver-x86@vger.kernel.org, dvhart@infradead.org
Date:   Thu, 19 Nov 2020 17:37:55 +0100
In-Reply-To: <20201110033124.3211-1-markpearson@lenovo.com>
References: <markpearson@lenovo.com>
         <20201110033124.3211-1-markpearson@lenovo.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.38.1 (3.38.1-1.fc33) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

On Mon, 2020-11-09 at 22:31 -0500, Mark Pearson wrote:
> This patch series is for the implementation of the platform-profile
> feature - the ability to determine which mode the platform is in and
> to change the mode using a sysfs entry.
> 
> The first patch is an update of the document I've been working on
> with
> review and help from the kernel community. Thank you to everybody for
> their input.
> 
> The second patch implements the platform-profile sysfs and API's
> needed.
> 
> The third patch has Lenovo specific changes in thinkpad_acpi.c to use
> the new platform-profile implementation and be able to switch between
> low, medium and high power modes.

I've implemented this in power-profiles-daemon:
https://gitlab.freedesktop.org/hadess/power-profiles-daemon/-/merge_requests/41

Was pretty straight forward to implement, so good job :)

