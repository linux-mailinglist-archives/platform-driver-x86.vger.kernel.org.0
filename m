Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 940C62FC0F5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 19 Jan 2021 21:27:55 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730274AbhASU0e convert rfc822-to-8bit (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 19 Jan 2021 15:26:34 -0500
Received: from mail.kernel.org ([198.145.29.99]:56900 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730401AbhASUZg (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 19 Jan 2021 15:25:36 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id 96C6223332
        for <platform-driver-x86@vger.kernel.org>; Tue, 19 Jan 2021 20:24:54 +0000 (UTC)
Received: by pdx-korg-bugzilla-1.web.codeaurora.org (Postfix, from userid 48)
        id A7EDF815C5; Tue, 19 Jan 2021 20:24:54 +0000 (UTC)
From:   bugzilla-daemon@bugzilla.kernel.org
To:     platform-driver-x86@vger.kernel.org
Subject: [Bug 199715] hp_accel: probe of HPQ6007:00 failed with error -22 (HP
 Envy x360)
Date:   Tue, 19 Jan 2021 20:24:54 +0000
X-Bugzilla-Reason: None
X-Bugzilla-Type: changed
X-Bugzilla-Watch-Reason: AssignedTo drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Product: Drivers
X-Bugzilla-Component: Platform_x86
X-Bugzilla-Version: 2.5
X-Bugzilla-Keywords: 
X-Bugzilla-Severity: normal
X-Bugzilla-Who: jwrdegoede@fedoraproject.org
X-Bugzilla-Status: NEW
X-Bugzilla-Resolution: 
X-Bugzilla-Priority: P1
X-Bugzilla-Assigned-To: drivers_platform_x86@kernel-bugs.osdl.org
X-Bugzilla-Flags: 
X-Bugzilla-Changed-Fields: 
Message-ID: <bug-199715-215701-0nKFXHpheY@https.bugzilla.kernel.org/>
In-Reply-To: <bug-199715-215701@https.bugzilla.kernel.org/>
References: <bug-199715-215701@https.bugzilla.kernel.org/>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
X-Bugzilla-URL: https://bugzilla.kernel.org/
Auto-Submitted: auto-generated
MIME-Version: 1.0
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

https://bugzilla.kernel.org/show_bug.cgi?id=199715

--- Comment #45 from Hans de Goede (jwrdegoede@fedoraproject.org) ---
I believe that your models simply do not have an ALS sensor.

Luya did also test the magnetometer and gyro bits and reported his results in
the Fedora bug about this:
https://bugzilla.redhat.com/show_bug.cgi?id=1651886

"""
Gyroscope
---------
ls /sys/bus/iio/devices/iio\:device0/
buffer/                        in_anglvel_z_raw
dev                            name
in_anglvel_hysteresis          power/
in_anglvel_offset              scan_elements/
in_anglvel_sampling_frequency  subsystem/
in_anglvel_scale               trigger/
in_anglvel_x_raw               uevent
in_anglvel_y_raw    

cat /sys/bus/iio/devices/iio\:device0/name 
gyro_3d

cat /sys/bus/iio/devices/trigger0/name 
gyro_3d-dev0

Gyroscope value returned 0.0.0 (x.y.z)


Magnetometer
------------
ls /sys/bus/iio/devices/iio\:device3/
buffer              in_magn_sampling_frequency  in_magn_z_raw  subsystem
dev                 in_magn_scale               name           trigger
in_magn_hysteresis  in_magn_x_raw               power          uevent
in_magn_offset      in_magn_y_raw               scan_elements

cat /sys/bus/iio/devices/iio\:device3/name 
magn_3d

cat /sys/bus/iio/devices/trigger2/name 
magn_3d-dev3

Test with cat /sys/bus/iio/devices/iio:device3/in_magn_x_raw successful.
Test with cat /sys/bus/iio/devices/iio:device3/in_magn_y_raw successful.
Test with cat /sys/bus/iio/devices/iio:device3/in_magn_z_raw successful.
"""

Where I assume successful for the magn device means that the values changed
when doing the following: "For the magneto values (compass) you expect the x
and y values to change if you sit the laptop on the desk and then rotate it
while keeping it sitting on the desk, while the values should stat more or less
the same when you do not move the laptop."

@Richard, can you confirm that your model behaves the same, so working
accelerometer and magnetometer, with the gyro and als always reading all 0 ?

I would like to know, so that I can use the right sensor_mask for the DMI quirk
for the upstream driver for this.

-- 
You may reply to this email to add a comment.

You are receiving this mail because:
You are watching the assignee of the bug.
