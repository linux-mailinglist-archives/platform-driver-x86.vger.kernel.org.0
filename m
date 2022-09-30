Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id C7BA95F0A5E
	for <lists+platform-driver-x86@lfdr.de>; Fri, 30 Sep 2022 13:30:38 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbiI3L1a (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 30 Sep 2022 07:27:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231354AbiI3L0m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 30 Sep 2022 07:26:42 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0A8B11C31
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 04:19:16 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id lc7so8416431ejb.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 30 Sep 2022 04:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=Z3um4NIBUgvNk9q16+RNAVeLUjM3OngmKzllppIpwQ8unkQxw8qSoWfcmnhyFmLJsk
         OddpalPCuSdjWgkmSCdgYu04fFCtDNhDI7Q2tpwjTcbdC1AhzSn5EcfXsOPsLQQE/m+b
         wh//Rp514YGc7yZkAFZe2YHeGeuxU6y+UgdevW6ZEti3vhoBOBN82kXjghoBRttg/+BQ
         gi4dffDVIkFQSnGeQneD5/Y/kK3jm3L/HzDsbrcwzT9Nv/rM+BFA4UTaPqKlccqkB97/
         1PR/1rwNL6o3F2Ww9RRJ7oSQdRPiMwXaeZtIymuq56M59OF6zT3KgBEHQEuyXFBRkY0o
         etRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FcyQcUXi9xALQQ6Lm7VNXiWYStBjH/LCUTADg6v4m+k=;
        b=2RH0LEv9IOXzER3a+XRTLNFNWTqLnS04bOVR68lLfQmul+ZOfOLVn2qAyk5TNSciCy
         K0J9ElrSDQbC4c5jbmlYsjaRrNRnXvXEMU6EkSum+JjQAMWQEQnoK9hBw+PJB2ByRwfB
         vZ0IZNDwHNbmf0X1/ZL3sxOmMvWg2/+BXzqSMQYVhvHu/mL/aE0S9JGHvXh7tGkZsFfU
         dXHDo4GcM1FxPFAqPHyfRY2rV0kXHOPiRhjB2S/B9yl5836cPwjl/JysledZxTVb+ofh
         cXFL+m00aahfoyfBp5zCU+kGX5cfD1ae/CEKlCoAAYrlaqAP98KEuDNyIFJDCPfU5tUA
         +U5A==
X-Gm-Message-State: ACrzQf29FwKd18y2R38ycJIAFHFdojyneex5naJyJLj6Hi9Ux7OLi8M7
        /SF7AXoNqDV7q2wVqYayUhqWS3Yxhq0eCoSKaTZV6mtw
X-Google-Smtp-Source: AMsMyM7BkBu+RPvu9pBmT++QWDRtGs1dm/J2i/CqUT3OAYm5ut/EXt2ceHWepn9mHb2qcSQ/6yZaAKwE8WCSKiVq7bA=
X-Received: by 2002:a17:907:7fa1:b0:782:7c58:5341 with SMTP id
 qk33-20020a1709077fa100b007827c585341mr6112580ejc.368.1664536754332; Fri, 30
 Sep 2022 04:19:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:906:d203:b0:77f:b0a8:93c8 with HTTP; Fri, 30 Sep 2022
 04:19:13 -0700 (PDT)
Reply-To: linadavid0089@gmail.com
From:   Lina David <deladelagan@gmail.com>
Date:   Fri, 30 Sep 2022 12:19:13 +0100
Message-ID: <CAJCXKVqbCGptOQwgCDC-MUhCzAVn0HidaH6yQBcx1g8-o_9Rzg@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello,
how are you?
