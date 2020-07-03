Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id ECB3621417F
	for <lists+platform-driver-x86@lfdr.de>; Sat,  4 Jul 2020 00:22:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726631AbgGCWWH (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 3 Jul 2020 18:22:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59290 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726188AbgGCWWH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 3 Jul 2020 18:22:07 -0400
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A7AA7C061794
        for <platform-driver-x86@vger.kernel.org>; Fri,  3 Jul 2020 15:22:06 -0700 (PDT)
Received: by mail-wm1-x329.google.com with SMTP id 17so35478662wmo.1
        for <platform-driver-x86@vger.kernel.org>; Fri, 03 Jul 2020 15:22:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:subject:to:cc:message-id:mime-version;
        bh=yHbF2+3ccm8jeZaqHxHqjMpqIW+LqcfwWIrZKdBq768=;
        b=Ly5xAlr+8zw9HEFEGEmMCckhfPh+h65OyAcuQZrlwZw/b0/uTva5I/R5FrxTRfp0kL
         hh9UqJ60X4vV/qJdXsPjcztQI8wlEfDyVTa7qZ0zJnSNL6dkcKNL5GSxoWhG8ZYO/z+N
         EzrHFKyMaktAf12YPlty0LSZuu3lyXPRAlWm21hujnC5+kSDrAmO7l1f3XzFZ17bgG5y
         4yZnoVVxZp/q7RtkkCX3MVF3FrQ8LYb3BU15AdvzaIkmZ8NMtoiDcRVTrD16xcpfOjl+
         1DLEBUhn7dtm+/66t5+qQSfsFEZ39nCKva9c0CrtZJwCGsrVnxO/rKrgEm9D5nS8fyBP
         Uxpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:subject:to:cc:message-id:mime-version;
        bh=yHbF2+3ccm8jeZaqHxHqjMpqIW+LqcfwWIrZKdBq768=;
        b=UdOwzdogQDAsAQauv5WcmvO8DRGW1wrcLSQCv42VFPnqBA+EY3UlfnF4vMowHQARok
         Wl0sELCxRQYN2DhzBA4MRaH9dcaRfJtXWeZ/XC/CIGDpBWAP4e4sLqINB2Dy1xjzJeUm
         XrSSHS5C6BDgOQj05gjhROlglmS+UMspFyzW8kkUgRkz9PjCuCIfNH4aCPLkVpRaAYSw
         AD5sIjQTKLgcsNk5fRikTePGR5p01DhsX1YoLoGvZa2NmhNQ5wzPPFbPSGWw+4xkqPso
         VF2YhYjdZdCCKGpj1rsGZUbgz3JdEKjyPDmjO5CbBlzLT0Aa1siLklJfJWnvnarpKl2b
         cKdA==
X-Gm-Message-State: AOAM532aCimZkMQwKpunDEvGI0RZS03/HsW6f9q/pP6zECdhDCS3241m
        fJsQgl8GFo4lG3V/5M2azXUYsRpZcG4HYg==
X-Google-Smtp-Source: ABdhPJzBEmQGt+SCH6O5NyYWcMQ7+wRV0aDY5xMnva+ywdLkc8eEyATo2EMK6niVRJ8LDBuzczIbWQ==
X-Received: by 2002:a1c:4185:: with SMTP id o127mr38058875wma.8.1593814925117;
        Fri, 03 Jul 2020 15:22:05 -0700 (PDT)
Received: from pegasus ([2a02:c7f:4e12:9e00:4a5f:99ff:fe31:bb15])
        by smtp.gmail.com with ESMTPSA id x18sm15083441wrq.13.2020.07.03.15.22.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 15:22:04 -0700 (PDT)
Date:   Fri, 03 Jul 2020 23:15:26 +0100
From:   rhysperry111@gmail.com
Subject: [hp_wmi] Recieving same keycode from two keys
To:     platform-driver-x86@vger.kernel.org
Cc:     mjg59@srcf.ucam.org
Message-Id: <Q5ZWCQ.DX8TK304ORAI@gmail.com>
X-Mailer: geary/3.36.2
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi,

I would just like to preface this by saying that I am no too familiar 
with mailing list etiquette so I am sorry if I break any rules.

I have a laptop with dedicated brighness keys (HP Pavilion 
15-cx0598na). I believe these keys are handled by hp_wmi.

Whenever I press (and release) one of the brightness keys, this message 
appears in the journal:
```
[50761.461630] atkbd serio0: Unknown key pressed (translated set 2, 
code 0xab on isa0060/serio0).
[50761.461637] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make 
it known.
[50761.492161] atkbd serio0: Unknown key released (translated set 2, 
code 0xab on isa0060/serio0).
[50761.492168] atkbd serio0: Use 'setkeycodes e02b <keycode>' to make 
it known.
```
Now, this is not that interesting at first, I obviously just need to 
map a keycode. The confusing part is that for both the brightness up 
AND the brightness down key I get the same code (e02b). I am not to 
sure how to debug this behavior but I would appreciate if someone 
helped investigate this issue.

I am not sure if this is relevant, but my RFKILL key does not work 
either (but does not show anything in journal).

Here is a link to acpidump: 
https://www.dropbox.com/s/ulyltq0gz35s79l/acpidump?dl=0

::: Rhys Perry :::


