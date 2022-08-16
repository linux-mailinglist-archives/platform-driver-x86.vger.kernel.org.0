Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 941AB5963F5
	for <lists+platform-driver-x86@lfdr.de>; Tue, 16 Aug 2022 22:49:30 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236326AbiHPUtI (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Tue, 16 Aug 2022 16:49:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35648 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231594AbiHPUtH (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Tue, 16 Aug 2022 16:49:07 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 46D9654666
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Aug 2022 13:49:06 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id d16so10253237pll.11
        for <platform-driver-x86@vger.kernel.org>; Tue, 16 Aug 2022 13:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=lzSGTQH6tRZT/JkRCJUYviDZe2D3DO+xxCpvvkGEhpOJxTBHVphd1lS0tz6+mv0GtK
         nPQyDJ9yB+3FZCGJz/yxJUpajeqK7aa8OlSfnFrJ5GFsRXZt5KQ14/qyy2m2WrQh7uYJ
         X4I93gujZcjuqYJ9Oaq2TIar+GsGn2ebvN2D5f3ZgBzSbIUvO1vP/KX/o7nAuMmbMKwS
         SdtQJ5fv5t5ZFScSxBMgHUkjT0F0l0qlaWD/kAUrCoX/4iaHRQHAv0YTsPP6rrFRRJ/q
         /qfq9AEY0o9fgBvUrY+/o+TBRGWSuJ7DEPkTb2xIU6BsJQgfhD00BySsjhDenGNupmNQ
         XgqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc;
        bh=ej3T27wdcOl5hgxFKEEvscpLUDARFbq7IX1O4+1Fbq8=;
        b=IM1cXn812N+TpDgSz1ycUpXNIdTmdMVzQ4PC6aryUVL+h9lPYc93SPUL3oJFUDMCYO
         yyFQ7J8p77Uo4a3wZoZoX102/TJdUIG6VYlq98vLMkJtJjdHgLylKX70MKYvFIQpbzsm
         YlokQftS/+aozxBu0qNjNXxud4yBP+SRWT2fuDqVDCqnZ3BGyUohBnoj1nhlwxFtAnkY
         bu+A+cPm9yVoXgmmUzuECJmKyy9gXGpHmDSky8bhIBMMMdqZJE/SWSWs+IjRpt6HOZ67
         Yrm4dDX2nFS4BfioiuBdRbm2e7gryscH+P2MsgLcOuZdrS0gRo9G8eoWowCsjLKmqs7U
         I70Q==
X-Gm-Message-State: ACgBeo02oO6T0A0wyDcp0q6GQKcc/NvmXWaNqioEq8Nw4xDwiT0styGg
        d4rmShooZPqK991M2i/7cWOk/aV92TmlPv9CJnk=
X-Google-Smtp-Source: AA6agR6CD0I6FJoVDc6N0z5Hw2e3OejshDWcT49Q+5NjeLaJDMZt+OW70C/SJbx/em4aAlWj15Ya9/3BaHqe5mXSdUY=
X-Received: by 2002:a17:903:24e:b0:172:6c9d:14e0 with SMTP id
 j14-20020a170903024e00b001726c9d14e0mr12403075plh.84.1660682945526; Tue, 16
 Aug 2022 13:49:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a17:522:cb83:b0:462:814f:9818 with HTTP; Tue, 16 Aug 2022
 13:49:04 -0700 (PDT)
Reply-To: te463602@gmail.com
From:   "Prof. Chin Guang" <poolcatfish@gmail.com>
Date:   Tue, 16 Aug 2022 13:49:04 -0700
Message-ID: <CADP_ptd17CymjT_ZkjB2Di1S0PVSs7iqjMXUkGAG++85EK3aGQ@mail.gmail.com>
Subject: Good Day,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no autolearn_force=no
        version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Hello,
We the Board Directors believe you are in good health, doing great and
with the hope that this mail will meet you in good condition, We are
privileged and delighted to reach you via email" And we are urgently
waiting to hear from you. and again your number is not connecting.

Sincerely,
Prof. Chin Guang
