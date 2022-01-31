Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 134764A4D0F
	for <lists+platform-driver-x86@lfdr.de>; Mon, 31 Jan 2022 18:25:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1380893AbiAaRZD (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 31 Jan 2022 12:25:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1379915AbiAaRZA (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 31 Jan 2022 12:25:00 -0500
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com [IPv6:2a00:1450:4864:20::32e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 854F5C06173B
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:25:00 -0800 (PST)
Received: by mail-wm1-x32e.google.com with SMTP id m26so4500003wms.0
        for <platform-driver-x86@vger.kernel.org>; Mon, 31 Jan 2022 09:25:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=Beo1JbGwOLhZ2MWlPDrwyZ5ZOtgw4EejZBlER1C2tow=;
        b=XIlC1iV8ngC9N7JUEMiZF7GNx/ySECVSSeZb2aPjpNSIjVL7aNwbl3KVnkVaTxG0L4
         JOPbaMEGI/VL7+MvPzkaJg6NLpTqPTgm3cCo19v+LYmGNqsTd7C3KrlLlbMq3ZX3itzu
         JZ/zSwiyx8o/yHv7c+BUfZGyr9QY9wq30cpLdL8xIiprbAxLcfp/GSaGA8v1vSLlUHBs
         tg29G/0reuqHiW29mNWNyjqhP07XBBNa/a0NIMUlVgQ+m82NkSh9EbkWAP5rkB/try0M
         Boa3qqPmSEQnM8GPehWA2thPnA9BE/FcbB+tyai0STts3AXzcoNKRu6YduDn/vUowufY
         yQGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to:content-transfer-encoding;
        bh=Beo1JbGwOLhZ2MWlPDrwyZ5ZOtgw4EejZBlER1C2tow=;
        b=uPs3VesEDC5jJV1Zx/FMLqAGFBuWJ8QWEfhxbynZChzMzC9i0My+1plPceGY2Kx/cO
         J9BhVHW8BzJVrvTTHJ2ZAntlqys1o35Wwghz7X/vCVtV79V0hGiRF5BoRUONpTHGq/wl
         jsUos/2sakQhwv3YYit50nltAeGaxUrO9aVT5ygH+5D0COMyIKlTGFNZ8h/h3NzHoplt
         Pkl248JJ95+MjYnqEsoZ6LJylCxIGyFOdLQ+DUL6rCHtpkCUSCJtS2mKmkQlNeXYLOYD
         t9Q6VdEfd+BBUaRjnpzDmnLFPGmhfgJr73tU85Jw1UY3NI+WxOy62z0t+m4W6yjkx6HH
         5FGQ==
X-Gm-Message-State: AOAM531xvtXEcBnnY0TajLDcMyAPZ5IDQy9MZQ8lPVAJ5uHJMXDJE7pk
        QsgZpzNhf5BSq9Ws9W1YM+YIb0O3ss5DhicvjS0=
X-Google-Smtp-Source: ABdhPJyQLUbEZON5BcS1TQGgyww6bcHrMIKrLcUHnAoBwkZ+e+i9MnSRXTwGD3SfM1N0kqZFpTws7ifIIexVvDzIX4Y=
X-Received: by 2002:a7b:c944:: with SMTP id i4mr27673413wml.174.1643649899129;
 Mon, 31 Jan 2022 09:24:59 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a5d:4b44:0:0:0:0:0 with HTTP; Mon, 31 Jan 2022 09:24:58
 -0800 (PST)
Reply-To: gb528796@gmail.com
From:   george brown <ed7293954@gmail.com>
Date:   Mon, 31 Jan 2022 18:24:58 +0100
Message-ID: <CAN9EptKHiOHXPv7WXPRa0CVzD0B1cGoQuRRYEqvzJ9TDZEk=Ew@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hallo

Mein Name ist George Brown. Ich bin von Beruf Rechtsanwalt. m=C3=B6chte ich
Ihnen anbieten
die n=C3=A4chsten Angeh=C3=B6rigen meines Mandanten. Sie werden die Summe v=
on
($8,5 Millionen) erben
Dollar, die mein Mandant vor seinem Tod auf der Bank gelassen hat.

Mein Mandant ist ein B=C3=BCrger Ihres Landes, der mit seiner Frau bei
einem Autounfall ums Leben kam
und einziger Sohn. Ich habe Anspruch auf 50 % des Gesamtfonds, w=C3=A4hrend
50 % Anspruch haben
sein f=C3=BCr dich.
Bitte kontaktieren Sie meine private E-Mail hier f=C3=BCr weitere Details:
greogebrown@gmail.com

Vielen Dank im Voraus,
Herr George Brown,
