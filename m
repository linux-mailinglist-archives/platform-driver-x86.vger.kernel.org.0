Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id C36F01C6536
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 02:46:31 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbgEFAqb (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 5 May 2020 20:46:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34998 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729677AbgEFAqb (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 5 May 2020 20:46:31 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BB11DC061A10
        for <platform-driver-x86@vger.kernel.org>; Tue,  5 May 2020 17:46:29 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id f7so134292pfa.9
        for <platform-driver-x86@vger.kernel.org>; Tue, 05 May 2020 17:46:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=2KZlhzORSs7imLVQfQK7XsPZ+dZXq0bgV6MuhpBhwdw=;
        b=kxyeP54f+eYO0DEk3mTl1grzRy/dRMkC7/wNjgCDNqkHoStKHC60/0O/K9Jfq2vx7H
         prMWwpVz5izEmqhh4jgRdRYmUreGFTka8fgfYWqlz5UmHiIg3qrlFvowni1EZpu7qSJP
         V5P2PeSOpv9D7nINzWLqtL8m674kzcLQOp3ONc8qFENARe8egY7anBGUeyUppBALR6fd
         Q+PlqPO76+FjUKpfdoqD15NnBHiBXkFG0SHjqOKhMn0WYkTI3rRIDxWiDe+xCCLJt96y
         OTdITWMDSQnRsPGChYlF4n2yQq11tFP3opOr0z/qnyphxEG2VR8Xw8vRO00Kp+eDD6nQ
         6FQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=2KZlhzORSs7imLVQfQK7XsPZ+dZXq0bgV6MuhpBhwdw=;
        b=jHkUlbTFKNck9hUHMdr+Bwo2EaghNSCfayL5tdhbV/fj6Hj6pwMJ3dGmtWn4PvneqR
         XX4gZUUiXhqfB6+xApI5ebe3o0Vt/lS+yzZ9Gf9rD3r12K0l/9N0f/pnhZOYiffK5EZm
         aCEISza0DLbdF2/zS4JGtzPEH3R9cz0Ff0MhTLmIWnnT/N3yFA5IM3ci9y7B4CUfZi04
         UllTMXPWYpIndTgQjbuCLpf8Fm56LEDs6OQ2kc25PJ0/FTcKg+D/0vzcbFAtwak2Gly+
         4aNtSkSPigiiFHfqpd9S5HuHuWGe7iJtaRHwv7PC/ZO5YN0aSd1Jr5SBnZrax1WgiKfO
         L68w==
X-Gm-Message-State: AGi0PubzFCibwW5XFrM8711RjIX10glh6xP4BVlBW+P7ZKLpqnhW9tqG
        NvGlS8uOqqGnq0fhM2KDtDLi7AaD6PUInQ==
X-Google-Smtp-Source: APiQypJK3lp80Vi3AtIyR3+WrSjrZZBPlfLU/9IVuLKWOarBDPGBG8IoG81yUEAMzZcUmmgMWPGqRw==
X-Received: by 2002:aa7:8dc1:: with SMTP id j1mr5724834pfr.285.1588725989187;
        Tue, 05 May 2020 17:46:29 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id c1sm42751pfc.94.2020.05.05.17.46.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2020 17:46:28 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id B9AE1243B95; Wed,  6 May 2020 10:48:47 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>
Subject: [PATCH v2 0/2] Two fixes for one sony-laptop reported bug on 5.6
Date:   Wed,  6 May 2020 10:48:41 +0900
Message-Id: <20200506014843.18467-1-malattia@linux.it>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

They are both candidates for stable.
v2: a slightly better fix for the null pointer deref.

Mattia Dongili (2):
  [sony-laptop] SNC calls should handle BUFFER types
  [sony-laptop] Make resuming thermal profile safer

 drivers/platform/x86/sony-laptop.c | 50 ++++++++++++------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

-- 
2.25.1

