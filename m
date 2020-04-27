Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 9C4BA1B9A7B
	for <lists+platform-driver-x86@lfdr.de>; Mon, 27 Apr 2020 10:41:59 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726834AbgD0Il7 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 27 Apr 2020 04:41:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36318 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbgD0Il6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 27 Apr 2020 04:41:58 -0400
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 58477C061A0F
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 01:41:58 -0700 (PDT)
Received: by mail-wr1-x431.google.com with SMTP id j2so19495531wrs.9
        for <platform-driver-x86@vger.kernel.org>; Mon, 27 Apr 2020 01:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:message-id:mime-version;
        bh=DnIrloQyLEOhKAJRd3hGOKx2lcMg4TUGp2Ftxji48Zs=;
        b=IxQpo9KzxFK/g7IABuKrQFXgsuG7QQpO7z8puiZNbO0uy/mH2BBaIJOW4LpuKlq1hV
         /HU+oX6tSDuecfiGzupdqQQAUvr6aXrH3lKZHyUwgGFdApUW3Aa5BK1NoFL3ZK4P3B76
         cQf0qef4mWn268iZpTmyoouaQOwp/IfRFHzV5sxkQPNa0KeDZU3eZKVjUAqgpLVlPUkE
         PGLGO32tDeJZptJWXDj4Geytk1G1NNkkgLZ8EqqzvLtaj/pg/cUuJWZEEC7VOnpwWxR3
         WVe/gvJtVcz7ZJ4CM41bvBQcgYGw/mMZOR3+osw8OtA0OGEcOPaC7vIUj+KQ+VAcuLbr
         q85Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:message-id:mime-version;
        bh=DnIrloQyLEOhKAJRd3hGOKx2lcMg4TUGp2Ftxji48Zs=;
        b=n36g0ePoOvkWJjb9FuyAERjpA/9Cu8unlNhjDrX1tUQfAeTXsavlEcqIAgVZzAaesm
         YmJNWZqx6GwkbcyeC5oA2FqSE2LzQz1OeSdPYgei5YpsJQUMdItFRYSaw9dW9+XGL6P7
         7pTnor1RvvkUnJh1dFLkikURrNpp0Um/4ehlxKRDrzvZch51feUgTMaL/id0kG+JCrjk
         68sOIlKre+k90zWaxXl71hQpEJCRMFN03h4DskIzVYkDaKT6nCGFzXZ1CE3YpllTgR2I
         IF6Y5iheT8UT2HSewIDnaksQmczQnjN22+osy6dDfcdwgP6ddKYjzPM42ibhn2J+3Rpd
         PoVg==
X-Gm-Message-State: AGi0PuY7MnjKrYekjoBBx1gpS7G7Qstn05H/MmBDv0zQ7uuTX96Mk0F0
        PaU7u0wZ/iI3PWskZNt7uGm4HJWs
X-Google-Smtp-Source: APiQypJc7iu35CRMHsivZfLLBYnHm0IdBgvMOVlSaNKutxqLHLLscoQLag8IDEFqgfZ/hK5zjgtP6w==
X-Received: by 2002:adf:e704:: with SMTP id c4mr25278661wrm.181.1587976916740;
        Mon, 27 Apr 2020 01:41:56 -0700 (PDT)
Received: from [192.168.1.252] (240.252.90.146.dyn.plus.net. [146.90.252.240])
        by smtp.gmail.com with ESMTPSA id f8sm20129491wrm.14.2020.04.27.01.41.55
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 01:41:56 -0700 (PDT)
Date:   Mon, 27 Apr 2020 09:42:02 +0100
From:   Gmail <rhysperry111@gmail.com>
Subject: Fwd: Brightness hotkeys on HP laptop
To:     platform-driver-x86@vger.kernel.org
Message-Id: <2UUF9Q.RGK6EP27Y6W73@gmail.com>
X-Mailer: geary/3.36.1
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, I am using a HP Pavillion 15-cx0598na.

I am having trouble getting my brightness keys to be registered. It 
should also be noted that my wireless toggle key does not work either - 
I assume that is a seperate issue as it is handled by a different 
module.

Nothing is detected through acpi_listen, xev or showkey. However, in 
the journal I get this error (same when pressing both keys):
```
Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Unknown key 
pressed (translated set 2, code 0xab on isa0060/serio0).
Apr 26 15:50:05 archlinux-laptop kernel: atkbd serio0: Use 'setkeycodes 
e02b <keycode>' to make it known.
```
Here is a link to acpidump: https://termbin.com/2l2x

I have already tried to contact the author of `hp_wmi` (the module for 
handling some hotkeys) but he could not solve the issue so suggested 
contacting this email.

Yours Sincerely,
Rhys Perry



