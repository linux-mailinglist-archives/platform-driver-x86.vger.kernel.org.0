Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 650294D041F
	for <lists+platform-driver-x86@lfdr.de>; Mon,  7 Mar 2022 17:28:51 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232994AbiCGQ3n (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Mon, 7 Mar 2022 11:29:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233602AbiCGQ3m (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Mon, 7 Mar 2022 11:29:42 -0500
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEC3258E4B
        for <platform-driver-x86@vger.kernel.org>; Mon,  7 Mar 2022 08:28:47 -0800 (PST)
Received: by mail-qt1-x833.google.com with SMTP id v3so13652660qta.11
        for <platform-driver-x86@vger.kernel.org>; Mon, 07 Mar 2022 08:28:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=c3P4r2Qz0VdfRBuStsXVpcJEgpWE5t0Sgi1SeeHIl+U=;
        b=NRgDTYFbYC6D7WaH2d+VU+EeLiqCWkkA000uo4I0y2rtKK60A+4Pr5R9VKfH9qn0Wu
         H3vOqWlfw5nCRNudymrg913xBiS95a33dXE7LhCqxOGHCyhfr/64cAHJaA/qIawh6ucN
         Z/xSmUYZIS+kxm+3WR6BSUO+CFDvula4QuZneluR1/VquBG3ps6M4VMJQ5H1MQFB2PIz
         BGmM8BrY39aF/gYuZ9U/iiVUZxVrFPI3LquuOh6ezgb1WPBTBdzskv8y4xVTuqO1Ff+3
         LfcG4Q3di4hzHuN9jZfsuvbSCwxcweCiOLYVMEA2C87nAAbtdcwXpgy9XZnj2shBc4z/
         YDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=c3P4r2Qz0VdfRBuStsXVpcJEgpWE5t0Sgi1SeeHIl+U=;
        b=IUq8quUGgdqxOWyyyJNEg1+tNw061gaZIao7JrAM/BvnCveCe6qEt2GaWOsQ/uUbvm
         96M66zCramkN2TF8gw8uT0TsXKjHoQDZRMqhGMqgFfK/bPs0m+3G1O/T/fBTnJGo7ai/
         /OJ3hobI35oymP2PBvSka/s6dE3r7HQwRy80S98ag0U8nYIbDs2U8FHcDxPG1hVnuQZP
         gAHV+I7iXrjxNLyc7XY157PIXssZpxv5yDf4OyjELD/5msVnK5nZu8yixYbUv4AYMkzB
         MDWiqbb4oBWIJypwtnlV6Py0Tc3PoSpQ4XEz7Z2Ag9Rhe71TZPTJ7ACHyF3I+Wquco/j
         688Q==
X-Gm-Message-State: AOAM532vkoHtWonPWD3sr9ttKfvdE45F1uozy8ygZUhCdzgZtq0SA5Z5
        55FGbGS+Cj2IDvEXXMHJggdzdhr67A0xrd5cSCE=
X-Google-Smtp-Source: ABdhPJxwJnCYclhoFuQNI/faFsJTQiyxdzOOks/0H8YXQz2V4vt0OSPQmESK/y4jEowYLwoYYqftx0AZaCJTc976rl4=
X-Received: by 2002:a05:622a:58d:b0:2e0:6694:ab1 with SMTP id
 c13-20020a05622a058d00b002e066940ab1mr4770297qtb.593.1646670527107; Mon, 07
 Mar 2022 08:28:47 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a05:622a:1354:0:0:0:0 with HTTP; Mon, 7 Mar 2022 08:28:46
 -0800 (PST)
Reply-To: fionahill.usa@outlook.com
From:   Fiona Hill <fernadezl768@gmail.com>
Date:   Mon, 7 Mar 2022 08:28:46 -0800
Message-ID: <CA+J-fD7R3dczH4FLoatinWR0tE4gP5G6+dGW=VYzKXzYOsaQzA@mail.gmail.com>
Subject: 
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.1 required=5.0 tests=BAYES_05,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FROM,FREEMAIL_REPLYTO,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,
        SPF_PASS,T_SCC_BODY_TEXT_LINE,UNDISC_FREEM autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

-- 
Please with honesty did you receive our message we send to you?
