Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A496522B853
	for <lists+platform-driver-x86@lfdr.de>; Thu, 23 Jul 2020 23:07:15 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgGWVHK (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 23 Jul 2020 17:07:10 -0400
Received: from mail-io1-f71.google.com ([209.85.166.71]:56433 "EHLO
        mail-io1-f71.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbgGWVHJ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 23 Jul 2020 17:07:09 -0400
Received: by mail-io1-f71.google.com with SMTP id f21so4880783ioo.23
        for <platform-driver-x86@vger.kernel.org>; Thu, 23 Jul 2020 14:07:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:in-reply-to:message-id:subject
         :from:to;
        bh=xSJ7/AO/6lFKOpWNdlJkZ7IuUzYOAbFTfGyilIxrJTA=;
        b=liPJCP5nSHYtS7MI16usx/CoxTlk2LrnYxaYjBAJfUZQDjWSg7QO1FjFhfeYzJkQiG
         QdVIAnvq5TZ7zSuG9vYEjsU/ZhRoYAMcv2SzHtYoXwYbaqvBW8zMICtUj2iCpG7ACnLP
         GfVzaSQTG4DPoK/BTsPCaS96duchJXoS9ZWyi4tjbEHGtpaXdKN80kLoOZlAqbJh0ax0
         ekAWah53TV3sFcHEyfNk6F6B8fxc9XNbkWDPX7SNmR+lQo5MLtxn36s9zelWjSx4T2is
         GCPZIl7QGycJIx7TcPUT/dv96HNT2MAs0aZU8wTGrVfSLDHJTpcfM2lHX+wVZ/TgJ+ej
         7OSQ==
X-Gm-Message-State: AOAM531Fep1T55q68ffEgpxURyx9qbUahwliqU9MhrrNQhEi0a1I8qzC
        vbmSTvqI20Z5Fprc2EevGqxqKXaFUoAHBnCAipjD1KQxYATe
X-Google-Smtp-Source: ABdhPJxYUTSFYLbJirO5SmxzloqaeYADQ3DxhbFAabRldIzWkPHkVFQjpT7AWxxHG1jFZHTks11qkmQ3pLU2rwcKL+yfzctTrFuc
MIME-Version: 1.0
X-Received: by 2002:a6b:4f19:: with SMTP id d25mr219660iob.190.1595538428817;
 Thu, 23 Jul 2020 14:07:08 -0700 (PDT)
Date:   Thu, 23 Jul 2020 14:07:08 -0700
In-Reply-To: <000000000000ba65ba05a2fd48d9@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000467ece05ab223d81@google.com>
Subject: Re: kernel BUG at net/core/dev.c:LINE! (3)
From:   syzbot <syzbot+af23e7f3e0a7e10c8b67@syzkaller.appspotmail.com>
To:     andriy.shevchenko@linux.intel.com, andy@greyhouse.net,
        andy@infradead.org, arnd@arndb.de, davem@davemloft.net,
        dvhart@infradead.org, gregkh@linuxfoundation.org,
        j.vosburgh@gmail.com, kuba@kernel.org,
        linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
        peterz@infradead.org, platform-driver-x86@vger.kernel.org,
        skunberg.kelsey@gmail.com, syzkaller-bugs@googlegroups.com,
        tglx@linutronix.de, vfalico@gmail.com
Content-Type: text/plain; charset="UTF-8"
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

syzbot has bisected this issue to:

commit 5a707af10da95a53a55011a612e69063491020d4
Author: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Date:   Fri Apr 21 13:36:06 2017 +0000

    platform/x86: wmi: Describe function parameters

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=14a9ad40900000
start commit:   994e99a9 Merge tag 'platform-drivers-x86-v5.8-2' of git://..
git tree:       upstream
final oops:     https://syzkaller.appspot.com/x/report.txt?x=16a9ad40900000
console output: https://syzkaller.appspot.com/x/log.txt?x=12a9ad40900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e944500a36bc4d55
dashboard link: https://syzkaller.appspot.com/bug?extid=af23e7f3e0a7e10c8b67
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12ea63cf100000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=14afdb9f100000

Reported-by: syzbot+af23e7f3e0a7e10c8b67@syzkaller.appspotmail.com
Fixes: 5a707af10da9 ("platform/x86: wmi: Describe function parameters")

For information about bisection process see: https://goo.gl/tpsmEJ#bisection
