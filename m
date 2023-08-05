Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E2B48770DC0
	for <lists+platform-driver-x86@lfdr.de>; Sat,  5 Aug 2023 06:41:47 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229460AbjHEElp (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Sat, 5 Aug 2023 00:41:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49372 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjHEElo (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Sat, 5 Aug 2023 00:41:44 -0400
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DFEA34ED6
        for <platform-driver-x86@vger.kernel.org>; Fri,  4 Aug 2023 21:41:42 -0700 (PDT)
Received: by mail-ot1-x32c.google.com with SMTP id 46e09a7af769-6bcade59b24so2361160a34.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 04 Aug 2023 21:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691210502; x=1691815302;
        h=to:subject:message-id:date:from:reply-to:mime-version:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=NYqWGaDKM/NBvVCsWk7Q+FK60T+8JllhM75SJp6E4NNkSwqmOpfIXI0d2x93e4wtTz
         k+r4DiZm7QGyeyEA+HGwiyWmaj22vYGdFdvwy9u22/3CqXDfKj1JBV1ipGXODcBm6ED7
         qIspFN0Sq89Z0sXq1NACIgpUficfQBucX2HjfOamdJ94nbRNyT8edlEp71tKQgN53rLb
         lK5DMh8rEW+7XPx+sVBS/8ojlrmGnre1l4BKFoCBkVgzcFKLchLYEbYuKH83tPWgb3dE
         ubqWtYuEy2CDyCJT/NWf+UBWmzr/UJgupZxBuCZMpmkVlwN90GTKgAT46zebLrYaRRNG
         Dudw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691210502; x=1691815302;
        h=to:subject:message-id:date:from:reply-to:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Fyaf0OHfvWgaqfRiwRufcy49gz6rXRNyNLf1qH0Ffk0=;
        b=DufyQ1y8VWstYH1TGONWAmZqYYJpon5nWaSRWD+DyoqWp1DFnlozkIfsFfmCmSy0GU
         WEMQtijYOKJvITP8FrcuscvLkE7dwWokJXuKbtpgyy7NL8xD2+ZT2vJJ8VpEk2zJtogl
         xTV65Te+uOe/dyGhbLr38a07iJM2ucDIPSOVoa1nz2hnbIGoDvjssmOUw49g6/S6PKKo
         xyVNlmy6FpAqd1VSYP36cimvCpfbKAvR+EwGviQ/31YZTDefa66kzsPKmiNRtM69PqWN
         5yrLHO73rpDd54XBZGQ+weA1aE0QdBmuCIDSqND6lXZyIQL7IQ4OSQKT8DpXVEx2Vp9Q
         5EEQ==
X-Gm-Message-State: AOJu0YyyKpVGyYjr1nqYToRwikJA3UMPILXW22Y6Sq5itig0052qsdoV
        Gp7cMgg9gY7tl8mon7crmVYT6hgzOppVVyOokrE=
X-Google-Smtp-Source: AGHT+IGM9Fr9Ueq6unEi8QY90LLElxL46k0fnFjEqkh/F8S64Gq5U8iGE2t4+ak7DRe9wJZ07fQzImijvj/vfEgzi+M=
X-Received: by 2002:a05:6870:5627:b0:1be:dab4:308b with SMTP id
 m39-20020a056870562700b001bedab4308bmr4697158oao.55.1691210502137; Fri, 04
 Aug 2023 21:41:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a8a:1054:0:b0:4ea:3880:2f10 with HTTP; Fri, 4 Aug 2023
 21:41:41 -0700 (PDT)
Reply-To: bintu37999@gmail.com
From:   BINTU FELICIA <gsselinawilliams@gmail.com>
Date:   Sat, 5 Aug 2023 05:41:41 +0100
Message-ID: <CAE4dffBw6_6QxsJduV13HEFHMc+1sh7FePxNg-6Go_5Ff6wR+Q@mail.gmail.com>
Subject: HELLO...,
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.5 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        FREEMAIL_REPLYTO_END_DIGIT,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

How are you today? I hope you are fine. My name is Miss
Bintu Felicia . l am single looking for honest and nice
person whom i can partner with . I don't care about
your color, ethnicity, Status or Sex. Upon your reply to
this mail I will tell you more about myself and send you
more of my picture .I am sending you this beautiful mail
with a wish for much happiness
