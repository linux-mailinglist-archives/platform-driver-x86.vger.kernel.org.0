Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 380E91C701E
	for <lists+platform-driver-x86@lfdr.de>; Wed,  6 May 2020 14:16:39 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728081AbgEFMQi (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 6 May 2020 08:16:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727792AbgEFMQi (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 6 May 2020 08:16:38 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E5AA1C061A0F
        for <platform-driver-x86@vger.kernel.org>; Wed,  6 May 2020 05:16:37 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id x15so926962pfa.1
        for <platform-driver-x86@vger.kernel.org>; Wed, 06 May 2020 05:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=hElELxY/o3aQbGz493BmMhuxhQGL1SLfG9MWNE6r/1c=;
        b=VU86s6KQ+ctrJnW4evD9HlXtDCRKRxCiUJ9Kf7BFRv+TJCHyqklpi65Lccw/PqhSiY
         HUA+hOgQX4hM7tI1YHDrhvUDmxYGeySm5X0hQGkGe9Xc2gQms6woOWjDkzk4xNO+jEj4
         D20LAAHCmXVG8nsQQmwjwfmiXt7xix/jeHBj+OmGrGXxu7W+WzDlUtWeOTDYoHsBG3i1
         9fy6mzZ9IHwgulIMj39GxMjSlrfIKmZztlaertyKQtYTLaDzryR6RZjKMwi41N/WiAJc
         zGoLhspMRTKOIV8hJonCkWquThViPk3Slvbudp6M/tYYTYpuuytK8vk3PavL1nmwWLrs
         8yHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
         :mime-version:content-transfer-encoding;
        bh=hElELxY/o3aQbGz493BmMhuxhQGL1SLfG9MWNE6r/1c=;
        b=r/P1vFTrxKPxKBp4UeOdXUOhl5XaBdEBhfVjLEZTE1lBj3qHBfRdt0MtQznJaUghIz
         j/cae0v/P1QDat7JNKKc/r+PAsEQExbd4iMm6EBX2bQuvzHMIzfyqRBFY7Us8rgEdiyw
         i2JyB4mQs68X9seSzsXCr8c7HZpRS+7WrWDg32S/XVeFI2fhzvU0t7ng7RzOD+Mq3WVI
         y9dufATAsQgChzAkYTJo10KhV9sFNhnBahKuLlIPDLhk8LIk9SXdTguUgada/fXrwMXE
         JVhJvDR47iV389rvGru/dIS+JbQWmSIBhbMzzxFnrze6sUozxHHMXOuz5IqKOBRZmHpu
         ZZOA==
X-Gm-Message-State: AGi0PubiU7XtZK5gVOSbzg1qjtuU0YabSsDPlYxCM0Qg4TBg9NI0VNOx
        llTnWtg2QTRhKsjV3Gr16Mu6ZumsZ9A=
X-Google-Smtp-Source: APiQypKzrVKtAG4520mSAmBpkrYs56BVeTlSDJkY7sGQ9/0mD7Kvm3/aV4wiWTThgq2uGu/9XGNngw==
X-Received: by 2002:a63:1854:: with SMTP id 20mr7069083pgy.257.1588767397199;
        Wed, 06 May 2020 05:16:37 -0700 (PDT)
Received: from hilbert.taihen.jp ([2405:6580:2100:d00:e039:f876:9cfb:e6bd])
        by smtp.gmail.com with ESMTPSA id b67sm1728285pfg.60.2020.05.06.05.16.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2020 05:16:35 -0700 (PDT)
Received: by hilbert.taihen.jp (Postfix, from userid 1000)
        id 66303248D1E; Wed,  6 May 2020 21:16:33 +0900 (JST)
From:   malattia@linux.it
To:     Darren Hart <dvhart@infradead.org>,
        Andy Shevchenko <andy@infradead.org>
Cc:     platform-driver-x86@vger.kernel.org,
        Mattia Dongili <malattia@linux.it>
Subject: [PATCH v3 0/2] Two fixes for one sony-laptop reported bug on 5.6
Date:   Wed,  6 May 2020 21:16:28 +0900
Message-Id: <20200506121630.72382-1-malattia@linux.it>
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
v3: add Fixes: tag, remove Reported-by William on patch 2/2.

Mattia Dongili (2):
  [sony-laptop] SNC calls should handle BUFFER types
  [sony-laptop] Make resuming thermal profile safer

 drivers/platform/x86/sony-laptop.c | 50 ++++++++++++------------------
 1 file changed, 19 insertions(+), 31 deletions(-)

-- 
2.25.1

