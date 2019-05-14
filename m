Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 715D41C49E
	for <lists+platform-driver-x86@lfdr.de>; Tue, 14 May 2019 10:23:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726109AbfENIXj (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 14 May 2019 04:23:39 -0400
Received: from mail-ed1-f68.google.com ([209.85.208.68]:47075 "EHLO
        mail-ed1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726078AbfENIXi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 14 May 2019 04:23:38 -0400
Received: by mail-ed1-f68.google.com with SMTP id f37so21578667edb.13
        for <platform-driver-x86@vger.kernel.org>; Tue, 14 May 2019 01:23:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=fiXHFem/iL+rCLe7tifmI3c7WDBXKf2BdzeZke3QLVw=;
        b=NH5k5qRaPfhAYvXIJJJDhgV5RB3ReuaE2/cHhlLq6rEEG1gaK7KzYmgiV0553fJEgf
         pBHUEO9JWHVdRntVjihzxsg5e0XMtH5ij0ABHs2TJOqnO40DsuT5kpJJD+t1+by24YRq
         GrfHPh72iELJ+48KK7TuwMV00Ns7C21ngtu5CYkC/n57iyCyc7Tx2IkUdsjhimRklnYm
         7FN5GljTCWnCNgUPvV3kn0A5Y5VuDWjKkUnf5mPGuBDax3RRIlT/5xUA7LfcmMfO58CG
         WYD+kyvadYKi4w+HHqLw5LXr83iRob3BYgW2ONU4izK1cU+NAlZ+viwInKXIri0yUyZu
         pWzg==
X-Gm-Message-State: APjAAAXBtSrGhRUlwxzEo/lyJsdQAfp/XCxr806uSDY12hbPXs7CCKqm
        Og2GdCUDyZ+NcQSiPkDAe8YxtjZy0Xo=
X-Google-Smtp-Source: APXvYqz1thVI5q1DNc1fQNtH5TuWoqiQPJI0BwWw08WGG+GNPSoxiPuoMKHF35t0GYkTVisXCwfLdg==
X-Received: by 2002:a17:906:2cd1:: with SMTP id r17mr26364596ejr.101.1557822216958;
        Tue, 14 May 2019 01:23:36 -0700 (PDT)
Received: from localhost.localdomain ([2a01:4f8:1c0c:6c86:46e0:a7ad:5246:f04d])
        by smtp.gmail.com with ESMTPSA id cg25sm1493140ejb.15.2019.05.14.01.23.35
        (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
        Tue, 14 May 2019 01:23:36 -0700 (PDT)
To:     =?UTF-8?Q?Jo=c3=a3o_Paulo_Rechi_Vita?= <jprvita@endlessm.com>,
        platform-driver-x86@vger.kernel.org
From:   Hans de Goede <hdegoede@redhat.com>
Subject: Commit 78f3ac76d9e5 ("platform/x86: asus-wmi: Tell the EC the OS will
 handle the display off hotkey") causes broken display on Asus 1025C
Message-ID: <999f988f-63ce-ee29-6cb5-42d4bf94fdbe@redhat.com>
Date:   Tue, 14 May 2019 10:23:34 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi João, All,

I've been helping a Fedora user debugging a problem where the backlight turns off and
never turns on again with newer kernels:
https://bugzilla.redhat.com/show_bug.cgi?id=1697069

At this point I'm pretty sure this commit is the culprit:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=78f3ac76d9e5

The breakage happens between 4.20.4 and 4.20.5 and that commit is the only one
standing out; and blacklisting eeepc-wmi fixes things.

For now I'm going to add a new DMI quirk for this (patch for this will follow later)
but this is something to keep in mind if we get more reports about backlight/display
breakage on eeepc laptops. I'm thinking that maybe the new behavior introduced
by commit 78f3ac76d9e5 should only be applied to laptops using
asus-nb-wmi and not to laptop using eeepc-wmi (the code modified
by the commit is common to both drivers).

João, can you check if the 11 models mentioned in the commit msg
(or a bunch of similar models you have access too) are using asus-nb-wmi;
or eeepc-wmi ?

Regards,

Hans
