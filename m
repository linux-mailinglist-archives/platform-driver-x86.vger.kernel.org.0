Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 089F2267B09
	for <lists+platform-driver-x86@lfdr.de>; Sat, 12 Sep 2020 16:51:18 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725929AbgILOtG (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 12 Sep 2020 10:49:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725971AbgILOsF (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 12 Sep 2020 10:48:05 -0400
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com [IPv6:2607:f8b0:4864:20::644])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 015F7C061573
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 07:47:59 -0700 (PDT)
Received: by mail-pl1-x644.google.com with SMTP id m15so2314279pls.8
        for <platform-driver-x86@vger.kernel.org>; Sat, 12 Sep 2020 07:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:date:from:to:reply-to:content-transfer-encoding
         :subject:message-id;
        bh=z9cbGQzvCZGdv2stQ4JjJcY1G86CqEMBICg5YK+66dU=;
        b=m8qUO13HX9YjdNuFF8q/avv909pOOfL7W8ByvwbUJnuFZhU3HkWvE2mAWFEzZGGN+8
         5xYkRaDs/OX3Ba8/rV7QUNfrcZXj7WoJcDuEynGfgoR9gDsZePTnvojeSZx4gGGGs6QK
         PQIA29fagPBFPgBsr58tnBTS9fnWvTIpZjMYifo94UbfyezO19hvsKNK+eftW/iAgvfQ
         DeSoi3nI3ANuj0Ed24ngBfPq679BDP6C8Ek3DTlTBm2+0E+CKK4kCDxtB09B36uSudTk
         ha3g00OilxexrwXZ+q+HaqxgqzHD+XYltxmti65muyKC/4RvwT780rY1v4Fb5E4NJE28
         /sjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:date:from:to:reply-to
         :content-transfer-encoding:subject:message-id;
        bh=z9cbGQzvCZGdv2stQ4JjJcY1G86CqEMBICg5YK+66dU=;
        b=fxMp/xAYPoQeKmAhwUSg8Hq9LdhrVsBinBv5AFn5COck9ypgv4IZxDCnX4dH783+m+
         C9k4/eNNmbnk/32fhCpLXnXGUNZ8B5KNaJO5s8La7gV7pghAazxL/Wm5ICk2J/foEvGK
         QKBZdCtBAbcZZAYMgApYr+ZvTnWue4WaVl5oVmQW1gGxC0lZOHgPyVF71Y25g6IwWfJw
         lxQBzjEJqnhRO9VF2tc/codE/9qnSoz+LVmxgcn1z5/lAPwkqkkMWpqvGbrHtZxfR0Fy
         bOGehQEmT8njx9OSFRnQ8zJTNXf+NN7irfwoiCGSPaIdViYCaUndfSAwk+SmGoqZcKvZ
         CJQw==
X-Gm-Message-State: AOAM533xG/mNb2EjyBzR6SL1ZwkRdEghX9U1Vfj/t8gKEj35EykDFzV9
        RXWN553KailH4Qb9foBtumHaFRxxyQE=
X-Google-Smtp-Source: ABdhPJzb5xtR9l9wiqXKTOAMbeAfXZrrS2e1vnhfMnF6gkNw8vBwFVYe3l0rdA/lTG1sT/daWzrR1g==
X-Received: by 2002:a17:90a:930e:: with SMTP id p14mr6762868pjo.49.1599922078427;
        Sat, 12 Sep 2020 07:47:58 -0700 (PDT)
Received: from WIN-25FFVSIPLS1 (149-255-36-142.static.hvvc.us. [149.255.36.142])
        by smtp.gmail.com with ESMTPSA id v205sm5519752pfc.110.2020.09.12.07.47.57
        for <platform-driver-x86@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 12 Sep 2020 07:47:57 -0700 (PDT)
MIME-Version: 1.0
Date:   Sat, 12 Sep 2020 07:47:46 -0700
X-Priority: 3 (Normal)
From:   joannalopez350@gmail.com
To:     platform-driver-x86@vger.kernel.org
Reply-To: joannalopez350@gmail.com
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain
Subject: hey
Message-ID: <87B8ABC016BBFBDAED03B2F083194FF5583CD456@WIN-25FFVSIPLS1>
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Facebook sweepstake lottery notification, Click on this link to claim yo=
ur winning payment https://zfrmz.com/Ps5t04H6zwHXI1u9RV8F
