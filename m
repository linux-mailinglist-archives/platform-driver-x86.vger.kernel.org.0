Return-Path: <platform-driver-x86-owner@vger.kernel.org>
X-Original-To: lists+platform-driver-x86@lfdr.de
Delivered-To: lists+platform-driver-x86@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id A10135359FC
	for <lists+platform-driver-x86@lfdr.de>; Fri, 27 May 2022 09:13:33 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346993AbiE0HLL (ORCPT
        <rfc822;lists+platform-driver-x86@lfdr.de>);
        Fri, 27 May 2022 03:11:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345721AbiE0HKY (ORCPT
        <rfc822;platform-driver-x86@vger.kernel.org>);
        Fri, 27 May 2022 03:10:24 -0400
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com [IPv6:2a00:1450:4864:20::342])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D495F68BA
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 May 2022 00:10:22 -0700 (PDT)
Received: by mail-wm1-x342.google.com with SMTP id c5-20020a1c3505000000b0038e37907b5bso4068835wma.0
        for <platform-driver-x86@vger.kernel.org>; Fri, 27 May 2022 00:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:reply-to:from:date:message-id:subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=doGPKe+QVJzHQc6K0hNGhx1TBCnxbAgxgFQdztsdPanb27eTQi4gzlWlPiNl36+6pG
         /jznRUzKPjWZrlkYrtxLzaF6IKIeWebOM8a19+M59uSrZPWVLAnDFyCwrJ3mKvxqeHjP
         Vq8M4Lcau8k5HMSnS7PB0to2Wt2xiGh2wZZSsxdIycLqSta/Ooij7ZIVfR51t6F+AUZz
         dSN3k3fUz/shbsvldZoIbTvKpOogOAFCnQNLZKr2N9oC9bzc5DaD/GGPzwBAa0mgG03x
         zV7+hySwVQ/1kSVArWtOAvV73wh+4XdW2balkBASgMsudO4j0T/FZTopzyUFmQIP0rvN
         +5bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:reply-to:from:date:message-id
         :subject:to;
        bh=33H7bzlF73boyoKARvolMJlGymprQ+hHPrvlaQBxLsY=;
        b=76rWQZnj3deEw5E9t8mKPJ9oStVlwGQTQ7gqTP4hmOXs7riLnAMQeCCnou0lilHtgH
         4vYa1zRd4QzW/+KLqaWBU27snqKtFkTgUYod0rMrbk3jM6kDVWGeEbMSTKP4KtTmRwtN
         DoV6Z47eumc4BRwfWg5/m2EkRvfmlTOBM+7PDgn8BfxNWxTJwDnGVWUSfpAL6NYvw2WK
         inkEnLfg0kSWX0YZbasPV/xQ8f8oQm/tyGIBZWbnKP53uuaLC+xK38TLfcDuimMDVq+T
         iuIkt9NwTLhvF9mjvtpShEHlpGH2fgveypFGBb1RnMIsHlC1EX5JVroeG2MMKpvwHeGz
         mS3w==
X-Gm-Message-State: AOAM532U/NVU7XmfohtusaBQ3jzoXmE6UWIAqCiqEmtcRO9ln1JmmN//
        r1pg2Yh1d9VLKm4ZPQWBfUH86PJXxsW1yF36sns=
X-Google-Smtp-Source: ABdhPJyLOnmTQRM1UnS5EHcWLU0YJ79lhJa6cZroZwtaPlOX16fCBno5ERMPr8sc/TytEntZXlRHOleumPwFPdig2JI=
X-Received: by 2002:a1c:4c16:0:b0:397:56cd:c8d5 with SMTP id
 z22-20020a1c4c16000000b0039756cdc8d5mr5615209wmf.4.1653635420865; Fri, 27 May
 2022 00:10:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:adf:d221:0:0:0:0:0 with HTTP; Fri, 27 May 2022 00:10:20
 -0700 (PDT)
Reply-To: BAkermarrtin@gmail.com
From:   Martin Baker <alfaroukkhadija@gmail.com>
Date:   Fri, 27 May 2022 07:10:20 +0000
Message-ID: <CAF1Q0Jn0CDtLxG6FzKbdUc_DVXySYmqdbp9pZFmhMsg_Dru=PQ@mail.gmail.com>
Subject: Hello friend
To:     undisclosed-recipients:;
Content-Type: text/plain; charset="UTF-8"
X-Spam-Status: No, score=4.9 required=5.0 tests=BAYES_50,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,FREEMAIL_REPLYTO,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE,
        UNDISC_FREEM autolearn=no autolearn_force=no version=3.4.6
X-Spam-Level: ****
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <platform-driver-x86.vger.kernel.org>
X-Mailing-List: platform-driver-x86@vger.kernel.org

Hello,


I wrote to you this morning because I have something to tell you, please
let me know if you read my previous post today.
