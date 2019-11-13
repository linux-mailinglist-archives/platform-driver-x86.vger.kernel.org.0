Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id B01D7FB61E
	for <lists+platform-driver-x86@lfdr.de>; Wed, 13 Nov 2019 18:16:25 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727176AbfKMRQZ (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 13 Nov 2019 12:16:25 -0500
Received: from mail-ed1-f66.google.com ([209.85.208.66]:46270 "EHLO
        mail-ed1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726923AbfKMRQZ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 13 Nov 2019 12:16:25 -0500
Received: by mail-ed1-f66.google.com with SMTP id x11so2448316eds.13
        for <platform-driver-x86@vger.kernel.org>; Wed, 13 Nov 2019 09:16:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=svgalib-org.20150623.gappssmtp.com; s=20150623;
        h=message-id:from:date:to:subject;
        bh=Ptq7YXTqJ8uJ9t5ZeKOGicGQFrLK4cVkkQ0gR/vItIk=;
        b=QgoU4I5c5E6k56fT2+8gGe42tblXTDVMEzdGTagBYsj2rswMmCA64Mm99R6udoFxZO
         z+dPuc9/ebMQTc0BPW7ywepZSjrYoeYlhRF6bsQKxtl4Y+6XccigJ5jEOsBM6A4QEtrp
         emOD81cdzQLyMfGDCzNo9tW8ETv9AgyyyOE5xadX+k8o5/mFwMFl1cPiy47pJAv4Ln96
         v6RCrgczHVrAB/M1rtJSLw6Vuh2uzBCL45/UCwuZXbx52wcohs6Je7HFatM3gnFL3loQ
         ApLu421lAq7+sRoBAwUx+bfrZXuKodxrrI3rOHt1lbIFZC0ORihOmKpEXVkzIY38anXV
         nfsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:from:date:to:subject;
        bh=Ptq7YXTqJ8uJ9t5ZeKOGicGQFrLK4cVkkQ0gR/vItIk=;
        b=URFhweXAsTo8CHac3SnUE5H0FwVNmXpBvjvv49fTUVwvT8EdMyJTKRPcwnDjZeEzIE
         zr6kaPGW8YIzhko+FvWyFrzdN2dYOcCzAz7Ld2GFVEx0V/LwIhBRV39IXgqD6zIUQNFD
         dEVwiWgl6avIZ/qb5pr9/VAzscR5eWMnjV3k0CstPO6c+pb0qwGFLEg4EOSYvMV1d2kw
         TNks3w/zoPJmIHaozjSeZCYJfUSg0E647ir3rVBGmW/IQ4vz/Goi+4W0nwF5ppsWn/a/
         LxQDRN6ihsV2kWUS+bKS8Hx6croIelfItWl/y7drvFwnGn8YJnYEHp0s6JbGEquyGYKj
         vPIg==
X-Gm-Message-State: APjAAAXaiBEXqbxne+O5/Jo8Lrv6dQBAo4AkLLgEvj92u6jjpG1C2CoK
        /e9wA6xMj7PD+yJpkViV+VfArN55RA==
X-Google-Smtp-Source: APXvYqyFNPquy3PwHN/4mPmsozxI8P5zE3/lNnVj3Q1vP4/qc8ATcDw/INqUfTr0JbS7K3jHHIHRkA==
X-Received: by 2002:a5d:6cb0:: with SMTP id a16mr4131342wra.194.1573665381972;
        Wed, 13 Nov 2019 09:16:21 -0800 (PST)
Received: from matan ([2a02:ed0:6b03:5d01:69cd:3baf:b47e:a78f])
        by smtp.gmail.com with ESMTPSA id n17sm3394676wrp.40.2019.11.13.09.16.20
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Wed, 13 Nov 2019 09:16:20 -0800 (PST)
Message-Id: <cover.1573664004.git.matan@svgalib.org>
From:   Matan Ziv-Av <matan@svgalib.org>
Date:   Wed, 13 Nov 2019 18:53:24 +0200
To:     Platform Driver <platform-driver-x86@vger.kernel.org>
Subject: [PATCH 0/7] lg-laptop: Add support for newer models, and small fixes
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

This patch series adds to the post 2017 models of the LG Gram laptops.



Matan Ziv-Av (7):
  lg-laptop: Add module version and fix whitespace
  lg-laptop: Use a small buffer instead of a full page for sysfs boolean
    output
  lg-laptop: Fix bug in writing fan mode value
  lg-laptop: Get model name and year from DMI product name
  lg-laptop: Read/write battery charging limit using WMBB instead of WMAB
    for 2019 and later models
  lg-laptop: Expose reader mode as a LED, rather than a sysfs file for 2018
    and later models
  lg-laptop: Document difference in reader mode handling between pre-2018
    models, and the later models

 .../admin-guide/laptops/lg-laptop.rst         |  13 ++-
 drivers/platform/x86/lg-laptop.c              | 107 +++++++++++++++---
 2 files changed, 103 insertions(+), 17 deletions(-)

-- 
2.21.0

