Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id A3B631C9F7C
	for <lists+platform-driver-x86@lfdr.de>; Fri,  8 May 2020 02:14:20 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726809AbgEHAOR (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Thu, 7 May 2020 20:14:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726767AbgEHAOQ (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Thu, 7 May 2020 20:14:16 -0400
Received: from mail-pf1-x429.google.com (mail-pf1-x429.google.com [IPv6:2607:f8b0:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84801C05BD43
        for <platform-driver-x86@vger.kernel.org>; Thu,  7 May 2020 17:14:15 -0700 (PDT)
Received: by mail-pf1-x429.google.com with SMTP id 18so3858036pfx.6
        for <platform-driver-x86@vger.kernel.org>; Thu, 07 May 2020 17:14:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m/iYKs6W1RhdjIqGwF5Y+OvfkYWsA30wRPvJXTLULQ4=;
        b=VmbAIVJ8OboNO8+OAXYVWU6bnjIw99diebrM+odxIeqefFWEANa612LyLUlVMm9Yp5
         y3Cnon+mQAW2KOnqni5dMwbU6tOAheS5Knr6XjH+GQ1ln4TXnYHQnwp8DOGontdt3jdZ
         I2gqJeZuG77YZ/LOAymYW8iQamxnCKHwpszSui/iW7ohdS91YnikFzM96E5Z99sfVGEr
         6hlsdFMqAIbPJ8dusYcLCpsJkigsiuxsoDUV2RzV8Vh+zVwTsmOyECrVnuzDZEKxj5pQ
         a86gixwg73Kexf70YA9nLJIejvl+CDermiF1tTXdiZbl2z6hwYqAs4TdP/XaoHWs4MP6
         pcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=m/iYKs6W1RhdjIqGwF5Y+OvfkYWsA30wRPvJXTLULQ4=;
        b=p3BmpBKfrA54eflCi09OmFaQ6NYg4sCX2IklGdfAZw+qiG1xh2rmIhffMLHAbXLWBs
         sNh4RNvh5dvZo5/5WHbAQnEVdnu3zNeqslixYpVolN7boNvNIXwUX/4X+07ML5eA7CtW
         sOV0wwTgi+sZYxi7bNnV8LmS39l33OIZx3Gs0VJN+H/obdqYl1DhS/LPGDRfAh6jyUuX
         QW/tonJNIo26Vf95UN9UiakdkyVhWWsKGxQSQfPi82/Pth7dPRVFBQhN2/9rlfY/ZuTl
         zbWJk1pBjKhS0aSNalV0xzuvUhvqjQCQJFjX+mKIkrwwWkrhn37aOJNxUF9DcavJXnyP
         aaGA==
X-Gm-Message-State: AGi0PuaZcI/95Fx6+JsWiIu4nyT6wtEAwNJgvRwEHkKEwWPNwrC329ge
        4fUw1pW53vB5FUlcU+yRGt4=
X-Google-Smtp-Source: APiQypJ0nkYxxhWVRxq+orxZMo+CR7hoQRHNw5YWBQCH5PciNRuV5+miKTm8Ay7UdXJWjR7Tpvw8eQ==
X-Received: by 2002:aa7:82d4:: with SMTP id f20mr16730031pfn.253.1588896854909;
        Thu, 07 May 2020 17:14:14 -0700 (PDT)
Received: from hilbert.taihen.jp (ae146065.dynamic.ppp.asahi-net.or.jp. [14.3.146.65])
        by smtp.gmail.com with ESMTPSA id 28sm857984pjh.43.2020.05.07.17.14.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2020 17:14:13 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 9965B243BF2; Fri,  8 May 2020 09:14:08 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>
Subject: [PATCH v4 0/2] Two fixes for one sony-laptop reported bug on 5.6
Date:   Fri,  8 May 2020 09:14:03 +0900
Message-Id: <20200508001405.71176-1-malattia@linux.it>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: platform-driver-x86-owner@vger.kernel.org
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

From: Mattia Dongili <malattia@linux.it>

They are both candidates for stable.

Mattia Dongili (2):
  platform/x86: sony-laptop: SNC calls should handle BUFFER types
  platform/x86: sony-laptop: Make resuming thermal profile safer

 drivers/platform/x86/sony-laptop.c | 60 +++++++++++++++---------------
 1 file changed, 29 insertions(+), 31 deletions(-)

-- 
2.26.2

