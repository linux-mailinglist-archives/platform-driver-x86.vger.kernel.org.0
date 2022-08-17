Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 17989597156
	for <lists+platform-driver-x86@lfdr.de>; Wed, 17 Aug 2022 16:37:11 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240181AbiHQOfw (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Wed, 17 Aug 2022 10:35:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240150AbiHQOfn (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Wed, 17 Aug 2022 10:35:43 -0400
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1333979ED
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Aug 2022 07:35:42 -0700 (PDT)
Received: by mail-lj1-x22f.google.com with SMTP id bx38so13727002ljb.10
        for <platform-driver-x86@vger.kernel.org>; Wed, 17 Aug 2022 07:35:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=v+IyIw0SEjjem1fIIJ6EUDDyVR+LZZXRHDi6QsTol9s=;
        b=D9J3tjSfaiyt6uNc4SFYacPdKCPE/jEPGC4zQZwBQqhwcf46usWi4L+HsgK0jYNNIk
         Tujd5X0OAWODATKEU8peJxFIyzbFrVW6yeHuFosbSrB6j4vh5ibqKwF9f3hQqiGZVyVs
         xfsNJbKAmjGR+KTzh+kWdVjM79K2LU4YB6sB8zkcxAL9QHO4Fh2PfekY7P4/Pbd2Uh34
         Xb6dLqCCr25GvJSfcYT/Qpm7Re6Cnzcs+hamDtol620wSLEhzlEG7RTCq/3Dn8S0tJzO
         2K3LRukgWZeNXLtg14Rjk5UcoGCrjcgJJ9Z6kWP3+7LM9kbj13HJ2ARKBzSpp58dA2cC
         DbYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=v+IyIw0SEjjem1fIIJ6EUDDyVR+LZZXRHDi6QsTol9s=;
        b=XBkUl7d/9NxB+hqaA8USyiVQxf24+aOzV8teavcM4kZ0Xd1BiAjRO1oilyYjJY3jf9
         uM6Fu5JifKAFafOw+b4K4p3htJY96dGAMYSlz7+ad1dNHPp+3AixuHG+CoJw9fFyhYpV
         FPLoxs07f6kQKJepVShT6YLCPTpdfL0cqhlRFWc7TNn+LbE2iPtsDgxC36uFzvP9y/ra
         lqQIA7O4EHF2ZfEIDvR/Iz2hnzj7pJRqYfkeRnPi7QcY8ZDQ6L8LJIMnZnwYf51MK/Xi
         pxu7GyUXAUDOKneOVNh/+rmmkZ/BPeNzDY59Ke6SlHQWbdmAv3rCEk5A/WjYwzNHN3Ve
         0/lg==
X-Gm-Message-State: ACgBeo1mKSsvTYZyuDH4KonDWFDaTYh5fL86Ff9Gqf6XELZIiVF3qMIa
        DWblmiNIr1kOyN2GcuKbomW8myRNypCJuNKQfg==
X-Google-Smtp-Source: AA6agR6RTH5XMOXYz/CASeJVr4+MPk42AM7Qaqe0bQz/woSMwjGxQysVrhauEuTHKNzyy+sSfN0TYH8uLAdyGrcynqo=
X-Received: by 2002:a05:651c:1988:b0:25e:c619:adb3 with SMTP id
 bx8-20020a05651c198800b0025ec619adb3mr8853637ljb.231.1660746940957; Wed, 17
 Aug 2022 07:35:40 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:aa6:da0f:0:b0:207:298d:a9bf with HTTP; Wed, 17 Aug 2022
 07:35:40 -0700 (PDT)
From:   DAVID BOHA <ddkosa02@gmail.com>
Date:   Wed, 17 Aug 2022 14:35:40 +0000
Message-ID: <CADemNDG3RrFJA3h8pTxLHWvy5GFQSmPEpB2XzXeExf3qWMKUtQ@mail.gmail.com>
Subject: Re:
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=0.8 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE autolearn=ham autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hi, I sent you a letter but got no reply from you,or didn't you
receive my previous message i sent to you? Kindly reply me.
Sgt David.
