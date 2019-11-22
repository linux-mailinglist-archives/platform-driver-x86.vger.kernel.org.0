Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 2139F105EF3
	for <lists+platform-driver-x86@lfdr.de>; Fri, 22 Nov 2019 04:14:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726546AbfKVDO6 (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 21 Nov 2019 22:14:58 -0500
Received: from mail-qk1-f193.google.com ([209.85.222.193]:38494 "EHLO
        mail-qk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726335AbfKVDO6 (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 21 Nov 2019 22:14:58 -0500
Received: by mail-qk1-f193.google.com with SMTP id e2so5078982qkn.5
        for <platform-driver-x86@vger.kernel.org>; Thu, 21 Nov 2019 19:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:cc:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=FGsxCzRzz/L9FDEegLeJToP6ZSTu86m741a5pttfDvA=;
        b=SNl5wERdx6d3C4K5M8cNTz5tEPMvgvYEYMnE2iaEjimLXqf9MAT8MXYh4JQ1dlt1v6
         OctuQU4v4sOtrzfBrwQFJeMy4FNUXpaSVXgYIeK+xnODldXmxxvxNPshGtq9DtlGzxmn
         mPmP04Iew6DxEaRDiGQ2T8ILGm4qVj4w8MjY3iVzTmUpQEiT2mFKjwYTVEa8RyAQHd/K
         76x9J6fdahDBiKvJo8T4gNm8JdmdngXtdlcQfh7mAacnt485qacHJh2SeMNJmXjbWMaw
         OoyGVjYczf9gfExyqrF4pOFqpc6YNe3yk3Bj+3eY2MQ4a7/juRadXgxmEUSerY7kpTHa
         RKTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
         :mime-version:content-transfer-encoding:content-language;
        bh=FGsxCzRzz/L9FDEegLeJToP6ZSTu86m741a5pttfDvA=;
        b=ByLeeayXw7xGIy3RXR2fjARaMiG1gc03TiL3vS9qprK1qYIZon/lMZKkN/N6Mk9UCl
         YnD1re5mMe634F/bNHkmRGUha7F6FQhmzcTXTIrEmF/Z4C7JKnROzL8JiiJzdzdHp9eB
         Vr9/78I5W0ANIL+H9ffGu48QbUhy7I6BxWEyZvS2J+E1iMXDJhncJ25tYNeNDKXjmVuV
         k4ev2HhqcfgSbahE9sOnVsRdKG1+vVYUOg1nDMoQngedKJdDJZF9MU3m/9QVczQVbTWE
         MaXEZV8DiisUn5/od/TxCPIh3mM2omNRo3MEP5CFaT9VMxZBOMDxjySHygXp4hD4A5kE
         zy2g==
X-Gm-Message-State: APjAAAWrhUBi7xjIJ9nm4WNhLq7wVyQhg15w+dIQ9WDvo1CcUVO55PYI
        Ns/IYUYzV8kEZEmgk5X/enU76+FExPo=
X-Google-Smtp-Source: APXvYqwoNqQns3FleUimsboV6HyLsi1xZn4czqVBGli3lwWCN4DdQx39voC4hXPHbu1AAMJdO6jTlg==
X-Received: by 2002:a37:47d7:: with SMTP id u206mr11488129qka.42.1574392497408;
        Thu, 21 Nov 2019 19:14:57 -0800 (PST)
Received: from [192.168.1.101] ([104.246.133.66])
        by smtp.gmail.com with ESMTPSA id k3sm2403750qkj.119.2019.11.21.19.14.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Nov 2019 19:14:57 -0800 (PST)
To:     corentin.chary@gmail.com
Cc:     acpi4asus-user@lists.sourceforge.net,
        platform-driver-x86@vger.kernel.org
From:   Bob Funk <bobfunk11@gmail.com>
Subject: Bug Report - Kernel Branch 4.4.y - asus-wmi.c
Message-ID: <82dfb75a-e743-e8db-df6f-22b768f7c112@gmail.com>
Date:   Thu, 21 Nov 2019 21:13:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,

My apologies if you are receiving a duplicate of this message. I 
attempted to email this earlier but was sent a delivery failure status 
reply due to html content. I will attempt to resend it as plain text.

Original Email:

The 2019-01-26 commit to the asus-wmi.c driver code in the 4.4 kernel 
branch has introduced a bug with several known models of EeePC netbooks.

Description of Problem:
The bug occurs during boot, where the screen (possibly backlight?) will 
shut off and display hotkeys are unable to bring it back on. The problem 
is present on all kernels
since the 2019-01-26 commit. There have been several reports of the 
issue in the slackware forum at linuxquestions.org

Corrective actions taken so far:
Appending acpi_osi=Linux will circumvent the issue and keep the screen 
on, but this causes several error messages
in the boot log about eeepc_wmi "failing to load both WMI and and legacy 
ATKD devices", and warns not to use acpi_osi=Linux.

Appending acpi_backlight=vendor also prevents the screen from shutting 
off during boot. However, pressing the brightness hotkeys
causes the system to hang.

Reversing the asus-wmi.c patch that was committed on 2019-01-26 and 
rebuilding the 4.4 series module also fixes the problem, and brightness
hotkeys work normally. The commit in question is 
0c4a25cc6f2934f3aa99a0bbfd20b71949bcad25

Model I have tested this on: ASUS EeePC 1000H (Slackware 14.2, kernels 
4.4.201, 4.4.202)
Additional models reporting this issue: ASUS Eee PC 1005HAB, ASUS Eee PC 
1225b, ASUS Eee PC 1025c (Slackware 14.2, various kernels from 4.4.172 
and higher)

Additional Notes:
This problem seems to have been corrected in the 4.19 kernel branch, as 
reported by several users in the slackware forum.
I attempted to test some of the fixes from the 4.19 code as patches to 
the 4.4 code but had no success. There have been multiple
changes in that branch and I am unsure what exactly has corrected the 
bug in that version.

If there is any additional information that I can provide, please let me 
know.

Regards,

Bob Funk
