Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 90AC622875
	for <lists+platform-driver-x86@lfdr.de>; Sun, 19 May 2019 20:53:10 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727007AbfESSxK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sun, 19 May 2019 14:53:10 -0400
Received: from mail-pg1-f176.google.com ([209.85.215.176]:41622 "EHLO
        mail-pg1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726436AbfESSxK (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sun, 19 May 2019 14:53:10 -0400
Received: by mail-pg1-f176.google.com with SMTP id z3so5675930pgp.8
        for <platform-driver-x86@vger.kernel.org>; Sun, 19 May 2019 11:53:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=TNnjeELo4GNqt+YzJomIPPrL7DBsp/1lWPLSO518CPw=;
        b=YrNVzDYy03/xNjL+VX0o6xWqoOG9s3BX8yCx7j7Bm99iPl1tbIKXnJ/d1SgP9HYJ6Q
         GO+EQ8bHHvjc6HU66OGMBQnC0ya63yx3fScGcTHHedcBR8t4HUDJBGgdTYZM1n4XDqU8
         omqvmwefsDA1mR0R5GLTixGLqIK39ft71zY2TdRvThaxmRk7PAcImT340N0hAjo3YoE9
         EAIWhSJU4nHEOLPYSVeJ2EtYEaAlgaUdiw0BJWWG3SpsB3AnbLXzd7vA4MS0kV3y6wPN
         pT/gSn+ca3Ki5MS74vdCiDsx52/ie6757KvFz9iCF0C4SmhRwJ+eF+ghbyBXw+DSDHJW
         MZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=TNnjeELo4GNqt+YzJomIPPrL7DBsp/1lWPLSO518CPw=;
        b=D9TYkqhwn2VmVBGoNwA/MUa3lWoObG9Hu//0JzWmQutmtkdVxkryapjrEOfAviUrn9
         cOnYI+z0intrzubxZaXWnjk36q3psNOw4BXupwyqktbZn9YhhoY+PFTnaR3+wIoOrVZ/
         ogOgVPCPMdTdwmZMq7KbsNzr/ScW4/D5cqLuLJ3RsqcscoRKmBFYpdqPnMQ+qsZKOCSy
         IvxYsm/s7ZaqPpC5VVchwjPxVofsZGNGpa9hCVG512aF+js6xfh4ZiWqpJeGYoYvXYVx
         Z0QQqnEoXrkljgCN+ZGb5Qru2BUJ3m87i8DGLnJHGEOOBGY5YkZm9UEw/JcicsmGMSkY
         OnGQ==
X-Gm-Message-State: APjAAAU1M9DK8lykQ7ntG6uH9RiqQpZxHRYBYTT8LPYU/QFzYFxvCLzQ
        B7i+Dsf5P2pzFVOR1//UgHxiFiog
X-Google-Smtp-Source: APXvYqxxMW52lgotxeg2iPfyv0zLlLsHLQhkUJVwCH6eksFCttHJt3F0hekSdSddj+43KqN0Y3AkHA==
X-Received: by 2002:aa7:8f22:: with SMTP id y2mr63912088pfr.22.1558291988992;
        Sun, 19 May 2019 11:53:08 -0700 (PDT)
Received: from ?IPv6:2600:6c50:427f:e8c2::c8b? (2600-6c50-427f-e8c2-0000-0000-0000-0c8b.dhcp6.chtrptr.net. [2600:6c50:427f:e8c2::c8b])
        by smtp.googlemail.com with ESMTPSA id i12sm18811887pfd.33.2019.05.19.11.53.07
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Sun, 19 May 2019 11:53:08 -0700 (PDT)
To:     ibm-acpi@hmh.eng.br
Cc:     ibm-acpi-devel@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
From:   Kevin Slagle <kjslag@gmail.com>
Subject: second fan control on ThinkPad X1 Extreme laptop
Message-ID: <dbae0274-9430-eb94-06a4-7a1f9ffef6de@gmail.com>
Date:   Sun, 19 May 2019 11:53:06 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

I have a ThinkPad X1 Extreme laptop running Arch Linux and I can only 
control one of the two fans using /proc/acpi/ibm/fan. It would be nice 
to control both fans. According to a couple nvidia forum posts [1] [2], 
I think this issue needs to be fixed in the thinkpad-acpi driver. It 
seems the issue was recently fixed for the P50 [3], but might still also 
affect the P51 and P52 [1]. I can help test patches for the ThinkPad X1 
Extreme.

[1] 
https://devtalk.nvidia.com/default/topic/1048624/linux/how-to-set-gpu-fan-speed/post/5321818/#5321818
[2] 
https://devtalk.nvidia.com/default/topic/1052110/linux/can-t-control-gtx-1050-ti-max-q-fan-on-thinkpad-x1-extreme-laptop/post/5340658/#5340658
[3] https://lkml.org/lkml/2018/4/2/392

thanks!
Kevin
